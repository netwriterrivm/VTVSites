
$(document).ready(function () {
    var PagerButtons = $(".nw_pager_button");

    for (var ij = 0; ij < PagerButtons.length; ij++) {
        LinkText = $(PagerButtons[ij]).attr("Value");
        LinkId = $(PagerButtons[ij]).attr("id");
        LinkCssClass = "nw_pager_link";
        if (ij == 0) {
            LinkCssClass += " nw_pager_link_first";
        }
        if (ij == PagerButtons.length - 1) {
            LinkCssClass += " nw_pager_link_last";
        }
        LinkHTML = "<a class=\"" + LinkCssClass + "\" alt=\"Ga naar " + LinkText + "\" href=\"javascript:_PagerPostBack('" + LinkId + "');\">" + LinkText + "</a>";

        if ($(PagerButtons[ij]).attr("disabled") == true) {
            LinkHTML = "<span class=\"" + LinkCssClass + " nw_pager_link_disabled\">" + LinkText + "</span>";
        }


        $(LinkHTML).insertAfter($(PagerButtons[ij]));
        $("#" + LinkId).hide();
    }
    sRelPath = "/VTVSites";
    if (location.href.toLowerCase().indexOf("localhost") == -1) {
        sRelPath=sSiteRelativePath;
    }

    $('.text').autocomplete(sRelPath + "/Controls/SearchAutocomplete.aspx", { matchSubset: false });
});

function _PagerPostBack(PagerId) {

    
    $("#" + PagerId).trigger('click');
}