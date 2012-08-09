<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template name="CPHSiteFooter">
		<div class="footer">
			<div class="ref">


				<xsl:choose>
					<xsl:when test="count(/rsistructurenode/currentstructurenode/siteconfig/footers/site_footer/object_binary)>0">
						<xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/footers/site_footer/object_binary" mode="xhtml_default">
							<xsl:with-param name="classname">nw_site_footer</xsl:with-param>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@colorset='netwriter' or /rsistructurenode/currentstructurenode/siteconfig/layout/@colorset='netwriter netwriter_opensource'">				
					</xsl:when>
					
					<xsl:otherwise>
				    <img src="{/rsistructurenode/currentstructurenode/siteconfig/layout/@application_path}logos/RO_footer.png" alt="" height="25" width="500" />		
					</xsl:otherwise>
				</xsl:choose>
				
			</div>
			<xsl:text disable-output-escaping="yes">&lt;span&gt;&lt;/span&gt;</xsl:text>
		</div>
	</xsl:template>

</xsl:stylesheet>

