import re
import os
import sys
import tty
import random
import termios
import selectors
from time import sleep
from dataclasses import dataclass
from threading import Thread, Event

class FrameLine:
    """
    Class representing a line of a frame for an ascii art

    The repl value must not contain ansi char
    """
    _re_ansi_char = re.compile(r"(\x1b|\\e|\\033)\[([\d;]+)m")

    def __init__(self, line, repl=None, values=None, random=True, padding_chars=" ", fixed=False):
        self.line = line
        self.repl = repl
        self.values = values
        self._random = random
        self._prev = None
        self.padding_chars = padding_chars
        self.fixed = fixed

    def no_ansi(self, val):
        """
        Remove ANSI seq from a string (works only with \x1b)
        """
        return re.sub(self.__class__._re_ansi_char, "", val)

    def padding(self, size):
        """
        Return the padding to use
        """
        if self.fixed:
            size = 0

        if isinstance(self.padding_chars, list):
            return "".join([random.choice(self.padding_chars) for _ in range(size)])
        return self.padding_chars * size

    def get(self, pos=0):
        """
        Get the string of the line
        """
        if self.repl:
            if self._random:
                replacement = random.choice(self.values)
            else:
                if self._prev:
                    replacement_pos = self.values.index(self._prev) + 1
                    if replacement_pos == len(self.values):
                        replacement = self.values[0]
                    else:
                        replacement = self.values[replacement_pos]
                else:
                    replacement = self.values[0]
                self._prev = replacement

            diff = len(self.repl) - len(self.no_ansi(replacement))
            line = self.line.replace(self.repl, replacement)
            if diff > 0:
                return self.padding(diff + pos) + line
            if diff == 0:
                return self.padding(pos) + line

            diff = abs(diff)
            if diff >= pos:
                # Trop de char ajoute par rapport à la taille présente
                # Il faut supprimer un bout de ligne pour
                return line[diff - pos:]
            return self.padding(pos-diff) + line
        return self.padding(pos) + self.line

class Frame:
    """
    Class representing an ascii art frame
    """
    def __init__(self, frames_lines_list):
        self.frame_lines = []
        for frame_line in frames_lines_list:
            if isinstance(frame_line, str):
                self.frame_lines.append(FrameLine(frame_line))
            else:
                self.frame_lines.append(frame_line)
        self.height = len(self.frame_lines) - 1

    def get(self, pos):
        """
        Show the representation of the frame at the given pos
        """
        return "\n".join([frame_line.get(pos) for frame_line in self.frame_lines])

class InputReader(Thread):
    """
    Class that read inputs from the terminal answers

    Code largely inspired by:
    https://github.com/Textualize/textual/blob/main/src/textual/drivers/_input_reader_linux.py
        'Thanks for the project by the way :D'
    """
    def __init__(self, timeout=0.2):
        super().__init__()
        self.buffer = b""
        self.timeout = timeout
        self._fileno = sys.__stdin__.fileno()
        self._selector = selectors.DefaultSelector()
        self._selector.register(self._fileno, selectors.EVENT_READ)
        self._exit_event = Event()
        self._started_event = Event()
        self.__old_attrs = termios.tcgetattr(self._fileno)

    @property
    def is_started(self):
        return self._started_event.is_set()

    def close(self):
        """
        Close the thread
        """
        self._exit_event.set()

    def read(self):
        """
        Read input and return the generator
        """
        while not self._exit_event.is_set():
            for key, events in self._selector.select(self.timeout):
                if events & selectors.EVENT_READ:
                    data = os.read(self._fileno, 1024)
                    if not data:
                        return
                    yield data
            yield b""

    def run(self):
        """
        Start listening for stdin answer
        """
        tty.setraw(self._fileno)

        try:
            self._started_event.set()
            for data in self.read():
                self.buffer += data

        except Exception:
            pass

        finally:
            termios.tcsetattr(self._fileno, termios.TCSANOW, self.__old_attrs)

@dataclass
class RGB:
    """Class holding color value"""
    red: str = "00"
    green: str = "00"
    blue: str = "00"

class TermAsk:
    """
    This class is able to get the answer of a terminal
    """
    FOREGROUND_TERM_COLOR = "\x1b]10;?\a"
    BACKGROUND_TERM_COLOR = "\x1b]11;?\a"
    _re_rgb_term = rb";rgb:(?P<red>[a-f0-9]+)/(?P<green>[a-f0-9]+)/(?P<blue>[a-f0-9]+)"

    @classmethod
    def get(cls, question):
        """
        Return the patterns to use for the current question
        """
        question = question.lower()
        if question in ("bg", "background"):
            return (cls.BACKGROUND_TERM_COLOR, cls._re_rgb_term)
        if question in ("fg", "foreground"):
            return (cls.FOREGROUND_TERM_COLOR, cls._re_rgb_term)
        raise ValueError(f"Unknown terminal question: {question!r}")

    @staticmethod
    def extract(value, re_question):
        """
        Extract the different values
        """
        result = re.search(re_question, value)
        if result:
            red = result.group("red")[:2].decode('utf-8', 'ignore')
            green = result.group("green")[:2].decode('utf-8', 'ignore')
            blue = result.group("blue")[:2].decode('utf-8', 'ignore')
            return RGB(red, green, blue)
        return RGB()

    @classmethod
    def ask_rgb(cls, question="bg"):
        """
        Ask the terminal and get the answer
        """
        question, re_question = cls.get(question)
        reader = InputReader()
        reader.start()
        while not reader.is_started:
            pass
        print(question, end="\n\x1b[A")
        reader.close()
        reader.join()
        return cls.extract(reader.buffer, re_question)

