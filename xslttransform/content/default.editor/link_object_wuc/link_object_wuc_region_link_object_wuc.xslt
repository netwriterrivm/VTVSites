<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="link_object_wuc" mode="region_link_object_wuc"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:apply-templates mode="para_object_wuc" select="."></xsl:apply-templates></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:apply-templates mode="para_object_wuc" select="."></xsl:apply-templates></span></del></xsl:when><xsl:otherwise><xsl:apply-templates mode="para_object_wuc" select="."></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>