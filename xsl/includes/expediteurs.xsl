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
                            <p>Au sein de cette page la correspondance est classée par expéditeur et chronologiquement. Seule une lettre n'est pas de la main d'Armand Horel, elle a été écrite par son frère Louis.</p>
                            <ul class="menu vertical" data-accordion-menu="true">
                                <xsl:for-each-group select="tei:TEI" group-by="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy']/@ref">
                                    <!--<xsl:for-each select="//tei:correspAction[@type='sent']/tei:persName/@ref=current-grouping-key()">-->
                                    <li>
                                        <a class="entree" href="#"><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy'][@ref=current-grouping-key()][1]"/></a>
                                        <ul class="no-bullet content">
                                            <xsl:for-each select="current-group()">
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@notBefore"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@when"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[not(@notBefore)]"/>
                                                <xsl:variable name="href" select="@xml:id"/>
                                                <li><a href="{$href}.html"><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date"/></a></li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                    <!--</xsl:for-each>-->
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