class AnimatedObject(Thread):
    """
    Animated object class
    """
    def __init__(self, steps, default_duration="0.5", listeners=None):
        super().__init__()
        self.steps = steps
        self.default_duration = default_duration
        self._exit_event = Event()
        self._listeners = listeners

    def add_listener(self, listener):
        """
        Add a listener to the animated background
        """
        if not callable(getattr(listener, "notify")):
            raise ValueError(f"Listener {listener!r} must have a notify method")
        self._listeners.append(listener)

    def notify(self, bg):
        """
        Notify any listener
        """
        if self._listeners:
            for listener in self._listeners:
                listener.notify(bg)

    def stop(self):
        self._exit_event.set()

class AnimatedBackground(AnimatedObject):
    """
    Class that allows background animation
    """
    def __init__(self, steps, default_duration="0.5", listeners=None):
        super().__init__(steps, default_duration, listeners)
        self._init_state = TermAsk.ask_rgb("background")
        self.__background_payload = "\x1b]11;#{red}{green}{blue}\a"

    def set_background(self, rgb):
        """
        Set the background to the given rgb values
        """
        if isinstance(rgb, str):
            if rgb.startswith("#"):
                rgb = rgb[1:]
            rgb = RGB(rgb[:2], rgb[2:4], rgb[4:])

        sys.stdout.write(self.__background_payload.format(red=rgb.red,
                                                          green=rgb.green,
                                                          blue=rgb.blue))
        sys.stdout.flush()

    def run(self):
        """
        Animate the backround
        """
        Continue = True
        while Continue:
            for step in self.steps:
                if self._exit_event.is_set():
                    Continue = False
                    break
                self.set_background(step["rgb"])
                self.notify(step["rgb"])
                sleep_time = step.get("duration", self.default_duration)
                if isinstance(sleep_time, str):
                    sleep_time = float(sleep_time)
                sleep(sleep_time)

    def _reset(self):
        """
        Reset term to initial background
        """
        self.set_background(self._init_state)

    def stop(self):
        self._exit_event.set()
        self._reset()

class AnimatedAscii(AnimatedObject):
    """
    Ascii art animated
    """
    def __init__(self, steps, default_duration="0.3", listeners=None,
                 move=True, init_pos=0, autoclear=False):
        super().__init__(steps, default_duration, listeners)
        self._move = move
        self.init_pos = init_pos
        self.autoclear = autoclear

    def set_frame(self, pos):
        """
        Set the frame at the pos to use
        """
        sys.stdout.write(self.steps.get(pos))
        sys.stdout.write(f"\x1b[{self.steps.height}A\r")
        sys.stdout.flush()

    def run(self):
        """
        Animate the backround
        """
        Continue = True
        position = self.init_pos
        while Continue:
            if self._exit_event.is_set():
                break
            self.set_frame(position)
            self.notify(self.steps)
            if isinstance(self.default_duration, str):
                self.default_duration = float(self.default_duration)
            sleep(self.default_duration)
            if self._move:
                position += 1
        if self.autoclear:
            for i in range(self.steps.height+1):
                sys.stdout.write("\x1b[2K\n")
            sys.stdout.write(f"\x1b[{self.steps.height}A\r")
        else:
            sys.stdout.write(f"\x1b[{self.steps.height}B\n")

class GlpwnmeAnime:
    """
    Glpwnme animation
    """
    duration = 5

    @classmethod
    def start(cls):
        """
        Start the animation
        """
        etincelles = ["`",
                      "\x1b[38;5;214m°\x1b[0m",
                      " ",
                      "\x1b[38;5;214m` °\x1b[0m",
                      "\x1b[38;5;214m ° \x1b[0m",
                      "\x1b[38;5;214m*\x1b[0m",
                      "`\x1b[31m*\x1b[0m"]

        title = FrameLine("\x1b[31m[+] Sending webshell into orbit...\x1b[0m", "...", [".\x1b[K", "..\x1b[K", "..."], fixed=True)
        rocket_1 = "     __"
        rocket_2 = FrameLine("  °  \\ \\_____",
                             "°",
                             values=etincelles)
        rocket_3 = FrameLine("  ###[\x1b[31m=\x1b[0m=__\\O/_>",
                             "###",
                             values=["\x1b[38;5;226m###\x1b[0m",
                                     "\x1b[38;5;226m###\x1b[38;5;214m##\x1b[0m",
                                     "\x1b[38;5;226m#\x1b[38;5;214m###\x1b[31m#\x1b[0m",
                                     "\x1b[38;5;226m##\x1b[38;5;214m##\x1b[0m",
                                     "\x1b[38;5;226m####\x1b[0m"]
                            )
        rocket_4 = FrameLine(" °   /_/\x1b[K", "°", values=etincelles)
        frame = Frame([title, rocket_1, rocket_2, rocket_3, rocket_4])
        animate_ascii = AnimatedAscii(frame, default_duration="0.1", autoclear=True)
        animate = AnimatedBackground([{"rgb": "#FF4500", "duration": "0.5"},
                                      {"rgb": "#000000", "duration": "0.5"},
                                      {"rgb": "#003B00", "duration": "0.5"}])

        animate.start()
        animate_ascii.start()

        sleep(cls.duration)

        animate.stop()
        animate.join()
        animate_ascii.stop()
        animate_ascii.join()
