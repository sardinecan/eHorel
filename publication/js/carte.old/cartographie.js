
var mymap = L.map('mapid').setView([48.692054, 6.184417], 15);
//http://mapwarper.net/maps/tile/13564/{z}/{x}/{y}.png
//https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw
var base1 = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
    maxZoom: 20, attribution: 'Map data ©; OpenStreetMap contributors, ' +
    'CC-BY-SA, ' +
    'Imagery © Mapbox',
    id: 'mapbox.streets'
}).addTo(mymap);