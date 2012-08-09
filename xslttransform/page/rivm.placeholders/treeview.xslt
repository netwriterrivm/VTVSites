<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!--Root template, hier worden de content placeholders en pagina variabelen gevuld-->
	<xsl:template name="CPHTreeView">
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
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Aantal linkerberm contentblokken-->
		<xsl:param name="content_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='10'])"></xsl:param>
		<!-- Object type id van het actieve knooppunt-->
		<xsl:param name="object_type_id"><xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/></xsl:param>
		<!-- Valt item onder systeem onderwerp? -->
		<xsl:param name="parent_is_system"><xsl:call-template name="parent_is_system"/></xsl:param>
		<xsl:param name="CPHTreeView_filled">
			<xsl:choose>
				<!--<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs' and (($leaf_link_mode='tree' and $childcount_total_active_tab>0) or ($leaf_link_mode='content' and $childcount_parent_nodes_active_tab>0))">true</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='traditional' and (($leaf_link_mode='tree' and $childcount_total>0) or ($leaf_link_mode='content' and $childcount_parent_nodes>0))">true</xsl:when>-->
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:choose>
			<xsl:when test="$parent_is_system!='false'">
				<!-- blokken die onder systeem onderdelen vallen worden anders gerenderd-->
				<xsl:variable name="local_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_class_name=$parent_is_system]/object_class[@status_id='23' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_class_name=$parent_is_system]/object_class[@status_id='29' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_clas_name=$parent_is_system]/code_file)"></xsl:variable>
				<xsl:if test="$local_count>0">
					<div class="boomlijn" id="boom">
						<ul>
							<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_class_name=$parent_is_system]/object_class/object_class/*" mode="treeview">
								<xsl:with-param name="classname" select="'indexTreeObjectClassMin'"></xsl:with-param>
								<xsl:with-param name="classname_open" select="'indexTreeObjectClassPlus'"></xsl:with-param>
								<xsl:with-param name="classname_active" select="'indexTreeObjectClassPlus'"></xsl:with-param>
								<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
								<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
							</xsl:apply-templates>
						</ul>
	<!-- Content blokken linkerberm-->
						<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='10']" mode="xhtml_default_menu">
							<xsl:with-param name="header_top_level" >
								<xsl:call-template name="html_header_top_level"></xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
						</xsl:apply-templates>
					</div>
				</xsl:if>
			</xsl:when>
			<xsl:when test="($object_type_id='2' or $object_type_id='5' or $object_type_id='6' or $object_type_id='8') and /rsistructurenode/currentstructurenode/siteconfig/layout/@content_page_mode='hidden'"></xsl:when>
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs'">
				<xsl:if test="($leaf_link_mode='tree' and $childcount_total_active_tab>0) or ($leaf_link_mode='content' and $childcount_parent_nodes_active_tab>0) or $content_count>0">
									<div class="boomlijn" id="boom">
	
						<ul>
							<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::root/object_class/*" mode="treeview">
								<xsl:with-param name="classname" select="'indexTreeObjectClassMin'"></xsl:with-param>
								<xsl:with-param name="classname_open" select="'indexTreeObjectClassPlus'"></xsl:with-param>
								<xsl:with-param name="classname_active" select="'indexTreeObjectClassPlus'"></xsl:with-param>
								<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
								<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
								<xsl:with-param name="firstposition" select="position()=1" />
								<xsl:with-param name="lastposition" select="position()=last()" />
							</xsl:apply-templates>
						</ul>
	<!-- Content blokken linkerberm-->
						<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='10']" mode="xhtml_default_menu">
							<xsl:with-param name="header_top_level" >
								<xsl:call-template name="html_header_top_level"></xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
						</xsl:apply-templates>
					</div>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="($leaf_link_mode='tree' and $childcount_total>0) or ($leaf_link_mode='content' and $childcount_parent_nodes>0) or $content_count>0">
								<div class="boomlijn" id="boom">
					
						<ul>
							<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/root/object_class" mode="treeview">
							<xsl:with-param name="classname" select="'indexTreeObjectClassMin'"></xsl:with-param>
								<xsl:with-param name="classname_open" select="'indexTreeObjectClassPlus'"></xsl:with-param>
								<xsl:with-param name="classname_active" select="'indexTreeObjectClassPlus'"></xsl:with-param>
								<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
								<xsl:with-param name="firstposition" select="position()=1" />
								<xsl:with-param name="lastposition" select="position()=last()" />
							</xsl:apply-templates>
						</ul>
						<!-- Content blokken linkerberm-->
						<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='10']" mode="xhtml_default_menu">
							<xsl:with-param name="header_top_level" >
								<xsl:call-template name="html_header_top_level"></xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
						</xsl:apply-templates>
					</div>

				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>


	</xsl:template>

	<xsl:template name="CPHTreeView_filled">
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
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Aantal linkerberm contentblokken-->
		<xsl:param name="content_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='10'])"></xsl:param>
		<!-- Object type id van het actieve knooppunt-->
		<xsl:param name="object_type_id">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>
		</xsl:param>
		<!-- Valt item onder systeem onderwerp? -->
		<!-- Valt item onder systeem onderwerp? -->
		<xsl:param name="parent_is_system">
			<xsl:call-template name="parent_is_system"/>
		</xsl:param>
		<xsl:variable name="local_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_class_name=$parent_is_system]/object_class[@status_id='23' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_class_name=$parent_is_system]/object_class[@status_id='29' and @object_type_id='23']|/rsistructurenode/treecontextnodes/objectcollection/descendant::object_class[@object_clas_name=$parent_is_system]/code_file)"></xsl:variable>
		<xsl:choose>
			<!-- let op volgorde is hier erg van belang -->
			<xsl:when test="($object_type_id='2' or $object_type_id='5' or $object_type_id='6' or $object_type_id='8') and /rsistructurenode/currentstructurenode/siteconfig/layout/@content_page_mode='hidden'">false</xsl:when>
			<xsl:when test="$parent_is_system!='false' and $local_count>0">true</xsl:when>
			<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@treemode='tabs'"><xsl:if test="($leaf_link_mode='tree' and $childcount_total_active_tab>0) or ($leaf_link_mode='content' and $childcount_parent_nodes_active_tab>0) or $content_count>0">true</xsl:if></xsl:when>
			<xsl:otherwise><xsl:if test="($leaf_link_mode='tree' and $childcount_total>0) or ($leaf_link_mode='content' and $childcount_parent_nodes>0) or $content_count>0">true</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

