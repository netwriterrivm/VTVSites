<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="paragraph" mode="paragraph"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem">  <xsl:if test="@layout='paragraph'"><p><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_start'"><p class="nw_break_start"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_end'"><p class="nw_break_end"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_none'"><p class="nw_inline"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem">  <xsl:if test="@layout='paragraph'"><p><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_start'"><p class="nw_break_start"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_end'"><p class="nw_break_end"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_none'"><p class="nw_inline"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if></span></del></xsl:when><xsl:otherwise>  <xsl:if test="@layout='paragraph'"><p><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_start'"><p class="nw_break_start"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_end'"><p class="nw_break_end"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if>  <xsl:if test="@layout='break_none'"><p class="nw_inline"><xsl:apply-templates mode="paracont" select="."></xsl:apply-templates></p>
</xsl:if></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>