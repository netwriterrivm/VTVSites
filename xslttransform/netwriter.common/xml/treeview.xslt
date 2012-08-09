<!-- Templates ten behoeve van het opbouwen van het kruimelpad -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template match="object_class|root|object_map|object_document|code_file|object_url" mode="treeview">
		<!-- Geeft aan of links naar objecten in de tree of in het content pane weergegeven moet worden-->
		<xsl:param name="leaf_link_mode">content</xsl:param>
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Eventuele CSS classname voor open geklapte items-->
		<xsl:param name="classname_open"></xsl:param>
		<!-- Eventuele CSS classname voor het actieve item-->
		<xsl:param name="classname_active"></xsl:param>
		<!-- Eventuele CSS classname voor het item als er kinderen zijn -->
		<xsl:param name="classname_childs"></xsl:param>
		<!-- Eventuele CSS classname voor op de link-->
		<xsl:param name="link_classname"></xsl:param>
		<!-- Eventuele CSS classname voor op de link van een open geklapt items -->
		<xsl:param name="link_classname_open"></xsl:param>
		<!-- Eventuele CSS classname voor op de link van een actief item-->
		<xsl:param name="link_classname_active"></xsl:param>
		<!-- Geeft aan of de NetWriterClasses toegevoegd moeten worden -->
		<xsl:param name="show_netwriter_classes">false</xsl:param>
		<!-- Sommige objecten worden nooit weergegeven-->
		<!-- geeft aan of het de eerste/laatste positie betreft, moet soms doorgegeven worden als param-->
		<xsl:param name="firstposition" select="position()=1" />
		<xsl:param name="lastposition" select="position()=last()" />
		<xsl:choose>
			<!-- Kopregels, contentfragmenten op pagina niet uitvieren-->
			<xsl:when test="@object_type_id='1' or @object_type_id='9' or @object_type_id='10' or @object_type_id='11' or @object_type_id='12'"></xsl:when>
			<!-- Interne verwijzing alleen voor weergave in boom-->
			<!--<xsl:when test="@object_type_id='3' and $leaf_link_mode='content'"></xsl:when>-->
			<xsl:otherwise>
				<!-- Sommigen worden weergegeven afhankelijk van de treemode -->
				<xsl:if test="$leaf_link_mode='tree' or ($leaf_link_mode='content' and (@object_type_id=22 or @object_type_id=23 or @object_type_id=53))">
					<xsl:apply-templates select="." mode="xhtml_link_list" >
						<xsl:with-param name="classname" select="$classname"></xsl:with-param>
						<xsl:with-param name="classname_open" select="$classname_open"></xsl:with-param>
						<xsl:with-param name="classname_active" select="$classname_active"></xsl:with-param>
						<xsl:with-param name="classname_childs" select="$classname_childs"></xsl:with-param>
						<xsl:with-param name="link_classname" select="$link_classname"></xsl:with-param>
						<xsl:with-param name="link_classname_open" select="$link_classname_open"></xsl:with-param>
						<xsl:with-param name="link_classname_active" select="$link_classname_active"></xsl:with-param>
						<xsl:with-param name="leaf_link_mode" select="$leaf_link_mode"></xsl:with-param>
						<xsl:with-param name="show_netwriter_classes" select="$show_netwriter_classes"></xsl:with-param>
						<xsl:with-param name="firstposition" select="position()=1" />
						<xsl:with-param name="lastposition" select="position()=last()" />
					</xsl:apply-templates>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>

