<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template name="CPHSiteTabs">
	<ul class="nav_main">
				<li>
					<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22'">
							<xsl:attribute name="class">sel</xsl:attribute>	
					</xsl:if>
					<a>
						<xsl:if test="/rsistructurenode/@outputmode='1'">
							<xsl:attribute name="class">nw_red_context_menu_anchor</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="href"><xsl:choose>
								<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3') and /rsistructurenode/currentstructurenode/siteconfig/layout/@home_tab_url!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@home_tab_url"/></xsl:when>
<xsl:otherwise><xsl:apply-templates select="/rsistructurenode/currentstructurenode/root" mode="url"></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@home_tab_title"/>
						</xsl:attribute>
						<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@home_tab_label"/>
					</a>
					<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/root" mode='index_access_icon_tree' >
						<xsl:with-param name="firstposition" select="'true'" />
						<xsl:with-param name="lastposition" select="'true'" />
					</xsl:apply-templates>

				</li>
		<xsl:if test ="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode!='classic'">
					<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/root/*[@object_type_id='22' or @object_type_id='23'  or @object_type_id='3' or @object_type_id='53']" mode="xhtml_link_list">
						<xsl:with-param name="display_childs">false</xsl:with-param>
						<xsl:with-param name="classname_open">sel</xsl:with-param>
						<xsl:with-param name="classname_active">sel</xsl:with-param>		

					</xsl:apply-templates>
				</xsl:if>
			</ul>

	</xsl:template>

</xsl:stylesheet>

