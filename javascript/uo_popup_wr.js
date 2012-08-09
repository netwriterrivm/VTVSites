 //15-7-2008 Wilbert Corts
 //Zorgt voor de popup.
 //De code wordt dynamisch toegevoegd aan de pagina, zonder js staat er een anchor naar de popuptekst.
 popupcountnr=0;
 // Wait until the Dom is fully loaded.
 $(document).ready(function () {

     $(".ref_lit_container").hide();
     $("#aspnetForm").append("<div id=\"netwriter_popups\">Leeg</div>");
     $("#netwriter_popups").hide();
     //Smerige hack om de content hoogte aan te passen aan de linkerberm
     if ($("#subnavigatie").height() > $("#hoofd_content").height()) {
         $("#hoofd_content").css("min-height", $("#subnavigatie").height());
     }

    /* Under construction.
     var zoekresultaatlijst = $(".nw_maxtextlen");
     for (var ij = 0; ij < zoekresultaatlijst.length - 1; ij++) {
         var thetext = $(zoekresultaatlijst[ij]).text();
         var thehtml = $(zoekresultaatlijst[ij]).html();
         var resulthtml = thehtml;
         var orgtextlength = thetext.length;
         var maxlength = 250;
         if (orgtextlength > maxlength) {
             var hidelength = orgtextlength - maxlength;
             var shorthtml = thehtml.substring(0, maxlength);
             var lastspace = shorthtml.lastIndexOf(' ');
             var shorterhtml = shorthtml.substring(0, lastspace);
             var lastboldstart = shorterhtml.lastIndexOf("<b>");
             var lastboldend = shorterhtml.lastIndexOf("</b>");
             if (lastboldstart > lastboldend) {
                 var resulthtml = thehtml.substring(0, lastboldend + 4);

             }

         }
     }
     */

     var ankerlijst = $(".textMenuLabel");
     for (var ij = 0; ij < ankerlijst.length - 1; ij++) {

         sElementName = $(ankerlijst[ij]).parent()[0].nodeName;
         sElementName = sElementName.toLowerCase();
         if (sElementName != "li") {
             $(ankerlijst[ij]).after("<span class=\"textMenuLabelSeperator\">|</span>");
         }
     }
     //The popup in the left botttom corner.
     //Get all the links that should have popup behaviour. These have a class 'popup'.
     var popups = $(".nw_uo_popup");
     //Prevent the default action, which would direct the page to the anchor.
     popups.click(function (event) {
         event.preventDefault();
     });
     // smerige code om het pad naar de pictures map te bepalen, kan nl. door nieuwe urls best diep zijn.
     var csslinks = $("link");
     sRelativePath = "/vtvredactieguipublic";
     boolfound = false;
     for (var ij = 0; ij < csslinks.length; ij++) {
         if (boolfound == false) {

             try {
                 if ($(csslinks[ij]).attr("type") == "text/css") {
                     if ($(csslinks[ij]).attr("href").toLowerCase().indexOf("addthis") == -1) {
                         sRelativePath = $(csslinks[ij]).attr("href").substring(0, $(csslinks[ij]).attr("href").indexOf("css"));
                         boolfound = true;
                     }
                 }
             }
             catch (e) {
             }
         }
     }
     for (var i = 0; i < popups.length; i++) {
         //Add an eventlistener to all those links with the class popup.

         try {
             sHrefattr = popups[i].href;
             sMessageLocal = "";
             if ($(getIdFromHref(sHrefattr)).get(0).nodeName.toLowerCase() == 'dt') // afkortingen, defities
             {
                 sMessageLocal = "<dl class='textDefinitionlist'>";
                 sMessageLocal += "<dt>" + $(getIdFromHref(sHrefattr)).html() + "</dt>";
                 sMessageLocal += "<dd class='DefinitionData'>" + $(getIdFromHref(sHrefattr)).next().html() + "</dd>";
                 try {
                     if ($(getIdFromHref(sHrefattr)).next().next().get(0).nodeName.toLowerCase() == 'dd') {
                         sMessageLocal = sMessageLocal + "<dd class='DefinitionDataDescription'>" + $(getIdFromHref(sHrefattr)).next().next().html() + "</dd>";
                     }
                 }
                 catch (ElementNotFound) {
                 }
                 sMessageLocal += "</dt>";



                 // sMessageLocal="<strong class='textDefinitionName'>" + $(getIdFromHref(sHrefattr)).html()+ "</strong>" + "<span class='textDefinitionDesc'>" + $(getIdFromHref(sHrefattr)).next().html() + "</span>";
                 //if($(getIdFromHref(sHrefattr)).next().next().get(0).nodeName.toLowerCase()=='dd')
                 // {
                 //     sMessageLocal=sMessageLocal + "<span class='textDefinitionMemo'>" + $(getIdFromHref(sHrefattr)).next().next().html() + "</span>";
                 // }

                 //showHelp(sMessageLocal ,sRelativePath + '/pictures/allsites/definition_1.gif',200,200,10);
             }
             else  // literatuur
             {
                 sMessageLocal = $(getIdFromHref(sHrefattr)).html();

                 ///    showHelp($(getIdFromHref(sHrefattr)).html(), sRelativePath + '/pictures/allsites/definition_1.gif',200,200,10);
             }
             popupcountnr++;
             //try
             //{
             $("#aspnetForm").after("<div class=\"nw_uo_popup_container\" style=\"display:none\" id=\"nw_popup_message_" + popupcountnr + "\"><div  class=\"nw_text_popup_container\">" + sMessageLocal + "</div></div>");
             $(popups[i]).nw_easytooltip("nw_popup_message_" + popupcountnr, { backgroundcolor: "#f5f5f5", border: "1px solid #e1e1e1", event: "click", closeevent: "delay" });
             $(popups[i]).attr("title", "");
             //}
             //catch (ElementNotFound)
             //{
             //    if(location.href.toLowerCase().indexOf("netwritergui")!=-1){
             //        alert("Error creating popup, please check the following database record:" + sMessageLocal);
             //    }
             // }
             //Shows a popup 


             //alert(getTextFromElement(getIdFromHref(sHrefattr)));
         }
         catch (ErrorTje) {
         }
     }



     //The reference and literature and bronnen popup:
     //Get all the links that open a reference or definition popup. These have a class '.indexLiterature'.

     var openRefLitLink = $(".indexLiterature");
     $(".indexLiterature").click(function (event) {
         event.preventDefault();
         $("#bronnenliteratuur").toggle();
     });
     var openDefLitLink = $(".indexDefinition");
     $(".indexDefinition").click(function (event) {
         event.preventDefault();
         $("#afkortingendefinities").toggle();
     });


     //Get all the buttons that close a reference or definition popup. These have a class '.close_ref_lit'.
     var closebutton = $(".close_ref_lit");
     for (var i = 0; i < closebutton.length; i++) {
         $(closebutton[i]).click(function (event) {

             //Close the popup.
             this.parentNode.parentNode.style.display = 'none';
         });
     }
     var popupred = $(".nw_target_popup")
     popupred.click(function (event) {
         event.preventDefault();
         sHrefattr = $(this).attr("href");
         if (sHrefattr.indexOf("#") == -1 & sHrefattr.indexOf("?") == -1) {
             sHrefattr += "#hoofd_content";
         }

         NetWriterPopup(sHrefattr);
     });
     var popupblank = $(".nw_target_blank")
     popupblank.click(function (event) {
         event.preventDefault();
         window.open(this.href);
     });

 });
//                function getTextFromElement(sId)
//                {
//                    //Returns the text of an element with the given id.
//                    var elm = $(elm);
//                    var text= elm.text();
//                    return text;
//                    
//                }
                function getIdFromHref(sHref)
                {
                    //Returns the Id of the given anchors href attribute.
                    return sHref.substring(sHref.indexOf("#"),sHref.length)
                }


function NetWriterPopup(sUrl) 
{

    sDialogContent="<div class=\"mod box closed lighter netwriter_popup\"><h3>Informatie venster <img onclick=\"javascript:NetWriterPopupHide();\" class=\"netwriter_popup_close\" src=\"" + getSiteRelativePath() + "/images/close.png\" /></h3><iframe  FRAMEBORDER=\"no\"  src=\"" + sUrl + "\"  width=\"920px\" height=\"530px\"/></div>";
       $("#netwriter_popups").html(sDialogContent);
      $("#netwriter_popups").show();
}

function NetWriterPopupHide()
{
   $("#netwriter_popups").hide();
}
