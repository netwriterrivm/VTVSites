<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="super" mode="caption_captioncont_container_match_super"><xsl:if test="count(child::*)>0  or count(child::text())>0"><xsl:apply-templates mode="parasuper" select="."></xsl:apply-templates></xsl:if></xsl:template>
</xsl:stylesheet>