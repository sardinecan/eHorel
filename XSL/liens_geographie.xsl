<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">                
        <xsl:apply-templates select="//tei:correspDesc"/>        
    </xsl:template>
    
    <xsl:template match="//tei:correspDesc">
        <xsl:choose>
            <xsl:when test="@type='sommaire'"/>
            <xsl:otherwise>
                <xsl:for-each select="tei:correspContext">
                    <div>
                        <xsl:variable name="ref" select="../tei:correspAction/tei:placeName/@ref"/>
                        <xsl:variable name="place" select="../tei:correspAction/tei:placeName"/>                            
                        <h3><xsl:value-of select="$place"/></h3>
                        <hr/>                                                    
                        <xsl:variable name="nombre" select="count(tei:ref)"/>                            
                        <ul>
                            <li>                                    
                                <xsl:text>Destinataire : </xsl:text>                                                       
                                <xsl:value-of select="../tei:correspAction[@type='received']/tei:persName"/>                                                          
                            </li>
                            <li>                                 
                                <xsl:text>Nombre de cartes envoyées : </xsl:text> <xsl:value-of select="$nombre"/>
                                <ul>
                                    <xsl:variable name="ref" select="../tei:correspAction/tei:placeName/@ref"/>
                                    <xsl:variable name="placeName" select="replace($ref,'#','')"/>                                                                                        
                                    <xsl:for-each select="tei:ref">
                                        <li>
                                            <xsl:variable name="target">
                                                <xsl:value-of select="replace(@target,'xml','html')"></xsl:value-of>
                                            </xsl:variable>
                                            <a href='{$target}'><xsl:value-of select="tei:date"/></a>
                                        </li>
                                    </xsl:for-each>
                                </ul>                                
                            </li>                            
                        </ul>                                                                                                                                   
                    </div>                
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>            
</xsl:stylesheet>