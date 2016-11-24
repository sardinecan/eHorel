<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <!--<xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    <xsl:output method="html" indent="yes" omit-xml-declaration="no" encoding="UTF-8" name="html"/>-->
    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8" name="html"/>
    <xsl:output method="text" indent="yes" encoding="UTF-8" name="text"/>
    <xsl:template match="/">
        <!-- pour déclaration DOCTYPE html 5 : -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:copy-of select="$head"/>
            <body>
                <xsl:copy-of select="$header"/>
                <xsl:copy-of select="$headerSlide"/>
                <xsl:apply-templates select="tei:teiCorpus/tei:text/tei:front/tei:div"/>
                <xsl:copy-of select="$footer"/>
                <xsl:copy-of select="$js"/>
            </body>
        </html>
        <!-- Pour fonction result document -->
        <xsl:apply-templates select="//tei:TEI"/>
        <xsl:apply-templates select="//tei:teiCorpus/tei:text/tei:body"/>
        <xsl:apply-templates select="//tei:teiCorpus/tei:text/tei:back"/>
        <xsl:apply-templates select="//tei:teiCorpus" mode="cartographie"/>
        <xsl:apply-templates select="//tei:teiCorpus" mode="chronologie"/>
        <xsl:apply-templates select="//tei:teiCorpus" mode="frise"/>
        <xsl:apply-templates select="//tei:teiCorpus" mode="expediteurs"/>
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus/tei:text/tei:front/tei:div">
        <div class="row border">
            <div class="large-4 columns">
                <h4>Liens annexes : </h4>
                <xsl:for-each select="tei:div[@type='ressourcesExt']/tei:list/tei:item">
                    <ul class="no-bullet">
                        <li>
                            <xsl:apply-templates select="./tei:list/tei:head"/>
                            <ul class="no-bullet">
                                <xsl:for-each select="./tei:list/tei:item">
                                    <li><a href="{./tei:ref/@target}"><xsl:apply-templates select="./tei:ref"/></a></li>
                                </xsl:for-each>
                            </ul>
                        </li>
                    </ul>
                </xsl:for-each>
            </div>
            <div class="large-8 columns"> 
                <h1>Correspondance d'Armand Horel, un marin dans la campagne d'orient.</h1>
                <xsl:for-each select="./tei:div[not(@type)]">
                    <xsl:if test="tei:head">
                        <h2 class="subheader"><xsl:apply-templates select="tei:head"/></h2>
                    </xsl:if>
                    <xsl:for-each select="tei:p">
                        <p><xsl:apply-templates/></p>
                    </xsl:for-each>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    
    <!--<xsl:template match="tei:teiCorpus">
        <xsl:for-each-group select="tei:TEI" group-by="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy']/@ref">
            <!-\-<xsl:for-each select="//tei:correspAction[@type='sent']/tei:persName/@ref=current-grouping-key()">-\->
                <li>
                    <a href="#"><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='sentBy'][@ref=current-grouping-key()][1]"/><xsl:text> à : </xsl:text></a>
                    <ul class="vertical menu larger">
                        <xsl:for-each select="current-group()">
                            <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@notBefore"/>
                            <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@when"/>
                            <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[not(@notBefore)]"/>
                            <xsl:variable name="href" select="@xml:id"/>
                            <li><a href="{$href}.html"><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date"/></a></li>
                        </xsl:for-each>
                    </ul>
                </li>
            <!-\-</xsl:for-each>-\->
        </xsl:for-each-group>
    </xsl:template>-->
    
    <xsl:template match="tei:fw[@type='pageNum']"/>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='super'"><sup><xsl:apply-templates/></sup></xsl:when>
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    
    <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                            INCLUDES
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <xsl:include href="includes/variables.xsl"/>
    
    <xsl:include href="includes/lettres.xsl"/>
    
    <xsl:include href="includes/index.xsl"/>
    
    <xsl:include href="includes/edition.xsl"/>
    
    <xsl:include href="includes/cartographie.xsl"/>
    
    <xsl:include href="includes/chronologie.xsl"/>
    
    <xsl:include href="includes/expediteurs.xsl"/>
    
</xsl:stylesheet>