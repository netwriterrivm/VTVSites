<!-- Templates ten behoeve van het vullen van de Content placeholder Rechterberm -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />

	<!--Content placeholder -->
	<xsl:template name="CPHRelated">
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Aantal linkerberm contentblokken-->
		<xsl:param name="content_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='11'])"></xsl:param>
		<!-- Object type id van het actieve knooppunt-->
		<xsl:param name="object_type_id"><xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/></xsl:param>
		<!-- Teller om te kijken of er een tong is -->
		<xsl:param name="content_tong_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='12'])"></xsl:param>
		<xsl:if test="$content_count>0 and (/rsistructurenode/currentstructurenode/siteconfig/layout/@content_page_mode='tree' or $object_type_id='22' or $object_type_id='23' or $object_type_id='53')">
			<div>
				<xsl:attribute name="class">content_add <xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' and  $content_tong_count='0'"> nw_home_add_no_tong</xsl:if>
				</xsl:attribute>
				<!-- Content blokken rechterberm-->
				<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='11']" mode="xhtml_default_menu">
					<xsl:with-param name="header_top_level" >
						<xsl:call-template name="html_header_top_level"></xsl:call-template>
					</xsl:with-param>
					<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
				</xsl:apply-templates>
			</div>
		</xsl:if>
	</xsl:template>

	</xsl:stylesheet>
