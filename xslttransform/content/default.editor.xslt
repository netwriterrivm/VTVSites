<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
  <xsl:param name="XlinkId"></xsl:param>
  <xsl:param name="nodeName"></xsl:param>
  <xsl:param name="parentlabel"></xsl:param>
  <xsl:param name="content_fragment_type"></xsl:param>
  <xsl:param name="releaseoutputmode"></xsl:param>
  <xsl:param name="releaseoutputextension">3</xsl:param>
  <xsl:include href="content.common.xslt"/>
  <xsl:include href=".common.xslt"/>
  <xsl:include href="../netwriter.common/xml/general.xslt" />
  <xsl:include href="../netwriter.common/textfunctions.xslt" />
  <xsl:include href="../netwriter.common/formatdate.xslt" />
  <xsl:include href="../netwriter.common/url.xslt" />
  <xsl:include href="default.editor_included.xslt" />
  <xsl:include href="../netwriter.common/xml/xhtml_templates.xslt" />
  <xsl:output method="xml"  omit-xml-declaration="yes" />
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$nodeName!='' and $XlinkId!=''">
        <xsl:choose>
          <xsl:when test="$nodeName='documenttitle'">
            <xsl:apply-templates mode="documenttitle" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image_partner'">
            <xsl:apply-templates mode="link_object_binary_image_partner" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='frame'">
            <xsl:apply-templates mode="frame" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='framemenu'">
            <xsl:apply-templates mode="framemenu" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column1'">
            <xsl:apply-templates mode="column1" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column1'">
            <xsl:apply-templates mode="column1" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='topicallead'">
            <xsl:apply-templates mode="topicallead" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='topicallead'">
            <xsl:apply-templates mode="topicallead" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_language'">
            <xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='bold'">
            <xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='italic'">
            <xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='bold'">
            <xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='italic'">
            <xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='super'">
            <xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='super'">
            <xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='sub'">
            <xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='sub'">
            <xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='header'">
            <xsl:apply-templates mode="header" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='header'">
            <xsl:apply-templates mode="header" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_language'">
            <xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='super'">
            <xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='sub'">
            <xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_reference'">
            <xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='reference'">
            <xsl:apply-templates mode="reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='reference'">
            <xsl:apply-templates mode="reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_reference'">
            <xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition_short'">
            <xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definition'">
            <xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definition'">
            <xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition_short'">
            <xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition'">
            <xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definition'">
            <xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definition'">
            <xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition'">
            <xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_class'">
            <xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_class'">
            <xsl:apply-templates mode="object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_class'">
            <xsl:apply-templates mode="object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_icon'">
            <xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_class'">
            <xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_document'">
            <xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_document'">
            <xsl:apply-templates mode="object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_document'">
            <xsl:apply-templates mode="object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_icon'">
            <xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_document'">
            <xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map'">
            <xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_map'">
            <xsl:apply-templates mode="object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_map'">
            <xsl:apply-templates mode="object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_icon'">
            <xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map'">
            <xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_url'">
            <xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_url'">
            <xsl:apply-templates mode="object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_url'">
            <xsl:apply-templates mode="object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_icon'">
            <xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_url'">
            <xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_code_file'">
            <xsl:apply-templates mode="link_code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='code_file'">
            <xsl:apply-templates mode="code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='code_file'">
            <xsl:apply-templates mode="code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_icon'">
            <xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_code_file'">
            <xsl:apply-templates mode="link_code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_pdf'">
            <xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_binary'">
            <xsl:apply-templates mode="object_binary" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_binary'">
            <xsl:apply-templates mode="object_binary" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_pdf'">
            <xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='paragraph'">
            <xsl:apply-templates mode="paragraph" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='paragraph'">
            <xsl:apply-templates mode="paragraph" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_language'">
            <xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='bold'">
            <xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='italic'">
            <xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='super'">
            <xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='sub'">
            <xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_reference'">
            <xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition_short'">
            <xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition'">
            <xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_class'">
            <xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_document'">
            <xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map'">
            <xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_url'">
            <xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_code_file'">
            <xsl:apply-templates mode="link_code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_pdf'">
            <xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image'">
            <xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datatable'">
            <xsl:apply-templates mode="datatable" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datatable'">
            <xsl:apply-templates mode="datatable" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datarow'">
            <xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datarow'">
            <xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datacell'">
            <xsl:apply-templates mode="datacell" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datacell'">
            <xsl:apply-templates mode="datacell" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='list'">
            <xsl:apply-templates mode="list" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image'">
            <xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datarow'">
            <xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datarow'">
            <xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definitionlist'">
            <xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='caption'">
            <xsl:apply-templates mode="caption" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='caption'">
            <xsl:apply-templates mode="caption" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='bold'">
            <xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_language'">
            <xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='super'">
            <xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='sub'">
            <xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_reference'">
            <xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition_short'">
            <xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_definition'">
            <xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_class'">
            <xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_document'">
            <xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map'">
            <xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_url'">
            <xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_pdf'">
            <xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='italic'">
            <xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map_swf'">
            <xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map_swf'">
            <xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='content'">
            <xsl:apply-templates mode="content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='content'">
            <xsl:apply-templates mode="content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_wuc'">
            <xsl:apply-templates mode="object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_wuc'">
            <xsl:apply-templates mode="object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_external'">
            <xsl:apply-templates mode="object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='object_external'">
            <xsl:apply-templates mode="object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='subgroup'">
            <xsl:apply-templates mode="subgroup" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='subgroup'">
            <xsl:apply-templates mode="subgroup" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image'">
            <xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='datatable'">
            <xsl:apply-templates mode="datatable" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map_swf'">
            <xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='dotnetcontrol'">
            <xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='media_player'">
            <xsl:apply-templates mode="media_player" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='box'">
            <xsl:apply-templates mode="box" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='dotnetcontrol'">
            <xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='banner'">
            <xsl:apply-templates mode="banner" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='media_player'">
            <xsl:apply-templates mode="media_player" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column2'">
            <xsl:apply-templates mode="column2" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column2'">
            <xsl:apply-templates mode="column2" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image'">
            <xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definitionlist'">
            <xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map_swf'">
            <xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='dotnetcontrol'">
            <xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='media_player'">
            <xsl:apply-templates mode="media_player" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column3'">
            <xsl:apply-templates mode="column3" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column3'">
            <xsl:apply-templates mode="column3" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image'">
            <xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definitionlist'">
            <xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map_swf'">
            <xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='dotnetcontrol'">
            <xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='media_player'">
            <xsl:apply-templates mode="media_player" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column4'">
            <xsl:apply-templates mode="column4" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='column4'">
            <xsl:apply-templates mode="column4" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_binary_image'">
            <xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='definitionlist'">
            <xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_map_swf'">
            <xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_content'">
            <xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_wuc'">
            <xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='link_object_external'">
            <xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='dotnetcontrol'">
            <xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:when test="$nodeName='media_player'">
            <xsl:apply-templates mode="media_player" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates mode="body" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="@IsAdded='True'">
            <ins>
              <span class="addeditem">
                <xsl:if test="count(/kompasdocument/documentheader/child::node())>0">
                  <div class="textDocumentHeader">
                    <xsl:apply-templates mode="documentheadercontainer" select="/kompasdocument/documentheader"></xsl:apply-templates>
                  </div>
                </xsl:if>
                <div class="textDocumentBody">
                  <xsl:apply-templates mode="body" select="/kompasdocument/body"></xsl:apply-templates>
                </div>
              </span>
            </ins>
          </xsl:when>
          <xsl:when test="@IsDeleted='True'">
            <del>
              <span class="deleteditem">
                <xsl:if test="count(/kompasdocument/documentheader/child::node())>0">
                  <div class="textDocumentHeader">
                    <xsl:apply-templates mode="documentheadercontainer" select="/kompasdocument/documentheader"></xsl:apply-templates>
                  </div>
                </xsl:if>
                <div class="textDocumentBody">
                  <xsl:apply-templates mode="body" select="/kompasdocument/body"></xsl:apply-templates>
                </div>
              </span>
            </del>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="count(/kompasdocument/documentheader/child::node())>0">
              <div class="textDocumentHeader">
                <xsl:apply-templates mode="documentheadercontainer" select="/kompasdocument/documentheader"></xsl:apply-templates>
              </div>
            </xsl:if>
            <div class="textDocumentBody">
              <xsl:apply-templates mode="body" select="/kompasdocument/body"></xsl:apply-templates>
            </div>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>