<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="/kompasdocument/body" mode="body"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:variable name="id"><xsl:text>al_</xsl:text><xsl:value-of select="@XlinkId"></xsl:value-of></xsl:variable><span id="{$id}" class="outputModeHeaderPrint authorlistprintversion"><xsl:comment>DNC</xsl:comment></span><xsl:variable name="childcount" select="count(descendant::framemenu[@layout='visible_newline' or @layout='visible_newline_noline'])"></xsl:variable><xsl:choose><xsl:when test="$childcount>0"><ul class="kb_linklist"><xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates></ul></xsl:when><xsl:otherwise><xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates></xsl:otherwise></xsl:choose><xsl:apply-templates mode="bodycont" select="."></xsl:apply-templates></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:variable name="id"><xsl:text>al_</xsl:text><xsl:value-of select="@XlinkId"></xsl:value-of></xsl:variable><span id="{$id}" class="outputModeHeaderPrint authorlistprintversion"><xsl:comment>DNC</xsl:comment></span><xsl:variable name="childcount" select="count(descendant::framemenu[@layout='visible_newline' or @layout='visible_newline_noline'])"></xsl:variable><xsl:choose><xsl:when test="$childcount>0"><ul class="kb_linklist"><xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates></ul></xsl:when><xsl:otherwise><xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates></xsl:otherwise></xsl:choose><xsl:apply-templates mode="bodycont" select="."></xsl:apply-templates></span></del></xsl:when><xsl:otherwise><xsl:variable name="id"><xsl:text>al_</xsl:text><xsl:value-of select="@XlinkId"></xsl:value-of></xsl:variable><span id="{$id}" class="outputModeHeaderPrint authorlistprintversion"><xsl:comment>DNC</xsl:comment></span><xsl:variable name="childcount" select="count(descendant::framemenu[@layout='visible_newline' or @layout='visible_newline_noline'])"></xsl:variable><xsl:choose><xsl:when test="$childcount>0"><ul class="kb_linklist"><xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates></ul></xsl:when><xsl:otherwise><xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates></xsl:otherwise></xsl:choose><xsl:apply-templates mode="bodycont" select="."></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>