<!-- Templates ten behoeve van de  begrippenlijst-->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<xsl:include href="meta.lists.xslt"/>
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	
	<!-- Rendering van een afbeelding, afgezien van de default rendering wordt ook gekeken of er in de editor een link aangelegd is-->
	<xsl:template match="/" >
			  <xsl:apply-templates select="referencecollection"  mode="literatuur" />
	</xsl:template>
</xsl:stylesheet>