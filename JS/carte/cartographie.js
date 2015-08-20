function InitialiserCarte() {
	
    var map = L.map('map').setView([41.508577297439324, 15.64453125], 5);

    // create the tile layer with correct attribution
    var tuileUrl = 'http://{s}.tile.osm.org/{z}/{x}/{y}.png';
    
    var attrib='Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors';
    
    var osm = L.tileLayer(tuileUrl, {
        minZoom: 5, 
        maxZoom: 17,
        attribution: attrib
    });

    osm.addTo(map);

//Toulon
 var marker = L.marker([43.1166667, 5.933333333333334]).addTo(map);
marker.bindPopup('<h3>Toulon</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 2<ul><li><a href="../Toulon/F_delta_1854_20_1_Toulon_8-08-1915.html">08 août 1915</a></li><li><a href="../Toulon/F_delta_1854_20_1_Toulon_29-08-1915.html">29 août 1915</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]})/*ajouter pour ouvrir une popup automatique au chargement de la carte ".openPopup()"*/;
//Salonique
var marker2 = L.marker([40.6436111, 22.930833333333336]).addTo(map);
marker2.bindPopup('<h3>Salonique</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 30<ul><li><a href="../Salonique/F_delta_1854_20_1_Salonique_15-05-1915.html">15 mai 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_16-11-1915.html">16 novembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_23-11-1915.html">23 novembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_30-11-1915.html">30 novembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_07-12-1915.html">07 décembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_14-12-1915.html">14 décembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_17-12-1915.html">17 décembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_20-12-1915.html">20 décembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_27-12-1915.html">27 décembre 1915</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_03-01-1916.html">03 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_07-01-1916.html">07 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_12-01-1916.html">12 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_19-01-1916.html">19 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_24-01-1916.html">24 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_25-01-1916.html">25 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_31-01-1916.html">31 janvier 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_05-02-1916.html">05 février 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_16-02-1916.html">16 février 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_21-02-1916.html">21 février 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_10-03-1916.html">10 mars 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_dateUnk_a05-02_b16-03.html">date inconnue</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_16-03-1916.html">16 mars 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_17-03-1916.html">17 mars 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_22-03-1916.html">22 mars 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_28-03-1916.html">28 mars 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_03-04-1916.html">03 avril 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_09-04-1916.html">09 avril 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_15-04-1916.html">15 avril 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_21-04-1916.html">21 avril 1916</a></li><li><a href="../Salonique/F_delta_1854_20_1_Salonique_27-04-1916.html">27 avril 1916</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]});
//corfou
var marker3 = L.marker([39.5980556, 19.852222222222224]).addTo(map);
marker3.bindPopup('<h3>Corfou</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 1<ul><li><a href="../Corfou/F_delta_1854_20_1_Corfou_04-11-1916.html">04 novembre 1916</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]});
//Imbros
var marker4 = L.marker([40.1608, 25.8444]).addTo(map);
marker4.bindPopup('<h3>Imbros</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 1<ul><li><a href="../Imbros/F_delta_1854_20_1_Imbros_23-09-1915.html">23 septembre 1915</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]});
//Moudros
var marker5 = L.marker([39.8747222, 25.270833333333332]).addTo(map);
marker5.bindPopup('<h3>Moudros</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 1<ul><li><a href="../Moudros/F_delta_1854_20_1_Moudros_03-09-1915.html">03 septembre 1915</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]});
//Mytilene
var marker6 = L.marker([39.11, 26.554722222222225]).addTo(map);
marker6.bindPopup('<h3>Mytilene</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 1<ul><li><a href="../Mytilene/F_delta_1854_20_1_Mytilene_06-10-1915.html">06 octobre 1915</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]});
//port Iero
var marker7 = L.marker([39.0883333, 26.48611111111111]).addTo(map);
marker7.bindPopup('<h3>Port Iero</h3><hr/><ul><li>Destinataire : Madame la Comtesse L. de la Forêst</li><li>Nombre de cartes envoyées : 6<ul><li><a href="../Port_Iero/F_delta_1854_20_1_Port_Iero_09-10-1915.html">09 octobre 1915</a></li><li><a href="../Port_Iero/F_delta_1854_20_1_Port_Iero_20-10-1915.html">20 octobre 1915</a></li><li><a href="../Port_Iero/F_delta_1854_20_1_Port_Iero_27-10-1915.html">27 octobre 1915</a></li><li><a href="../Port_Iero/F_delta_1854_20_1_Port_Iero_dateUnk_a27-10_b3-11.html">date inconnue</a></li><li><a href="../Port_Iero/F_delta_1854_20_1_Port_Iero_03-11-1915.html">03 novembre 1915</a></li><li><a href="../Port_Iero/F_delta_1854_20_1_Port_Iero_10-11-1915.html">10 novembre 1915</a></li></ul></li></ul>', {maxWidth: 300, minWidth: 250, maxHeight: 260, autoPan: true, closeButton: true, autoPanPadding: [5, 5]});


        
    /*var polygon = L.polygon([
    [41.934976, 27.993164],
    [42.065607 , 27.246094],
    [41.943149, 26.641846],
    [41.705728, 26.328735],
    [41.742627, 26.166687],
    [41.701627, 26.07605],
    [41.492635, 26.172867],
    [41.705728, 26.328735],
    [41.354134, 26.132355],
    [41.376809, 23.027344],
    [42.309815, 22.37915],
    [42.867912, 22.670288],
    [43.169129, 23.005371],
    [44.00862, 22.456055],
    [44.048116, 23.03833],
    [43.810747, 22.895508],
    [43.739352, 28.586426],
    [43.365126, 28.520508],
    [43.309191, 28.081055],
    [42.455888, 27.432861],
    [41.967659, 28.048096]    
    ]).addTo(map);*/

}



$(document).ready(function(){
    InitialiserCarte();
});