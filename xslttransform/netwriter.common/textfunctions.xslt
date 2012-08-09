<!-- Templates voor tekstmanipulaties -->
<xsl:stylesheet version="1.0"  exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes">
	<!-- <summary>Replace functie om vervelende karakters uit javascript te vervangen. Vervangt enkele quotes en dubbele quotes voor een escaped enkele quote.</summary>-->
	<!-- <author>Ramazan Lale </author>-->
	<!-- <param type='xml_text' name='ReplaceStringIn' summary='Tekst die vevangen dient te worden.'>Tekst die vevangen dient te worden.</param>-->
	<xsl:template name="replaceString">
		<xsl:param name="ReplaceStringIn" />
		<xsl:variable name="findChar"><xsl:text>'</xsl:text></xsl:variable>
		<xsl:variable name="findChar2"><xsl:text>"</xsl:text></xsl:variable>
		<xsl:variable name="replaceChar"><xsl:text>\'</xsl:text></xsl:variable>
		<xsl:variable name="myString"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$ReplaceStringIn" />
				<xsl:with-param name="charsIn" select="$findChar" />
				<xsl:with-param name="charsOut" select="$replaceChar" />
			</xsl:call-template></xsl:variable>
		<xsl:variable name="myString2"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$myString" />
				<xsl:with-param name="charsIn" select="$findChar2" />
				<xsl:with-param name="charsOut" select="$replaceChar" />
			</xsl:call-template></xsl:variable><xsl:value-of select="$myString2" />
	</xsl:template>
	<!-- <summary>Replace functie om een karakter in een string te vervangen door een ander.</summary>-->
	<!-- <param type='xml_text' name='stringIn' summary='Tekst die vevangen dient te worden.'>Tekst die vevangen dient te worden.</param>-->
	<!-- <param type='xml_text' name='charsIn' summary='Tekst waar naar gezocht wordt (Kniptekst).'>Tekst waar naar gezocht wordt (Kniptekst).</param>-->
	<!-- <param type='xml_text' name='charsOut' summary='Vervang ofwel plaktekst.'>Vervang ofwel plaktekst.</param>-->
	<xsl:template name="replaceCharsInString">
		<xsl:param name="stringIn" />
		<xsl:param name="charsIn" />
		<xsl:param name="charsOut" />
		<xsl:choose>
			<xsl:when test="contains($stringIn,$charsIn)">
				<xsl:value-of select="concat(substring-before($stringIn,$charsIn),$charsOut)" />
				<xsl:call-template name="replaceCharsInString">
					<xsl:with-param name="stringIn" select="substring-after($stringIn,$charsIn)" />
					<xsl:with-param name="charsIn" select="$charsIn" />
					<xsl:with-param name="charsOut" select="$charsOut" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$stringIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		<!-- Template om smerige html hacks uit de database te filteren, bv voor attribuut literatuurverwijzingen-->
	<xsl:template name="replace_html_chars">
		<xsl:param name="ReplaceStringIn" />
		<xsl:variable name="myString1"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$ReplaceStringIn" />
				<xsl:with-param name="charsIn" select="'&amp;lt;'" />
				<xsl:with-param name="charsOut" select="'&#60;'" />
			</xsl:call-template></xsl:variable>
			<xsl:variable name="myString2"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$myString1" />
				<xsl:with-param name="charsIn" select="'&amp;gt;'" />
				<xsl:with-param name="charsOut" select="'&#62;'" />
			</xsl:call-template></xsl:variable>
		<xsl:variable name="myString3"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$myString2" />
				<xsl:with-param name="charsIn" select="'&amp;#92;'" />
				<xsl:with-param name="charsOut" select="'&#92;'" />
			</xsl:call-template></xsl:variable>
		<xsl:value-of select="$myString3"/>
	</xsl:template>
	<!-- <summary>Functie om de substring van een tekst terug te geven na de laatste keer dat er een bepaald karakter voorkomt. Handig voor bewerken van filepaden.</summary>-->
	<!-- <param type='xml_text' name='string' summary='Tekst die doorzocht moet worden.'>Tekst die doorzocht moet worden.</param>-->
	<!-- <param type='xml_text' name='delimiter' summary='Scheidingsteken, tekst na laatste voorkomen van dit teken in de string wordt teruggegeven.'>Scheidingsteken, tekst na laatste voorkomen van dit teken in de string wordt teruggegeven.</param>-->
	<xsl:template name="substring-after-last">
		<xsl:param name="string" />
		<xsl:param name="delimiter" />
		<xsl:choose>
			<xsl:when test="contains($string, $delimiter)">
				<xsl:call-template name="substring-after-last">
					<xsl:with-param name="string" select="substring-after($string, $delimiter)" />
					<xsl:with-param name="delimiter" select="$delimiter" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- <summary>Functie om de substring van een tekst terug te geven voor de laatste keer dat er een bepaald karakter voorkomt. Handig voor bewerken van filepaden.</summary>-->
	<!-- <param type='xml_text' name='string' summary='Tekst die doorzocht moet worden.'>Tekst die doorzocht moet worden.</param>-->
	<!-- <param type='xml_text' name='delimiter' summary='Scheidingsteken, tekst voor laatste voorkomen van dit teken in de string wordt teruggegeven.'>Scheidingsteken, tekst voor laatste voorkomen van dit teken in de string wordt teruggegeven.</param>-->
	<xsl:template name="substring-before-last">
		<xsl:param name="string" />
		<xsl:param name="delimiter" />
		<xsl:if test="$delimiter and contains($string, $delimiter)">
			<xsl:variable name="temp" select="substring-after($string, $delimiter)" />
			<xsl:value-of select="substring-before($string, $delimiter)" />
			<xsl:if test="contains($temp, $delimiter)">
				<xsl:value-of select="$delimiter" />
				<xsl:call-template name="substring-before-last">
					<xsl:with-param name="string" select="$temp" />
					<xsl:with-param name="delimiter" select="$delimiter" />
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- algemeen template om urls webrichtlijnen compliant te maken, zorgt er voor dat & vervangen wordt in &amp en verwijderd overbodige default.aspx files -->
	<!-- idem aan vorige functie, maar nu als output xml-->
	<xsl:template name="clean_url_webrichtlijnen_output_xml">
		<xsl:param name="url" />
		<xsl:param name="url_slash">
			<xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$url" />
				<xsl:with-param name="charsIn" select="'\'" />
				<xsl:with-param name="charsOut" select="'/'" />
			</xsl:call-template>
		</xsl:param>
		<xsl:param name="valide_url_default">
			<xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$url_slash" />
				<xsl:with-param name="charsIn" select="'/default.aspx'" />
				<xsl:with-param name="charsOut" select="'/'" />
			</xsl:call-template>
		</xsl:param>
		<xsl:value-of select="$valide_url_default" />
	</xsl:template>
	<!-- algemeen template om attributen xhtml compliant te maken, zorgt er voor dat & vervangen wordt in &amp en verwijderd overbodige default.aspx files -->
	<xsl:template name="clean_attribute_webrichtlijnen">
		<xsl:param name="attribute" />
		<xsl:param name="attribute_new">
			<xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$attribute" />
				<xsl:with-param name="charsIn" select="'&amp;'" />
				<xsl:with-param name="charsOut" select="'&amp;amp;'" />
			</xsl:call-template>
		</xsl:param>
		<xsl:param name="attribute_new_2">
			<xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$attribute_new" />
				<xsl:with-param name="charsIn" >"</xsl:with-param>
				<xsl:with-param name="charsOut" select="''" />
			</xsl:call-template>
		</xsl:param>
		<xsl:value-of select="$attribute_new_2" />
	</xsl:template>
	<!-- <summary>Replace functie om vervelende karakters uit references te vervangen. Vervangt dubbele punten, zorgt voor spaties achter : en ; etc etc.
       LET OP: volgens Jan niets aan de layout van deze template veranderen!</summary>-->
	<!-- <author>Jan de Bruin</author>-->
	<!-- <param type='xml_text' name='my_reference_input' summary='Tekst die vervangen dient te worden.'>Tekst die vevangen dient te worden.</param>-->
	<!-- <param type='xml_text' name='encode_output' summary='Geeft aan of de output encoded moet worden.'>Geeft aan of de output encoded moet worden.</param>-->
	<xsl:template name="Interpunctie"><xsl:param name="my_text_input"/><xsl:param name="encode_output">no</xsl:param><xsl:variable name="my_text">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text_input" />
				<xsl:with-param name="charsIn" select="':'" />
				<xsl:with-param name="charsOut" select="': '" />
			</xsl:call-template></xsl:variable>
			<xsl:variable name="my_text1"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text" />
				<xsl:with-param name="charsIn" select="';'" />
				<xsl:with-param name="charsOut" select="'; '" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text2">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text1" />
				<xsl:with-param name="charsIn" select="'  '" />
				<xsl:with-param name="charsOut" select="' '" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text3">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text2" />
				<xsl:with-param name="charsIn" select="'  '" />
				<xsl:with-param name="charsOut" select="' '" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text4">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text3" />
				<xsl:with-param name="charsIn" select="' .'" />
				<xsl:with-param name="charsOut" select="'.'" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text5">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text4" />
				<xsl:with-param name="charsIn" select="'..'" />
				<xsl:with-param name="charsOut" select="'.'" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text6">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text5" />
				<xsl:with-param name="charsIn" select="' ,'" />
				<xsl:with-param name="charsOut" select="','" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text7">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text6" />
				<xsl:with-param name="charsIn" select="' :'" />
				<xsl:with-param name="charsOut" select="':'" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text8">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text7" />
				<xsl:with-param name="charsIn" select="' ;'" />
				<xsl:with-param name="charsOut" select="';'" />
			</xsl:call-template></xsl:variable><xsl:variable name="my_text9">
       <xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$my_text8" />
				<xsl:with-param name="charsIn" select="'&#10;'" />
				<xsl:with-param name="charsOut" select="''" />
			</xsl:call-template></xsl:variable><xsl:choose><xsl:when test="$encode_output='no'"><xsl:value-of select="$my_text9"/></xsl:when>
				<xsl:otherwise><xsl:call-template name="encodeOutPut"><xsl:with-param name="ReplaceStringIn" select="$my_text9"/></xsl:call-template></xsl:otherwise></xsl:choose>
		</xsl:template>
	<!-- <summary>Replace functie om vervelende karakters uit javascript te vervangen. Vervangt enkele quotes en dubbele quotes voor een escaped enkele quote.</summary>-->
	<!-- <author>Ramazan Lale </author>-->
	<!-- <param type='xml_text' name='ReplaceStringIn' summary='Tekst die vevangen dient te worden.'>Tekst die vevangen dient te worden.</param>-->
	<xsl:template name="encodeOutPut">
		<xsl:param name="ReplaceStringIn" />
		<xsl:variable name="findChar"><xsl:text>&amp;</xsl:text></xsl:variable>
		<xsl:variable name="replaceChar"><xsl:text>&amp;amp;</xsl:text></xsl:variable>
		<xsl:variable name="findChar2"><xsl:text>&lt;</xsl:text></xsl:variable>
		<xsl:variable name="replaceChar2"><xsl:text>&amp;lt;</xsl:text></xsl:variable>
		<xsl:variable name="findChar3"><xsl:text>&gt;</xsl:text></xsl:variable>
		<xsl:variable name="replaceChar3"><xsl:text>&amp;gt;</xsl:text></xsl:variable>
		<xsl:variable name="myString"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$ReplaceStringIn" />
				<xsl:with-param name="charsIn" select="$findChar" />
				<xsl:with-param name="charsOut" select="$replaceChar" />
			</xsl:call-template></xsl:variable>
		<xsl:variable name="myString2"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$myString" />
				<xsl:with-param name="charsIn" select="$findChar2" />
				<xsl:with-param name="charsOut" select="$replaceChar2" />
			</xsl:call-template></xsl:variable>
			<xsl:variable name="myString3"><xsl:call-template name="replaceCharsInString">
				<xsl:with-param name="stringIn" select="$myString2" />
				<xsl:with-param name="charsIn" select="$findChar3" />
				<xsl:with-param name="charsOut" select="$replaceChar3" />
			</xsl:call-template></xsl:variable><xsl:value-of select="$myString3" />
	</xsl:template>
</xsl:stylesheet>
