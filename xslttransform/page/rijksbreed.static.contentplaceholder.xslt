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
	<xsl:include href="placeholders/treeview.xslt" />
	<xsl:include href="placeholders/sitetabs.xslt" />
	<xsl:include href="placeholders/sitesearch.xslt" />
	<xsl:include href="placeholders/sitetitle.xslt" />
	<xsl:include href="placeholders/sitefooter.xslt" />
	<xsl:include href="placeholders/content.xslt" />
	<xsl:include href="placeholders/related.xslt" />
	<xsl:include href="placeholders/extra.xslt" />
	<xsl:include href="placeholders/meta_navigation.xslt" />
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" indent="no" />
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
		<xsl:param name="CPHTreeView_filled">
			<xsl:choose>
				<!--<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs' and (($leaf_link_mode='tree' and $childcount_total_active_tab>0) or ($leaf_link_mode='content' and $childcount_parent_nodes_active_tab>0))">true</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='traditional' and (($leaf_link_mode='tree' and $childcount_total>0) or ($leaf_link_mode='content' and $childcount_parent_nodes>0))">true</xsl:when>-->
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' or /rsistructurenode/currentstructurenode/structure/@object_type_id='2' or /rsistructurenode/currentstructurenode/structure/@object_type_id='5' or /rsistructurenode/currentstructurenode/structure/@object_type_id='8' or /rsistructurenode/currentstructurenode/structure/@object_type_id='6'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<!-- params tbv vormgeving, zoals overgenomen uit de toolkit -->
		<xsl:param name="equalize_class">
			<xsl:if test="$CPHTreeView_filled='false'">
				<xsl:text> </xsl:text>equalize
			</xsl:if>
		</xsl:param>
		<!-- Thema css parameter, zorgt voor de instelling van de site-->
		<xsl:param name="theme_css_classes">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@colorset"/>
			<xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@width_mode!=''">
					<xsl:text> </xsl:text>
					<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@width_mode"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$objecttypeid='5' or $objecttypeid='8'">
						<xsl:text> </xsl:text>wide
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="master_page_url">
			<xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@masterpage!=''">
					<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@masterpage"/>
				</xsl:when>
				<xsl:otherwise>~/masterpage/Rijksbreed.master</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<!-- params tbv vormgeving -->
		<xsl:param name="body_id">
			<xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='classic'">content</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' or rsistructurenode/currentstructurenode/structure/@object_type_id='5' or rsistructurenode/currentstructurenode/structure/@object_type_id='8'">home</xsl:when>
				<xsl:when test="$CPHTreeView_filled='true'">content</xsl:when>
				<xsl:otherwise>content</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="relative_url"><xsl:choose>	<xsl:when test="$releaseoutputmode='2' or $releaseoutputmode='3' or $releaseoutputmode='7'"><xsl:call-template name="getRelativePath"></xsl:call-template></xsl:when><xsl:otherwise>/VTVSites/</xsl:otherwise></xsl:choose></xsl:param>
		<xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;</xsl:text>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="nl" lang="nl">
<head id="PageHeader" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="pagetitle"/></title>
    <script type="text/javascript" src="{$relative_url}javascript/jquery.ui-1.72/jquery-1.3.2.min.js" ><xsl:comment>DNC</xsl:comment></script>
	<script type="text/javascript" src="{$relative_url}javascript/jquery.ui-1.72/jquery-ui-1.7.2.custom.min.js" ><xsl:comment>DNC</xsl:comment></script>
	<script type="text/javascript" src="{$relative_url}javascript/jquery.ui-1.0/jquery.contextMenu.js" ><xsl:comment>DNC</xsl:comment></script>
	<script type="text/javascript" src="{$relative_url}javascript/jquery.ui-1.0/easytooltip.js" ><xsl:comment>DNC</xsl:comment></script>
	<script type="text/javascript" src="{$relative_url}javascript/jquery.ui-1.0/fg.menu.js" ><xsl:comment>DNC</xsl:comment></script>
	<script type="text/javascript" src="{$relative_url}javascript/sitestat.js" ><xsl:comment>DNC</xsl:comment></script>
    <script type="text/javascript" src="{$relative_url}javascript/easytooltip.js" ><xsl:comment>DNC</xsl:comment></script>
    <script type="text/javascript" src="{$relative_url}javascript/uo_popup_wr.js" ><xsl:comment>DNC</xsl:comment></script>
	  <script type="text/javascript" src="{$relative_url}javascript/fiximgpath.js" ><xsl:comment>DNC</xsl:comment></script>
    <xsl:call-template name="CPHHeader" />
 	<link rel="stylesheet" href="{$relative_url}css/screen.css" type="text/css" media="screen" />
 	<!--[if IE 8]><link rel="stylesheet" href="{$relative_url}css/ie/ie8.css" type="text/css" media="screen" /><![endif]-->
	<!--[if lte IE 7]><link rel="stylesheet" href="{$relative_url}css/ie/ie7.css" type="text/css" media="screen" /><![endif]-->
	<!--[if lte IE 6]><link rel="stylesheet" href="{$relative_url}css/ie/ie6.css" type="text/css" media="screen" /><![endif]-->
    <link rel="stylesheet" href="{$relative_url}css/print.css" type="text/css" media="print" />
    <link rel="shortcut icon" href="{$relative_url}favicon.ico" type="image/x-icon" />
