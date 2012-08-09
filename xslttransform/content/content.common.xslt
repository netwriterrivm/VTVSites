<!-- Templates ten behoeve van de  begrippenlijst-->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	
	<!-- Rendering van een afbeelding, afgezien van de default rendering wordt ook gekeken of er in de editor een link aangelegd is-->
	<xsl:template match="link_object_binary_image|link_object_binary_icon|link_object_binary_image_partner" mode="link_object_binary_image" >
		<xsl:param name="class">
			<xsl:choose>
				<xsl:when test="@align='left'">nw_first</xsl:when>
				<xsl:when test="@align='right'">nw_second</xsl:when>
				<xsl:otherwise>image_default</xsl:otherwise>
			</xsl:choose><xsl:if test="$content_fragment_type='linklist'"> listimageposition	</xsl:if><xsl:if test="name(.)='link_object_binary_icon'"> nw_text_icon</xsl:if></xsl:param>
		<!-- link en title van link bij plaatje ophalen-->
		<xsl:param name="link_alttag">
			<xsl:apply-templates select="link_object_class|link_code_file|link_object_document|link_object_url|link_object_map" mode="xhtml_title"/>
		</xsl:param>
		<xsl:param name="link_href">
			<xsl:apply-templates select="link_object_class|link_code_file|link_object_document|link_object_url|link_object_map" mode="url"/>
		</xsl:param>
		<xsl:param name="alttag">
			<xsl:choose>
				<xsl:when test="$link_alttag!=''">
					<xsl:value-of select="$link_alttag"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="object_binary/@object_binary_label"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:choose>

			<xsl:when test="$link_href!=''">
				<a href="{$link_href}" title="{$alttag}">
					<xsl:apply-templates select="object_binary" mode="xhtml_default">
						<xsl:with-param name="classname" select="$class"></xsl:with-param>
						<xsl:with-param name="alttag" select="$alttag"></xsl:with-param>
					</xsl:apply-templates>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="object_binary" mode="xhtml_default">
					<xsl:with-param name="classname" select="$class"></xsl:with-param>
					<xsl:with-param name="alttag" select="$alttag"></xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Templates voor het renderen van een definition list-->
	<xsl:template match="definitionlist" mode="definitionlist">
		<dl>
			<xsl:choose>
				<xsl:when test="@sort='asc'">
					<xsl:apply-templates select="definition_list_item" mode="widget_definitionlist">
						<xsl:sort select="definition_list_term" ></xsl:sort>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:when test="@sort='desc'">
					<xsl:apply-templates select="definition_list_item" mode="widget_definitionlist">
						<xsl:sort select="definition_list_term" order="descending" ></xsl:sort>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="definition_list_item" mode="widget_definitionlist"></xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose>

		</dl>
	</xsl:template>
	<xsl:template match="definition_list_item" mode="widget_definitionlist">
		<dt>
			<xsl:value-of select="definition_list_term"></xsl:value-of>
		</dt>
		<xsl:apply-templates select="descriptioncollection/definition_list_description" mode="widget_definitionlist"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="definition_list_description" mode="widget_definitionlist">
		<dd>
			<xsl:for-each select="child::*|text()">
				<xsl:apply-templates mode="paragraph_paracont_container_match_text" select="self::text()"></xsl:apply-templates>
				<xsl:apply-templates mode="deleted" select="self::deleted"></xsl:apply-templates>
				<xsl:apply-templates mode="added" select="self::added"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_bold" select="self::bold"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_italic" select="self::italic"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_super" select="self::super"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_sub" select="self::sub"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_code_file" select="self::link_code_file"></xsl:apply-templates>
				<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
			</xsl:for-each>
		</dd>
	</xsl:template>


	<!-- Lijst uitvoer-->
	<xsl:template match="list" mode="listwriter">
		<xsl:param name="childcount" select="count(*)"/>
		<xsl:param name="cssclass">
			<xsl:choose>
				<xsl:when test="$content_fragment_type='linklist'">
					<xsl:choose>
						<xsl:when test="@layout='Bullets'">menu bullets</xsl:when>
						<xsl:when test="@layout='Arrows'">menu</xsl:when>
						<xsl:when test="@layout='Nobullets'">unstyled anchors</xsl:when>
						<xsl:when test="@layout='Numbers'">menu</xsl:when>
						<xsl:when test="@layout='Letters'">menu</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
					<xsl:when test="@layout='Bullets'">bullets</xsl:when>
					<xsl:when test="@layout='Nobullets'">unstyled anchors</xsl:when>
					<xsl:when test="@layout='Arrows'">kb_linklist nw_arrows</xsl:when>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:if test="$childcount>0">
			<xsl:choose>
				<xsl:when test="@layout='Numbers' or @layout='Letters'">
					<ol>
						<xsl:if test="$cssclass!='' or @layout='Letters'">
							<xsl:attribute name="class">
								<xsl:value-of select="$cssclass"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="@layout"/>
							</xsl:attribute>
						</xsl:if>
						<!-- type-attribuut bestaat niet meer
						<xsl:if test="@layout='Letters'">
							<xsl:attribute name="type">a</xsl:attribute>
						</xsl:if>-->
						
						<xsl:apply-templates mode="listitemwriter" select="*" />
					</ol>
				</xsl:when>
				<xsl:otherwise>
					<ul>
						<xsl:if test="$cssclass!=''">
						<xsl:attribute name="class">
								<xsl:value-of select="$cssclass"/>
						</xsl:attribute>
						</xsl:if>
						<xsl:apply-templates mode="listitemwriter" select="*" />
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="listitem" mode="listitemwriter">
		<xsl:param name="position" select="position()"></xsl:param>
    
		<li>
      <xsl:attribute name="class" ><xsl:value-of select="../@layout"/>_item</xsl:attribute>
			<xsl:apply-templates select="." mode="listcontainer" />
			<xsl:apply-templates select="../*[position()=$position+1]" mode="childlistwriter" ><xsl:with-param name="position" select="$position+1"></xsl:with-param></xsl:apply-templates>
		</li>
	</xsl:template>
	<xsl:template match="list" mode="childlistwriter">
		<xsl:param name="position"></xsl:param>
		<xsl:apply-templates mode="listwriter" select="." />
		<xsl:apply-templates select="../*[position()=$position+1]" mode="childlistwriter" />
	</xsl:template>
	<xsl:template match="listitem" mode="childlistwriter">
		<xsl:param name="position"></xsl:param>
		<!-- Niets doen bij een listitem-->
	</xsl:template>
	<xsl:template match="listitem" mode="listcontainer">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="paragraph_paracont_container_match_text" select="self::text()"></xsl:apply-templates>
			<xsl:apply-templates mode="deleted" select="self::deleted"></xsl:apply-templates>
			<xsl:apply-templates mode="added" select="self::added"></xsl:apply-templates>
      <xsl:apply-templates mode="paragraph_paracont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_bold" select="self::bold"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_italic" select="self::italic"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_sub" select="self::sub"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_code_file" select="self::link_code_file"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
		   
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="list" mode="listitemwriter">
		<!-- Niets doen bij een list-->
	</xsl:template>
	
	<!-- Renderen van tabellen -->
	<xsl:template match="datatable" mode="datatable"> 
		<xsl:choose>
			<xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'">
				<xsl:apply-templates mode="render_table" select="." />
			</xsl:when><xsl:otherwise>
			<div class="table">
			   <xsl:apply-templates mode="render_table" select="." />
			</div></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="datatable" mode="render_table">
		<xsl:param name="thead_count" select="count(child::datarow[@layout='Kop' and count(preceding-sibling::datarow[@layout!='Kop'])=0])" />
		<table class="nw_table">
			<xsl:if test="@summary!=''">
						<xsl:attribute name="summary"><xsl:value-of select="@summary"/></xsl:attribute>
					</xsl:if>
			<xsl:if test="@IsAdded='True' or @IsDeleted='True'">
				<xsl:attribute name="class">
					<xsl:if test="@IsAdded='True'">addeditem</xsl:if>
					<xsl:if test="@IsDeleted='True'">deleteditem</xsl:if>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@width!=''">
			     <xsl:attribute name="width"><xsl:value-of select="@width"></xsl:value-of></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="datatablecaption" select="datatablecaption"></xsl:apply-templates>
			<!-- hebben we header regels die we in een thead kunnen zetten? Dan thead/tbody, anders alleen de rows renderen-->
		<xsl:choose>
			<xsl:when  test="$thead_count>0">
				<thead><xsl:apply-templates mode="datarow" select="child::datarow[@layout='Kop' and count(preceding-sibling::datarow[@layout!='Kop'])=0]"></xsl:apply-templates></thead>
				<tbody><xsl:apply-templates mode="datarow" select="child::datarow[@layout!='Kop' or (@layout='Kop' and count(preceding-sibling::datarow[@layout!='Kop'])>0)]"></xsl:apply-templates></tbody>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates mode="datarow" select="*"></xsl:apply-templates></xsl:otherwise>
		</xsl:choose>
		
		
			
			
		</table>
	</xsl:template>
	<xsl:template match="datatablecaption" mode="datatablecaption">
		<caption>
			<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
		</caption>
	</xsl:template>
	<xsl:template match="datatablecaption" mode="paracont">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_sub" select="self::sub"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<!-- moeten er staan, anders krijg je bogus teksten-->
	<xsl:template match="datatablecaption" mode="datarowcontainerth"></xsl:template>
	<xsl:template match="datatablecaption" mode="datarowcontainer"></xsl:template>
	<xsl:template match="datatablecaption" mode="datarow"></xsl:template>
	
	<xsl:template match="datatablecaption" mode="datarowtbodystart">
		<xsl:text disable-output-escaping="yes">&lt;tbody&gt;</xsl:text>
		</xsl:template>
	<!-- renderen van een tabelrij -->
	<xsl:template match="datarow" mode="datarow">
		<xsl:param name="rowpos" select="position()" />
		<xsl:param name="rowposplus" select="position()+1" />
		<xsl:param name="rowposmin" select="position()-1" />
		<xsl:param name="thcountprev" select="count(../datarow[@layout='Kop' and position()>$rowpos])" />
		<xsl:param name="rowcountprev" select="count(../datarow[position()>$rowpos])" />
		<xsl:param name="rowothercountprev" select="count(../datarow[position()>$rowpos and @layout!='Kop'])" />
		<xsl:param name="thcount" select="count(../datarow[@layout='Kop' and $rowpos>position()])" />
		<xsl:param name="tothercount" select="count(../datarow[@layout!='Kop' and $rowpos>position()])" />
		<xsl:param name="nextLayout" select="../datarow[position()=$rowposplus]/@layout" />
		<xsl:param name="class"><xsl:choose>
			<xsl:when test="@layout='Slecht'"> nw_table_low </xsl:when>
			<xsl:when test="@layout='Gemiddeld'"> nw_table_average </xsl:when>
			<xsl:when test="@layout='Goed'"> nw_table_good </xsl:when>
			<xsl:when test="@layout='Kop'"> nw_table_header </xsl:when>
			<xsl:when test="@layout='Tussenkop'"> nw_table_header_level2 </xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose></xsl:param>
			<xsl:apply-templates mode="datarowtagwriter" select=".">
				<xsl:with-param select="position()mod 2" name="is_odd_row"></xsl:with-param>
				<xsl:with-param name="class" select="$class"></xsl:with-param>
			</xsl:apply-templates>
		</xsl:template>

	<xsl:template match="datarow" mode="datarowtagwriter">
		<xsl:param name="class"></xsl:param>
		<xsl:param name="is_odd_row"></xsl:param>
		<xsl:param name="extraclass"><xsl:if test="@IsAdded='True'"> addeditem</xsl:if>
			<xsl:if test="@IsDeleted='True'"> deleteditem</xsl:if><xsl:choose>
				<xsl:when test="$is_odd_row='1'"> nw_table_row_odd</xsl:when>
				<xsl:otherwise> nw_table_row_even</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<tr>
			<!--<xsl:if test="@align!=''">
				<xsl:attribute name="align">
					<xsl:value-of select="@align"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@valign!=''">
				<xsl:attribute name="valign">
					<xsl:value-of select="@valign"/>
				</xsl:attribute>
			</xsl:if>-->
			<xsl:attribute name="class">
				<xsl:value-of select="$class"/>
				<xsl:value-of select="$extraclass"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@layout='Kop' or @layout='Tussenkop'">
					<xsl:apply-templates mode="header" select="*">
						<xsl:with-param name="parent_align" select="@align"></xsl:with-param>
						<xsl:with-param name="parent_valign" select="@valign"></xsl:with-param>
					</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates mode="default" select="*">
								<xsl:with-param name="parent_align" select="@align"></xsl:with-param>
						<xsl:with-param name="parent_valign" select="@valign"></xsl:with-param>
						    </xsl:apply-templates>
						</xsl:otherwise>
					</xsl:choose>
						<xsl:comment>DNC</xsl:comment>
			</tr>
	</xsl:template>
	
	<xsl:template match="datacell" mode="default">
		<xsl:param name="parent_align"></xsl:param>
		<xsl:param name="parent_valign"></xsl:param>
		<xsl:param name="align"><xsl:choose><xsl:when test="@align!=''"><xsl:value-of select="@align"/></xsl:when><xsl:otherwise><xsl:value-of select="$parent_align"/></xsl:otherwise></xsl:choose></xsl:param>
		<xsl:param name="valign"><xsl:choose><xsl:when test="@valign!=''"><xsl:value-of select="@valign"/></xsl:when><xsl:otherwise><xsl:value-of select="$parent_valign"/></xsl:otherwise></xsl:choose></xsl:param>
		<xsl:param name="width"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn"><xsl:value-of select="@width"/><xsl:value-of select="@code_file_name"/><xsl:value-of select="@object_class_title"/><xsl:value-of select="@object_map_label"/><xsl:value-of select="@object_document_label"/></xsl:with-param>
				<xsl:with-param name="charsIn" select="'%'" />
				<xsl:with-param name="charsOut" select="''" />
			</xsl:call-template></xsl:param>
	
		<td>
			
			<xsl:if test="@colspan!=''">
				<xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="$align!='' or $valign!='' or @width!=''">
				<xsl:attribute name="class"><xsl:if test="$align!=''"> nw_table_cell_align_<xsl:value-of select="$align"/></xsl:if><xsl:if test="$valign!=''"> nw_table_cell_valign_<xsl:value-of select="$valign"/></xsl:if><xsl:if test="@width!=''"> nw_width_<xsl:value-of select="$width"/>_percent</xsl:if></xsl:attribute>
			</xsl:if>
			<!--<xsl:if test="$align!=''">
				<xsl:attribute name="align">
					<xsl:value-of select="$align"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="$valign!=''">
				<xsl:attribute name="valign">
					<xsl:value-of select="$valign"/>
				</xsl:attribute>
			</xsl:if>-->
			<!--<xsl:attribute name="class">
				ha_<xsl:value-of select="@align"></xsl:value-of> va_<xsl:value-of select="@valign"></xsl:value-of>
			</xsl:attribute>-->
			<xsl:for-each select="child::*|text()">
				<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
				<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
				<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
				<xsl:apply-templates mode="datacell_datacellcont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			</xsl:for-each>
			<xsl:comment>DNC</xsl:comment>
		</td>
	</xsl:template>
	<xsl:template match="datacell" mode="header">
		<xsl:param name="parent_align"></xsl:param>
		<xsl:param name="parent_valign"></xsl:param>
		<xsl:param name="align"><xsl:choose><xsl:when test="@align!=''"><xsl:value-of select="@align"/></xsl:when><xsl:otherwise><xsl:value-of select="$parent_align"/></xsl:otherwise></xsl:choose></xsl:param>
		<xsl:param name="valign"><xsl:choose><xsl:when test="@align!=''"><xsl:value-of select="@valign"/></xsl:when><xsl:otherwise><xsl:value-of select="$parent_valign"/></xsl:otherwise></xsl:choose></xsl:param>
		
		<xsl:param name="width"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn"><xsl:value-of select="@width"/><xsl:value-of select="@code_file_name"/><xsl:value-of select="@object_class_title"/><xsl:value-of select="@object_map_label"/><xsl:value-of select="@object_document_label"/></xsl:with-param>
				<xsl:with-param name="charsIn" select="'%'" />
				<xsl:with-param name="charsOut" select="''" />
			</xsl:call-template></xsl:param>
		<th scope="col">
			<xsl:if test="@colspan!=''">
				<xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="$align!='' or $valign!='' or @width!=''">
				<xsl:attribute name="class"><xsl:if test="$align!=''"> nw_table_cell_align_<xsl:value-of select="$align"/></xsl:if><xsl:if test="$valign!=''"> nw_table_cell_valign_<xsl:value-of select="$valign"/></xsl:if><xsl:if test="@width!=''"> nw_width_<xsl:value-of select="$width"/>_percent</xsl:if></xsl:attribute>
			</xsl:if>
			<xsl:if test="@align!='' or @valign!='' or @width!=''">
				<xsl:attribute name="class"><xsl:if test="@align!=''"> nw_table_cell_align_<xsl:value-of select="@align"/></xsl:if><xsl:if test="@valign!=''"> nw_table_cell_valign_<xsl:value-of select="@valign"/></xsl:if><xsl:if test="@width!=''"> nw_width_<xsl:value-of select="$width"/>_percent</xsl:if></xsl:attribute>
			</xsl:if>
			<!--<xsl:if test="$align!=''">
				<xsl:attribute name="align">
					<xsl:value-of select="$align"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="$valign!=''">
				<xsl:attribute name="valign">
					<xsl:value-of select="$valign"/>
				</xsl:attribute>
			</xsl:if>-->
			<xsl:for-each select="child::*|text()">
				<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
				<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
				<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
				<xsl:apply-templates mode="datacell_datacellcont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			</xsl:for-each>
			<xsl:comment>DNC</xsl:comment>
		</th>
	</xsl:template>
	<xsl:template match="datarow" mode="datarowtbodystart">
		<xsl:if test="@layout='Kop'">
			<xsl:text disable-output-escaping="yes">&lt;tbody&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="datarow" mode="datarowtbodyend">
	</xsl:template>
	<xsl:template match="text()" mode="nw_editor">
		<span contenteditable="true" id="nwed{generate-id()}"><xsl:value-of select="."/></span>
	</xsl:template>
	<xsl:template match="dotnetcontrol" mode="dotnetcontrol_manual">
		<xsl:choose>
			<xsl:when test="$releaseoutputmode='1'">
				<div>
					<strong>.NET Control</strong>
					<table>
						<tr>
							<th colpan="2">General</th>
						</tr>
						<tr>
							<td>Id:</td>
							<td>
								<xsl:value-of select="@elementid"/>
							</td>
						</tr>
						<tr>
							<td>Register:</td>
							<td>
								<xsl:value-of select="@register"/>
							</td>
						</tr>
						<tr>
							<td>Show in preview modes:</td>
							<td>
								<xsl:value-of select="@outputpreview"/>
							</td>
						</tr>
						<tr>
							<td>Tagprefix:</td>
							<td>
								<xsl:value-of select="@tagprefix"/>
							</td>
						</tr>
						<tr>
							<td>Control name or tag name:</td>
							<td>
								<xsl:value-of select="@tagname"/>
							</td>
						</tr>
						<tr>
							<td collpan="2">Custom Control</td>
						</tr>
						<tr>
							<td>Assembly:</td>
							<td>
								<xsl:value-of select="@assembly"/>
							</td>
						</tr>
						<tr>
							<td collpan="2">Web User Control</td>
						</tr>
						<tr>
							<td>Source location:</td>
							<td>
								<xsl:value-of select="@src"/>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<strong>Attributes:</strong>
				</div>
				<table>
					<tr>
						<th>Name:</th>
						<th>Value:</th>
					</tr>
					<xsl:for-each select="attributes/dotnetcontrol_attribute">
						<tr>

							<td>
								<xsl:value-of select="@name"/>
							</td>

							<td>
								<xsl:value-of select="@value"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:when>
			<xsl:when test="(($releaseoutputmode='4' or $releaseoutputmode='5') and @outputpreview='no')">
				<div>
					<strong>.NET Control (Content not visible in preview) </strong>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'">
						--**&lt;**--contentplaceholder id="<xsl:value-of select="@elementid"/>" <xsl:for-each select="attributes/dotnetcontrol_attribute">
					<xsl:value-of select="@name"/>="<xsl:value-of select="@value"/>"

				</xsl:for-each> runat="server"/--**&gt;**--
					</xsl:when>
					<xsl:otherwise>
				<xsl:if test="@register='yes'">
					--**&lt;**--%@ Register <xsl:if test="@tagprefix!='[tagprefix]'">
						Tagprefix="<xsl:value-of select="@tagprefix"/>"
					</xsl:if> <xsl:if test="@namespace!='[namespace]'">
						Namespace="<xsl:value-of select="@namespace"/>"
					</xsl:if>
					<xsl:if test="@assembly!='[assembly]'">
						Assembly="<xsl:value-of select="@assembly"/>"
					</xsl:if> <xsl:if test="@src!='[src]'">
						Src="<xsl:value-of select="@src"/>"
					</xsl:if>  <xsl:if test="@src!='[src]' and @tagname!='[tagname]'">
						Tagname="<xsl:value-of select="@tagname"/>"
					</xsl:if>%--**&gt;**--
				</xsl:if>
				--**&lt;**--<xsl:value-of select="@tagprefix"/>:<xsl:value-of select="@tagname"/> <xsl:if test="@elementid!='[id]'">
					id="<xsl:value-of select="@elementid"/>"
				</xsl:if> runat="server"
				<xsl:for-each select="attributes/dotnetcontrol_attribute">
					<xsl:value-of select="@name"/>="<xsl:value-of select="@value"/>"

				</xsl:for-each>
				/--**&gt;**--
				</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- hrefinpage  -->
	<xsl:template match="frameid" mode="write_anchorlist">
		<xsl:param name="id"><xsl:apply-templates mode="get_frame_id" select="."></xsl:apply-templates></xsl:param>
		<xsl:param name="title">Direct naar:"<xsl:call-template name="clean_attribute_webrichtlijnen">
				<xsl:with-param name="attribute" select="../framelabel" />
			</xsl:call-template>"</xsl:param>
		<xsl:param name="href">#<xsl:value-of select="$id" /></xsl:param>
		<a class="textMenuLabel" title="{$title}" href="{$href}">
			<xsl:value-of select="../framelabel" />
		</a>
	</xsl:template>
	<xsl:template match="frameid" mode="get_frame_id"><xsl:variable name="prefix" select="'nwid_'" /><xsl:variable name="allowed" select="'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.:-_'"/><xsl:variable name="redaction_defined_anchor" select="translate(., translate(., $allowed, ''), '')" /><xsl:variable name="frame_id">
		<xsl:choose>
			<xsl:when test="$redaction_defined_anchor='' or  $redaction_defined_anchor='0' or  $redaction_defined_anchor='Id' or $redaction_defined_anchor='id' or $redaction_defined_anchor='[id]'"><xsl:choose>
				<xsl:when test="../framelabel!='' and ../framelabel!='[label]'"><xsl:value-of select="translate(../framelabel, translate(../framelabel, $allowed, ''), '')"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="@XlinkId" /></xsl:otherwise>
			</xsl:choose></xsl:when>
			<xsl:otherwise>
				<xsl:value-of select='$redaction_defined_anchor' />
			</xsl:otherwise>
		</xsl:choose></xsl:variable><xsl:if test="number(substring($frame_id,1,1))"><xsl:value-of select="$prefix" /></xsl:if><xsl:value-of select="$frame_id" />
	</xsl:template>
	<xsl:template match="framemenu" mode="framemenu">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='hidden'"></xsl:if>
						<xsl:if test="@layout='hidden_line'"></xsl:if>
						<xsl:if test="@layout='visible'">
							<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='visible_noline'">
							<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='visible_newline'">
							<li>
								<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
							</li>
						</xsl:if>
						<xsl:if test="@layout='visible_newline_noline'">
							<li>
								<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
							</li>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='hidden'"></xsl:if>
						<xsl:if test="@layout='hidden_line'"></xsl:if>
						<xsl:if test="@layout='visible'">
							<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='visible_noline'">
							<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='visible_newline'">
							<li>
								<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
							</li>
						</xsl:if>
						<xsl:if test="@layout='visible_newline_noline'">
							<li>
								<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
							</li>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='hidden'"></xsl:if>
				<xsl:if test="@layout='hidden_line'"></xsl:if>
				<xsl:if test="@layout='visible'">
					<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
				</xsl:if>
				<xsl:if test="@layout='visible_noline'">
					<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
				</xsl:if>
				<xsl:if test="@layout='visible_newline'">
					<li>
						<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
					</li>
				</xsl:if>
				<xsl:if test="@layout='visible_newline_noline'">
					<li>
						<xsl:apply-templates mode="write_anchorlist" select="../frameid"></xsl:apply-templates>
					</li>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column1" mode="column1">
		<xsl:apply-templates select="." mode="column"/>
	</xsl:template>
	<xsl:template match="column2" mode="column2">
		<xsl:apply-templates select="." mode="column"/>
	</xsl:template>
	<xsl:template match="column3" mode="column3">
		<xsl:apply-templates select="." mode="column"/>
	</xsl:template>
	<xsl:template match="column4" mode="column4">
		<xsl:apply-templates select="." mode="column"/>
	</xsl:template>
	<xsl:template match="column5" mode="column5">
		<xsl:apply-templates select="." mode="column"/>
	</xsl:template>
	<xsl:template match="content" mode="content_columncont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			<xsl:apply-templates mode="datatable" select="self::datatable"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_definitionlist" select="self::definitionlist"></xsl:apply-templates>
			<xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_content" select="self::link_content"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup" select="self::subgroup"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_dotnetcontrol" select="self::dotnetcontrol"></xsl:apply-templates>
			<xsl:apply-templates mode="banner" select="self::banner"></xsl:apply-templates>
			<xsl:apply-templates mode="box" select="self::box"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<!-- Handmatig template ivm stack overflow-->
	<xsl:template match="italic" mode="paraitalic">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="italic_paraitalic_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="bold" mode="italic_paraitalic_container_match_bold">
			<xsl:if test="count(child::*)>0 or count(child::text())>0">
		<strong>
			<xsl:apply-templates mode="parabold" select="."></xsl:apply-templates>
		</strong>
			</xsl:if>
	</xsl:template>
	<xsl:template match="link_object_map_swf" mode="region_link_object_map_swf">
		<xsl:param name="base"><xsl:call-template name="substring-before-last">
    <xsl:with-param name="string" select="object_map/@object_map_file" />
    <xsl:with-param name="delimiter" select="'/'" />
  </xsl:call-template></xsl:param>
		<xsl:param name="src"><xsl:if test="$releaseoutputmode!='2' and $releaseoutputmode!='3'">/vtvdata</xsl:if>/<xsl:value-of select="object_map/@object_map_file"></xsl:value-of></xsl:param>
		<xsl:param name="srcbase"><xsl:if test="$releaseoutputmode!='2' and $releaseoutputmode!='3'">/vtvdata</xsl:if>/<xsl:value-of select="$base"></xsl:value-of></xsl:param>
	<script>detectFlash();</script>
		<div id="flashMovieLayer" class="nw_object_map_swf">
	
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="500" height="531" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0">
    <param name="movie" value="{$src}" />
    <param name="wmode" value="transparent" />
    <param name="base" value="{$srcbase}" />
    <param name="play" value="true" />
	<param name="loop" value="false" />
    <param name="quality" value="high" />    
		<param name="menu" value="false" />    
    <embed src="{$src}" base="{$srcbase}" width="500" height="531"  wmode="transparent"  play="true"    loop="false"    quality="high"    menu="false"    type="application/x-shockwave-flash"    pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
			</object></div>
