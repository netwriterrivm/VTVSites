function _widgetXHTMLDelegated(oFrag) {
    with (this) {
        //alert('gijs');
        var editnode = getXmlNode();
        sLocation = document.location.href.toLowerCase();
        isNewVersion = false; // hack om url om te leiden naar nieuwe versie
        if (sLocation.indexOf("netwritergui") > 0) // hack om url om te leiden naar nieuwe versie
        {
            isNewVersion = true;
        }
        if (editnode != null) {

            switch (widgetType) {
                case "datatabledescription":
                    if (utilGetXmlAttribute(editnode, "filename") != null) {
                        strMessage = "Excel: " + utilGetXmlAttribute(editnode, "filename") + " -> " + utilGetXmlAttribute(editnode, "worksheetname");
                        utilUpdateXmlNodeValue(oFrag, strMessage);
                    }
                    break;
                case "datatablewidth":
                    try {
                        if (utilGetXmlAttribute(editnode, "width") != null) {
                            strMessage = 'width="' + utilGetXmlAttribute(editnode, "width") + '"';
                            utilSetXmlAttribute(oFrag, "style", strMessage);
                            root.watchChanges(editnode, this);
                        }
                    }
                    catch (e)
				{ }
                    break;
                case "hrefinpage":
                    utilSetXmlAttribute(oFrag, "href", '#' + editnode.text);
                    root.watchChanges(editnode, this);
                    break;
                case "importname":
                    if (utilGetXmlAttribute(editnode, "filename") != null) {
                        strMessage = utilGetXmlAttribute(editnode, "filename");
                        utilUpdateXmlNodeValue(oFrag, strMessage);
                    }
                    break;
                case "link_definition":
                    if (isNewVersion) {
                        strImageName = "'../../images/definition_short_1.gif'";
                    }
                    else {
                        strImageName = "'../images/definition_short_1.gif'";
                    }
                    utilSetXmlAttribute(oFrag, "href", "javascript:showHelpCmsApp('" + definition_msgText(editnode) + "'," + strImageName + ");");
                    root.watchChanges(editnode, this);
                    break;
                case "link_definition_short":
                    if (isNewVersion) {
                        strImageName = "'../../images/definition_short_1.gif'";
                    }
                    else {
                        strImageName = "'../images/definition_short_1.gif'";
                    }

                    sTitleAttrib = "";
                    if (utilGetXmlAttribute(editnode, "definition_desc") != "" && utilGetXmlAttribute(editnode, "definition_desc") != null) {
                        sTitleAttrib = utilGetXmlAttribute(editnode, "definition_desc");
                    }

                    if (utilGetXmlAttribute(editnode, "definition_name") != "" && utilGetXmlAttribute(editnode, "definition_name") != null) {
                        sTitleAttrib += " (" + utilGetXmlAttribute(editnode, "definition_name") + ")";
                    }
                    utilSetXmlAttribute(oFrag, "title", sTitleAttrib);
                    if (utilGetXmlAttribute(editnode, "definition_name") != null) {
                        utilUpdateXmlNodeValue(oFrag, utilGetXmlAttribute(editnode, "definition_name"));
                    }
                    else {
                        utilUpdateXmlNodeValue(oFrag, getResourceNW("rsi.edx.error.definition.not.found"));
                    }
                    utilSetXmlAttribute(oFrag, "onClick", "javascript:showHelpCmsApp('" + definition_msgText(editnode) + "'," + strImageName + ");");
                    root.watchChanges(editnode, this);
                    break;
                case "link_object_class":

                    strUrl = "/vtvRedactieGui/structure/index.aspx?class_name=" + utilGetXmlAttribute(editnode, "object_class_name")
                    if (isNewVersion) {
                        strUrl = "/NetWriterGui/publication/GetOutput.aspx?class_name=" + utilGetXmlAttribute(editnode, "object_class_name")
                    }


                    link_target = utilGetXmlAttribute(editnode, "link_target");
                    oFrag = setTargetAndUrl(oFrag, link_target, strUrl)
                    root.watchChanges(editnode, this);
                    break;
                case "link_object_document":
                    //		showHelp(editnode.nodeName);
                    strUrl = "/vtvRedactieGui/XMLEdit/Content.Edit.aspx?StructureNodeId=" + utilGetXmlAttribute(editnode, "object_document_default_structure_id") + "&ObjectTypeId=2&ObjectId=" + utilGetXmlAttribute(editnode, "object_document_id")

                    if (sLocation.indexOf("netwritergui") > 0) // hack om url om te leiden naar nieuwe versie
                    {
                        strUrl = "/NetWriterGui/publication/getOutput.aspx?ObjectTypeId=2&ObjectId=" + utilGetXmlAttribute(editnode, "object_document_id")
                    }
                    link_target = utilGetXmlAttribute(editnode, "link_target");

                    oFrag = setTargetAndUrl(oFrag, link_target, strUrl)
                    //	if (utilGetXmlAttribute( editnode, "object_document_label")!="")
                    //{
                    //		utilSetXmlAttribute( oFrag, "title",utilGetXmlAttribute( editnode, "object_document_label"));
                    //	}
                    root.watchChanges(editnode, this);
                    break;
                case "link_object_map":

                    strUrl = "/vtvRedactieGui/XMLEdit/Content.Edit.aspx?StructureNodeId=" + utilGetXmlAttribute(editnode, "object_map_default_structure_id") + "&ObjectTypeId=5&ObjectId=" + utilGetXmlAttribute(editnode, "object_map_id")
                    if (isNewVersion) {
                        strUrl = "/NetWriterGui/publication/getOutput.aspx?ObjectTypeId=5&ObjectId=" + utilGetXmlAttribute(editnode, "object_map_id")
                    }
                    link_target = utilGetXmlAttribute(editnode, "link_target");

                    strUrlObjectBinary = "";
                    if (link_target == "_popup_map" || link_target == "_popup_map_slider") {


                        strUrlObjectBinary = "/vtvRedactieGui/Objects/GetObjectBinary.aspx?ObjectBinaryId=" + utilGetXmlAttribute(editnode, "object_binary_id");
                        if (sLocation.indexOf("netwritergui") > 0) // hack om url om te leiden naar nieuwe versie
                        {
                            strUrlObjectBinary = "/NetWriterGui/content/GetObjectBinary.aspx?ObjectBinaryId=" + utilGetXmlAttribute(editnode, "object_binary_id");
                        }
                    }

                    oFrag = setTargetAndUrl(oFrag, link_target, strUrl, strUrlObjectBinary)

                    //if (utilGetXmlAttribute( editnode, "object_map_label")!="")
                    //{
                    //		utilSetXmlAttribute( oFrag, "title",utilGetXmlAttribute( editnode, "object_map_label"));
                    //	}

                    root.watchChanges(editnode, this);
                    break;
                case "link_object_map_swf":
                    strUrl = "/VtvRedactieGui/XMLEdit/GetSWF.aspx?ObjectMapId=" + utilGetXmlAttribute(editnode, "object_map_id");
                    if (isNewVersion) {
                        strUrl = "/NetWriterGui/content/GetSWF.aspx?ObjectMapId=" + utilGetXmlAttribute(editnode, "object_map_id");
                    }
                    utilSetXmlAttribute(oFrag, "src", strUrl);
                    break;
                case "link_reference":
                    // eerst tekst van de popup opbouwen
                    strMessage = utilGetXmlAttribute(editnode, "reference_title")
                    if (utilGetXmlAttribute(editnode, "reference_info") != null) {
                        strMessage += " " + utilGetXmlAttribute(editnode, "reference_info");
                    }
                    if (utilGetXmlAttribute(editnode, "reference_year") != null) {
                        strMessage += " " + utilGetXmlAttribute(editnode, "reference_year");
                    }
                    if (utilGetXmlAttribute(editnode, "reference_volume") != null) {
                        strMessage += utilGetXmlAttribute(editnode, "reference_volume");
                    }
                    else {
                        strMessage += ".";
                    }
                    // als van url voorzien dan tekst voorzien van anchor
                    if (utilGetXmlAttribute(editnode, "object_url_id") != "" && utilGetXmlAttribute(editnode, "object_url_id") != "0" && utilGetXmlAttribute(editnode, "object_url_id") != null) {
                        strMessage = "<a class=\"alertUrl\" target=\"_blank\" href=\"" + utilGetXmlAttribute(editnode, "object_url") + "\">" + strMessage + "</a>";
                    }
                    strMessage = "<p class=\"alertDesc\">" + strMessage + "</p>";
                    // het geheel presenteren afhankelijk van type.
                    if (utilGetXmlAttribute(editnode, "reference_type_id") == "2") // een bronvermelding
                    {
                        strMessage = "<p class=\"alertName\">" + utilGetXmlAttribute(editnode, "reference") + "</p>" + strMessage;
                    }
                    else { // literatuur
                        strMessage = "<p class=\"alertName\">" + utilGetXmlAttribute(editnode, "reference_authors") + "</p>" + strMessage;
                    }
                    // Toegevoegd door Ramazan om quote's in titel van reference uit te filteren
                    if (strMessage.indexOf('\'') > -1) {
                        strMessage = replaceAll(strMessage, '\'', '\\\'');
                    }
                    
                        utilSetXmlAttribute(oFrag, "href", "javascript:showHelpCmsApp('" + strMessage + "','/NetWriterGui/content/xml/icons/reference_1.gif');");
                    
                    if (utilGetXmlAttribute(editnode, "reference_code") == null) {
                        utilUpdateXmlNodeValue(oFrag, utilGetXmlAttribute(editnode, "reference"));
                    }
                    else {
                        utilUpdateXmlNodeValue(oFrag, utilGetXmlAttribute(editnode, "reference") + utilGetXmlAttribute(editnode, "reference_code"));
                    }
                    root.watchChanges(editnode, this);
                    break;
                case "link_object_url":
                    strMessage = utilGetXmlAttribute(editnode, "object_url")
                    utilSetXmlAttribute(oFrag, "href", strMessage);
                    root.watchChanges(editnode, this);
                    break;
                case "link_code_file":
                    strMessage = utilGetXmlAttribute(editnode, "code_file")
                    utilSetXmlAttribute(oFrag, "href", strMessage);
                    root.watchChanges(editnode, this);
                    break;
                case "name":
                    utilSetXmlAttribute(oFrag, "name", editnode.text);
                    root.watchChanges(editnode, this);
                    break;
                case "object_binary_image":
                    oFrag = object_binary_oFrag(oFrag, editnode, widgetType);
                    //parent_img=editnode.parentNode;
                    //if (utilGetXmlAttribute( editnode, "align") !=null && utilGetXmlAttribute( editnode, "align") !="" && utilGetXmlAttribute( editnode, "align") !="none")
                    //{
                    //	utilSetXmlAttribute( oFrag, "class", utilGetXmlAttribute( editnode, "align"));
                    //}
                    root.watchChanges(editnode, this);
                    break;
                case "object_binary_pdf":
                    oFrag = object_binary_oFrag(oFrag, editnode, widgetType);
                    root.watchChanges(editnode, this);
                    break;
                case "object_binary_image_partner":
                    oFrag = object_binary_oFrag(oFrag, editnode, widgetType);
                    root.watchChanges(editnode, this);
                    break;
                case "link_content":
                    // fragment asynchroon ophalen mbv xmlhttprequest
                    sGetUrl = "ContentGetOutput.aspx?StructureNodeId=" + structureNodeId + "&ContentId=" + utilGetXmlAttribute(editnode, "content_id") + "&XlinkIdLinked=" + utilGetXmlAttribute(editnode, "XlinkIdLinked");
                    sAction = "LoadLinkedContent('" + this.id + "','" + sGetUrl + "');";
                    setTimeout(sAction, 4000);

                    break;
                case "link_content_link":
                    iconSrc = "/VtvRedactieGuiPublic/images/step_3_r_new4.gif"
                    if (isNewVersion) {
                        iconSrc = "/NetWriterGui/images/arrow_right.gif"
                    }
                    utilSetXmlAttribute(oFrag, "src", iconSrc);
                    objecttypeidlinked = utilGetXmlAttribute(editnode, "object_type_id");
                    if (objecttypeidlinked == 28) {
                        strUrl = "showASPXLarge('/vtvRedactieGui/Objects/GetObjectBinary.aspx?ObjectBinaryId=" + utilGetXmlAttribute(editnode, "object_id") + "&ObjectId=" + utilGetXmlAttribute(editnode, "object_id") + "&ObjectTypeId=" + utilGetXmlAttribute(editnode, "object_type_id") + "');";
                        if (isNewVersion) {
                            strUrl = "showASPXLarge('/NetWriterGui/content/GetObjectBinary.aspx?ObjectBinaryId=" + utilGetXmlAttribute(editnode, "object_id") + "&ObjectId=" + utilGetXmlAttribute(editnode, "object_id") + "&ObjectTypeId=" + utilGetXmlAttribute(editnode, "object_type_id") + "');";
                        }

                    }
                    else {
                        strUrl = "showASPXLarge('/vtvRedactieGui/structure/gethtml.aspx?ObjectId=" + utilGetXmlAttribute(editnode, "object_id") + "&ObjectTypeId=" + utilGetXmlAttribute(editnode, "object_type_id") + "');";


                        if (isNewVersion) {
                            strUrl = "showASPXLarge('/NetWriterGui/publication/GetOutput.aspx?ObjectId=" + utilGetXmlAttribute(editnode, "object_id") + "&ObjectTypeId=" + utilGetXmlAttribute(editnode, "object_type_id") + "');";
                        }
                    }
                    utilSetXmlAttribute(oFrag, "onclick", strUrl);
                    utilSetXmlAttribute(oFrag, "title", getResourceNW("rsi.edx.link_conten.opensource"));

                    break;
                case "datatableview":


                    if (utilGetXmlAttribute(editnode, "XlinkId") != null) {

                        //strUrlToFragment="Content.GetHtmlFragment.Xlink2.aspx?StructureNodeId=" + structureNodeId + "&ContentId=" + ContentId + "&XlinkIdLinked=" + utilGetXmlAttribute( editnode, "XlinkId" )
                        // tabel asynchroon ophalen mbv xmlhttprequest
                        //if (isNewVersion)
                        //{
                        sGetUrl = "ContentGetOutput.aspx?StructureNodeId=" + structureNodeId + "&ContentId=" + ContentId + "&XlinkIdLinked=" + utilGetXmlAttribute(editnode, "XlinkId");
                        sAction = "LoadLinkedContent('" + this.id + "','" + sGetUrl + "');";
                        setTimeout(sAction, 4000);

                        //XmlHttpRequestHandler.addItem(this.root,this.id,"ContentGetOutput.aspx?StructureNodeId=" + structureNodeId + "&ContentId=" + ContentId + "&XlinkIdLinked=" + utilGetXmlAttribute( editnode, "XlinkId" ));
                        //}
                        //else
                        //{
                        //	XmlHttpRequestHandler.addItem(this.root,this.id,"Content.GetHtmlFragment.Xlink3.aspx?StructureNodeId=" + structureNodeId + "&ContentId=" + ContentId + "&XlinkIdLinked=" + utilGetXmlAttribute( editnode, "XlinkId" ));
                        //}
                    }
                    else {
                        //oFrag=getResourceNW('rsi.edx.table.visible.aftersave');
                        //strUrlToFragment="/vtvRedactieGuiPublic/images/icons/insert_table.gif";
                        if (popupCountTable == 0) {
                            showHelpCmsApp(getResourceNW('rsi.edx.table.visible.aftersave'));
                        }
                        popupCountTable++;
                    }
                    //utilSetXmlAttribute( oFrag, "src", strUrlToFragment);

                    break;
                case "link_object_wuc":
                    strUrlToFragment = utilGetXmlAttribute(editnode, "object_wuc_preview_page");
                    if (utilGetXmlAttribute(editnode, "object_wuc_paramlist") != null) {
                        strUrlToFragment += '?paramlist=' + utilGetXmlAttribute(editnode, "object_wuc_paramlist");
                    }
                    strWidth = utilGetXmlAttribute(editnode, "object_wuc_preview_width");
                    strHeight = utilGetXmlAttribute(editnode, "object_wuc_preview_height")
                    //alert(strUrlToFragment);
                    utilSetXmlAttribute(oFrag, "src", strUrlToFragment);
                    utilSetXmlAttribute(oFrag, "width", strWidth);
                    utilSetXmlAttribute(oFrag, "height", strHeight);

                    break;
                case "link_object_external":

                    if (utilGetXmlAttribute(editnode.parentNode, "XlinkId") != null) {

                        
                            strUrlToFragment = "ContentGetOutput.aspx?StructureNodeId=" + structureNodeId + "&ContentId=" + ContentId + "&XlinkIdLinked=" + utilGetXmlAttribute(editnode.parentNode, "XlinkId");

                        
                        // external asynchroon ophalen mbv xmlhttprequest
                        
                        sAction = "LoadLinkedContent('" + this.id + "','" + strUrlToFragment + "');";
                        setTimeout(sAction, 4000);

                        //XmlHttpRequestHandler.addItem(this.root,this.id,strUrlToFragment);
                    }
                    else {

                        //strUrlToFragment="/vtvRedactieGuiPublic/images/object_external_1.gif";
                        if (popupCountExternal == 0) {
                            showHelpCmsApp(getResourceNW('rsi.edx.object_external.visible.aftersave'));
                        }
                        popupCountExternal++;
                    }
                    //utilSetXmlAttribute( oFrag, "src", strUrlToFragment);
                    break;
                case "framemenu_list":

                    break;

            }
        }
    }
    return oFrag;
}

