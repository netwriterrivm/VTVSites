<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="." mode="subgroup_container"><xsl:for-each select="child::*|text()"><xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates><xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates><xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates><xsl:apply-templates mode="._subgroup_container_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates><xsl:apply-templates mode="._subgroup_container_container_match_datatable" select="self::datatable"></xsl:apply-templates><xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates><xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates><xsl:apply-templates mode="._subgroup_container_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates><xsl:apply-templates mode="._subgroup_container_container_match_link_content" select="self::link_content"></xsl:apply-templates><xsl:apply-templates mode="._subgroup_container_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates><xsl:apply-templates mode="._subgroup_container_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates></xsl:for-each></xsl:template>
</xsl:stylesheet>