</head>
<body id="{$body_id}">
     <div>
		 <xsl:attribute name="class"><xsl:text>container </xsl:text><xsl:value-of select="$theme_css_classes"/></xsl:attribute>
        <ul class="skiplink">
            <li>Ga direct naar: <a href="#hoofd_content" title="Direct naar de inhoud">inhoud</a>,
                <a href="#subnavigatie" title="Direct naar de subnavigatie">subnavigatie</a>, <a
                    href="#service_menu" title="Direct naar het service menu">service menu</a>,
                <a href="#zoeken" title="Direct naar zoeken">zoeken</a></li>
        </ul>
        <div class="header">
            <span><xsl:comment>DNC</xsl:comment></span>
            <div class="branding">
                <xsl:call-template name="CPHSiteLogo" />
            </div>
			<xsl:call-template name="CPHSiteTitle" />
            <div class="nav_bar">
               	<xsl:call-template name="CPHSiteTabs" />
                <!--<div class="search">
                    <xsl:call-template name="CPHSiteSearch" />
                </div>-->
            </div>
        </div>
       <div class="content_wrapper1">
            <div class="content_wrapper2">
                <div class="content">
                  
                    <!-- START : CONTENT -->
                    <xsl:variable name="CPHTreeView_filled_var"><xsl:call-template name="CPHTreeView_filled"></xsl:call-template></xsl:variable>
				<!-- Root level geen kruimelpad-->
			<xsl:if test="/rsistructurenode/currentstructurenode/structure/@structure_level>'0'">
			<div>
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$CPHTreeView_filled_var='true'">breadcrumb</xsl:when>
						<xsl:when test="$objecttypeid='5' or $objecttypeid='8'">breadcrumb left zorgatlas_crumb</xsl:when>
						<xsl:otherwise>breadcrumb left</xsl:otherwise>
					</xsl:choose>
						
				</xsl:attribute>
				<p>
					<em>U bevindt zich op: </em>
					<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::*[@object_type_id='2' or @object_type_id='6' or @object_type_id='5' or @object_type_id='8' or @object_type_id='22' or @object_type_id='23' or @object_type_id='53']" mode="crumbtrail_item"></xsl:apply-templates>
				</p>
			</div>
				</xsl:if>
                    <form id="form1">
                    <xsl:call-template name="CPHContent" ><xsl:with-param name="header_top_level"><xsl:call-template name="html_header_top_level"></xsl:call-template></xsl:with-param>
			<xsl:with-param name="show_netwriter_classes" select="/rsistructurenode/currentstructurenode/siteconfig/layout/@show_netwriter_classes"></xsl:with-param></xsl:call-template>

                 
                    	<xsl:call-template name="CPHExtra" ><xsl:with-param name="header_top_level"><xsl:call-template name="html_header_top_level"></xsl:call-template></xsl:with-param></xsl:call-template>
                    	<xsl:call-template name="CPHRelated" ><xsl:with-param name="header_top_level"><xsl:call-template name="html_header_top_level"></xsl:call-template></xsl:with-param></xsl:call-template>
                    	<xsl:if test=" (/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='classic' and /rsistructurenode/currentstructurenode/structure/@object_type_id='22') or (/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='traditional' and /rsistructurenode/currentstructurenode/structure/@object_type_id='22') or /rsistructurenode/currentstructurenode/structure/@object_type_id='23' or /rsistructurenode/currentstructurenode/structure/@object_type_id='53'"><xsl:call-template name="CPHTreeView" /></xsl:if>
				
			
                     </form>
                    <!-- END : CONTENT -->
                  
                </div>
            </div>
        </div>
        	<xsl:call-template name="CPHMetaNavigation" />
     		<div class="footer">
			<div class="ref">


				    <img src="{$relative_url}logos/RO_footer.png" alt="" height="25" width="500" />		
				
			</div>
			<xsl:text disable-output-escaping="yes">&lt;span&gt;&lt;/span&gt;</xsl:text>
		</div>
     
    </div>
    <!--Start netwriter editor menu -->
        <!--<asp:ContentPlaceHolder runat="server"  ID="CPHNWPageMenu">
        </asp:ContentPlaceHolder>-->
    <!--End netwriter editor menu -->
    
</body>
</html>

	</xsl:template>
	<!-- Geeft aan wat voor een template het gaat:-->
	<!-- html: statische html uitvoer-->
	<!-- ASP.NET.aspx: complete aspx pagina-->
	<!-- ASP.NET.Masterpage: deel aspx pagina, te gebruiken met een master page-->
	<xsl:template name="output_document_type">HTML</xsl:template>
	<!-- Geeft het header niveau aan waar NetWriter moet beginnen.-->
	<!-- Binnen NetWriter worden diverse header niveau's standaard onderscheiden, dit getal geeft aan waar NetWriter op het hoogste niveau moet beginnen.-->
	<!-- bv. staat hier een 1 dan zal het hoogste header niveau dat door NetWriter geleverd wordt een h1 tag zijn. -->
	<xsl:template name="html_header_top_level">1</xsl:template>



</xsl:stylesheet>