function object_binary_oFrag(oFrag, editnode, widgetType) {

    strAltText = utilGetXmlAttribute(editnode, "object_binary_label");
    strUrl = "/VtvRedactieGui/Objects/GetObjectBinary.aspx?ObjectBinaryId=" + utilGetXmlAttribute(editnode, "object_binary_id");
    if (isNewVersion) {
        strUrl = "/NetWriterGui/content/GetObjectBinary.aspx?ObjectBinaryId=" + utilGetXmlAttribute(editnode, "object_binary_id");
    }
    if (widgetType == "object_binary_pdf") {
        utilSetXmlAttribute(oFrag, "href", strUrl);
        utilSetXmlAttribute(oFrag, "title", strAltText);
    }
    else {

        utilSetXmlAttribute(oFrag, "src", strUrl);
        utilSetXmlAttribute(oFrag, "alt", strAltText);
        click_zone_id_tmp = utilGetXmlAttribute(editnode, "click_zone_id");
        if (click_zone_id_tmp != "") {
            utilSetXmlAttribute(oFrag, "usemap", "#clickzone" + click_zone_id_tmp);
        }
        blnFoundLink = false;
        for (oo = 0; oo < editnode.parentNode.childNodes.length; oo++) {
            oChildNode = editnode.parentNode.childNodes[oo];
            if (oChildNode.nodeName == "link_object_class" || oChildNode.nodeName == "link_object_document" || oChildNode.nodeName == "link_object_map" || oChildNode.nodeName == "link_object_url" || oChildNode.nodeName == "link_code_file") {
                if (blnFoundLink == false) {
                    blnFoundLink = true;
                    strUrl = "";

                    switch (editnode.parentNode.childNodes[oo].nodeName) {
                        case "link_object_url":
                            strUrl = utilGetXmlAttribute(findchild(oChildNode, "object_url"), "object_url")
                            break;
                        case "link_code_file":

                            strUrl = utilGetXmlAttribute(findchild(oChildNode, "code_file"), "code_file")

                            break;
                        case "link_object_class":

                            strUrl = "/vtvRedactieGui/structure/index.aspx?class_name=" + utilGetXmlAttribute(findchild(oChildNode, "object_class"), "object_class_name");
                            if (isNewVersion) {
                                strUrl = "/NetWriterGui/publication/GetOutput.aspx?class_name=" + utilGetXmlAttribute(findchild(oChildNode, "object_class"), "object_class_name");
                            }
                            break;
                        case "link_object_document":
                            oDocument = findchild(oChildNode, "object_document")
                            strUrl = "/vtvRedactieGui/XMLEdit/Content.Edit.aspx?StructureNodeId=" + utilGetXmlAttribute(oDocument, "object_document_default_structure_id") + "&ObjectTypeId=2&ObjectId=" + utilGetXmlAttribute(oDocument, "object_document_id")
                            if (isNewVersion) {
                                strUrl = "/NetWriterGui/content/xml/ContentEdit.aspx?StructureNodeId=" + utilGetXmlAttribute(oDocument, "object_document_default_structure_id") + "&ObjectTypeId=2&ObjectId=" + utilGetXmlAttribute(oDocument, "object_document_id")
                            }
                            break;
                        case "link_object_map":
                            oMap = findchild(oChildNode, "object_map")
                            strUrl = "/vtvRedactieGui/XMLEdit/Content.Edit.aspx?StructureNodeId=" + utilGetXmlAttribute(oMap, "object_map_default_structure_id") + "&ObjectTypeId=5&ObjectId=" + utilGetXmlAttribute(oMap, "object_map_id")
                            if (isNewVersion) {
                                strUrl = "/NetWriterGui/content/xml/ContentEdit.aspx?StructureNodeId=" + utilGetXmlAttribute(oMap, "object_map_default_structure_id") + "&ObjectTypeId=5&ObjectId=" + utilGetXmlAttribute(oMap, "object_map_id")
                            }
                            break;
                            break;

                    }
                    //alert("window.open('" + strUrl + "');");
                    utilSetXmlAttribute(oFrag, "onclick", "window.open('" + strUrl + "');");
                }
                else {
                    alert(getResourceNW("rsi.edx.error.image_link_count"));
                    break;
                }
            }
        }
    }
    return oFrag;
}
function findchild(oNode, nodeName) {
    for (ooo = 0; ooo < oNode.childNodes.length; ooo++) {
        if (oNode.childNodes[ooo].nodeName == nodeName) {
            return oNode.childNodes[ooo];
        }
    }
    return null;

}
function createXMLHttpRequest() {
    try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) { }
    try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) { }
    try { return new XMLHttpRequest(); } catch (e) { }
    alert("XMLHttpRequest not supported");
    return null;
}
function _widgetOnGetHTMLFragmentResponse() {

    // alert(this.nodeClass);
    //if (xhReq){
    //if (xhReq.readyState != 4)  
    //{ 
    //	return; 
    //}
    //var serverResponse = xhReq.responseText;
    //alert(serverResponse);
    //}
}
function definition_msgText(editnode) {
    oFrag = "";
    if (utilGetXmlAttribute(editnode, "definition_synonym_id") == "" || utilGetXmlAttribute(editnode, "definition_synonym_id") == null || utilGetXmlAttribute(editnode, "definition_synonym_id") == "null") {
        oFrag = "<p class=\"alertName\">" + utilGetXmlAttribute(editnode, "definition_desc");
        if (utilGetXmlAttribute(editnode, "definition_name") != "" && utilGetXmlAttribute(editnode, "definition_name") != null) {
            oFrag += " (" + utilGetXmlAttribute(editnode, "definition_name") + ")";
        }
        oFrag += "</p>";
        if (utilGetXmlAttribute(editnode, "definition_memo") != "") {
            oFrag += "<p class=\"alertDesc\">" + utilGetXmlAttribute(editnode, "definition_memo") + "</p>";
        }
    }
    else {
        if (isNewVersion) {
            oFrag = "<a class=\"alertUrl\" href=\"\NetWriterGui\contentobject\Definition.aspx?DefinitionId=" + utilGetXmlAttribute(editnode, "definition_synonym_id") + "&StructureNodeId=' + top.window.StructureNodeId +'&PageMode=9\" target=\"_blank\"> Dit is een synoniem van een ander begrip, klik op de tekst om de eigenschappen te zien.</a>";
        }
        else {
            oFrag = "<a class=\"alertUrl\" href=\"\vtvRedactieGui\Objects\Definition.aspx?DefinitionId=" + utilGetXmlAttribute(editnode, "definition_synonym_id") + "&StructureNodeId=' + top.window.StructureNodeId +'&PageMode=9\" target=\"_blank\"> Dit is een synoniem van een ander begrip, klik op de tekst om de eigenschappen te zien.</a>";
        }
    }
    if (oFrag.indexOf('\'') > -1) {
        re = /'/gi;
        oFrag = oFrag.replace(re, "\\\'");
    }
    return oFrag
}
function setTargetAndUrl(oFrag, link_target, strUrl, strUrlObjectBinary) {
    utilSetXmlAttribute(oFrag, "target", "_blank");
    utilSetXmlAttribute(oFrag, "href", strUrl);

    //	switch(link_target)
    //	{
    //		case "_blank":
    //			utilSetXmlAttribute( oFrag, "target","_blank");
    //			utilSetXmlAttribute( oFrag, "href",strUrl);
    //			break;
    //		case "_popup":
    //			utilSetXmlAttribute( oFrag, "onclick","NetWriterPopup('"+strUrl+"');");
    //			break;
    //		case "_popup_map":
    //						
    //			utilSetXmlAttribute( oFrag, "onclick","NetWriterPopup('"+strUrlObjectBinary+"');");
    //			break;
    //		case "_popup_map_slider":
    //			utilSetXmlAttribute( oFrag, "onclick","NetWriterPopup('"+strUrlObjectBinary+"');");
    //			break;
    //		default :
    //			utilSetXmlAttribute( oFrag, "href",strUrl);
    //			
    //			break;
    //	}
    return oFrag;

}
function widgetPopupClickDelegated(e, EdxCommandToExecute, EdxCommandCommandValue, EdxCommandAttributeValue, EdxCommandCommandValue2) {
    switch (EdxCommandToExecute) {
        case "tableinsertcolumnleft":
            TableInsertColumn(e, false);
            break;
        case "tableinsertcolumnright":
            TableInsertColumn(e, true);
            break;
        case "tablecolumnsetalignment":
            displayAlignMenu(e, false);
            break;
        case "tablecelsetalignment":
            colapseMenu = false;
            displayAlignMenu(e, true);
            break;
        case "delete":
            if (EdxCommandCommandValue == "column") {
                TableDeleteColumn(e);
            }
            break
        case "copycolumn":
            e.root.aClipboardNodes = new Array();
            e.root.aClipboardNodes[e.root.aClipboardNodes.length] = e;
            window.clipboardData.setData('Text', 'column_copy')
            break;
        case "datarowinser":
            //insert template voor row ophalen

            var v = e.root.getView();
            var t = v.getTemplate("datarow");
            var x = t.selectSingleNode("edx:insert");
            var x = x.childNodes[0].cloneNode(true);
            //childnode deleten
            DeleteCount = x.childNodes.length;
            oSelection = x.selectNodes("//datacell");
            oSelection.removeAll();
            parentContainer = e.parent.getXmlNode();
            //colspan huidige node berekenen

            TotalColspan = 0;
            if (e.edxtemplate == "emptycelltbody") // laatste regel invoegen
            {
                if (parentContainer.childNodes.length == 0) {
                    TotalColspan = 1; // helemaal lege tabel, een cel invoegen
                }
                else {
                    DataRowNode = parentContainer.childNodes[0]; //anders eerste regel kijken hoeveel

                }
            }
            else {
                DataRowNode = e.getXmlNode(); // gewone tabelregel

            }

            if (TotalColspan == 0) {// geen lege tabel
                for (iChildI = 0; iChildI < DataRowNode.childNodes.length; iChildI++) {
                    ColSpanOfCurrentCell = 1;
                    if (utilGetXmlAttribute(DataRowNode.childNodes[iChildI], "colspan") != null) {
                        ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(DataRowNode.childNodes[iChildI], "colspan"));
                    }
                    TotalColspan = TotalColspan + ColSpanOfCurrentCell
                }
            }
            //dat aantal aan nieuwe datacel nodes toevoegen aan de rij
            var vvv = e.root.getView();
            var ttt = vvv.getTemplate("datacell");
            var xxx = ttt.selectSingleNode("edx:insert");
            for (iChildI = 0; iChildI < TotalColspan; iChildI++) {
                var OneInsertNode = xxx.childNodes[0].cloneNode(true);
                x.appendChild(OneInsertNode);
            }
            editnode = e.getXmlNode();
            if (e.edxtemplate == "emptycelltbody") {
                e.parent.insertXml(x.xml, e, parentContainer.childNodes.length)
            }
            else {
                for (iChildI = 0; iChildI < parentContainer.childNodes.length; iChildI++) {
                    if (parentContainer.childNodes[iChildI] == editnode) {
                        e.parent.insertXml(x.xml, e, iChildI)
                        break;
                    }
                }
            }

            break;

    }
    CheckGuiEnabled("insert");
}
function TableInsertColumn(myEobj, blnInsertAfter) {
    var TableActiveCell = myEobj.getXmlNode();
    TableActiveRow = myEobj.parent.parent.getXmlNode();
    TableActiveTable = myEobj.parent.parent.parent.parent.getXmlNode();
    ColumnIndexToInsert = GetColumnCountForTable(myEobj, blnInsertAfter);
    var aNotifyList = new Array();
    var xmlmgr = myEobj.root.getXmlManager();
    xmlmgr.openTransaction(null);
    for (rowI = 0; rowI < TableActiveTable.childNodes.length; rowI++) {
        RowColumnIndexToInsert = 0;
        blnInsertedNode = false;
        intInsertIndex = -1;

        if (TableActiveTable.childNodes[rowI].nodeName != 'datatablecaption') {

            for (colI = 0; colI < TableActiveTable.childNodes[rowI].childNodes.length; colI++) {
                if (RowColumnIndexToInsert >= ColumnIndexToInsert) {
                    intInsertIndex = colI;
                    break;
                }
                ColSpanOfCurrentCell = 1;
                if (utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan") != null) {
                    ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan"));
                }
                RowColumnIndexToInsert = RowColumnIndexToInsert + ColSpanOfCurrentCell;
            }
            if (intInsertIndex == -1) //niets ingevoerd, dus waarschijnlijk aan eind regel....
            {
                intInsertIndex = TableActiveTable.childNodes[rowI].childNodes.length;
            }
            newNode = TableActiveCell.cloneNode(false);
            xmlmgr.process("insertNode", TableActiveTable.childNodes[rowI], newNode, intInsertIndex);
            //LEGE paragraaf invoegen
            var joXml = getDOMDocument();
            joXml.async = false;
            joXml.validateOnParse = false;
            if (utilGetXmlAttribute(TableActiveTable.childNodes[rowI], "layout") == "Kop") {
                joXml.loadXML("<header align=\"\" level=\"2\">[Kopregel]</header>");
            }
            else {
                joXml.loadXML("<paragraph align=\"\" layout=\"paragraph\">[Paragraaf]</paragraph>");
            }
            var joRoot = joXml.documentElement;
            xmlmgr.process("insertNode", newNode, joRoot, 0);
            aNotifyList[aNotifyList.length] = TableActiveTable.childNodes[rowI];
            for (iii = 0; iii < newNode.attributes.length; iii++) {
                if (newNode.attributes[iii].nodeName == "XlinkId") {
                    xmlmgr.process("updateNode", newNode.attributes[iii], "");
                }
                if (newNode.attributes[iii].nodeName == "colspan") {
                    xmlmgr.process("updateNode", newNode.attributes[iii], "1");
                }
            }
            aNotifyList[aNotifyList.length] = newNode;
        }
    }
    xmlmgr.setNotify(aNotifyList);
    xmlmgr.closeTransaction();
    for (ihg = 0; ihg < aNotifyList.length; ihg++) {
        myEobj.root.alertChange(aNotifyList[ihg], null);
    }
}
function GetColumnCountForTable(myEobj, blnInsertAfter) {

    var TableActiveCell = myEobj.getXmlNode();
    TableActiveRow = myEobj.parent.parent.getXmlNode();
    ColumnCountForTable = 0;
    for (colI = 0; colI < TableActiveRow.childNodes.length; colI++) {
        if (TableActiveRow.childNodes[colI] == TableActiveCell) {
            if (blnInsertAfter == true) {

                ColSpanOfCurrentCell = 1;
                if (utilGetXmlAttribute(TableActiveRow.childNodes[colI], "colspan") != null) {
                    ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveRow.childNodes[colI], "colspan"));
                }
                ColumnCountForTable = ColumnCountForTable + ColSpanOfCurrentCell;
            }
            break;
        }
        else {
            ColSpanOfCurrentCell = 1;
            if (utilGetXmlAttribute(TableActiveRow.childNodes[colI], "colspan") != null) {
                ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveRow.childNodes[colI], "colspan"));
            }
            ColumnCountForTable = ColumnCountForTable + ColSpanOfCurrentCell;

        }
    }
    return ColumnCountForTable;
}
function TableDeleteColumn(myEobj) {
    var aNotifyList = new Array();
    var xmlmgr = myEobj.root.getXmlManager();
    xmlmgr.openTransaction(null);
    var TableActiveCell = myEobj.getXmlNode();

    TableActiveTable = myEobj.parent.parent.parent.parent.getXmlNode();
    ColumnIndexToDelete = GetColumnCountForTable(myEobj, false);

    for (rowI = 0; rowI < TableActiveTable.childNodes.length; rowI++) {
        RowColumnIndexToInsert = 0;
        for (colI = 0; colI < TableActiveTable.childNodes[rowI].childNodes.length; colI++) {
            if (RowColumnIndexToInsert == ColumnIndexToDelete) {

                xmlmgr.process("deleteNode", TableActiveTable.childNodes[rowI], colI);
                aNotifyList[aNotifyList.length] = TableActiveTable.childNodes[rowI];
                break;
            }
            ColSpanOfCurrentCell = 1;
            if (utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan") != null) {
                ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan"));
            }
            RowColumnIndexToInsert = RowColumnIndexToInsert + ColSpanOfCurrentCell;
        }

    }
    xmlmgr.setNotify(aNotifyList);
    xmlmgr.closeTransaction();
    for (ihg = 0; ihg < aNotifyList.length; ihg++) {
        myEobj.root.alertChange(aNotifyList[ihg], null);
    }
}
function _widgetSetAttributeDelegated(MyEobj, EdxCommandCommandValue, EdxCommandAttributeValue, EdxCommandCommandValue2, EdxChildNodeName) {
    var editnode = MyEobj.getXmlNode();

    if (EdxChildNodeName != "") {
        for (chNi = 0; chNi < editnode.childNodes.length; chNi++) {
            if (editnode.childNodes[chNi].nodeName == EdxChildNodeName) {
                editnode = editnode.childNodes[chNi];
            }
        }
    }
    if (editnode.nodeName == "datacell") {
        TableAlterColumnAttribute(MyEobj, EdxCommandCommandValue, EdxCommandAttributeValue);
    }
}
function TableAlterColumnAttribute(myEobj, EdxCommandCommandValue, EdxCommandAttributeValue) {
    var TableActiveCell = myEobj.getXmlNode();
    TableActiveRow = myEobj.parent.parent.getXmlNode();
    TableActiveTable = myEobj.parent.parent.parent.parent.getXmlNode();
    ColumnIndexToInsert = GetColumnCountForTable(myEobj, false);
    var aNotifyList = new Array();
    var xmlmgr = myEobj.root.getXmlManager();
    xmlmgr.openTransaction(null);
    for (rowI = 0; rowI < TableActiveTable.childNodes.length; rowI++) {
        RowColumnIndexToInsert = 0;
        if (TableActiveTable.childNodes[rowI].nodeName != 'datatablecaption') {
            for (colI = 0; colI < TableActiveTable.childNodes[rowI].childNodes.length; colI++) {
                if (RowColumnIndexToInsert == ColumnIndexToInsert) {
                    for (AttI = 0; AttI < TableActiveTable.childNodes[rowI].childNodes[colI].attributes.length; AttI++) {
                        if (TableActiveTable.childNodes[rowI].childNodes[colI].attributes[AttI].nodeName == EdxCommandCommandValue) {
                            xmlmgr.process("updateNode", TableActiveTable.childNodes[rowI].childNodes[colI].attributes[AttI], EdxCommandAttributeValue);
                            aNotifyList[aNotifyList.length] = TableActiveTable.childNodes[rowI];
                        }
                    }
                    break;
                }
                ColSpanOfCurrentCell = 1;
                if (utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan") != null) {
                    ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan"));
                }
                RowColumnIndexToInsert = RowColumnIndexToInsert + ColSpanOfCurrentCell;
            } 
        }
    }
    xmlmgr.setNotify(aNotifyList);
    xmlmgr.closeTransaction();
    for (ihg = 0; ihg < aNotifyList.length; ihg++) {
        myEobj.root.alertChange(aNotifyList[ihg], null);
    }
}
function TablePasteColumn(EdxCommandCommandValue) {

    var aNotifyList = new Array();
    e = edxid.eobj.root.guiOwner;
    var xmlmgr = e.root.getXmlManager();
    xmlmgr.openTransaction(null);

    var TableActiveCell = edxid.eobj.root.aClipboardNodes[0].getXmlNode();
    TableActiveRow = edxid.eobj.root.aClipboardNodes[0].parent.parent.getXmlNode();
    TableActiveTable = edxid.eobj.root.aClipboardNodes[0].parent.parent.parent.parent.getXmlNode();

    var DropTableActiveCell = e.parent.getXmlNode();

    DropTableActiveRow = e.parent.parent.getXmlNode();
    DropTableActiveTable = e.parent.parent.parent.parent.getXmlNode();
    ColumnIndexToCopy = 0;
    if (TableActiveTable.childNodes.length != DropTableActiveTable.childNodes.length) {
        alert("Aantal rijen doeltabel (" + DropTableActiveTable.childNodes.length + ") komt niet overeen met het aantal rijen in de brontabel(" + TableActiveTable.childNodes.length + ")");
    }
    else {
        for (colI = 0; colI < TableActiveRow.childNodes.length; colI++) {
            if (TableActiveRow.childNodes[colI] == TableActiveCell) {
                break;
            }
            else {
                ColSpanOfCurrentCell = 1;
                if (utilGetXmlAttribute(TableActiveRow.childNodes[colI], "colspan") != null) {
                    ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveRow.childNodes[colI], "colspan"));
                }
                ColumnIndexToCopy = ColumnIndexToCopy + ColSpanOfCurrentCell;
            }
        }
        ColumnIndexToInsert = 0;

        for (colI = 0; colI < DropTableActiveRow.childNodes.length; colI++) {
            if (DropTableActiveRow.childNodes[colI] == DropTableActiveCell) {
                if (EdxCommandCommandValue == "right") {
                    ColSpanOfCurrentCell = 1;
                    if (utilGetXmlAttribute(DropTableActiveRow.childNodes[colI], "colspan") != null) {
                        ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(DropTableActiveRow.childNodes[colI], "colspan"));
                    }
                    ColumnIndexToInsert = ColumnIndexToInsert + ColSpanOfCurrentCell
                }
                break;
            }
            else {
                ColSpanOfCurrentCell = 1;
                if (utilGetXmlAttribute(DropTableActiveRow.childNodes[colI], "colspan") != null) {
                    ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(DropTableActiveRow.childNodes[colI], "colspan"));
                }
                ColumnIndexToInsert = ColumnIndexToInsert + ColSpanOfCurrentCell;
            }
        }

        for (rowI = 0; rowI < TableActiveTable.childNodes.length; rowI++) {
            RowColSourceIndex = 0;
            for (colI = 0; colI < TableActiveTable.childNodes[rowI].childNodes.length; colI++) {
                if (RowColSourceIndex >= ColumnIndexToCopy) {
                    RowColTargetIndex = 0;
                    insertIndex = -1;

                    for (colTargetI = 0; colTargetI < DropTableActiveTable.childNodes[rowI].childNodes.length; colTargetI++) {
                        if (RowColTargetIndex >= ColumnIndexToInsert) {
                            insertIndex = colTargetI;
                            break;
                        }
                        else {
                            ColSpanOfCurrentTargetCell = 1;
                            if (utilGetXmlAttribute(DropTableActiveTable.childNodes[rowI].childNodes[colTargetI], "colspan") != null) {
                                ColSpanOfCurrentTargetCell = parseInt(utilGetXmlAttribute(DropTableActiveTable.childNodes[rowI].childNodes[colTargetI], "colspan"));
                            }
                            RowColTargetIndex = RowColTargetIndex + ColSpanOfCurrentTargetCell;
                        }
                    }
                    if (insertIndex == -1)// ofwel achteraan invullen
                    {
                        insertIndex = DropTableActiveTable.childNodes[rowI].childNodes.length;
                    }

                    newNode = TableActiveTable.childNodes[rowI].childNodes[colI].cloneNode(true);

                    xmlmgr.process("insertNode", DropTableActiveTable.childNodes[rowI], newNode, insertIndex);
                    aNotifyList[aNotifyList.length] = DropTableActiveTable.childNodes[rowI];
                    for (iii = 0; iii < newNode.attributes.length; iii++) {
                        if (newNode.attributes[iii].nodeName == "XlinkId") {


                            xmlmgr.process("updateNode", newNode.attributes[iii], "");
                            aNotifyList[aNotifyList.length] = newNode;
                        }
                        if (newNode.attributes[iii].nodeName == "colspan") {

                            xmlmgr.process("updateNode", newNode.attributes[iii], "1");
                            aNotifyList[aNotifyList.length] = newNode;
                        }
                    }
                    e.root.alertChange(DropTableActiveTable.childNodes[rowI], e);
                    break;
                }
                else {
                    ColSpanOfCurrentCell = 1;
                    if (utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan") != null) {
                        ColSpanOfCurrentCell = parseInt(utilGetXmlAttribute(TableActiveTable.childNodes[rowI].childNodes[colI], "colspan"));
                    }
                    RowColSourceIndex = RowColSourceIndex + ColSpanOfCurrentCell;
                }
            }
        }
        xmlmgr.setNotify(aNotifyList);
        xmlmgr.closeTransaction();
        for (ihg = 0; ihg < aNotifyList.length; ihg++) {
            e.root.alertChange(aNotifyList[ihg], null);
        }
    }
}
function processClipboardDelegated(MyEobj, xmlmgr, aNotifyList, insertOffset) {

    blnCloseXmlManager = false;
    var ChangeNode = MyEobj.getXmlNode(); // geselecteerde node
    var ParentNode = MyEobj.parent.getXmlNode(); // container node
    InsertIndex = 0;
    if (insertOffset == null) {
        insertOffset = 0;
    }
    var sText = window.clipboardData.getData("Text");
    if (sText != "" && sText != null) {

        for (i = 0; i < ParentNode.childNodes.length; i++) // insertIndex opzoeken, dan weet je waar deinsert plaats moet vinden
        {
            if (ParentNode.childNodes[i] == ChangeNode) {
                InsertIndex = i + insertOffset;
                break;
            }
        }
        if (xmlmgr == null) {
            blnCloseXmlManager = true;
            var xmlmgr = MyEobj.root.getXmlManager();
            xmlmgr.openTransaction(null);
            var aNotifyList = new Array();
        }
        aNotifyList[aNotifyList.length] = ParentNode;
        rowArr = sText.split("\n")
        blnCheckTabs = true;
        if (shiftPressed) {
            rowArr = new Array(sText);
            blnCheckTabs = false;
        }




        RowTypeHeader = 1;
        RowTypeParagraph = 2;
        RowTypeList = 3;
        RowTypeTable = 4;
        LastRowType = -1; //laatste regel, onhouden voor header
        var MyNewNode = null;
        oldChar = "";
        if (ParentNode.nodeName == "column1" || ParentNode.nodeName == "column2" || ParentNode.nodeName == "column3" || ParentNode.nodeName == "column4" || ParentNode.nodeName == "column5" || ParentNode.nodeName == "datacell") {
            TemplateRowNode = edxid.getTemplateNodeWrapped(MyEobj, "datarow");
            TemplateCellNode = edxid.getTemplateNodeWrapped(MyEobj, "datacell");
            TemplateCellNode.appendChild(edxid.getTemplateNodeWrapped(MyEobj, "paragraph"))
            for (i = 0; i < rowArr.length; i++) {
                if (Trim(rowArr[i]) != "") {
                    if (rowArr[i].indexOf('\t') > -1 && blnCheckTabs == true) {
                        cellsplit = rowArr[i].split("\t");
                        introwCollCount = 0;
                        for (j = 0; j < cellsplit.length; j++) {
                            if (Trim(cellsplit[j]) != "") {
                                introwCollCount++;
                            }
                        }
                        strCol0 = Trim(cellsplit[0].replace(".", ""));
                        if ((introwCollCount == 2 && strCol0.length < 3) || ParentNode.nodeName == "datacell") {
                            // lijst
                            if (LastRowType != RowTypeList) {
                                if (MyNewNode != null) {
                                    xmlmgr.process("insertNode", ParentNode, MyNewNode, InsertIndex);
                                    MyNewNode = null;
                                    InsertIndex++;
                                }
                                TemplateNode = edxid.getTemplateNodeWrapped(MyEobj, "list"); // te inserten template opzoeken
                                MyNewNode = TemplateNode.cloneNode(true);
                                AddNode = MyNewNode;
                                strListAttribute = "Bullets";
                                oldChar = strCol0;
                                if (IsNumeric(strCol0) == true) {
                                    strListAttribute = "Numbers";
                                }
                                else {
                                    strAlfabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    if (strAlfabet.indexOf(strCol0) > -1) {
                                        strListAttribute = "Letters";
                                    }
                                }
                                utilSetXmlAttribute(MyNewNode, "layout", strListAttribute)
                            }
                            LastRowType = RowTypeList;
                            if (utilGetXmlAttribute(MyNewNode, "layout") == "Bullets" & strCol0 != oldChar) {
                                TemplateNode = edxid.getTemplateNodeWrapped(MyEobj, "list"); // te inserten template opzoeken
                                MyNewAddNode = TemplateNode.cloneNode(true);
                                AddNode.appendChild(MyNewAddNode);
                                AddNode = MyNewAddNode;
                            }
                            oldChar = strCol0;
                            TemplateNodeListitem = edxid.getTemplateNodeWrapped(MyEobj, "listitem"); // te inserten template opzoeken
                            MyNewListItemNode = TemplateNodeListitem.cloneNode(true);
                            if (introwCollCount == 2) {
                                utilUpdateXmlNodeValue(MyNewListItemNode, Trim(cellsplit[1]));
                            }
                            else {
                                strReplaceTextConcatinated = "";
                                for (iijd = 1; iijd < cellsplit.length; iijd++) {
                                    strReplaceTextConcatinated = strReplaceTextConcatinated + " " + cellsplit[iijd];
                                }
                                strReplaceTextConcatinated = Trim(strReplaceTextConcatinated);
                                utilUpdateXmlNodeValue(MyNewListItemNode, strReplaceTextConcatinated);
                            }
                            if (AddNode != null) {
                                AddNode.appendChild(MyNewListItemNode);
                            }
                        }
                        else {
                            if (LastRowType != RowTypeTable) {
                                if (MyNewNode != null) {
                                    xmlmgr.process("insertNode", ParentNode, MyNewNode, InsertIndex);
                                    MyNewNode = null;
                                    InsertIndex++;
                                }
                                TemplateNode = edxid.getTemplateNodeWrapped(MyEobj, "datatable"); // te inserten template opzoeken
                                MyNewNode = TemplateNode.cloneNode(true);

                            }
                            LastRowType = RowTypeTable;

                            ActiveRow = TemplateRowNode.cloneNode(true);
                            cellsplit = rowArr[i].split("\t");
                            for (j = 0; j < cellsplit.length; j++) {
                                ActiveCell = TemplateCellNode.cloneNode(true);
                                utilUpdateXmlNodeValue(ActiveCell.childNodes[0], cellsplit[j]);
                                ActiveRow.appendChild(ActiveCell);

                            }
                            MyNewNode.appendChild(ActiveRow);


                        }

                    }
                    else {
                        // geen tabel of lijst, altijd toevoegen als niet null
                        if (MyNewNode != null) {
                            xmlmgr.process("insertNode", ParentNode, MyNewNode, InsertIndex);
                            MyNewNode = null;
                            InsertIndex++;
                        }
                        if (LastRowType != RowTypeHeader & rowArr[i].length < 35) {
                            LastRowType = RowTypeHeader;
                            TemplateNode = edxid.getTemplateNodeWrapped(MyEobj, "header"); // te inserten template opzoeken
                        }
                        else {
                            LastRowType = RowTypeParagraph;
                            TemplateNode = edxid.getTemplateNodeWrapped(MyEobj, "paragraph"); // te inserten template opzoeken
                        }
                        MyNewNode = TemplateNode.cloneNode(true);
                        utilUpdateXmlNodeValue(MyNewNode, Trim(rowArr[i]));
                        xmlmgr.process("insertNode", ParentNode, MyNewNode, InsertIndex);
                        MyNewNode = null;
                        InsertIndex++;
                    }
                }
            }
            if (MyNewNode != null) // bij slechts een item werd tabel en listitem niet geinsert, dus ff checken of dat misschien wel moet.
            {
                xmlmgr.process("insertNode", ParentNode, MyNewNode, InsertIndex);
                MyNewNode = null;
                InsertIndex++;
            }
        }
        else {

            NewTemplateNode = edxid.getTemplateNodeWrapped(MyEobj, MyEobj.getXmlNode().nodeName, false);
            if (NewTemplateNode.childNodes[0].nodeType == 3) {
                for (i = 0; i < rowArr.length; i++) {
                    newInsertNode = NewTemplateNode.cloneNode(true);
                    innerText = Trim(rowArr[i]);
                    if (innerText.length > 0) {
                        utilUpdateXmlNodeValue(newInsertNode, innerText);
                        xmlmgr.process("insertNode", ParentNode, newInsertNode, InsertIndex);
                        aNotifyList[aNotifyList.length] = newInsertNode;
                    }
                    InsertIndex++;
                }
            }
        }
        if (blnCloseXmlManager == true) {
            xmlmgr.setNotify(aNotifyList);
            xmlmgr.closeTransaction();
            for (ihg = 0; ihg < aNotifyList.length; ihg++) {
                MyEobj.root.alertChange(aNotifyList[ihg], null);
            }
        }
        return aNotifyList;
    }
}

