<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="//tei:TEI">
        <xsl:result-document format="html" encoding="UTF-8" href="{@xml:id}.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$headerSlide"/>
                    <div class="row">
                        <div class="large-12">
                            <!-- liens suivant et précédent -->
                            <xsl:apply-templates select=".//tei:correspContext"/>
                            <!-- métadonnées (penser à la class métadonnée pour le <p> -->
                            <xsl:apply-templates select=".//tei:correspAction"/>
                            <div class="large-6 medium-6 column"><xsl:apply-templates select=".//tei:div[@type='letter']/@ana"/></div>
                            <!--<hr/>-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-12">
                            <ul class="tabs" data-tabs="true" id="example-tabs">
                                <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Transcription</a></li>
                                <xsl:if test=".//tei:div[@type='enveloppe'] | .//tei:address[descendant::tei:persName[@type='addressee']]"><li class="tabs-title"><a href="#panel2">Adresses</a></li></xsl:if>
                                <li class="tabs-title"><a href="#panel3">Métadonnées</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row tabs-content" data-tabs-content="example-tabs">
                        <div class="tabs-panel is-active" id="panel1">
                            <div class="medium-12 large-8 columns">
                                <!-- TODO adresse -->
                                <xsl:apply-templates select=".//tei:div[@type='letter']"/>
                                <xsl:if test="not(.//tei:signed)">
                                    <p class="text-right">
                                        <i>(non signé)</i>
                                    </p>
                                </xsl:if>
                            </div>
                            <div class="medium-12 large-4 columns">
                                <div class="orbit" role="region" aria-label="cartes postales" data-orbit="true">
                                    <header>Cliquez sur les images pour consulter l'intégralité du fonds numérisé.</header>
                                    <ul class="orbit-container">
                                        <button class="orbit-previous"><!--<span class="show-for-sr">Previous Slide</span>-->&#9664;&#xFE0E;</button>
                                        <button class="orbit-next"><!--<span class="show-for-sr">Next Slide</span>-->&#9654;&#xFE0E;</button>
                                        <xsl:apply-templates select=".//tei:pb[@facs]" mode="affichage"/>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <xsl:if test=".//tei:div[@type='enveloppe'] | .//tei:address[descendant::tei:persName[@type='addressee']]">
                            <div class="tabs-panel" id="panel2">
                                <xsl:choose>
                                    <xsl:when test=".//tei:div[@type='enveloppe']">
                                        <xsl:apply-templates select=".//tei:div[@type='enveloppe']" mode="address"/>
                                    </xsl:when>
                                    <xsl:when test=".//tei:address[descendant::tei:persName[@type='addressee']] and not(.//tei:address[descendant::tei:persName[@type='sender']])">
                                        <div class="large-4"><xsl:apply-templates select="(.//tei:address[descendant::tei:persName[@type='addressee']])[1]" mode="address"/></div>
                                    </xsl:when>
                                    <xsl:when test=".//tei:address[descendant::tei:persName[@type='addressee']] | .//tei:address[descendant::tei:persName[@type='sender']]">
                                        <div class="row">
                                            <div class="large-4 column"><xsl:apply-templates select="(.//tei:address[descendant::tei:persName[@type='addressee']])[1]" mode="address"/></div>
                                            <div class="large-4 column"><xsl:apply-templates select="(.//tei:address[descendant::tei:persName[@type='sender']])[1]" mode="address"/></div>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                            </div>
                        </xsl:if>
                        <div class="tabs-panel" id="panel3">
                            <div class="large-4 columns">
                                <ul class="no-bullet">
                                    <li class="head">Contexte :</li>
                                    <li><span class="bold"><xsl:text>expéditeur : </xsl:text></span><xsl:value-of select=".//tei:correspAction/tei:persName[@type='sentBy']"/></li>
                                    <li><span class="bold"><xsl:text>destinataire : </xsl:text></span><xsl:value-of select=".//tei:correspAction/tei:persName[@type='deliveredTo']"/></li>
                                    <li><span class="bold"><xsl:text>lieu : </xsl:text></span><xsl:value-of select=".//tei:correspAction/tei:placeName"/></li>
                                    <li><span class="bold"><xsl:text>date : </xsl:text></span><xsl:value-of select=".//tei:correspAction/tei:date"/></li>
                                    <xsl:if test=".//tei:supportDesc//tei:stamp[@type='postmark' and @subtype='departure']/tei:date/@when"><li><span class="bold"><xsl:text>date d'envoi : </xsl:text></span><xsl:value-of select=".//tei:supportDesc//tei:stamp[@type='postmark']/tei:placeName"/><xsl:text> </xsl:text><xsl:value-of select="format-date(.//tei:supportDesc//tei:stamp[@type='postmark' and @subtype='departure']/tei:date/@when,'le [D01] [Mn] [Y0001]', 'fr', (), ())"/></li></xsl:if>
                                    <xsl:if test=".//tei:supportDesc//tei:stamp[@type='postmark' and @subtype='arrival']/tei:date/@when"><li><span class="bold"><xsl:text>date d'arrivée : </xsl:text></span><xsl:value-of select=".//tei:supportDesc//tei:stamp[@type='postmark']/tei:placeName"/><xsl:text> </xsl:text><xsl:value-of select="format-date(.//tei:supportDesc//tei:stamp[@type='postmark' and @subtype='arrival']/tei:date/@when,'le [D01] [Mn] [Y0001]', 'fr', (), ())"/></li></xsl:if>
                                </ul>
                            </div>
                            <div class="large-4 columns">
                                <ul class="no-bullet">
                                    <li class="head">Lettre précédente :</li>
                                    <li><span class="bold"><xsl:text>expéditeur : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='previous']/tei:persName[@type='sentBy']"/></li>
                                    <li><span class="bold"><xsl:text>destinataire : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='previous']/tei:persName[@type='deliveredTo']"/></li>
                                    <li><span class="bold"><xsl:text>lieu : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='previous']/tei:placeName"/></li>
                                    <li><span class="bold"><xsl:text>date : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='previous']/tei:date"/></li>
                                </ul>
                            </div>
                            <div class="large-4 columns">
                                <ul class="no-bullet">
                                    <li class="head">Lettre suivante :</li>
                                    <li><span class="bold"><xsl:text>expéditeur : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='next']/tei:persName[@type='sentBy']"/></li>
                                    <li><span class="bold"><xsl:text>destinataire : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='next']/tei:persName[@type='deliveredTo']"/></li>
                                    <li><span class="bold"><xsl:text>lieu : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='next']/tei:placeName"/></li>
                                    <li><span class="bold"><xsl:text>date : </xsl:text></span><xsl:value-of select=".//tei:correspContext/tei:ref[@type='next']/tei:date"/></li>
                                </ul>
                            </div>
                            <div class="large-4 columns">
                                <ul class="no-bullet">
                                    <li class="head">Données matérielles :</li>
                                    <li><span class="bold"><xsl:text>composition : </xsl:text></span><xsl:value-of select=".//tei:supportDesc/tei:p"/></li>
                                </ul>
                            </div>
                            <div class="large-4 columns">
                                <ul class="no-bullet">
                                    <li class="head">Conservation :</li>
                                    <li><span class="bold"><xsl:text>lieu de conservation : </xsl:text></span><xsl:value-of select=".//tei:settlement"/><xsl:text>, </xsl:text><xsl:value-of select=".//tei:repository"/></li>
                                    <li><span class="bold"><xsl:text>cote : </xsl:text></span><xsl:value-of select=".//tei:idno"/></li>
                                    <li><span class="bold"><xsl:text>origine : </xsl:text></span><xsl:value-of select=".//tei:history"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <xsl:if test=".//tei:div[@type='note']">
                        <xsl:apply-templates select=".//tei:div[@type='note']"/>
                    </xsl:if>
                    <xsl:copy-of select="$footer"/>
                    <xsl:copy-of select="$js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:correspContext">
        <xsl:choose>
            <xsl:when test="tei:ref[@type='previous'] and tei:ref[@type='next']">
                <div class="large-6 medium-6 columns"><a href="{substring-after(tei:ref[@type='previous']/@target,'#')}.html">lettre précédente</a></div>
                <div class="large-6 medium-6 text-right columns" ><a href="{substring-after(tei:ref[@type='next']/@target,'#')}.html">lettre suivante</a></div>
            </xsl:when>
            <xsl:when test="tei:ref[@type='previous'] or tei:ref[@type='next']">
                <div class="large-6">
                    <xsl:if test="tei:ref[@type='next']"><xsl:attribute name="class"><xsl:text>large-6 text-right large-offset-6</xsl:text></xsl:attribute></xsl:if>
                    <a href="{substring-after(tei:ref/@target,'#')}.html">
                        <xsl:text>lettre </xsl:text>
                        <xsl:choose>
                            <xsl:when test="tei:ref[@type='next']"><xsl:text>suivante</xsl:text></xsl:when>
                            <xsl:otherwise><xsl:text>précédente</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </a>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:correspAction">
        <div class="large-6 medium-6 column"><em><xsl:value-of select="tei:persName[@type='sentBy']"/><xsl:text> à </xsl:text><xsl:value-of select="tei:persName[@type='deliveredTo']"/></em></div>
        <div class="large-6 medium-6 column"><em class="float-right"><xsl:value-of select="tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:date"/></em></div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']/@ana">
        <em>
            <span class="smallcaps"><xsl:text>Objets : </xsl:text></span>
            <xsl:variable name="ana" select="."/>
            <xsl:choose>
                <xsl:when test="substring-before(.,' ')">
                    <xsl:for-each select="tokenize(.,' ')">
                        <xsl:variable name="anaTokenized" select="substring-after(.,'#')"/>
                        <!-- RMQ appel de la variable route pour retrouver un nœud que la fonction tokenize() fait perdre. -->
                        <xsl:value-of select="$root//tei:interp[@xml:id=$anaTokenized]"/>
                        <xsl:choose>
                            <xsl:when test="position() != last()"><xsl:text>, </xsl:text></xsl:when>
                            <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="ana" select="substring-after($ana,'#')"/>
                    <xsl:value-of select="//tei:interp[@xml:id=$ana]"/><xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </em>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:opener">
        <p class="text-right"><xsl:apply-templates select="tei:dateline"/></p>
        <p class="text-center"><xsl:apply-templates select="tei:salute"/></p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:closer/tei:salute">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:signed">
        <xsl:choose>
            <xsl:when test="tei:address">
                <p class="text-right"><xsl:apply-templates select="tei:address/tei:persName"/></p>
                <p class="text-left"><xsl:apply-templates select="tei:address/tei:addrLine"/></p>
            </xsl:when>
            <xsl:when test="tei:add">
                <p class="text-right"><xsl:apply-templates select="tei:add/tei:persName"/></p>
                <xsl:if test="tei:add/tei:address"><p class="text-left"><xsl:apply-templates select="tei:add/tei:address/tei:addrLine"/></p></xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <p class="text-right"><xsl:apply-templates/></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- RMQ si ajout d'une tab pour l'affichage philologique => TODO décommenter cette partie pour afficher les informations au survol. -->
    <!--<xsl:template match="tei:add[not(@hand)]">
        <span class="has-tip add" data-tooltip="true" aria-haspopup="true" data-disable-hover="false" tabindex="1" title="{@place} {@rend}"><xsl:apply-templates/></span>
    </xsl:template>-->
    
    <xsl:template match="tei:div[@type='letter']//tei:forename">
        <xsl:variable name="upfirst"><xsl:value-of select="."/></xsl:variable>
        <xsl:value-of select="concat(upper-case(substring($upfirst, 1, 1)), lower-case(substring($upfirst, 2)))"/>
    </xsl:template>
    <xsl:template match="tei:div[@type='letter']//tei:surname">
        <xsl:variable name="up"><xsl:value-of select="."/></xsl:variable>
        <xsl:value-of select="upper-case($up)"/>
    </xsl:template>
    
    <xsl:template match="tei:postscript[position()=1]">
        <p><xsl:text>[PS :] </xsl:text><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:postscript[position()!=1]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:expan | tei:corr | tei:reg"/>
    </xsl:template>
    
    <!--<xsl:template match="tei:pb[@facs]">
        <xsl:for-each select=".">
            <xsl:variable name="facs" select="substring-after(@facs,'#')"/>
            <xsl:variable name="position"><xsl:number select="." from="tei:div[@type='letter']"/></xsl:variable>
            <xsl:choose>
                <xsl:when test="$position gt '1' and //tei:graphic[@xml:id=$facs]/tei:desc"><hr width="25%" align="center"/><!-\- TODO faire avec @ type postcardBreak -\-></xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>-->
    
    <xsl:template match="tei:pb[@facs]" mode="affichage">
        <xsl:variable name="facs" select="substring-after(@facs,'#')"/>
        <xsl:variable name="url" select="//tei:graphic[@xml:id=$facs]/@url"/>
        <xsl:variable name="source"><xsl:value-of select=" substring-before($url,' ')"/></xsl:variable>
        <xsl:variable name="lien"><xsl:value-of select=" substring-after($url,' ')"/></xsl:variable>
        <xsl:for-each select=".">
            <li class="orbit-slide">
                <a href="{$lien}"><img src="{$source}" alt="image"/></a>
                <xsl:if test="//tei:graphic[@xml:id=$facs]/tei:desc">
                    <figcaption class="orbit-caption"><xsl:value-of select="//tei:graphic[@xml:id=$facs]/tei:desc"/></figcaption>
                </xsl:if>
            </li>
        </xsl:for-each>  
    </xsl:template>
    
    <xsl:template match="tei:person" mode="tooltip">
        <xsl:for-each select="tei:persName">
            <xsl:choose>
                <xsl:when test="tei:persName | tei:surname | tei:forename | tei:roleName">
                    <xsl:apply-templates select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:choose>
            <xsl:when test="tei:birth | tei:death">
                <xsl:choose>
                    <xsl:when test="tei:birth and tei:death">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates select="tei:birth"/><xsl:text>-</xsl:text><xsl:apply-templates select="tei:death"/>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:when test="tei:birth and not(tei:death)">
                        <xsl:text> (&#10033;&#160;</xsl:text><xsl:apply-templates select="tei:birth"/><xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:when test="tei:death and not(tei:birth)">
                        <xsl:text> (&#x2020;&#160;</xsl:text><xsl:apply-templates select="tei:death"/><xsl:text>)</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="tei:state">
            <xsl:text> — </xsl:text><xsl:apply-templates select="tei:state"/>
        </xsl:if>
        <xsl:if test="tei:persName[@ref]">
            <xsl:variable name="href" select="tei:persName/@ref"/>
            <xsl:variable name="renvoi">
                <xsl:variable name="id" select="substring-after($href,'#')"/>
                <xsl:apply-templates select="//tei:person[@xml:id=$id]/tei:persName"/>
                <!--<xsl:value-of select="//tei:person[@xml:id=$id]/tei:persName"/>-->
            </xsl:variable>
            <a href="{$href}"><xsl:value-of select="$renvoi"/></a>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:place" mode="tooltip">
        <xsl:for-each select=".">
            <xsl:for-each select="tei:placeName">
                <xsl:choose>
                    <xsl:when test="position() != last()">
                        <xsl:apply-templates select="."/><xsl:text>, </xsl:text>
                    </xsl:when>
                    <xsl:otherwise><xsl:apply-templates select="."/></xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="tei:location">
                    <xsl:text>, </xsl:text>
                    <xsl:for-each select="tei:location/tei:country | tei:location/tei:district">
                        <xsl:choose>
                            <xsl:when test="position() != last()">
                                <xsl:apply-templates select="."/><xsl:text>, </xsl:text>
                            </xsl:when>
                            <xsl:otherwise><xsl:apply-templates select="."/><xsl:text>.</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:placeName[@type='today']">
        <xsl:text>auj. </xsl:text><xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:item[ancestor::tei:div[@type='index']]" mode="tooltip">
        <xsl:for-each select=".">
            <xsl:for-each select="tei:label">
                <xsl:choose>
                    <xsl:when test="@type='navire'">
                        <xsl:text>« </xsl:text><xsl:apply-templates select="tei:name"/><xsl:text> » </xsl:text>
                        <xsl:text>(</xsl:text><xsl:apply-templates select="tei:addName"/><xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:otherwise><xsl:apply-templates select="tei:name"/></xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="tei:desc"><xsl:text>, </xsl:text><xsl:apply-templates select="tei:desc"/><xsl:text>.</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter' or @type='note']//tei:persName | tei:div[@type='letter' or @type='note']//tei:rs[@type='person']">
        <xsl:variable name="ref" select="@ref"/>
        <xsl:variable name="id" select="substring-after(@ref,'#')"/>
        <xsl:variable name="tooltip">
            <xsl:if test="//tei:div[@type='index']//tei:person[@xml:id=$id]">
                <xsl:apply-templates select="//tei:div[@type='index']//tei:person[@xml:id=$id]" mode="tooltip"/>
                <!--<xsl:value-of select="//tei:div[@type='index']//tei:person[@xml:id=$id]/tei:persName"/>-->
            </xsl:if>
        </xsl:variable>
        <a data-tooltip="true" aria-haspopup="true" title="{$tooltip}" class="has-tip" href="index_edition.html{$ref}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter' or @type='note']//tei:placeName">
        <xsl:variable name="ref" select="@ref"/>
        <xsl:variable name="id" select="substring-after(@ref,'#')"/>
        <xsl:variable name="tooltip">
            <xsl:if test="//tei:div[@type='index']//tei:place[@xml:id=$id]">
                <xsl:apply-templates select="//tei:div[@type='index']//tei:place[@xml:id=$id]" mode="tooltip"/>
            </xsl:if>
        </xsl:variable>
        <a data-tooltip="true" aria-haspopup="true" title="{$tooltip}" class="has-tip" href="index_edition.html{$ref}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter' or @type='note']//tei:name">
        <xsl:variable name="ref" select="@ref"/>
        <xsl:variable name="id" select="substring-after(@ref,'#')"/>
        <xsl:variable name="tooltip">
            <xsl:if test="//tei:div[@type='index']//tei:item[@xml:id=$id]">
                <xsl:apply-templates select="//tei:div[@type='index']//tei:item[@xml:id=$id]" mode="tooltip"/>
            </xsl:if>
        </xsl:variable>
        <a data-tooltip="true" aria-haspopup="true" title="{$tooltip}" class="has-tip" href="index_edition.html{$ref}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="tei:persName[ancestor::tei:person] | tei:surname[ancestor::tei:person] | tei:forename[ancestor::tei:person]">
        <xsl:choose>
            <xsl:when test="
                following-sibling::tei:roleName[1] |
                following-sibling::tei:forename[1] |
                following-sibling::tei:surname[1] |
                following-sibling::tei:addName[1] | 
                following-sibling::tei:persName[1]">
                <xsl:apply-templates/><xsl:text>, </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:roleName[ancestor::tei:person]">
        <xsl:choose>
            <xsl:when test="
                following-sibling::tei:forename[1] |
                following-sibling::tei:addName[1] |
                following-sibling::tei:persName[1]">
                <xsl:apply-templates/><xsl:text>, </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/><xsl:if test="ancestor::tei:persName[@ref]"><xsl:text>, voir</xsl:text></xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:birth | tei:death">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:apply-templates select="@when"/>
            </xsl:when>
            <xsl:when test="@notBefore and @notAfter">
                <xsl:variable name="notBefore" select="@notBefore"/>
                <xsl:variable name="notAfter" select="substring(@notAfter,3)"/>
                <xsl:value-of select="concat($notBefore,'/',$notAfter)"/>
            </xsl:when>
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='note']">
        <xsl:for-each select="./tei:note">
            <xsl:variable name="id" select="@xml:id"/>
            <xsl:variable name="n" select="@n"/>
            <div class="reveal" id="{$id}" data-reveal="true">
                <div class="headNote"><p>Note : <xsl:value-of select="$n"/></p></div>
                <div class="note">
                    <p><xsl:apply-templates select="."/><xsl:if test="tei:bibl"><xsl:text> voir :</xsl:text></xsl:if></p>
                    <p>
                        <xsl:if test="tei:bibl">
                            <xsl:variable name="id" select="replace(tei:bibl/@corresp,'#','')"/>
                            <xsl:apply-templates select="//tei:listBibl[@xml:id='bibl']/tei:bibl[@xml:id=$id]"/>
                            <xsl:choose>
                                <xsl:when test="tei:bibl[@n]"><xsl:text>, p. </xsl:text><xsl:value-of select="tei:bibl/@n"/><xsl:text>.</xsl:text></xsl:when>
                                <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:ref[@type='note']">
        <xsl:variable name="ref" select="@target"/>
        <xsl:variable name="id" select="substring-after($ref,'#')"/>
        <xsl:variable name="n" select="//tei:note[@xml:id=$id]/@n"/>
        <sup><a class="zreveal" data-open="{$id}"><xsl:value-of select="$n"/></a></sup>
    </xsl:template>
    
    <xsl:template match="//tei:listBibl//tei:bibl">
        <xsl:choose>
            <xsl:when test="@type='monographie'">
                <xsl:if test="tei:author">
                    <xsl:apply-templates select="tei:author/tei:forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:author/tei:surname"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@type]">
                        <i>
                            <xsl:apply-templates select="tei:title[@type='title']"/>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates select="tei:title[@type='subtitle']"/>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i><xsl:apply-templates select="tei:title"/></i>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="tei:placeName">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="tei:placeName"/>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:date/@when"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@type='article'">
                <xsl:if test="tei:author">
                    <xsl:apply-templates select="tei:author/tei:forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:author/tei:surname"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@type]">
                        <i>
                            <xsl:text>« </xsl:text><xsl:apply-templates select="tei:title[@type='title']"/>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates select="tei:title[@type='subtitle']"/><xsl:text> »</xsl:text>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i><xsl:text>« </xsl:text><xsl:apply-templates select="tei:title"/><xsl:text> »</xsl:text></i>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="tei:editor">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="tei:editor"/>
                    <xsl:if test="tei:editor[@n]">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:editor/@n"/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:date/@when"/>
                </xsl:if>
                <xsl:if test="tei:link">
                    <xsl:text>, </xsl:text>
                    <xsl:variable name="link" select="tei:link/@target"/>
                    <a href="{$link}">URL</a>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@type='dossier'">
                <xsl:if test="tei:author">
                    <xsl:apply-templates select="tei:author/tei:forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:author/tei:surname"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@type]">
                        <i>
                            <xsl:text>« </xsl:text><xsl:apply-templates select="tei:title[@type='title']"/>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates select="tei:title[@type='subtitle']"/><xsl:text> »</xsl:text>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i><xsl:text>« </xsl:text><xsl:apply-templates select="tei:title"/><xsl:text> »</xsl:text></i>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="tei:editor">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="tei:editor"/>
                    <xsl:if test="tei:editor[@n]">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:editor/@n"/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:date/@when"/>
                </xsl:if>
                <xsl:if test="tei:link">
                    <xsl:text>, </xsl:text>
                    <xsl:variable name="link" select="tei:link/@target"/>
                    <a href="{$link}">URL</a>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:title"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:address[descendant::tei:persName[@type='addressee']][ancestor::tei:div[@type='letter']]"/>
    <xsl:template match="tei:address[descendant::tei:persName[@type='sender']][ancestor::tei:div[@type='letter']]"/>
    
    <xsl:template match="tei:div[@type='enveloppe']" mode="address">
        <div class="large-4 column"><xsl:apply-templates select=".//tei:address[descendant::tei:persName[@type='addressee']]" mode="address"/></div>
        <div class="large-4 column"><xsl:apply-templates select=".//tei:address[ancestor::tei:add]" mode="address"/></div>
        <div class="large-4 column"><xsl:apply-templates select=".//tei:address[descendant::tei:persName[@type='sender']]" mode="address"/></div>
        <div class="large-4 column"><xsl:apply-templates select=".//tei:stamp"/></div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']//tei:address | tei:div[@type='letter']//tei:address" mode="address">
        <xsl:for-each select=".">
            <ul class="no-bullet">
                <li class="head">
                    <xsl:choose>
                        <xsl:when test="./tei:persName[@type='addressee']">Destinataire :</xsl:when>
                        <xsl:when test="./tei:persName[@type='sender']">Expéditeur :</xsl:when>
                        <xsl:when test="ancestor::tei:add">D'une autre main :</xsl:when>
                    </xsl:choose>
                </li>
                <!--<xsl:text> </xsl:text>-->
                <xsl:for-each select="tei:addrLine | tei:persName">
                    <li>
                        <xsl:choose>
                            <xsl:when test="position() != last()"><xsl:apply-templates select="."/><xsl:text>,</xsl:text></xsl:when>
                            <xsl:otherwise><xsl:apply-templates select="."/></xsl:otherwise>
                        </xsl:choose>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']//tei:stamp">
        <ul class="no-bullet">
            <li class="head">
                <xsl:choose>
                    <xsl:when test="@type='armee'">Cachet militaire :</xsl:when>
                    <xsl:when test="@type='postmark'">Cachet postal :</xsl:when>
                    <xsl:otherwise>Cachet :</xsl:otherwise>
                </xsl:choose>
            </li>
            <li><xsl:apply-templates/></li>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='missing'">
                <p>[...]</p>
            </xsl:when>
            <xsl:when test="@reason='illegible'">
                <xsl:choose>
                    <xsl:when test="../../tei:date">
                        <i>Date illisible</i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>Illisible</i>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:surplus"/>
    
</xsl:stylesheet>