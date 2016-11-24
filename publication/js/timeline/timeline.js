var tl;
function onLoad() {
    var eventSource = new Timeline.DefaultEventSource();
    var theme = Timeline.ClassicTheme.create();
    theme.event.bubble.width = 600;
    theme.event.bubble.maxHeight = 300;
    
    var bandInfos =[
    Timeline.createBandInfo({
        eventSource: eventSource,
        date: "1915-05-01",
        width: "80%",
        intervalUnit: Timeline.DateTime.MONTH,
        intervalPixels: 150,
        theme: theme,
        layout: 'original' // original, overview, detailed
    }),
    Timeline.createBandInfo({
        eventSource: eventSource,
        date: "1915-05-01",
        width: "20%",
        intervalUnit: Timeline.DateTime.YEAR,
        intervalPixels: 300,
        theme: theme,
        layout: 'overview' // original, overview, detailed
    })];
    
    bandInfos[1].syncWith = 0;
    bandInfos[1].highlight = true;
    
    for (var i = 0; i < bandInfos.length; i++) {
        bandInfos[i].decorators =[
        new Timeline.SpanHighlightDecorator({
            startDate: "1915-04-25",
            endDate: "1916-01-09",
            color: "#FFE6CC",
            opacity: 50,
            startLabel: "Débarquement<br/>de Gallipoli",
            endLabel: "Évacuation<br/>de Gallipoli",
            //theme: theme,
            cssClass: 't-highlight1'
        }),
        new Timeline.SpanHighlightDecorator({
            startDate: "1915-02-19",
            endDate: "1915-03-18",
            color: "#79BFB3",
            opacity: 50,
            startLabel: "Offensive<br/>navale des<br/>Dardanelles",
            /*endLabel: "Fin de l'offensive navale",*/
            //theme: theme,
            cssClass: 't-highlight1'
        })];
    }
    
    tl = Timeline.create(document.getElementById("tl"), bandInfos);
    Timeline.loadXML("date.xml", function (xml, url) {
        eventSource.loadXML(xml, url);
    });
}


var resizeTimerID = null;
function onResize() {
    if (resizeTimerID == null) {
        resizeTimerID = window.setTimeout(function () {
            resizeTimerID = null;
            tl.layout();
        },
        600);
    }
}