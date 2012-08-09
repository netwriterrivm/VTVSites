<!-- Templates om de URL te bepalen van objecten -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
<!--<summary>Template voor het bepalen van het relatieve pad tot systeembestanden.</summary>-->
<!--<createdate>19-11-2008</createdate>-->
<!--<author>Jan de Bruin</author>-->
<xsl:template name="getRelativePath">
	<xsl:choose><!-- Even altijd site relatief gebruiken.-->
			<xsl:when test="/rsistructurenode/currentstructurenode/root/@root_use_friendly_urls='1'">
		<xsl:choose>
			<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='0'"></xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='1'">../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='2'">../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='3'">../../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='4'">../../../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='5'">../../../../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='6'">../../../../../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='7'">../../../../../../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='8'">../../../../../../../../</xsl:when>	
				<xsl:when test="/rsistructurenode/currentstructurenode/structure/@structure_level='9'">../../../../../../../../../</xsl:when>	
				<xsl:otherwise>/</xsl:otherwise>
			</xsl:choose>
			</xsl:when>
			<xsl:otherwise>/</xsl:otherwise>
		</xsl:choose></xsl:template>
	<!-- LET OP HET TEMPLATE VOOR KAARTEN IS TIJDELIJK, IVM Bug in NetWriter.-->
	
	<xsl:template match="object_class|object_document|object_map" mode="url"><xsl:choose>
			<xsl:when test="$releaseoutputmode='2' or $releaseoutputmode='3' or $releaseoutputmode='7'"><xsl:call-template name="clean_url_webrichtlijnen_output_xml">
					<xsl:with-param name="url" select="@structure_url" />
				</xsl:call-template></xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="@object_document_id>0">/NetWriterGui/publication/GetOutput.aspx?ObjectTypeId=2&amp;ObjectId=<xsl:value-of select="@object_document_id"/></xsl:when>
					<xsl:when test="@object_map_id>0">/NetWriterGui/publication/GetOutput.aspx?ObjectTypeId=5&amp;ObjectId=<xsl:value-of select="@object_map_id"/></xsl:when>
					<xsl:when test="@object_class_id>0">/NetWriterGui/publication/GetOutput.aspx?ObjectTypeId=23&amp;ObjectId=<xsl:value-of select="@object_class_id"/></xsl:when>
					<xsl:otherwise>/NetWriterGui/publication/GetOutput.aspx?StructureNodeId=<xsl:value-of select="@structure_id"/></xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose><xsl:choose><xsl:when test="@link_anchor!=''">#<xsl:value-of select="@link_anchor"/></xsl:when><xsl:otherwise><xsl:if test="name()='object_map'">#breadcrumb</xsl:if></xsl:otherwise></xsl:choose></xsl:template>
	<xsl:template match="code_file" mode="url"><xsl:choose>
		<xsl:when test="$releaseoutputmode='2' or $releaseoutputmode='3' or $releaseoutputmode='7'">
				<xsl:call-template name="clean_url_webrichtlijnen_output_xml">
					<xsl:with-param name="url" select="@code_file" />
				</xsl:call-template>
			</xsl:when><xsl:otherwise>/NetWriterGui/publication/GetOutput.aspx?ObjectTypeId=53&amp;ObjectId=<xsl:value-of select="@code_file_id"/></xsl:otherwise>
		</xsl:choose><xsl:if test="@link_anchor!=''">#<xsl:value-of select="@link_anchor"/></xsl:if>
	</xsl:template>
	
<!--<summary>Template voor het bepalen van de directory van object_binary</summary>-->
<!--<createdate>6-4-2005</createdate>-->
<!--<author>Sebina Rosbergen</author>-->
<!-- Misschien zit er een '\' in bestandsnaam, dan na laatste '\' selecteren -->
<xsl:template match="object_binary" mode="url">
<xsl:param name="object_binary_type_id" select="@object_binary_type_id" />
<xsl:variable name="filename1">
<xsl:call-template name="substring-after-last">
			<xsl:with-param name="string" select="@object_binary_filename" />
			<xsl:with-param name="delimiter" select="'\'" />
		</xsl:call-template>
