<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="object_binary" mode="link_object_binary_image_para_link_object_binary_image_container_match_object_binary"><xsl:apply-templates mode="object_binary_image_writer" select="."></xsl:apply-templates></xsl:template>
</xsl:stylesheet>