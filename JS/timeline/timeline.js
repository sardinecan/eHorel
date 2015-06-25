   var tl;
function onLoad() {
var eventSource = new Timeline.DefaultEventSource();

var bandInfos = [
Timeline.createBandInfo({
    eventSource:    eventSource,
    date:           "Jun 28 1916",

    width:          "55%", 
    intervalUnit:   Timeline.DateTime.MONTH, 
    intervalPixels: 150
}),
Timeline.createBandInfo({
    eventSource:    eventSource,
    date:           "Jun 28 1916",

    width:          "45%", 
    intervalUnit:   Timeline.DateTime.YEAR, 
    intervalPixels: 200
})
  ];
bandInfos[1].syncWith = 0;
bandInfos[1].highlight = true;

tl = Timeline.create(document.getElementById("frise"), bandInfos);
Timeline.loadXML("date.xml", function(xml, url) { eventSource.loadXML(xml, url); });

}

var resizeTimerID = null;
function onResize() {
if (resizeTimerID == null) {
    resizeTimerID = window.setTimeout(function() {
        resizeTimerID = null;
        tl.layout();
    }, 500);
}
}