<!-- Templates ten behoeve vanutf-8vullen van de Content placeholder voor de header -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!--Rendederen als xml-->
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<!-- placeholder voor zoekfunctie -->
	<xsl:template name="CPHSiteSearch">
		<xsl:param name="leftlink_structure_id" select="/rsistructurenode/menustructurenodes/objectcollection/root/descendant::*[@structure_id=/rsistructurenode/currentstructurenode/siteconfig/search/leftlink/@structure_id]/@structure_id"></xsl:param>
		<xsl:param name="rightlink_structure_id" select="/rsistructurenode/menustructurenodes/objectcollection/root/descendant::*[@structure_id=/rsistructurenode/currentstructurenode/siteconfig/search/rightlink/@structure_id]/@structure_id"></xsl:param>
		<xsl:param name ="searchurl">
			<xsl:choose>
				<xsl:when test="$releaseoutputmode='1' or $releaseoutputmode='4' or $releaseoutputmode='5'">/NetWriterGui/structure/Search.aspx</xsl:when>
				<xsl:when test="/rsistructurenode/currentstructurenode/siteconfig/search/@url!=''">
					<xsl:value-of select="/rsistructurenode/currentstructurenode/siteconfig/search/@url"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="$rightlink_structure_id" mode="url"></xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
    <xsl:if test="/rsistructurenode/currentstructurenode/siteconfig/search/@url!=''">
		  <form method="post" id="zoeken">
			  <xsl:attribute name="action">
				  <xsl:value-of select="$searchurl"/>
			  </xsl:attribute><fieldset>
				  <legend>
					  <xsl:choose>
						  <xsl:when test="/rsistructurenode/currentstructurenode/root/@language_id='2'">Search</xsl:when>
						  <xsl:otherwise>Zoeken</xsl:otherwise>
					  </xsl:choose>
		      </legend>
          <ol>
					  <li>
						  <label for="zoekterm">
									<xsl:choose>
										<xsl:when test="/rsistructurenode/currentstructurenode/root/@language_id='2'">Searchterm</xsl:when>
										<xsl:otherwise>Zoekterm</xsl:otherwise>
									</xsl:choose>
							</label>
							<input type="text" class="text" name="zoekterm" id="zoekterm" />
							<input type="submit" name="submit" class="submit" >
								<xsl:attribute name="value">
									<xsl:choose>
										<xsl:when test="/rsistructurenode/currentstructurenode/root/@language_id='2'">search</xsl:when>
										<xsl:otherwise>zoek</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</input>
						</li></ol></fieldset>
			  </form>
      </xsl:if>
    
				<xsl:if test="($leftlink_structure_id!='' or $rightlink_structure_id!='') and (/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$rightlink_structure_id]/@structure_id=$rightlink_structure_id or /rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$leftlink_structure_id]/@structure_id=$leftlink_structure_id)">
					<ul>
						<xsl:if test=" $rightlink_structure_id!='' and /rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$rightlink_structure_id]/@structure_id=$rightlink_structure_id">
							<li class="advanced_search">
								<a>
									<xsl:attribute name="href">
										<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$rightlink_structure_id]" mode="url"></xsl:apply-templates>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$rightlink_structure_id]" mode="xhtml_title"></xsl:apply-templates>
									</xsl:attribute>
									<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$rightlink_structure_id]" mode="xhtml_display_label"></xsl:apply-templates>
								</a>
							</li>
						</xsl:if>
						<xsl:if test="$leftlink_structure_id!='' ">
							<li class="sidemap">
								<a>
									<xsl:attribute name="href">
										<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$leftlink_structure_id]" mode="url"></xsl:apply-templates>
									</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$leftlink_structure_id]" mode="xhtml_title"></xsl:apply-templates>
									</xsl:attribute>
									<xsl:apply-templates select="/rsistructurenode/menustructurenodes/objectcollection/descendant::*[@structure_id=$leftlink_structure_id]" mode="xhtml_display_label"></xsl:apply-templates>
								</a>
							</li>
						</xsl:if>
					</ul>
				</xsl:if>
		</xsl:template>

</xsl:stylesheet>

