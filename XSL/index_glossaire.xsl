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
                <script src="../../JS/js/jquery.js">/*Pour transformation xslt*/</script>
                <script src="../../JS/menu/long_dropdown.js">/*Pour transformation xslt*/</script>
            </head>
            <body>                                                                                     
                <header class="row border-top">                    
                    <img src="../../IMAGES/photos_site/logo_bdic.gif" alt="logo_BDIC"/>                                                                                                                                    
                    <div class="contain-to-grid sticky">
                        <nav class="top-bar" data-options="sticky_on: large" data-topbar="yes" role="navigation">                    
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
                                            <li class="has-dropdown">
                                                <a href="#">Accès par expéditeur</a>
                                                <ul class="dropdown">
                                                    <xsl:apply-templates select="//tei:particDesc/tei:listPerson[@type='sentBy']" mode="lien"/>
                                                </ul>
                                            </li>      
                                            <li><a href="../projet/chronologie.html">Accès chronologique</a></li>                                        
                                            <li><a href="../projet/geographie.html">Accès géographique</a></li>                                            
                                        </ul>                                    
                                    </li>                                                              
                                </ul>                            
                                <!-- Partie droite -->                            
                                <ul class="right">                            
                                    <li><a href="../projet/index_edition.html">Index</a></li>                                
                                    <li><a href="#">à propos de l'édition</a></li>                                    
                                </ul>                              
                            </section>                        
                        </nav>
                    </div>                                            
                </header>
                <div class="row">
                    <img src="../../IMAGES/photos_site/slide_14_18_1.jpg" alt="header"/>
                </div>
                <div class="row border">                                    
                    <div class="large-12 columns"> 
                        <h2>Index</h2>
                        <xsl:apply-templates select="//tei:div[@xml:id='introduction_index']"/>
                        <xsl:apply-templates select="//tei:body[@xml:id='index']"/>                                               
                    </div>                    
                </div>
                <footer class="row border">
                    <div class="small-12 medium-12 large-6 columns">                                                                                 
                        <div class="block_footer_img">
                            <a href="http://www.bdic.fr/"><img style="margin-top:5px;" src="../../IMAGES/photos_site/logo_bdic.gif" alt="logo_BDIC"/></a>
                            <a href="http://www.u-paris10.fr/"><img style="margin-top:5px;" src="../../IMAGES/photos_site/paris_ouest.png" alt="logo_Paris_Ouest"/></a>
                            <a href="http://www.u-plum.fr/"><img style="margin-top:5px;" src="../../IMAGES/photos_site/paris_lumieres.png" alt="logo_Paris_Lumiere"/></a>
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
    
    <xsl:template match="//tei:div[@xml:id='introduction_index']">
        <h2 class="subheader">
            à propos de l'index
        </h2>
        <xsl:for-each select="tei:p">
            <p><xsl:value-of select="."/></p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//tei:body[@xml:id='index']">        
        <ul>
            <xsl:for-each select="tei:list/tei:item | tei:listPerson/tei:person | tei:listPlace/tei:place">
                <xsl:sort select="tei:label | tei:persName/tei:surname | tei:persName[@type='nobility']/tei:forename | tei:placeName" order="ascending" case-order="upper-first"/>                                   
                <xsl:sort select="tei:persName[@type='normal']/tei:forename" order="ascending" case-order="upper-first"/>
                <xsl:choose>                    
                    <xsl:when test="tei:label[@type='navire'] | tei:persName | tei:placeName">
                        <li class="entree">
                            <xsl:attribute name="id" select="@xml:id"/>                                            
                            <xsl:apply-templates select="tei:label[@type='navire'] | tei:persName | tei:placeName"/>                    
                            <xsl:choose>
                                <xsl:when test="tei:note/tei:ref/ancestor::tei:listPerson | 
                                    tei:note/tei:ref/ancestor::tei:listPlace | 
                                    tei:note/tei:ref/ancestor::tei:item/tei:label/tei:name[@type='navire']">
                                    <ul>
                                        <li class="link">
                                            <xsl:text>Citations : </xsl:text>
                                            <xsl:for-each select="tei:note/tei:ref">
                                                <xsl:sort select=" tei:date/@cert" order="ascending" data-type="text"/>
                                                <xsl:sort select="replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/><!-- pour le mettre pas ordre il faut retirer les - -->                                                
                                                <xsl:choose>
                                                    <xsl:when test="position() = 1">
                                                        <a>
                                                            <xsl:variable name="lien">
                                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                                            </xsl:variable>
                                                            <xsl:attribute name="href" select="$lien"/>
                                                            <xsl:value-of select="tei:placeName"/><xsl:text>, </xsl:text> 
                                                            <xsl:choose>
                                                                <xsl:when test="tei:date[@when]">
                                                                    <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:text>date inconnue</xsl:text>
                                                                </xsl:otherwise>
                                                            </xsl:choose>                                                            
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:when test="position() = last()">
                                                        <xsl:text> &#x2014; </xsl:text>
                                                        <a>
                                                            <xsl:variable name="lien">
                                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                                            </xsl:variable>
                                                            <xsl:attribute name="href" select="$lien"/>
                                                            <xsl:value-of select="tei:placeName"/><xsl:text>, </xsl:text>
                                                            <xsl:choose>
                                                                <xsl:when test="tei:date[@when]">
                                                                    <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:text>date inconnue</xsl:text>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                            <xsl:text>.</xsl:text>
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text> &#x2014; </xsl:text>
                                                        <a>
                                                            <xsl:variable name="lien">
                                                                <xsl:value-of select="replace(@target, 'xml', 'html')"/>
                                                            </xsl:variable>
                                                            <xsl:attribute name="href" select="$lien"/>
                                                            <xsl:value-of select="tei:placeName"/><xsl:text>, </xsl:text>
                                                            <xsl:choose>
                                                                <xsl:when test="tei:date[@when]">
                                                                    <xsl:value-of select=" format-date(tei:date/@when,'[D01] [Mn,*-3] [Y0001]', 'fr', (), ())"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:text>date inconnue</xsl:text>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </a>
                                                    </xsl:otherwise>
                                                </xsl:choose>                        
                                            </xsl:for-each>
                                        </li>
                                    </ul>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </li>        
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:for-each>
        </ul>                 
        
    </xsl:template>
    
    <!-- &&Glossaire -->    
    <xsl:template match="//tei:list[@xml:id='autre_index']//tei:label[@type='navire']">
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
                <xsl:choose>
                    <xsl:when test="../tei:desc">
                        <xsl:text>, </xsl:text>
                        <small>
                            <xsl:apply-templates select="../tei:desc/text()"/>
                            <xsl:choose>
                                <xsl:when test="../tei:desc/tei:date">
                                    <xsl:text>, (</xsl:text>                        
                                    <xsl:value-of select="../tei:desc/tei:date/@from"/>                        
                                    <xsl:text>-</xsl:text>                        
                                    <xsl:value-of select="../tei:desc/tei:date/@to"/>                        
                                    <xsl:text>).</xsl:text>    
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>.</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>                                        
                        </small>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>.</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="tei:name[@type='entree']"/>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:name"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    
    <xsl:template match="//tei:item/tei:date">
        <xsl:apply-templates/>
        <xsl:text> : </xsl:text>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace[@xml:id='place']/tei:place/tei:placeName">
        <i><!-- aide à la lecture par différenciation typographique -->
            <xsl:apply-templates select="text()"/>
            <xsl:if test="tei:placeName[@type='today']">
                <small>
                    <xsl:text>, auj. </xsl:text>
                    <xsl:value-of select="normalize-space(tei:placeName[@type='today'])"/>
                </small>
            </xsl:if>
        </i>        
        <xsl:choose>
            <xsl:when test="@type='etranger'">
                <xsl:choose>
                    <xsl:when test="../tei:location/tei:country">
                        <xsl:text>, </xsl:text>
                        <small>
                            <xsl:apply-templates select="../tei:location/tei:country"/>
                            <xsl:choose>
                                <xsl:when test="../tei:location/tei:district">
                                    <xsl:text>, </xsl:text>
                                    <xsl:for-each select="../tei:location/tei:district">
                                        <xsl:apply-templates/>
                                        <xsl:choose>
                                            <xsl:when test="position()!= last()">
                                                <xsl:text>, </xsl:text>
                                            </xsl:when>                                            
                                            <xsl:otherwise>                                                
                                                <xsl:text>.</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>.</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>                                                        
                        </small>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>.</xsl:text>
                    </xsl:otherwise>                    
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@type='renvoi'">
                <xsl:variable name="renvoi" select="replace(@corresp,'#','')"/>
                <xsl:variable name="id" select="@corresp"/>
                <xsl:text>, </xsl:text>
                <small>
                    <xsl:text>voir </xsl:text>
                    <a href="{$id}"><xsl:value-of select="//tei:place[@xml:id=$renvoi]/tei:placeName"/></a>
                    <xsl:text>.</xsl:text>                    
                </small>                                
            </xsl:when>
            <xsl:when test="@type='fr'">
                <xsl:choose>
                    <xsl:when test="../tei:location/tei:district">
                        <xsl:text>, </xsl:text>
                        <small>
                            <xsl:for-each select="../tei:location/tei:district">
                                <xsl:apply-templates/>
                                <xsl:choose>
                                    <xsl:when test="position()!= last()">
                                        <xsl:text>, </xsl:text>                                        
                                    </xsl:when>
                                    <xsl:otherwise>                                        
                                        <xsl:text>.</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </small>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>.</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:when>
        </xsl:choose>                                            
    </xsl:template>
    
    <xsl:template match="//tei:event/tei:p/tei:placeName | //tei:location/tei:desc/tei:placeName">
        <xsl:variable name="ref" select="@ref"/>
        <a href="{$ref}">                        
            <xsl:apply-templates />
        </a>
    </xsl:template>
    
    <xsl:template match="//tei:persName/tei:surname">
        <span class="smallcaps"><xsl:apply-templates/></span>        
    </xsl:template>
   
    
    <xsl:template match="//teipersName//tei:placeName">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName">
        <xsl:choose>
            <xsl:when test="@type='nobility'">
                <span class="smallcaps">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:choose>
                        <xsl:when test="../tei:birth | ../tei:state">
                            <xsl:text>,</xsl:text>                            
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>.</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>                    
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:surname"/>
                <xsl:text> </xsl:text>
                <xsl:text>(</xsl:text><xsl:value-of select="normalize-space(tei:forename)"/>
                <xsl:if test="tei:roleName | tei:nameLink">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:roleName"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="tei:nameLink"/>
                </xsl:if>
                <xsl:text>)</xsl:text>
                <xsl:choose>
                    <xsl:when test="../tei:birth | ../tei:state or @type='renvoi'">
                        <xsl:text>, </xsl:text>                        
                    </xsl:when>
                    <xsl:otherwise>                        
                        <xsl:text>.</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>        
        <xsl:choose>
            <xsl:when test="../tei:birth | ../tei:state">
                <xsl:if test="../tei:birth">
                    <small>                    
                        <xsl:value-of select="normalize-space(../tei:birth/@when)"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="normalize-space(../tei:death/@when)"/>
                        <xsl:choose>
                            <xsl:when test="../tei:state">
                                <xsl:text>,</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>.</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </small>
                </xsl:if>
                <xsl:if test="../tei:state">
                    <small>                    
                        <xsl:for-each select="../tei:state/tei:p">
                            <xsl:apply-templates/>
                            <xsl:choose>
                                <xsl:when test="position()!= last()">
                                    <xsl:text>, </xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>.</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </small>
                </xsl:if>                
            </xsl:when>
        </xsl:choose>    
        <xsl:if test="@type='renvoi'">
            <xsl:variable name="renvoi" select="replace(@corresp,'#','')"/>
            <xsl:variable name="id" select="@corresp"/>            
            <small>
                <xsl:text>voir </xsl:text>
                <a href="{$id}"><xsl:value-of select="normalize-space(//tei:person[@xml:id=$renvoi]/tei:persName)"/></a>
                <xsl:text>.</xsl:text>
            </small>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//tei:particDesc/tei:listPerson[@type='sentBy']" mode="lien">
        <xsl:for-each select="tei:person">
            <xsl:variable name="id" select="concat('#',@xml:id)"/>
            <xsl:if test="//tei:correspDesc//tei:ref/tei:persName[@corresp=$id]">
                <li class="has-dropdown">
                    <a class="link" href="#">
                        <xsl:apply-templates select="tei:persName"/><xsl:text> à :</xsl:text>
                    </a>
                    <ul class="dropdown">                    
                        <xsl:for-each select="//tei:correspDesc//tei:ref[descendant::tei:persName[@corresp=$id]]">
                            <xsl:sort select=" tei:date/@cert" order="ascending" data-type="text"/>
                            <xsl:sort select="replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                            <xsl:variable name="link" select="replace(@target,'xml','html')"/>
                            <li><a href="{$link}"><xsl:value-of select="tei:persName[@type='deliveredTo']"/><xsl:text> : </xsl:text><xsl:value-of select="tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:date"/></a></li>
                        </xsl:for-each>
                    </ul>
                </li>    
            </xsl:if>                        
        </xsl:for-each>        
    </xsl:template>

  
</xsl:stylesheet>