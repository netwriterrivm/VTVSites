<!-- Templates ten behoeve van het opbouwen van het kruimelpad -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template match="root|object_class" mode="content_pane_title">
		<!-- Display label -->
		<xsl:param name="xhtml_display_label">
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
   
			<xsl:choose>
			<xsl:when test="@class_title_on='1' or  name()='root'">
				<xsl:element name="h{$header_top_level}">
					<xsl:choose>
						<xsl:when test="@object_class_title!=''">
							<xsl:value-of select="@object_class_title"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$xhtml_display_label"/>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:element>
			</xsl:when>
			<xsl:otherwise>

			</xsl:otherwise>
		</xsl:choose>
</xsl:template>
	

</xsl:stylesheet>

