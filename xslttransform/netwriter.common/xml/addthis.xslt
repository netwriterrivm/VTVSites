<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="addthis" mode="addthis">
    <div class="freemefromothercontent"><span>.</span></div>
    <div class="addthis_toolbox addthis_default_style">
      <xsl:if test="@show_facebook='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_facebook</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_linkedin='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_linkedin</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_twitter='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_twitter</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_hyves='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_hyves</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_nujij='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_nujij</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_yammer='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_yammer</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_email='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_email</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_print='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_google</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="@show_more='true'"><xsl:call-template name="addthis_item"><xsl:with-param name="cssclass">addthis_button_more</xsl:with-param></xsl:call-template></xsl:if>
    </div>
  </xsl:template>
    <xsl:template name="addthis_item">
      <xsl:param name="cssclass"></xsl:param>
      <xsl:text disable-output-escaping="yes">
        &lt;a class="</xsl:text><xsl:value-of select="$cssclass"></xsl:value-of><xsl:text disable-output-escaping="yes">"&gt;&lt;/a&gt;
      </xsl:text>
      </xsl:template>
  <xsl:template name="addthisheader">  
    <script type="text/javascript">var addthis_config = {"data_track_clickback":true}; </script>
    <script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4e01ddf56af99280"></script>
    <script type="text/javascript"> var addthis_config = { ui_508_compliant: true } </script>
  </xsl:template>
  
</xsl:stylesheet>
