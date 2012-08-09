var helptimer;
function getSiteRelativePath()
{
    sSiteRelativePath="/NetWriterGui";
    
    if(location.href.toLowerCase().indexOf("rijksbreed")!=-1)
    {
     sSiteRelativePath="/Rijksbreed";
    }
    if(location.href.toLowerCase().indexOf("netwritersite")!=-1)
    {
     sSiteRelativePath="/NetWriterSite";
    }
     if(location.href.toLowerCase().indexOf("vtv2010.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
     if(location.href.toLowerCase().indexOf("toolkitvtv.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
     if(location.href.toLowerCase().indexOf("chemkap.rivm.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
     if(location.href.toLowerCase().indexOf("nationaalkompas.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
     if(location.href.toLowerCase().indexOf("zorgatlas.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
 if (location.href.toLowerCase().indexOf("nkca.nl") != -1) {

     sSiteRelativePath = "/VTVSites";
 }
    if(location.href.toLowerCase().indexOf("acropolis-eu.com")!=-1)
    {
    
     sSiteRelativePath="/VTVSites";
    }
      if(location.href.toLowerCase().indexOf("cosmeticaklachten.nl")!=-1)
    {
    
     sSiteRelativePath="/VTVSites";
    }
      if(location.href.toLowerCase().indexOf("huidklachten.info")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
    if(location.href.toLowerCase().indexOf("regionaalkompas.nl")!=-1)
    {
     sSiteRelativePath="/Regionaalkompas";
    }
    if(location.href.toLowerCase().indexOf("ewrs.nl")!=-1)
    {
     sSiteRelativePath="/Dobolav";
    }
    if(location.href.toLowerCase().indexOf("gezondheidszorgbalans.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
    if(location.href.toLowerCase().indexOf("ezips.rivm.nl")!=-1)
    {
     sSiteRelativePath="/VTVSites";
    }
    if(location.href.toLowerCase().indexOf("loketgezondleven.nl")!=-1)
    {
     sSiteRelativePath="/Loketgezondleven";
    }
    if(location.href.toLowerCase().indexOf("kostenvanziekten.nl")!=-1)
    {
     sSiteRelativePath="/Kostenvanziekten";
    }
    if(location.href.toLowerCase().indexOf("costofillness.nl")!=-1)
    {
     sSiteRelativePath="/Kostenvanziekten";
    }
    if(location.href.toLowerCase().indexOf("gezondeschool.info")!=-1)
    {
     sSiteRelativePath="/Loketgezondleven";
    }
    if(location.href.toLowerCase().indexOf("mrsa.rivm.nl")!=-1)
    {
     sSiteRelativePath="/Unilab4V2";
    }
   return sSiteRelativePath;
}
function IncludeJavaScript(jsFile)
{
  document.write('<script type="text/javascript" src="' + getSiteRelativePath() + '/javascript/'+ jsFile + '"></script>');
}
function IncludeCSS(cssFile) {
    document.write('<link rel="stylesheet" href="' + getSiteRelativePath() + cssFile + '" type="text/css" media="screen" />');
}
function IncludeJavaScriptEditor(jsFile)
{
  document.write('<script type="text/javascript" src="/NetWriterGui/content/xml/'+ jsFile + '"></script>'); 
}
//function IncludeJavaScriptJQuery(jsFile)
//{
//   document.write('<script type="text/javascript" src="' + getSiteRelativePath() + '/javascript/jquery.ui-1.72/'+ jsFile + '"></script>'); 
//}
if (typeof jQuery == 'undefined') { 
    IncludeJavaScript("jquery.ui-1.72/jquery-1.3.2.min.js");
    IncludeJavaScript("jquery.ui-1.72/jquery-ui-1.7.2.custom.min.js");
    }

    //NB NIet in javascript folder, maar content folder 
    if(location.href.toLowerCase().indexOf("netwritergui")!=-1)
    {
        document.write('<script type="text/javascript" src="' + getSiteRelativePath() + '/content/xml/util_xml.js"></script>'); 
    }
    
    //IncludeJavaScriptJQuery('jquery-latest.pack.js');
    //IncludeJavaScriptJQuery('jquery.dimensions.js');
    //IncludeJavaScriptJQuery('ui.core.js');
    //IncludeJavaScriptJQuery('ui.mouse.js');
    //IncludeJavaScriptJQuery('ui.resizable.js');
    //IncludeJavaScriptJQuery('ui.accordion.js');
    //IncludeJavaScriptJQuery('ui.draggable.js');
    //IncludeJavaScriptJQuery('ui.tabs.js');
    //IncludeJavaScriptJQuery('ui.draggable.ext.js');
    IncludeJavaScript('jquery.ui-1.0/jquery.contextMenu.js');
    IncludeJavaScript('jquery.ui-1.0/easytooltip.js');
    IncludeJavaScript('autocomplete/jquery.autocomplete.min.js');
    IncludeCSS('/javascript/autocomplete/jquery.autocomplete.css');
    IncludeJavaScript('jquery.cycle.all.js');
    
    IncludeJavaScript('jquery.ui-1.0/fg.menu.js');
    
    IncludeJavaScript('jquery.ui-1.0/officebar/js/jquery.officebar.js');
    IncludeJavaScript('sitestat.js');
    IncludeJavaScript('jquery.ui-1.0/link.iframe.nw.js');
    IncludeJavaScript('dhtml.js');
    IncludeJavaScript('menu.js');
    IncludeJavaScript('popup.js');
    IncludeJavaScript('event.js');
    IncludeJavaScript('twitter.js');
    if(location.href.toLowerCase().indexOf("netwritergui")!=-1)
    {
        IncludeJavaScript('getMenuDeclarations.aspx');
        IncludeJavaScript('netwriter.js');
    }
//    if (location.href.toLowerCase().indexOf("nationaalkompas.nl") != -1) { //voor ontwikkelen | location.href.toLowerCase().indexOf("localhost") != -1 toevoegen
//        IncludeJavaScript('kompas/kompas-enquete.js');
//        
//    }
languageId=1;
//PopupWidth="250px'" ;
AtlasMapPopup=650;
PopupHeight=150;
popupposition=-1;
function getResource(strID){return getResourceNW(strID);}
imgName="";
function showHelp(txt, img)
{
showHelpCmsApp(txt, img);
}
