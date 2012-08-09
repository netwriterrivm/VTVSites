<!-- Templates ten behoeve van het opbouwen van het kruimelpad -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template name="sitestat_counter">
    <xsl:param name="add_print_version">false</xsl:param>
		<xsl:param name="owner_site_name">
			<xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/sitestat/@owner!=''">
					<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/sitestat/@owner"/>
				</xsl:when>
				<xsl:otherwise>rivm/rivm-nl</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="show_objectid"/>
		<xsl:param name="roottypeid">
			<xsl:value-of select="/rsistructurenode/treecontextnodes/objectcollection/root/@root_type_id"/>
		</xsl:param>
		<xsl:param name="sitestatkenmerk">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/sitestat/@kenmerk"/>
		</xsl:param>
		<xsl:param name="mode">
			<xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/sitestat/@mode='classic'"></xsl:when>
				<xsl:otherwise>default</xsl:otherwise>
			</xsl:choose>

		</xsl:param>
		<!--Sitestat alleen opnemen bij een Release-->
		<xsl:if test="/rsistructurenode/@outputmode!='1' and $sitestatkenmerk!=''">
			<script type="text/javascript">
				<!-- Indien pagina van het objecttype root of class is dan vtv.?.boom, anders gaat het om en document of
		kaart vtv.?.data 
		Een andere mogelijkheid is vtv.?.site(.zoekresultaat), dit wordt in de betreffende pagina's zo opgenomen, 
		en hieronder in code wordt ervoor gezorgd dat de documenten in een menu vtv.?.site meekrijgen. -->
				<!-- NB voor het IMS wordt geen vtv voorvoegsel gebruikt-->
				<xsl:choose>
					<xsl:when test="$mode='default'">
						sitestatTeller="<xsl:value-of select="$sitestatkenmerk"></xsl:value-of><xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id!='22'">.</xsl:if>";
						<!--sitestatTeller+="<xsl:for-each select="/rsimenu/infopathcollection">-->
						<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id!='70'">
							sitestatTeller+="<xsl:for-each select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*">
								<xsl:apply-templates mode="sitestat_teller">
									<xsl:with-param name="show_objectid" select="$show_objectid"/>
								</xsl:apply-templates>
							</xsl:for-each>";
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='70'">
								sitestatTeller="<xsl:value-of select="$sitestatkenmerk"></xsl:value-of>[getObjectExternalHTML(70,<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@object_id"/>,<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>,sitestat,14)]";
     						</xsl:when>					
							<xsl:when test="/rsistructurenode/currentstructurenode/structure/@object_type_id='22' or /rsistructurenode/currentstructurenode/structure/@object_type_id='23'">
								sitestatTeller="<xsl:value-of select="$sitestatkenmerk"></xsl:value-of>.boom.";
							</xsl:when>
							<xsl:otherwise>
								sitestatTeller="<xsl:value-of select="$sitestatkenmerk"></xsl:value-of>.data.";
							</xsl:otherwise>
						</xsl:choose>

						<!--sitestatTeller+="<xsl:for-each select="/rsimenu/infopathcollection">-->
						<xsl:if test="/rsistructurenode/currentstructurenode/structure/@object_type_id!='70'">
							sitestatTeller+="<xsl:for-each select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*">
								<xsl:apply-templates mode="sitestat_teller">
									<xsl:with-param name="show_objectid" select="$show_objectid"/>
								</xsl:apply-templates>
							</xsl:for-each>";
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
        <xsl:if test="$add_print_version='true'">
          sitestatTeller+=".printversion";
        </xsl:if>
				sitestat("http://nl.sitestat.com/<xsl:value-of select="$owner_site_name" />/s?",sitestatTeller);
			</script>

			<noscript>
				<div>
					<img src="http://nl.sitestat.com/{$owner_site_name}/s?{$sitestatkenmerk}.noscript" alt="" width="1" height="1" />
				</div>
			</noscript>
		</xsl:if>
	</xsl:template>
	<!--<summary>Template voor opbouw teller voor SiteStat</summary>-->
	<!--<createdate>17-5-2005</createdate>-->
	<!--<author>Sebina Rosbergen</author>-->
	<xsl:template match="object_class" mode="sitestat_teller">
		<!--parameter waarmee bepaald wordt of het object_id voor de titel moet staan (niet relevant voor object_class)-->
		<xsl:param name="show_objectid"/>
		<!--parameter structure_id-->
		<xsl:param name="structureid">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		</xsl:param>
		<!--parameter structure_left-->
		<xsl:param name="structure_left">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_left"/>
		</xsl:param>
		<!--parameter structure_right-->
		<xsl:param name="structure_right">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_right"/>
		</xsl:param>
		<!--kijk of het een kindje is en dus in het kruimelpad moet worden opgenomen-->
		<xsl:if test="$structure_left>=@structure_left and @structure_right>=$structure_right">
			<xsl:value-of select="@object_class_name"/>
			<xsl:if test="$structureid!=@structure_id">.</xsl:if>
		</xsl:if>
	</xsl:template>
	<!--<summary>Template voor opbouw teller voor SiteStat in geval van een document</summary>-->
	<!--<createdate>17-5-2005</createdate>-->
	<!--<author>Sebina Rosbergen</author>-->
	<xsl:template match="object_document" mode="sitestat_teller">
		<!--parameter waarmee bepaald wordt of het object_id voor de titel moet staan-->
		<xsl:param name="show_objectid"/>
		<!--parameter structure_left-->
		<xsl:param name="structure_left">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_left"/>
		</xsl:param>
		<!--parameter structure_right-->
		<xsl:param name="structure_right">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_right"/>
		</xsl:param>
		<!--kijk of het een kindje is en dus in het kruimelpad moet worden opgenomen-->
		<xsl:if test="$structure_left>=@structure_left and @structure_right>=$structure_right">
			<xsl:choose>
				<xsl:when test="@object_document_file!=''">
					<xsl:call-template name="substring-after-last">
						<xsl:with-param name="string" select="@object_document_file" />
						<xsl:with-param name="delimiter" select="'/'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$show_objectid='yes'">
						<xsl:value-of select="@object_document_id"/>
					</xsl:if>
					<xsl:call-template name="replaceCharsInString">
						<xsl:with-param name="stringIn">
							<xsl:value-of select="@object_document_label"/>
						</xsl:with-param>
						<xsl:with-param name="charsIn" select="'&quot;'" />
						<xsl:with-param name="charsOut" select="' '" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<!--<summary>Template voor opbouw teller voor SiteStat in geval van een kaart</summary>-->
	<!--<createdate>17-5-2005</createdate>-->
	<!--<author>Sebina Rosbergen</author>-->
	<xsl:template match="object_map" mode="sitestat_teller">
		<!--parameter waarmee bepaald wordt of het object_id voor de titel moet staan-->
		<xsl:param name="show_objectid"/>
		<!--parameter structure_left-->
		<xsl:param name="structure_left">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_left"/>
		</xsl:param>
		<!--parameter structure_right-->
		<xsl:param name="structure_right">
			<xsl:value-of select="/rsistructurenode/currentstructurenode/structure/@structure_right"/>
		</xsl:param>
		<!--kijk of het een kindje is en dus in het kruimelpad moet worden opgenomen-->
		<xsl:if test="$structure_left>=@structure_left and @structure_right>=$structure_right">
			<xsl:choose>
				<xsl:when test="@object_map_file!=''">
					<xsl:call-template name="substring-after-last">
						<xsl:with-param name="string" select="@object_map_file" />
						<xsl:with-param name="delimiter" select="'/'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$show_objectid='yes'">
						<xsl:value-of select="@object_map_id"/>
					</xsl:if>
					<xsl:call-template name="replaceCharsInString">
						<xsl:with-param name="stringIn">
							<xsl:value-of select="@object_map_label"/>
						</xsl:with-param>
						<xsl:with-param name="charsIn" select="'&quot;'" />
						<xsl:with-param name="charsOut" select="' '" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>

