<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="sub" mode="header_headercont_container_match_sub"><xsl:if test="count(child::*)>0 or  count(child::text())>0"><xsl:apply-templates mode="parasub" select="."></xsl:apply-templates></xsl:if></xsl:template>
</xsl:stylesheet>