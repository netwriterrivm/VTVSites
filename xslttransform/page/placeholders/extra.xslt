<!-- Templates ten behoeve van het vullen van de Content placeholder Extra -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />

	<!--Content placeholder -->
	<xsl:template name="CPHExtra">
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Knooppunt id van het actieve knooppunt-->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Header Level-->
		<xsl:param name="header_top_level">2</xsl:param>
		<!-- Aantal linkerberm contentblokken-->
		<xsl:param name="content_count" select="count(/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/object_document[@object_type_id='12'])"></xsl:param>
		<!-- Placeholder alleen op root level uitvoeren-->
		<!-- Todo controleren of dit wenselijk is en alleen daar in menu opnemen -->
		<xsl:if test="$content_count>0 and /rsistructurenode/currentstructurenode/structure/@object_type_id='22'">
			<div class="content_supp">
				<xsl:choose>
					<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/layout/@home_tong='true'">
						<div class="mod tong">
				<!-- Content blokken linkerberm-->
				<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='12']" mode="xhtml_default_menu">
					<xsl:with-param name="header_top_level" >
						<xsl:call-template name="html_header_top_level"></xsl:call-template>
					</xsl:with-param>
					<xsl:with-param name="xslt_template_path"></xsl:with-param>
					<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
				</xsl:apply-templates>
				
						</div>
					</xsl:when>
					<xsl:otherwise>
				
				<!-- Content blokken linkerberm-->
				<xsl:apply-templates select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/*[@object_type_id='12']" mode="xhtml_default">
					<xsl:with-param name="header_top_level" >
						<xsl:call-template name="html_header_top_level"></xsl:call-template>
					</xsl:with-param>
					<xsl:with-param name="xslt_template_path"></xsl:with-param>
					<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
				</xsl:apply-templates>
				<xsl:apply-templates select="." mode='index_access_icon_contents' >
				<xsl:with-param name="firstposition" select="position()=1" />
				<xsl:with-param name="lastposition" select="position()=last()" />
			</xsl:apply-templates>
						</xsl:otherwise>
				</xsl:choose>
			</div>
		</xsl:if>
		<!--<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id='5' or /rsistructurenode/currentstructurenode/structure/@object_type_id='8'">
			<div class="content_supp">
				<ul class="toolbox"><li><a href="../" class="star">Kaart vergelijken</a></li></ul>
			</div>
				
		</xsl:if>-->
	</xsl:template>
	</xsl:stylesheet>
