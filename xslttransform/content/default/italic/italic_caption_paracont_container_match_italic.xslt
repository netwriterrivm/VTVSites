<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="italic" mode="caption_paracont_container_match_italic"><em class="textEmphasis"><xsl:apply-templates mode="paraitalic" select="."></xsl:apply-templates></em></xsl:template>
</xsl:stylesheet>