<!-- Templates ten behoeve van het vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template name="CPHHeader">
			<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<xsl:param name="description" ><xsl:choose><xsl:when test="/rsistructurenode/currentstructurenode/activenode/object_class/@object_class_title_alt!=''">
					<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_class/@object_class_title_alt" />
				</xsl:when>
				<xsl:otherwise><xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="pagetitle"/></xsl:otherwise></xsl:choose></xsl:param>
    <xsl:param name="keywords" ><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_name"></xsl:value-of><xsl:for-each select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::*[@object_type_id='23' or @object_type_id='2' or @object_type_id='5' or @object_type_id='6' or @object_type_id='8']">
    <xsl:text>, </xsl:text><xsl:apply-templates mode="xhtml_display_label" select=".">
        <xsl:sort select="@structure_left" data-type="number"/>
      </xsl:apply-templates>
    </xsl:for-each></xsl:param> 
    <!-- Parameter voor toevoegen van gegenereerde css. O.a. in gebruik voor regionale kompassen.-->
    <xsl:param name="linkgeneratedcss">/NetWriterGui/dynamic/map_index/1/<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@root_id" />/0/0/1/<xsl:value-of select="$structure_id" />/default.css</xsl:param>
		  <xsl:choose>
      <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/contenttemplates/@render_meta_keywords='true'"><xsl:text disable-output-escaping="yes">&lt;meta name="keywords" 
      content="</xsl:text><xsl:value-of select="$keywords"/><xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]" mode ="xhtml_meta_keyword"></xsl:apply-templates><xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='9' or @object_type_id='10' or @object_type_id='11' or @object_type_id='12']" mode ="xhtml_meta_keyword"></xsl:apply-templates><xsl:text disable-output-escaping="yes">"/&gt;</xsl:text></xsl:when>
      <xsl:otherwise><meta name="keywords" content="{$keywords}" /></xsl:otherwise>
    </xsl:choose>
		<meta name="distribution" content="global" />
		<meta name="robots" content="index, follow" />
		<meta name="language" content="nl" />	
		<!--Todo inbouwen keywords/description tags.-->
		
    <!-- Klap in klap uit functionaliteit -->
		<xsl:text disable-output-escaping="yes">&lt;script type="text/javascript" src="</xsl:text><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@application_path"/><xsl:text disable-output-escaping="yes">javascript/nw_foldable.js" &gt;&lt;/script&gt;</xsl:text>
		
    <!---In NetWriter context links naar de NetWriter GUI scripting opnemen -->
		<xsl:if test="$releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode='5'">
			  <!-- Uitvoer als tekst, ivm het feit dat zelfsluitdende script tags niet werken in xhtml strict-->
			  <xsl:text disable-output-escaping="yes">
			  &lt;script type="text/javascript" src="/NetWriterGui/javascript/include.js" &gt;&lt;/script&gt;
			  <!--&lt;script type="text/javascript" src="/NetWriterGui/javascript/include_netwriter_ui.js" &gt;&lt;/script&gt;-->
			  &lt;script type="text/javascript" src="/NetWriterGui/javascript/GetResource.aspx"&gt;&lt;/script&gt;			 
        </xsl:text>
			  <link rel="stylesheet" type="text/css" media="all" href="/NetWriterGui/css/NWJSMenuPopup.css" />
		  </xsl:if>
    
    <!-- AddThis toevoegen aan de bovenkant van de pagina, wanneer het wordt toegevoegd in de middenberm wordt dit gedaan in content.xslt. Zie ook AddThis.xslt en de sitexml.-->
		<xsl:if test="count(/rsistructurenode/currentstructurenode/siteconfig/layout/addthis)>0">
      <xsl:call-template name="addthisheader"/>
    </xsl:if>
    
    <!--Extra javascript uit de siteconfig-xml toevoegen:-->
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/header/js_includes/js_include" mode="xhtml_js_link"></xsl:apply-templates>
    
    <!-- include voor kaarten, deze worden alleen door VTV gebruikt-->
		<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id='5' or /rsistructurenode/currentstructurenode/structure/@object_type_id='8'">
			<xsl:text disable-output-escaping="yes">
			  &lt;script type="text/javascript" src="/VTVSites/javascript/zorgatlas.js" &gt;&lt;/script&gt;
      </xsl:text>
		  <link rel="stylesheet" href="/VTVSites/css/zorgatlas.css" type="text/css" media="screen" />
    </xsl:if>
    
    <!--Extra css uit de siteconfig-xml toevoegen:-->
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/layout/css_includes/css_include" mode="xhtml_css_link"></xsl:apply-templates>

    <!-- Gegenereerde css toevoegen. O.a. in gebruik voor regionale kompassen.-->
    <xsl:choose>
      <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@generate-css='true' and ($releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode='5')">
        <link rel="stylesheet" href="{$linkgeneratedcss}" type="text/css" media="screen" />
      </xsl:when>
      <xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@generate-css='true' and ($releaseoutputmode='2' or $releaseoutputmode='3' ) ">
		  <xsl:choose>
			  <xsl:when test="/rsistructurenode/currentstructurenode/root/@root_local_path!=''"><link rel="stylesheet" href="/{/rsistructurenode/currentstructurenode/root/@root_local_path}/generated_css_site_xml.css" type="text/css" media="screen" /></xsl:when>
			  <xsl:otherwise><link rel="stylesheet" href="/generated_css_site_xml.css" type="text/css" media="screen" /></xsl:otherwise>
		  </xsl:choose>
        
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
    
	</xsl:template>

</xsl:stylesheet>

