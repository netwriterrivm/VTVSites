// JScript File

$(document).ready( function() {
// create xhtml strict friendly iframe
var aLinks=$('a.iframeloader');

aLinks.each(
function (i) { 

$(this).replaceWith("<iframe scrolling='auto' frameborder='0' class='" + $(this).attr("class").replace("iframeloader","")  + "' src='" + this.getAttribute("href") + "' frameborder='0'></iframe>");
}
);
});