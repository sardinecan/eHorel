<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <!-- pour déclaration DOCTYPE html 5 : -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Correspondance d'Armand Horel</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <!--feuilles de style-->  
                <link rel="stylesheet" href="../../STYLE/foundation/css/foundation.css" />
                <link rel="stylesheet" type="text/css" href="../../STYLE/personnalisation/style.css"/>    
                <script src="../../STYLE/foundation/js/vendor/modernizr.js">//</script>
                <!--cartographie-->
                <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
                <script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js">//</script>
                <script src="../../JS/carte/cartographie.js">//</script>
                <script src="../../JS/js/jquery.js">//</script>
            </head>
            <body onload="InitialiserCarte() ;">                                                                                     
                <header class="row">                         
                    <img src="../../STYLE/images/header.jpg" alt="header"/>                                                                                            
                    <nav class="top-bar" data-topbar="yes" role="navigation">                    
                        <ul class="title-area">                        
                            <li class="name"><h1><a href="http://www.bdic.fr/">BDIC</a></h1></li>                            
                            <!-- Menu pour petits écrans -->                                                            
                            <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>                                 
                        </ul>                        
                        <section class="top-bar-section">                        
                            <!-- Partie gauche du menu -->                            
                            <ul class="left">                            
                                <li><a href="../index.html">Accueil</a></li>                                    
                                <li class="has-dropdown">                                
                                    <a href="#">Correspondance d'Armand Horel</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="chronologie.html">Accès chronologique</a></li>                                        
                                        <li><a href="geographie.html">Accès géographique</a></li>                                        
                                    </ul>                                    
                                </li>                                
                            </ul>                            
                            <!-- Partie droite -->                            
                            <ul class="right">                            
                                <li class="has-dropdown">                                
                                    <a href="#">Index et Glossaire</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="#">Personnes</a></li>                                        
                                        <li><a href="#">Lieux</a></li>                                        
                                        <li><a href="#">Glossaire</a></li>                                        
                                    </ul>                                    
                                </li>                                
                                <li><a href="#">A propos de l'édition</a></li>                                    
                            </ul>                              
                        </section>                        
                    </nav>                    
                </header>                                                
                <div class="row" id="corps">                
                    <div class="large-12 columns">                    
                        <h2>Accès géographique</h2>
                        <div id="map"></div>                    
                    </div>                
                </div>                                                                                                                                                                                                                              
                <p>                                                                                   
                    <xsl:apply-templates select="//tei:correspDesc"/>                                    
                </p>                                                                                                                                                                                                                                     
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../../STYLE/foundation/js/vendor/jquery.js">//</script>
                <script src="../../STYLE/foundation/js/foundation.min.js">//</script>
                <script>$(document).foundation();</script>
            </body>        
        </html>    
    </xsl:template>
    
    <xsl:template match="//tei:correspDesc">
        <xsl:for-each select="tei:correspContext">
            <ul>
                <xsl:variable name="ref" select="../tei:correspAction/tei:placeName/@ref"/>
                <xsl:variable name="placeName" select="replace($ref,'#','')"/>
                <xsl:variable name="date" select="../tei:correspAction/tei:date/(@from | @when)"/>
                <xsl:attribute name="id" select="concat($placeName,$date)">                  
                </xsl:attribute>
                <xsl:for-each select="tei:ref">
                    <li>
                        <xsl:element name="a">
                            <xsl:variable name="target">
                                <xsl:value-of select="replace(@target,'xml','html')"></xsl:value-of>
                            </xsl:variable> 
                            <xsl:attribute name="href" select="$target"></xsl:attribute>
                            <xsl:value-of select="tei:placeName"/>                    
                            <xsl:text> </xsl:text>                    
                            <xsl:value-of select="tei:date"/>
                        </xsl:element>                                           
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:for-each>
    </xsl:template>      
</xsl:stylesheet>