<!--  Algemene templates  -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
  <xsl:include href="addthis.xslt" />
  <!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	
	<!-- Default rendering van een binary object-->
	<xsl:template match="object_binary" mode="xhtml_default">
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Eventueel is de alt tag te overrulen -->
		<xsl:param name="alttag">
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Type binary -->
		<xsl:param name="object_binary_type_id" select="@object_binary_type_id"></xsl:param>
		<!-- SRC -->
		<xsl:param name="src">
			<xsl:apply-templates select="." mode="url"></xsl:apply-templates>
		</xsl:param>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- te zoeken object_type voor de settings-->
		<xsl:param name="object_type_settings">{<xsl:value-of select="@object_type_id"/>}</xsl:param>
		<!-- Editor enabled-->
		<xsl:param name="editor_enabled">false</xsl:param>
		<!-- Template dat gebruikt moet worden-->
		<xsl:param name="xslt_template_path"></xsl:param>
		<!-- Content objecttypeid-->
		<xsl:param name="content_object_type_id">28</xsl:param>
		<!-- Template pad dat echt gebruikt gaat worden, afhankelijk van doorgegeven waarde -->
		<xsl:param name="real_xslt_template_path"><xsl:choose>
			<xsl:when test="$xslt_template_path!=''"><xsl:value-of select="$xslt_template_path"/></xsl:when>
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/contenttemplates/template[contains(@object_type_id,$object_type_settings)]"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/contenttemplates/template[contains(@object_type_id,$object_type_settings)]/@path"/></xsl:when>
			<xsl:otherwise>/Rijksbreed/xslttransform/content/default.xslt</xsl:otherwise>
		</xsl:choose></xsl:param>
		<xsl:choose>
			<xsl:when test="@object_binary_type_id='1' or @object_binary_type_id='2' or @object_binary_type_id='4' or @object_binary_type_id='11'">
				<img  src="{$src}" >
					<xsl:if test="$classname!=''">
						<xsl:attribute name="class">
							<xsl:value-of select="$classname"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$alttag!=''">
						<xsl:attribute name="alt">
								<xsl:value-of select="$alttag"/>
							</xsl:attribute>
					</xsl:if>
					<xsl:if test="@click_zone_id>0">
							<xsl:attribute name="usemap">
								<xsl:text>#clickzone</xsl:text><xsl:value-of select="@click_zone_id" />
							</xsl:attribute>
					</xsl:if>
				</img>
			</xsl:when>
			<xsl:when test="(@object_binary_type_id=12 or @object_binary_type_id=13) and (/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@display_binary_content='true')">
				<xsl:if test="/rsistructurenode/@outputmode='1'">
					-- begin Office content --		
				</xsl:if>
				<GetContent object_type_id="{$content_object_type_id}" object_id="{@object_binary_id}" xlinkid="" xlinkmatch="" parenttitle="" releaseoutputextension="" editor_enabled="{$editor_enabled}" xslt_stylesheet="{$real_xslt_template_path}" structure_id="{@structure_id}" header_top_level="{$header_top_level}" />
				<xsl:if test="/rsistructurenode/@outputmode='1'">
					-- E(i)nd Office content --		
					<a class="{$classname} nw_webdav"  href="{$src}" title="{$alttag}">
						<xsl:attribute name="target">_top</xsl:attribute>
												<xsl:value-of select="$alttag"/>
					</a>
				</xsl:if>
			</xsl:when>
			<xsl:when test="(@object_binary_type_id=12 or @object_binary_type_id=13)">
				
			</xsl:when>
			<!-- Todo object_binray SWF, filmpjes -->
			<xsl:otherwise>
				<a href="{$src}" title="{$alttag}">
					<xsl:attribute name="class"><xsl:value-of select="$classname"/><xsl:if test="(/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@enable_webdav_path='true')"> nw_webdav</xsl:if></xsl:attribute>
					<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@enable_webdav_path='true'">
					<xsl:attribute name="target">_top</xsl:attribute></xsl:if>
					<xsl:value-of select="$alttag"/>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Default rendering van een web user control-->
	<xsl:template match="object_wuc" mode="xhtml_default">
	<xsl:param name="params">
			<xsl:if test="@object_wuc_paramlist!=''">
				?paramlist=<xsl:value-of select="@object_wuc_paramlist"></xsl:value-of>
			</xsl:if>
		</xsl:param>
		<xsl:param name="href">
			<xsl:value-of select="@object_wuc_preview_page"></xsl:value-of>
			<xsl:value-of select="$params"></xsl:value-of>
		</xsl:param>
		<iframe src="$href" width="{@object_wuc_preview_width}" height="{@object_wuc_preview_height}" frameborder="0">
		</iframe>
		</xsl:template>
	<!-- Default rendering van een externe bron-->
	<xsl:template match="object_external" mode="xhtml_default">
		[getObjectExternalHTML(70,<xsl:value-of select="@object_external_id"/>)]
		<!-- [getObjectExternalHTML(70,<xsl:value-of select="@object_external_id"/>,<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>,<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>,<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_id"/>)]-->
	</xsl:template>
	<!-- Default rendering van een header object-->
	<xsl:template match="object_header" mode="xhtml_default">
		
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Display label -->
		<xsl:param name="xhtml_display_label">
			<xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn"><xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates></xsl:with-param>
				<xsl:with-param name="charsIn" select="'&lt;br&gt;'" />
				<xsl:with-param name="charsOut" select="''" />
			</xsl:call-template>
		
		</xsl:param>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<xsl:param name="header_level" select="$header_top_level+@object_header_level"/>
		<xsl:element name="h{$header_level}">
			<xsl:if test="$show_netwriter_classes='yes' or $classname!=''">
				<xsl:attribute name="class">
					<xsl:value-of select="$classname"/>
					<xsl:if test="$show_netwriter_classes='yes' and $classname!=''">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:value-of select="$show_netwriter_classes"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="$xhtml_display_label"/>
		</xsl:element>
	</xsl:template>
	<!-- Default rendering van document en kaart, rendering van de inhoud-->
	<xsl:template match="object_document|object_map"  mode="xhtml_default" >
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Editor enabled-->
		<xsl:param name="editor_enabled">false</xsl:param>
		<!-- te zoeken object_type voor de settings-->
		<xsl:param name="object_type_settings">{<xsl:value-of select="@object_type_id"/>}</xsl:param>
    	<!-- Extra info die doorgegeven moet worden aan de content rendering-->
		<xsl:param name="parenttitle"></xsl:param>
		<!-- Template dat gebruikt moet worden-->
		<xsl:param name="xslt_template_path"></xsl:param>
		<!-- Content objecttypeid-->
		<xsl:param name="content_object_type_id"><xsl:choose>
			<!-- Kaarten-->
			<xsl:when test="@object_type_id='5' or @object_type_id='8'">5</xsl:when>
			<!-- Overige content-->
			<xsl:otherwise>2</xsl:otherwise>
		</xsl:choose></xsl:param>
		<!-- Template pad dat echt gebruikt gaat worden, afhankelijk van doorgegeven waarde -->
		<xsl:param name="real_xslt_template_path"><xsl:choose>
			<xsl:when test="$xslt_template_path!=''"><xsl:value-of select="$xslt_template_path"/></xsl:when>
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/contenttemplates/template[contains(@object_type_id,$object_type_settings)]"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/contenttemplates/template[contains(@object_type_id,$object_type_settings)]/@path"/></xsl:when>
			<xsl:otherwise>/Rijksbreed/xslttransform/content/default.xslt</xsl:otherwise>
		</xsl:choose></xsl:param>
		<!-- todo  <xsl:value-of select="$contentxslttemplatename"/> -->
		<!-- Content uitschrijven-->
    <GetContent object_type_id="{$content_object_type_id}" object_id="{@object_document_id}{@object_map_id}" xlinkid="" xlinkmatch="" parenttitle="{$parenttitle}" releaseoutputextension="" editor_enabled="{$editor_enabled}" xslt_stylesheet="{$real_xslt_template_path}" structure_id="{@structure_id}" header_top_level="{$header_top_level}" />
		
	</xsl:template>
	<!-- Default template voor het weergeven van een externe verwijzing, afhankelijk van het object type-->
	<xsl:template match="object_url" mode="xhtml_default">
		<!-- SRC -->
		<xsl:param name="src" >
			<xsl:apply-templates select="." mode="url"></xsl:apply-templates>
		</xsl:param>
		<!-- Title tag -->
		<xsl:param name="title">
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="xhtml_display_label">
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
	
			<!-- IFRAME, mag eigenlijk niet, todo JQuery oplossing-->
			<a href="{$src}" title="{$title}">
				<xsl:if test="@object_type_id='67'">
					<xsl:attribute name="class">iframeloader nw_url_iframe_full_width</xsl:attribute>
				</xsl:if>
					
				<xsl:value-of select="$xhtml_display_label"/>
			</a>
			
				
			
		
	</xsl:template>
	<!-- Templates om de title tag van diverse objecten te bepalen -->
	<xsl:template match="object_class" mode="xhtml_title" >
		<xsl:param name="titletag">
			<xsl:choose>
				<xsl:when test="@object_class_title_alt!=''">
					<xsl:value-of select="@object_class_title_alt" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@object_class_title" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:value-of select="$titletag"/>
		<!-- TODO testen of dit goed gaat <xsl:call-template name="clean_attribute_webrichtlijnen">
			<xsl:with-param name="attribute" select="$titletag"></xsl:with-param>
		</xsl:call-template>-->
	</xsl:template>
	<xsl:template match="code_file|root|object_document|object_map|object_binary|object_url" mode="xhtml_title" >
		<xsl:param name="titletag">
			<xsl:value-of select="@root_name"/>
			<xsl:value-of select="@code_file_name"/>
			<xsl:value-of select="@object_map_label"/>
			<xsl:value-of select="@object_binary_label"/>
			<xsl:value-of select="@object_document_label"/>
			<xsl:value-of select="@object_url_label"/>
		</xsl:param>
		<xsl:value-of select="$titletag"/>
		<!-- TODO testen of dit goed gaat <xsl:call-template name="clean_attribute_webrichtlijnen">
			<xsl:with-param name="attribute" select="$titletag"></xsl:with-param>
		</xsl:call-template>-->
	</xsl:template>
	<xsl:template match="definition" mode="xhtml_title">
		<xsl:value-of select="@definition_desc" />
		<xsl:if test="@definition_name !=''"> (<xsl:value-of select="@definition_name" />)</xsl:if>
		<xsl:if test="@definition_memo !=''"><xsl:text> </xsl:text><xsl:value-of select="@definition_memo" /></xsl:if>
	</xsl:template>
	<!-- Display Label, weergave in aanklikbare teksten-->
	<xsl:template match="code_file|root|object_document|object_map|object_binary|object_class|object_header|object_url" mode="xhtml_display_label" >
		<xsl:param name="xhtml_display_label">
			<xsl:choose>
				<xsl:when test="@structure_label!=''"><xsl:value-of select="@structure_label"/></xsl:when>
				<xsl:when test="@object_class_title_short!=''">
					<xsl:value-of select="@object_class_title_short" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@object_class_title" />
					<xsl:value-of select="@object_header_label"/>
					<xsl:value-of select="@object_url_label"/>
					<xsl:value-of select="@root_name"/>
					<xsl:value-of select="@code_file_name"/>
					<xsl:value-of select="@object_map_label"/>
					<xsl:value-of select="@object_binary_label"/>
					<xsl:value-of select="@object_document_label"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:value-of select="$xhtml_display_label"/>
	</xsl:template>
	<xsl:template match="css_include" mode="xhtml_css_link">
		<link rel="stylesheet" type="text/css" media="{@media}" href="{@href}" />
	</xsl:template>
  <xsl:template match="js_include" mode="xhtml_js_link">
		<xsl:text disable-output-escaping="yes">
			  &lt;script type="text/javascript" src="</xsl:text><xsl:value-of select="@src"></xsl:value-of><xsl:text disable-output-escaping="yes">" &gt;&lt;/script&gt;
      </xsl:text>
	</xsl:template>
	<!-- Template om link naar css bestand te leggen-->
	<xsl:template match="code_file|root|object_document|object_map|object_binary" mode="xhtml_css_link">
		<xsl:param name="src">
			<xsl:choose>
			<xsl:when test="$releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode='5'">/NetWriterGui/dynamic/html/4/<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@root_id"></xsl:value-of>/0/0/1/<xsl:value-of select="@structure_id"></xsl:value-of>/default.aspx</xsl:when>
			<xsl:otherwise><xsl:apply-templates select="." mode="url"></xsl:apply-templates></xsl:otherwise></xsl:choose>
		</xsl:param>
		<link rel="stylesheet" type="text/css" media="all" href="{$src}" />
	</xsl:template>
	<!-- Template voor weergave in linklijsten-->
<xsl:template match="object_class|root|object_map|object_document|code_file|object_url|object_binary" mode="xhtml_link_list">
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Eventuele CSS classname voor op het listitem-->
		<xsl:param name="classname"></xsl:param>
		<!-- Eventuele CSS classname voor open geklapte items  voor op het listitem-->
		<xsl:param name="classname_open"></xsl:param>
		<!-- Eventuele CSS classname voor het actieve item  voor op het listitem-->
		<xsl:param name="classname_active"></xsl:param>
		<!-- Eventuele CSS classname voor het item als er kinderen zijn -->
		<xsl:param name="classname_childs"></xsl:param>
		<!-- Eventuele CSS classname voor op de link-->
		<xsl:param name="link_classname"></xsl:param>
		<!-- Eventuele CSS classname voor op de link van een open geklapt items -->
		<xsl:param name="link_classname_open"></xsl:param>
		<!-- Eventuele CSS classname voor op de link van een actief item-->
		<xsl:param name="link_classname_active"></xsl:param>	
		<!-- kind objecten weergeven-->
		<xsl:param name="display_childs">true</xsl:param>
		<!-- Geeft aan of de auteurs van een object weergegeven moeten worden bij objecten die bewerkt kunnen worden mbv de xml editor-->
		<xsl:param name="show_authors">false</xsl:param>
		<!-- Css klasse van het omhullende element-->
		<xsl:param name="show_authors_class"></xsl:param>
		<!-- Parameter met daarin de organisatienaam (zoals vermeld in de organisation tabel), wordt gebruikt voor de weergave van auteurs.-->
		<xsl:param name="organisation_name"></xsl:param>
		<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Parameter structure_id: identifier van het knooppunt dat nu omgezet wordt. -->
		<xsl:param name="current_structure_id" select="@structure_id"/>
		<!-- Parameter object_type_id: type object van de actieve pagina. -->
		<xsl:param name="objecttypeid"  select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>
		<!-- Aantal onderliggende objecten-->
		<xsl:param name="childcount_total" select="count(child::*)"></xsl:param>
		<!-- Aantal objecten die kinderen kunnen hebben -->
		<xsl:param name="childcount_parent_nodes"><xsl:choose><xsl:when test="/rsistructurenode/@outputmode='1'"><xsl:value-of select="count(child::object_class|code_file)"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="count(child::object_class[@status_id='23' and @object_type_id='23']|object_class[@status_id='29' and @object_type_id='23']|code_file)"></xsl:value-of></xsl:otherwise></xsl:choose></xsl:param>
	<!-- parameters die de positie aangeven van het huidige item, moet soms van boven doorgegeven worden.-->
		<xsl:param name="firstposition" select="position()=1" />
		<xsl:param name="lastposition" select="position()=last()" />
		<!-- SRC -->
		<xsl:param name="src" >
			<xsl:apply-templates select="." mode="url"></xsl:apply-templates>
		</xsl:param>
		<!-- Title tag -->
		<xsl:param name="title">
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="xhtml_display_label">
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="label">
			<xsl:choose>
				<xsl:when test="@object_type_id='23' and string-length($xhtml_display_label)>45">
					<xsl:call-template name="substring-before-last">
						<xsl:with-param name="string" select="substring($xhtml_display_label,0,45)" />
						<xsl:with-param name="delimiter" select="' '" />
					</xsl:call-template> ...
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$xhtml_display_label"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="active_class">
			<xsl:choose>
				<xsl:when test="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor::*[@structure_id=$current_structure_id]">
					<xsl:value-of select="$classname_open"/>
				</xsl:when>
				<xsl:when test="@structure_id=$structure_id"> <xsl:value-of select="$classname_active"/></xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$classname"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="active_link_class">
			<xsl:choose>
				<xsl:when test="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor::*[@structure_id=$current_structure_id]">
					<xsl:value-of select="$link_classname_open"/>
				</xsl:when>
				<xsl:when test="@structure_id=$structure_id"> <xsl:value-of select="$link_classname_active"/></xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$link_classname"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="childs_class">
			<xsl:choose>
				<xsl:when test="count(/rsistructurenode/menustructurenodes/objectcollection/root/descendant::*[@structure_id=current()/@structure_id]/*[@object_type_id='23' or @object_type_id='53'])">
					<xsl:value-of select="$classname_childs"/>
				</xsl:when>
				
			</xsl:choose>
		</xsl:param>
	
	<!-- geeft aan of het item uitgevoerd moet worden -->
		<xsl:param name="display_item"><xsl:apply-templates mode="display_item" select="."></xsl:apply-templates></xsl:param>

	<xsl:param name="object_binary_type_id" select="@object_binary_type_id"></xsl:param>
		<xsl:if test="$display_item='true'">
			<li>
					
			<xsl:if test="$active_class!='' or $show_netwriter_classes='true'">
				<xsl:attribute name="class">
					<xsl:value-of select="$active_class"/>
						<xsl:if test="$show_netwriter_classes='true'">
					<xsl:if test="$active_class!=''">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:apply-templates mode="netwriter_default_class" select="."></xsl:apply-templates>
							</xsl:if>
					<xsl:if test="$childs_class!=''">
							<xsl:text> </xsl:text><xsl:value-of select="$childs_class"/></xsl:if>
				</xsl:attribute>
			</xsl:if>
			<!-- Todo status opnemen als css klasse-->
			<!-- Todo printversie auteurs-->
			<a href="{$src}" title="{$title}">
				<xsl:if test="/rsistructurenode/@outputmode='1' or $active_link_class!=''">
					<xsl:attribute name="class"><xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@enable_webdav_path='true'"> nw_webdav </xsl:if>  	<xsl:if test="/rsistructurenode/@outputmode='1'"> nw_red_context_menu_anchor </xsl:if><xsl:text> </xsl:text><xsl:value-of select="$active_link_class"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@enable_webdav_path='true'">
					<xsl:attribute name="target">_top</xsl:attribute>
					
				</xsl:if>
				<xsl:value-of select="$label"/>
			</a>
				
				<xsl:if test="$show_authors='true' and (@object_type_id='2' or @object_type_id='5' or @object_type_id='6' or @object_type_id='8') and count(personcollection/person[@person_type_id=1 or @person_type_id=3])>0">
					<xsl:if test="count(personcollection/person[@person_type_id='1' or (@person_type_id=3 and @person_is_group=0)])>0">
					<div>
						<xsl:if test="$show_authors_class!=''">
							<xsl:attribute name="class"><xsl:value-of select="$show_authors_class"/></xsl:attribute>
						</xsl:if>
						<xsl:comment>DNC</xsl:comment>
						<xsl:apply-templates select="personcollection" mode="list"><xsl:with-param name="organisation_name" select="$organisation_name"></xsl:with-param></xsl:apply-templates>
					</div>
					</xsl:if>
				</xsl:if>
			<!-- Menu Redactieinterface toevoegen -->
				
				<xsl:choose>
					<xsl:when test="@object_type_id='22' or @object_type_id='23' or @object_type_id='53'"><xsl:apply-templates select="." mode='index_access_icon_tree' >
				<xsl:with-param name="firstposition" select="$firstposition" />
				<xsl:with-param name="lastposition" select="$lastposition" />
			</xsl:apply-templates></xsl:when>
					<xsl:otherwise><xsl:apply-templates select="." mode='index_access_icon_contents' >
				<xsl:with-param name="firstposition" select="$firstposition" />
				<xsl:with-param name="lastposition" select="$lastposition" />
			</xsl:apply-templates></xsl:otherwise>
				</xsl:choose>
			
			
			<xsl:if test="$display_childs='true' and(($leaf_link_mode='tree' and $childcount_total>0) or ($leaf_link_mode='content' and $childcount_parent_nodes>0))">
				<ul>
					<xsl:apply-templates select="*" mode="treeview">
						<xsl:with-param name="classname" select="$classname"></xsl:with-param>
						<xsl:with-param name="classname_open" select="$classname_open"></xsl:with-param>
						<xsl:with-param name="classname_active" select="$classname_active"></xsl:with-param>
						<xsl:with-param name="classname_childs" select="$classname_childs"></xsl:with-param>
						<xsl:with-param name="link_classname" select="$link_classname"></xsl:with-param>
						<xsl:with-param name="link_classname_open" select="$link_classname_open"></xsl:with-param>
						<xsl:with-param name="link_classname_active" select="$link_classname_active"></xsl:with-param>
						
						<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
						<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
					</xsl:apply-templates>
				</ul>
			</xsl:if>
		</li>
				</xsl:if>
	</xsl:template>
	<!-- Template voor standaard links vanuit een tekst-->
<xsl:template match="object_class|root|object_map|object_document|code_file|object_url|object_binary" mode="xhtml_link_text">
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Parameter structure_id: identifier van het knooppunt dat nu omgezet wordt. -->
		<xsl:param name="current_structure_id" select="@structure_id"/>
		<!-- Parameter object_type_id: type object van de actieve pagina. -->
		<xsl:param name="objecttypeid"  select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>
		<!-- SRC -->
		<xsl:param name="src" >
			<xsl:apply-templates select="." mode="url"></xsl:apply-templates>
		</xsl:param>
		<!-- Title tag -->
		<xsl:param name="title">
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="xhtml_display_label">
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="label">
			<xsl:choose>
        <xsl:when test="@use_database_label='true'"><xsl:value-of select="$xhtml_display_label"/></xsl:when>
				<xsl:when test="@editor_label!='' and @editor_label!=' '"><xsl:value-of select="@editor_label"/></xsl:when>
				<xsl:otherwise>					
					<xsl:value-of select="$xhtml_display_label"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
	<xsl:param name="netwriter_class_name"><xsl:if test="$show_netwriter_classes='true'"><xsl:apply-templates mode="netwriter_default_class" select="."></xsl:apply-templates> nw_text_link</xsl:if></xsl:param>
  <!-- Uitzondering voor kiesbeter-->
  
  		<!-- Todo printversie auteurs -->
				<a href="{$src}" title="{$title}">
				<xsl:if test="$classname!='' or $netwriter_class_name!='' or @link_target!='' or @css_class!=''">
				<xsl:attribute name="class">
					<xsl:value-of select="$classname"/>
					<xsl:if test="$show_netwriter_classes='true'">
					<xsl:if test="$classname!=''">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:value-of select="$netwriter_class_name" /></xsl:if><xsl:if test="@css_class!=''"><xsl:text> </xsl:text><xsl:value-of select="@css_class"/></xsl:if>
				
					<xsl:if test="@link_target!=''"><xsl:if test="$classname!='' or $netwriter_class_name!=''"><xsl:text> </xsl:text></xsl:if><xsl:choose>
						<xsl:when test="@link_target='_popup'">popup nw_target_popup</xsl:when>
						<xsl:when test="@link_target='_blank'">nw_target_blank</xsl:when>
						<xsl:when test="@link_target='_popup_map'">nw_target_map</xsl:when>
						<xsl:when test="@link_target='_popup_map_slider'">nw_target_map_slider</xsl:when>
						<xsl:otherwise><xsl:value-of select="@link_target"/></xsl:otherwise>
					</xsl:choose>
					</xsl:if>
				</xsl:attribute>
			</xsl:if>
				<xsl:value-of select="$label"/>
			</a>
	</xsl:template>
	<!-- items wegschrijven met menu-->
	<xsl:template match="*" mode="xhtml_default_menu">
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Template dat gebruikt moet worden voor de rendering van content fragmenten-->
		<xsl:param name="xslt_template_path"></xsl:param>
		<!-- Content blokken rechterberm-->
				<xsl:apply-templates select="." mode="xhtml_default">
					<xsl:with-param name="header_top_level" select="$header_top_level" />					
					<xsl:with-param name="xslt_template_path" select="$xslt_template_path"></xsl:with-param>
					<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
				</xsl:apply-templates>
				<xsl:apply-templates select="." mode='index_access_icon_contents' >
				<xsl:with-param name="firstposition" select="position()=1" />
				<xsl:with-param name="lastposition" select="position()=last()" />
			</xsl:apply-templates>
	</xsl:template>
  <xsl:template match="*" mode="xhtml_meta_keyword"><xsl:param name="xml_template_settings">{<xsl:value-of select="@xml_template_id"/>}</xsl:param><xsl:if test="(@object_type_id='2' or @object_type_id='6' or @object_type_id='5' or @object_type_id='8' or @object_type_id='9' or @object_type_id='10' or @object_type_id='11' or @object_type_id='12') and /rsistructurenode/currentstructurenode/siteconfig/contenttemplates[contains(@meta_keywords_xml_template_id,$xml_template_settings)]"><xsl:apply-templates select="." mode ="xhtml_default">
							<xsl:with-param name="xslt_template_path"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@application_path"/>xslttransform/content/list_meta_keywords.xslt</xsl:with-param>
							<xsl:with-param name="editor_enabled">false</xsl:with-param></xsl:apply-templates></xsl:if></xsl:template>
</xsl:stylesheet>


