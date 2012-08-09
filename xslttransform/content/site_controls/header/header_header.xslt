<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="header" mode="header"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem">  <xsl:if test="@level=''"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+1}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='1'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='1rs'"><h2 class="kb_rsheader"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@level='2'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+1}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='3'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+2}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem">  <xsl:if test="@level=''"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+1}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='1'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='1rs'"><h2 class="kb_rsheader"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@level='2'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+1}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='3'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+2}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if></span></del></xsl:when><xsl:otherwise>  <xsl:if test="@level=''"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+1}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='1'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='1rs'"><h2 class="kb_rsheader"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@level='2'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+1}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if>  <xsl:if test="@level='3'"><xsl:variable name="header_level"><xsl:choose><xsl:when test="$content_fragment_type='map'">1</xsl:when><xsl:otherwise>2</xsl:otherwise></xsl:choose></xsl:variable>
<xsl:element name="h{$header_level+2}"><xsl:apply-templates mode="headercont" select="."></xsl:apply-templates></xsl:element>
</xsl:if></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>