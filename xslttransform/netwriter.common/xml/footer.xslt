<!-- Templates ten behoeve van het opbouwen van het kruimelpad -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template match="footer" mode="footer">
		<!-- Eventuele CSS classname-->
		<xsl:param name="classname"></xsl:param>
		<xsl:choose>
			<xsl:when test="/rsistructurenode/currentstructurenode/footer/@visibility='hidden' and @check_enabled='true'">
			</xsl:when>
			<xsl:otherwise>
			<xsl:apply-templates select="*" mode ="footer_content"></xsl:apply-templates>				
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="div|p|span|h1|h2|h3|h4|h5|h6|a|br|hr|img|ul|li|ol" mode="footer_content">
		<xsl:copy>
      <!--Attributen met xlinkid niet meegeven.-->
      <xsl:copy-of select="@*[local-name() != 'XlinkId']" />

			<xsl:apply-templates mode="footer_content"  />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="version" mode="footer_content">
		<xsl:value-of select="/rsistructurenode/currentstructurenode/root/@root_version"/>
	</xsl:template>
	<xsl:template match="date_short" mode="footer_content">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestring" select="/rsistructurenode/currentstructurenode/root/@root_date"/>
			<xsl:with-param name="display_day" select="'false'"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="date_long" mode="footer_content">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestring" select="/rsistructurenode/currentstructurenode/root/@root_date"/>
			<xsl:with-param name="display_day" select="'true'"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="title" mode="footer_content">
		<xsl:param name="label"><xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="xhtml_title"/></xsl:param>
		<xsl:value-of select="$label"/><xsl:if test="contains($label,'?')=0 and contains($label,'!')=0 and contains($label,'.')=0">.</xsl:if>
	</xsl:template>
  <xsl:template match="publication_timestamp_short"  mode="footer_content">
    <xsl:choose>
      <xsl:when test="/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3'">[replace_with_publication_timestamp_short_<xsl:value-of select="/rsistructurenode/currentstructurenode/root/@language_id"/>]</xsl:when>
      <xsl:otherwise>(zichtbaar na release)</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="publication_timestamp_long"  mode="footer_content">
    <xsl:choose>
      <xsl:when test="/rsistructurenode/@outputmode='2' or /rsistructurenode/@outputmode='3'">[replace_with_publication_timestamp_long_<xsl:value-of select="/rsistructurenode/currentstructurenode/root/@language_id"/>]</xsl:when>
      <xsl:otherwise>(zichtbaar na release)</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
	<xsl:template match="production_timestamp_short"  mode="footer_content">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestring">
				<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_document/@object_document_timestamp"/>
				<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_map/@object_map_timestamp"/>
				<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_binary/@object_binary_timestamp"/>
			</xsl:with-param>
			<xsl:with-param name="display_day" select="'false'"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="production_timestamp_long"  mode="footer_content">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestring">
				<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_document/@object_document_timestamp"/>
				<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_map/@object_map_timestamp"/>
				<xsl:value-of select="/rsistructurenode/currentstructurenode/activenode/object_binary/@object_binary_timestamp"/>
			</xsl:with-param>
			<xsl:with-param name="display_day" select="'true'"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="path"  mode="footer_content">
				<!-- Parameter structure_id: identifier van het knooppunt in NetWriter. -->
		<xsl:param name="structure_id" select="/rsistructurenode/currentstructurenode/structure/@structure_id"/>
		<xsl:call-template name="substring-before-last">
			<xsl:with-param name="string">
				<xsl:for-each select="/rsistructurenode/treecontextnodes/objectcollection/descendant::*[@structure_id=$structure_id]/ancestor-or-self::*[@object_type_id='22' or @object_type_id='23' or @object_type_id='53']">
					<xsl:variable name="display_item"><xsl:apply-templates mode="display_item" select="." /></xsl:variable>
						<xsl:if test="$display_item='true'">
					<xsl:apply-templates mode="xhtml_display_label" select="."></xsl:apply-templates>\</xsl:if>
				</xsl:for-each>
			</xsl:with-param>
			<xsl:with-param name="delimiter" select="'\'"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="contact" mode="footer_content">
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/personcollection" mode="contact">
			<xsl:with-param name="e-mailaddress" select="ancestor::footer/@contact_email"></xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="authors" mode="footer_content">
		<xsl:if test="/rsistructurenode/currentstructurenode/footer/@footerpersons='visible'">
			<xsl:apply-templates select="/rsistructurenode/currentstructurenode/personcollection" mode="authors"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="text()" mode="footer_content">
		<xsl:value-of select="." disable-output-escaping="no"/>
		</xsl:template>
	<!--<summary>Template voor personen in de voetregel</summary>-->
