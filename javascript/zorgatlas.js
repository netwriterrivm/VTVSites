// In dit bestand staan alle scripts voor de zorgatlas.
callFromJQuery=false;
parentUrl="";
zgpopupcountnr=0;
MousePosX=0;
MousePosY=0;
String.prototype.endsWith = function(str) {return (this.match(str+"$")==str)}
 $(document).ready(function(){
 $(document).mousemove(function(e){
      if (document.location!=top.window.document.location)
    	 	{
    	 	    top.window.MousePosX=e.pageX+580;
    	 	    try{
                    top.window.MousePosY=e.pageY+ 199+top.window.AtlasCrumbtrailOffset();
                }
                catch (e)
                {
                  top.window.MousePosY=e.pageY+199;
                }
    	 	}
    	 	else
    	 	{
      top.window.MousePosX=e.pageX;
      top.window.MousePosY=e.pageY;
      }
   });
 parentUrl=$(".breadcrumb a:last").attr("href");
 if (parentUrl!=null)
 {
 	$("#aspnetForm").append("<div id=\"zorgatlas_popups\">Leeg</div>");
 	 	$("body").append("<div class=\"nw_text_info_container_zorgatlas\" id=\"zorgatlas_messagebox\">Leeg</div>");
 	 	$("body").append("<div class=\"nw_text_popup_container_zorgatlas nw_text_popup_container_zorgatlas_border\" id=\"zorgatlas_label\">Leeg</div>");
		$("#zorgatlas_popups").hide();
		$("#zorgatlas_messagebox").hide();
		$("#zorgatlas_label").hide();
			 
 if (parentUrl.indexOf("NetWriterGui")!=-1)
 {
		parentUrl=AtlasConvertUrl(parentUrl);
		$('#zorgatlas_popups').load(parentUrl, function() {
		parentUrl=AtlasConvertUrl($("#content_iframe").attr("src"));
		addCompareLink();
		$('#zorgatlas_popups').html("<div>leeg</div>");
	});
	

 

 }
 else
 {
	parentUrl=AtlasConvertUrl(parentUrl);
	addCompareLink();
 }
 }
	$(".nw_target_map").click(function(event) {
					event.preventDefault();
					AtlasShowMap(AtlasConvertUrl($(this).attr("href")),"",false);
						 
					});
					$(".nw_target_map_slider").click(function(event) {
					event.preventDefault();
					AtlasShowMap(AtlasConvertUrl($(this).attr("href")),"",true);
						 
					});
 
	callFromJQuery=true;
    var areas =  $("area");
	blnPreventDefault=true;
	for(var i=0 ; i<areas.length; i++ ) 
    {
        try
        {
            sMessage=$(areas[i]).attr("onmouseover").toString();
            if (sMessage.indexOf("showLabel")!=-1)
            {
                sMessage=sMessage.substring(sMessage.indexOf("showLabel")+11);
                sMessage=sMessage.substring(0,sMessage.lastIndexOf(");")-1);
                zgpopupcountnr++;
                        
                //$("#zorgatlas_popups").after("<div style=\"display:none\" id=\"nw_popup_message_" + zgpopupcountnr + "\"><div  class=\"nw_text_popup_container_zorgatlas\">" + sMessage + "</div></div>");
                //         $("nw_popup_message_" + popupcountnr ).hide();
                         
                //$(areas[i]).nw_easytooltip("nw_popup_message_"+zgpopupcountnr, {backgroundcolor:"#bddfef" ,border:"1px solid #006d94",event: "mousemove"});
                $(areas[i]).attr("title","");
                         
            }
            //sMessage=$(areas[i]).attr("onmouseover","");
            if($(areas[i]).attr("href").toString().indexOf("showDetailMap")==-1)
              {
            
                     //sTableHtml=eval($(areas[i]).attr("href"));
            
            
            
                       // zgpopupcountnr++;
         
                      //  $("#zorgatlas_popups").after("<div style=\"display:none\" id=\"nw_popup_message_" + zgpopupcountnr + "\"><div  class=\"nw_text_info_container_zorgatlas\">" + sTableHtml + "</div></div>");
                    //$(areas[i]).nw_easytooltip("nw_popup_message_"+zgpopupcountnr, {backgroundcolor:"#006d94" ,border:"1px solid #bddfef",event: "click",closeevent:"leave",position:"absolute",position_left:"600px",position_top:"300px"});          
              }
              else{
              blnPreventDefault=false;
              }
          }
                         catch (ElementNotFound)
                        {
                        }
                       
    }
    callFromJQuery=false;
    if(blnPreventDefault==true)
    {
   }
    $("#clickAlert").attr("top","400px");
    $("#clickAlert img").attr("src","/VTVSites/images/aanwijzer.gif");
     
 });
 //Zorgt er voor dat er na de h2 een "Kaart vergelijken" link geplaatst wordt
 function addCompareLink()
 {

	sCompareLink="	<div class=\"content_supp_zorgatlas\"><ul class=\"toolbox\"><li><a onclick=\"javascript:AtlasShowFileDialog('" + parentUrl + "','" + location + "');\" class=\"star\">Kaart vergelijken</a></li></ul></div>";
	$("#aspnetForm").append(sCompareLink);

 }
 //Laat een dialoog box zien om een kaart te kunnen selecteren
 function AtlasShowFileDialog(sUrl, sParentUrl)
 {
	//alert(sUrl);
   //$('#hoofd_content').load(sUrl);
   if (sUrl.indexOf("GetOutput.aspx")==-1 & sParentUrl!='')
   {
   
        sUrl=absPath(sUrl,sParentUrl);
   
        if (sUrl.endsWith("/"))
        {
            sUrl+="mapindex.aspx";
        }
   }
   sDialogContent="<div class=\"mod box closed lighter zorgatlas_file_dialog\"><h3>Selecteer kaart <img onclick=\"javascript:AtlasHideDialog();\" class=\"zorgatlas_close\" src=\"/VTVSites/images/close.png\" /></h3><iframe  FRAMEBORDER=\"no\"  src=\"" + sUrl + "\"  width=\"956px\" height=\"450px\"/></div>";
   $("#zorgatlas_popups").html(sDialogContent);
   
   $("#zorgatlas_popups").show();

 }
 //sluitpopup
 function AtlasHidePopup(sId)
 {
 $(sId).hide();
 }
 
 //sluit de dialoogbox
 function AtlasHideDialog()
 {
	$("#zorgatlas_popups").hide();
 }
 
 //Geeft de offset van het kruimelpad weer
 function AtlasCrumbtrailOffset()
 {
         if($(".breadcrumb").height()>36)
         {
            return 30;
            }
            else{
            return 0;
         }
 }
 
 
 //laat een atlas kaart zien in een popup
 // naast de url van de kaart kan ook de url van de inhoudsopgave doorgegeven worden en of er een schuifmogelijkheid getoond moet worden
 function AtlasShowMap(sUrl,sParentUrl,showSlider)
 {
 sUrl=sUrl.replace("#hoofd_content","").replace("#breadcrumb","");
    if (sUrl.indexOf("GetOutput.aspx")!=-1)
    {
        $('#zorgatlas_popups').load(sUrl, function() {
		    sUrl=AtlasConvertUrl($("#content_iframe").attr("src"));
		    AtlasShowMap(sUrl,sParentUrl,showSlider);
		});
    }
    else
    {
        if(sParentUrl)
        {
            sUrl=absPath(sUrl,sParentUrl);
            if (sUrl.endsWith("/"))
            {
                sUrl+="mapindex.aspx";
            }
        }
        sSlider="";
        if (showSlider==true)
        {
            sSlider+="<div class=\"zorgatlas_map_dialog_slider\">";
            sSlider+="<a href=\"javascript:AtlasShowFileDialog('" + parentUrl + "','');\"><img border=0 alt=\"Laat inhoudsopgave weer zien\" src=\"/VTVSites/images/mapBack.gif\" /></a>" ;
            sSlider+="<a href=\"" + sUrl.replace("map_index","html").replace("mapindex.aspx","") + "\"><img border=0 alt=\"Kaart naar links verplaatsen\" src=\"/VTVSites/images/mapToLeft.gif\" /></a>";
            sSlider+="</div>"; 
            
        }
        sHeightClass="";
        if($(".breadcrumb").height()>36)
        {
            sHeightClass=" zorgatlas_map_dialog_lower";
        }
	    sDialogContent="<div class=\"mod box closed lighter zorgatlas_map_dialog" + sHeightClass + "\"><h3>Kaart vergelijken <img onclick=\"javascript:AtlasHideDialog();\" class=\"zorgatlas_close\" src=\"/VTVSites/images/close.png\" /></h3><iframe FRAMEBORDER=\"no\" scrolling=\"no\"  src=\"" + sUrl + "\"  width=\"502px\" height=\"531px\"/>"+sSlider+"</div>";
        $("#zorgatlas_popups").html(sDialogContent);
   
        $("#zorgatlas_popups").show();
   }
   
 }
