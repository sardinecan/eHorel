<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <!-- RMQ Cette variable générale permet de retrouver les nœuds correspondants lors de l'utilisation conjointe de for-each et tokenize() => la chaine n'étant plus considéré comme un nœud. -->
    <xsl:variable name="root" select="/"/>
    
    <xsl:variable name="head">
        <head>
            <title>Correspondance d'Armand Horel</title>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <!--feuilles de style-->
            <link rel="stylesheet" href="js/leaflet/leaflet.css" />
            <link rel="stylesheet" href="style/foundation/foundation.css" />
            <link rel="stylesheet" type="text/css" href="style/foundation/app.css"/>
            <link rel="stylesheet" href="style/owl/owl.carousel.min.css"/>
            <link rel="stylesheet" href="style/owl/owl.theme.default.min.css"/>
            <script src="js/foundation/vendor/jquery.js"></script>
            <script src="js/owl/owl.carousel.js"></script>
            <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:400,700" rel="stylesheet"/>
        </head>
    </xsl:variable>
    
    <xsl:variable name="header">
        <header class="row">
            <img src="images/photos_site/logo_bdic.gif" alt="logo_BDIC"/>
            <div class="large-12" data-sticky-container="true">
                <div class="nav sticky" data-sticky="true" data-top-anchor="responsive-menu:top" data-margin-top="0">
                    <div class="title-bar" data-responsive-toggle="responsive-menu" data-hide-for="small">
                        <button class="menu-icon" type="button" data-toggle="true"><!--button pour foundation responsive--></button>
                        <div class="title-bar-title">Menu</div>
                    </div>
                    <div class="top-bar" id="responsive-menu">
                        <div class="top-bar-left">
                            <ul class="vertical medium-horizontal menu" data-responsive-menu="drilldown medium-dropdown">
                                <li><a href="http://www.bdic.fr/">BDIC</a></li>
                                <li><a href="index.html">Accueil</a></li>
                                <li>
                                    <a href="F_delta_1854_20_1_Salonique_15-05-1915.html" class="subMenu">Correspondance d'Armand Horel</a>
                                    <ul class="vertical menu">
                                        <li><a href="chronologie.html">Accès chronologique</a></li>
                                        <li><a href="thematiques.html">Accès thématique</a></li>
                                        <li><a href="cartographie.html">Accès géographique</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="top-bar-right">
                            <ul class="menu" data-responsive-menu="drilldown medium-dropdown">
                                <li><a href="index_edition.html">Index</a></li>
                                <li><a href="edition.html">À propos de l'édition</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </xsl:variable>
    
    <xsl:variable name="headerSlide">
        <div class="row">
            <div class="large-12">
                <div class="orbit" role="region" aria-label="header" data-orbit="true">
                    <ul class="orbit-container">
                        <button class="orbit-previous"><!--<span class="show-for-sr">Previous Slide</span>-->&#9664;&#xFE0E;</button>
                        <button class="orbit-next"><!--<span class="show-for-sr">Next Slide</span>-->&#9654;&#xFE0E;</button>
                        <li class="is-active orbit-slide">
                            <img class="imgHeader" src="images/photos_site/slide_14_18_1.jpg" alt="header"/>
                            <figcaption class="orbit-caption">Pouzargues, Lucien P. <i>Craonne</i>, 1917. Peinture réalisée en 1938. © Pouzargues</figcaption>
                        </li>
                        <li class="orbit-slide">
                            <img class="imgHeader" src="images/photos_site/slide_14_18_2.jpg" alt="header"/>
                            <figcaption class="orbit-caption">Anonyme, <i>Alerte au gaz avec le Klakson</i>, Positif stéréoscopique sur plaque de verre [1914-18].</figcaption>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </xsl:variable>
    
    <xsl:variable name="footer">
        <footer class="row border">
            <div class="small-12 medium-12 large-6 columns">
                <div class="block_footer_img">
                    <a href="http://www.bdic.fr/"><img style="margin-top:5px;" src="images/photos_site/logo_bdic.gif" alt="logo_BDIC"/></a>
                    <a href="http://www.u-paris10.fr/"><img style="margin-top:5px;" src="images/photos_site/paris_ouest.png" alt="logo_Paris_Ouest"/></a>
                    <a href="http://www.u-plum.fr/"><img style="margin-top:5px;" src="images/photos_site/paris_lumieres.png" alt="logo_Paris_Lumiere"/></a>
                </div>
            </div>
            <div class="small-12 medium-12 large-6 columns">
                <div class="row">
                    <div class="small-6 medium-6 large-6 columns">
                        <div class="block_footer">
                            <b>La bibliothèque</b>
                            <ul class="no-bullet link">
                                <li>Site de Nanterre</li>
                                <li>6, allée de l'Université</li>
                                <li>F-92001 Nanterre Cedex</li>
                            </ul>
                        </div>
                    </div>
                    <div class="small-6 medium-6 large-6 columns">
                        <div class="block_footer">
                            <b>Le musée</b>
                            <ul class="no-bullet link">
                                <li>Site de Paris</li>
                                <li>Hôtel national des Invalides</li>
                                <li>129, rue de Grenelle 75007 Paris</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--<div class="row">
                    <div class="large-12 text-right">
                        <a class="lien_footer" href="credits.html">Crédits</a>
                    </div>
                </div>-->
            </div>
        </footer>
    </xsl:variable>
    
    <xsl:variable name="js">
        <script>
            var owl = $('.owl-carousel');
            owl.owlCarousel({
            items:1,
            margin:10,
            autoHeight:true,
            loop:true,
            autoplay:true,
            autoplayTimeout:3000,
            autoplayHoverPause:true,
            nav:true
            })
        </script>
        <script src="js/perso/timelineButton.js"></script>
        <script src="js/perso/timelineButton.jquery.js"></script>
        <script src="js/foundation/vendor/what-input.js"></script>
        <script src="js/foundation/vendor/foundation.min.js"></script>
        <script src="js/foundation/app.js"></script>
        <script src="js/perso/tooltip.js"></script>
    </xsl:variable>
    
</xsl:stylesheet>