<!--<createdate>6-4-2005</createdate>-->
<!--<author>Sebina Rosbergen</author>-->	
<xsl:template match="/rsistructurenode/currentstructurenode/personcollection" mode="authors">
	<xsl:param name="person_id"><xsl:value-of select="count(child::person[@person_type_id=1])"/></xsl:param>
	<xsl:param name="person_count_total"><xsl:value-of select="count(child::person[@person_type_id=1 or (@person_type_id=3 and @person_is_group=0)])"/></xsl:param>
	<xsl:param name="organisation_id"><xsl:value-of select="count(child::person[@organisation_name!='RIVM'])"/></xsl:param>
	<xsl:if test="$person_id>0 and $organisation_id>0">
		<xsl:for-each select="/rsistructurenode/currentstructurenode/personcollection/child::person[@person_type_id=1]">
			<xsl:value-of select="@person_name"/><xsl:if test="@organisation_name!=''" > (<xsl:value-of select="@organisation_name"/>)</xsl:if><xsl:if test="position()!=last()">, </xsl:if><xsl:apply-templates mode="personlist">
					<xsl:sort select="@person_order" data-type="number"/>
			</xsl:apply-templates>
		</xsl:for-each>
	</xsl:if><xsl:if test="$person_id>0 and $organisation_id=0">
		<xsl:for-each select="/rsistructurenode/currentstructurenode/personcollection/child::person[@person_type_id=1]">
			<xsl:value-of select="@person_name"/><xsl:if test="position()!=last()">, </xsl:if><xsl:apply-templates mode="personlist">
					<xsl:sort select="@person_order" data-type="number"/>
			</xsl:apply-templates>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="$person_id=0">	<!-- Aantal personen =0 -->
		<xsl:for-each select="/rsistructurenode/currentstructurenode/personcollection/child::person[@person_type_id=3 and @person_is_group=0]">
			<xsl:value-of select="@person_name"/> (red.)<xsl:if test="position()!=last()">, </xsl:if><xsl:apply-templates mode="personlist">
					<xsl:sort select="@person_order" data-type="number"/>
			</xsl:apply-templates>
		</xsl:for-each>
	</xsl:if><xsl:if test="$person_count_total>0">. </xsl:if>
</xsl:template>

	<!--<summary>Template voor contactpersonen bij boomstructuur</summary>-->
<!--<createdate>18-5-2005</createdate>-->
<!--<author>Sebina Rosbergen</author>-->	
<!-- Bij een onderwerp van de boomstructuur moet een contactpersoon worden vermeld. 
	 Voor een contactpersoon geldt person_type_id=10 -->
<xsl:template match="personcollection" mode="contact">
	<xsl:param name="e-mailaddress"/>
	<xsl:variable name="contactperson_text">
		<xsl:choose>
			<xsl:when test="/rsistructurenode/currentstructurenode/root/@language_id='1'">Contactpersoon</xsl:when>
			<xsl:otherwise>Contact person</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:if test="count(child::*[@person_type_id='10'])>0">
		<div class="contact_info">
			<strong>
				<xsl:value-of select="$contactperson_text"/>:
			</strong><xsl:text disable-output-escaping="no"> </xsl:text>
			<xsl:apply-templates select="person[@person_type_id='10']" mode="contactpersoon">
				<xsl:with-param name="e-mailaddress" select="$e-mailaddress"/>
			</xsl:apply-templates>
		</div>
	</xsl:if>
</xsl:template>

<!--<summary>Template voor contactpersoon</summary>-->
<!--<createdate>18-5-2005</createdate>-->
<!--<author>Sebina Rosbergen</author>-->
<xsl:template match="person" mode="contactpersoon">
	<xsl:param name="e-mailaddress">
	</xsl:param>
	<xsl:param name="display_email">
		<xsl:choose><xsl:when test="$e-mailaddress!=''"><xsl:value-of select="$e-mailaddress"></xsl:value-of></xsl:when>
		<xsl:otherwise><xsl:value-of select="@person_email"/></xsl:otherwise></xsl:choose>
	</xsl:param>
	<!-- In subject van e-mail de object_title meegeven tenzij de root is geselecteerd, dan root_name meegeven -->
	<xsl:variable name="title">
		<xsl:apply-templates select="/rsistructurenode/currentstructurenode/activenode/*" mode="xhtml_title"/>
	</xsl:variable>
	
	<xsl:variable name="root_id" select="/rsistructurenode/currentstructurenode/root/@root_id" />
	<xsl:value-of select="@person_long_name" /> <xsl:choose>
		<xsl:when test="$display_email!=''">
			(e-mail: <a href="mailto:{$display_email}?subject={@person_long_name}: {$title}" >
				<xsl:value-of select="$display_email"/>
			 </a>)
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="position()!=last()">, </xsl:if>
</xsl:template>
</xsl:stylesheet>

