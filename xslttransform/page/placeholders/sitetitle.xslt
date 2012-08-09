<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template name="CPHSiteTitle">
	<!-- Alleen uitvoer als dit in de site configuratie aangegeven is. -->
			<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/header/@show_sitename='true'">
				<div class="title_bar">
					<xsl:choose>
						<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='0'">
					<h1>
						<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/header/@external_title"/>
						<xsl:text> </xsl:text>
						<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/header/@slogan!=''">
							<em>
								<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/header/@slogan"/>
							</em>
						</xsl:if>
					</h1></xsl:when>
						<xsl:otherwise><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/header/@external_title"/>
						<xsl:text> </xsl:text>
						<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/header/@slogan!=''">
							<em>
								<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/header/@slogan"/>
							</em>
						</xsl:if></xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:if>

	</xsl:template>

</xsl:stylesheet>

