<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<xsl:param name="XlinkId"></xsl:param>
	<xsl:param name="nodeName"></xsl:param>
	<xsl:param name="parentlabel"></xsl:param>
	<xsl:param name="content_fragment_type">default</xsl:param>
	<xsl:param name="releaseoutputmode"></xsl:param>
	<xsl:param name="releaseoutputextension">3</xsl:param>
	<xsl:include href="content.common.xslt"/>
	<xsl:include href="default.common.xslt"/>
	<xsl:include href="../netwriter.common/xml/general.xslt" />
	<xsl:include href="../netwriter.common/textfunctions.xslt" />
	<xsl:include href="../netwriter.common/formatdate.xslt" />
	<xsl:include href="../netwriter.common/url.xslt" />
	<xsl:include href="../netwriter.common/xml/xhtml_templates.xslt" />
	<xsl:output method="xml"  omit-xml-declaration="yes" />
	<xsl:template match="/kompasdocument/documentheader" mode="documentheadercontainer">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="documenttitle" select="self::documenttitle"></xsl:apply-templates>
			<xsl:apply-templates mode="documentheader_documentheadercontainer_container_match_link_object_binary_image_partner" select="self::link_object_binary_image_partner"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="documenttitle" mode="documenttitle">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='Titel onderwerp'">
							<xsl:if test="(count(child::node())+count(child::text()))>0">
								<h1 class="textClass">
									<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
								</h1>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Titel rubriek'">
							<xsl:if test="(count(child::node())+count(child::text()))>0">
								<h2 class="textSection">
									<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
								</h2>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Titel document'">
							<xsl:if test="(count(child::node())+count(child::text()))>0">
								<h2 class="textTitle">
									<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
								</h2>
							</xsl:if>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='Titel onderwerp'">
							<xsl:if test="(count(child::node())+count(child::text()))>0">
								<h1 class="textClass">
									<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
								</h1>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Titel rubriek'">
							<xsl:if test="(count(child::node())+count(child::text()))>0">
								<h2 class="textSection">
									<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
								</h2>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Titel document'">
							<xsl:if test="(count(child::node())+count(child::text()))>0">
								<h2 class="textTitle">
									<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
								</h2>
							</xsl:if>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='Titel onderwerp'">
					<xsl:if test="(count(child::node())+count(child::text()))>0">
						<h1 class="textClass">
							<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
						</h1>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Titel rubriek'">
					<xsl:if test="(count(child::node())+count(child::text()))>0">
						<h2 class="textSection">
							<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
						</h2>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Titel document'">
					<xsl:if test="(count(child::node())+count(child::text()))>0">
						<h2 class="textTitle">
							<xsl:apply-templates mode="documenttitlecontainer" select="."></xsl:apply-templates>
						</h2>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="link_object_binary_image_partner" mode="documentheader_documentheadercontainer_container_match_link_object_binary_image_partner">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="/kompasdocument/body" mode="body">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:variable name="id">
							al_<xsl:value-of select="@XlinkId"></xsl:value-of>
						</xsl:variable>
						<span id="{$id}" class="outputModeHeaderPrint authorlistprintversion">
							<xsl:comment>DNC</xsl:comment>
						</span>
						<xsl:variable name="childcount" select="count(descendant::framemenu[@layout='visible_newline' or @layout='visible_newline_noline'])"></xsl:variable>
						<xsl:choose>
							<xsl:when test="$childcount>0">
								<ul class="kb_linklist">
									<xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates>
								</ul>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:apply-templates mode="bodycont" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:variable name="id">
							al_<xsl:value-of select="@XlinkId"></xsl:value-of>
						</xsl:variable>
						<span id="{$id}" class="outputModeHeaderPrint authorlistprintversion">
							<xsl:comment>DNC</xsl:comment>
						</span>
						<xsl:variable name="childcount" select="count(descendant::framemenu[@layout='visible_newline' or @layout='visible_newline_noline'])"></xsl:variable>
						<xsl:choose>
							<xsl:when test="$childcount>0">
								<ul class="kb_linklist">
									<xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates>
								</ul>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:apply-templates mode="bodycont" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="id">
					al_<xsl:value-of select="@XlinkId"></xsl:value-of>
				</xsl:variable>
				<span id="{$id}" class="outputModeHeaderPrint authorlistprintversion">
					<xsl:comment>DNC</xsl:comment>
				</span>
				<xsl:variable name="childcount" select="count(descendant::framemenu[@layout='visible_newline' or @layout='visible_newline_noline'])"></xsl:variable>
				<xsl:choose>
					<xsl:when test="$childcount>0">
						<ul class="kb_linklist">
							<xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates>
						</ul>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates mode="framemenu" select="descendant::framemenu"></xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates mode="bodycont" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/kompasdocument/body" mode="bodycont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="frame" select="self::frame"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="frame" mode="frame">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='Normaal 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Kader 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Normaal 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Kader 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Normaal 3 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column3/child::node())>0">
										<div class="nw_threecolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Normaal 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Kader 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Normaal 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Kader 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Normaal 3 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column3/child::node())>0">
										<div class="nw_threecolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Normaal 4 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>

							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column3/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column4/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column4"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='Normaal 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Kader 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Normaal 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Kader 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Normaal 3 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column3/child::node())>0">
										<div class="nw_threecolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Normaal 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Kader 1 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Normaal 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Kader 2 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_kader nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_twocolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
										<div class="nw_twocolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<div class="nw_kader_clear">
										<xsl:comment>DNC</xsl:comment>
									</div>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='icon: Normaal 3 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
							<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0">
										<div class="nw_threecolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column3/child::node())>0">
										<div class="nw_threecolumn  nw_lastcolumn">
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
								<p class="back_to_top">
									<a href="#content">Naar boven</a>
								</p>
							</xsl:if>
						</xsl:if>
						<xsl:if test="@layout='Normaal 4 Koloms'">
							<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>

							<xsl:if test="framelabel/@visibilityinframe='visible'">
								<h2 class="textFrameLabel">
									<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="framelabel/text()"></xsl:value-of>
								</h2>
							</xsl:if>
							<xsl:if test="$childcount>0">
								<div class="nw_information_tekst_container">
									<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
										<xsl:attribute name="id">
											<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(column1/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column2/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column3/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:if test="count(column4/child::node())>0">
										<div class="nw_fourcolumn">
											<xsl:apply-templates mode="column" select="column4"></xsl:apply-templates>
										</div>
									</xsl:if>
									<xsl:comment>DNC</xsl:comment>
								</div>
							</xsl:if>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='Normaal 1 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
							<xsl:comment>DNC</xsl:comment>
						</div>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Kader 1 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_kader nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
							<div class="nw_kader_clear">
								<xsl:comment>DNC</xsl:comment>
							</div>
						</div>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Normaal 2 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_twocolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
								<div class="nw_twocolumn nw_lastcolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:comment>DNC</xsl:comment>
						</div>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Kader 2 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_kader nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_twocolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
								<div class="nw_twocolumn  nw_lastcolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<div class="nw_kader_clear">
								<xsl:comment>DNC</xsl:comment>
							</div>
							<xsl:comment>DNC</xsl:comment>
						</div>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Normaal 3 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_threecolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0">
								<div class="nw_threecolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column3/child::node())>0">
								<div class="nw_threecolumn  nw_lastcolumn">
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:comment>DNC</xsl:comment>
						</div>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='icon: Normaal 1 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
							<xsl:comment>DNC</xsl:comment>
						</div>
						<p class="back_to_top">
							<a href="#content">Naar boven</a>
						</p>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='icon: Kader 1 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_kader nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
							<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
							<div class="nw_kader_clear">
								<xsl:comment>DNC</xsl:comment>
							</div>
							<xsl:comment>DNC</xsl:comment>
						</div>
						<p class="back_to_top">
							<a href="#content">Naar boven</a>
						</p>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='icon: Normaal 2 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_twocolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
								<div class="nw_twocolumn nw_lastcolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:comment>DNC</xsl:comment>
						</div>
						<p class="back_to_top">
							<a href="#content">Naar boven</a>
						</p>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='icon: Kader 2 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_kader nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_twocolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0 or count(column3/child::node())>0">
								<div class="nw_twocolumn  nw_lastcolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<div class="nw_kader_clear">
								<xsl:comment>DNC</xsl:comment>
							</div>
							<xsl:comment>DNC</xsl:comment>
						</div>
						<p class="back_to_top">
							<a href="#content">Naar boven</a>
						</p>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='icon: Normaal 3 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>
					<xsl:apply-templates mode="frameline" select="framemenu"></xsl:apply-templates>
					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_threecolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0">
								<div class="nw_threecolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column3/child::node())>0">
								<div class="nw_threecolumn  nw_lastcolumn">
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:comment>DNC</xsl:comment>
						</div>
						<p class="back_to_top">
							<a href="#content">Naar boven</a>
						</p>
					</xsl:if>
				</xsl:if>
				<xsl:if test="@layout='Normaal 4 Koloms'">
					<xsl:variable name="childcount" select="count(column1/*)+count(column2/*)+count(column3/*)+count(column4/*)+count(column5/*)"></xsl:variable>

					<xsl:if test="framelabel/@visibilityinframe='visible'">
						<h2 class="textFrameLabel">
							<xsl:if test="framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline'">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="framelabel/text()"></xsl:value-of>
						</h2>
					</xsl:if>
					<xsl:if test="$childcount>0">
						<div class="nw_information_tekst_container">
							<xsl:if test="framelabel/@visibilityinframe='hidden' and(framemenu/@layout='visible' or framemenu/@layout='visible_newline' or framemenu/@layout='visible_noline' or framemenu/@layout='visible_newline_noline')">
								<xsl:attribute name="id">
									<xsl:apply-templates mode="get_frame_id" select="frameid"></xsl:apply-templates>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="count(column1/child::node())>0">
								<div class="nw_fourcolumn">
									<xsl:apply-templates mode="column" select="column1"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column2/child::node())>0">
								<div class="nw_fourcolumn">
									<xsl:apply-templates mode="column" select="column2"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column3/child::node())>0">
								<div class="nw_fourcolumn">
									<xsl:apply-templates mode="column" select="column3"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="count(column4/child::node())>0">
								<div class="nw_fourcolumn">
									<xsl:apply-templates mode="column" select="column4"></xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:comment>DNC</xsl:comment>
						</div>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="framemenu" mode="frameline">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='hidden'"></xsl:if>
						<xsl:if test="@layout='hidden_line'">
							<hr class="textLine"></hr>
						</xsl:if>
						<xsl:if test="@layout='visible_newline'">
							<hr class="textLine"></hr>
						</xsl:if>
						<xsl:if test="@layout='visible_newline_noline'"></xsl:if>
						<xsl:if test="@layout='visible_noline'"></xsl:if>
						<xsl:if test="@layout='visible'">
							<hr class="textLine"></hr>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='hidden'"></xsl:if>
						<xsl:if test="@layout='hidden_line'">
							<hr class="textLine"></hr>
						</xsl:if>
						<xsl:if test="@layout='visible_newline'">
							<hr class="textLine"></hr>
						</xsl:if>
						<xsl:if test="@layout='visible_newline_noline'"></xsl:if>
						<xsl:if test="@layout='visible_noline'"></xsl:if>
						<xsl:if test="@layout='visible'">
							<hr class="textLine"></hr>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='hidden'"></xsl:if>
				<xsl:if test="@layout='hidden_line'">
					<hr class="textLine"></hr>
				</xsl:if>
				<xsl:if test="@layout='visible_newline'">
					<hr class="textLine"></hr>
				</xsl:if>
				<xsl:if test="@layout='visible_newline_noline'"></xsl:if>
				<xsl:if test="@layout='visible_noline'"></xsl:if>
				<xsl:if test="@layout='visible'">
					<hr class="textLine"></hr>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column1" mode="column">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column1" mode="columncont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			<xsl:apply-templates mode="datatable" select="self::datatable"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_definitionlist" select="self::definitionlist"></xsl:apply-templates>
			<xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_content" select="self::link_content"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup" select="self::subgroup"></xsl:apply-templates>
			<xsl:apply-templates mode="column1_columncont_container_match_dotnetcontrol" select="self::dotnetcontrol"></xsl:apply-templates>
			<xsl:apply-templates mode="banner" select="self::banner"></xsl:apply-templates>
			<xsl:apply-templates mode="box" select="self::box"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="topicallead" mode="topicallead">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<p class="textTopicLead intro">
							<xsl:apply-templates mode="topicalleadcont" select="."></xsl:apply-templates>
						</p>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<p class="textTopicLead intro">
							<xsl:apply-templates mode="topicalleadcont" select="."></xsl:apply-templates>
						</p>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<p class="textTopicLead intro">
					<xsl:apply-templates mode="topicalleadcont" select="."></xsl:apply-templates>
				</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="topicallead" mode="topicalleadcont">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="topicallead_topicalleadcont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="topicallead_topicalleadcont_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="topicallead_topicalleadcont_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="topicallead_topicalleadcont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="topicallead_topicalleadcont_container_match_sub" select="self::sub"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_language" mode="topicallead_topicalleadcont_container_match_link_language">
		<xsl:apply-templates mode="widget_link_language" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="bold" mode="parabold">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="bold_parabold_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="italic" mode="bold_parabold_container_match_italic">
		<em>
			<xsl:apply-templates mode="paraitalic" select="."></xsl:apply-templates>
		</em>
	</xsl:template>
	<xsl:template match="bold" mode="topicallead_topicalleadcont_container_match_bold">
		<strong class="textEmphasis">
			<xsl:apply-templates mode="parabold" select="."></xsl:apply-templates>
		</strong>
	</xsl:template>
	<xsl:template match="italic" mode="topicallead_topicalleadcont_container_match_italic">
		<em>
			<xsl:apply-templates mode="paraitalic" select="."></xsl:apply-templates>
		</em>
	</xsl:template>
	<xsl:template match="super" mode="parasuper">
		<xsl:for-each select="child::*|text()">
			<sup>
				<xsl:value-of select="self::text()"></xsl:value-of>
			</sup>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="super" mode="topicallead_topicalleadcont_container_match_super">
		<xsl:apply-templates mode="parasuper" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="sub" mode="parasub">
		<xsl:for-each select="child::*|text()">
			<sub>
				<xsl:value-of select="self::text()"></xsl:value-of>
			</sub>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="sub" mode="topicallead_topicalleadcont_container_match_sub">
		<xsl:apply-templates mode="parasub" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="header" mode="header">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@level=''">
							<h3 class="textHeader2">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h3>
						</xsl:if>
						<xsl:if test="@level='1'">
							<h2 class="textHeader1">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h2>
						</xsl:if>
						<xsl:if test="@level='1rs'">
							<h2 class="kb_rsheader">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h2>
						</xsl:if>
						<xsl:if test="@level='2'">
							<h3 class="textHeader2">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h3>
						</xsl:if>
						<xsl:if test="@level='3'">
							<h4 class="textHeader3">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h4>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@level=''">
							<h3 class="textHeader2">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h3>
						</xsl:if>
						<xsl:if test="@level='1'">
							<h2 class="textHeader1">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h2>
						</xsl:if>
						<xsl:if test="@level='1rs'">
							<h2 class="kb_rsheader">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h2>
						</xsl:if>
						<xsl:if test="@level='2'">
							<h3 class="textHeader2">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h3>
						</xsl:if>
						<xsl:if test="@level='3'">
							<h4 class="textHeader3">
								<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
							</h4>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@level=''">
					<h3 class="textHeader2">
						<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
					</h3>
				</xsl:if>
				<xsl:if test="@level='1'">
					<h2 class="textHeader1">
						<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
					</h2>
				</xsl:if>
				<xsl:if test="@level='1rs'">
					<h2 class="kb_rsheader">
						<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
					</h2>
				</xsl:if>
				<xsl:if test="@level='2'">
					<h3 class="textHeader2">
						<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
					</h3>
				</xsl:if>
				<xsl:if test="@level='3'">
					<h4 class="textHeader3">
						<xsl:apply-templates mode="headercont" select="."></xsl:apply-templates>
					</h4>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="header" mode="headercont">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="header_headercont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="header_headercont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="header_headercont_container_match_sub" select="self::sub"></xsl:apply-templates>
			<xsl:apply-templates mode="header_headercont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_language" mode="header_headercont_container_match_link_language">
		<xsl:apply-templates mode="widget_link_language" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="super" mode="header_headercont_container_match_super">
		<xsl:apply-templates mode="parasuper" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="sub" mode="header_headercont_container_match_sub">
		<xsl:apply-templates mode="parasub" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition_short" mode="para_link_definition_short">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_definition_short_para_link_definition_short_container_match_definition" select="self::definition"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="definition" mode="definition_short_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:variable name="href">
							#definition_<xsl:value-of select="@definition_id"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="title">
							<xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'">
								<abbr title="{$title}">
									<span title="{$title}" class="notion">
										<xsl:choose>
											<xsl:when test="@definition_name!=''">
												<xsl:value-of select="@definition_name"></xsl:value-of>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@editor_label"></xsl:value-of>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</abbr>
							</xsl:when>
							<xsl:otherwise>
								<abbr title="{$title}">
									<span title="{$title}" class="notion">
										<a class="nw_uo_popup" title="{$title}" href="{$href}">
											<xsl:choose>
												<xsl:when test="@definition_name!=''">
													<xsl:value-of select="@definition_name"></xsl:value-of>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@editor_label"></xsl:value-of>
												</xsl:otherwise>
											</xsl:choose>
										</a>
									</span>
								</abbr>
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:variable name="href">
							#definition_<xsl:value-of select="@definition_id"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="title">
							<xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'">
								<abbr title="{$title}">
									<span title="{$title}" class="notion">
										<xsl:choose>
											<xsl:when test="@definition_name!=''">
												<xsl:value-of select="@definition_name"></xsl:value-of>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@editor_label"></xsl:value-of>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</abbr>
							</xsl:when>
							<xsl:otherwise>
								<abbr title="{$title}">
									<span title="{$title}" class="notion">
										<a class="nw_uo_popup" title="{$title}" href="{$href}">
											<xsl:choose>
												<xsl:when test="@definition_name!=''">
													<xsl:value-of select="@definition_name"></xsl:value-of>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@editor_label"></xsl:value-of>
												</xsl:otherwise>
											</xsl:choose>
										</a>
									</span>
								</abbr>
							</xsl:otherwise>
						</xsl:choose>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="href">
					#definition_<xsl:value-of select="@definition_id"></xsl:value-of>
				</xsl:variable>
				<xsl:variable name="title">
					<xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$content_fragment_type='kbdefault' or $content_fragment_type='linklist'">
						<abbr title="{$title}">
							<span title="{$title}" class="notion">
								<xsl:choose>
									<xsl:when test="@definition_name!=''">
										<xsl:value-of select="@definition_name"></xsl:value-of>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="@editor_label"></xsl:value-of>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</abbr>
					</xsl:when>
					<xsl:otherwise>
						<abbr title="{$title}">
							<span title="{$title}" class="notion">
								<a class="nw_uo_popup" title="{$title}" href="{$href}">
									<xsl:choose>
										<xsl:when test="@definition_name!=''">
											<xsl:value-of select="@definition_name"></xsl:value-of>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@editor_label"></xsl:value-of>
										</xsl:otherwise>
									</xsl:choose>
								</a>
							</span>
						</abbr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="definition" mode="link_definition_short_para_link_definition_short_container_match_definition">
		<xsl:apply-templates mode="definition_short_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition_short" mode="header_headercont_container_match_link_definition_short">
		<xsl:apply-templates mode="para_link_definition_short" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="paragraph" mode="paragraph">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='paragraph'">
							<p>
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
						<xsl:if test="@layout='break_start'">
							<p class="nw_break_start">
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
						<xsl:if test="@layout='break_end'">
							<p class="nw_break_end">
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
						<xsl:if test="@layout='break_none'">
							<p class="nw_inline">
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='paragraph'">
							<p>
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
						<xsl:if test="@layout='break_start'">
							<p class="nw_break_start">
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
						<xsl:if test="@layout='break_end'">
							<p class="nw_break_end">
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
						<xsl:if test="@layout='break_none'">
							<p class="nw_inline">
								<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
							</p>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='paragraph'">
					<p>
						<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
					</p>
				</xsl:if>
				<xsl:if test="@layout='break_start'">
					<p class="nw_break_start">
						<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
					</p>
				</xsl:if>
				<xsl:if test="@layout='break_end'">
					<p class="nw_break_end">
						<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
					</p>
				</xsl:if>
				<xsl:if test="@layout='break_none'">
					<p class="nw_inline">
						<xsl:apply-templates mode="paracont" select="."></xsl:apply-templates>
					</p>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="paragraph" mode="paracont">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_sub" select="self::sub"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_code_file" select="self::link_code_file"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph_paracont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_language" mode="paragraph_paracont_container_match_link_language">
		<xsl:apply-templates mode="widget_link_language" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="bold" mode="paragraph_paracont_container_match_bold">
		<strong>
			<xsl:apply-templates mode="parabold" select="."></xsl:apply-templates>
		</strong>
	</xsl:template>
	<xsl:template match="italic" mode="paragraph_paracont_container_match_italic">
		<em class="textEmphasis">
			<xsl:apply-templates mode="paraitalic" select="."></xsl:apply-templates>
		</em>
	</xsl:template>
	<xsl:template match="super" mode="paragraph_paracont_container_match_super">
		<xsl:apply-templates mode="parasuper" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="sub" mode="paragraph_paracont_container_match_sub">
		<xsl:apply-templates mode="parasub" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_reference" mode="para_link_reference">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_reference_para_link_reference_container_match_reference" select="self::reference"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="reference" mode="referencewriter">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:variable name="href">
							#reference_<xsl:value-of select="@reference_id"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="spatie">
							<xsl:text></xsl:text>
						</xsl:variable>
						<xsl:variable name="punt">
							<xsl:if test="reference_type_id !='2'">
								<xsl:text>.</xsl:text>
							</xsl:if>
						</xsl:variable>
						<xsl:variable name="myreference_title">
							<xsl:call-template name="replaceString">
								<xsl:with-param name="ReplaceStringIn" select="@reference_title"></xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="title">
							<xsl:choose>
								<xsl:when test="@reference_type_id ='2'">
									<xsl:variable name="myReference">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myReference"></xsl:with-param>
									</xsl:call-template>
									<xsl:text></xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="myreference_authors">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_authors"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_authors"></xsl:with-param>
									</xsl:call-template>
									<xsl:text></xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="$myreference_title"></xsl:value-of>
							<xsl:choose>
								<xsl:when test="@reference_info !=''">
									<xsl:variable name="myreference_info">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_info"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:value-of select="$spatie"></xsl:value-of>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_info"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="@reference_year !=''">
									<xsl:variable name="myreference_year">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_year"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:value-of select="$spatie"></xsl:value-of>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_year"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="@reference_code !=''">
									<xsl:variable name="myreference_code">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_code"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_code"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="@reference_volume !=''">
									<xsl:variable name="myreference_volume">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_volume"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_volume"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="$punt"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="reference_label">
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference"></xsl:with-param>
								<xsl:with-param name="encode_output">no</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference_code"></xsl:with-param>
								<xsl:with-param name="encode_output">no</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<a class="nw_uo_popup textReference" href="{$href}">
							<xsl:attribute name="title">
								<xsl:call-template name="replace_html_chars">
									<xsl:with-param name="ReplaceStringIn">
										<xsl:value-of select="$title"></xsl:value-of>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:attribute>
							<cite>
								<xsl:value-of select="$reference_label"></xsl:value-of>
							</cite>
						</a>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:variable name="href">
							#reference_<xsl:value-of select="@reference_id"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="spatie">
							<xsl:text></xsl:text>
						</xsl:variable>
						<xsl:variable name="punt">
							<xsl:if test="reference_type_id !='2'">
								<xsl:text>.</xsl:text>
							</xsl:if>
						</xsl:variable>
						<xsl:variable name="myreference_title">
							<xsl:call-template name="replaceString">
								<xsl:with-param name="ReplaceStringIn" select="@reference_title"></xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="title">
							<xsl:choose>
								<xsl:when test="@reference_type_id ='2'">
									<xsl:variable name="myReference">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myReference"></xsl:with-param>
									</xsl:call-template>
									<xsl:text></xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="myreference_authors">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_authors"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_authors"></xsl:with-param>
									</xsl:call-template>
									<xsl:text></xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="$myreference_title"></xsl:value-of>
							<xsl:choose>
								<xsl:when test="@reference_info !=''">
									<xsl:variable name="myreference_info">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_info"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:value-of select="$spatie"></xsl:value-of>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_info"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="@reference_year !=''">
									<xsl:variable name="myreference_year">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_year"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:value-of select="$spatie"></xsl:value-of>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_year"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="@reference_code !=''">
									<xsl:variable name="myreference_code">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_code"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_code"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="@reference_volume !=''">
									<xsl:variable name="myreference_volume">
										<xsl:call-template name="replaceString">
											<xsl:with-param name="ReplaceStringIn" select="@reference_volume"></xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="my_text_input" select="$myreference_volume"></xsl:with-param>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="$punt"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="reference_label">
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference"></xsl:with-param>
								<xsl:with-param name="encode_output">no</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference_code"></xsl:with-param>
								<xsl:with-param name="encode_output">no</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<a class="nw_uo_popup textReference" href="{$href}">
							<xsl:attribute name="title">
								<xsl:call-template name="replace_html_chars">
									<xsl:with-param name="ReplaceStringIn">
										<xsl:value-of select="$title"></xsl:value-of>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:attribute>
							<cite>
								<xsl:value-of select="$reference_label"></xsl:value-of>
							</cite>
						</a>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="href">
					#reference_<xsl:value-of select="@reference_id"></xsl:value-of>
				</xsl:variable>
				<xsl:variable name="spatie">
					<xsl:text></xsl:text>
				</xsl:variable>
				<xsl:variable name="punt">
					<xsl:if test="reference_type_id !='2'">
						<xsl:text>.</xsl:text>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="myreference_title">
					<xsl:call-template name="replaceString">
						<xsl:with-param name="ReplaceStringIn" select="@reference_title"></xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="title">
					<xsl:choose>
						<xsl:when test="@reference_type_id ='2'">
							<xsl:variable name="myReference">
								<xsl:call-template name="replaceString">
									<xsl:with-param name="ReplaceStringIn" select="@reference"></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="$myReference"></xsl:with-param>
							</xsl:call-template>
							<xsl:text></xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="myreference_authors">
								<xsl:call-template name="replaceString">
									<xsl:with-param name="ReplaceStringIn" select="@reference_authors"></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="$myreference_authors"></xsl:with-param>
							</xsl:call-template>
							<xsl:text></xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="$myreference_title"></xsl:value-of>
					<xsl:choose>
						<xsl:when test="@reference_info !=''">
							<xsl:variable name="myreference_info">
								<xsl:call-template name="replaceString">
									<xsl:with-param name="ReplaceStringIn" select="@reference_info"></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:value-of select="$spatie"></xsl:value-of>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="$myreference_info"></xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="@reference_year !=''">
							<xsl:variable name="myreference_year">
								<xsl:call-template name="replaceString">
									<xsl:with-param name="ReplaceStringIn" select="@reference_year"></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:value-of select="$spatie"></xsl:value-of>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="$myreference_year"></xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="@reference_code !=''">
							<xsl:variable name="myreference_code">
								<xsl:call-template name="replaceString">
									<xsl:with-param name="ReplaceStringIn" select="@reference_code"></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="$myreference_code"></xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="@reference_volume !=''">
							<xsl:variable name="myreference_volume">
								<xsl:call-template name="replaceString">
									<xsl:with-param name="ReplaceStringIn" select="@reference_volume"></xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="$myreference_volume"></xsl:with-param>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:value-of select="$punt"></xsl:value-of>
				</xsl:variable>
				<xsl:variable name="reference_label">
					<xsl:call-template name="Interpunctie">
						<xsl:with-param name="my_text_input" select="@reference"></xsl:with-param>
						<xsl:with-param name="encode_output">no</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="Interpunctie">
						<xsl:with-param name="my_text_input" select="@reference_code"></xsl:with-param>
						<xsl:with-param name="encode_output">no</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<a class="nw_uo_popup textReference" href="{$href}">
					<xsl:attribute name="title">
						<xsl:call-template name="replace_html_chars">
							<xsl:with-param name="ReplaceStringIn">
								<xsl:value-of select="$title"></xsl:value-of>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:attribute>
					<cite>
						<xsl:value-of select="$reference_label"></xsl:value-of>
					</cite>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="reference" mode="link_reference_para_link_reference_container_match_reference">
		<xsl:apply-templates mode="referencewriter" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_reference" mode="paragraph_paracont_container_match_link_reference">
		<xsl:apply-templates mode="para_link_reference" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition_short" mode="paragraph_paracont_container_match_link_definition_short">
		<xsl:apply-templates mode="para_link_definition_short" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition" mode="para_link_definition">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_definition_para_link_definition_container_match_definition" select="self::definition"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="definition" mode="definition_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:variable name="href">
							#definition_<xsl:value-of select="@definition_id"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="title">
							<xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates>
						</xsl:variable>
						<a class="nw_uo_popup textDefinition" title="{$title}" href="{$href}">
							<xsl:value-of select="@editor_label"></xsl:value-of>
						</a>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:variable name="href">
							#definition_<xsl:value-of select="@definition_id"></xsl:value-of>
						</xsl:variable>
						<xsl:variable name="title">
							<xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates>
						</xsl:variable>
						<a class="nw_uo_popup textDefinition" title="{$title}" href="{$href}">
							<xsl:value-of select="@editor_label"></xsl:value-of>
						</a>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="href">
					#definition_<xsl:value-of select="@definition_id"></xsl:value-of>
				</xsl:variable>
				<xsl:variable name="title">
					<xsl:apply-templates mode="xhtml_title" select="."></xsl:apply-templates>
				</xsl:variable>
				<a class="nw_uo_popup textDefinition" title="{$title}" href="{$href}">
					<xsl:value-of select="@editor_label"></xsl:value-of>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="definition" mode="link_definition_para_link_definition_container_match_definition">
		<xsl:apply-templates mode="definition_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition" mode="paragraph_paracont_container_match_link_definition">
		<xsl:apply-templates mode="para_link_definition" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_class" mode="para_link_object_class">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_class_para_link_object_class_container_match_object_class" select="self::object_class"></xsl:apply-templates>
			<xsl:apply-templates mode="link_object_class_para_link_object_class_container_match_link_object_binary_icon" select="self::link_object_binary_icon"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_class" mode="object_class_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label">
								<xsl:value-of select="@editor_label"></xsl:value-of>
							</xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label">
								<xsl:value-of select="@editor_label"></xsl:value-of>
							</xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_link_text" select=".">
					<xsl:with-param name="label">
						<xsl:value-of select="@editor_label"></xsl:value-of>
					</xsl:with-param>
					<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_class" mode="link_object_class_para_link_object_class_container_match_object_class">
		<xsl:apply-templates mode="object_class_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_icon" mode="link_object_class_para_link_object_class_container_match_link_object_binary_icon">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_class" mode="paragraph_paracont_container_match_link_object_class">
		<xsl:apply-templates mode="para_link_object_class" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_document" mode="para_link_object_document">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_document_para_link_object_document_container_match_object_document" select="self::object_document"></xsl:apply-templates>
			<xsl:apply-templates mode="link_object_document_para_link_object_document_container_match_link_object_binary_icon" select="self::link_object_binary_icon"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_document" mode="object_document_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_link_text" select=".">
					<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_document" mode="link_object_document_para_link_object_document_container_match_object_document">
		<xsl:apply-templates mode="object_document_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_icon" mode="link_object_document_para_link_object_document_container_match_link_object_binary_icon">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_document" mode="paragraph_paracont_container_match_link_object_document">
		<xsl:apply-templates mode="para_link_object_document" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map" mode="para_link_object_map">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_map_para_link_object_map_container_match_object_map" select="self::object_map"></xsl:apply-templates>
			<xsl:apply-templates mode="link_object_map_para_link_object_map_container_match_link_object_binary_icon" select="self::link_object_binary_icon"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_map" mode="object_map_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_link_text" select=".">
					<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_map" mode="link_object_map_para_link_object_map_container_match_object_map">
		<xsl:apply-templates mode="object_map_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_icon" mode="link_object_map_para_link_object_map_container_match_link_object_binary_icon">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map" mode="paragraph_paracont_container_match_link_object_map">
		<xsl:apply-templates mode="para_link_object_map" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_url" mode="para_link_object_url">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_url_para_link_object_url_container_match_object_url" select="self::object_url"></xsl:apply-templates>
			<xsl:apply-templates mode="link_object_url_para_link_object_url_container_match_link_object_binary_icon" select="self::link_object_binary_icon"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_url" mode="object_url_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label">
								<xsl:value-of select="@editor_label"></xsl:value-of>
							</xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label">
								<xsl:value-of select="@editor_label"></xsl:value-of>
							</xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_link_text" select=".">
					<xsl:with-param name="label">
						<xsl:value-of select="@editor_label"></xsl:value-of>
					</xsl:with-param>
					<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_url" mode="link_object_url_para_link_object_url_container_match_object_url">
		<xsl:apply-templates mode="object_url_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_icon" mode="link_object_url_para_link_object_url_container_match_link_object_binary_icon">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_url" mode="paragraph_paracont_container_match_link_object_url">
		<xsl:apply-templates mode="para_link_object_url" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_code_file" mode="para_link_code_file">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_code_file_para_link_code_file_container_match_code_file" select="self::code_file"></xsl:apply-templates>
			<xsl:apply-templates mode="link_code_file_para_link_code_file_container_match_link_object_binary_icon" select="self::link_object_binary_icon"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="code_file" mode="code_file_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_link_text" select=".">
					<xsl:with-param name="label" select="@editor_label"></xsl:with-param>
					<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="code_file" mode="link_code_file_para_link_code_file_container_match_code_file">
		<xsl:apply-templates mode="code_file_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_icon" mode="link_code_file_para_link_code_file_container_match_link_object_binary_icon">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_code_file" mode="paragraph_paracont_container_match_link_code_file">
		<xsl:apply-templates mode="para_link_code_file" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_pdf" mode="para_link_object_binary_pdf">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_binary_pdf_para_link_object_binary_pdf_container_match_object_binary" select="self::object_binary"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_binary" mode="object_binary_pdf_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_link_text" select=".">
							<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
						</xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_link_text" select=".">
					<xsl:with-param name="show_netwriter_classes">true</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_binary" mode="link_object_binary_pdf_para_link_object_binary_pdf_container_match_object_binary">
		<xsl:apply-templates mode="object_binary_pdf_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_pdf" mode="paragraph_paracont_container_match_link_object_binary_pdf">
		<xsl:apply-templates mode="para_link_object_binary_pdf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="column1_columncont_container_match_link_object_binary_image">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="datatable" mode="datatablecontainer">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="datatable_datatablecontainer_container_match_datarow" select="self::datarow"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="datarow" mode="datarowcontainer">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="datarow_datarowcontainer_container_match_datacell" select="self::datacell"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="datacell" mode="datacell">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='default'">
							<xsl:apply-templates mode="datacellcont" select="."></xsl:apply-templates>

						</xsl:if>
						<xsl:if test="@layout=''">
							<xsl:apply-templates mode="datacellcont" select="."></xsl:apply-templates>

						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='default'">
							<xsl:apply-templates mode="datacellcont" select="."></xsl:apply-templates>

						</xsl:if>
						<xsl:if test="@layout=''">
							<xsl:apply-templates mode="datacellcont" select="."></xsl:apply-templates>

						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='default'">
					<xsl:apply-templates mode="datacellcont" select="."></xsl:apply-templates>

				</xsl:if>
				<xsl:if test="@layout=''">
					<xsl:apply-templates mode="datacellcont" select="."></xsl:apply-templates>

				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="datacell" mode="datacellcont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="datacell_datacellcont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="list" mode="list">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:if test="@layout='Bullets'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Nobullets'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Arrows'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Numbers'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Letters'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:if test="@layout='Bullets'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Nobullets'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Arrows'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Numbers'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
						<xsl:if test="@layout='Letters'">
							<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
						</xsl:if>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@layout='Bullets'">
					<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
				</xsl:if>
				<xsl:if test="@layout='Nobullets'">
					<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
				</xsl:if>
				<xsl:if test="@layout='Arrows'">
					<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
				</xsl:if>
				<xsl:if test="@layout='Numbers'">
					<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
				</xsl:if>
				<xsl:if test="@layout='Letters'">
					<xsl:apply-templates mode="listwriter" select="."></xsl:apply-templates>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="region_link_object_binary_image">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="widget_object_binary_image" select="object_binary"></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="widget_object_binary_image" select="object_binary"></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="widget_object_binary_image" select="object_binary"></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="datacell_datacellcont_container_match_link_object_binary_image">
		<xsl:apply-templates mode="region_link_object_binary_image" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="datarow" mode="datarowcontainerth">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="datarow_datarowcontainerth_container_match_datacell" select="self::datacell"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="datarow" mode="datarowcontainerthrow">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="datarow_datarowcontainerthrow_container_match_datacell" select="self::datacell"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="definitionlist" mode="column1_columncont_container_match_definitionlist">
		<xsl:apply-templates select="." mode="definitionlist"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="caption" mode="caption">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<p class="textCaption">
							<xsl:apply-templates mode="captioncont" select="."></xsl:apply-templates>
						</p>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<p class="textCaption">
							<xsl:apply-templates mode="captioncont" select="."></xsl:apply-templates>
						</p>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<p class="textCaption">
					<xsl:apply-templates mode="captioncont" select="."></xsl:apply-templates>
				</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="caption" mode="captioncont">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="caption_captioncont_container_match_bold" select="self::bold[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_language" select="self::link_language"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_super" select="self::super"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_sub" select="self::sub"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_reference" select="self::link_reference"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_definition_short" select="self::link_definition_short"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_definition" select="self::link_definition"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_object_class" select="self::link_object_class"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_object_document" select="self::link_object_document"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_object_map" select="self::link_object_map"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_object_url" select="self::link_object_url"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_link_object_binary_pdf" select="self::link_object_binary_pdf"></xsl:apply-templates>
			<xsl:apply-templates mode="caption_captioncont_container_match_italic" select="self::italic[.!='' or count(child::node())>0]"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="bold" mode="caption_captioncont_container_match_bold">
		<strong class="textEmphasis">
			<xsl:apply-templates mode="parabold" select="."></xsl:apply-templates>
		</strong>
	</xsl:template>
	<xsl:template match="link_language" mode="caption_captioncont_container_match_link_language">
		<xsl:apply-templates mode="widget_link_language" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="super" mode="caption_captioncont_container_match_super">
		<xsl:apply-templates mode="parasuper" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="sub" mode="caption_captioncont_container_match_sub">
		<xsl:apply-templates mode="parasub" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_reference" mode="caption_captioncont_container_match_link_reference">
		<xsl:apply-templates mode="para_link_reference" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition_short" mode="caption_captioncont_container_match_link_definition_short">
		<xsl:apply-templates mode="para_link_definition_short" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_definition" mode="caption_captioncont_container_match_link_definition">
		<xsl:apply-templates mode="para_link_definition" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_class" mode="caption_captioncont_container_match_link_object_class">
		<xsl:apply-templates mode="para_link_object_class" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_document" mode="caption_captioncont_container_match_link_object_document">
		<xsl:apply-templates mode="para_link_object_document" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map" mode="caption_captioncont_container_match_link_object_map">
		<xsl:apply-templates mode="para_link_object_map" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_url" mode="caption_captioncont_container_match_link_object_url">
		<xsl:apply-templates mode="para_link_object_url" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_binary_pdf" mode="caption_captioncont_container_match_link_object_binary_pdf">
		<xsl:apply-templates mode="para_link_object_binary_pdf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="italic" mode="caption_captioncont_container_match_italic">
		<em>
			<xsl:apply-templates mode="paraitalic" select="."></xsl:apply-templates>
		</em>
	</xsl:template>
	<xsl:template match="link_object_map_swf" mode="column1_columncont_container_match_link_object_map_swf">
		<xsl:apply-templates mode="region_link_object_map_swf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_content" mode="region_link_content">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="para_link_content" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="para_link_content" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="para_link_content" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="link_content" mode="para_link_content">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_content_para_link_content_container_match_content" select="self::content"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="content" mode="content_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						[getFragment(<xsl:value-of select="@content_id"></xsl:value-of>,<xsl:value-of select="@XlinkIdLinked"></xsl:value-of>)]
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						[getFragment(<xsl:value-of select="@content_id"></xsl:value-of>,<xsl:value-of select="@XlinkIdLinked"></xsl:value-of>)]
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				[getFragment(<xsl:value-of select="@content_id"></xsl:value-of>,<xsl:value-of select="@XlinkIdLinked"></xsl:value-of>)]
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="content" mode="link_content_para_link_content_container_match_content">
		<xsl:apply-templates mode="content_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_content" mode="column1_columncont_container_match_link_content">
		<xsl:apply-templates mode="region_link_content" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="region_link_object_wuc">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="para_object_wuc" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="para_object_wuc" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="para_object_wuc" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="para_object_wuc">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_wuc_para_object_wuc_container_match_object_wuc" select="self::object_wuc"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_wuc" mode="object_wuc_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="xhtml_default" select="."></xsl:apply-templates>
						<xsl:apply-templates mode="widget_link_object_wuc" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="xhtml_default" select="."></xsl:apply-templates>
						<xsl:apply-templates mode="widget_link_object_wuc" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="xhtml_default" select="."></xsl:apply-templates>
				<xsl:apply-templates mode="widget_link_object_wuc" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_wuc" mode="link_object_wuc_para_object_wuc_container_match_object_wuc">
		<xsl:apply-templates mode="object_wuc_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="column1_columncont_container_match_link_object_wuc">
		<xsl:apply-templates mode="region_link_object_wuc" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_external" mode="region_link_object_external">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="para_object_external" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="para_object_external" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="para_object_external" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="link_object_external" mode="para_object_external">
		<xsl:for-each select="child::*|text()">
			<xsl:value-of select="self::text()"></xsl:value-of>
			<xsl:apply-templates mode="link_object_external_para_object_external_container_match_object_external" select="self::object_external"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="object_external" mode="object_external_writer">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="widget_link_object_external" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="widget_link_object_external" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="widget_link_object_external" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="object_external" mode="link_object_external_para_object_external_container_match_object_external">
		<xsl:apply-templates mode="object_external_writer" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_external" mode="column1_columncont_container_match_link_object_external">
		<xsl:apply-templates mode="region_link_object_external" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="subgroup" mode="subgroup">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="subgroup_container" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="subgroup_container" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="subgroup_container" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="subgroup" mode="subgroup_container">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup_subgroup_container_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup_subgroup_container_container_match_datatable" select="self::datatable"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup_subgroup_container_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup_subgroup_container_container_match_link_content" select="self::link_content"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup_subgroup_container_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup_subgroup_container_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="subgroup_subgroup_container_container_match_link_object_binary_image">
		<xsl:apply-templates mode="widget_object_binary_image" select="object_binary"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="datatable" mode="subgroup_subgroup_container_container_match_datatable">
		<xsl:apply-templates select="." mode="datatable"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map_swf" mode="subgroup_subgroup_container_container_match_link_object_map_swf">
		<xsl:apply-templates mode="region_link_object_map_swf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_content" mode="subgroup_subgroup_container_container_match_link_content">
		<xsl:apply-templates mode="region_link_content" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="subgroup_subgroup_container_container_match_link_object_wuc">
		<xsl:apply-templates mode="region_link_object_wuc" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_external" mode="subgroup_subgroup_container_container_match_link_object_external">
		<xsl:apply-templates mode="region_link_object_external" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="dotnetcontrol" mode="column1_columncont_container_match_dotnetcontrol">
		<xsl:apply-templates select="." mode="dotnetcontrol_manual"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="banner" mode="banner">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<div>
							<xsl:attribute name="class">
								mod banner hl_<xsl:value-of select="@color"></xsl:value-of>
							</xsl:attribute>
							<a>
								<xsl:attribute name="href">
									<xsl:apply-templates select="child[1]/child[1]" mode="url"></xsl:apply-templates>
								</xsl:attribute>
								<xsl:apply-templates mode="link_object_binary_image" select="link_image/link_object_binary_image[position()=1]"></xsl:apply-templates>
								<xsl:value-of select="content"></xsl:value-of>
							</a>
						</div>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<div>
							<xsl:attribute name="class">
								mod banner hl_<xsl:value-of select="@color"></xsl:value-of>
							</xsl:attribute>
							<a>
								<xsl:attribute name="href">
									<xsl:apply-templates select="child[1]/child[1]" mode="url"></xsl:apply-templates>
								</xsl:attribute>
								<xsl:apply-templates mode="link_object_binary_image" select="link_image/link_object_binary_image[position()=1]"></xsl:apply-templates>
								<xsl:value-of select="content"></xsl:value-of>
							</a>
						</div>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<div>
					<xsl:attribute name="class">
						mod banner hl_<xsl:value-of select="@color"></xsl:value-of>
					</xsl:attribute>
					<a>
						<xsl:attribute name="href">
							<xsl:apply-templates select="child[1]/child[1]" mode="url"></xsl:apply-templates>
						</xsl:attribute>
						<xsl:apply-templates mode="link_object_binary_image" select="link_image/link_object_binary_image[position()=1]"></xsl:apply-templates>
						<xsl:value-of select="content"></xsl:value-of>
					</a>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="box" mode="box">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<div class="open contrast_lightest">
							<xsl:attribute name="class">
								<xsl:text>mod box  </xsl:text>
								<xsl:choose>
									<xsl:when test="@box_fill_mode='open'"> open </xsl:when>
									<xsl:otherwise> closed </xsl:otherwise>
								</xsl:choose>
								<xsl:text></xsl:text>
								<xsl:value-of select="@color"></xsl:value-of>
								<xsl:if test="@foldable='true'">
									<xsl:text></xsl:text> nw_foldable
								</xsl:if>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="@IsAdded='True'">
									<ins>
										<span class="addeditem">
											<xsl:if test="header/@level=''">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='1'">
												<h2 class="textHeader1 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='1rs'">
												<h2 class="kb_rsheader nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='2'">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='3'">
												<h4 class="textHeader3 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h4>
											</xsl:if>
										</span>
									</ins>
								</xsl:when>
								<xsl:when test="@IsDeleted='True'">
									<del>
										<span class="deleteditem">
											<xsl:if test="header/@level=''">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='1'">
												<h2 class="textHeader1 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='1rs'">
												<h2 class="kb_rsheader nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='2'">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='3'">
												<h4 class="textHeader3 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h4>
											</xsl:if>
										</span>
									</del>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="header/@level=''">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='1'">
										<h2 class="textHeader1 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='1rs'">
										<h2 class="kb_rsheader nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='2'">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='3'">
										<h4 class="textHeader3 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h4>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:apply-templates select="content" mode="content_columncont"></xsl:apply-templates>
						</div>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<div class="open contrast_lightest">
							<xsl:attribute name="class">
								<xsl:text>mod box  </xsl:text>
								<xsl:choose>
									<xsl:when test="@box_fill_mode='open'"> open </xsl:when>
									<xsl:otherwise> closed </xsl:otherwise>
								</xsl:choose>
								<xsl:text></xsl:text>
								<xsl:value-of select="@color"></xsl:value-of>
								<xsl:if test="@foldable='true'">
									<xsl:text></xsl:text> nw_foldable
								</xsl:if>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="@IsAdded='True'">
									<ins>
										<span class="addeditem">
											<xsl:if test="header/@level=''">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='1'">
												<h2 class="textHeader1 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='1rs'">
												<h2 class="kb_rsheader nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='2'">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='3'">
												<h4 class="textHeader3 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h4>
											</xsl:if>
										</span>
									</ins>
								</xsl:when>
								<xsl:when test="@IsDeleted='True'">
									<del>
										<span class="deleteditem">
											<xsl:if test="header/@level=''">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='1'">
												<h2 class="textHeader1 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='1rs'">
												<h2 class="kb_rsheader nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h2>
											</xsl:if>
											<xsl:if test="header/@level='2'">
												<h3 class="textHeader2 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h3>
											</xsl:if>
											<xsl:if test="header/@level='3'">
												<h4 class="textHeader3 nw_foldable_header">
													<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
												</h4>
											</xsl:if>
										</span>
									</del>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="header/@level=''">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='1'">
										<h2 class="textHeader1 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='1rs'">
										<h2 class="kb_rsheader nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='2'">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='3'">
										<h4 class="textHeader3 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h4>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:apply-templates select="content" mode="content_columncont"></xsl:apply-templates>
						</div>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<div class="open contrast_lightest">
					<xsl:attribute name="class">
						<xsl:text>mod box  </xsl:text>
						<xsl:choose>
							<xsl:when test="@box_fill_mode='open'"> open </xsl:when>
							<xsl:otherwise> closed </xsl:otherwise>
						</xsl:choose>
						<xsl:text></xsl:text>
						<xsl:value-of select="@color"></xsl:value-of>
						<xsl:if test="@foldable='true'">
							<xsl:text></xsl:text> nw_foldable
						</xsl:if>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@IsAdded='True'">
							<ins>
								<span class="addeditem">
									<xsl:if test="header/@level=''">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='1'">
										<h2 class="textHeader1 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='1rs'">
										<h2 class="kb_rsheader nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='2'">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='3'">
										<h4 class="textHeader3 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h4>
									</xsl:if>
								</span>
							</ins>
						</xsl:when>
						<xsl:when test="@IsDeleted='True'">
							<del>
								<span class="deleteditem">
									<xsl:if test="header/@level=''">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='1'">
										<h2 class="textHeader1 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='1rs'">
										<h2 class="kb_rsheader nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h2>
									</xsl:if>
									<xsl:if test="header/@level='2'">
										<h3 class="textHeader2 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h3>
									</xsl:if>
									<xsl:if test="header/@level='3'">
										<h4 class="textHeader3 nw_foldable_header">
											<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
										</h4>
									</xsl:if>
								</span>
							</del>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="header/@level=''">
								<h3 class="textHeader2 nw_foldable_header">
									<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
								</h3>
							</xsl:if>
							<xsl:if test="header/@level='1'">
								<h2 class="textHeader1 nw_foldable_header">
									<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
								</h2>
							</xsl:if>
							<xsl:if test="header/@level='1rs'">
								<h2 class="kb_rsheader nw_foldable_header">
									<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
								</h2>
							</xsl:if>
							<xsl:if test="header/@level='2'">
								<h3 class="textHeader2 nw_foldable_header">
									<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
								</h3>
							</xsl:if>
							<xsl:if test="header/@level='3'">
								<h4 class="textHeader3 nw_foldable_header">
									<xsl:apply-templates mode="headercont" select="header"></xsl:apply-templates>
								</h4>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="content" mode="content_columncont"></xsl:apply-templates>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column2" mode="column">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column2" mode="columncont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			<xsl:apply-templates mode="datatable" select="self::datatable"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_definitionlist" select="self::definitionlist"></xsl:apply-templates>
			<xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_link_content" select="self::link_content"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup" select="self::subgroup"></xsl:apply-templates>
			<xsl:apply-templates mode="column2_columncont_container_match_dotnetcontrol" select="self::dotnetcontrol"></xsl:apply-templates>
			<xsl:apply-templates mode="banner" select="self::banner"></xsl:apply-templates>
			<xsl:apply-templates mode="box" select="self::box"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="column2_columncont_container_match_link_object_binary_image">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="definitionlist" mode="column2_columncont_container_match_definitionlist">
		<xsl:apply-templates select="." mode="definitionlist"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map_swf" mode="column2_columncont_container_match_link_object_map_swf">
		<xsl:apply-templates mode="region_link_object_map_swf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_content" mode="column2_columncont_container_match_link_content">
		<xsl:apply-templates mode="region_link_content" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="column2_columncont_container_match_link_object_wuc">
		<xsl:apply-templates mode="region_link_object_wuc" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_external" mode="column2_columncont_container_match_link_object_external">
		<xsl:apply-templates mode="region_link_object_external" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="dotnetcontrol" mode="column2_columncont_container_match_dotnetcontrol">
		<xsl:apply-templates select="." mode="dotnetcontrol_manual"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="column3" mode="column">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column3" mode="columncont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			<xsl:apply-templates mode="datatable" select="self::datatable"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_definitionlist" select="self::definitionlist"></xsl:apply-templates>
			<xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_link_content" select="self::link_content"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup" select="self::subgroup"></xsl:apply-templates>
			<xsl:apply-templates mode="column3_columncont_container_match_dotnetcontrol" select="self::dotnetcontrol"></xsl:apply-templates>
			<xsl:apply-templates mode="banner" select="self::banner"></xsl:apply-templates>
			<xsl:apply-templates mode="box" select="self::box"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="column3_columncont_container_match_link_object_binary_image">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="definitionlist" mode="column3_columncont_container_match_definitionlist">
		<xsl:apply-templates select="." mode="definitionlist"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map_swf" mode="column3_columncont_container_match_link_object_map_swf">
		<xsl:apply-templates mode="region_link_object_map_swf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_content" mode="column3_columncont_container_match_link_content">
		<xsl:apply-templates mode="region_link_content" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="column3_columncont_container_match_link_object_wuc">
		<xsl:apply-templates mode="region_link_object_wuc" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_external" mode="column3_columncont_container_match_link_object_external">
		<xsl:apply-templates mode="region_link_object_external" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="dotnetcontrol" mode="column3_columncont_container_match_dotnetcontrol">
		<xsl:apply-templates select="." mode="dotnetcontrol_manual"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="column4" mode="column">
		<xsl:choose>
			<xsl:when test="@IsAdded='True'">
				<ins>
					<span class="addeditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</ins>
			</xsl:when>
			<xsl:when test="@IsDeleted='True'">
				<del>
					<span class="deleteditem">
						<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
					</span>
				</del>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="columncont" select="."></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="column4" mode="columncont">
		<xsl:for-each select="child::*|text()">
			<xsl:apply-templates mode="topicallead" select="self::topicallead[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="header" select="self::header[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="paragraph" select="self::paragraph[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_link_object_binary_image" select="self::link_object_binary_image"></xsl:apply-templates>
			<xsl:apply-templates mode="datatable" select="self::datatable"></xsl:apply-templates>
			<xsl:apply-templates mode="list" select="self::list"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_definitionlist" select="self::definitionlist"></xsl:apply-templates>
			<xsl:apply-templates mode="caption" select="self::caption[.!='' or count(child::node())>0]"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_link_object_map_swf" select="self::link_object_map_swf"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_link_content" select="self::link_content"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_link_object_wuc" select="self::link_object_wuc"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_link_object_external" select="self::link_object_external"></xsl:apply-templates>
			<xsl:apply-templates mode="subgroup" select="self::subgroup"></xsl:apply-templates>
			<xsl:apply-templates mode="column4_columncont_container_match_dotnetcontrol" select="self::dotnetcontrol"></xsl:apply-templates>
			<xsl:apply-templates mode="banner" select="self::banner"></xsl:apply-templates>
			<xsl:apply-templates mode="box" select="self::box"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="link_object_binary_image" mode="column4_columncont_container_match_link_object_binary_image">
		<xsl:apply-templates select="." mode="link_object_binary_image"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="definitionlist" mode="column4_columncont_container_match_definitionlist">
		<xsl:apply-templates select="." mode="definitionlist"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_map_swf" mode="column4_columncont_container_match_link_object_map_swf">
		<xsl:apply-templates mode="region_link_object_map_swf" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_content" mode="column4_columncont_container_match_link_content">
		<xsl:apply-templates mode="region_link_content" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_wuc" mode="column4_columncont_container_match_link_object_wuc">
		<xsl:apply-templates mode="region_link_object_wuc" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="link_object_external" mode="column4_columncont_container_match_link_object_external">
		<xsl:apply-templates mode="region_link_object_external" select="."></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="dotnetcontrol" mode="column4_columncont_container_match_dotnetcontrol">
		<xsl:apply-templates select="." mode="dotnetcontrol_manual"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$nodeName!='' and $XlinkId!=''">
				<xsl:choose>
					<xsl:when test="$nodeName='documenttitle'">
						<xsl:apply-templates mode="documenttitle" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image_partner'">
						<xsl:apply-templates mode="link_object_binary_image_partner" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='frame'">
						<xsl:apply-templates mode="frame" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='framemenu'">
						<xsl:apply-templates mode="framemenu" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column1'">
						<xsl:apply-templates mode="column1" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column1'">
						<xsl:apply-templates mode="column1" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='topicallead'">
						<xsl:apply-templates mode="topicallead" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='topicallead'">
						<xsl:apply-templates mode="topicallead" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_language'">
						<xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='bold'">
						<xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='italic'">
						<xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='bold'">
						<xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='italic'">
						<xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='super'">
						<xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='super'">
						<xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='sub'">
						<xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='sub'">
						<xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='header'">
						<xsl:apply-templates mode="header" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='header'">
						<xsl:apply-templates mode="header" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_language'">
						<xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='super'">
						<xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='sub'">
						<xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition_short'">
						<xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definition'">
						<xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definition'">
						<xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition_short'">
						<xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='paragraph'">
						<xsl:apply-templates mode="paragraph" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='paragraph'">
						<xsl:apply-templates mode="paragraph" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_language'">
						<xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='bold'">
						<xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='italic'">
						<xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='super'">
						<xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='sub'">
						<xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_reference'">
						<xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='reference'">
						<xsl:apply-templates mode="reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='reference'">
						<xsl:apply-templates mode="reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_reference'">
						<xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition_short'">
						<xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition'">
						<xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definition'">
						<xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definition'">
						<xsl:apply-templates mode="definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition'">
						<xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_class'">
						<xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_class'">
						<xsl:apply-templates mode="object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_class'">
						<xsl:apply-templates mode="object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_icon'">
						<xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_class'">
						<xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_document'">
						<xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_document'">
						<xsl:apply-templates mode="object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_document'">
						<xsl:apply-templates mode="object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_icon'">
						<xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_document'">
						<xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map'">
						<xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_map'">
						<xsl:apply-templates mode="object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_map'">
						<xsl:apply-templates mode="object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_icon'">
						<xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map'">
						<xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_url'">
						<xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_url'">
						<xsl:apply-templates mode="object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_url'">
						<xsl:apply-templates mode="object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_icon'">
						<xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_url'">
						<xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_code_file'">
						<xsl:apply-templates mode="link_code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='code_file'">
						<xsl:apply-templates mode="code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='code_file'">
						<xsl:apply-templates mode="code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_icon'">
						<xsl:apply-templates mode="link_object_binary_icon" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_code_file'">
						<xsl:apply-templates mode="link_code_file" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_pdf'">
						<xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_binary'">
						<xsl:apply-templates mode="object_binary" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_binary'">
						<xsl:apply-templates mode="object_binary" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_pdf'">
						<xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datatable'">
						<xsl:apply-templates mode="datatable" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datatable'">
						<xsl:apply-templates mode="datatable" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datarow'">
						<xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datarow'">
						<xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datacell'">
						<xsl:apply-templates mode="datacell" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datacell'">
						<xsl:apply-templates mode="datacell" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='list'">
						<xsl:apply-templates mode="list" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datarow'">
						<xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datarow'">
						<xsl:apply-templates mode="datarow" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definitionlist'">
						<xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='caption'">
						<xsl:apply-templates mode="caption" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='caption'">
						<xsl:apply-templates mode="caption" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='bold'">
						<xsl:apply-templates mode="bold" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_language'">
						<xsl:apply-templates mode="link_language" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='super'">
						<xsl:apply-templates mode="super" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='sub'">
						<xsl:apply-templates mode="sub" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_reference'">
						<xsl:apply-templates mode="link_reference" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition_short'">
						<xsl:apply-templates mode="link_definition_short" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_definition'">
						<xsl:apply-templates mode="link_definition" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_class'">
						<xsl:apply-templates mode="link_object_class" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_document'">
						<xsl:apply-templates mode="link_object_document" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map'">
						<xsl:apply-templates mode="link_object_map" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_url'">
						<xsl:apply-templates mode="link_object_url" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_pdf'">
						<xsl:apply-templates mode="link_object_binary_pdf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='italic'">
						<xsl:apply-templates mode="italic" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map_swf'">
						<xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map_swf'">
						<xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='content'">
						<xsl:apply-templates mode="content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='content'">
						<xsl:apply-templates mode="content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_wuc'">
						<xsl:apply-templates mode="object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_wuc'">
						<xsl:apply-templates mode="object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_external'">
						<xsl:apply-templates mode="object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='object_external'">
						<xsl:apply-templates mode="object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='subgroup'">
						<xsl:apply-templates mode="subgroup" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='subgroup'">
						<xsl:apply-templates mode="subgroup" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='datatable'">
						<xsl:apply-templates mode="datatable" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map_swf'">
						<xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='dotnetcontrol'">
						<xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='banner'">
						<xsl:apply-templates mode="banner" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='box'">
						<xsl:apply-templates mode="box" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column2'">
						<xsl:apply-templates mode="column2" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column2'">
						<xsl:apply-templates mode="column2" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definitionlist'">
						<xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map_swf'">
						<xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='dotnetcontrol'">
						<xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column3'">
						<xsl:apply-templates mode="column3" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column3'">
						<xsl:apply-templates mode="column3" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definitionlist'">
						<xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map_swf'">
						<xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='dotnetcontrol'">
						<xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column4'">
						<xsl:apply-templates mode="column4" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='column4'">
						<xsl:apply-templates mode="column4" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_binary_image'">
						<xsl:apply-templates mode="link_object_binary_image" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='definitionlist'">
						<xsl:apply-templates mode="definitionlist" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_map_swf'">
						<xsl:apply-templates mode="link_object_map_swf" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_content'">
						<xsl:apply-templates mode="link_content" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_wuc'">
						<xsl:apply-templates mode="link_object_wuc" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='link_object_external'">
						<xsl:apply-templates mode="link_object_external" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
					<xsl:when test="$nodeName='dotnetcontrol'">
						<xsl:apply-templates mode="dotnetcontrol" select="//*[@XlinkId=$XlinkId]"></xsl:apply-templates>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="@IsAdded='True'">
						<ins>
							<span class="addeditem">
								<xsl:if test="count(/kompasdocument/documentheader/child::node())>0">
									<div class="textDocumentHeader">
										<xsl:apply-templates mode="documentheadercontainer" select="/kompasdocument/documentheader"></xsl:apply-templates>
									</div>
								</xsl:if>
								<div class="textDocumentBody">
									<xsl:apply-templates mode="body" select="/kompasdocument/body"></xsl:apply-templates>
								</div>
							</span>
						</ins>
					</xsl:when>
					<xsl:when test="@IsDeleted='True'">
						<del>
							<span class="deleteditem">
								<xsl:if test="count(/kompasdocument/documentheader/child::node())>0">
									<div class="textDocumentHeader">
										<xsl:apply-templates mode="documentheadercontainer" select="/kompasdocument/documentheader"></xsl:apply-templates>
									</div>
								</xsl:if>
								<div class="textDocumentBody">
									<xsl:apply-templates mode="body" select="/kompasdocument/body"></xsl:apply-templates>
								</div>
							</span>
						</del>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="count(/kompasdocument/documentheader/child::node())>0">
							<div class="textDocumentHeader">
								<xsl:apply-templates mode="documentheadercontainer" select="/kompasdocument/documentheader"></xsl:apply-templates>
							</div>
						</xsl:if>
						<div class="textDocumentBody">
							<xsl:apply-templates mode="body" select="/kompasdocument/body"></xsl:apply-templates>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>