</xsl:template>
	<xsl:template match="link_language" mode="widget_link_language">
		<span lang="{language/@language_suffix}"><xsl:apply-templates select="." mode="languagecont"></xsl:apply-templates></span>
	</xsl:template>
	<xsl:template match="link_language" mode="languagecont">
			<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_sub" select="self::sub"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_code_file" select="self::link_code_file"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="@*|node()" mode="node_copy">
	<xsl:copy>
		<xsl:apply-templates select="@*|node()"  mode="node_copy"/>
	</xsl:copy>
</xsl:template>

	<xsl:template match="media_player" mode="media_player_manual">  
		<xsl:param name="media_id">media_<xsl:value-of select="@XlinkId" /></xsl:param>
		<xsl:param name="header_level"><xsl:value-of select="header/@level+1"/></xsl:param>
	<xsl:choose>
		
		<xsl:when test="($releaseoutputmode='2' or $releaseoutputmode='3') and $content_fragment_type='kbdefault'">
			<xsl:apply-templates select="." mode="node_copy"/>
		</xsl:when>
		<xsl:otherwise>
<!-- HIER BEGINT HET VIDEO DEEL -->
  <div class="tv">
   <xsl:apply-templates mode="header" select="header"/>
    <!-- copy this to your html page -->
    <div class="moviecontent">
      <p><xsl:value-of select="description"/>
      </p>
      <!-- description for the movie (optional) -->
      <div id="{$media_id}">
      <xsl:apply-templates mode="link_object_binary_image" select="alt_image/link_object_binary_image"/>
      </div>

      <ul>
        <li class="toggle moviedownloads">
			<xsl:element name="h{$header_level}">Download deze video</xsl:element>
        <xsl:choose>
			<xsl:when test="count(media_files/media_file)=0">Voeg media bestanden toe.</xsl:when>
			<xsl:otherwise><ul>
				<xsl:apply-templates mode="media_file" select="media_files/media_file" />
			</ul></xsl:otherwise>
		</xsl:choose>
          
        </li>
		  <xsl:if test="count(descendant::transcription_item)>0">
			    <li class="toggle transcription">
			<xsl:element name="h{$header_level}">Uitgeschreven tekst</xsl:element>
        <div>
			<xsl:apply-templates select="descendant::transcription_item" mode="transcription_item"/>
		</div>
			   </li>
		  </xsl:if>
      
        
      
      </ul>

    </div>
  </div>
