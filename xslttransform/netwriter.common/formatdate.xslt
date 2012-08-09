<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<!-- <summary>Functie om de datum weer te geven naar nederlands of engels formaat afhankelijk van het language_id.</summary>-->
	<!-- <author>Wilbert Corts 14-09-2006</author> -->
	<!-- <param type='xml_text' name='datestring' summary='Te formateren datum.'>Te formateren datum.</param>-->
	<!-- <param type='xml_text' name='display_day' summary='True, dag weergeven, andere waarde, dag niet weergeven</param>-->
	<xsl:template name="formatdate">
		<xsl:param name="datestring" />
			<xsl:param name="display_day">true</xsl:param>
		
		<xsl:choose>
					<xsl:when test="$datestring !=''">
				<!--vul de variable returndate.-->
				<xsl:variable name="returndate">
					<xsl:choose>
						<xsl:when test="/rsistructurenode/currentstructurenode/root/@language_id='1'">
							  <xsl:call-template name="formatdate_nl"><xsl:with-param name="datestring2" select="$datestring" /><xsl:with-param name="display_day" select="$display_day"></xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="/rsistructurenode/currentstructurenode/root/@language_id='2'">
								<xsl:call-template name="formatdate_en"><xsl:with-param name="datestring2" select="$datestring" /><xsl:with-param name="display_day" select="$display_day"></xsl:with-param></xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<!-- En retourneer hem. -->
				<xsl:value-of select="$returndate" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	

	<!-- <summary>Deze functie retourneert een nederlandse date.</summary>-->
	<!-- <author>Ramazan Lale</author> -->
	<!-- <param type='xml_text' name='datestring' summary='Te formateren datum.'>Te formateren datum.</param>-->
	<!-- <param type='xml_text' name='display_day' summary='True, dag weergeven, andere waarde, dag niet weergeven</param>-->
	<xsl:template name="formatdate_nl">
		<xsl:param name="datestring2" />
		<xsl:param name="display_day">true</xsl:param>
		
		<xsl:choose>
			<xsl:when test="$datestring2 !=''">
				<xsl:variable name="myyear" select="substring(string($datestring2),1,4)" /><!-- Jaar getal -->
				<xsl:variable name="mymonth" select="substring(string($datestring2),6,2)" /><!-- maand -->
				<xsl:variable name="myday" select="substring(string($datestring2),9,2)" /><!-- dag -->
				<xsl:variable name="mydayString">
					<xsl:call-template name="formatday">
						<xsl:with-param name="day" select="$myday" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="mymonthString">
					<xsl:call-template name="formatmonth_nl">
						<xsl:with-param name="month" select="$mymonth" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="$display_day='true'"><xsl:value-of select="concat($mydayString,' ',$mymonthString,' ',$myyear)" /></xsl:if>
				<xsl:if test="$display_day!='true'"><xsl:value-of select="concat($mymonthString,' ',$myyear)" /></xsl:if>
				
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- <summary>Deze functie retourneert een engelse date.</summary>-->
	<!-- <author>Wilbert Corts 14-09-2006</author> -->
	<!-- <param type='xml_text' name='datestring' summary='Te formateren datum.'>Te formateren datum.</param>-->
	<!-- <param type='xml_text' name='display_day' summary='True, dag weergeven, andere waarde, dag niet weergeven</param>-->
	<xsl:template name="formatdate_en">
		<xsl:param name="datestring2" />
		<xsl:param name="display_day">true</xsl:param>
		<xsl:choose>
			<xsl:when test="$datestring2 !=''">
				<xsl:variable name="myyear" select="substring(string($datestring2),1,4)" /><!-- Jaar getal -->
				<xsl:variable name="mymonth" select="substring(string($datestring2),6,2)" /><!-- maand -->
				<xsl:variable name="myday" select="substring(string($datestring2),9,2)" /><!-- dag -->
				<xsl:variable name="mydayString">
					<xsl:call-template name="formatday">
						<xsl:with-param name="day" select="$myday" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="mymonthString">
					<xsl:call-template name="formatmonth_en">
						<xsl:with-param name="month" select="$mymonth" />
					</xsl:call-template>
				</xsl:variable>
					<xsl:if test="$display_day='true'"><xsl:value-of select="concat($mydayString,' ',$mymonthString,' ',$myyear)" /></xsl:if>
				<xsl:if test="$display_day!='true'"><xsl:value-of select="concat($mymonthString,' ',$myyear)" /></xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- <summary>Functie om de dag weer te geven.</summary>-->
	<!-- <author>Sebina Rosbergen</author> -->
	<!-- <param type='xml_text' name='day' summary='Te formateren dag.'>Te formateren dag.</param>-->
	<xsl:template name="formatday">
		<xsl:param name="day" />
		<xsl:choose>
			<xsl:when test="$day='01' or $day='1'">
				<xsl:value-of select="'1'" />
			</xsl:when>
			<xsl:when test="$day='02' or $day='2'">
				<xsl:value-of select="'2'" />
			</xsl:when>
			<xsl:when test="$day='03' or $day='3'">
				<xsl:value-of select="'3'" />
			</xsl:when>
			<xsl:when test="$day='04' or $day='4'">
				<xsl:value-of select="'4'" />
			</xsl:when>
			<xsl:when test="$day='05' or $day='5'">
				<xsl:value-of select="'5'" />
			</xsl:when>
			<xsl:when test="$day='06' or $day='6'">
				<xsl:value-of select="'6'" />
			</xsl:when>
			<xsl:when test="$day='07' or $day='7'">
				<xsl:value-of select="'7'" />
			</xsl:when>
			<xsl:when test="$day='08' or $day='8'">
				<xsl:value-of select="'8'" />
			</xsl:when>
			<xsl:when test="$day='09' or $day='9'">
				<xsl:value-of select="'9'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$day" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- <summary>Functie om de maand weer te geven naar nederlandse formaat.</summary>-->
	<!-- <author>Ramazan Lale</author> -->
	<!-- <param type='xml_text_number' name='month' summary='Te formateren maand.'>Te formateren maand.</param>-->
	<xsl:template name="formatmonth_nl">
		<xsl:param name="month" />
		<xsl:choose>
			<xsl:when test="$month='01' or $month='1'">
				<xsl:value-of select="'januari'" />
			</xsl:when>
			<xsl:when test="$month='02' or $month='2'">
				<xsl:value-of select="'februari'" />
			</xsl:when>
			<xsl:when test="$month='03' or $month='3'">
				<xsl:value-of select="'maart'" />
			</xsl:when>
			<xsl:when test="$month='04' or $month='4'">
				<xsl:value-of select="'april'" />
			</xsl:when>
			<xsl:when test="$month='05' or $month='5'">
				<xsl:value-of select="'mei'" />
			</xsl:when>
			<xsl:when test="$month='06' or $month='6'">
				<xsl:value-of select="'juni'" />
			</xsl:when>
			<xsl:when test="$month='07' or $month='7'">
				<xsl:value-of select="'juli'" />
			</xsl:when>
			<xsl:when test="$month='08' or $month='8'">
				<xsl:value-of select="'augustus'" />
			</xsl:when>
			<xsl:when test="$month='09' or $month='9'">
				<xsl:value-of select="'september'" />
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:value-of select="'oktober'" />
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:value-of select="'november'" />
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:value-of select="'december'" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- <summary>Functie om de maand weer te geven naar het engelse formaat.</summary>-->
	<!-- <author>Wilbert Corts 14-09-2006</author> -->
	<!-- <param type='xml_text_number' name='month' summary='Te formateren maand.'>Te formateren maand.</param>-->
	<xsl:template name="formatmonth_en">
		<xsl:param name="month" />
		<xsl:choose>
			<xsl:when test="$month='01' or $month='1'">
				<xsl:value-of select="'January'" />
			</xsl:when>
			<xsl:when test="$month='02' or $month='2'">
				<xsl:value-of select="'February'" />
			</xsl:when>
			<xsl:when test="$month='03' or $month='3'">
				<xsl:value-of select="'March'" />
			</xsl:when>
			<xsl:when test="$month='04' or $month='4'">
				<xsl:value-of select="'April'" />
			</xsl:when>
			<xsl:when test="$month='05' or $month='5'">
				<xsl:value-of select="'May'" />
			</xsl:when>
			<xsl:when test="$month='06' or $month='6'">
				<xsl:value-of select="'June'" />
			</xsl:when>
			<xsl:when test="$month='07' or $month='7'">
				<xsl:value-of select="'July'" />
			</xsl:when>
			<xsl:when test="$month='08' or $month='8'">
				<xsl:value-of select="'August'" />
			</xsl:when>
			<xsl:when test="$month='09' or $month='9'">
				<xsl:value-of select="'September'" />
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:value-of select="'October'" />
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:value-of select="'November'" />
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:value-of select="'December'" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet> 