<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="//tei:teiCorpus" mode="expediteurs">
        <xsl:result-document encoding="UTF-8" href="expediteurs.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$headerSlide"/>
                    <div class="row">
                        <div class="large-12">
                            <h2>Accès par correspondants</h2>
                            <p>La correspondance est ici classée par expéditeur. 43 lettres ont été traitées jusqu'à présent. Seule une lettre n'est pas de la main d'Armand Horel, elle a été écrite par son frère Louis. Les lettres sont ensuite classées chronologiquement et les envois non datés sont regroupés en fin de liste.</p>
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
                    </div>
                    <xsl:copy-of select="$footer"/>
                    <xsl:copy-of select="$js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>