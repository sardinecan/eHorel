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
                <div class="row border">                    
                    <div class="medium-12 large-9 columns">
                       <div class="row">
                           <img src="../../STYLE/images/slide_14_18_1.jpg" alt="header"/>
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
                <div class="row border">                                                                                            
                    <!-- Colonne de Gauche / "Context" -->                       
                    <div class="medium-2 large-2 columns text-left">                                        
                        <h3>Correspondance envoyée à partir de <xsl:apply-templates select="//tei:correspAction[@type='sent']/tei:placeName"/></h3>                                                
                        <ul class="context">                                                
                            <xsl:apply-templates select="//tei:ref[@type='context']" mode="lien"/>                                                        
                        </ul>                                                                            
                    </div>                                        
                    <!-- Colonne milieu -->                    
                    <!-- Liens next-previous -->                    
                    <div class="medium-10 large-7 columns border">                                                                                
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
                                    <div class="col-lg-12"><!-- alignement des blocs -->                                                                        
                                        <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>                                                                                
                                    </div>                                                                        
                                </xsl:if>                                                                                                            
                                <xsl:if test="//tei:ref[@type='next']">  <!-- alignement des blocs --> <!-- todo -->                                                                                       
                                    <div class="col-lg-3 col-lg-offset-9 text-right">                                                                        
                                        <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>                                                                                
                                    </div>                                                                        
                                </xsl:if>                                                                
                            </xsl:otherwise>                                                       
                        </xsl:choose>                        
                        <!-- Corps de la lettre -->                        
                        <!-- adresse -->                                                                                                                                                                                                                                       
                        <xsl:choose>                                                               
                            <xsl:when test="//tei:div[@type='enveloppe']">                                                                    
                                <div class="row">                                                                        
                                    <div class="medium-10 large-10 medium-centered large-centered columns adresse">                                                                            
                                        <xsl:apply-templates select="//tei:div[@type='enveloppe']"/>                                                                                
                                    </div>                                                                                
                                </div>                                                                       
                            </xsl:when>                                                                    
                            <xsl:when test="//tei:address[@place='postcard' and @type='addressee']">                                                        
                                <div class="row">                                                                
                                    <div class="medium-10 large-10 medium-centered large-centered columns adresse">                                    
                                        <i>(destinataire) :</i>                                                                                                                                                   
                                        <hr class="hr_separation"/>                                                                                                                            
                                        <p class="mention_adresse"><xsl:apply-templates select="(//tei:address[@type='addressee' and @place='postcard'])[1]" mode="affichage"/></p>                                        
                                    </div>                                                                            
                                </div>                                                                
                            </xsl:when>                            
                            <xsl:when test="//tei:address[@place='back' and @type='addressee']">                                                        
                                <div class="row">                                                                
                                    <div class="large-10 large-centered columns adresse">                                    
                                        <i>(destinataire) :</i>                                                                                                                                                   
                                        <hr class="hr_separation"/>                                                                                                                            
                                        <p class="mention_adresse"><xsl:apply-templates select="(//tei:address[@type='addressee' and @place='back'])[1]" mode="affichage"/></p>                                        
                                    </div>                                                                            
                                </div>                                                                
                            </xsl:when>                                                        
                            <xsl:otherwise/>                                                        
                        </xsl:choose>                                                                                                                                                     
                        <div class="row">                                                       
                            <div class="large-12">                                                        
                                <xsl:apply-templates select="//tei:div[@type='letter']"/>                                                                                                            
                                <xsl:apply-templates select="//tei:add[@type='closer']" mode="ordreLecture"/>                                
                                <xsl:apply-templates select="//tei:add[@type='postscript']" mode="ordreLecture"/>   <!-- todo note pour les add type postscript -->                                                             
                            </div>                            
                        </div>                            <!-- ajouter xsl if note closer et / ou tei:back [@note] -->                                                    
                        <div class="row">                                                                         
                            <div class="large-12">                            
                                <hr class="hr_note"/>                                                                                                                  
                                <xsl:apply-templates select="//tei:div[@type='note']" mode="note"/>                                
                            </div>                                                                       
                        </div>                                               
                    </div>                    
                    <div class="medium-12 large-3 columns asideDroit">                                            
                        <h3>Cliquez sur les images pour consulter l'intégralité du fonds numérisé.</h3>                        
                        <xsl:apply-templates select="//tei:pb" mode="affichage"/>                                                                                                                                
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
            <xsl:value-of select="tei:correspAction[@type='sent']/tei:persName"/>        
            <br/>        
            <span class="smallcaps">Lieu : </span>        
            <xsl:value-of select="tei:correspAction[@type='sent']/tei:placeName"/>         
            <br/>        
            <span class="smallcaps">Date : </span>        
            <xsl:value-of select="tei:correspAction[@type='sent']/tei:date"/>        
            <br/>                
            <span class="smallcaps">Destinataire : </span>                    
            <xsl:value-of select="tei:correspAction[@type='received']/tei:persName"/> <!-- todo prévoire si plusieur destinataire. -->
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
            <xsl:when test="@type='context'">
                <xsl:for-each select=".">
                    <li><a class="link" href="{$lien}"><xsl:value-of select="tei:date"/></a></li>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>                    
    </xsl:template>
    <!-- Voir pour faire un lien avec les correspContext -->
    
    <!-- && BODY -->
    <xsl:template match="tei:div[@type='letter']">        
            <xsl:apply-templates/>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='sender' and @place='envelope']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='addressee' and @place='envelope']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='addressee' and @place='back']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='sender' and @place='back']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type='addressee' and @place='postcard']"/>
    
    <xsl:template match="tei:div[@type='letter']//tei:closer//tei:address[@type='sender']//tei:addrLine">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']//tei:address[@type]" mode="affichage">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates/>
            <xsl:for-each select="tei:del">
                <span class="del"><xsl:value-of select="."/></span>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="position()!= last()">
                    <xsl:text>,</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <br/>
        </xsl:for-each>        
    </xsl:template>    
    
    <xsl:template match="tei:text//tei:choice">
        <xsl:apply-templates select="tei:reg | tei:corr | tei:expan"/>
    </xsl:template>
    
    <xsl:template match="tei:w[@type='compose']/tei:lb">                
        <xsl:text>-</xsl:text>
    </xsl:template>
    
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
    
    <xsl:template match="tei:text//tei:supplied[@reason='omitted']">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='missing'">
                <p/>
                <i>[...]</i>
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
    
    <xsl:template match="tei:div[@type='letter']//tei:persName | tei:div[@type='letter']//tei:placeName | tei:div[@type='letter']//tei:name[@type='navire'] | tei:div[@type='letter']//tei:name[@type='entree'] | tei:div[@type='letter']//tei:rs[@type='person']
        | tei:div[@type='enveloppe']//tei:placeName | tei:div[@type='enveloppe']//tei:persName | tei:div[@type='enveloppe']//tei:name[@type='navire']
        ">
        <xsl:choose>
            <xsl:when test="@xml:id">
                <xsl:variable name="ref">
                    <xsl:value-of select="concat('../projet/glossaire.html',@ref)"/>
                </xsl:variable>
                <xsl:variable name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:variable>
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <a href="{$ref}" id="{$id}" class="glossary"><xsl:apply-templates/><span><xsl:value-of select="$defi"/></span></a>
            </xsl:when>
            <xsl:otherwise>                                    
                <xsl:variable name="ref">
                    <xsl:value-of select="concat('../projet/glossaire.html',@ref)"/>
                </xsl:variable>
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <a href="{$ref}" class="glossary"><xsl:apply-templates/><span><xsl:value-of select="$defi"/></span></a>
            </xsl:otherwise>
        </xsl:choose>
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
    
    <xsl:template match="//tei:list[@xml:id='glossaire']//tei:label" mode="survol">
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
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName" mode="survol">
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
                </xsl:if>-->   
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//tei:listPlace[@xml:id='place']/tei:place/tei:placeName" mode="survol">
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
            <xsl:when test="tei:address[@type='sender']">
                <p class="text-center">
                    <xsl:apply-templates select="tei:address/tei:persName"/>
                </p>
                <p class="text-left">
                    <xsl:apply-templates select="tei:address/tei:addrLine"/>
                </p>     
            </xsl:when>
            <xsl:when test="tei:add">
                <p class="text-center">
                    <xsl:apply-templates select="tei:add/tei:persName"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p class="text-center">
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
            <p class="text-center">
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
            <xsl:apply-templates/>
            <xsl:for-each select="tei:del">
                <span class="del">
                    <xsl:apply-templates/>
                </span>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="position()!= last()">
                    <xsl:text>,</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <br/>
        </xsl:for-each>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[1]">
        <div class="row text-left">
            <xsl:choose>
                <xsl:when test="tei:address[@type='addressee' and @place='envelope'] and tei:stamp">
                    <div class="large-6 columns">                                                         
                        <i>(Destinataire :)</i>                            
                        <hr class="hr_separation"/>                            
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='addressee' and @place='envelope']"/></p>                
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
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='addressee' and @place='envelope']"/></p>                                            
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
    <xsl:template match="tei:div[@type='enveloppe']/tei:pb">
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
                <xsl:when test="tei:address[@type='sender' and @place='envelope'] and tei:stamp">                
                    <div class="large-6 columns">                    
                        <i>(Expéditeur :)</i>                    
                        <hr class="hr_separation"/>                    
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='sender' and @place='envelope']"/></p>                
                    </div>                
                    <div class="large-6 columns">                    
                        <xsl:apply-templates select="tei:stamp"/>                
                    </div>            
                </xsl:when>            
                <xsl:otherwise>                
                    <div class="large-12 columns">                    
                        <p class="mention_adresse"><xsl:apply-templates select="tei:address[@type='sender' and @place='envelope']"/></p>                
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
    <xsl:template match="tei:div[@type='letter']/tei:pb" mode="affichage">
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
    
    <xsl:template match="tei:div[@type='note']//tei:persName | tei:div[@type='note']//tei:placeName | tei:div[@type='note']//tei:name[@type='navire'] | tei:div[@type='note']//tei:rs[@type='person']">
        <xsl:choose>
            <xsl:when test="@xml:id">
                <xsl:variable name="ref">
                    <xsl:value-of select="concat('../projet/glossaire.html',@ref)"/>
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
                    <xsl:value-of select="concat('../projet/glossaire.html',@ref)"/>
                </xsl:variable>
                <xsl:variable name="def" select="replace(@ref,'#','')"/>
                <xsl:variable name="defi">
                    <xsl:apply-templates select="//tei:person[@xml:id=$def]/tei:persName | //tei:item[@xml:id=$def]//tei:label | //tei:place[@xml:id=$def]/tei:placeName" mode="survol"/>
                </xsl:variable>                
                <a href="{$ref}" class="glossary"><xsl:apply-templates/><span><xsl:value-of select="$defi"></xsl:value-of></span></a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
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
