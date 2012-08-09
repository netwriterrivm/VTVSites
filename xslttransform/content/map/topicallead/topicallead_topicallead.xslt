<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="topicallead" mode="topicallead"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><p class="textTopicLead intro"><xsl:apply-templates mode="topicalleadcont" select="."></xsl:apply-templates></p></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><p class="textTopicLead intro"><xsl:apply-templates mode="topicalleadcont" select="."></xsl:apply-templates></p></span></del></xsl:when><xsl:otherwise><p class="textTopicLead intro"><xsl:apply-templates mode="topicalleadcont" select="."></xsl:apply-templates></p></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>