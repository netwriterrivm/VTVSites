<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="documentheader" mode="documentheadercontainer"><xsl:for-each select="child::*|text()"><xsl:apply-templates mode="documenttitle" select="self::documenttitle"></xsl:apply-templates><xsl:apply-templates mode="documentheader_documentheadercontainer_container_match_link_object_binary_image_partner" select="self::link_object_binary_image_partner"></xsl:apply-templates></xsl:for-each></xsl:template>
</xsl:stylesheet>