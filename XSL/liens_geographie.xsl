<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">                
        <xsl:apply-templates select="//tei:correspDesc[@type='sommaire']"/>        
    </xsl:template>
    
    <xsl:template match="//tei:correspDesc[@type='sommaire']">
        <xsl:for-each select="tei:correspContext">
            <div>                                            
                <h3><xsl:value-of select="tei:ref[1]/tei:placeName"/></h3>
                <hr/>                                                    
                <xsl:variable name="nombre" select="count(tei:ref)"/>                            
                <ul>                    
                    <li>                                 
                        <xsl:text>Nombre de cartes envoyées : </xsl:text> <xsl:value-of select="$nombre"/>
                        <ul>                                                                                       
                            <xsl:for-each select="tei:ref">
                                <xsl:sort select=" tei:date/@cert" order="ascending" data-type="text"/>
                                <xsl:sort select="replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                                <li>
                                    <xsl:variable name="target">
                                        <xsl:value-of select="replace(@target,'xml','html')"/>
                                    </xsl:variable>
                                    <a href='{$target}'>
                                        <xsl:value-of select="tei:date"/>
                                        <xsl:text> : </xsl:text>
                                        <xsl:value-of select="tei:persName[@type='sentBy']"/>
                                        <xsl:text> à </xsl:text>
                                        <xsl:value-of select="tei:persName[@type='deliveredTo']"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>                                
                    </li>                            
                </ul>                                                                                                                                   
            </div>                
        </xsl:for-each>
    </xsl:template>            
</xsl:stylesheet>