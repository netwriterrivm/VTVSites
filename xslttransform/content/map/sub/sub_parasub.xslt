<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="sub" mode="parasub"><xsl:for-each select="child::*|text()"><sub><xsl:value-of select="self::text()"></xsl:value-of></sub></xsl:for-each></xsl:template>
</xsl:stylesheet>