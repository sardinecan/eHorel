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
                <meta http-equiv="Content-Type" content="text/html;charset=UTF8"/>
                <link rel="stylesheet" type="text/css" href="../../STYLE/bootstrap/css/bootstrap.css"/>
                <link rel="stylesheet" type="text/css" href="../../STYLE/personnalisation/style.css"/>                
                <script src="../../JS/js/jquery.js">//</script>
                <script src="../../STYLE/bootstrap/js/bootstrap.min.js">//</script>                                                                                    
            </head>
            <body style="text-align:justify; background-image:url(../../STYLE/images/BACKGROUND_01.jpg)">
                <div class="container" style="background-color: rgb(52,162,177);">                                                 
                    <header>
                        <div class="row">
                            <img src="../../STYLE/images/header.jpg" alt="header" class="img-responsive center-block"/>
                        </div>
                        <nav class="navbar-default" style="background-color: rgb(52,162,177);">
                            <div class="container-fluid">
                                <!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>      
                                </div>
                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">        
                                        <li><a href="#">Accueil</a></li>
                                        <li><a href="#">Correspondance</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color: rgb(52,162,177);">Index/Glossaire<span class="caret"></span></a>
                                            <ul class="dropdown-menu" style="background-color: rgb(52,162,177);">
                                                <li><a href="#">Personnes</a></li>
                                                <li><a href="#">Lieux</a></li>
                                                <li><a href="#">Glossaire</a></li>            
                                            </ul>
                                        </li>
                                        <li><a href="#">A propos de l'édition</a></li>
                                    </ul>          
                                </div><!-- /.navbar-collapse -->
                            </div><!-- /.container-fluid -->
                        </nav>
                    </header>
                </div>
                <div class="container">
                    <!--<xsl:apply-templates select="//tei:teiHeader"/>-->                    
                    <div class="row" style="border:1px solid #ddd; background-color:white;">                        
                        <div class="col-lg-2" style="text-align:left;">
                            <h3 style="font-size:11pt;"><a href="#a mettre en place" name="presentation">Correspondance d'Armand Horel</a></h3>
                            <ul style="list-style:none; padding-left:0;">
                                <xsl:apply-templates select="//tei:ref[@type='context']" mode="lien"/>
                            </ul>                            
                        </div>
                        <div class="col-sm-9 col-md-9 col-lg-7" style="border-left:1px solid #ddd;border-right:1px solid #ddd;">
                            <div class="row">
                                <xsl:choose><!-- Permet de maintenir la superposition des blocs même  lorsque que la carte est la première ou la dernière -->
                                    <xsl:when test="//tei:ref[@type='previous'] and //tei:ref[@type='next']">
                                        <div class="col-lg-3"><!-- alignement des blocs -->
                                            <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>
                                        </div>
                                        <div class="col-lg-3 col-lg-offset-6" style="text-align:right;"><!-- alignement des blocs -->
                                            <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="//tei:ref[@type='previous']">
                                            <div class="col-lg-12"><!-- alignement des blocs -->
                                                <xsl:apply-templates select="//tei:ref[@type='previous']" mode="lien"/>
                                            </div>
                                        </xsl:if>                                            
                                        <xsl:if test="//tei:ref[@type='next']">  <!-- alignement des blocs -->                                          
                                            <div class="col-lg-3 col-lg-offset-9" style="text-align:right;">
                                                <xsl:apply-templates select="//tei:ref[@type='next']" mode="lien"/>
                                            </div>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>   
                            <div class="row"><!-- Si vide les facsimiles se retrouvent sous le corps du texte -->                               
                                <div class="col-lg-10 col-lg-offset-1">
                                    <div style="border:1px solid; border-radius:5px; box-shadow: 3px 3px 3px #656565; margin:10px; padding:10px;"><h1 style="font-size:11pt">
                                        <xsl:apply-templates select="//tei:correspDesc"/>
                                    </h1>
                                    <xsl:choose>
                                        <xsl:when test="//tei:div[@type='enveloppe']">
                                            <xsl:apply-templates select="//tei:div[@type='enveloppe']"/>
                                        </xsl:when>
                                        <xsl:when test="//tei:address[@n='1']">
                                            <i>(destinataire) :</i>
                                            <br/>
                                            <xsl:apply-templates select="//tei:address[@n='1']" mode="affichage"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    </div>                                                                        
                                </div>
                                
                            </div>        
                            <div class="row">
                                <div class="col-lg-12">
                                    <xsl:apply-templates select="//tei:div[@type='letter']"/>                                            
                                    <xsl:apply-templates select="//tei:add[@type='closer']" mode="ordreLecture"/>
                                </div>
                            </div><!-- ajouter xsl if note closer et / ou tei:back [@note] -->
                            <div class="row">                    
                                <dir class="col-lg-12">
                                    <hr/>                                                    
                                    <xsl:apply-templates select="//tei:add[@type='closer']" mode="note"/></dir>               
                            </div>
                        </div>                     
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3" style="text-align:left;">
                            <xsl:apply-templates select="//tei:teiHeader" mode="aside"/>
                            <xsl:apply-templates select="//tei:pb" mode="affichage"/>                                                                                        
                        </div>                    
                    </div>                                                                        
                </div>
            </body>
        </html>
    </xsl:template>
    <!--TEIHEADER-->
    <xsl:template match="tei:teiHeader">
        <xsl:apply-templates select="tei:fileDesc"/>
        <xsl:apply-templates select="tei:encodingDesc"/>
        <xsl:apply-templates select="tei:profileDesc"/>
    </xsl:template>
    <xsl:template match="tei:teiHeader" mode="aside">
        <b>
            <xsl:apply-templates select="//tei:title[1]"/>
        </b>
        <hr/>
        <xsl:text>cote : </xsl:text><xsl:apply-templates select="//tei:idno"/>
        <br/>
        <xsl:apply-templates select="//tei:repository"/>   
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
        <xsl:for-each select="tei:correspAction[@type='sent']">
            <xsl:text>Correspondance envoyée par </xsl:text>
            <xsl:value-of select="tei:persName"/>
            <xsl:text> à partir de </xsl:text>
            <xsl:value-of select="tei:placeName"/>
            <xsl:text> le </xsl:text>
            <xsl:value-of select="tei:date"/>
        </xsl:for-each>
        <xsl:text> à </xsl:text>
        <xsl:for-each select="tei:correspAction[@type='received']">
            <xsl:value-of select="tei:persName"/>
        </xsl:for-each>
        <xsl:text>.</xsl:text>
        <br/>        
    </xsl:template>
    <xsl:template match="tei:correspDesc//tei:ref" mode="lien">
        <xsl:variable name="lien" select="replace(@target,'xml','html')"/>
        <xsl:choose>
            <xsl:when test="@type='previous'">
                <a name="precedent" href="{$lien}">Précédente</a>
            </xsl:when>
            <xsl:when test="@type='next'">
                <a name="suivant" href="{$lien}">Suivante</a>
            </xsl:when>
            <xsl:when test="@type='context'">
                <xsl:for-each select=".">
                    <li><a style="font-size:9pt;" name="suivant" href="{$lien}"><xsl:value-of select="tei:placeName"/><xsl:text> </xsl:text> <xsl:value-of select="tei:date"/></a></li>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>                    
    </xsl:template>
    <!-- Voir pour faire un lien avec les correspContext -->
    
    <!-- BODY -->
    <xsl:template match="tei:div[@type='letter']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- supprime toutes les figures enfants de letter (pour les cartes postales) -->
    <xsl:template match="tei:div[@type='letter']/tei:figure"/>
    <xsl:template match="tei:div[@type='letter']/tei:pb" mode="affichage">
        <xsl:for-each select=".">
            <xsl:variable name="image" select="@facs"/>
            <img src="{$image}" alt="image" class="img-responsive center-block"/>
        </xsl:for-each>
    </xsl:template>
    <!-- Opener -->
    <xsl:template match="tei:opener/tei:dateline">
        <p style="text-align:right;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:opener/tei:salute">
        <p style="text-align:center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Closer / Postscript / add@type='closer' -->
    <xsl:template match="tei:closer/tei:salute">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:signed">
        <p style="text-align:center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:postscript">
        <xsl:choose>
            <xsl:when test="@n='1'">
                <p>                
                    <xsl:text>[PS:]</xsl:text>                
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>                
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='closer']"/>
    
    <xsl:template match="tei:text//tei:add[@type='closer']" mode="ordreLecture">
        <xsl:variable name="pos">
            <xsl:number count="tei:add[@type='closer']" level="any" from="tei:div[@type='letter']" format="a"/>
        </xsl:variable>
        <xsl:variable name="infobulle" select="normalize-space(.)"/>
        <p>
            <xsl:apply-templates/>        
            <a name="appelnote{$pos}" href="#textenote{$pos}" title="{$infobulle}">            
                <sup>                
                    <xsl:value-of select="$pos"/>            
                </sup>            
            </a>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:add[@type='closer']" mode="note">
        <xsl:choose>
            <xsl:when test="parent::tei:sic | parent::tei:orig | parent::tei:surplus"/>
            <xsl:otherwise>
                <xsl:variable name="pos">
                    <!--<xsl:number count="tei:add[@type='closer'] | tei:add[@type='normal'] | tei:postscript//tei:add | tei:closer//tei:add" level="any" from="tei:div[@type='letter']" format="a"/>-->
                    <xsl:number count="tei:add[@type='closer']" level="any" from="tei:div[@type='letter']" format="a"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="@place='margin-top'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à la verticale dans la marge droite de la carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-right' and @rend='vertical'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à la verticale dans la marge droite de la carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-top' and @rend='rotate'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à l'envers en haut de carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-left' and @rend='vertical'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à la verticale dans la marge gauche de la carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="@place='margin-bottom' and @rend='rotate'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouté à l'envers en bas de carte :
                            </xsl:text>
                            <xsl:value-of select="@n"/>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>
                    <!--<xsl:when test="@place='above'">
                        <xsl:variable name="note">
                            <xsl:text>
                                Texte ajouter dans l'interligne.
                            </xsl:text>
                        </xsl:variable>
                        <a name="textenote{$pos}" href="#appelnote{$pos}">  
                            <xsl:value-of select="$pos"/>                            
                        </a>
                        <xsl:value-of select="$note"/>
                        <br/>
                    </xsl:when>-->
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:pb[@type='postcardBreak']">
        <hr/>        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='letter']/tei:p[position()!=last()]">  
        <p>
            <xsl:apply-templates/>            
        </p>                    
    </xsl:template>
    <xsl:template match="tei:div[@type='letter']/tei:p[position()=last()]">  
        <p>
            <xsl:apply-templates/>            
        </p>          
    </xsl:template>
    <!--<xsl:template match="tei:text//tei:pb[following::tei:p[1]]">
        <hr/>
    </xsl:template>-->
    <!--
    expression xpath tous les p qui suivent un pb //pb/following::p[1] => 
    le faire avec les p -->
    
    <xsl:template match="tei:div[@type='enveloppe']">        
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='enveloppe']//tei:address">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates/>
            <xsl:for-each select="tei:del">
                <span style="text-decoration:line-through;"><xsl:value-of select="."/></span>
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
    
    <xsl:template match="tei:div[@type='letter']//tei:persName | tei:div[@type='letter']//tei:placeName | tei:div[@type='letter']//tei:name">
        <xsl:variable name="ref">
            <xsl:value-of select="@ref"/>
        </xsl:variable>
        <xsl:variable name="id"><!-- todo Pose faire xsl choose pose problème lors que répétition des noms avec absence xml id l'idi n'a pas de valeur -->
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:variable name="def" select="replace(@ref,'#','')"/>
        <xsl:variable name="defi" select="//tei:person[@xml:id=$def]/tei:persName"/>
        
        <a href="{$ref}" id="{$id}" title="{$defi}"><xsl:apply-templates/><sup>*<span><xsl:value-of select="$defi"></xsl:value-of></span></sup></a>
    </xsl:template>    
    

    
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[1]">
        <div class="row">
            <xsl:choose>
                <xsl:when test="tei:address and tei:stamp">
                    <div class="col-lg-6">                 
                        <p>                
                            <i>(Destinataire :)</i>                            
                            <br/>                            
                            <xsl:apply-templates select="tei:address"/>                
                            <br/>                    
                            <xsl:if test="tei:add[@hand='other']">
                                <i>(D'une autre main :)</i>
                                <br/>
                                <xsl:apply-templates select="tei:add[@hand='other']"/>
                            </xsl:if>                
                        </p>
                    </div>        
                    <div class="col-lg-6">            
                        <xsl:apply-templates select="tei:stamp"/>        
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="col-lg-12">
                        <p>                
                            <i>(Destinataire :)</i>                            
                            <br/>                            
                            <xsl:apply-templates select="tei:address"/>                
                            <br/>                    
                            <xsl:if test="tei:add[@hand='other']">
                                <i>(D'une autre main :)</i>
                                <br/>
                                <xsl:apply-templates select="tei:add[@hand='other']"/>
                            </xsl:if>                
                        </p>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
            
        </div>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']/tei:pb">
        <p>        
            <i>(Au dos :)</i>
        </p>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']/tei:p[2]">
        <div class="row">
        <xsl:choose>
            <xsl:when test="tei:address and tei:stamp">
                <div class="col-lg-6">
                    <i>(Expéditeur :)</i>
                    <br/>
                    <xsl:apply-templates select="tei:address"/>
                </div>
                <div class="col-lg-6">
                    <xsl:apply-templates select="tei:stamp"/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="col-lg-12">
                    <xsl:apply-templates select="tei:address"/>
                </div>
            </xsl:otherwise>
        </xsl:choose>                
        </div>
    </xsl:template>
    <xsl:template match="tei:div[@type='enveloppe']//tei:stamp">
        <xsl:choose>
            <xsl:when test="@type='armee'">              
                <i>(Cachet militaire :)</i>
                <br/>
                <xsl:apply-templates/>
                <br/>
            </xsl:when>
            <xsl:when test="@type='postmark'">
                <i>(Cachet postal :)</i>
                <br/>
                <xsl:apply-templates/>
                <br/>
            </xsl:when>
            <xsl:otherwise>
                <i>(cachet :)</i>
                <br/>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:div[@type='letter']//tei:address[@n]"/>
    <xsl:template match="tei:div[@type='letter']//tei:address[@n]" mode="affichage">
        <xsl:for-each select="tei:addrLine | tei:persName">
            <xsl:apply-templates/>
            <xsl:for-each select="tei:del">
                <span style="text-decoration:line-through;"><xsl:value-of select="."/></span>
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
   
    <xsl:template match="tei:w[@rend='hyphen']">
        <xsl:apply-templates/>
        <xsl:text>-</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:w[@rend='aggl']">
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='capitalize'">
                <span style="text-transform:uppercase;">
                    <xsl:apply-templates/>
                </span>        
            </xsl:when>
            <xsl:when test="@rend='super'">
                <span style="vertical-align:super; font-size:50%">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='minimize'">
                <span style="text-transform:lowercase;">
                    <xsl:apply-templates/>
                </span>
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

    

</xsl:stylesheet>
