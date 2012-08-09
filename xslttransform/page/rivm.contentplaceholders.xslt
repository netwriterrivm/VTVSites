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
	<xsl:include href="rivm.placeholders/treeview.xslt" />
	<xsl:include href="rivm.placeholders/sitetabs.xslt" />
	<xsl:include href="placeholders/sitesearch.xslt" />
	<xsl:include href="placeholders/sitetitle.xslt" />
	<xsl:include href="placeholders/sitefooter.xslt" />
	<xsl:include href="placeholders/content.xslt" />
	<xsl:include href="placeholders/related.xslt" />
	<xsl:include href="placeholders/extra.xslt" />
	<xsl:include href="rivm.placeholders/meta_navigation.xslt" />
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
		<!-- items inde rechterberm-->
		<xsl:param name="related_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='11'])"/>
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
		<xsl:param name="theme_css_classes">RIVM Kompas <xsl:if test="/rsistructurenode/currentstructurenode/structure/@structure_level='0'">   </xsl:if><xsl:choose>
			<xsl:when test="$objecttypeid='2' or $objecttypeid='6' or $objecttypeid='5' or $objecttypeid='8'"><xsl:text> </xsl:text>full</xsl:when>
			<xsl:when test="$related_count=0">hide_related</xsl:when>
			<xsl:when test="$objecttypeid='22'"></xsl:when>
			<xsl:otherwise> wide</xsl:otherwise>
		</xsl:choose></xsl:param>
		<xsl:param name="master_page_url">~/masterpage/NetWriterSite.master</xsl:param>
		<!-- params tbv vormgeving -->
		<xsl:param name="body_id">
			<xsl:choose>
				<xsl:when test="$CPHTreeView_filled='true'">content</xsl:when>
				<xsl:otherwise>home</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:text disable-output-escaping="yes">
		<!--ASPX Pagina declaratie, zetten van het master type-->
		&lt;%@ page language="C#" ValidateRequest="false" MasterPageFile="</xsl:text><xsl:value-of select="$master_page_url"></xsl:value-of><xsl:text disable-output-escaping="yes">" Title="</xsl:text>
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="pagetitle"/>
		<xsl:text disable-output-escaping="yes">"  AutoEventWireup="true" %&gt;
			&lt;%@ MasterType VirtualPath="</xsl:text><xsl:value-of select="$master_page_url"></xsl:value-of><xsl:text disable-output-escaping="yes">"%&gt;
		</xsl:text>
		<!-- Master page variabelen zetten.-->
		<script runat="server">
			protected void Page_Init(object sender, System.EventArgs e)
			{
			this.Master.ObjectId=<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_id"></xsl:value-of>;
			this.Master.ObjectTypeId=<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"></xsl:value-of>;
			this.Master.SearchUrl = "<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/search/@url"></xsl:value-of>";
			this.Master.ThemeCSS = "<xsl:value-of select="$theme_css_classes"/>".Trim();
			this.Master.BodyTagId="<xsl:value-of select="$body_id"/>";
			}
		</script>
		<!-- Content placeholder voor de header -->
		<asp:content id="CPHHeaderInstance" contentplaceholderid="CPHHeader" runat="server">
			<xsl:call-template name="CPHHeader" />
		</asp:content>
		<!-- Content placeholder voor het logo --><!--
		<asp:content id="CPHSiteLogoInstance" contentplaceholderid="CPHSiteLogo" runat="server">
			<xsl:call-template name="CPHSiteLogo" />
		</asp:content>
		--><!-- Content placeholder voor het kruimelpad -->
		<asp:content id="CPHCrumbtrailInstance" contentplaceholderid="CPHCrumbtrail" runat="server">
			<!-- Geeft aan of er iets in de linkerberm staat-->
			<xsl:variable name="CPHTreeView_filled_var"><xsl:call-template name="CPHTreeView_filled"></xsl:call-template></xsl:variable>
				<!-- Root level geen kruimelpad-->
			<xsl:if test="/rsistructurenode/currentstructurenode/structure/@structure_level>'0'">
			<div id="path">
				<!--<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$CPHTreeView_filled_var='true'">breadcrumb</xsl:when>
						<xsl:otherwise>breadcrumb left</xsl:otherwise>
					</xsl:choose>
						
				</xsl:attribute>-->
				<ul id="cr">
					<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::*[@object_type_id='2' or @object_type_id='6' or @object_type_id='5' or @object_type_id='8' or @object_type_id='22' or @object_type_id='23' or @object_type_id='53']" mode="xhtml_link_list">
						<xsl:with-param name="classname">crmbimage</xsl:with-param>
											<xsl:with-param name="classname_active">crmbimage crmbimagelast</xsl:with-param>
							<xsl:with-param name="open">crmbimage</xsl:with-param>
						<xsl:with-param name="display_childs">false</xsl:with-param>
					</xsl:apply-templates>
				</ul>
	</div>
				</xsl:if>
		</asp:content>
		<asp:content id="CPHSubSiteTitleInstance" contentplaceholderid="CPHSubSiteTitle" runat="server">
			<xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="xhtml_display_label"></xsl:apply-templates>
		</asp:content>
		
		<!-- Content placeholder voor de site navigatie, meestal in de linkerberm. -->
		<asp:content id="CPHTreeViewInstance" contentplaceholderid="CPHTreeView" runat="server">
			<!-- documenten en kaarten hebben geen linkerberm-->
				<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' or /rsistructurenode/currentstructurenode/structure/@object_type_id='23' or /rsistructurenode/currentstructurenode/structure/@object_type_id='53'"><xsl:call-template name="CPHTreeView" /></xsl:if>
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
				<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
			</xsl:call-template>

		</asp:content>
		<!-- Content placeholder voor de hoofdnavigatie van de site -->
		<asp:content id="CPHSiteTabsInstance" contentplaceholderid="CPHSiteTabs" runat="server">
			<xsl:call-template name="CPHSiteTabs" />
		</asp:content>
		<!-- Content placeholder voor het zoeken--><!--
		<asp:content id="CPHSiteSearchInstance" contentplaceholderid="CPHSiteSearch" runat="server">
			<xsl:call-template name="CPHSiteSearch" />
		</asp:content>
		--><!-- Content placeholder voor de titel van de site -->
		<asp:content id="CPHSiteTitleInstance" contentplaceholderid="CPHSiteTitle" runat="server">
			<strong><xsl:apply-templates select="/rsistructurenode/currentstructurenode/root" mode="xhtml_display_label"></xsl:apply-templates></strong>
		</asp:content>
		<!-- Content placeholder voor de voetregel van de site -->
		<asp:content id="CPHSiteFooterInstance" contentplaceholderid="CPHSiteFooter" runat="server">
	
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
	<xsl:template name="html_header_top_level">2</xsl:template>


</xsl:stylesheet>

