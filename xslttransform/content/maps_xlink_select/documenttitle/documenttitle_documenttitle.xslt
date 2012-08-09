<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="documenttitle" mode="documenttitle"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem">  <xsl:if test="@layout='Titel onderwerp'">
<h2 class="textClass"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@layout='Titel rubriek'">
<h2 class="textSection"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@layout='Titel document'">
<h1 class="textTitle"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h1>
</xsl:if></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem">  <xsl:if test="@layout='Titel onderwerp'">
<h2 class="textClass"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@layout='Titel rubriek'">
<h2 class="textSection"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@layout='Titel document'">
<h1 class="textTitle"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h1>
</xsl:if></span></del></xsl:when><xsl:otherwise>  <xsl:if test="@layout='Titel onderwerp'">
<h2 class="textClass"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@layout='Titel rubriek'">
<h2 class="textSection"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h2>
</xsl:if>  <xsl:if test="@layout='Titel document'">
<h1 class="textTitle"><xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates></h1>
</xsl:if></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>