<!-- HIER EINDIGT HET VIDEO DEEL --></xsl:otherwise>
	</xsl:choose></xsl:template>
	<xsl:template match="transcription_item" mode="transcription_item">
		  
            <p>
              <span class="handeling"><xsl:value-of select="transcription_scene"/></span> <xsl:value-of select="transcription_text"/>
            </p>   
	</xsl:template>
	<xsl:template match="media_file" mode="media_file">
		<xsl:param name="src"><xsl:apply-templates mode="url" select="src/link_object_binary_image/object_binary"/></xsl:param>
		<xsl:param name="label"><xsl:choose><xsl:when test="@type='mp4'">Video voor Apple Quicktime Player</xsl:when>
		<xsl:when test="@type='mp3'">Muziekbestand</xsl:when>
		<xsl:when test="@type='wmf'">Video voor Windows Media Player</xsl:when>
		<xsl:when test="@type='3gp'">Video voor mobiel gebruik</xsl:when>
			<xsl:otherwise>Ondertitelingsbestand</xsl:otherwise></xsl:choose></xsl:param>
		<xsl:param name="type"><xsl:choose><xsl:when test="@type='mp4'">Video</xsl:when>
		<xsl:when test="@type='mp3'">Audio</xsl:when>
		<xsl:when test="@type='wmf'">Video</xsl:when>
		<xsl:when test="@type='3gp'">Video</xsl:when><xsl:otherwise>Ondertitels</xsl:otherwise></xsl:choose></xsl:param>
		<xsl:param name="iconbaseurl"><xsl:choose>
			<xsl:when test="$releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode='5'">/NetWriterGui/images/icons/</xsl:when>
			<xsl:otherwise><xsl:choose>
				<xsl:when test="$content_fragment_type='kbdefault'">/frontend_20/assets/img/icons/</xsl:when>
				<xsl:when test="$content_fragment_type='cgl'">/LoketGezondLeven/images/</xsl:when>
				<xsl:otherwise>/VtvSites/images/</xsl:otherwise>
			</xsl:choose></xsl:otherwise>
		</xsl:choose></xsl:param>
		<xsl:param name="iconurl"><xsl:value-of select="$iconbaseurl"/><xsl:choose><xsl:when test="@type='mp4' ">qt-ikoon.gif</xsl:when>
		<xsl:when test="@type='mp3'">mp3-ikoon.gif</xsl:when>
		<xsl:when test="@type='wmf'">wmv-ikoon.gif</xsl:when>
		<xsl:when test="@type='3gp'">3gp-ikoon.gif</xsl:when>
			<xsl:otherwise>srt-ikoon.gif</xsl:otherwise></xsl:choose></xsl:param>
		<xsl:if test="@type!='flv'">
		 <li>
              <a href="{$src}"><xsl:value-of select="$label"/>
              <span class="metageg"><xsl:value-of select="$type"></xsl:value-of> | <xsl:value-of select="date"/> | 
              <img src="{$iconurl}" alt="" /><xsl:value-of select="@type"/>, <xsl:value-of select="length"/> , <xsl:value-of select="size"/> </span></a>
            </li>
           </xsl:if>
      			
  </xsl:template>
  <xsl:template match="survey" mode="survey_manual" >
    	
    
        	--**&lt;**--uc_nw_survey:survey id="survey_<xsl:value-of select="@XlinkId"/>" ResultsVisible="<xsl:value-of select="@results_visible"></xsl:value-of>"  ResultsEditable="<xsl:value-of select="@results_editable"></xsl:value-of>"  SubmitMessage="<xsl:value-of select="submit_message"></xsl:value-of>" runat="server"--**&gt;**--
         --**&lt;**--SurveyConfiguration--**&gt;**----**&lt;**--Configuration--**&gt;**--<xsl:apply-templates select="survey_item" mode="survey_manual"></xsl:apply-templates>
         --**&lt;**--/Configuration--**&gt;**----**&lt;**--/SurveyConfiguration--**&gt;**--
          --**&lt;**--/uc_nw_survey:survey--**&gt;**--
				
  </xsl:template>
  <xsl:template match="survey_item" mode="survey_manual" xmlns:uc_survey="http://none" >--**&lt;**--SurveyItem  id="survey_item_<xsl:value-of select="@XlinkId"/>" SurveyQuestion="<xsl:value-of select="survey_question"></xsl:value-of>" Layout="<xsl:value-of select="@layout"/>" NetwriterColor="<xsl:value-of select="@netwriter_color"/>" HeaderLevel="<xsl:value-of select="@header_level"/>" SurveyQuestionType="<xsl:value-of select="@survey_question_type"/>"--**&gt;**--
  <xsl:apply-templates select="survey_answers/survey_answer" mode="survey_manual"></xsl:apply-templates>
  --**&lt;**--/SurveyItem--**&gt;**--</xsl:template>
  <xsl:template match="survey_answer" mode="survey_manual" xmlns:uc_survey="http://none" >
    --**&lt;**--SurveyAnswer SurveyAnswerIsCorrect="<xsl:value-of select="@survey_answer_is_correct"/>"  id="survey_item_answer<xsl:value-of select="@XlinkId"/>" Answer="<xsl:value-of select="."/>" --**&gt;**--
    
    --**&lt;**--/SurveyAnswer--**&gt;**--
  </xsl:template>
    <xsl:template match="link_organisation" mode="link_zgg_beheerder">
    <xsl:param name="searchpageurl"><xsl:choose><xsl:when test="$releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode='5'">http://www.zorggegevens.nl/algemeen/zoekpagina/default.aspx?searchmode=beheerder&amp;searchtext=</xsl:when><xsl:otherwise>/algemeen/zoekpagina/default.aspx?searchmode=beheerder&amp;searchtext=</xsl:otherwise></xsl:choose></xsl:param>
    <xsl:param name="label"><xsl:value-of select="organisation/@organisation_name"/></xsl:param><span class="zgg_tag_cloud_beheerder">
    <a href="{$searchpageurl}{$label}" title="{$label}">
      <xsl:value-of select="$label"/>
    </a></span>
  </xsl:template>
</xsl:stylesheet>