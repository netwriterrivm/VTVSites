rememberHeight=0;
$(document).ready(function () {


    var carrousellist = $(".nw_carrousel .textDocumentBody");

    for (var ic = 0; ic < carrousellist.length; ic++) {
        carrousel_id = '#nw_carrousel_pager_' + ic;
        $(carrousellist[ic]).after("<div class=\"nw_carrousel_pager_container\"  id=\"nw_carrousel_pager_" + ic + "\"></div>");
        $(carrousellist[ic]).cycle({
            fx: 'fade',
            speed: '1000',
            fit: true,
            timeout: 7000,
            pager: carrousel_id,
            slideExpr: '.nw_information_tekst_container'
        });
    }
    if (location.href.toLowerCase().indexOf("printversion=true") == -1) {
        $(".nw_foldable .nw_foldable_header").siblings().hide();
        $(".nw_foldable_header").click(function () {
            if ($(this).attr("class").indexOf("nw_foldable_header_on") == -1) {
                rememberHeight = $("#hoofd_content").height();
            }
            $(this).siblings().toggle("slow");
            $(this).toggleClass("nw_foldable_header_on");

            //gewijzigd door Mathijs en mehdi

//            if ($(this).attr("class").indexOf("nw_foldable_header_on") == -1) {
//                $("#hoofd_content").height(rememberHeight);
//            }
//            else {
//                $("#hoofd_content").height("auto");
//            }
        });
    }


    $("#nw_tabs").tabs();
    //Smerige hack om de content hoogte aan te passen aan de linkerberm
    if ($("#subnavigatie").height() > $("#hoofd_content").height()) {
        $("#hoofd_content").css("min-height", $("#subnavigatie").height());
    }
    var percentagelist = $(".nw_survey_bar_percentage");
    for (var ip = 0; ip < percentagelist.length; ip++) {
        sWidth = $(percentagelist[ip]).text();
        $(percentagelist[ip]).prepend("<div class=\"nw_survey_bar_percentage_spacer\"><div class=\"nw_survey_bar_percentage_bar_div\" style=\"width:" + sWidth + "\"></div></div>");
    }
});
