<xsl:stylesheet version="1.0" exclude-result-prefixes="asp ucidb" xmlns:ucidb="http://www.piet.nl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asp="urn:schemas-microsoft-com:datatypes"><xsl:template match="reference" mode="referencewriter"><xsl:choose><xsl:when test="@IsAdded='True'"><ins><span class="addeditem"><xsl:variable name="href">#reference_<xsl:value-of select="@reference_id"></xsl:value-of></xsl:variable><xsl:variable name="spatie"><xsl:text></xsl:text></xsl:variable><xsl:variable name="punt"><xsl:if test="reference_type_id !='2'"><xsl:text>.</xsl:text></xsl:if></xsl:variable><xsl:variable name="myreference_title"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_title"></xsl:with-param></xsl:call-template></xsl:variable><xsl:variable name="title"><xsl:choose><xsl:when test="@reference_type_id ='2'"><xsl:variable name="myReference"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myReference"></xsl:with-param></xsl:call-template><xsl:text></xsl:text></xsl:when><xsl:otherwise><xsl:variable name="myreference_authors"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_authors"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_authors"></xsl:with-param></xsl:call-template><xsl:text></xsl:text></xsl:otherwise></xsl:choose><xsl:value-of select="$myreference_title"></xsl:value-of><xsl:choose><xsl:when test="@reference_info !=''"><xsl:variable name="myreference_info"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_info"></xsl:with-param></xsl:call-template></xsl:variable><xsl:value-of select="$spatie"></xsl:value-of><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_info"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_year !=''"><xsl:variable name="myreference_year"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_year"></xsl:with-param></xsl:call-template></xsl:variable><xsl:value-of select="$spatie"></xsl:value-of><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_year"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_code !=''"><xsl:variable name="myreference_code"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_code"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_code"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_volume !=''"><xsl:variable name="myreference_volume"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_volume"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_volume"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:value-of select="$punt"></xsl:value-of></xsl:variable><xsl:variable name="reference_label"><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="@reference"></xsl:with-param><xsl:with-param name="encode_output">no</xsl:with-param></xsl:call-template><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="@reference_code"></xsl:with-param><xsl:with-param name="encode_output">no</xsl:with-param></xsl:call-template></xsl:variable><a class="nw_uo_popup textReference" href="{$href}"><xsl:attribute name="title"><xsl:call-template name="replace_html_chars"><xsl:with-param name="ReplaceStringIn"><xsl:value-of select="$title"></xsl:value-of></xsl:with-param></xsl:call-template></xsl:attribute><cite><xsl:value-of select="$reference_label"></xsl:value-of></cite></a></span></ins></xsl:when><xsl:when test="@IsDeleted='True'"><del><span class="deleteditem"><xsl:variable name="href">#reference_<xsl:value-of select="@reference_id"></xsl:value-of></xsl:variable><xsl:variable name="spatie"><xsl:text></xsl:text></xsl:variable><xsl:variable name="punt"><xsl:if test="reference_type_id !='2'"><xsl:text>.</xsl:text></xsl:if></xsl:variable><xsl:variable name="myreference_title"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_title"></xsl:with-param></xsl:call-template></xsl:variable><xsl:variable name="title"><xsl:choose><xsl:when test="@reference_type_id ='2'"><xsl:variable name="myReference"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myReference"></xsl:with-param></xsl:call-template><xsl:text></xsl:text></xsl:when><xsl:otherwise><xsl:variable name="myreference_authors"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_authors"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_authors"></xsl:with-param></xsl:call-template><xsl:text></xsl:text></xsl:otherwise></xsl:choose><xsl:value-of select="$myreference_title"></xsl:value-of><xsl:choose><xsl:when test="@reference_info !=''"><xsl:variable name="myreference_info"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_info"></xsl:with-param></xsl:call-template></xsl:variable><xsl:value-of select="$spatie"></xsl:value-of><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_info"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_year !=''"><xsl:variable name="myreference_year"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_year"></xsl:with-param></xsl:call-template></xsl:variable><xsl:value-of select="$spatie"></xsl:value-of><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_year"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_code !=''"><xsl:variable name="myreference_code"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_code"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_code"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_volume !=''"><xsl:variable name="myreference_volume"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_volume"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_volume"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:value-of select="$punt"></xsl:value-of></xsl:variable><xsl:variable name="reference_label"><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="@reference"></xsl:with-param><xsl:with-param name="encode_output">no</xsl:with-param></xsl:call-template><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="@reference_code"></xsl:with-param><xsl:with-param name="encode_output">no</xsl:with-param></xsl:call-template></xsl:variable><a class="nw_uo_popup textReference" href="{$href}"><xsl:attribute name="title"><xsl:call-template name="replace_html_chars"><xsl:with-param name="ReplaceStringIn"><xsl:value-of select="$title"></xsl:value-of></xsl:with-param></xsl:call-template></xsl:attribute><cite><xsl:value-of select="$reference_label"></xsl:value-of></cite></a></span></del></xsl:when><xsl:otherwise><xsl:variable name="href">#reference_<xsl:value-of select="@reference_id"></xsl:value-of></xsl:variable><xsl:variable name="spatie"><xsl:text></xsl:text></xsl:variable><xsl:variable name="punt"><xsl:if test="reference_type_id !='2'"><xsl:text>.</xsl:text></xsl:if></xsl:variable><xsl:variable name="myreference_title"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_title"></xsl:with-param></xsl:call-template></xsl:variable><xsl:variable name="title"><xsl:choose><xsl:when test="@reference_type_id ='2'"><xsl:variable name="myReference"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myReference"></xsl:with-param></xsl:call-template><xsl:text></xsl:text></xsl:when><xsl:otherwise><xsl:variable name="myreference_authors"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_authors"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_authors"></xsl:with-param></xsl:call-template><xsl:text></xsl:text></xsl:otherwise></xsl:choose><xsl:value-of select="$myreference_title"></xsl:value-of><xsl:choose><xsl:when test="@reference_info !=''"><xsl:variable name="myreference_info"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_info"></xsl:with-param></xsl:call-template></xsl:variable><xsl:value-of select="$spatie"></xsl:value-of><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_info"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_year !=''"><xsl:variable name="myreference_year"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_year"></xsl:with-param></xsl:call-template></xsl:variable><xsl:value-of select="$spatie"></xsl:value-of><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_year"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_code !=''"><xsl:variable name="myreference_code"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_code"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_code"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:choose><xsl:when test="@reference_volume !=''"><xsl:variable name="myreference_volume"><xsl:call-template name="replaceString"><xsl:with-param name="ReplaceStringIn" select="@reference_volume"></xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="$myreference_volume"></xsl:with-param></xsl:call-template></xsl:when></xsl:choose><xsl:value-of select="$punt"></xsl:value-of></xsl:variable><xsl:variable name="reference_label"><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="@reference"></xsl:with-param><xsl:with-param name="encode_output">no</xsl:with-param></xsl:call-template><xsl:call-template name="Interpunctie"><xsl:with-param name="my_text_input" select="@reference_code"></xsl:with-param><xsl:with-param name="encode_output">no</xsl:with-param></xsl:call-template></xsl:variable><a class="nw_uo_popup textReference" href="{$href}"><xsl:attribute name="title"><xsl:call-template name="replace_html_chars"><xsl:with-param name="ReplaceStringIn"><xsl:value-of select="$title"></xsl:value-of></xsl:with-param></xsl:call-template></xsl:attribute><cite><xsl:value-of select="$reference_label"></xsl:value-of></cite></a></xsl:otherwise></xsl:choose></xsl:template>
</xsl:stylesheet>