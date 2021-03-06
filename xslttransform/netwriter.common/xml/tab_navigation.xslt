<!-- Templates ten behoeve van het opbouwen van het kruimelpad -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template match="root|object_map|object_document|code_file" mode="tab_navigation">
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Eventueel is de alt tag te overrulen -->
		<xsl:param name="alttag">
			<xsl:value-of select="@object_binary_label"/>
		</xsl:param>
		<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Parameter object_type_id: type object van de actieve pagina. -->
		<xsl:param name="objecttypeid"  select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>
		<!-- SRC -->
		<xsl:param name="src">
			<xsl:apply-templates select="." mode="url"></xsl:apply-templates>
		</xsl:param>
		<!-- Title tag -->
		<xsl:param name="title" >
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="label" >
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
		<li>
			<a href="{$src}" title="{$title}">
				<xsl:if test="$classname!=''">
					<xsl:attribute name="class">
						<xsl:value-of select="$classname"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="$label"/>
					</a>
				<!-- Menu Redactieinterface toevoegen -->
				<xsl:apply-templates select="." mode='index_access_icon_tree' >
					<xsl:with-param name="firstposition" select="position()=1" />
					<xsl:with-param name="lastposition" select="position()=last()" />
				</xsl:apply-templates>
		
		</li>
	</xsl:template>
	<xsl:template match="object_class" mode="tab_navigation">
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Eventueel is de alt tag te overrulen -->
		<xsl:param name="alttag">
			<xsl:value-of select="@object_binary_label"/>
		</xsl:param>
		<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<!-- Parameter object_type_id: type object van de actieve pagina. -->
		<xsl:param name="objecttypeid"  select="/rsistructurenode/currentstructurenode/structure/@object_type_id"/>
		<!-- SRC -->
		<xsl:param name="src">
			<xsl:apply-templates select="." mode="url"></xsl:apply-templates>
		</xsl:param>
		<!-- Title tag -->
		<xsl:param name="title" >
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="label" >
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
		<!-- Naam van de systeemtab -->
		<xsl:param name="systemtabname">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_prefix"/>systeem
		</xsl:param>
		<!-- klasse naam -->
		<xsl:param name="object_class_name">
			<xsl:value-of select="@object_class_name"/>
		</xsl:param>
		<xsl:choose>
			<xsl:when test="(/rsistructurenode/@outputmode='3' or /rsistructurenode/@outputmode='5') and (@status_id='24' or @status_id='25')"></xsl:when>
			<xsl:when test="(@object_class_name=$systemtabname and /rsistructurenode/@outputmode!='1')"></xsl:when>
			<xsl:otherwise>
				<li>
					<a href="{$src}" title="{$title}">
						<xsl:if test="$classname!=''">
							<xsl:attribute name="class">
								<xsl:value-of select="$classname"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$label"/>
</a>
						<!-- Menu Redactieinterface toevoegen -->
						<xsl:apply-templates select="." mode='index_access_icon_tree' >
							<xsl:with-param name="firstposition" select="position()=1" />
							<xsl:with-param name="lastposition" select="position()=last()" />
						</xsl:apply-templates>
					
				</li>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>






</xsl:stylesheet>

