<?xml version="1.0" encoding="UTF-8"?>
<!-- Template ten behoeve van het genereren van ASPX files met NetWriter die gebruik maken van de -->
<!-- Rijksbrede vormgeving.  -->
<!-- Zie Versiebeheer voor auteurs en versieinformatie -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!-- parameters doorgegeven via de businessobjects, de outputmode (redactie, release, prerelease, liveview) en de release extention-->
	<xsl:param name="releaseoutputmode"></xsl:param>
	<xsl:param name="releaseoutputextension"></xsl:param>
	<xsl:variable name="object_class_map" select="'../object_class/'" />
	<xsl:variable name="trefwoorden_map" select="'../thesaurus/'" />
	<!-- Generieke NetWriter templates-->
	<xsl:include href="../netwriter.common/xml/general.xslt" />
	<xsl:include href="../netwriter.common/xml/crumbtrail.xslt" />
	<xsl:include href="../netwriter.common/xml/treeview.xslt" />
	<xsl:include href="../netwriter.common/xml/footer.xslt" />
  <xsl:include href="../netwriter.common/xml/sitestat.xslt" />
	<xsl:include href="../netwriter.common/textfunctions.xslt" />
	<xsl:include href="../netwriter.common/formatdate.xslt" />
	<xsl:include href="../netwriter.common/url.xslt" />
	<xsl:include href="../netwriter.common/xml/contentpane.xslt" />
	<xsl:include href="../netwriter.common/xml/xhtml_templates.xslt" />
	<!-- Includes van vulling content placeholders-->
	<xsl:include href="placeholders/header.xslt" />
  <xsl:include href="placeholders/printversion.xslt" />
	<xsl:include href="placeholders/sitelogo.xslt" />
	<xsl:include href="zorgatlas.placeholders/treeview.xslt" />
	<xsl:include href="placeholders/sitetabs.xslt" />
	<xsl:include href="placeholders/sitesearch.xslt" />
	<xsl:include href="placeholders/sitetitle.xslt" />
	<xsl:include href="placeholders/sitefooter.xslt" />
	<xsl:include href="zorgatlas.placeholders/content.xslt" />
	<xsl:include href="placeholders/related.xslt" />
	<xsl:include href="placeholders/extra.xslt" />
	<xsl:include href="placeholders/meta_navigation.xslt" />
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template match="/">
		<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Parameter object_type_id: type object van de actieve pagina. -->
		<xsl:param name="objecttypeid"  select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>
		<!-- Aantal kinderen onder het hoofdniveau-->
		<xsl:param name="childcount_total" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::root/*)"></xsl:param>
		<!-- Aantal kinderen onder het hoofdniveau die kinderen kunnen hebben -->
		<xsl:param name="childcount_parent_nodes" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class[@status_id='23' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class[@status_id='29' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::root/code_file)"></xsl:param>
		<!-- Aantal kinderen onder het actieve tabblad-->
		<xsl:param name="childcount_total_active_tab" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class/*)"></xsl:param>
		<!-- Aantal kinderen onder het actieve tabblad die kinderen kunnen hebben -->
		<xsl:param name="childcount_parent_nodes_active_tab" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class/object_class[@status_id='23' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class/object_class[@status_id='29' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class/code_file)"></xsl:param>
		<!-- Plaats waar links die een blad in de boom zijn weergegeven moeten worden-->
		<xsl:param name="leaf_link_mode" select="/rsistructurenode/currentstructurenode/siteconfig/layout/@leaf_link_mode"></xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes" select="/rsistructurenode/currentstructurenode/siteconfig/layout/@show_netwriter_classes"></xsl:param>
		<xsl:param name="CPHTreeView_filled"><xsl:choose>
				<!--<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs' and (($leaf_link_mode='tree' and $childcount_total_active_tab>0) or ($leaf_link_mode='content' and $childcount_parent_nodes_active_tab>0))">true</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='traditional' and (($leaf_link_mode='tree' and $childcount_total>0) or ($leaf_link_mode='content' and $childcount_parent_nodes>0))">true</xsl:when>-->
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' or /rsistructurenode/currentstructurenode/structure/@object_type_id='2' or /rsistructurenode/currentstructurenode/structure/@object_type_id='5' or /rsistructurenode/currentstructurenode/structure/@object_type_id='8' or /rsistructurenode/currentstructurenode/structure/@object_type_id='6'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose></xsl:param>
		<!-- params tbv vormgeving, zoals overgenomen uit de toolkit -->
		<xsl:param name="equalize_class">
			<xsl:if test="$CPHTreeView_filled='false'"><xsl:text> </xsl:text>equalize</xsl:if>
		</xsl:param>
		<!-- Thema css parameter, zorgt voor de instelling van de site-->
		<xsl:param name="theme_css_classes"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@colorset"/><xsl:choose>
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@width_mode!=''"><xsl:text> </xsl:text><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@width_mode"/></xsl:when>
			<xsl:otherwise><xsl:if test="$objecttypeid='5' or $objecttypeid='8'"><xsl:text> </xsl:text>wide</xsl:if></xsl:otherwise>
		</xsl:choose></xsl:param>
		<xsl:param name="master_page_url"><xsl:choose><xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@masterpage!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@masterpage"/></xsl:when><xsl:otherwise>~/masterpage/Rijksbreed.master</xsl:otherwise></xsl:choose></xsl:param>
		<!-- params tbv vormgeving -->
		<xsl:param name="body_id">
			<xsl:choose>
				<xsl:when test="$CPHTreeView_filled='true'">content</xsl:when>
				<xsl:otherwise>home</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:text disable-output-escaping="yes">
		<!--ASPX Pagina declaratie, zetten van het master type-->
		&lt;%@ page language="C#" ValidateRequest="false" MasterPageFile="</xsl:text>~/Masterpage/ZorgAtlasFileDialog.master<xsl:text disable-output-escaping="yes">" Title="</xsl:text>
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="pagetitle"/>
		<xsl:text disable-output-escaping="yes">"  AutoEventWireup="true" %&gt;
			&lt;%@ MasterType VirtualPath="</xsl:text>~/Masterpage/ZorgAtlasFileDialog.master<xsl:text disable-output-escaping="yes">"%&gt;
		</xsl:text>
		<!-- Master page variabelen zetten.-->
		<script runat="server">
			protected void Page_Init(object sender, System.EventArgs e)
			{
			this.Master.ObjectId=<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_id"></xsl:value-of>;
			this.Master.ObjectTypeId=<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"></xsl:value-of>;
			this.Master.SearchUrl = "";
			this.Master.ThemeCSS = "<xsl:value-of select="$theme_css_classes"/>".Trim();
			this.Master.BodyTagId="<xsl:value-of select="$body_id"/>";
			}
		</script>
		<!-- Content placeholder voor de header -->
		<asp:content id="CPHHeaderInstance" contentplaceholderid="CPHHeader" runat="server">
			<xsl:call-template name="CPHHeader" />
		</asp:content>
		<!-- Content placeholder voor het logo -->
		<asp:content id="CPHSiteLogoInstance" contentplaceholderid="CPHSiteLogo" runat="server">
			<xsl:call-template name="CPHSiteLogo" />
		</asp:content>
		<!-- Content placeholder voor het kruimelpad -->
		<asp:content id="CPHCrumbtrailInstance" contentplaceholderid="CPHCrumbtrail" runat="server">
			<!-- Geeft aan of er iets in de linkerberm staat-->
			<xsl:variable name="CPHTreeView_filled_var"><xsl:call-template name="CPHTreeView_filled"></xsl:call-template></xsl:variable>
				<!-- Root level geen kruimelpad-->
			<xsl:if test="/rsistructurenode/currentstructurenode/structure/@structure_level>'0'">
			<div>
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$CPHTreeView_filled_var='true'">breadcrumb</xsl:when>
						<xsl:otherwise>breadcrumb left</xsl:otherwise>
					</xsl:choose>
						
				</xsl:attribute>
				<p>
					<em>U bevindt zich op: </em>
					<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::*[@object_type_id='2' or @object_type_id='6' or @object_type_id='5' or @object_type_id='8' or @object_type_id='22' or @object_type_id='23' or @object_type_id='53']" mode="crumbtrail_item"></xsl:apply-templates>
				</p>
			</div>
				</xsl:if>
		</asp:content>
		<!-- Content placeholder voor de site navigatie, meestal in de linkerberm. -->
		<asp:content id="CPHTreeViewInstance" contentplaceholderid="CPHTreeView" runat="server">
			<!-- documenten en kaarten hebben geen linkerberm-->
			
				<xsl:if test="(/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='traditional' and /rsistructurenode/currentstructurenode/structure/@object_type_id='22') or /rsistructurenode/currentstructurenode/structure/@object_type_id='23' or /rsistructurenode/currentstructurenode/structure/@object_type_id='53'"><xsl:call-template name="CPHTreeView" /></xsl:if>
				
			
			
		</asp:content>
		<!-- Content placeholder voor de sub navigatie (meestal rechtsboven) -->
		<asp:content id="CPHMetaNavigationInstance" contentplaceholderid="CPHMetaNavigation" runat="server">
			<xsl:call-template name="CPHMetaNavigation" />
		</asp:content>
		<!-- Content placeholder voor de gerelateerde items (rechterberm) -->
		<asp:content id="CPHRelatedInstance" contentplaceholderid="CPHRelated" runat="server">
			<xsl:call-template name="CPHRelated" ><xsl:with-param name="header_top_level"><xsl:call-template name="html_header_top_level"></xsl:call-template></xsl:with-param></xsl:call-template>
		</asp:content>
		<!-- Content placeholder voor de uiteindelijke content -->
		<asp:content id="CPHContentInstance" contentplaceholderid="CPHContent" runat="server">
			<xsl:call-template name="CPHContent" ><xsl:with-param name="header_top_level"><xsl:call-template name="html_header_top_level"></xsl:call-template></xsl:with-param>
			<xsl:with-param name="show_netwriter_classes" select="/rsistructurenode/currentstructurenode/siteconfig/layout/@show_netwriter_classes"></xsl:with-param></xsl:call-template>
 <xsl:comment>Clickzone</xsl:comment>
		</asp:content>
		<!-- Content placeholder voor de hoofdnavigatie van de site -->
		<asp:content id="CPHSiteTabsInstance" contentplaceholderid="CPHSiteTabs" runat="server">
			<xsl:call-template name="CPHSiteTabs" />
		</asp:content>
		<!-- Content placeholder voor het zoeken-->
		<asp:content id="CPHSiteSearchInstance" contentplaceholderid="CPHSiteSearch" runat="server">
			<xsl:call-template name="CPHSiteSearch" />
		</asp:content>
		<!-- Content placeholder voor de titel van de site -->
		<asp:content id="CPHSiteTitleInstance" contentplaceholderid="CPHSiteTitle" runat="server">
				<xsl:call-template name="CPHSiteTitle" />
		</asp:content> 
		<!-- Content placeholder voor de voetregel van de site -->
		<asp:content id="CPHSiteFooterInstance" contentplaceholderid="CPHSiteFooter" runat="server">
			<xsl:call-template name="CPHSiteFooter" />
		</asp:content>
		<asp:content id="CPHExtraInstance" contentplaceholderid="CPHExtra" runat="server">
			<xsl:call-template name="CPHExtra" ><xsl:with-param name="header_top_level"><xsl:call-template name="html_header_top_level"></xsl:call-template></xsl:with-param></xsl:call-template>
		</asp:content>

	</xsl:template>
	<!-- Geeft aan wat voor een template het gaat:-->
	<!-- html: statische html uitvoer-->
	<!-- ASP.NET.aspx: complete aspx pagina-->
	<!-- ASP.NET.Masterpage: deel aspx pagina, te gebruiken met een master page-->
	<xsl:template name="output_document_type">ASP.NET.Masterpage</xsl:template>
	<!-- Geeft het header niveau aan waar NetWriter moet beginnen.-->
	<!-- Binnen NetWriter worden diverse header niveau's standaard onderscheiden, dit getal geeft aan waar NetWriter op het hoogste niveau moet beginnen.-->
	<!-- bv. staat hier een 1 dan zal het hoogste header niveau dat door NetWriter geleverd wordt een h1 tag zijn. -->
	<xsl:template name="html_header_top_level">1</xsl:template>
<xsl:template match="root|object_document|code_file|object_url|object_binary" mode="zorgatlas_xhtml_link_list">

</xsl:template>
	<xsl:template match="object_class|object_map" mode="zorgatlas_xhtml_link_list">
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
		<xsl:param name="src" >javascript:window.top.<xsl:choose><xsl:when test="@object_type_id='23'">AtlasShowFileDialog</xsl:when><xsl:otherwise>AtlasShowMap</xsl:otherwise></xsl:choose>('<xsl:choose><xsl:when test="$releaseoutputmode='2' or $releaseoutputmode='3'"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn"><xsl:apply-templates select="." mode="url"></xsl:apply-templates></xsl:with-param>
				<xsl:with-param name="charsIn" select="'.aspx'" />
				<xsl:with-param name="charsOut" select="'_mapindex.aspx'" />
			</xsl:call-template></xsl:when><xsl:otherwise>http://localhost/NetWriterGui/dynamic/map_index/4/<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@root_id"></xsl:value-of>/0/0/1/<xsl:value-of select="@structure_id"></xsl:value-of>/default.aspx</xsl:otherwise></xsl:choose>',this.location<xsl:if test="@object_type_id!='23'">,true</xsl:if>);</xsl:param>
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
			
	<!-- geeft aan of het item uitgevoerd moet worden -->
		<xsl:param name="display_item"><xsl:apply-templates mode="display_item" select="."></xsl:apply-templates></xsl:param>

	<xsl:param name="object_binary_type_id" select="@object_binary_type_id"></xsl:param>
		
		<xsl:if test="$display_item='true' and @object_type_id!='3'">
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
					<xsl:apply-templates select="*" mode="zorgatlas_xhtml_link_list">
						<xsl:with-param name="classname" select="$classname"></xsl:with-param>
						<xsl:with-param name="classname_open" select="$classname_open"></xsl:with-param>
						<xsl:with-param name="classname_active" select="$classname_active"></xsl:with-param>
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


</xsl:stylesheet>

