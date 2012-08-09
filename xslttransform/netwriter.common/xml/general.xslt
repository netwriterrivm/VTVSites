<!--  Algemene templates  -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!-- Template voor uitvoer pagina titel, gebruikt in Title Element -->
	<xsl:template match="code_file|object_class|root|object_document|object_map" mode="pagetitle">
		<xsl:call-template name="replaceCharsInString">
			<xsl:with-param name="stringIn">
				<xsl:value-of select="@root_name"/>
				<xsl:value-of select="@code_file_name"/>
				<xsl:value-of select="@object_class_title"/>
				<xsl:value-of select="@object_map_label"/>
				<xsl:value-of select="@object_document_label"/>
			</xsl:with-param>
			<xsl:with-param name="charsIn" select="'&quot;'" />
			<xsl:with-param name="charsOut" select="' '" />
		</xsl:call-template>
		<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id!='22'">
			<xsl:text> - </xsl:text><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_name"/>
		</xsl:if>
	</xsl:template>
	<!--<summary>Weergave van menu redactiesysteem in de boom.</summary>-->
	<!--<createdate>06-04-2005</createdate>-->
	<!--<author>Jan de Bruin</author>-->
	<xsl:template match="*" mode='index_access_icon_tree'>
		<xsl:param name="firstposition" select="dummy"/>
		<xsl:param name="lastposition" select="dummy"/>
		<xsl:param name="context_root_type" select="ancestor::root/@root_type_id"></xsl:param>
		<xsl:param name="current_root_type"  select="/rsistructurenode/currentstructurenode/root/@root_type_id"></xsl:param>
		<xsl:param name="showIt">
			<xsl:choose>
				<xsl:when test="$context_root_type='3' and $current_root_type!='3'"></xsl:when>
				<xsl:otherwise>True</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="status_id">
			<xsl:choose>
				<xsl:when test="@status_id!=''">
					<xsl:value-of select="@status_id" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
				<!--Status_id moet een getal zijn, voor root is status niet van belang, daarom waarde 0-->
			</xsl:choose>
		</xsl:param>
		<xsl:param name="object_id">
			<xsl:value-of select="@root_id" />
			<xsl:value-of select="@object_class_id" />
			<xsl:value-of select="@code_file_id" />
			<xsl:value-of select="@object_document_id" />
			<xsl:value-of select="@object_map_id" />
			<xsl:value-of select="@object_header_id" />
			<xsl:value-of select="@object_url_id" />
			<xsl:value-of select="@object_external_id" />
		</xsl:param>
		<xsl:param name="src">
			showClassMenu(<xsl:value-of select="@structure_id" />,<xsl:value-of select="$object_id"/>,<xsl:value-of select="@object_type_id" />,'','','<xsl:value-of select="$firstposition" />','<xsl:value-of select="$lastposition" />',<xsl:value-of select="$status_id" />);
		</xsl:param>
		<xsl:if test="/rsistructurenode/@outputmode='1'">
			<xsl:if test="$showIt!=''">

				<!--<img src="/NetWriterGui/images/arrowdown_1.gif" class="nw_red_context_menu"  oncontextmenu = "{$src}return false;" onclick="{$src}"  />-->
  <img class="nw_contextmenu" onmouseover="top.window.showRedactionTooltip($('#msgMenuInfo').html(),iMouseX,iMouseY, true);" onmouseout="top.window.hideRedactionTooltip();" onclick="showClassMenuTop({@structure_id},{$object_id},{@object_type_id},'','','{$firstposition}','{$lastposition}',{$status_id});hideRedactionTooltip();" src="http://vtv.netwriter.nl/NetWriterGui/images/context_menu.gif" />
  <img class="nw_contextmenu" onmouseover="top.window.showRedactionTooltip($('#msgQuickinfo').html(),iMouseX,iMouseY, true);" onclick="showProperties('nw_menu_infomenu',{@structure_id},{$object_id},{@object_type_id}, false);hideRedactionTooltip();" src="http://vtv.netwriter.nl/NetWriterGui/images/help_small_1.gif" />
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<!--<summary>Weergave van menu redactiesysteem in de inhoudsopgave.</summary>-->
	<!--<createdate>06-04-2005</createdate>-->
	<!--<author>Jan de Bruin</author>-->
	<xsl:template match="*" mode='index_access_icon_contents'>
		<xsl:param name="firstposition" select="dummy"/>
		<xsl:param name="lastposition" select="dummy"/>
		<xsl:param name="context_root_type" select="ancestor::root/@root_type_id"></xsl:param>
		<xsl:param name="current_root_type"  select="/rsistructurenode/currentstructurenode/root/@root_type_id"></xsl:param>
		<xsl:param name="object_id">
			<xsl:value-of select="@root_id" />
			<xsl:value-of select="@object_class_id" />
			<xsl:value-of select="@code_file_id" />
			<xsl:value-of select="@object_document_id" />
			<xsl:value-of select="@object_map_id" />
			<xsl:value-of select="@object_header_id" />
			<xsl:value-of select="@object_url_id" />
			<xsl:value-of select="@object_external_id" />
		</xsl:param>
		<xsl:param name="showIt">
			<xsl:choose>
				<xsl:when test="$context_root_type='3' and $current_root_type!='3'"></xsl:when>
				<xsl:otherwise>True</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="status_id">
			<xsl:if test="@status_id!=''">, <xsl:value-of select="@status_id" />
			</xsl:if>
		</xsl:param>
		<xsl:param name="src">
			showObjectMenu(<xsl:value-of select="@structure_id" />,<xsl:value-of select="$object_id"/>,<xsl:value-of select="@object_type_id" />,'','','<xsl:value-of select="$firstposition" />','<xsl:value-of select="$lastposition" />'<xsl:value-of select="$status_id" />);
		</xsl:param>
		<xsl:if test="/rsistructurenode/@outputmode='1'">
			<xsl:if test="$showIt!=''">
				<!--<img  class="nw_red_context_menu"  oncontextmenu = "{$src}return false;" onclick="{$src}" src="/NetWriterGui/images/arrowdown_1.gif"  />-->
        <img  class="nw_contextmenu nw_contextmenu_firsticon" onmouseover="top.window.showRedactionTooltip($('#msgMenuInfo').html(),iMouseX,iMouseY, true);" onmouseout="top.window.hideRedactionTooltip();" onclick="showObjectMenuTop({@structure_id},{$object_id},{@object_type_id},'','','{$firstposition}','{$lastposition}'{$status_id});hideRedactionTooltip();" src="/NetWriterGui/images/context_menu.gif" />
        <img  class="nw_contextmenu" onmouseover="top.window.showRedactionTooltip($('#msgQuickinfo').html(),iMouseX,iMouseY, true);" onclick="showProperties('nw_menu_nfomenu',{@structure_id},{@object_type_id},{@object_type_id},false);hideRedactionTooltip();" src="/NetWriterGui/images/help_small_1.gif" />
        <xsl:if test="name()='object_document' or name()='object_map'">
          <xsl:choose>
            <xsl:when  test="@status_id='7'">
              
             
              <img class="nw_contextmenu" onmouseover="top.window.showRedactionTooltip($('#msgOpenEditorMaintenance').html(),iMouseX,iMouseY, true);" onmouseout="top.window.hideRedactionTooltip();" onclick="openEditorAndRefresh(1,{@structure_id});hideRedactionTooltip();" src="http://vtv.netwriter.nl/NetWriterGui/images/edit1.gif" />
              <img class="nw_contextmenu" onmouseover="top.window.showRedactionTooltip($('#msgOpenEditorTechnicalMaintenance').html(),iMouseX,iMouseY, true);" onmouseout="top.window.hideRedactionTooltip();" onclick="openEditorAndRefresh(2,{@structure_id});hideRedactionTooltip();" src="http://vtv.netwriter.nl/NetWriterGui/images/edit8.gif"/>
            </xsl:when>
            <xsl:otherwise><img class="nw_contextmenu" onmouseover="top.window.showRedactionTooltip($('#msgOpenEditor').html(),iMouseX,iMouseY, true);" onmouseout="top.window.hideRedactionTooltip();" onclick="openEditor(0,{@structure_id});hideRedactionTooltip();" src="/NetWriterGui/images/edit.gif" /></xsl:otherwise>
          </xsl:choose>
        
          </xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Default NetWriter classes-->
	<xsl:template match="*" mode="netwriter_default_class">
		<xsl:choose>
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@netwriter_classes_mode='classic'">
			<xsl:choose>
			<xsl:when test="@object_type_id='2' or @object_type_id='6' or @object_type_id='5' or @object_type_id='8'">
				<!-- Parameter cssclassbase: Geeft aan wát wordt weergegeven. (document, detaildocument, kaart of detailkaart) -->
				<xsl:variable name="cssclassbase"><xsl:if test="@object_type_id='2'">ObjectDocument</xsl:if><xsl:if test="@object_type_id='6'">ObjectDocumentDetail</xsl:if><xsl:if test="@object_type_id='5'">ObjectMap</xsl:if><xsl:if test="@object_type_id='8'">ObjectMapDetail</xsl:if></xsl:variable><xsl:variable name="cssclass">
		<xsl:choose>
			<xsl:when test="/rsistructurenode/@outputmode='1' or /rsistructurenode/@outputmode='4'">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus<xsl:value-of select="@status_id"/><xsl:if test="@object_document_production=1">Prod</xsl:if><xsl:if test="@object_map_production=1">Prod</xsl:if></xsl:when>
			<xsl:when test="/rsistructurenode/@outputmode='2'">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus<xsl:value-of select="@status_id"/><xsl:if test="@object_document_production=1">Prod</xsl:if><xsl:if test="@object_map_production=1">Prod</xsl:if></xsl:when>
			<xsl:when test="/rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5'"><xsl:if test="(@object_type_id='2' or @object_type_id='6') and @object_document_production=1">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus7</xsl:if><xsl:if test="(@object_type_id='5' or @object_type_id='8') and @object_map_production=1">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus7Prod</xsl:if></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable><xsl:value-of select="$cssclass"/></xsl:when>
			<xsl:when test="@object_type_id='3'">indexContentsObjectClassIcon</xsl:when>
			<xsl:when test="@object_type_id='7'">indexContentsObjectUrlIcon</xsl:when>
			<xsl:when test="@object_type_id='22'"></xsl:when>
			<xsl:when test="@object_type_id='28'"><xsl:variable name="cssclassbase"><xsl:if test="@object_binary_type_id='12'">ObjectBinaryWord</xsl:if><xsl:if test="@object_binary_type_id='13'">ObjectBinaryExcel</xsl:if></xsl:variable><xsl:variable name="cssclass">
		<xsl:choose>
			<xsl:when test="/rsistructurenode/@outputmode='1' or /rsistructurenode/@outputmode='4'">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus<xsl:value-of select="@status_id"/><xsl:if test="@object_binary_production=1">Prod</xsl:if></xsl:when>
			<xsl:when test="/rsistructurenode/@outputmode='2' and @status_id>2">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus<xsl:value-of select="@status_id"/><xsl:if test="@object_binary_production=1">Prod</xsl:if></xsl:when>
			<xsl:when test="/rsistructurenode/@outputmode='3'"><xsl:if test="@object_binary_production=1 or @object_binary_type_id='12' or @object_binary_type_id='13'">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus7Prod</xsl:if></xsl:when>
			<xsl:when test="/rsistructurenode/@outputmode='5' or /rsistructurenode/@outputmode='6'">indexContents<xsl:value-of select="$cssclassbase"/>IconStatus7Prod</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable><xsl:value-of select="$cssclass" /></xsl:when>
			<xsl:when test="@object_type_id='53'">indexLink</xsl:when>
			<xsl:otherwise>indexDefault<xsl:value-of select="@object_type_id"/></xsl:otherwise></xsl:choose>
			</xsl:when>
			<xsl:otherwise>
		<xsl:choose>
			<xsl:when test="name()='object_header'">nw_header</xsl:when>
			<xsl:when test="name()='object_document'">nw_document <xsl:if test="@object_type_id='6'"> nw_detail_document</xsl:if></xsl:when>
			<xsl:when test="name()='object_map'">nw_map<xsl:if test="@object_type_id='8'"> nw_detail_map</xsl:if></xsl:when>
			<xsl:when test="name()='object_url'">nw_url</xsl:when>
			<xsl:when test="name()='root'">nw_root</xsl:when>
			<xsl:when test="name()='object_class'">nw_class<xsl:if test="@object_type_id='3'"> nw_class_internal</xsl:if></xsl:when>
			<xsl:when test="name()='object_binary'">nw_binary nw_binary_type_<xsl:value-of select="@object_binary_type_id"/></xsl:when>
			<xsl:when test="name()='code_file'">nw_code_file</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		<xsl:if test="@status_id>0 and /rsistructurenode/@outputmode='1'"> nw_status_<xsl:value-of select="@status_id"/>
		</xsl:if><xsl:if test="@object_document_production='1' or @object_document_production='2'"> nw_status_production
		</xsl:if></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--<summary>Template om uit te vinden of je je in een lijst bevind.</summary>-->
	<!--<createdate>23-08-2007</createdate>-->
	<!--<author>Wilbert Corts</author>-->
	<xsl:template match="*" mode="is_list">
		<xsl:param name="object_binary_type_id" select="@object_binary_type_id"></xsl:param><xsl:choose>
			<!--2 = object_document, document. -->
			<!--3 = object_class, interne vewijzing. -->
			<!--5 = object_map, kaart. -->
			<!--7 = object_url, hyperlink. -->
			<xsl:when test="@object_type_id=2 or @object_type_id=3 or @object_type_id=5 or @object_type_id=7">true</xsl:when>
			<!--6 = object_document, achtergronddocument. Als het geen release betreft. (output_mode!=3) -->
			<!--8 = object_map, achtergronddocument. Als het geen release betreft. (output_mode=3) -->
			<xsl:when test="@object_type_id=6 or @object_type_id=8">
				<xsl:choose>
					<xsl:when test="/rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5'">false</xsl:when>
					<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
			</xsl:when>
			<!--28 = object_binary (als het geen afbeelding betreft, dus word, excell, pdf). -->
			<xsl:when test="@object_type_id=28"><xsl:choose>
					<xsl:when test="@object_binary_type_id='1' or @object_binary_type_id='2' or @object_binary_type_id='3'">false</xsl:when>
					<xsl:when test="@object_binary_type_id='12' or @object_binary_type_id='13'"><xsl:choose>
							<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@display_binary_content='true'">false</xsl:when>
							<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and /rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@display_in_index='false'">false</xsl:when>
							<xsl:otherwise>true</xsl:otherwise></xsl:choose></xsl:when>
					<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and /rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@display_in_index='false'">false</xsl:when>
					<xsl:otherwise>true</xsl:otherwise>
				</xsl:choose></xsl:when>
			<!--TODO Test: 23 & 133 = object_class, Een nieuwe lijst. 
		<xsl:when test="@object_type_id=23">true</xsl:when>
		<xsl:when test="@object_type_id=133">true</xsl:when>-->
			<!--Alle andere, geen lijst. -->
			<xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--<summary>Template voor personen in de voetregel in printversie</summary>-->
	<!--<createdate>6-4-2005</createdate>-->
	<!--<author>Sebina Rosbergen</author>-->
	<!--Onderstaande template is zelfde als voorgaande, behalve de span element is hieruit verwijderd.
