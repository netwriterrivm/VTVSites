<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="documentheader" mode="kompasdocument_kompasdocumentcontainer_container_match_documentheader"><div class="textDocumentHeader"><xsl:apply-templates mode="documentheader" select="."></xsl:apply-templates></div></xsl:template>
</xsl:stylesheet>