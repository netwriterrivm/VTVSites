<!-- Algemene templates  -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als text-->
		<!--Todo include bovenliggende functies-->
	<!-- Template voor uitvoer pagina titel, gebruikt in Title Element -->
	<xsl:output method="text"  omit-xml-declaration="yes" />
		<xsl:template match="code_file|object_class|root|object_document" mode="pagetitle"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn"><xsl:value-of select="@root_name"/><xsl:value-of select="@code_file_name"/><xsl:value-of select="@object_class_title"/><xsl:value-of select="@object_map_label"/><xsl:value-of select="@object_document_label"/></xsl:with-param>
				<xsl:with-param name="charsIn" select="'&quot;'" />
				<xsl:with-param name="charsOut" select="' '" />
			</xsl:call-template><xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id!='22'"> - <xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_name"/></xsl:if></xsl:template>
	<!-- Todo object_binray xhtml -->
</xsl:stylesheet>
