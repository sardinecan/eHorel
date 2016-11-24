<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="//tei:teiCorpus/tei:text/tei:body">
        <xsl:result-document format="html" encoding="UTF-8" href="index_edition.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$headerSlide"/>
                    <div class="row">
                        <div class="large-12">
                            <xsl:apply-templates select="tei:div[@type='list_index']"/>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                    <xsl:copy-of select="$js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='list_index']">
        <h2 class="subheader">À propos de l'index</h2>
        <xsl:for-each select="./tei:p">
            <p><xsl:value-of select="."/></p>
        </xsl:for-each>
        <xsl:apply-templates select="tei:div[@type='index']"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='index']">
        <ul class="menu vertical" data-accordion-menu="true">
            <xsl:for-each select="tei:list/tei:item | tei:listPerson/tei:person | tei:listPlace/tei:place">
                <xsl:sort select="tei:label | tei:persName | tei:placeName[not(@type='today')]" order="ascending" case-order="upper-first"/>
                <xsl:variable name="id" select="@xml:id"/>
                <xsl:variable name="ref" select="concat('#',$id)"/>
                <xsl:if test="//tei:TEI[descendant::tei:div[@type='letter']][.//@ref=$ref]">
                    <xsl:choose>
                        <xsl:when test="tei:label[@type='navire'] | tei:persName | tei:placeName[not(@type='today')]">
                            <li id="{$id}">
                                <xsl:attribute name="id" select="@xml:id"/>
                                <a href="#" class="entree"><xsl:apply-templates select="." mode="index"/></a>
                                <ul class="index no-bullet content">
                                    <xsl:if test=".//tei:event | .//tei:listEvent">
                                        <li>
                                            <xsl:for-each select=".//tei:event/tei:p">
                                                <xsl:choose>
                                                    <xsl:when test="position() != last()"><xsl:apply-templates select="."/><xsl:text> ; </xsl:text></xsl:when>
                                                    <xsl:otherwise><xsl:apply-templates select="."/></xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </li>
                                    </xsl:if>
                                    <ul class="no-bullet content">
                                        <li>
                                            <xsl:text>Citations : </xsl:text>
                                            <xsl:for-each select="//tei:TEI[descendant::tei:div[@type='letter']][.//@ref=$ref]">
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@notBefore"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date/@when"/>
                                                <xsl:sort select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[not(@notBefore)]"/>
                                                <xsl:choose>
                                                    <xsl:when test="position() != last()">
                                                        <a href="{@xml:id}.html"><xsl:apply-templates select=".//tei:correspAction/tei:persName[@type='sentBy']"/><xsl:text> à </xsl:text><xsl:apply-templates select=".//tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text> </xsl:text><xsl:apply-templates select=".//tei:correspAction/tei:placeName"/><xsl:text> </xsl:text><xsl:apply-templates select=".//tei:correspAction/tei:date"/></a><xsl:text> — </xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise><a href="{@xml:id}.html"><xsl:apply-templates select=".//tei:correspAction/tei:persName[@type='sentBy']"/><xsl:text> à </xsl:text><xsl:apply-templates select=".//tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text> </xsl:text><xsl:apply-templates select=".//tei:correspAction/tei:placeName"/><xsl:text> </xsl:text><xsl:apply-templates select=".//tei:correspAction/tei:date"/></a></xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </li>
                                    </ul>
                                </ul>
                            </li>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:item[ancestor::tei:div[@type='index']]" mode="index">
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
    
    <xsl:template match="tei:place" mode="index">
        <xsl:for-each select=".">
            <span class="placeName">
                <xsl:for-each select="tei:placeName">
                    <xsl:choose>
                        <xsl:when test="position() != last()">
                            <xsl:apply-templates select="."/><xsl:text>, </xsl:text>
                        </xsl:when>
                        <xsl:otherwise><xsl:apply-templates select="."/>
                            <xsl:choose>
                                <xsl:when test="ancestor::tei:place[descendant::tei:location]"><xsl:text>, </xsl:text></xsl:when>
                                <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </span>
            <xsl:choose>
                <xsl:when test="tei:location">
                    <xsl:for-each select="tei:location/tei:country | tei:location/tei:district">
                        <xsl:choose>
                            <xsl:when test="position() != last()">
                                <xsl:apply-templates select="."/><xsl:text>, </xsl:text>
                            </xsl:when>
                            <xsl:otherwise><xsl:apply-templates select="."/><xsl:text>.</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:placeName[@type='today']" mode="index">
        <xsl:text>auj. </xsl:text><i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="tei:person" mode="index">
        <xsl:for-each select="tei:persName">
            <span class="persName">
                <xsl:choose>
                    <xsl:when test="tei:persName | tei:surname | tei:forename | tei:roleName">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </span>
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
            <span class="persName"><xsl:value-of select="$renvoi"/></span>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>