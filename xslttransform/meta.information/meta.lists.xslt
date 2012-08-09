<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:param name="releaseoutputextension"></xsl:param>
	<xsl:param name="templatemode">indexlijst</xsl:param>
	<xsl:param name="releaseoutputmode"></xsl:param>
    <xsl:param name="object_class_map">'../object_class/'</xsl:param>
    <xsl:param name="trefwoorden_map">'../thesaurus/'</xsl:param>
	<xsl:include href="../netwriter.common/url.xslt"/>
	<xsl:include href="../netwriter.common/textfunctions.xslt"/>
	<xsl:output method="xml" />
	<xsl:template name="cmsurlbase"></xsl:template>
	<xsl:template name="releasesiterootpath"></xsl:template>
	<xsl:template name="outputextention"><xsl:value-of select="$releaseoutputextension"/></xsl:template>
   <xsl:template match="definitioncollection" mode="afkortingendefinities">
	   <xsl:param name="languageid">1</xsl:param>
      <!-- Zowel afkortingen (reference_type_id=1) als definities (reference_type_id=2) moeten getoond worden -->
          <xsl:if test="count(child::definition)>0">
			  <div class="mod box open lighter  nw_foldable begrippen_afkortingen">
				  <h2  class="head small nw_foldable_header"><xsl:if test="$languageid='1'">Begrippen en afkortingen</xsl:if><xsl:if test="$languageid='2'">Terms</xsl:if></h2>
            
              
                
                <!-- De kopregel en inhoud van de lijst in geval van afkortingen:-->
                <xsl:if test="count(child::*[@definition_name!=''])>0">	
                <h3  class="head small"><xsl:if test="$languageid='1'">Afkortingen</xsl:if><xsl:if test="$languageid='2'">Abbreviations</xsl:if></h3>
                  <xsl:apply-templates select="." mode="afkortingen"/>
                </xsl:if>
                <!-- De kopregel en inhoud van de lijst in geval van definities:-->
            
                <xsl:if test="(count(child::definition)-count(child::*[@definition_name!='']))>0">
                  <h3  class="head small"><xsl:if test="$languageid='1'">Definities</xsl:if><xsl:if test="$languageid='2'">Definitions</xsl:if></h3>
                  <xsl:apply-templates select="." mode="definities"/>
                </xsl:if>
            
             </div>
            </xsl:if>
        </xsl:template>
  <xsl:template match="definitioncollection" mode="afkortingen">
      <xsl:if test="count(child::definition[@definition_name!=''])>0"><dl class="nw_definition_list">
            <xsl:apply-templates select="child::*[@definition_name!='']" mode='lijst'>
              <xsl:sort select="@definition_name" />
              <xsl:sort select="@definition_desc" />
            </xsl:apply-templates>
      </dl></xsl:if>
    </xsl:template>
  <xsl:template match="definitioncollection" mode="definities">
        <xsl:if test="(count(child::definition)-count(child::*[@definition_name!='']))>0"><dl class="definition_list">
        <xsl:for-each select="child::*">
            <xsl:sort select="@definition_desc"/>
            <xsl:sort select="@definition_memo"/>
          <xsl:choose>
            <xsl:when test="@definition_name!=''"></xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="." mode='lijst' />
          </xsl:otherwise>
         </xsl:choose>
        </xsl:for-each>
        </dl></xsl:if>
    </xsl:template>
  <!--<xsl:template match="definitioncollection" mode="indexlijst">-->
    <!-- Zowel begrippen (reference_type_id=1) als afkortingen (reference_type_id=2) moeten getoond worden --><!--
    <xsl:if test="count(child::definition)>0">
      --><!-- De link:--><!--
      &lt;div&gt;
        &lt;img alt="begrippen_boekje" src="<xsl:call-template name="imagespath"/>allsites/lit_06.gif" /&gt;
        &lt;span name="deflistvisible" id="deflistvisible" &gt;
          &lt;a href="#" class='indexLiterature'&gt;<xsl:if test="$languageid='1'">Begrippen</xsl:if><xsl:if test="$languageid='2'">Terms</xsl:if>&lt;/a&gt;
        &lt;/span&gt;
        
        &lt;div class="ref_lit_container"&gt;
          --><!-- De header van de lijst:--><!--    
          &lt;span class="ref_lit_bgtop"&gt;&lt;img class="definitie_boekje" src="<xsl:call-template name="imagespath"/>allsites/definition_1.gif" alt="Afbeelding van een definitieboekje" /&gt;&lt;img class="close" src="<xsl:call-template name="imagespath"/>allsites/popup_close.jpg" alt="Popup afsluiten" /&gt;&lt;/span&gt;
          &lt;p class='referenceheader'&gt;<xsl:if test="$languageid='1'">in kop Begrippen</xsl:if><xsl:if test="$languageid='2'">in kop Terms</xsl:if>&lt;/p&gt;
          
          --><!-- De kopregel en inhoud van de lijst in geval van afkortingen:--><!--
          <xsl:if test="count(child::*[@definition_name!=''])>0">	
            &lt;p class='referenceheader'&gt;<xsl:if test="$languageid='1'">Afkortingen</xsl:if><xsl:if test="$languageid='2'">Abbreviations</xsl:if>&lt;/p&gt;
            <xsl:apply-templates select="." mode="afkortingen"/>
          </xsl:if>
          --><!-- De kopregel en inhoud van de lijst in geval van definities:--><!--
          <xsl:if test="count(child::*[@definition_name=''])>0">
            &lt;p class='definitionheader'&gt;<xsl:if test="$languageid='1'">Definities</xsl:if><xsl:if test="$languageid='2'">Definitions</xsl:if>&lt;/p&gt;
            <xsl:apply-templates select="." mode="definities"/>
          </xsl:if>
      
          --><!-- Printversie:--><!--
          &lt;span class="outputModeFooterPrint" &gt;
            <xsl:if test="count(child::*[@definition_name=''])>0">
                &lt;p class='referenceheader'&gt;<xsl:if test="$languageid='1'">Afkortingen</xsl:if><xsl:if test="$languageid='2'">Abbreviations</xsl:if>&lt;/p&gt;
                <xsl:apply-templates select="." mode="afkortingen"/>
              </xsl:if>
              <xsl:if test="count(child::*[@definition_name=''])>0">
                &lt;p class='definitionheader'&gt;<xsl:if test="$languageid='1'">Definities</xsl:if><xsl:if test="$languageid='2'">Definitions</xsl:if>&lt;/p&gt;
                <xsl:apply-templates select="." mode="definities"/>
              </xsl:if>
            &lt;/span&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      </xsl:if>
  </xsl:template>-->
  <xsl:template match="definition" mode="lijst">
    <xsl:choose>
      <xsl:when test="@definition_name!=''">
        <dt id="definition_{@definition_id}"><xsl:value-of select="@definition_name"/></dt>
        <dd ><xsl:value-of select="@definition_desc"/></dd>
		<xsl:if test="@definition_memo!=''"><dd><xsl:value-of select="@definition_memo"/></dd></xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <dt id="definition_{@definition_id}">
          <xsl:value-of select="@definition_desc"/>
        </dt>
        <dd><xsl:value-of select="@definition_memo"/>
        </dd>
      </xsl:otherwise>
    </xsl:choose>
   </xsl:template>

  <xsl:template match="referencecollection" mode="bronnenliteratuur">
	  <xsl:param name="languageid">1</xsl:param>
        <xsl:if test="count(child::reference)>0">
          <!-- De link:-->
         <div class="mod box open lighter  nw_foldable bronnen_literatuur">
            <h2  class="head small nw_foldable_header"><xsl:if test="$languageid='1'">Bronnen en Literatuur</xsl:if><xsl:if test="$languageid='2'">Literature and data sources</xsl:if></h2>
            
			<xsl:if test="count(child::*[@reference_type_id='2'])>0">             
			<h3  class="head small"><xsl:if test="$languageid='1'">Bronnen</xsl:if><xsl:if test="$languageid='2'">Sources</xsl:if></h3>
			                  <xsl:apply-templates select="." mode="bronnen"/></xsl:if>
			  <xsl:if test="count(child::*[@reference_type_id='1'])>0">
            <h3  class="head small"><xsl:if test="$languageid='1'">Literatuur</xsl:if><xsl:if test="$languageid='2'">References</xsl:if></h3>
                  <xsl:apply-templates select="." mode="literatuur"/> </xsl:if>
            
         </div>
        </xsl:if>
  </xsl:template>
 <xsl:template match="referencecollection" mode="bronnen">
  <xsl:if test="count(child::*[@reference_type_id='2'])>0"><ul>
    <xsl:apply-templates select="reference[@reference_type_id='2']" mode='lijst'>
	    <xsl:sort select="@reference"/>
	    <xsl:sort select="@reference_title"/>
    </xsl:apply-templates>
	</ul>
