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
        <xsl:for-each select="tei:correspAction/tei:date">            
            <xsl:variable name="id" select="concat('#',@xml:id)"/>
            <xsl:element name="event">
                <xsl:attribute name="start" select="@from | @when"/>
                <xsl:if test="@to">
                    <xsl:attribute name="end" select="@to"/>
                </xsl:if>
                <xsl:variable name="place" select="../tei:placeName"/>
                <xsl:attribute name="title" select="$place"/>                
                <xsl:variable name="nombre" select="count(../../tei:correspContext/tei:ref[@corresp=$id])"/>
                <xsl:text>&lt;ul class="infobulle"&gt;</xsl:text>
                <!--<xsl:text>&lt;li&gt;</xsl:text>
                <xsl:text>Destinataire : </xsl:text>                                                       
                <xsl:value-of select="../tei:persName[@type='deliveredTo']"/>                
                <xsl:text>&lt;/li&gt;</xsl:text>-->
                <xsl:text>&lt;li&gt;</xsl:text>
                <xsl:text>Nombre de cartes envoyées : </xsl:text>
                <xsl:value-of select="$nombre"/>
                <xsl:text>&lt;ul&gt;</xsl:text>
                <xsl:for-each select="../../tei:correspContext/tei:ref[@corresp=$id]">
                    <xsl:sort select=" tei:date/@cert" order="ascending" data-type="text"/>
                    <xsl:sort select="replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                    <xsl:variable name="target">
                        <xsl:value-of select="replace(@target,'xml','html')"/>                        
                    </xsl:variable>
                    <xsl:text>&lt;li&gt;</xsl:text>
                    <xsl:text>&lt;a href="</xsl:text><xsl:value-of select="$target"/><xsl:text>"&gt;</xsl:text>
                    <xsl:value-of select="tei:date"/>
                    <xsl:text> : </xsl:text>
                    <xsl:value-of select="tei:persName[@type='sentBy']"/>
                    <xsl:text> à </xsl:text>
                    <xsl:value-of select="tei:persName[@type='deliveredTo']"/>
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