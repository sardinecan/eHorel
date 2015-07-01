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
            </head>
            <body>                                                                                     
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
                                    <a href="glossaire.html">Index et Glossaire</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="glossaire.html#personnes">Personnes</a></li>                                        
                                        <li><a href="glossaire.html#lieux">Lieux</a></li>                                        
                                        <li><a href="glossaire.html#glossaire">Glossaire</a></li>                                        
                                    </ul>                                    
                                </li>                                
                                <li><a href="#">A propos de l'édition</a></li>                                    
                            </ul>                              
                        </section>                        
                    </nav>                    
                </header>                                                
                <div class="row corps">                
                    <div class="large-12 columns">                    
                        <h2>Index et Glossaire</h2>                                         
                    </div>
                    <div class="large-12 columns">                       
                        <xsl:apply-templates select="//tei:list[@xml:id='glossaire']"/>
                    </div>
                </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../../STYLE/foundation/js/vendor/jquery.js">//</script>
                <script src="../../STYLE/foundation/js/foundation.min.js">//</script>
                <script>$(document).foundation();</script>
            </body>        
        </html>    
    </xsl:template>
    <xsl:template match="//tei:list[@xml:id='glossaire']">
        <dl>
            <xsl:for-each select="tei:item">
                <dt>
                    <xsl:attribute name="id" select="@xml:id"/>
                    <xsl:apply-templates select="tei:label"/>
                </dt>
                <dd>
                    <xsl:text>Citations : </xsl:text>
                    <xsl:for-each select="tei:note/tei:ref">
                        <a>
                            <xsl:variable name="lien">
                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                            </xsl:variable>
                            <xsl:attribute name="href" select="$lien"/>
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                </xsl:when>
                                <xsl:when test="position() = last()">
                                    <xsl:text> &#x2014; </xsl:text><xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/><xsl:text>.</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text> &#x2014; </xsl:text><xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </a>                        
                    </xsl:for-each>
                </dd>
            </xsl:for-each>
        </dl>
    </xsl:template>
</xsl:stylesheet>