</xsl:if>
  </xsl:template>
  <xsl:template match="referencecollection" mode="literatuur">
  <xsl:if test="count(child::*[@reference_type_id='1'])>0"><ul>
  <xsl:apply-templates select="reference[@reference_type_id='1']" mode='lijst'>
	  <xsl:sort select="@reference_authors" />
	  <xsl:sort select="@reference_year" data-type="number"/>
	  <xsl:sort select="@reference_code"/>
	  <xsl:sort select="@reference_title"/>
  </xsl:apply-templates>
  </ul></xsl:if>
  </xsl:template>
  <!--<xsl:template match="referencecollection" mode="indexlijst">
      <xsl:if test="count(child::*)>0">-->
        <!-- De link:--><!--
        &lt;div&gt;
          &lt;img class="bronnen_boekje" alt="bronnenboekje" src="<xsl:call-template name="imagespath"/>allsites/lit_06.gif" /&gt;
          &lt;span name="reflistvisible" id="reflistvisible" &gt;
            &lt;a href="#" class='indexLiterature'&gt;<xsl:if test="$languageid='1'">Bronnen</xsl:if><xsl:if test="$languageid='2'">Literature and data sources</xsl:if>&lt;/a&gt;
          &lt;/span&gt;
        
          &lt;div class="ref_lit_container"&gt;
            --><!-- De header van de lijst:--><!--    
            &lt;span class="ref_lit_bgtop"&gt;&lt;img class="referentie_boekje" src="<xsl:call-template name="imagespath"/>allsites/reference_1.gif" alt="Afbeelding van een referentieboekje" /&gt;&lt;img class="close" src="<xsl:call-template name="imagespath"/>allsites/popup_close.jpg" alt="Popup afsluiten" /&gt;&lt;/span&gt;
            &lt;p class='referenceheader'&gt;<xsl:if test="$languageid='1'">in kop referentie</xsl:if><xsl:if test="$languageid='2'">in kop reference</xsl:if>&lt;/p&gt;
            --><!-- Zowel literatuur (reference_type_id=1) als bronnen (reference_type_id=2) moeten getoond worden --><!--
        
            <xsl:apply-templates select="." mode="lijst"/>
                                      
          &lt;/div&gt;
        &lt;/div&gt;
      </xsl:if>
  </xsl:template> -->
	<xsl:template match="reference" mode='lijst'>
		<xsl:if test="@reference_type_id='1'">
			<li id="reference_{@reference_id}">
				<span  class="nw_reference_author">
					<xsl:call-template name="Interpunctie">
						<xsl:with-param name="my_text_input" select="@reference_authors"/>
					</xsl:call-template>
				</span>
				<span class="nw_reference_title">
					<!-- Als referentie een URL bevat dan opnemen -->
					<xsl:choose>
						<xsl:when test="object_url/@object_url!=''"><xsl:text> </xsl:text>
							<a href="{object_url/@object_url}">
								<xsl:call-template name="Interpunctie">
									<xsl:with-param name="encode_output">no</xsl:with-param>
									<xsl:with-param name="my_text_input">
										<xsl:value-of select="@reference_title"  disable-output-escaping="yes" />
									</xsl:with-param>
								</xsl:call-template><xsl:text> </xsl:text><xsl:call-template name="Interpunctie">
									<xsl:with-param name="my_text_input" select="@reference_info"/>
								</xsl:call-template><xsl:call-template name="Interpunctie">
									<xsl:with-param name="my_text_input" select="@reference_year"/>
								</xsl:call-template>
								<xsl:call-template name="Interpunctie">
									<xsl:with-param name="my_text_input" select="@reference_code"/>
								</xsl:call-template>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="encode_output">no</xsl:with-param>
								<xsl:with-param name="my_text_input">
									<xsl:value-of select="@reference_title"  disable-output-escaping="yes" />
								</xsl:with-param>
							</xsl:call-template><xsl:text> </xsl:text><xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference_info"/>
							</xsl:call-template><xsl:text> </xsl:text><xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference_year"/>
							</xsl:call-template>
							<xsl:call-template name="Interpunctie">
								<xsl:with-param name="my_text_input" select="@reference_code"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="@reference_volume!=''">
							<span class="nw_reference_volume">
								<xsl:call-template name="Interpunctie">
									<xsl:with-param name="my_text_input" select="@reference_volume"/>
								</xsl:call-template>
							</span>
						</xsl:when>
						<xsl:otherwise>.</xsl:otherwise>
					</xsl:choose>
					<!--</xsl:otherwise></xsl:choose>-->
				</span>
			</li>
		</xsl:if>
		<xsl:if test="@reference_type_id='2'">
			<li id="reference_{@reference_id}">
				<span class ="nw_reference_author">
					<xsl:call-template name="Interpunctie">
						<xsl:with-param name="my_text_input" select="@reference"/>
					</xsl:call-template>.
				</span>
				<span class="nw_reference_title">
						<xsl:choose>
							<xsl:when test="object_url/@object_url!=''">
								<a href="{object_url/@object_url}"><xsl:text> </xsl:text>
									<xsl:call-template name="Interpunctie">
										<xsl:with-param name="encode_output">no</xsl:with-param>
										<xsl:with-param name="my_text_input" >
											<xsl:value-of select="@reference_title"  disable-output-escaping="yes" />
										</xsl:with-param>
									</xsl:call-template>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="Interpunctie">
									<xsl:with-param name="encode_output">no</xsl:with-param>
									<xsl:with-param name="my_text_input" >
										<xsl:value-of select="@reference_title"  disable-output-escaping="yes" />
									</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
				</span>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="personcollection" mode="auteurs">
  <xsl:if test="count(child::*[@person_type='1'])>0"><ul>
  <xsl:apply-templates select="person[@person_type='1']" mode='lijst'>
	  <xsl:sort select="@person_name" />
	  
  </xsl:apply-templates>
  </ul></xsl:if>
  </xsl:template>
	<xsl:template match="personcollection" mode="referenten">
  <xsl:if test="count(child::*[@person_type='2'])>0"><ul>
  <xsl:apply-templates select="person[@person_type='2']" mode='lijst'>
	  <xsl:sort select="@person_name" />
	  
  </xsl:apply-templates>
  </ul></xsl:if>
  </xsl:template>
	<xsl:template match="person" mode='lijst'>
		<li><xsl:value-of select="@person_name" />
		<xsl:if test="@organisation_name!=''"><xsl:text> </xsl:text>(<xsl:value-of select="@organisation_name"/>)
		</xsl:if>
		<xsl:if test="position()!=last()">, </xsl:if></li>
	</xsl:template>
</xsl:stylesheet>
