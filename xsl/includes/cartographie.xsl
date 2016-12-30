<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="tei:teiCorpus" mode="cartographie">
        <xsl:result-document format="html" encoding="UTF-8" href="cartographie.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <xsl:copy-of select="$head"/>
                <body onload="InitialiserCarte() ;">
                    <header data-sticky-container="true">
                        <div class="full-width sticky" data-sticky="true" data-options="marginTop:0;">
                            <div class="nav">
                                <div class="title-bar" data-responsive-toggle="menu-responsive" data-hide-for="medium"><button class="menu-icon" type="button" data-toggle="true"><!--button pour foundation responsive--></button><div class="title-bar-title">Menu</div>
                                </div>
                                <div class="top-bar menuCarto" id="menu-responsive">
                                    <div class="top-bar-left">
                                        <ul class="vertical medium-horizontal menu" data-responsive-menu="drilldown medium-dropdown">
                                            <li><a href="http://www.bdic.fr/">BDIC</a></li>
                                            <li><a href="index.html">Accueil</a></li>
                                            <li>
                                                <a href="#" class="subMenu">Correspondance d'Armand Horel</a>
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
                    <div id="mapid">
                        <xsl:comment>carte OSM</xsl:comment>
                    </div>
                    <xsl:result-document format="text" href="js/carte/cartographie.js">
                        var map = L.map('mapid').setView([41.508577297439324, 15.64453125], 6);
                        var base1 = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
                        minZoom: 5, maxZoom: 17, attribution: 'Map data ©; OpenStreetMap contributors, ' +
                        'CC-BY-SA, ' +
                        'Imagery © Mapbox',
                        id: 'mapbox.streets'
                        }).addTo(map);
                        
                        var popupLocation1 = new L.LatLng(41.508577297439324, 15.64453125);
                        
                        var popupContent1 = "<p>Sur cette carte, chaque lettre est géolocalisée en fonction de son lieu d'envoi. Cliquez sur les vignettes pour accéder à la correspondance.</p>",
                        popup1 = new L.Popup();
                        
                        popup1.setLatLng(popupLocation1);
                        popup1.setContent(popupContent1);
                        
                        map.addLayer(popup1);
                        
                        <xsl:for-each select="//tei:place[descendant::tei:geo]">
                            <xsl:variable name="id" select="concat('#',@xml:id)"/>
                            <xsl:text>var marker</xsl:text><xsl:value-of select="normalize-space(@xml:id)"/><xsl:text> = L.marker([</xsl:text><xsl:value-of select=".//tei:geo"/><xsl:text>]).addTo(map);</xsl:text>
                            <xsl:text>marker</xsl:text><xsl:value-of select="normalize-space(@xml:id)"/><xsl:text>.bindPopup('</xsl:text>&lt;span&gt;<xsl:value-of select="./tei:placeName[1]"/>&lt;/span&gt;&lt;hr/&gt;&lt;ul class="no-bullet"&gt;<xsl:for-each select="//tei:correspAction[descendant::tei:placeName[@ref=$id]]"><xsl:sort select="./tei:date/@notBefore"/><xsl:sort select="./tei:date/@when"/><xsl:sort select="./tei:date[not(@notBefore)]"/>&lt;li&gt;&lt;a href="<xsl:value-of select="concat(ancestor::tei:TEI/@xml:id,'.html')"/>"&gt;<xsl:value-of select="./tei:persName[@type='sentBy']"/> à <xsl:value-of select="./tei:persName[@type='deliveredTo']"/>, <xsl:value-of select="./tei:date"/>&lt;/a&gt;&lt;/li&gt;</xsl:for-each>&lt;/ul&gt;<xsl:text>', {</xsl:text>
                            <xsl:text>maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding:[5, 5]});</xsl:text>
                        </xsl:for-each>
                        /*ajouter pour ouvrir une popup automatique au chargement de la carte ".openPopup()";*/
                    </xsl:result-document>
                    <xsl:copy-of select="$js"/>
                    <script src="js/leaflet/leaflet.js"></script>
                    <script src="js/carte/cartographie.js"></script>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>