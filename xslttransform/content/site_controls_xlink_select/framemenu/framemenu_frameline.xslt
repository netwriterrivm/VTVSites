<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="framemenu" mode="frameline"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem">  <xsl:if test="@layout='hidden'"></xsl:if>  <xsl:if test="@layout='hidden_line'"><hr class="textLine"></hr>
</xsl:if>  <xsl:if test="@layout='visible_newline'"><hr class="textLine"></hr>
</xsl:if>  <xsl:if test="@layout='visible_newline_noline'"></xsl:if>  <xsl:if test="@layout='visible_noline'"></xsl:if>  <xsl:if test="@layout='visible'"><hr class="textLine"></hr>
</xsl:if></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem">  <xsl:if test="@layout='hidden'"></xsl:if>  <xsl:if test="@layout='hidden_line'"><hr class="textLine"></hr>
</xsl:if>  <xsl:if test="@layout='visible_newline'"><hr class="textLine"></hr>
</xsl:if>  <xsl:if test="@layout='visible_newline_noline'"></xsl:if>  <xsl:if test="@layout='visible_noline'"></xsl:if>  <xsl:if test="@layout='visible'"><hr class="textLine"></hr>
</xsl:if></span></del></xsl:when><xsl:otherwise>  <xsl:if test="@layout='hidden'"></xsl:if>  <xsl:if test="@layout='hidden_line'"><hr class="textLine"></hr>
</xsl:if>  <xsl:if test="@layout='visible_newline'"><hr class="textLine"></hr>
</xsl:if>  <xsl:if test="@layout='visible_newline_noline'"></xsl:if>  <xsl:if test="@layout='visible_noline'"></xsl:if>  <xsl:if test="@layout='visible'"><hr class="textLine"></hr>
</xsl:if></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>