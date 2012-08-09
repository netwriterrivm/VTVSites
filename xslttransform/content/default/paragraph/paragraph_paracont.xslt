<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
  <xsl:template match="paragraph" mode="paracont">
    <xsl:for-each select="child::*|text()">
      <xsl:value-of select="self::text()"></xsl:value-of>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_super" select="self::super"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_sub" select="self::sub"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_code_file" select="self::link_code_file"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>