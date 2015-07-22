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
                <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
                <script src="../../STYLE/foundation/js/vendor/modernizr.js">/*Pour transformation xslt*/</script>                               
            </head>
            <body>                                                                                     
                <header class="row border-top">                    
                    <img src="../../STYLE/images/logo_bdic.gif" alt="logo_BDIC"/>                                                                                                                                    
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
                                        <li><a href="../projet/chronologie.html">Accès chronologique</a></li>                                        
                                        <li><a href="../projet/geographie.html">Accès géographique</a></li>                                        
                                    </ul>                                    
                                </li>                                
                            </ul>                            
                            <!-- Partie droite -->                            
                            <ul class="right">                            
                                <li class="has-dropdown">                                
                                    <a href="../projet/glossaire.html">Index et Glossaire</a>                                    
                                    <ul class="dropdown">                                    
                                        <li><a href="../projet/glossaire.html#personnes">Personnes</a></li>                                        
                                        <li><a href="../projet/glossaire.html#lieux">Lieux</a></li>                                        
                                        <li><a href="../projet/glossaire.html#glossaire">Glossaire</a></li>                                        
                                    </ul>                                    
                                </li>                                
                                <li><a href="#">A propos de l'édition</a></li>                                    
                            </ul>                              
                        </section>                        
                    </nav>                                            
                </header>
                <div class="row">
                    <img src="../../STYLE/images/slide_14_18_1.jpg" alt="header"/>
                </div>
                <div class="row border">                                    
                    <div class="large-12 columns"> 
                        <h2>Index et Glossaire</h2>
                        <xsl:apply-templates select="//tei:list[@xml:id='glossaire']"/>
                        <hr/>
                        <xsl:apply-templates select="//tei:listPlace[@xml:id='place']"/>
                        <hr/>
                        <xsl:apply-templates select="//tei:listPerson[@xml:id='person']"/>
                    </div>                    
                </div>
                <footer class="row border">
                    <div class="small-12 medium-12 large-6 columns">                                                                                 
                        <div class="block_footer_img">
                            <a href="http://www.bdic.fr/"><img style="margin-top:5px;" src="../../STYLE/images/logo_bdic.gif" alt="logo_BDIC"/></a>
                            <a href="http://www.u-paris10.fr/"><img style="margin-top:5px;" src="../../STYLE/images/paris_ouest.png" alt="logo_Paris_Ouest"/></a>
                            <a href="http://www.u-plum.fr/"><img style="margin-top:5px;" src="../../STYLE/images/paris_lumieres.png" alt="logo_Paris_Lumiere"/></a>
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
                                <a class="lien_footer" href="credits.html">Crédits</a>                        
                            </div>
                        </div>
                    </div>
                </footer>
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../../STYLE/foundation/js/vendor/jquery.js">/*Pour transformation xslt*/</script>
                <script src="../../STYLE/foundation/js/foundation.min.js">/*Pour transformation xslt*/</script>
                <script>$(document).foundation();</script>
            </body>        
        </html>    
    </xsl:template>
    
    <!-- &&Glossaire -->
    <!-- section de code reprise pour les notes au survol dans le texte  -->
    <xsl:template match="//tei:list[@xml:id='glossaire']//tei:label">
        <xsl:choose>                        
            <xsl:when test="tei:name[@type='navire']">
                <xsl:text>&#171; </xsl:text>
                <xsl:apply-templates select="tei:name"/>
                <xsl:text> &#187;</xsl:text>
                <xsl:if test="tei:rs">
                    <xsl:text> (</xsl:text>
                    <xsl:apply-templates select="tei:rs"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>, </xsl:text>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:name"/>
                <xsl:text>, </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="../tei:desc">
            <small>
                <xsl:apply-templates select="../tei:desc/text()"/>
                <xsl:if test="../tei:desc/tei:date">
                    <xsl:text> (</xsl:text>                        
                    <xsl:value-of select="../tei:desc/tei:date/@from"/>                        
                    <xsl:text> &#x2014; </xsl:text>                        
                    <xsl:value-of select="../tei:desc/tei:date/@to"/>                        
                    <xsl:text>).</xsl:text>
                </xsl:if>
            </small>
        </xsl:if>        
    </xsl:template>
    
    <xsl:template match="//tei:list[@xml:id='glossaire']">
        <ul>
            <li>
                <h3 id="glossaire">
                    Glossaire                    
                </h3>
            </li>
            <xsl:for-each select="tei:item">
                <xsl:sort select="tei:label" order="ascending" case-order="upper-first"/>
                <li class="entree">
                    <xsl:attribute name="id" select="@xml:id"/>
                    <xsl:apply-templates select="tei:label"/>                                                                           
                    <xsl:if test="tei:listEvent">
                        <ul>
                            <li class="desc">
                                <xsl:for-each select="tei:listEvent/tei:event">                            
                                    <xsl:choose>
                                        <xsl:when test="position() =1">
                                            <xsl:apply-templates/>
                                        </xsl:when>                                    
                                        <xsl:otherwise>
                                            <xsl:text> &#x2014; </xsl:text><xsl:apply-templates/>
                                        </xsl:otherwise>
                                    </xsl:choose>                                                                                                                    
                                </xsl:for-each>                        
                            </li>
                        </ul>
                    </xsl:if>
                    <ul>
                        <li class="link">
                            <xsl:text>Citations : </xsl:text>
                            <xsl:for-each select="tei:note/tei:ref">                                
                                <xsl:sort select=" replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                                <xsl:choose>
                                    <xsl:when test="position() = 1">
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:when test="position() = last()">
                                        <xsl:text> &#x2014; </xsl:text>
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select="format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/><xsl:text>.</xsl:text>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text> &#x2014; </xsl:text>
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                        </a>
                                    </xsl:otherwise>
                                </xsl:choose>                        
                            </xsl:for-each>
                        </li>
                    </ul>                    
                </li>                                
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="//tei:item/tei:date">
        <xsl:apply-templates/>
        <xsl:text> : </xsl:text>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace[@xml:id='place']/tei:place/tei:placeName">
        <xsl:apply-templates select="text()"/>
        <xsl:choose>
            <xsl:when test="../tei:state">
                <small>
                    <xsl:text> (</xsl:text>
                    <xsl:apply-templates select="../tei:state/tei:p"/>
                    <xsl:text>), </xsl:text>
                </small>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>, </xsl:text>
            </xsl:otherwise>
        </xsl:choose>                    
        <xsl:choose>                        
            <xsl:when test="@type='ville_fr'">
                <small>
                    <xsl:choose>
                        <xsl:when test="../tei:location/tei:district[@type='departement'] and ../tei:location/tei:district[@type='arrondissement']">
                            <xsl:apply-templates select="../tei:location/tei:district[@type='departement']"/><xsl:text>, arr. </xsl:text>
                            <xsl:apply-templates select="../tei:location/tei:district[@type='arrondissement']"/><xsl:text>.</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="../tei:location/tei:district[@type='departement']"/><xsl:text>.</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </small>                                                        
            </xsl:when>
            <xsl:when test="@type='dep_fr'">
                <small>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='region']"/>
                    <xsl:text>.</xsl:text>
                </small>
            </xsl:when>
            <xsl:when test="@type='lieu_fr'">
                <small>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='departement']"/>
                    <xsl:text>, arr. </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='arrondissement']"/>
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='ville']"/>
                    <xsl:text>.</xsl:text>
                </small>
            </xsl:when>
            <xsl:when test="@type='ville_gr'">
                <small>
                    <xsl:apply-templates select="../tei:location/tei:country"/>
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='peripherie']"/>
                    <xsl:text>, dist. </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='district']"/>
                    <xsl:text>.</xsl:text>
                </small>
            </xsl:when>
            <xsl:when test="@type='ville_al'">
                <small>
                    <xsl:apply-templates select="../tei:location/tei:country"/>
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='region']"/>
                    <xsl:text>, wilaya de </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='wilaya']"/>
                    <xsl:text>.</xsl:text>
                </small>
            </xsl:when>
            <xsl:when test="@type='ville_eg'">
                <small>
                    <xsl:apply-templates select="../tei:location/tei:country"/>
                    <xsl:text>, gouv. de </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='gouvernorat']"/>                            
                    <xsl:text>.</xsl:text>
                </small>
            </xsl:when>
            <xsl:when test="@type='ville_tc'">
                <small>
                    <xsl:apply-templates select="../tei:location/tei:country"/>
                    <xsl:text>, reg. de </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='region']"/>
                    <xsl:text>, prov. de </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='province']"/>
                    <xsl:text>, dist. de </xsl:text>
                    <xsl:apply-templates select="../tei:location/tei:district[@type='district']"/>
                    <xsl:text>.</xsl:text>
                </small>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace[@xml:id='place']">
        <ul>
            <li><h3 id="lieux">Index des lieux citées</h3></li>
            <xsl:for-each select="tei:place">
                <xsl:sort select="tei:placeName" order="ascending" case-order="upper-first"></xsl:sort>
                <li class="entree">
                    <xsl:attribute name="id" select="@xml:id"/>
                    <xsl:apply-templates select="tei:placeName"/>                    
                    
                    <xsl:if test="tei:event | tei:location/tei:desc">
                        <ul>
                            <xsl:for-each select="tei:event/tei:p | tei:location/tei:desc">
                                <li class="desc">                                    
                                    <xsl:apply-templates/>
                                </li>    
                            </xsl:for-each> 
                            
                        </ul>
                    </xsl:if>
                    <ul>
                        <li class="link">
                            <xsl:text>Citations : </xsl:text>
                            <xsl:for-each select="tei:note/tei:ref">
                                <xsl:sort select=" replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                                <xsl:choose>
                                    <xsl:when test="position() = 1">
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:when test="position() = last()">
                                        <xsl:text> &#x2014; </xsl:text>
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/><xsl:text>.</xsl:text>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text> &#x2014; </xsl:text>
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                        </a>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </li>
                    </ul>
                </li>                                                
            </xsl:for-each>
        </ul>
    </xsl:template>
   
    <xsl:template match="//tei:event/tei:p/tei:placeName | //tei:location/tei:desc/tei:placeName">
        <xsl:variable name="ref" select="@ref"/>
        <a href="{$ref}">                        
            <xsl:apply-templates />
        </a>
    </xsl:template>
   
    <xsl:template match="//tei:listPerson[@xml:id='person']">
        <ul>
            <li><h3 id="personnes">Index des personnes citées</h3></li>
            <xsl:for-each select="tei:person">
                <xsl:sort select="tei:persName[@type='normal']/tei:surname | tei:persName[@type='pseudo']/tei:name[@type='pseudo'] | tei:persName[@type='nobility']/tei:forename | tei:persName[@type='multiple']/tei:surname[@type='nobility']" order="ascending" case-order="upper-first"/>                    
                <xsl:sort select="tei:persName[@type='normal']/tei:forename | tei:persName[@type='pseudo']/tei:name[@type='pseudo'] | tei:persName[@type='nobility']/tei:forename | tei:persName[@type='multiple']/tei:surname[@type='nobility']" order="ascending" case-order="upper-first"/>                
                <li class="entree">
                    <xsl:attribute name="id" select="@xml:id"/>
                    <xsl:apply-templates select="tei:persName"/> 
                    <ul>
                        <li class="link">
                            <xsl:text>Citations : </xsl:text>
                            <xsl:for-each select="tei:note/tei:ref">
                                <xsl:sort select=" replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                                <xsl:choose>
                                    <xsl:when test="position() = 1">
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:when test="position() = last()">
                                        <xsl:text> &#x2014; </xsl:text>
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/><xsl:text>.</xsl:text>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text> &#x2014; </xsl:text>
                                        <a>
                                            <xsl:variable name="lien">
                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                            </xsl:variable>
                                            <xsl:attribute name="href" select="$lien"/>
                                            <xsl:value-of select="tei:placeName"/>, <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                        </a>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </li>
                    </ul>
                </li>                
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName">
        <xsl:choose>
            <xsl:when test="@type='normal'">
                <xsl:apply-templates select="tei:surname"/>
                <xsl:text> (</xsl:text>
                <xsl:apply-templates select="tei:forename"/>
                <xsl:text>)</xsl:text>
                <small>
                    <xsl:if test="../tei:birth">
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="../tei:birth"/>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="../tei:death"/>
                    </xsl:if>
                    <xsl:if test="tei:roleName">
                        <xsl:text>, </xsl:text>                            
                        <xsl:for-each select="tei:roleName">
                            <xsl:choose>
                                <xsl:when test="position() = last()">
                                    <xsl:apply-templates select="."/>                            
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>                                        
                        </xsl:for-each>                
                    </xsl:if>
                    <xsl:if test="../tei:state">
                        <xsl:text>, </xsl:text>    
                        <xsl:apply-templates select="../tei:state"/>                        
                    </xsl:if>
                </small>
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
                <xsl:if test="../tei:birth">
                    <small>
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="../tei:birth"/>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="../tei:death"/>
                        <xsl:text>,</xsl:text>
                    </small>
                </xsl:if>
                <xsl:if test="tei:roleName">
                    <small>                        
                        <xsl:text> </xsl:text>            
                        <xsl:apply-templates select="tei:roleName"/>            
                    </small>        
                </xsl:if>
            </xsl:when>
            <xsl:when test="@xml:id='idx_comtesse'">
                <xsl:apply-templates select="tei:surname[@type='nobility']"/>
                <xsl:text> (</xsl:text>
                <xsl:apply-templates select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="tei:nameLink"/>
                <xsl:text>)</xsl:text>
                <xsl:text>, </xsl:text>
                <small><xsl:apply-templates select="tei:roleName"/></small>
            </xsl:when>
            <xsl:when test="@type='pseudo'">
                <xsl:apply-templates select="tei:name[@type='pseudo']/tei:surname"/>
                <xsl:text> (</xsl:text>
                <xsl:apply-templates select="tei:name[@type='pseudo']/tei:forename"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="../tei:birth">
                    <xsl:text>, </xsl:text>
                    <small>                
                        <xsl:apply-templates select="../tei:birth"/>
                        <xsl:text> - </xsl:text>
                        <xsl:apply-templates select="../tei:death"/>
                    </small>
                </xsl:if>
                <!--<xsl:if test="tei:name[@type='young']">
                    <small>
                        <xsl:text>, dite </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='young']/tei:surname"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='young']/tei:forename"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='young']/tei:nameLink"/>
                    </small>
                </xsl:if>
                <xsl:if test="tei:name[@type='nobility']">
                    <small>
                        <xsl:text>, dite </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='nobility']/tei:roleName"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="tei:name[@type='nobility']/tei:surname"/>
                    </small>
                </xsl:if> -->  
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    

  
</xsl:stylesheet>