<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="link_object_url" mode="para_link_object_url"><xsl:for-each select="child::*|text()"><xsl:apply-templates mode="nw_editor" select="self::text()"></xsl:apply-templates><xsl:apply-templates mode="link_object_url_para_link_object_url_container_match_object_url" select="self::object_url"></xsl:apply-templates><xsl:apply-templates mode="link_object_url_para_link_object_url_container_match_link_object_binary_icon" select="self::link_object_binary_icon"></xsl:apply-templates></xsl:for-each></xsl:template>
</xsl:stylesheet>