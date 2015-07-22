<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <data>
            <xsl:apply-templates select="//tei:correspDesc[@type='sommaire']"/>
        </data>
    </xsl:template>
    <xsl:template match="//tei:correspDesc[@type='sommaire']">
        <xsl:for-each select=".">
            <xsl:element name="event">
                <xsl:attribute name="start" select="tei:correspAction[@type='sent']/tei:date/@from | tei:correspAction[@type='sent']/tei:date/@when"/>                                                                                                                       
                <xsl:if test="tei:date[@to]">
                    <xsl:attribute name="end" select="tei:correspAction[@type='sent']/tei:date/@to"/>
                </xsl:if>                
                <xsl:variable name="place" select="tei:correspAction[@type='sent']/tei:placeName"/>                               
                <xsl:attribute name="title" select="$place"/>                
                <xsl:variable name="nombre" select="count(tei:correspContext/tei:ref)"/>                
                <xsl:text>&lt;ul class="test"&gt;</xsl:text>
                    <xsl:text>&lt;li&gt;</xsl:text>
                        <xsl:text>Destinataire : </xsl:text>                                                       
                        <xsl:value-of select="tei:correspAction[@type='received']/tei:persName"/>                
                    <xsl:text>&lt;/li&gt;</xsl:text>
                    <xsl:text>&lt;li&gt;</xsl:text>
                        <xsl:text>Nombre de cartes envoyées : </xsl:text>
                        <xsl:value-of select="$nombre"/>
                        <xsl:text>&lt;ul&gt;</xsl:text>
                            <xsl:for-each select="tei:correspContext/tei:ref">                        
                                <xsl:variable name="target">
                                    <xsl:value-of select="replace(@target,'xml','html')"></xsl:value-of>
                                </xsl:variable>
                                <xsl:text>&lt;li&gt;</xsl:text>
                                <xsl:text>&lt;a href="</xsl:text><xsl:value-of select="$target"/><xsl:text>"&gt;</xsl:text>
                                <xsl:value-of select="tei:date"/>
                                <xsl:text>&lt;/a&gt;</xsl:text>
                                <xsl:text>&lt;/li&gt;</xsl:text>
                            </xsl:for-each>
                        <xsl:text>&lt;/ul&gt;</xsl:text>
                    <xsl:text>&lt;/li&gt;</xsl:text>                
                <xsl:text>&lt;/ul&gt;</xsl:text>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>