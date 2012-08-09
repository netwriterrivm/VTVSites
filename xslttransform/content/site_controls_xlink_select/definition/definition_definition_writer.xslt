<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="definition" mode="definition_writer"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:variable name="href">#definition_<xsl:value-of select="@definition_id"></xsl:value-of></xsl:variable><xsl:variable name="title"><xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates></xsl:variable><a class="nw_uo_popup textDefinition" title="{$title}" href="{$href}"><xsl:value-of select="@editor_label"></xsl:value-of></a></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:variable name="href">#definition_<xsl:value-of select="@definition_id"></xsl:value-of></xsl:variable><xsl:variable name="title"><xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates></xsl:variable><a class="nw_uo_popup textDefinition" title="{$title}" href="{$href}"><xsl:value-of select="@editor_label"></xsl:value-of></a></span></del></xsl:when><xsl:otherwise><xsl:variable name="href">#definition_<xsl:value-of select="@definition_id"></xsl:value-of></xsl:variable><xsl:variable name="title"><xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates></xsl:variable><a class="nw_uo_popup textDefinition" title="{$title}" href="{$href}"><xsl:value-of select="@editor_label"></xsl:value-of></a></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>