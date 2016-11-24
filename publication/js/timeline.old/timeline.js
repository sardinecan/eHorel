   var tl;
function onLoad() {
var eventSource = new Timeline.DefaultEventSource();
            var theme = Timeline.ClassicTheme.create();
            theme.event.bubble.width = 600;            

var bandInfos = [
Timeline.createBandInfo({
    eventSource:    eventSource,
    date:           "Sep 01 1915",    
    width:          "50%", 
    intervalUnit:   Timeline.DateTime.MONTH, 
    intervalPixels: 150,
     theme:          theme,
                    layout:         'original'  // original, overview, detailed
}),
Timeline.createBandInfo({
    eventSource:    eventSource,
    date:           "Sep 01 1915",    
    width:          "50%", 
    intervalUnit:   Timeline.DateTime.YEAR, 
    intervalPixels: 250,
    theme:          theme,
                    layout:         'overview'  // original, overview, detailed
    
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
    }, 600);
}
}