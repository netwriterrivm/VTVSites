<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template name="CPHSiteTabs">
	<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
			<!-- Parameter structure_id: identifier van het knooppunt dat nu omgezet wordt. -->
		<xsl:param name="current_structure_id" select="@structure_id"/>		
					<a>
							<xsl:attribute name="class"><xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id!='22'"> SiteTabs </xsl:if><xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22'"> SiteTabsOn </xsl:if><xsl:if test="/rsistructurenode/@outputmode='1'">
							  nw_red_context_menu_anchor </xsl:if>
						</xsl:attribute>
						
						<xsl:attribute name="href">
							<xsl:apply-templates select="/rsistructurenode/currentstructurenode/root" mode="url"></xsl:apply-templates>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@home_tab_title"/>
						</xsl:attribute>
						<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@home_tab_label"/>
					</a>
					<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/root" mode='index_access_icon_tree' >
						<xsl:with-param name="firstposition" select="'true'" />
						<xsl:with-param name="lastposition" select="'true'" />
					</xsl:apply-templates>


		<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs'">
			<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/root/*[@object_type_id='22' or @object_type_id='23'  or @object_type_id='3' or @object_type_id='53']" mode="xhtml_link_text">
				<xsl:with-param name="classname">
					<xsl:choose>
						<xsl:when test="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor::*[@structure_id=$current_structure_id]">SiteTabsOn</xsl:when>
						<xsl:when test="@structure_id=$structure_id">SiteTabsOn</xsl:when>
						<xsl:otherwise>SiteTabs</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
					</xsl:apply-templates>
				</xsl:if>
	

	</xsl:template>

</xsl:stylesheet>

