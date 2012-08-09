<!-- Templates ten behoeve van het vullen van de Content placeholder voor de printversie -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
  <!--Rendederen als xml-->
  <xsl:output method="xml"  omit-xml-declaration="yes" />
  <!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
  <xsl:template name="CPHPrintversion">
    <!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
    <xsl:param name="leaf_link_mode">content</xsl:param>
    <!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
    <xsl:param name="show_netwriter_classes">false</xsl:param>
    <!-- Knooppunt id van het actieve knooppunt-->
    <xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
    <!-- Header Level-->
    <xsl:param name="header_top_level">2</xsl:param>
    <!-- printversionmode, is current of de eerste afwijkende mode die gevonden wordt-->
    <xsl:param name="printversionmode">
      <xsl:choose>
        <xsl:when test="count(/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version[@mode!='current'])>0">
          <xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version[@mode!='current']/@mode"/>
        </xsl:when>
        <xsl:otherwise>current</xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <!-- niet uitvoeren in NetWriter en voor de hele site ivp performance!!-->
    <xsl:if test="$releaseoutputmode!='1' and $releaseoutputmode!='4' and $releaseoutputmode!='5' and /rsistructurenode/currentstructurenode/structure/@object_type_id!='22' and $printversionmode!='current'">
      <div id="hoofd_content" class="line margin_top_5 nw_color_table nw_content_seperator">
        <xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version[@mode!='current']" mode="printversion"></xsl:apply-templates>
        <xsl:comment>dnc</xsl:comment>
        <script type="text/javascript">window.print();</script>
        <xsl:call-template name="sitestat_counter"><xsl:with-param name="show_objectid" select="'no'"/><xsl:with-param name="add_print_version">true</xsl:with-param></xsl:call-template>
      </div>
    </xsl:if>
  </xsl:template>
  <xsl:template match="print_version" mode="printversion">
    <!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
    <xsl:param name="leaf_link_mode">content</xsl:param>
    <!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
    <xsl:param name="show_netwriter_classes">false</xsl:param>
    <!-- Knooppunt id van het actieve knooppunt-->
    <xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
    <!-- Header Level-->
    <xsl:param name="header_top_level">2</xsl:param>
    <!-- printversionmode, is current of de eerste afwijkende mode die gevonden wordt-->
    <xsl:if test="@display_link='all' or @display_link=/rsistructurenode/currentstructurenode/structure/@structure_id">
      
    <xsl:choose>
          <xsl:when test="@mode='current'">
            <!-- Printversie huidige pagina -->
            <!-- Wordt via de standaard css geregeld-->
          </xsl:when>

          <xsl:when test="@mode='children'">
            <!-- Printversie huidige onderwerp, dus met direct onderliggende pagina's -->
            <xsl:apply-templates mode="printversion" select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]">
              <xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
              <xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
              <xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
              <xsl:with-param name="displaychilds">false</xsl:with-param>
            </xsl:apply-templates>
            <xsl:call-template name="printversion_bronnenliteratuur">
              <xsl:with-param name="listmode">children</xsl:with-param>
            </xsl:call-template>
          </xsl:when>

          <xsl:when test="@mode='descendants'">
            <!-- Printversie alles onder huidig onderwerp-->
            <xsl:apply-templates mode="printversion" select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$structure_id]">
              <xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
              <xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
              <xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
              <xsl:with-param name="displaychilds">true</xsl:with-param>
            </xsl:apply-templates>
            <xsl:call-template name="printversion_bronnenliteratuur">
              <xsl:with-param name="listmode">descendants</xsl:with-param>
            </xsl:call-template>
          </xsl:when>

          <xsl:otherwise>
            <!-- Geen printversie-->
          </xsl:otherwise>
        </xsl:choose>
    </xsl:if>
  </xsl:template>
  <xsl:template match="object_class|code_file|root" mode="printversion">
    <!-- Knooppunt id van het actieve knooppunt-->
    <!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
    <xsl:param name="leaf_link_mode">content</xsl:param>
    <!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
    <xsl:param name="show_netwriter_classes">false</xsl:param>
    <!-- Knooppunt id van het actieve knooppunt-->
    <xsl:param name="structure_id" select="@structure_id"/>
    <!-- Header Level-->
    <xsl:param name="header_top_level">2</xsl:param>
    <!-- Geeft aan of onderliggende content ook uitgevoerd moet worden-->
    <xsl:param name="displaychilds" >false</xsl:param>
	<!-- Titel -->
				<xsl:apply-templates mode ="content_pane_title" select="self::object_class|self::root">
					<xsl:with-param name="header_top_level">1</xsl:with-param>
				</xsl:apply-templates>
    <xsl:apply-templates select="*[@object_type_id='2' or @object_type_id='5' or @object_type_id='6' or @object_type_id='8' or @object_type_id='9']" mode="xhtml_default">
      <xsl:with-param name="editor_enabled" select="'false'" />
      <xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
      <xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
      <xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
    </xsl:apply-templates>
    <!--Structure level is bescherming voor de server-->
    <xsl:if test="$displaychilds='true' and /rsistructurenode/currentstructurenode/structure/@structure_level>1">

      <xsl:apply-templates mode="printversion" select="*[@object_type_id='23' or @object_type_id='53']">
        <xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
        <xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
        <xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
        <xsl:with-param name="displaychilds" select="$displaychilds"></xsl:with-param>
      </xsl:apply-templates>
    </xsl:if>
  </xsl:template>

  <xsl:template name="printversion_bronnenliteratuur">
    <xsl:param name="listmode">children</xsl:param>
    <xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_reference_list='true'">
      <netwriter_list type="reference" template="lijst_bronnen_literatuur" structure_id="{/rsistructurenode/currentstructurenode/structure/@structure_id}" mode="{$listmode}" />
    </xsl:if>
    <xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_definition_list='true'">
      <netwriter_list type="definition" template="lijst_afkortingen_definities" structure_id="{/rsistructurenode/currentstructurenode/structure/@structure_id}" mode="{$listmode}" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="printversion_toolbox">
    <xsl:param name="object_type_id" select="/rsistructurenode/currentstructurenode/structure/@object_type_id"></xsl:param>
    <xsl:param name="links_available"><xsl:choose><xsl:when test="count(/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version[@display_link='all' or @display_link=/rsistructurenode/currentstructurenode/structure/@structure_id])>0">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:param>
    <xsl:param name="object_type_check"><xsl:choose>
      <xsl:when test="$object_type_id='2' or $object_type_id='6'or $object_type_id='5' or $object_type_id='8'"><xsl:choose>
        <xsl:when test="count(/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version[@mode='current' and @display_link='all'])=0 and   count(/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version[@mode='current' and @display_link=/rsistructurenode/currentstructurenode/structure/@structure_id])=0">false</xsl:when>
        <xsl:otherwise>true</xsl:otherwise></xsl:choose></xsl:when>
      <xsl:otherwise>true</xsl:otherwise>
    </xsl:choose>
    </xsl:param>
    
    <xsl:if test="$links_available='true' and $object_type_check='true'">

      <div class="toolbox">
        <ul>
          <xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/layout/functional_links/print_version"    mode="printversion_toolbox"></xsl:apply-templates>
          <xsl:comment>dnc</xsl:comment>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>
  <xsl:template match="print_version" mode="printversion_toolbox">
    <xsl:param name="object_type_id" select="/rsistructurenode/currentstructurenode/structure/@object_type_id"></xsl:param>
    <xsl:param name="url"><xsl:choose>
        <xsl:when test="@mode='current'">javascript:window.print()</xsl:when>
      <xsl:when test="@mode='current' and ($releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode!='5')"></xsl:when>
        <xsl:otherwise>?printversion=true</xsl:otherwise>
      </xsl:choose></xsl:param>
    <xsl:param name="title"><xsl:choose>
        <xsl:when test="@mode='current'">Print deze pagina</xsl:when>
        <xsl:when test="@mode='children'">Print huidige en direct onderliggende pagina's</xsl:when>
        <xsl:otherwise>Print huidige en alle onderliggende pagina's</xsl:otherwise>
      </xsl:choose><xsl:if test="$url=''"> - werkt alleen op de werbsite!!</xsl:if></xsl:param>
    <xsl:param name="label"><xsl:choose>
        <xsl:when test="@mode='current'">Print (deze pagina)</xsl:when>
        <xsl:when test="@mode='children'">Print (deze en direct onderliggend)</xsl:when>
        <xsl:otherwise>Print deze en onderliggende pagina's</xsl:otherwise>
      </xsl:choose></xsl:param>
    <xsl:param name="class"><xsl:choose>
        <xsl:when test="@mode='current'">print</xsl:when>
        <xsl:when test="@mode='children'">print_all</xsl:when>
        <xsl:otherwise>print_all_and_more</xsl:otherwise>
      </xsl:choose> <xsl:if test="@mode!='current' and $url!=''"> nw_target_blank</xsl:if><xsl:if test="$url=''"> disabled</xsl:if></xsl:param>
    <xsl:param name="display_object_type"><xsl:choose>
        <xsl:when test="($object_type_id='2' or $object_type_id='6'or $object_type_id='5' or $object_type_id='8') and @mode='current'">true</xsl:when>
      <xsl:when test="($object_type_id='2' or $object_type_id='6'or $object_type_id='5' or $object_type_id='8') and @mode!='current'">false</xsl:when>
      <xsl:otherwise>true</xsl:otherwise>
    </xsl:choose></xsl:param>
    <!--todo styling-->
    <!--todo test alleen dit knooppunt-->
    
    <xsl:if test="(@display_link='all' or @display_link=/rsistructurenode/currentstructurenode/structure/@structure_id) and $display_object_type='true'">
    <li >
     <a class="{$class}" href="{$url}" title="{$title}">
        <xsl:value-of select="$label"></xsl:value-of>
      </a>
    </li></xsl:if>
  </xsl:template>
</xsl:stylesheet>

