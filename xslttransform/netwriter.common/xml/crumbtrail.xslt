<!-- Templates ten behoeve van het opbouwen van het kruimelpad -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template match="object_class|root|object_map|object_document|code_file" mode="crumbtrail_item">
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<!-- Eventuele CSS classname voor het actieve item-->
		<xsl:param name="classname_active"></xsl:param>
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
			<xsl:choose>
				<xsl:when test="(/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3') and /rsistructurenode/currentstructurenode/siteconfig/layout/@crumbtrail_root_url!=''"><xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/layout/@crumbtrail_root_url"/></xsl:when>
				<xsl:otherwise><xsl:apply-templates select="." mode="url"></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:param>
		<!-- Title tag -->
		<xsl:param name="title" >
			<xsl:apply-templates select="." mode="xhtml_title"></xsl:apply-templates>
		</xsl:param>
		<!-- Display label -->
		<xsl:param name="label" >
			<xsl:apply-templates select="." mode="xhtml_display_label"></xsl:apply-templates>
		</xsl:param>
		<!-- geeft aan of het item uitgevoerd moet worden -->
		<xsl:param name="display_item"><xsl:apply-templates mode="display_item" select="."></xsl:apply-templates></xsl:param>
		<xsl:choose>
			<!-- Niet alles uitvoeren, systeem items zie je niet terug in productie-->
			<xsl:when test="$display_item='false' and @structure_id!=$structure_id"></xsl:when>
			<!-- Actieve item is geen link -->
			<xsl:when test="@structure_id=$structure_id">
				<xsl:choose>
					<xsl:when test="$classname_active!=''">
						<span class="{$classname_active}">
							<xsl:value-of select="$label"/>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$label"/>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:when>
			<!-- Bovenliggende items uiteraard wel. -->
			<xsl:otherwise>
				<span>
					<xsl:if test="$classname!=''">
						<xsl:attribute name="class">
							<xsl:value-of select="$classname"/>
						</xsl:attribute>
					</xsl:if>
					<a href="{$src}" title="{$title}">
						<xsl:value-of select="$label"/>
					</a>
					<span class="imgreplacement">
						<xsl:text disable-output-escaping="yes">&amp;rsaquo;</xsl:text>
					</span>
				</span>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
</xsl:stylesheet>

