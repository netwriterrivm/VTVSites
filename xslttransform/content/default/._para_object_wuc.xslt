<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="." mode="para_object_wuc"><xsl:for-each select="child::*|text()"><xsl:value-of select="self::text()"></xsl:value-of><xsl:apply-templates mode="._para_object_wuc_container_match_object_wuc" select="self::object_wuc"></xsl:apply-templates></xsl:for-each></xsl:template>
</xsl:stylesheet>