function _rootImportXml() {
    selectElement = "frame"
    strContainerMatches = "";
    if (this.guiOwner) {
        var e = this.guiOwner.parent.parent;
        var v = e.root.getView();
        a = v.getContainerMatches(e.edxtemplate);

        if (a.length > 0) {
            for (i = 0; i < a.length; i++) {
                var oMatch = a[i];
                var ttemp = v.getTemplate(oMatch.edxtemplate);
                selectInsertNode = ttemp.selectSingleNode("edx:insert");
                if (i < a.length - 1) {
                    strContainerMatches += oMatch.edxtemplate + "|";
                }
                else {
                    strContainerMatches += oMatch.edxtemplate;
                }
            }
        } 
    }
    strXML = window.showModalDialog("Import.aspx?StructureNodeId=" + structureNodeId + "&CheckStructureHistory=true&ContainerMatches=" + strContainerMatches, "", "dialogWidth:800px;dialogHeight: 600px;resizable:yes;") //xml opvragen
    //alert(strXML);

    if (strXML != "" && strXML != null) {
        strXML = replaceAll(strXML, '&amp;#38;', '&#38;');
        strXML = replaceAll(strXML, '&amp;#60;', '&#60;');
        var eObjInsert = null;
        var eParentObjInsert = null;
        var joXml = getDOMDocument();
        joXml.async = false;
        joXml.validateOnParse = false;
        joXml.loadXML(strXML);
        var oSelection = null;
        eParent = this.guiOwner.parent.parent;
        e = this.guiOwner.parent;
        selectedNode = e.getXmlNode();
        blnIsTabContainer = false;  //testen of tab geselecteerd is, standaard false
        if (selectedNode) {
            if (selectedNode.nodeName == "tab1" || selectedNode.nodeName == "tab2" || selectedNode.nodeName == "tab3") {
                blnIsTabContainer = true;
            }
        }

        editnode = eParent.getXmlNode();
        if (joXml.documentElement.nodeName == "nodelist" && this.guiOwner.widget) {

            var eObjInsert = e;
            var eParentObjInsert = eParent;
            oSelection = joXml.selectNodes("//nodelist/*");

        }
        strParentToFind = 'bodycont';
        if (editnode.nodeName == "tab1") {
            strParentToFind = "tabcont1";
        }
        if (editnode.nodeName == "tab2") {
            strParentToFind = "tabcont2";
        }
        if (editnode.nodeName == "tab3") {
            strParentToFind = "tabcont3";
        }
        if (this.guiOwner.widget && joXml.documentElement.nodeName != "nodelist") // container insert
        {

            if (editnode.nodeName == 'body') {
                if (blnIsTabContainer == false) {
                    var eObjInsert = e;
                    var eParentObjInsert = eParent;
                }
                else {
                    if (selectedNode.nodeName == "tab1") {
                        strParentToFind = "tabcont1";
                    }
                    if (selectedNode.nodeName == "tab2") {
                        strParentToFind = "tabcont2";
                    }
                    if (selectedNode.nodeName == "tab3") {
                        strParentToFind = "tabcont3";
                    }
                }
                oSelection = joXml.selectNodes("//frame");
            }
            if (editnode.nodeName == 'column1' || editnode.nodeName == 'column2' || editnode.nodeName == 'column3' || editnode.nodeName == 'column4' || editnode.nodeName == 'column5') {
                if (strXML.indexOf('worksheetname') > 0) {
                    var eObjInsert = e;
                    var eParentObjInsert = eParent;
                    oSelection = joXml.selectNodes("//column1/*");
                }
                else {
                    if (editnode.parentNode.parentNode.nodeName == "tab1" || editnode.parentNode.parentNode.nodeName == "tab2" || editnode.parentNode.parentNode.nodeName == "tab3") {
                        var eObjInsert = e.parent.parent.parent;
                        var eParentObjInsert = e.parent.parent.parent.parent;
                        oSelection = joXml.selectNodes("//frame");
                    }
                }
            }
        }
        if (eObjInsert == null) {
            oSelection = joXml.selectNodes("//frame");
            this.aClipboardNodes = new Array();
            // body element ophaleb
            keyArrVB = this.dIDs.Keys;
            for (iccp = 0; iccp < this.dIDs.Count; iccp++)   //Iterate the dictionary.
            {
                e = this.dIDs.Item(keyArrVB[iccp]);
                if (e.edxtemplate == strParentToFind) {
                    var eParentObjInsert = e;
                    var eObjInsert = e.childNodes[0];
                }
            }
        }
        if (eObjInsert == null) // null, probeer of je tab1 kan vinden
        {
            oSelection = joXml.selectNodes("//frame");
            this.aClipboardNodes = new Array();
            // body element ophaleb
            keyArrVB = this.dIDs.Keys;
            for (iccp = 0; iccp < this.dIDs.Count; iccp++)   //Iterate the dictionary.
            {
                e = this.dIDs.Item(keyArrVB[iccp]);
                if (e.edxtemplate == 'tabcont1') {
                    var eParentObjInsert = e;
                    var eObjInsert = e.childNodes[0];
                }
            }
        }
        var aNotifyList = new Array();
        var xmlmgr = this.root.getXmlManager();
        xmlmgr.openTransaction(editnode);
        with (eParentObjInsert) {
            var v = root.getView();
            // get position of element to insert after
            var uid = eObjInsert.hobj.uniqueID;
            var iNsertIndexS;
            var children = hobj.childNodes;
            if (children.length > 0) {
                for (iNsertIndexS = 0; iNsertIndexS < children.length; iNsertIndexS++) {
                    if (children[iNsertIndexS].uniqueID == uid)
                        break;
                }
                if (iNsertIndexS == children.length) {
                    err("Error: couldn't find child to insert after in parent container");
                    return;
                }
            }
            else {
                iNsertIndexS = 0;
            }
            // insert the XML node
            var editnode = getXmlNode();
            aNotifyList[aNotifyList.length] = editnode;
            for (myI = oSelection.length - 1; myI > -1; myI--) //omgekeerd invoegen ivm boven invoegen
            {
                strXml = oSelection.item(myI).xml;
                var joXml = getDOMDocument();
                joXml.async = false;
                joXml.validateOnParse = false;
                joXml.loadXML(strXml);
                var x = joXml.documentElement;
                if (joXml.documentElement.nodeName == "frame") {
                    var t = v.getTemplate("frame");
                    var a = v.getDisplays(t);
                    blnFoundView = false;
                    for (i = 0; i < a.length; i++) {
                        if (a[i] == "Normaal 2 Koloms") {
                            blnFoundView = true;
                        }
                    }
                    if (blnFoundView == false) {
                        strXml = strXml.replace("Normaal 2 Koloms", "Normaal 1 Koloms")
                        joXml.loadXML(strXml);
                        x = joXml.documentElement;
                    }
                    //				var a = v.getDisplays( e.parent.getTemplate() );
                }
                // get XML fragment to insert
                if (x == null) {
                    err("Error: couldn't load XML insertion fragment for template " + sTemplate);
                    return;
                }
                xmlmgr.process("insertNode", editnode, x, iNsertIndexS);
                aNotifyList[aNotifyList.length] = x;
                // insert seed node into HTML tree
                var tag = x.nodeName;
                var node = createNode(tag, iNsertIndexS);
                // insert the fragment
                tag = hobj.tagName;
                if (tag == "TBODY") {
                    utilInsertRowAt(hobj, node, iNsertIndexS);
                }
                else if (tag == "TR") {
                    utilInsertCellAt(hobj, node, iNsertIndexS);
                }
                else {
                    if (hobj.childNodes.length > 0) {
                        hobj.childNodes[iNsertIndexS].insertAdjacentHTML("beforeBegin", node.xml);
                    }
                    else {
                        hobj.innerHTML = node.xml;
                    }
                }

                // and do the association
                childNodes[iNsertIndexS].associate(hobj.childNodes[iNsertIndexS]);
                performAssociation(hobj.childNodes[iNsertIndexS]);

                // see if we need to clean up empty container placeholder
                if (bEmpty && childNodes.length == 2) {
                    deleteChild(childNodes[1]);
                }
                bEmpty = false;
            }
        }
        // alert about changes
        xmlmgr.setNotify(aNotifyList);
        xmlmgr.closeTransaction();
        for (ihg = 0; ihg < aNotifyList.length; ihg++) {
            this.root.alertChange(aNotifyList[ihg], null);
        }
    }
}
function _regionTestViewState(editnode, viewState, strTemplateName) {
    if (editnode != null) {
        if (editnode.nodeName == "datatable" && strTemplateName == "datatable" && viewState == null) {

            oSelection = editnode.selectNodes("datarow/datacell");
            if (oSelection.length < 25) {
                viewState = "rsi.edx.aanpassen";

            }
            else {
                viewState = "rsi.menu.file.preview";
            }
        }
    }
    return viewState;
}

