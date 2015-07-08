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
                        <xsl:apply-templates select="//tei:listPlace[@xml:id='place']"/>
                        <xsl:apply-templates select="//tei:listPerson[@xml:id='person']"/>
                    </div>
                </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../../STYLE/foundation/js/vendor/jquery.js">//</script>
                <script src="../../STYLE/foundation/js/foundation.min.js">//</script>
                <script>$(document).foundation();</script>
            </body>        
        </html>    
    </xsl:template>
    <xsl:template match="//tei:list[@xml:id='glossaire']//tei:label">
        <xsl:choose>                        
            <xsl:when test="tei:name[@type='navire']">
                <xsl:text>&#171; </xsl:text><xsl:apply-templates select="tei:name"/><xsl:text> &#187;</xsl:text><xsl:text> (</xsl:text><xsl:apply-templates select="tei:w"></xsl:apply-templates><xsl:text>), </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:name"/><xsl:text>, </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <small>
            <xsl:apply-templates select="tei:state/tei:p"/>
            <xsl:if test="tei:state/tei:p/tei:date">
                <xsl:text> (</xsl:text>                        
                <xsl:value-of select="tei:state/tei:p/tei:date/@from"/>                        
                <xsl:text> &#x2014; </xsl:text>                        
                <xsl:value-of select="tei:state/tei:p/tei:date/@to"/>                        
                <xsl:text>).</xsl:text>
            </xsl:if>
        </small>
    </xsl:template>
    <xsl:template match="//tei:list[@xml:id='glossaire']">
        <ul>
            <li>
                <h3 id="glossaire">
                    Glossaire                    
                </h3>
            </li>
            <xsl:for-each select="tei:item">
                <xsl:sort select="tei:label" order="ascending" case-order="upper-first"></xsl:sort>
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
    
    <xsl:template match="//tei:listPlace[@xml:id='place']">
        <ul>
            <li><h3 id="lieux">Index des lieux citées</h3></li>
            <xsl:for-each select="tei:place">
                <xsl:sort select="tei:placeName" order="ascending" case-order="upper-first"></xsl:sort>
                <li class="entree">
                    <xsl:attribute name="id" select="@xml:id"/>
                    <xsl:apply-templates select="tei:placeName"/>                    
                    <xsl:choose>
                        <xsl:when test="tei:state">
                            <xsl:text> (</xsl:text>
                            <xsl:apply-templates select="tei:state/tei:p"/>
                            <xsl:text>), </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>, </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>                    
                    <xsl:choose>                        
                        <xsl:when test="tei:placeName[@type='ville_fr']">
                            <small>
                                <xsl:choose>
                                    <xsl:when test="tei:location/tei:district[@type='departement'] and tei:location/tei:district[@type='arrondissement']">
                                        <xsl:apply-templates select="tei:location/tei:district[@type='departement']"/><xsl:text>, arr. </xsl:text>
                                        <xsl:apply-templates select="tei:location/tei:district[@type='arrondissement']"/><xsl:text>.</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="tei:location/tei:district[@type='departement']"/><xsl:text>.</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </small>                                                        
                        </xsl:when>
                        <xsl:when test="tei:placeName[@type='dep_fr']">
                            <small>
                                <xsl:apply-templates select="tei:location/tei:district[@type='region']"/>
                                <xsl:text>.</xsl:text>
                            </small>
                        </xsl:when>
                        <xsl:when test="tei:placeName[@type='lieu_fr']">
                            <small>
                                <xsl:apply-templates select="tei:location/tei:district[@type='departement']"/>
                                <xsl:text>, arr. </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='arrondissement']"/>
                                <xsl:text>, </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='ville']"/>
                                <xsl:text>.</xsl:text>
                            </small>
                        </xsl:when>
                        <xsl:when test="tei:placeName[@type='ville_gr']">
                            <small>
                                <xsl:apply-templates select="tei:location/tei:country"/>
                                <xsl:text>, </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='peripherie']"/>
                                <xsl:text>, dist. </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='district']"/>
                                <xsl:text>.</xsl:text>
                            </small>
                        </xsl:when>
                        <xsl:when test="tei:placeName[@type='ville_al']">
                            <small>
                                <xsl:apply-templates select="tei:location/tei:country"/>
                                <xsl:text>, </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='region']"/>
                                <xsl:text>, wilaya de </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='wilaya']"/>
                                <xsl:text>.</xsl:text>
                            </small>
                        </xsl:when>
                        <xsl:when test="tei:placeName[@type='ville_eg']">
                            <small>
                                <xsl:apply-templates select="tei:location/tei:country"/>
                                <xsl:text>, gouv. de </xsl:text>
                                <xsl:apply-templates select="tei:location/tei:district[@type='gouvernorat']"/>                            
                                <xsl:text>.</xsl:text>
                            </small>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="tei:event">
                        <ul>
                            <xsl:for-each select="tei:event/tei:p">
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
   
    
   
    <xsl:template match="//tei:listPerson[@xml:id='person']">
        <ul>
            <li><h3 id="personnes">Index des personnes citées</h3></li>
            <xsl:for-each select="tei:person">
                <xsl:sort select="tei:persName[@type='normal']/tei:surname | tei:persName[@type='pseudo']/tei:name[@type='pseudo'] | tei:persName[@type='nobility']/tei:forename" order="ascending" case-order="upper-first">                    
                </xsl:sort>
                <!--<xsl:sort select="tei:persName" order="ascending" case-order="upper-first"></xsl:sort>-->
                <li class="entree">
                    <xsl:attribute name="id" select="@xml:id"/>
                    <xsl:apply-templates select="tei:persName"/> 
                    <ul>
                        <li class="link">
                            <xsl:text>Citations : </xsl:text>
                            <xsl:for-each select="tei:note/tei:ref">
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
                <xsl:if test="tei:name[@type='young']">
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
                </xsl:if>   
            </xsl:when>
        </xsl:choose>
    </xsl:template>
  
</xsl:stylesheet>