Onderstaande template wordt aangeroepen voor de printversie-->
	<xsl:template match="personcollection" mode="list">
		<xsl:param name="organisation_name"></xsl:param>
		<xsl:param name="person_id">
			<xsl:value-of select="count(child::person[@person_type_id=1])"/>
		</xsl:param>
		<xsl:param name="organisation_id">
			<xsl:value-of select="count(child::person[@organisation_name!=$organisation_name])"/>
		</xsl:param>
		<xsl:if test="$person_id>0 and $organisation_id>0">
			<xsl:for-each select="child::person[@person_type_id=1]">
				<xsl:value-of select="@person_name"/>
				<xsl:if test="@organisation_name!=''" >
					(<xsl:value-of select="@organisation_name"/>)
				</xsl:if>
				<xsl:if test="position()!=last()">, </xsl:if>
				<xsl:apply-templates mode="personlist">
					<xsl:sort select="@person_order" data-type="number"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="$person_id>0 and $organisation_id=0">
			<xsl:for-each select="child::person[@person_type_id=1]">
				<xsl:value-of select="@person_name"/>
				<xsl:if test="position()!=last()">, </xsl:if>
				<xsl:apply-templates mode="personlist">
					<xsl:sort select="@person_order" data-type="number"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="$person_id=0">
			<xsl:for-each select="child::person[@person_type_id=3 and @person_is_group=0]">
				<xsl:value-of select="@person_name"/> (red.)<xsl:if test="position()!=last()">, </xsl:if><xsl:apply-templates mode="personlist">
					<xsl:sort select="@person_order" data-type="number"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Template dat gebruikt wordt om te controleren of een item uitgevoerd moet worden-->
	<xsl:template mode="display_item" match="*">
		<!-- systeemtabs -->
		<xsl:param name="system1"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>systeem</xsl:param>
		<xsl:param name="system2"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>system</xsl:param>
		<xsl:param name="system3"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>service_menu_left</xsl:param>
		<xsl:param name="system4"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>service_menu_right</xsl:param>
		<xsl:param name="object_binary_type_id" select="@object_binary_type_id" />
		<xsl:choose>
			<xsl:when test="@object_type_id='6' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5')">false</xsl:when>
			<xsl:when test="@object_type_id='8' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5')">false</xsl:when>
			<xsl:when test="@object_type_id='23' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and (@status_id='24' or @status_id='25' or @status_id='36') ">false</xsl:when>
			<xsl:when test="@object_type_id='23' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and @object_class_name=$system1">false</xsl:when>
			<xsl:when test="@object_type_id='23' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and @object_class_name=$system2">false</xsl:when>
			<xsl:when test="@object_type_id='23' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and @object_class_name=$system3">false</xsl:when>
			<xsl:when test="@object_type_id='23' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and @object_class_name=$system4">false</xsl:when>
			<xsl:when test="@object_type_id='2' and (/rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and (@object_document_production='0' or @object_document_production='')">false</xsl:when>
			<xsl:when test="@object_type_id='5' and (/rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and (@object_map_production='0' or @object_map_production='')">false</xsl:when>
			<xsl:when test="@object_type_id='28' and (/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5')"><xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@display_binary_content='true'">true</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@display_in_index='false'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose></xsl:when>
			<xsl:otherwise>true</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	<!-- Template dat gebruikt wordt om te controleren of een parent item een systeemtab is-->
	<xsl:template name="parent_is_system">
		<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- systeemtabs -->
		<xsl:param name="system1"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>systeem</xsl:param>
		<xsl:param name="system2"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>system</xsl:param>
		<xsl:param name="system3"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>service_menu_left</xsl:param>
		<xsl:param name="system4"><xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>service_menu_right</xsl:param>
		<xsl:choose>
			<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and /rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::object_class/@object_class_name=$system1">
				<xsl:value-of select="$system1"/>
			</xsl:when>
			<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and /rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::object_class/@object_class_name=$system2">
				<xsl:value-of select="$system2"/>
			</xsl:when>
			<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and /rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::object_class/@object_class_name=$system3">
				<xsl:value-of select="$system3"/>
			</xsl:when>
			<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and /rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::object_class/@object_class_name=$system4">
				<xsl:value-of select="$system4"/>
			</xsl:when>
			<xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
</xsl:stylesheet>