//zorgt er voor dat een standaard url omgezet wordt naar een kaart url
function AtlasConvertUrl(sUrl)
{
 if (sUrl.indexOf("NetWriterGui")!=-1)  
 {
  if (sUrl.indexOf("dynamic")!=-1)  
 {
	 sUrl=sUrl.replace("html","map_index");
	sUrl=sUrl.replace("map_index/1","map_index/4");
 }
 else
 {
	sUrl=sUrl+="&amp;XSLTTemplateName=map_index";
	}
}
 else{
	sUrl=sUrl+"mapindex.aspx"; 
 }
 return sUrl;
}
function showDetailMap(mapLocationStr, blnIsRedaction)
{
if (document.location.href.toLowerCase().indexOf("vtvsites")==-1)
{
mapLocationStr= mapLocationStr.replace("../","/") +  ".gif";
}
else
{
mapLocationStr= mapLocationStr.replace("../","/vtvsites/") +  ".gif";
}

sHeightClass="";
   if($(".breadcrumb").height()>36)
    {
  sHeightClass=" zorgatlas_map_dialog_lower";
    }
   sDialogContent="<div class=\"mod box closed lighter zorgatlas_map_dialog" + sHeightClass + "\"><h3>Detailkaart <img onclick=\"javascript:AtlasHideDialog();\" class=\"zorgatlas_close\" src=\"/VTVSites/images/close.png\" /></h3><img src=\"" +mapLocationStr+"\" alt=\"Detailkaart\" /></div>";
   $("#zorgatlas_popups").html(sDialogContent);
   $("#zorgatlas_popups").show();
}
function showLabel(labelIn)
{
//legacy only
    top.window.AtlasShowLabel(labelIn);
   

}
function AtlasShowLabel(labelIn)
{
   $("#zorgatlas_label").html(""+labelIn+"").css({"left": MousePosX+20, "top" : MousePosY+20}).show();;
}
function hideLabel()
{
    top.window.AtlasHidePopup("#zorgatlas_label");
}
function gTD(tableLabelID, textStr)
{
        if (textStr=="")
        {
                textStr="&nbsp;"
        }
//                return "<tr><td class=vtvMessageTable>"  + tableLabelsArr[tableLabelID] + "</td><td class=vtvMessageTable>" + textStr + "</td></tr>";

		if (textStr.indexOf('http:/' + '/')>-1 || textStr.indexOf('https:')>-1)
                {
                               return "<tr><td class='zorgatlas_map_info_background_first'>" + tableLabelsArr[tableLabelID].replace("&qt;","'") + "</td><td class='zorgatlas_map_info_background'><a  href='" + textStr +"' >" + textStr.replace("&qt;","'") + "</a></td></tr>";
                }
                else
                {
                        return "<tr><td class='zorgatlas_map_info_background_first'>" + tableLabelsArr[tableLabelID].replace("&qt;","'") + "</td><td class='zorgatlas_map_info_background'>" + textStr.replace("&qt;","'") + "</td></tr>";
                }       
		
}
function shTbl(strHelpText, imgName)
{      

		tmpStr="<table cellspacing='1' cellpadding='2' border='0'><tr><td colspan='2' valign='top' class='zorgatlas_map_info_header'><div  align=\"right\" onclick=\"atlasHideInfoBox()\" class=\"zorgatlas_messagebox_close\">Sluiten</div></td></tr>" + strHelpText + "</table>";
	strHelpText= tmpStr;
	if (callFromJQuery)
	{
	return strHelpText;
	}
	else{
	    top.window.showInfoBox(strHelpText);
	    
	}
	
}
function showInfoBox(sMessage)
{
    $("#zorgatlas_messagebox").html(sMessage).css({"left": 710, "top" : 300}).show();
}
function atlasHideInfoBox()
{
    $("#zorgatlas_messagebox").hide().css({"left": 0, "top" : 0});
}

