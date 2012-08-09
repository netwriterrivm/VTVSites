<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<!-- Classname is een attribuut uit de siteconfig.-->
	<xsl:template name="CPHSiteLogo">
		<xsl:param name="logoclassname">
      <xsl:choose>
					  <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@classname!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@classname"/></xsl:when> <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@position!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@position"/></xsl:when>
					  <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:param>
		  <xsl:choose>
			<!-- Als homepage en geen site logo dan is de header niet aanklikbaar en moet de titel van de site ook uitgevoerd worden, de header is de titel van de pagina-->
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/header/@show_sitename='false' and /rsistructurenode/currentstructurenode/structure/@structure_level='0'"><xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/object_binary" mode="xhtml_default">
					<xsl:with-param name="classname"><xsl:choose>
					    <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@classname!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@classname"/></xsl:when>  <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@position!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@position"/></xsl:when>
					    <xsl:otherwise></xsl:otherwise></xsl:choose></xsl:with-param>
				</xsl:apply-templates><h1><xsl:apply-templates mode="xhtml_display_label" select="/rsistructurenode/currentstructurenode/root"></xsl:apply-templates></h1></xsl:when>
			<xsl:otherwise>
				<!-- in alle andere gevallen is deze wel aanklikbaar-->
				<a title="{/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/object_binary/@object_binary_label}" class="{$logoclassname}">
				<xsl:attribute name="href">
					<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logourl/."/>
				</xsl:attribute>
				<xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/object_binary" mode="xhtml_default">
					<xsl:with-param name="classname"><xsl:choose>
					    <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@classname!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@classname"/></xsl:when>  <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@position!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/logoimage/@position"/></xsl:when>
					    <xsl:otherwise></xsl:otherwise></xsl:choose></xsl:with-param>
				</xsl:apply-templates>
			</a></xsl:otherwise>
	</xsl:choose>
		
		
		
	</xsl:template>

</xsl:stylesheet>