</xsl:variable>
<!-- Misschien zit er een '/' in bestandsnaam, dan na laatste '/' selecteren -->
<xsl:variable name="filename2">
		<xsl:choose>
			<xsl:when test="$filename1=@object_binary_filename">
				<xsl:call-template name="substring-after-last">
					<xsl:with-param name="string" select="@object_binary_filename" />
					<xsl:with-param name="delimiter" select="'/'" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$filename1"></xsl:value-of></xsl:otherwise>
		</xsl:choose>
</xsl:variable>
	<!-- extensie eruit halen -->
<xsl:variable name="ext">.<xsl:call-template name="substring-after-last">
					<xsl:with-param name="string" select="@object_binary_filename" />
					<xsl:with-param name="delimiter" select="'.'" />
				</xsl:call-template></xsl:variable>
	<xsl:choose>
		<xsl:when test="$releaseoutputmode='2' or $releaseoutputmode='3'  or $releaseoutputmode='7'">
			<xsl:choose>
				<xsl:when test="@object_binary_type_id=1">/object_binary/o<xsl:value-of select="@object_binary_id" />.gif</xsl:when>
				<xsl:when test="@object_binary_type_id=2">/object_binary/o<xsl:value-of select="@object_binary_id" />.jpg</xsl:when>
				<xsl:when test="@object_binary_type_id=4">/object_binary/o<xsl:value-of select="@object_binary_id" />.jpeg</xsl:when>
				<xsl:when test="@object_binary_type_id=11">/object_binary/o<xsl:value-of select="@object_binary_id" />.png</xsl:when>
				<!--@object_binary_type_id=6: pdf-->
				<xsl:when test="@object_binary_type_id=6">/object_binary/o<xsl:value-of select="@object_binary_id" />_<xsl:value-of select="@object_binary_filename" /></xsl:when>
				<!--@object_binary_type_id=12: word-->
				<xsl:when test="@object_binary_type_id=12">/object_binary/o<xsl:value-of select="@object_binary_id" />_<xsl:value-of select="$filename2"/></xsl:when>
				<!--@object_binary_type_id=13: excel-->
				<xsl:when test="@object_binary_type_id=13">/object_binary/o<xsl:value-of select="@object_binary_id" />_<xsl:value-of select="$filename2"/></xsl:when>
				<!--@object_binary_type_id=14: powerpoint-->
				<xsl:when test="@object_binary_type_id=14">/object_binary/o<xsl:value-of select="@object_binary_id" />.ppt</xsl:when>
				<xsl:otherwise>/object_binary/o<xsl:value-of select="@object_binary_id" /><xsl:value-of select="$ext"></xsl:value-of></xsl:otherwise></xsl:choose></xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@enable_webdav_path='true' and @object_binary_type_id='12'">/NetWriterFilesystem/binaries/oID<xsl:value-of select="@object_binary_id"/>.doc</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/binary_settings/binary_type[@binary_type_id=$object_binary_type_id]/@enable_webdav_path='true' and @object_binary_type_id='13'">/NetWriterFilesystem/binaries/oID<xsl:value-of select="@object_binary_id"/>.xls</xsl:when>
				<xsl:otherwise>/NetWriterGui/content/GetObjectBinary.aspx?ObjectBinaryId=<xsl:value-of select="@object_binary_id" />&amp;OutputMode=<xsl:value-of select="$releaseoutputmode"/></xsl:otherwise>
			</xsl:choose></xsl:otherwise></xsl:choose>
</xsl:template>
	<!-- TODO Site URL-->
<xsl:template match="root" mode="url"><xsl:choose>
	<xsl:when test="$releaseoutputmode='2' or $releaseoutputmode='3' or $releaseoutputmode='7' ">
		<xsl:call-template name="getRelativePath"></xsl:call-template>
	</xsl:when>
		<xsl:otherwise>/NetWriterGui/publication/GetOutput.aspx?RootId=<xsl:value-of select="@root_id"/></xsl:otherwise>
		</xsl:choose>
		</xsl:template>
	<!--<summary>Template voor het bepalen van de directory van object_url</summary>-->
<!--<createdate>1-4-2005</createdate>-->
<!--<author>Sebina Rosbergen</author>-->
<xsl:template match="object_url" mode="url">
	<xsl:value-of select="@object_url" />
</xsl:template>
</xsl:stylesheet>