//MC stands for MultipleColumns
function gTDMC(tableLabelID, textArray, numOfColumn, informationRow)
{
    var returnString;
    var colspan;
    var className;
    if (tableLabelID == -1)
    {
        className = "zorgatlas_map_info_header_info";
    }
    else
    {
        className = "zorgatlas_map_info_background_first";       
    }
    
    //if tableLabelID == -1 then the row doesn't need a headername
    if (tableLabelID == -1)
    {
        returnString = "<tr><td class='" + className + "'>&nbsp;</td>";
    }
    else
    {
        returnString = "<tr><td class='" + className + "'>" + tableLabelsArr[tableLabelID].replace("&qt;","'") + "</td>";
    }
    
    for (var i = 0; i < textArray.length; i++)
    {
            
        if (className == "zorgatlas_map_info_background_first" && informationRow)
        {
            className = "zorgatlas_map_info_background";
        }
        //check if the last column is created in this loop
        if ((i == textArray.length-1) && ((numOfColumn - textArray.length) > 1))
        {
            colspan = numOfColumn - textArray.length;
            returnString += "<td class='" + className + "' colspan='" + colspan + "'>";
        }
        else
        {
            returnString += "<td class='" + className + "'>";
        }
        
        if (textArray[i].indexOf('http:/' + '/') > -1 || textArray[i].indexOf('https:') > -1)
        {
            returnString += "<a class='alertBodyURL' href='" + textArray[i] +"' target='_new'>" + textArray[i].replace("&qt;","'") + "</a>";
        }
        else
        {
            returnString += textArray[i].replace("&qt;","'");
        }  
        returnString += "</td>";
    }    
    returnString += "</tr>";
    	return returnString;
	
    
}
//MC stands for MultipleColumns
function shTblMC(strHelpText, imgName, numOfColumn)
{
   var width = numOfColumn * 75;
        tmpStr = "<table cellspacing='1' cellpadding='2' border='0'><tr><td colspan='" + numOfColumn + "' valign='top' class='zorgatlas_map_info_header'><div  onclick=\"atlasHideInfoBox()\"  align=\"right\"  class=\"zorgatlas_messagebox_close\">Sluiten</div></td></tr>" + strHelpText + "</table>";

    strHelpText= tmpStr;
    if (callFromJQuery)
	{
return strHelpText;
}
	else{

	 top.window.showInfoBox(strHelpText);
	}
    
}
function detectFlash() { 
	var requiredVersion=6;
	var hasRightVersion=false;
//	var flash2Installed = false;
//var flash3Installed = false;
//var flash4Installed = false;
//var flash5Installed = false;
//var flash6Installed = false;

var actualVersion = 0;
	var maxVersion = 8;
var isIE = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.indexOf("Windows") != -1) ? true : false;

