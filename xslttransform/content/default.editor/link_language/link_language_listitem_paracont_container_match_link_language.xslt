<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="link_language" mode="listitem_paracont_container_match_link_language"><span class="nw_editor_language_change"><xsl:apply-templates mode="languagecont_with_links" select="."></xsl:apply-templates></span></xsl:template>
</xsl:stylesheet>