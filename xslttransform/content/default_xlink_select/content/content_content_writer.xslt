<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="content" mode="content_writer"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem">
		[getFragment(<xsl:value-of select="@content_id"></xsl:value-of>,<xsl:value-of select="@XlinkIdLinked"></xsl:value-of>)]
	</span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem">
		[getFragment(<xsl:value-of select="@content_id"></xsl:value-of>,<xsl:value-of select="@XlinkIdLinked"></xsl:value-of>)]
	</span></del></xsl:when><xsl:otherwise>
		[getFragment(<xsl:value-of select="@content_id"></xsl:value-of>,<xsl:value-of select="@XlinkIdLinked"></xsl:value-of>)]
	</xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>