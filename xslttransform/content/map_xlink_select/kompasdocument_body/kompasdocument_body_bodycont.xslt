<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="/kompasdocument/body" mode="bodycont"><xsl:for-each select="child::*|text()"><xsl:apply-templates mode="frame" select="self::frame"></xsl:apply-templates></xsl:for-each></xsl:template>
</xsl:stylesheet>