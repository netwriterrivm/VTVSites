<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="frame" mode="body_linklist_container_match_frame"><xsl:apply-templates mode="framemenu" select="framemenu"></xsl:apply-templates></xsl:template>
</xsl:stylesheet>