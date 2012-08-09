<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="definition" mode="definition_short_writer"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:variable name="href">
			#definition_<xsl:value-of select="@definition_id"></xsl:value-of></xsl:variable><xsl:variable name="title"><xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates></xsl:variable><xsl:choose><xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'"><abbr title="{$title}"><span title="{$title}" class="notion"><xsl:choose><xsl:when test="@definition_name!=''"><xsl:value-of select="@definition_name"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="@editor_label"></xsl:value-of></xsl:otherwise></xsl:choose></span></abbr></xsl:when><xsl:otherwise><abbr title="{$title}"><span title="{$title}" class="notion"><a class="nw_uo_popup" title="{$title}" href="{$href}"><xsl:choose><xsl:when test="@definition_name!=''"><xsl:value-of select="@definition_name"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="@editor_label"></xsl:value-of></xsl:otherwise></xsl:choose></a></span></abbr></xsl:otherwise></xsl:choose></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:variable name="href">
			#definition_<xsl:value-of select="@definition_id"></xsl:value-of></xsl:variable><xsl:variable name="title"><xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates></xsl:variable><xsl:choose><xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'"><abbr title="{$title}"><span title="{$title}" class="notion"><xsl:choose><xsl:when test="@definition_name!=''"><xsl:value-of select="@definition_name"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="@editor_label"></xsl:value-of></xsl:otherwise></xsl:choose></span></abbr></xsl:when><xsl:otherwise><abbr title="{$title}"><span title="{$title}" class="notion"><a class="nw_uo_popup" title="{$title}" href="{$href}"><xsl:choose><xsl:when test="@definition_name!=''"><xsl:value-of select="@definition_name"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="@editor_label"></xsl:value-of></xsl:otherwise></xsl:choose></a></span></abbr></xsl:otherwise></xsl:choose></span></del></xsl:when><xsl:otherwise><xsl:variable name="href">
			#definition_<xsl:value-of select="@definition_id"></xsl:value-of></xsl:variable><xsl:variable name="title"><xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates></xsl:variable><xsl:choose><xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'"><abbr title="{$title}"><span title="{$title}" class="notion"><xsl:choose><xsl:when test="@definition_name!=''"><xsl:value-of select="@definition_name"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="@editor_label"></xsl:value-of></xsl:otherwise></xsl:choose></span></abbr></xsl:when><xsl:otherwise><abbr title="{$title}"><span title="{$title}" class="notion"><a class="nw_uo_popup" title="{$title}" href="{$href}"><xsl:choose><xsl:when test="@definition_name!=''"><xsl:value-of select="@definition_name"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="@editor_label"></xsl:value-of></xsl:otherwise></xsl:choose></a></span></abbr></xsl:otherwise></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>