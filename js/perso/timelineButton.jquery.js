$(document).ready(function () {
    $("#backToBack").click(function () {
        var currentTime = tl.getBand(0).getCenterVisibleDate();
        SimileAjax.DateTime.decrementByInterval(currentTime, SimileAjax.DateTime.MONTH);
        tl.getBand(0).setCenterVisibleDate(currentTime);
    });
    $("#backToFuture").click(function () {
        var currentTime = tl.getBand(0).getCenterVisibleDate();
        SimileAjax.DateTime.incrementByInterval(currentTime, SimileAjax.DateTime.MONTH);
        tl.getBand(0).setCenterVisibleDate(currentTime);
    });
});