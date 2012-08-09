<!-- Templates ten behoeve van het vullen van de Content placeholder Extra -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />

	<!--Content placeholder -->
	<xsl:template name="CPHMetaNavigation">
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Class name van het linker menu -->
		<xsl:param name="object_class_name_left"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>service_menu_left</xsl:param>
		<!-- Class name van het rechter menu -->
		<xsl:param name="object_class_name_right"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>service_menu_right</xsl:param>
		<!-- Aantal linkerberm contentblokken-->
		<xsl:param name="left_menu_count" select="count(/rsistructurenode/menustructurenodes/objectcollection/descendant::object_class[@object_class_name=$object_class_name_left]/*)"></xsl:param>
		<!-- Aantal linkerberm contentblokken-->
		<xsl:param name="right_menu_count" select="count(/rsistructurenode/menustructurenodes/objectcollection/descendant::object_class[@object_class_name=$object_class_name_right]/*)"></xsl:param>
		<!-- Placeholder alleen op root level uitvoeren-->
		
		<xsl:if test="$right_menu_count>0 or $left_menu_count>0">
			<div class="func_links" id="service_menu">
				<h3>Service menu</h3>
				<xsl:if test="$right_menu_count>0">
					<ul class="right">
						<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::object_class[@object_class_name=$object_class_name_right]/*" mode="xhtml_link_list">
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="show_authors" select="'false'"></xsl:with-param>
							<xsl:with-param name="display_childs" select="'false'"></xsl:with-param>
													<xsl:with-param name="firstposition" select="position()=1" />
						<xsl:with-param name="lastposition" select="position()=last()" />
						</xsl:apply-templates>
					</ul>
				</xsl:if>
        
    
        
				<xsl:if test="$left_menu_count>0">
          
					<ul class="left">
						<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::object_class[@object_class_name=$object_class_name_left]/*"  mode="xhtml_link_list">
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="show_authors" select="'false'"></xsl:with-param>
							<xsl:with-param name="display_childs" select="'false'"></xsl:with-param>
													<xsl:with-param name="firstposition" select="position()=1" />
						<xsl:with-param name="lastposition" select="position()=last()" />
						</xsl:apply-templates>
					</ul>
				</xsl:if>
			</div>
		</xsl:if>
		<xsl:if test="$releaseoutputmode='1'">
			<!-- tbv xml editor-->
		 <xsl:comment>
			 &lt;link href="/NetWriterGui/css/NWJSMenuPopup.css" type="text/css" rel="stylesheet" /&gt;
			 &lt;link href="/VTVSites/css/netwriter.css" type="text/css" rel="stylesheet" /&gt;
		     &lt;link href="/VTVSites/css/type.css" type="text/css" rel="stylesheet" /&gt;
	         &lt;link id="ctl00_NetWriterStyles" rel="stylesheet" href="/VTVSites/css/netwritereditor.css" type="text/css" media="screen" /&gt;
			 &lt;script src="/VTVSites/javascript/zorgatlas.js" type="text/javascript"&gt;&lt;/script&gt;
			 
		</xsl:comment>
			 
      </xsl:if>
	</xsl:template>
</xsl:stylesheet>
