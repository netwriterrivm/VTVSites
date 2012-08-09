// Variables

nameCookie = "kompasenquete5";
contentCookie = "kompasenquete_popup_getoond5";
contentLaterCookie = "kompasenquete_popup_later_tonen5";
contentNoSurveyCookie = "kompasenquete_popup_niet_tonen5";
expireDatum = "365";
expireLater = "1";
namePopup = "/VtvSites/javascript/kompas/kompas-enquete-popup.htm";
forwardURL = "https://response.questback.com/rivmemi/kompas/";
//forwardURL="https://web.questback.com/rivmemi/zorgatlastestquest/";

/*
   name - name of the cookie
   value - value of the cookie
   [expires] - expiration date of the cookie (defaults to end of current session)
   [path] - path for which the cookie is valid (defaults to path of calling document)
   [domain] - domain for which the cookie is valid (defaults to domain of calling document)
   [secure] - Boolean value indicating if the cookie transmission requires a secure transmission
   * an argument defaults when it is assigned null as a placeholder
   * a null placeholder is not required for trailing omitted arguments
*/
function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}

/*
Checken of de bezoeker al de enquete
heeft weggeklikt, als dat niet het geval is dan controleren of de bezoeker al in het verleden
de enquete heeft ingevuld (er is in dat geval dus een cookie aanwezig).
*/
function controleerEnquete() {
    if (readCookie(nameCookie) == null) {
        //Openen popup
        //newWindow = window.open(namePopup, "enquete", "height=345,width=511,left=100,top=150,location=no,toolbaar=no,directories=no,status=no");
        //newWindow.focus();
        $("body").append("<div id=\"kompas_enquete_popup\" style=\"display:none; border:1px solid gray;backround-color:white;\"><iframe frameborder=\"0\" scrolling=\"no\" src=\"" + namePopup + "\"  width=\"511\" height=\"300\" /></div>");
        $('#kompas_enquete_popup').dialog({
            autoOpen: true,
            show: 'blind',
            hide: 'explode',
            width:514,
            height:318

        });
    }
}

/* Forward naar de enquete URL */
function forward() {
    //Cookie zetten zodat de enquete niet meer getoond wordt).
    createCookie(nameCookie, contentCookie, expireDatum);
    newWindow = top.window.open(forwardURL);
    top.window.$('#kompas_enquete_popup').dialog("close");
    newWindow.focus();
}

/* Enquete wordt later ingevuld, cookie verloopt na expireLater  */
function tryLater() {
    createCookie(nameCookie, contentLaterCookie, expireLater);
    top.window.$('#kompas_enquete_popup').dialog("close");
}

/* Forward naar de enquete URL */
function noSurvey() {
    //Cookie zetten zodat de enquete niet meer getoond wordt).
    createCookie(nameCookie, contentNoSurveyCookie, expireDatum);
    top.window.$('#kompas_enquete_popup').dialog("close");
}

try {
   
        $(document).ready(function () {
            controleerEnquete();
        });
   
}
catch (e) { }