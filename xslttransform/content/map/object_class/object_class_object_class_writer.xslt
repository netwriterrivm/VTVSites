<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="object_class" mode="object_class_writer"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:apply-templates mode="xhtml_link_text" select="."><xsl:with-param name="show_netwriter_classes">true</xsl:with-param></xsl:apply-templates></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:apply-templates mode="xhtml_link_text" select="."><xsl:with-param name="show_netwriter_classes">true</xsl:with-param></xsl:apply-templates></span></del></xsl:when><xsl:otherwise><xsl:apply-templates mode="xhtml_link_text" select="."><xsl:with-param name="show_netwriter_classes">true</xsl:with-param></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>