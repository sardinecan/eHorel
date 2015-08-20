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
                <title>
                    <xsl:value-of
                        select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@n='1']"/>
                </title>
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
                                    <li><a href="#">A propos de l'édition</a></li>                                    
                                </ul>                              
                            </section>                        
                        </nav>
                    </div>                                            
                </header>                                    
                <div class="row border">                    
                    <div class="medium-12 large-9 columns">
                       <div class="row">
                           <img src="../../IMAGES/photos_site/slide_14_18_1.jpg" alt="header"/>
                       </div>                                                
                    </div>
                    <div class="medium-12 large-3 columns asideDroit">                       
                        <div class="row">
                            <div class="large-12"><xsl:apply-templates select="//tei:teiHeader" mode="aside"/></div>    
                        </div>
                        <div class="row">
                            <div class="large-12">
                                <xsl:apply-templates select="//tei:correspDesc"/>        
                            </div>
                        </div>                                                                                                                                                          
                    </div>
                    <hr style="margin-bottom:0;"/>
                </div>
                <div class="row border" data-equalizer="true">                                                                                                                                    
                    <div class="medium-12 large-8 columns panel" data-equalizer-watch="true">                                                                                
                        <xsl:choose><!-- Permet de maintenir la superposition des blocs même  lorsque que la carte est la première ou la dernière -->                                                           
                            <xsl:when test="//tei:ref[@type='previous'] and //tei:ref[@type='next']">                                                        
                                <div class="row">                                
                                    <div class="large-3 columns"><!-- alignement des blocs -->                                                                                                        
                                        <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>                                                                                                            
                                    </div>                                                                                                    
                                    <div class="large-3 columns text-right"><!-- alignement des blocs -->                                                                                                        
                                        <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>                                                                                                            
                                    </div>                                      
                                </div>                                                              
                            </xsl:when>                                                        
                            <xsl:otherwise>                                                        
                                <xsl:if test="//tei:ref[@type='previous']">                                                                
                                    <div><!-- alignement des blocs -->                                                                        
                                        <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>                                                                                
                                    </div>                                                                        
                                </xsl:if>                                                                                                            
                                <xsl:if test="//tei:ref[@type='next']">  <!-- alignement des blocs --> <!-- todo -->                                                                                       
                                    <div class="text-right">                                                                        
                                        <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>                                                                                
                                    </div>                                                                        
                                </xsl:if>                                                                
                            </xsl:otherwise>                                                       
                        </xsl:choose>                        
                        <!-- Corps de la lettre -->                        
                        <!-- adresse -->                                                                                                                                                                                                                                       
                        <xsl:choose>                                                               
                            <xsl:when test="//tei:div[@type='enveloppe']">                                                                    
                                <ul class="accordion" data-accordion="true">
                                    <li class="accordion-navigation">
                                        <a href="#mention_adresse">Adresse <small>(cliquer pour afficher)</small></a>
                                        <div id="mention_adresse" class="content">
                                            <div class="row">                                                                        
                                                <div class="medium-10 large-10 medium-centered large-centered columns adresse">                                                                            
                                                    <xsl:apply-templates select="//tei:div[@type='enveloppe']"/>                                                                                
                                                </div>                                                                                
                                            </div>
                                        </div>
                                    </li>
                                </ul>                                                                       
                            </xsl:when>                                                                    
                            <xsl:when test="//tei:address[@place='postcard' and @type='deliveredTo']">
                                <ul class="accordion" data-accordion="true">
                                    <li class="accordion-navigation">
                                        <a href="#mention_adresse">Adresse <small>(cliquer pour afficher)</small></a>
                                        <div id="mention_adresse" class="content">
                                            <div class="row">                                                                
                                                <div class="medium-10 large-10 medium-centered large-centered columns adresse">                                    
                                                    <i>(destinataire) :</i>                                                                                                                                                   
                                                    <hr class="hr_separation"/>                                                                                                                            
                                                    <p class="mention_adresse"><xsl:apply-templates select="(//tei:address[@type='deliveredTo' and @place='postcard'])[1]" mode="affichage"/></p>                                        
                                                </div>                                                                            
                                            </div>              
                                        </div>
                                    </li>
                                </ul>                                                                                                           
                            </xsl:when>                            
                            <xsl:when test="//tei:address[@place='back' and @type='deliveredTo']">   
                                <ul class="accordion" data-accordion="true">
                                    <li class="accordion-navigation">
                                        <a href="#mention_adresse">Adresse <small>(cliquer pour afficher)</small></a>
                                        <div id="mention_adresse" class="content">
                                            <div class="row">                                                                
                                                <div class="large-10 large-centered columns adresse">                                    
                                                    <i>(destinataire) :</i>                                                                                                                                                   
                                                    <hr class="hr_separation"/>                                                                                                                            
                                                    <p class="mention_adresse"><xsl:apply-templates select="(//tei:address[@type='deliveredTo' and @place='back'])[1]" mode="affichage"/></p>                                        
                                                </div>                                                                            
                                            </div>              
                                        </div>
                                    </li>
                                </ul>                                                                                                
                            </xsl:when>                                                        
                            <xsl:otherwise/>                                                        
                        </xsl:choose>                                                                                                                                                     
                        <div class="row">                                                       
                            <div class="large-12">                                                        
                                <xsl:apply-templates select="//tei:div[@type='letter']"/>                                                                                                            
                                <xsl:apply-templates select="//tei:add[@type='closer']" mode="ordreLecture"/>                                
                                <xsl:apply-templates select="//tei:add[@type='postscript']" mode="ordreLecture"/>   <!-- todo note pour les add type postscript -->                                                             
                                <xsl:if test="not(//tei:signed | //tei:add[@type='signed'])">
                                    <p class="text-right">
                                        <i>(non signé)</i>
                                    </p>
                                </xsl:if>
                            </div>                            
                        </div>                            <!-- ajouter xsl if note closer et / ou tei:back [@note] -->                                                    
                        <div class="row">                                                                         
                            <div class="large-12">                            
                                <hr class="hr_note"/>                                                                                                                  
                                <xsl:apply-templates select="//tei:div[@type='note']" mode="note"/>                                
                            </div>                                                                       
                        </div>                                               
                    </div>                    
                    <div class="medium-12 large-4 columns" data-equalizer-watch="true">                                            
                        <h3>Cliquez sur les images pour consulter l'intégralité du fonds numérisé.</h3>                        
                        <xsl:apply-templates select="//tei:pb" mode="affichage"/>                                                                                                                                
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
    
    <!-- && TEIHEADER -->
    
    <xsl:template match="tei:teiHeader">
        <xsl:apply-templates select="tei:fileDesc"/>
        <xsl:apply-templates select="tei:encodingDesc"/>
        <xsl:apply-templates select="tei:profileDesc"/>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader" mode="aside">
        <p>
            <b>
                <xsl:apply-templates select="tei:fileDesc/tei:titleStmt/tei:title[1]"/>
            </b>
            <br/>
            <xsl:text>cote : </xsl:text><xsl:apply-templates select="//tei:idno"/>            
        </p>                   
        <hr/>
    </xsl:template>
    
    <xsl:template match="tei:fileDesc">
        <xsl:apply-templates select="tei:titleStmt"/>
        <xsl:apply-templates select="tei:publicationStmt"/>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt">
        <xsl:apply-templates select="tei:title[1]"/>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt"/>
    
    <xsl:template match="tei:profileDesc">
        <xsl:apply-templates select="tei:correspDesc"/>        
    </xsl:template>
    
    <xsl:template match="tei:correspDesc">                   
        <p class="metadonnees">
            <span class="smallcaps">Expéditeur : </span>        
            <xsl:value-of select="tei:correspAction/tei:persName[@type='sentBy']"/>        
            <br/>        
            <span class="smallcaps">Lieu : </span>        
            <xsl:value-of select="tei:correspAction/tei:placeName"/>         
            <br/>        
            <span class="smallcaps">Date : </span>        
            <xsl:value-of select="tei:correspAction/tei:date"/>        
            <br/>                
            <span class="smallcaps">Destinataire : </span>                    
            <xsl:value-of select="tei:correspAction/tei:persName[@type='deliveredTo']"/> <!-- todo prévoire si plusieur destinataire. -->
        </p>                              
    </xsl:template>
    
    <xsl:template match="tei:correspDesc//tei:ref" mode="lien">
        <xsl:variable name="lien" select="replace(@target,'xml','html')"/>
        <xsl:choose>
            <xsl:when test="@type='previous'">
                <a href="{$lien}">Précédente</a>
            </xsl:when>
            <xsl:when test="@type='next'">
                <a href="{$lien}">Suivante</a>
            </xsl:when>            
        </xsl:choose>                    
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
    
    <!-- && BODY -->
    <xsl:template match="tei:div[@type='letter']">        
            <xsl:apply-templates/>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='sentBy' and @place='envelope']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='deliveredTo' and @place='envelope']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='deliveredTo' and @place='back']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='sentBy' and @place='back']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='deliveredTo' and @place='postcard']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:closer//tei:address[@type='sentBy']//tei:addrLine">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type]" mode="affichage">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates select="."/>
            <xsl:for-each select="tei:del">
                <span class="del"><xsl:value-of select="."/></span>
            </xsl:for-each>            
            <br/>
        </xsl:for-each>        
    </xsl:template>    
    
    <xsl:template match="tei:text//tei:choice">
        <xsl:apply-templates select="tei:reg | tei:corr | tei:expan"/>
    </xsl:template>
    
   <!-- <xsl:template match="tei:w/tei:supplied[@type='omitted']">                
        <xsl:apply-templates/>
    </xsl:template> --> 
    
    <xsl:template match="//tei:w[@rend='aggl']">        
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='capitalize'">
                <xsl:choose>
                    <xsl:when test="tei:choice">
                        <span class="capitalize">
                            <xsl:apply-templates/>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="upper-case(.)"/>
                    </xsl:otherwise>
                </xsl:choose>                        
            </xsl:when>            
            <xsl:when test="@rend='super'">
                <sup class="super">
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <xsl:when test="@rend='minimize'">
                <xsl:value-of select="lower-case(.)"/>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:del"/>    
    
    <xsl:template match="tei:text//tei:unclear"> 
        <xsl:apply-templates/>
        <i><xsl:text>(?)</xsl:text></i> 
    </xsl:template>
    
    <xsl:template match="tei:text//tei:sic">
        <xsl:apply-templates/>
        <i>(sic)</i>
    </xsl:template> 
    
    <xsl:template match="tei:div[@type='letter']//tei:forename">
        <xsl:variable name="upfirst">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:value-of select="concat(upper-case(substring($upfirst, 1, 1)), lower-case(substring($upfirst, 2)))"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']//tei:surname">
        <xsl:variable name="up">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:value-of select="upper-case($up)"/>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:supplied[@reason='omitted']">
        <xsl:choose>
            <xsl:when test="./ancestor::tei:w | ./ancestor::tei:placeName">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>[</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>]</xsl:text>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="tei:text//tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='missing'">
                <p/>
                    [...]
                <p/>
            </xsl:when>
            <xsl:when test="@reason='illegible'">
                <xsl:choose>
                    <xsl:when test="../../tei:date">
                        <i>Date illisible</i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>Illisible</i>
                    </xsl:otherwise>
                </xsl:choose>                               
            </xsl:when>                            
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='numbering']">
        <sub>(<xsl:value-of select="@n"/>)</sub>    
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']/tei:figure"/>
    <!-- supprime toutes les figures enfants de letter (pour les cartes postales) -->
    
    <xsl:template match="//tei:surplus | //tei:pc[@type='surplus']"/>
    <!-- n'affiche pas les mots doublés et la ponctuation superficiel -->
    
    <xsl:template match="tei:pb[@type='postcardBreak']">
        <hr/>        
    </xsl:template>
    <!-- expression xpath tous les p qui suivent un pb //pb/following::p[1] => 
    le faire avec les p -->
    
    <xsl:template match="tei:div[@type='letter']/tei:p">   <!-- TODO -->
        <p>
            <xsl:apply-templates/>            
        </p>                    
    </xsl:template>   
    
    <xsl:template match="tei:div[@type='letter']//tei:ref[@type='note'] | tei:div[@type='enveloppe']//tei:ref[@type='note']">
        <xsl:variable name="lien" select="@target"/>
        <xsl:variable name="iden" select="replace(@target,'#','')"/>
        <xsl:variable name="id" select="concat($iden,'appel')"/>
        <sup>
            <a href="{$lien}" id="{$id}">
                <xsl:value-of select="@n"/>
            </a>
        </sup>
    </xsl:template>
    
    <xsl:template match="
        tei:body//tei:persName |
        tei:back//tei:note/tei:persName |
        tei:body//tei:placeName | 
        tei:back//tei:note/tei:placeName |
        tei:body//tei:name[@type='navire'] |
        tei:back//tei:note/tei:name[@type='navire'] |
        tei:body//tei:name[@type='entree'] |
        tei:back//tei:note/tei:name[@type='entree'] |
        tei:body//tei:rs[@type='person']">
        <xsl:choose>
            <xsl:when test="@type='entree'">                
                <xsl:variable name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:variable>                
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:listPlace[@xml:id='place']/tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <xsl:variable name="number">                    
                    <xsl:number count="tei:placeName | tei:persName | tei:name | tei:rs" level="any" from="tei:text" format="1"/>
                </xsl:variable>    
                <xsl:variable name="drop" select="concat('drop_',$number)"/>
                <a href="#">  
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id" select="$id"/>
                    </xsl:if>
                    <xsl:attribute name="aria-expanded">false</xsl:attribute>
                    <xsl:attribute name="aria-controls" select="$drop"/>
                    <xsl:attribute name="data-dropdown" select="$drop"/>                                
                    <xsl:apply-templates/>                    
                </a>
                <span id="{$drop}" class="medium content f-dropdown">
                    <xsl:attribute name="data-dropdown-content" >true</xsl:attribute>
                    <xsl:attribute name="aria-hidden">true</xsl:attribute>
                    <xsl:attribute name="tabindex">-1</xsl:attribute>
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:listPlace[@xml:id='place']/tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>                                
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="ref">
                    <xsl:value-of select="concat('../projet/index_edition.html',@ref)"/>
                </xsl:variable>
                <xsl:variable name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:variable>                
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:listPlace[@xml:id='place']/tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <xsl:variable name="number">                    
                    <xsl:number count="tei:placeName | tei:persName | tei:name | tei:rs" level="any" from="tei:text" format="1"/>
                </xsl:variable>    
                <xsl:variable name="drop" select="concat('drop_',$number)"/>
                <a href="#">  
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id" select="$id"/>
                    </xsl:if>
                    <xsl:attribute name="aria-expanded">false</xsl:attribute>
                    <xsl:attribute name="aria-controls" select="$drop"/>
                    <xsl:attribute name="data-dropdown" select="$drop"/>                                
                    <xsl:apply-templates/>                    
                </a>
                <span id="{$drop}" class="medium content f-dropdown">
                    <xsl:attribute name="data-dropdown-content" >true</xsl:attribute>
                    <xsl:attribute name="aria-hidden">true</xsl:attribute>
                    <xsl:attribute name="tabindex">-1</xsl:attribute>
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:listPlace[@xml:id='place']/tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>            
                    <br/>
                    <xsl:text>..............................</xsl:text>
                    <br/>            
                    <a href="{$ref}">Accès à l'index</a>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
        
    
    <xsl:template match="//tei:list[@xml:id='autre_index']//tei:label" mode="survol">
        <!-- section de code reprise pour l'index  -->
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
            <xsl:apply-templates select="../tei:desc/text()"/>
            <xsl:if test="../tei:desc/tei:date">
                <xsl:text> (</xsl:text>                        
                <xsl:value-of select="../tei:desc/tei:date/@from"/>                        
                <xsl:text>-</xsl:text>                        
                <xsl:value-of select="../tei:desc/tei:date/@to"/>                        
                <xsl:text>).</xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="../tei:listEvent">
            <xsl:for-each select="../tei:listEvent/tei:event/tei:p">
                <br/>
                <xsl:text>&#x2013;</xsl:text><xsl:apply-templates select="."/>                    
            </xsl:for-each>            
        </xsl:if>        
    </xsl:template>
    
    <xsl:template match="//teipersName//tei:placeName">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName" mode="survol">
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
                </xsl:if>
                <xsl:if test="../tei:state">
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
                </xsl:if>                
            </xsl:when>
        </xsl:choose>    
        <xsl:if test="@type='renvoi'">
            <xsl:variable name="renvoi" select="replace(@corresp,'#','')"/>
            <xsl:variable name="id" select="concat('../projet/index_edition.html',@corresp)"/>            
            <small>
                <xsl:text>voir </xsl:text>
                <a href="{$id}"><xsl:value-of select="normalize-space(//tei:person[@xml:id=$renvoi]/tei:persName)"/></a>
                <xsl:text>.</xsl:text>
            </small>
        </xsl:if>
        <xsl:if test="../tei:listEvent">
            <xsl:for-each select="../tei:listEvent/tei:event/tei:p">
                <br/>
                <xsl:text>&#x2013;</xsl:text><xsl:apply-templates select="."/>                    
            </xsl:for-each>            
        </xsl:if>        
    </xsl:template>
    
    <xsl:template match="//tei:listPlace[@xml:id='place']/tei:place/tei:placeName" mode="survol">        
        <xsl:apply-templates select="text()"/>        
        <xsl:if test="tei:placeName[@type='today']">                                            
            <xsl:text>, auj. </xsl:text>                         
            <xsl:value-of select="tei:placeName[@type='today']"/>                            
        </xsl:if>                                          
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
                <xsl:variable name="id" select="concat('../projet/index_edition.html',@corresp)"/>
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
        <xsl:if test="../tei:event | ../tei:location/tei:desc">
            <xsl:for-each select="../tei:event/tei:p | ../tei:location/tei:desc">
                <br/>
                <xsl:text>-</xsl:text><xsl:apply-templates select="."/>                    
            </xsl:for-each>            
        </xsl:if>        
    </xsl:template>
    
    <!-- &&OPENER -->
    <xsl:template match="tei:opener/tei:dateline">
        <p class="dateline">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:opener/tei:salute">
        <p class="text-center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <!-- &&CLOSER / add@type='closer' -->
    <xsl:template match="tei:closer/tei:salute">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:signed">
        <xsl:choose>
            <xsl:when test="tei:address[@type='sentBy']">
                <p class="text-right">
                    <xsl:apply-templates select="tei:address/tei:persName"/>
                </p>
                <p class="text-left">
                    <xsl:apply-templates select="tei:address/tei:addrLine"/>
                </p>     
            </xsl:when>
            <xsl:when test="tei:add">
                <p class="text-right">
                    <xsl:apply-templates select="tei:add/tei:persName"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p class="text-right">
                    <xsl:apply-templates select="tei:persName"/>
                </p>
            </xsl:otherwise>
        </xsl:choose>                   
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='closer']"/>
    
    <xsl:template match="tei:text//tei:add[@type='closer']" mode="ordreLecture">        
        <p>
            <xsl:apply-templates select="tei:add[not(@type='signed')]"/>                    
        </p>
        <xsl:if test="tei:add[@type='signed']">
            <p class="text-right">
                <xsl:apply-templates select="tei:add[@type='signed']/tei:persName"/> <!-- todo ajouter ce qui vient après la signature ex A horel "toujours la même adresse." -->
            </p>           
        </xsl:if>
    </xsl:template>
    
    
    <!-- &&POSTSCRIPT -->
    <xsl:template match="tei:text//tei:add[@type='postscript']"/>
    
    <xsl:template match="tei:text//tei:add[@type='postscript']" mode="ordreLecture">                
        <p>
            <xsl:apply-templates/>        
        </p>
    </xsl:template>
    
    <xsl:template match="tei:postscript[position()=1]">
        <p>                
            <xsl:text>[PS:]</xsl:text>             
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:postscript[position()!=1]">                
        <p>            
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- &&ENVELOPPE -->
    <xsl:template match="tei:div[@type='enveloppe']">        
        
            <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']//tei:address">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates select="."/>
            <xsl:for-each select="tei:del">
                <span class="del">
                    <xsl:apply-templates/>
                </span>
            </xsl:for-each>            
            <br/>
        </xsl:for-each>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[1]">
        <div class="row text-left">
            <xsl:choose>
                <xsl:when test="tei:address[@type='deliveredTo' and @place='envelope'] and tei:stamp">
                    <div class="large-6 columns">                                                         
                        <i>(Destinataire :)</i>                            
                        <hr class="hr_separation"/>                            
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='deliveredTo' and @place='envelope']"/></p>                
                        <br/>                    
                        <xsl:if test="tei:add[@hand='#other']">
                            <i>(D'une autre main :)</i>
                            <hr class="hr_separation"/>
                            <p class="mention_adresse"><xsl:apply-templates select="tei:add[@hand='#other']"/></p>
                        </xsl:if>                                        
                    </div>        
                    <div class="large-6 columns">            
                        <xsl:apply-templates select="tei:stamp"/>        
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="large-12">                                                                    
                        <i>(Destinataire :)</i>                                                    
                        <hr class="hr_separation"/>                            
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='deliveredTo' and @place='envelope']"/></p>                                            
                        <br/>                                            
                        <xsl:if test="tei:add[@hand='other']">                        
                            <i>(D'une autre main :)</i>                            
                            <hr class="hr_separation"/>                            
                            <p class="mention_adresse"><xsl:apply-templates select="tei:add[@hand='other']"/></p>                            
                        </xsl:if>                                        
                    </div>
                </xsl:otherwise>
            </xsl:choose>            
        </div>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']/tei:pb[@n='2']">
        <div class="row">        
            <div class="large-12 columns">
                <i>(Au dos :)</i>
                <br/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[2]">
        <div class="row text-left">        
            <xsl:choose>            
                <xsl:when test="tei:address[@type='sentBy' and @place='envelope'] and tei:stamp">                
                    <div class="large-6 columns">                    
                        <i>(Expéditeur :)</i>                    
                        <hr class="hr_separation"/>                    
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='sentBy' and @place='envelope']"/></p>                
                    </div>                
                    <div class="large-6 columns">                    
                        <xsl:apply-templates select="tei:stamp"/>                
                    </div>            
                </xsl:when>            
                <xsl:otherwise>                
                    <div class="large-12 columns">                    
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='sentBy' and @place='envelope']"/></p>                
                    </div>            
                </xsl:otherwise> 
            </xsl:choose>                        
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']//tei:stamp">
        <xsl:choose>
            <xsl:when test="@type='armee'">              
                <i>(Cachet militaire :)</i>
                <hr class="hr_separation"/>
                <p class="mention_adresse"><xsl:apply-templates/></p>
                <br/>
            </xsl:when>
            <xsl:when test="@type='postmark'">
                <i>(Cachet postal :)</i>
                <hr class="hr_separation"/>
                <p class="mention_adresse"><xsl:apply-templates/></p>
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <i>(cachet :)</i>
                <hr class="hr_separation"/>
                <p class="mention_adresse"><xsl:apply-templates/></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- &&ASIDE -->
    <xsl:template match="tei:div[@type='letter']/tei:pb | tei:div[@type='enveloppe']/tei:pb" mode="affichage">
        <xsl:variable name="source">
            <xsl:value-of select=" substring-before(@facs,' ')"/>
        </xsl:variable>
        <xsl:variable name="lien">
            <xsl:value-of select=" substring-after(@facs,' ')"/>
        </xsl:variable>
        <xsl:for-each select=".">
            <xsl:variable name="image" select="@facs"/>
            <a href="{$lien}">
                <img src="{$source}" alt="image" class="img-responsive center-block facs"/>
            </a> 
        </xsl:for-each>
    </xsl:template>
    
    
    <!-- &&NOTES -->
    <xsl:template match="//tei:div[@type='note']" mode="note">
        <ul>
            <xsl:for-each select="tei:note">
                <li class="note">
                    <sup>
                        <xsl:variable name="link">
                            <xsl:value-of select="concat('#',@xml:id,'appel')"/>
                        </xsl:variable>
                        <xsl:variable name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:variable>
                        <a href="{$link}" id="{$id}">
                            <xsl:value-of select="@n"/>
                        </a>
                    </sup> 
                    <xsl:apply-templates/>
                    <xsl:if test="tei:bibl">
                        <xsl:text>voir : </xsl:text>
                        <ul>                            
                            <xsl:variable name="id" select="replace(tei:bibl/@corresp,'#','')"/>
                            <li class="note">
                                <xsl:apply-templates select="//tei:listBibl[@xml:id='bibl']/tei:bibl[@xml:id=$id]" mode="note"/>
                                <xsl:choose>
                                    <xsl:when test="tei:bibl[@n]">
                                        <xsl:text>, p. </xsl:text>
                                        <xsl:value-of select="tei:bibl/@n"/>
                                        <xsl:text>.</xsl:text>                                        
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>.</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>                               
                            </li>
                        </ul>
                    </xsl:if>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>  
    
   <!-- <xsl:template match="tei:div[@type='note']//tei:persName | tei:div[@type='note']//tei:placeName | tei:div[@type='note']//tei:name[@type='navire'] | tei:div[@type='note']//tei:rs[@type='person']">
        <xsl:choose>
            <xsl:when test="@xml:id">
                <xsl:variable name="ref">
                    <xsl:value-of select="concat('../projet/index_edition.html',@ref)"/>
                </xsl:variable>
                <xsl:variable name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:variable>
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <a href="{$ref}" id="{$id}" class="glossary"><xsl:apply-templates/><span><xsl:value-of select="$defi"></xsl:value-of></span></a>
            </xsl:when>
            <xsl:otherwise>                                    
                <xsl:variable name="ref">
                    <xsl:value-of select="concat('../projet/index_edition.html',@ref)"/>
                </xsl:variable>
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <a href="{$ref}" class="glossary"><xsl:apply-templates/><span><xsl:value-of select="$defi"></xsl:value-of></span></a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    <xsl:template match="//tei:listBibl//tei:bibl" mode="note">
        <xsl:choose>
            <xsl:when test="@type='monographie'">
                <xsl:if test="tei:author">
                    <xsl:apply-templates select="tei:author/tei:forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:author/tei:surname"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@type]">
                        <i>
                            <xsl:apply-templates select="tei:title[@type='title']"/>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates select="tei:title[@type='subtitle']"/>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i><xsl:apply-templates select="tei:title"/></i>
                    </xsl:otherwise>
                </xsl:choose>                
                <xsl:if test="tei:placeName">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="tei:placeName"/>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:date/@when"/>
                </xsl:if>                                
            </xsl:when>
            <xsl:when test="@type='article'">
                <xsl:if test="tei:author">
                    <xsl:apply-templates select="tei:author/tei:forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:author/tei:surname"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@type]">
                        <i>
                            <xsl:text>«</xsl:text><xsl:apply-templates select="tei:title[@type='title']"/>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates select="tei:title[@type='subtitle']"/><xsl:text>»</xsl:text>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i><xsl:text>«</xsl:text><xsl:apply-templates select="tei:title"/><xsl:text>»</xsl:text></i><!-- todo vérifié si ça fonctionne -->
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="tei:editor">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="tei:editor"/>
                    <xsl:if test="tei:editor[@n]">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:editor/@n"/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:date/@when"/>
                </xsl:if>
                <xsl:if test="tei:link">
                    <xsl:text>, </xsl:text>
                    <xsl:variable name="link" select="tei:link/@target"/>
                    <a href="{$link}">URL</a>                    
                </xsl:if>
            </xsl:when>
            <xsl:when test="@type='dossier'">
                <xsl:if test="tei:author">
                    <xsl:apply-templates select="tei:author/tei:forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:author/tei:surname"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@type]">
                        <i>
                            <xsl:text>«</xsl:text><xsl:apply-templates select="tei:title[@type='title']"/>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates select="tei:title[@type='subtitle']"/><xsl:text>»</xsl:text>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i><xsl:text>«</xsl:text><xsl:apply-templates select="tei:title"/><xsl:text>»</xsl:text></i><!-- todo vérifié si ça fonctionne -->
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="tei:editor">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="tei:editor"/>
                    <xsl:if test="tei:editor[@n]">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="tei:editor/@n"/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tei:date/@when"/>
                </xsl:if>
                <xsl:if test="tei:link">
                    <xsl:text>, </xsl:text>
                    <xsl:variable name="link" select="tei:link/@target"/>
                    <a href="{$link}">URL</a>                    
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:title"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

</xsl:stylesheet>
