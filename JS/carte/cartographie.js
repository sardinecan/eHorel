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


var marker = L.marker([43.1166667, 5.933333333333334]).addTo(map);
marker.bindPopup("<a href='#toulon'>Toulon</a>").openPopup();

var marker2 = L.marker([40.6436111, 22.930833333333336]).addTo(map);
marker2.bindPopup("<a href='#Salonique'>Salonique</a>").openPopup();

var marker3 = L.marker([39.5980556, 19.852222222222224]).addTo(map);
marker3.bindPopup("<a href='#Corfou'>Corfou</a>").openPopup();

var marker4 = L.marker([40.1608, 25.8444]).addTo(map);
marker4.bindPopup("<a href='#Imbros'>Imbros</a>").openPopup();

var marker5 = L.marker([39.8747222, 25.270833333333332]).addTo(map);
marker5.bindPopup("<a href='#Moudros'>Moudros</a>").openPopup();

var marker6 = L.marker([39.11, 26.554722222222225]).addTo(map);
marker6.bindPopup("<a href='#Mytilene'>Mytilene</a>").openPopup();

var marker6 = L.marker([39.0883333, 26.48611111111111]).addTo(map);
marker6.bindPopup("<a href='#Port_Iero'>Port Iero</a>").openPopup();

}

$(document).ready(function(){
    InitialiserCarte();
});