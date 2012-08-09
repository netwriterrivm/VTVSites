<!-- Templates ten behoeve van het vullen van de Content placeholder -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />

	<!--Content placeholder -->
	<xsl:template name="CPHContent">
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Object type id van het actieve knooppunt-->
		<xsl:param name="object_type_id"><xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/></xsl:param>
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="object_type_id_footer">{<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>}</xsl:param>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Geeft aan of er iets in de linkerberm staat-->
		<xsl:param name="CPHTreeView_filled"><xsl:call-template name="CPHTreeView_filled"></xsl:call-template></xsl:param>
		<!-- Teller om te kijken of er een tong is -->
		<xsl:param name="content_tong_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='12'])"></xsl:param>
		<xsl:param name="content_rechterberm_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='11'])"></xsl:param>
		<div id="hoofd_content">
			<xsl:attribute name="class"> 
				<xsl:choose>
					<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' and  /rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='classic' and count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='11'])=0 ">content_main wide</xsl:when>
					<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' and  /rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='classic' and count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='11'])>0 ">content_main</xsl:when>
					<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' and  $content_tong_count>0">content_main</xsl:when>
					<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' and  $content_tong_count='0' and $content_rechterberm_count='0'">content_main nw_home_full_width</xsl:when>
					<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' and  $content_tong_count='0'">content_main nw_home_no_tong</xsl:when>
				<xsl:otherwise>
				<xsl:choose> 
					<xsl:when test="($object_type_id='2' or $object_type_id='5' or $object_type_id='6' or $object_type_id='8') and /rsistructurenode/currentstructurenode/siteconfig/layout/@content_page_mode='hidden'">line margin_top_5</xsl:when>
					<xsl:when test="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='11'])>0 and $CPHTreeView_filled='true'">content_main</xsl:when>
					<xsl:when test="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='11'])>0 and $CPHTreeView_filled!='true'">content_main</xsl:when>
					<xsl:when test="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='11'])=0 and $CPHTreeView_filled='true'">content_main wide</xsl:when>
					<xsl:otherwise>line margin_top_5</xsl:otherwise>
				</xsl:choose><xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/layout/@table_layout='color'"> nw_color_table</xsl:if><xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/layout/@add_content_seperator='true'"> nw_content_seperator</xsl:if>					
			</xsl:otherwise>
		</xsl:choose>
		</xsl:attribute>
      
		<xsl:choose>
			<!-- Onderwerpen, Siteroot en webpagina's-->
			<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' or /rsistructurenode/currentstructurenode/structure/@object_type_id='23' or /rsistructurenode/currentstructurenode/structure/@object_type_id='53' ">
				<!-- Titel -->
				<xsl:apply-templates mode ="content_pane_title" select="/rsistructurenode/currentstructurenode/activenode/object_class">
					<xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
				</xsl:apply-templates>
				<!-- Info (optioneel) -->
				<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*" mode="info" />
				<!-- Inhoudsopgave content midden berm-->
				<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*" mode="write_ul" >
					<xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
					<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
				</xsl:apply-templates>
				<!-- Printversie ondeliggende content (indien zo geconfigureerd)-->
				<xsl:if test="$releaseoutputmode!='1' and (/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@list_children_content='true' or (/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@list_children_content='netwriter' and $releaseoutputmode='4') ) and count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='2' or @object_type_id='5' or @object_type_id='6' or @object_type_id='8'])>0">
					<div class="hide_screen">
						<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@list_children_content_class!=''">
							<xsl:attribute name="class"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@list_children_content_class"></xsl:value-of></xsl:attribute>
						</xsl:if>
						<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='2' or @object_type_id='5' or @object_type_id='6' or @object_type_id='8']" mode="xhtml_default">
							<xsl:with-param name="editor_enabled" select="'false'" />
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
						</xsl:apply-templates>
					</div>
				</xsl:if>
				
		
			</xsl:when>
			<!-- Overige paginasoorten-->
			<xsl:otherwise>
					<!-- Paragraaf, editor doorgeven-->
						<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]" mode="xhtml_default">
							<xsl:with-param name="editor_enabled" select="'true'" />
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
					
						</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
      
    <!-- AddThis toevoegen aan de contentkant van de pagina. Zie ook AddThis.xslt en de sitexml.-->
    <xsl:apply-templates mode="addthis" select="/rsistructurenode/currentstructurenode/siteconfig/layout/addthis[@position='middenberm']"/>
      
    <!-- Literatuurlijst en definitielijst-->
		<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_reference_list='true' or /rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_definition_list='true'">
			<div>
				<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_reference_list='true'">
					<netwriter_list type="reference" template="lijst_bronnen_literatuur" structure_id="{/rsistructurenode/currentstructurenode/structure/@structure_id}" mode="children" />
				</xsl:if>
				<xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_definition_list='true'">
					<netwriter_list type="definition" template="lijst_afkortingen_definities" structure_id="{/rsistructurenode/currentstructurenode/structure/@structure_id}" mode="children" />
				</xsl:if>
			</div>
		</xsl:if>
    <!-- Box toevoegen op alle pagina's-->
    <xsl:call-template name="printversion_toolbox"></xsl:call-template>
    <!--Contentfooter letterlijk vernemen uit de siteconfig. Verwijderen xlnkid's-->
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/siteconfig/footers/footer[contains(@object_type_id,$object_type_id_footer)]" mode="footer" />
		<!--Sitestat teller aanroepen bij een Release-->
		<xsl:call-template name="sitestat_counter"><xsl:with-param name="show_objectid" select="'no'"/></xsl:call-template>

		  <xsl:comment>Clickzone</xsl:comment>
				</div>
	</xsl:template>
	

	<!--<summary>Template om inhoud weg te schrijven, in geval van een lijst ook de ul tag.</summary>-->
	<!--<createdate>23-08-2007</createdate>-->
	<!--<author>Wilbert Corts</author>-->
	<xsl:template match="*" mode="write_ul">
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Kijken of huidige een lijst is. -->
		<xsl:param name="currentIsList">
			<xsl:apply-templates select="." mode="is_list" />
		</xsl:param>
		<!-- Kijken of vorige een lijst is. -->
		<xsl:param name="prefIsList">
			<xsl:apply-templates select="preceding-sibling::*[position()=1]" mode="is_list" />
		</xsl:param>
		<!-- Kijken of volgende een lijst is. -->
		<xsl:param name="nextIsList">
			<xsl:apply-templates select="following-sibling::*[position()=1]" mode="is_list" />
		</xsl:param>
		<!-- Als huidige een lijst is, én vorige geen lijst moet er nog een ul begin tag gerenderd worden. -->
		<xsl:if test="$currentIsList='true' and ($prefIsList='false' or position()=1)">
			<xsl:text disable-output-escaping="yes">&lt;ul class="nw_index_list"&gt;</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$currentIsList='true'">
				<xsl:apply-templates select="." mode="info" />
				<!-- Inhoud wegschrijven, link binnen li element -->
				<xsl:choose>
					<!-- Interne verwijzing is een uitzondering, hier wordt (indien gevuld) het label getoond-->
					<xsl:when test="@object_type_id='3' and (/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs' and /rsistructurenode/currentstructurenode/structure/@structure_level='0')"></xsl:when>
					<xsl:when test="@object_type_id='3' and ((/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs' and /rsistructurenode/currentstructurenode/structure/@structure_level>'0') or (/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode!='tabs'))">
						
							<xsl:apply-templates select="." mode="xhtml_link_list">
								<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
								<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
								<xsl:with-param name="show_authors" select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_authors"></xsl:with-param>
								<xsl:with-param name="show_authors_class" select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_authors_class"></xsl:with-param>
								<xsl:with-param name="organisation_name" select="/rsistructurenode/currentstructurenode/siteconfig/@organisation_name" ></xsl:with-param>
														<xsl:with-param name="firstposition" select="position()=1" />
						<xsl:with-param name="lastposition" select="position()=last()" />
								<xsl:with-param name="label">
									<xsl:choose>
										<xsl:when test="@object_class_label!=''">
											<xsl:value-of select="@object_class_label"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@object_class_title"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
							</xsl:apply-templates>
						
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="." mode="xhtml_link_list">
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="show_authors" select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_authors"></xsl:with-param>
							<xsl:with-param name="show_authors_class" select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_authors_class"></xsl:with-param>
							<xsl:with-param name="organisation_name" select="/rsistructurenode/currentstructurenode/siteconfig/@organisation_name" ></xsl:with-param>
													<xsl:with-param name="firstposition" select="position()=1" />
						<xsl:with-param name="lastposition" select="position()=last()" />
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="." mode="info" />
				<!-- Inhoud wegschrijven, maar alleen voor de content die in de middenberm weggeschreven moet worden -->
				<xsl:choose>
					<xsl:when test="@object_type_id='1'">
						<!-- Header level doorgeven bij kopregels-->
						<xsl:apply-templates select="." mode="xhtml_default">
							<xsl:with-param name="header_top_level" select="$header_top_level" />
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
						</xsl:apply-templates>
					</xsl:when>
					
						<!--<xsl:when test="@object_type_id='6' or @object_type_id='8'">
							<xsl:if test="/rsistructurenode/@outputmode='1' or /rsistructurenode/@outputmode='4'">
						 <xsl:apply-templates select="." mode="xhtml_link_list">
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
													<xsl:with-param name="firstposition" select="position()=1" />
						<xsl:with-param name="lastposition" select="position()=last()" />
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="show_authors" select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_authors"></xsl:with-param>
							<xsl:with-param name="show_authors_class" select="/rsistructurenode/currentstructurenode/siteconfig/contentcontainer/@show_authors_class"></xsl:with-param>
							<xsl:with-param name="organisation_name" select="/rsistructurenode/currentstructurenode/siteconfig/@organisation_name" ></xsl:with-param>
						</xsl:apply-templates></xsl:if>
						</xsl:when>-->
          <xsl:when test="@object_type_id='9' and @xml_template_id='3'">
            <div class="nw_carrousel">
              <!-- Paragraaf, editor doorgeven-->
              <xsl:apply-templates select="." mode="xhtml_default">
                <xsl:with-param name="editor_enabled" select="'true'" />
                <xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
                <xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
                <xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
                <xsl:with-param name="xslt_template_path">
                  <xsl:choose>
                    <xsl:when test="/rsistructurenode/@outputmode='100'">/Rijksbreed/xslttransform/content/default.editor.xslt</xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                  </xsl:choose>
                </xsl:with-param>
              </xsl:apply-templates>
            </div>
          </xsl:when>
					<xsl:when test="(@object_type_id='9'and @xml_template_id!='3') or @object_type_id='67' or @object_type_id='28'">
						<!-- Paragraaf, editor doorgeven-->
						<xsl:apply-templates select="." mode="xhtml_default">
							<xsl:with-param name="editor_enabled" select="'true'" />
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							<xsl:with-param name="header_top_level" select="$header_top_level"></xsl:with-param>
							<xsl:with-param name="xslt_template_path"><xsl:choose>
								<xsl:when test="/rsistructurenode/@outputmode='100'">/Rijksbreed/xslttransform/content/default.editor.xslt</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose></xsl:with-param>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:when test="@object_type_id='10' or @object_type_id='11' or @object_type_id='12'"></xsl:when>
					
					<xsl:otherwise>

					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="@object_type_id!='23' and @object_type_id!='22' and $currentIsList!='true' and @object_type_id!='10' and @object_type_id!='11' and @object_type_id!='12'">
			
			<xsl:apply-templates select="." mode='index_access_icon_contents' >
				<xsl:with-param name="firstposition" select="position()=1" />
				<xsl:with-param name="lastposition" select="position()=last()" />
			</xsl:apply-templates>
		</xsl:if>
		<!-- Als huidige een lijst is, én als vorige geen lijst moet er nog een ul eind tag gerenderd worden -->
		<xsl:if test="$currentIsList='true' and ($nextIsList='false' or position()=last())">
			<xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
		</xsl:if>
	</xsl:template>


	<xsl:template match="*" mode="info">
		<!--<br /><xsl:value-of select="position()"/> - <xsl:value-of select="@object_type_id"/><br />-->
	</xsl:template>

</xsl:stylesheet>