jsVersion = 1.1;

		if(isIE && isWin){
		for (var i = 2; i <= maxVersion; i++) {  
		document.write('<script>var flash' + i + 'Installed = false;</script>'); }
  document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');
  document.write('on error resume next \n');
  for (var i = 2; i <= maxVersion; i++) {  
  document.write('flash' + i + 'Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.'+ i + '"))) \n');
  }
  document.write('</SCR' + 'IPT\> \n');
}

  if (navigator.plugins) {
    if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
      var isVersion2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
      var flashDescription = navigator.plugins["Shockwave Flash" + isVersion2].description;
      var flashVersion = parseInt(flashDescription.charAt(flashDescription.indexOf(".") - 1));
        flash2Installed = flashVersion == 2;    
      flash3Installed = flashVersion == 3;
      flash4Installed = flashVersion == 4;
      flash5Installed = flashVersion == 5;
      flash6Installed = flashVersion >= 6;
    }
  

    
  }

  for (var i = 2; i <= maxVersion; i++) {  
    if (eval("flash" + i + "Installed") == true) 
	{ 
	actualVersion = i;
	}
  }
  if(navigator.userAgent.indexOf("WebTV") != -1) 
   {
	actualVersion = 3;  
   }
  if (actualVersion >= requiredVersion) {
    hasRightVersion = true;                
    
  }
  else
  {
  alert(actualVersion);
	showHelp('<p>Helaas beschikt uw web browser niet over een (recente versie van de) Flash Player plugin. Deze kunt u <a href="http://www.macromedia.com/go/getflashplayer/" title="Via deze link kunt u de Flash Player ophalen.">downloaden</a> van de Macromedia website. Het is mogelijk, dat u geen toegangsrechten heeft om de plugin zelf te installeren. Neem dan contact op met uw systeembeheerder.</p>');
  }
}

function ieupdate(){
// Met deze functie wordt een flash kaart direct interactief (er hoeft niet meer eerste geklikt te worden om te activeren).
// Is alleen nodig in IE.
browserName=navigator.appName;
if (browserName=='Microsoft Internet Explorer')
    {
	objects = document.getElementsByTagName("object");
	for (var i = 0; i < objects.length; i++)
	{
		objects[i].outerHTML = objects[i].outerHTML;
}}
}
function absPath(url, Loc){
//alert(Loc.lastIndexOf('/'));
//alleen bij relatieve url de boel omzetten

if (url.indexOf("../")!=-1 || url.substring(0,1)!="/"){
	Loc = Loc.toString();
	Loc=Loc.substring(0, Loc.lastIndexOf('/'));
	
	while (/^\.\./.test(url)){		 
		Loc = Loc.substring(0, Loc.lastIndexOf('/'));
		url= url.substring(3);
	}
	newLoc=Loc + '/' + url;
	//alert(url + " " + Loc  +  " " + newLoc);
	return newLoc;
	}
	else
	{
	return url;
	}
	
}