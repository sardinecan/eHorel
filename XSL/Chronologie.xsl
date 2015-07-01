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
                    Correspondance d'Armand Horel
                </title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />    
                <link rel="stylesheet" href="../../STYLE/foundation/css/foundation.css" />
                <link rel="stylesheet" type="text/css" href="../../STYLE/personnalisation/style.css"/>
                <script src="../../STYLE/foundation/js/vendor/modernizr.js">//</script>
                <script src="../../JS/js/jquery.js">//</script>
                <script src="../../JS/timeline/timeline.js">//</script>
                <script src="http://simile.mit.edu/timeline/api/timeline-api.js" type="text/javascript">//</script>                                                                                   
            </head>
            <body onload="onLoad();" onresize="onResize();">                                                                                     
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
                        <h2>Accès chronologique</h2>                        
                        <div id="frise"></div>                         
                    </div>
                    <div class="large-12 columns">
                        <h4>Selectionnez une correspondance :</h4>
                        <xsl:apply-templates select="//tei:correspDesc[@type='sommaire']"/>
                    </div>
                </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../../STYLE/foundation/js/vendor/jquery.js">//</script>
                <script src="../../STYLE/foundation/js/foundation.min.js">//</script>
                <script>$(document).foundation();</script>
            </body>        
        </html>    
    </xsl:template>
      
    <xsl:template match="//tei:correspDesc[@type='sommaire']">
      <xsl:for-each select="tei:correspContext">
          <div class="row">
              <h3 style="margin-left:20px;">                  
                  <xsl:variable name="ref" select="../tei:correspAction[@type='sent']/tei:placeName/@ref"/>
                  <xsl:variable name="placeName" select="replace($ref,'#','')"/>
                  <xsl:variable name="date" select="../tei:correspAction/tei:date/(@from | @when)"/>
                  <xsl:attribute name="id" select="concat($placeName,$date)">                  
                  </xsl:attribute>
                  <xsl:value-of select="../tei:correspAction[@type='sent']/tei:placeName"/>
                  <xsl:text> </xsl:text>
                  <small>
                      <xsl:choose>                      
                          <xsl:when test="../tei:correspAction/tei:date/@from">
                              <xsl:variable name="date" select="../tei:correspAction/tei:date/(@from | @when)"/>
                              <xsl:variable name="dateDebut" select="format-date($date, '[D01] [MNn] [Y]','fr',(),())"/>
                              <xsl:value-of select="$dateDebut"/>
                              <xsl:text> &#x2014; </xsl:text>
                              <xsl:variable name="dateFin" select="format-date(../tei:correspAction/tei:date/@to, '[D01] [MNn] [Y]','fr',(),())"/>
                              <xsl:value-of select="$dateFin"/>
                          </xsl:when>
                          <xsl:otherwise>
                              <xsl:variable name="date" select="../tei:correspAction/tei:date/(@from | @when)"/>
                              <xsl:variable name="dateFormat" select="format-date($date, '[D01] [MNn] [Y]','fr',(),())"/>
                              <xsl:value-of select="$dateFormat"/>
                          </xsl:otherwise>
                      </xsl:choose>
                  </small>
              </h3>
              <hr/>
              <div class="large-5 small-5 large-offset-1 columns">
                  <xsl:variable name="nombre" select="count(tei:ref)"/>
                  <ul class="list2">
                      <li>
                          <xsl:text>Destinataire : </xsl:text>                                                       
                          <xsl:value-of select="../tei:correspAction[@type='received']/tei:persName"/>                          
                      </li>
                      <li>
                          <xsl:text>Nombre de cartes envoyées : </xsl:text> <xsl:value-of select="$nombre"/>
                      </li>
                  </ul>                                                      
              </div>
              <div class="large-4 small-4 large-offset-2 columns">
                  <ul class="list">
                      <xsl:for-each select="tei:ref">
                          <li>
                              <xsl:element name="a">
                                  <xsl:variable name="target">
                                      <xsl:value-of select="replace(@target,'xml','html')"></xsl:value-of>
                                  </xsl:variable> 
                                  <xsl:attribute name="href" select="$target"></xsl:attribute>                  
                                  <xsl:value-of select="tei:date"/>
                              </xsl:element>                                           
                          </li>
                      </xsl:for-each>
                  </ul>
              </div>
          </div>
      </xsl:for-each>
  </xsl:template>      
</xsl:stylesheet>