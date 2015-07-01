<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <data>
            <xsl:apply-templates select="//tei:correspDesc[@type='sommaire']/tei:correspAction[@type='sent']"></xsl:apply-templates>
        </data>
    </xsl:template>
    
    <xsl:template match="//tei:correspDesc[@type='sommaire']/tei:correspAction[@type='sent']">
        <xsl:for-each select="tei:date">            
            <xsl:element name="event">
                <xsl:attribute name="start" select="@from | @when"/>                                                                                                                       
                <xsl:if test="@to">
                    <xsl:attribute name="end" select="@to"/>
                </xsl:if>
                <xsl:variable name="placeName" select="../tei:placeName/@ref"/>
                <xsl:variable name="place" select="../tei:placeName"/>
                <xsl:variable name="date" select="@from | @when"/>                
                <xsl:attribute name="title" select=" concat($place,' ',$date)"/>
                <xsl:attribute name="link" select="concat('chronologie.html',$placeName,$date)"/>               
            </xsl:element>                            
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>