<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="list" mode="list"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem">  <xsl:if test="@layout='Bullets'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Nobullets'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Arrows'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Numbers'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Letters'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem">  <xsl:if test="@layout='Bullets'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Nobullets'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Arrows'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Numbers'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Letters'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if></span></del></xsl:when><xsl:otherwise>  <xsl:if test="@layout='Bullets'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Nobullets'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Arrows'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Numbers'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if>  <xsl:if test="@layout='Letters'"><xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
</xsl:if></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>