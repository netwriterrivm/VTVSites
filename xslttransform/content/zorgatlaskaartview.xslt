<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:param name="XlinkId"></xsl:param>
	<xsl:param name="nodeName"></xsl:param>
	<xsl:param name="parentlabel"></xsl:param>
	<xsl:param name="content_fragment_type">default</xsl:param>
	<xsl:param name="releaseoutputmode"></xsl:param>
	<xsl:param name="releaseoutputextension">3</xsl:param>
	<xsl:include href="content.common.xslt"/>
	<xsl:include href="default.common.xslt"/>
	<xsl:include href="../netwriter.common/xml/general.xslt" />
	<xsl:include href="../netwriter.common/textfunctions.xslt" />
	<xsl:include href="../netwriter.common/formatdate.xslt" />
	<xsl:include href="../netwriter.common/url.xslt" />
	<xsl:include href="../netwriter.common/xml/xhtml_templates.xslt" />
	<xsl:template match="/">
		<xsl:apply-templates mode="xhtml_default" select="//frame[1]/column1/link_object_binary_image/object_binary">
		</xsl:apply-templates>
		<xsl:apply-templates mode="region_link_object_map_swf" select="//frame[1]/column1/link_object_map_swf"></xsl:apply-templates>
	</xsl:template>
	
</xsl:stylesheet>