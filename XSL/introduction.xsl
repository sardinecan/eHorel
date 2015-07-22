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
                <link rel="stylesheet" href="../STYLE/foundation/css/foundation.css" />
                <link rel="stylesheet" type="text/css" href="../STYLE/personnalisation/style.css"/>
                <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
                <script src="../STYLE/foundation/js/vendor/modernizr.js">/*Pour transformation xslt*/</script>                               
            </head>
            <body>                                                                                     
                <header class="row border-top">                    
                    <img src="../STYLE/images/logo_bdic.gif" alt="logo_BDIC"/>                                                                                                                                    
                    <nav class="top-bar" data-topbar="yes" role="navigation">                    
                        <ul class="title-area">                        
                            <li class="name"><h1><a href="http://www.bdic.fr/">BDIC</a></h1></li>                            
                            <!-- Menu pour petits écrans -->                                                            
                            <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>                                 
                        </ul>                        
                        <section class="top-bar-section">                        
                            <!-- Partie gauche du menu -->                            
                            <ul class="left">                            
                                <li><a href="index.html">Accueil</a></li>                                    
                                <li class="has-dropdown">                                
                                    <a href="#">Correspondance d'Armand Horel</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="projet/chronologie.html">Accès chronologique</a></li>                                        
                                        <li><a href="projet/geographie.html">Accès géographique</a></li>                                        
                                    </ul>                                    
                                </li>                                
                            </ul>                            
                            <!-- Partie droite -->                            
                            <ul class="right">                            
                                <li class="has-dropdown">                                
                                    <a href="projet/glossaire.html">Index et Glossaire</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="projet/glossaire.html#personnes">Personnes</a></li>                                        
                                        <li><a href="projet/glossaire.html#lieux">Lieux</a></li>                                        
                                        <li><a href="projet/glossaire.html#glossaire">Glossaire</a></li>                                        
                                    </ul>                                    
                                </li>                                
                                <li><a href="#">A propos de l'édition</a></li>                                    
                            </ul>                              
                        </section>                        
                    </nav>                                            
                </header>
                <div class="row">
                    <img src="../STYLE/images/slide_14_18_1.jpg" alt="header"/>
                </div>
                <div class="row border">
                    <div class="large-4 columns">                         
                        <h2>Liens annexes : </h2>
                        <xsl:apply-templates select="//tei:front[@xml:id='introduction']/tei:linkGrp"/>
                    </div>
                    <div class="large-8 columns"> 
                        <h1>Correspondance d'Armand Horel</h1>
                        <h2>Présentation</h2>
                        <xsl:apply-templates select="//tei:front[@xml:id='introduction']"/>                        
                    </div>                    
                </div>                 
                <footer class="row border">
                    <div class="small-12 medium-12 large-6 columns">                                                                                 
                        <div class="block_footer_img">
                            <a href="http://www.bdic.fr/"><img style="margin-top:5px;" src="../STYLE/images/logo_bdic.gif" alt="logo_BDIC"/></a>
                            <a href="http://www.u-paris10.fr/"><img style="margin-top:5px;" src="../STYLE/images/paris_ouest.png" alt="logo_Paris_Ouest"/></a>
                            <a href="http://www.u-plum.fr/"><img style="margin-top:5px;" src="../STYLE/images/paris_lumieres.png" alt="logo_Paris_Lumiere"/></a>
                        </div>
                    </div>
                    <div class="small-12 medium-12 large-6 columns">
                        <div class="row">
                            <div class="small-6 medium-6 large-6 columns">                            
                                <div class="block_footer">
                                    <b>La bibliothèque</b>                            
                                    <ul class="link">                                
                                        <li>Site de Nanterre</li>                                
                                        <li>6, allée de l'Université</li>                                
                                        <li>F-92001 Nanterre Cedex</li>                                                                                                                                
                                    </ul>
                                </div>                                    
                            </div>
                            <div class="small-6 medium-6 large-6 columns">                            
                                <div class="block_footer">
                                    <b>Le musée</b>                            
                                    <ul class="link">                                
                                        <li>Site de Paris</li>                                
                                        <li>Hôtel national des Invalides</li>                                
                                        <li>129, rue de Grenelle 75007 Paris</li>                                                                                                                                
                                    </ul>
                                </div>                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 text-right">
                                <a class="lien_footer" href="projet/credits.html">Crédits</a>                        
                            </div>
                        </div>
                    </div>
                </footer>               
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../STYLE/foundation/js/vendor/jquery.js">/*Pour transformation xslt*/</script>
                <script src="../STYLE/foundation/js/foundation.min.js">/*Pour transformation xslt*/</script>
                <script>$(document).foundation();</script>
            </body>  
        </html>    
    </xsl:template>
    
   <xsl:template match="//tei:front[@xml:id='introduction']">
       <xsl:for-each select="tei:p">
           <p>
               <xsl:apply-templates/>
           </p>
       </xsl:for-each>              
   </xsl:template>
    
    <xsl:template match="//tei:front[@xml:id='introduction']/tei:linkGrp">
        <xsl:choose>
            <xsl:when test="@type='Sender'">
                <ul>
                    <li>
                        <xsl:variable name="name" select="replace(@corresp,'#','')"/>
                        <xsl:apply-templates select="//tei:person[@xml:id=$name]/tei:persName" mode="ref_lien"/>
                        <ul>
                            <xsl:if test="tei:link[@type='naissance']">
                                <xsl:variable name="link" select="tei:link[@type='naissance']/@target"/>                                
                                <li>
                                    <a href="{$link}">Acte de naissance</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='registre_matricule']">
                                <xsl:variable name="link" select="tei:link[@type='registre_matricule']/@target"/>                                
                                <li>
                                    <a href="{$link}">Fiche matricule</a>
                                </li>
                            </xsl:if>
                        </ul>
                    </li>                                                            
                </ul>                
            </xsl:when>
            <xsl:when test="@type='received'">
                <ul>
                    <li>
                        <xsl:variable name="name" select="replace(@corresp,'#','')"/>
                        <xsl:apply-templates select="//tei:person[@xml:id=$name]/tei:persName" mode="ref_lien"/>
                        <ul>
                            <xsl:if test="tei:link[@type='naissance']">
                                <xsl:variable name="link" select="tei:link[@type='naissance']/@target"/>                                
                                <li>
                                    <a href="{$link}">Acte de naissance</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='registre_matricule']">
                                <xsl:variable name="link" select="tei:link[@type='registre_matricule']/@target"/>                                
                                <li>
                                    <a href="{$link}">Fiche matricule</a>
                                </li>
                            </xsl:if>
                        </ul>
                    </li>                                                            
                </ul>                
            </xsl:when>
            <xsl:otherwise>
                <ul>
                    <li>
                        <xsl:variable name="name" select="replace(@corresp,'#','')"/>
                        <xsl:apply-templates select="//tei:person[@xml:id=$name]/tei:persName" mode="ref_lien"/>
                        <ul>
                            <xsl:if test="tei:link[@type='naissance']">
                                <xsl:variable name="link" select="tei:link[@type='naissance']/@target"/>                                
                                <li>
                                    <a href="{$link}">Acte de naissance</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='registre_matricule']">
                                <xsl:variable name="link" select="tei:link[@type='registre_matricule']/@target"/>                                
                                <li>
                                    <a href="{$link}">Fiche matricule</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='mpf']">
                                <xsl:variable name="link" select="tei:link[@type='mpf']/@target"/>                                
                                <li>
                                    <a href="{$link}">Base des morts pour la France</a>
                                </li>
                            </xsl:if>
                        </ul>
                    </li>                                                            
                </ul>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName" mode="ref_lien">
        <xsl:choose>
            <xsl:when test="@type='normal'">
                <xsl:apply-templates select="tei:forename"/>                
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="tei:surname"/>                                
            </xsl:when>
            <xsl:when test="@xml:id='idx_comtesse'">
                <xsl:apply-templates select="tei:roleName"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="tei:nameLink"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="tei:surname[@type='nobility']"/>                               
            </xsl:when>
            <xsl:when test="@type='nobility'">
                <xsl:apply-templates select="tei:forename"/>        
                <xsl:if test="tei:genName">
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:genName"/>           
                </xsl:if>
                <xsl:if test="tei:nameLink">
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:nameLink"/>
                </xsl:if>
                <xsl:if test="tei:placeName">
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:placeName"/>            
                </xsl:if>                                
            </xsl:when>            
            <xsl:when test="@type='pseudo'">
                <xsl:apply-templates select="tei:name[@type='pseudo']/tei:surname"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="tei:name[@type='pseudo']/tei:forename"/>                                   
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>