<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="link_object_binary_icon" mode="para_link_object_binary_image"><xsl:for-each select="child::*|text()"><xsl:value-of select="self::text()"></xsl:value-of><xsl:apply-templates mode="link_object_binary_icon_para_link_object_binary_image_container_match_object_binary" select="self::object_binary"></xsl:apply-templates></xsl:for-each></xsl:template>
</xsl:stylesheet>