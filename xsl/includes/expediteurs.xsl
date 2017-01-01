<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="//tei:teiCorpus" mode="expediteurs">
        <xsl:result-document encoding="UTF-8" href="thematiques.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$headerSlide"/>
                    <div class="row">
                        <div class="large-12 columns">
                            <h1>Accès thématique</h1>
                            <p>L'accès thématique regroupe les lettres au regard de leur expéditeur et suivant les thèmes abordés au sein de chacune d'elles.</p>
<!--                            <p>La correspondance est ici classée par expéditeur. 43 lettres ont été traitées jusqu'à présent. Seule une lettre n'est pas de la main d'Armand Horel, elle a été écrite par son frère Louis. Les lettres sont ensuite classées chronologiquement et les envois non datés sont regroupés en fin de liste.</p>-->
                            <h2>Expéditeurs</h2>
                            <ul class="menu vertical" data-accordion-menu="true">
                                <xsl:for-each-group select="tei:TEI" group-by="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy']/@ref">
                                    <li>
                                        <xsl:variable name="numLetter" select="count(//tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy'][@ref=current-grouping-key()])"/>
                                        <a class="entree" href="#"><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy'][@ref=current-grouping-key()]"/> : <xsl:value-of select="$numLetter"/> lettre<xsl:if test="$numLetter &gt; 1"><xsl:text>s</xsl:text></xsl:if> envoyée<xsl:if test="$numLetter &gt; 1"><xsl:text>s</xsl:text></xsl:if><xsl:text> </xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="$numLetter &gt; 1"><xsl:text>entre </xsl:text><xsl:for-each select="current-group()[descendant::tei:correspAction/tei:date/@when]"><xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@when"/><xsl:if test="position() = 1"><xsl:value-of select=".//tei:correspAction/tei:date"/></xsl:if><xsl:if test="position() = last()"><xsl:text> et </xsl:text><xsl:value-of select=".//tei:correspAction/tei:date"/></xsl:if></xsl:for-each></xsl:when>
                                                <xsl:otherwise><xsl:value-of select="current-group()//tei:correspAction/tei:date"/></xsl:otherwise>
                                            </xsl:choose>
                                        </a>
                                        <ul class="no-bullet content">
                                            <xsl:for-each select="current-group()">
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@notBefore"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@when"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[not(@notBefore)]"/>
                                                <xsl:variable name="href" select="@xml:id"/>
                                                <li><a href="{$href}.html">à <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date"/></a></li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                </xsl:for-each-group>
                            </ul>
                        </div>
                        <div class="large-12 columns">
                            <h2>Thèmes</h2>
                            <ul class="menu vertical" data-accordion-menu="true">
                                <xsl:for-each select="//tei:interp">
                                    <xsl:sort select="."/>
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <li>
                                        <a class="entree" href="#"><xsl:value-of select="concat(upper-case(substring(.,1,1)),substring(., 2),' '[not(last())])"/></a>
                                        <ul class="no-bullet content">
                                            <xsl:for-each select="//tei:TEI[descendant::tei:div[@type='letter'][@ana]]">
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@notBefore"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@when"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[not(@notBefore)]"/>
                                                <xsl:variable name="ana" select=".//tei:div[@type='letter']/@ana"/>
                                                <xsl:variable name="href" select="@xml:id"/>
                                                <xsl:if test="contains($ana, $id)">
                                                    <li><a href="{$href}.html"><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy']"/> à <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date"/></a></li>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                    <xsl:copy-of select="$js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>