<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="banner" mode="banner"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:if test="@XlinkId!='' and $releaseoutputmode='1'"><xsl:text disable-output-escaping="yes">&lt;div id="</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">"  onmouseenter ="setXlinkStyle('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">',true)"  onmouseleave="setXlinkStyle('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">',false)" onclick="selectXlinkNode('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">');" class="xsltaddxlinkselector_parent"&gt;</xsl:text></xsl:if><div><xsl:attribute name="class">mod banner hl_<xsl:value-of select="@color"></xsl:value-of></xsl:attribute><a><xsl:attribute name="href"><xsl:apply-templates select="link_object/*[position()=1]" mode="url"></xsl:apply-templates></xsl:attribute><xsl:apply-templates mode="link_object_binary_image" select="link_image/link_object_binary_image[position()=1]"></xsl:apply-templates><xsl:value-of select="content"></xsl:value-of></a></div><xsl:if test="@XlinkId!='' and $releaseoutputmode='1'"><xsl:text disable-output-escaping="yes">&lt;div class="xsltaddxlinkselector_parent_cleardiv"&gt;</xsl:text><xsl:comment>DNC</xsl:comment><xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text></xsl:if></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:if test="@XlinkId!='' and $releaseoutputmode='1'"><xsl:text disable-output-escaping="yes">&lt;div id="</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">"  onmouseenter ="setXlinkStyle('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">',true)"  onmouseleave="setXlinkStyle('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">',false)" onclick="selectXlinkNode('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">');" class="xsltaddxlinkselector_parent"&gt;</xsl:text></xsl:if><div><xsl:attribute name="class">mod banner hl_<xsl:value-of select="@color"></xsl:value-of></xsl:attribute><a><xsl:attribute name="href"><xsl:apply-templates select="link_object/*[position()=1]" mode="url"></xsl:apply-templates></xsl:attribute><xsl:apply-templates mode="link_object_binary_image" select="link_image/link_object_binary_image[position()=1]"></xsl:apply-templates><xsl:value-of select="content"></xsl:value-of></a></div><xsl:if test="@XlinkId!='' and $releaseoutputmode='1'"><xsl:text disable-output-escaping="yes">&lt;div class="xsltaddxlinkselector_parent_cleardiv"&gt;</xsl:text><xsl:comment>DNC</xsl:comment><xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text></xsl:if></span></del></xsl:when><xsl:otherwise><xsl:if test="@XlinkId!='' and $releaseoutputmode='1'"><xsl:text disable-output-escaping="yes">&lt;div id="</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">"  onmouseenter ="setXlinkStyle('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">',true)"  onmouseleave="setXlinkStyle('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">',false)" onclick="selectXlinkNode('</xsl:text><xsl:value-of select="@XlinkId"/><xsl:text disable-output-escaping="yes">');" class="xsltaddxlinkselector_parent"&gt;</xsl:text></xsl:if><div><xsl:attribute name="class">mod banner hl_<xsl:value-of select="@color"></xsl:value-of></xsl:attribute><a><xsl:attribute name="href"><xsl:apply-templates select="link_object/*[position()=1]" mode="url"></xsl:apply-templates></xsl:attribute><xsl:apply-templates mode="link_object_binary_image" select="link_image/link_object_binary_image[position()=1]"></xsl:apply-templates><xsl:value-of select="content"></xsl:value-of></a></div><xsl:if test="@XlinkId!='' and $releaseoutputmode='1'"><xsl:text disable-output-escaping="yes">&lt;div class="xsltaddxlinkselector_parent_cleardiv"&gt;</xsl:text><xsl:comment>DNC</xsl:comment><xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text></xsl:if></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>