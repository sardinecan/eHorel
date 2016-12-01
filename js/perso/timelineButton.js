SimileAjax.DateTime.decrementByInterval = function (date, intervalUnit, timeZone) {
    timeZone = (typeof timeZone == 'undefined') ? 0: timeZone;
    var timeShift = timeZone *
    SimileAjax.DateTime.gregorianUnitLengths[SimileAjax.DateTime.HOUR];
    var date2 = new Date(date.getTime() + timeShift);
    
    switch (intervalUnit) {
        case SimileAjax.DateTime.MILLISECOND:
        date2.setTime(date2.getTime() - 1)
        break;
        case SimileAjax.DateTime.SECOND:
        date2.setTime(date2.getTime() - 1000);
        break;
        case SimileAjax.DateTime.MINUTE:
        date2.setTime(date2.getTime() -
        SimileAjax.DateTime.gregorianUnitLengths[SimileAjax.DateTime.MINUTE]);
        break;
        case SimileAjax.DateTime.HOUR:
        date2.setTime(date2.getTime() -
        SimileAjax.DateTime.gregorianUnitLengths[SimileAjax.DateTime.HOUR]);
        break;
        case SimileAjax.DateTime.DAY:
        date2.setUTCDate(date2.getUTCDate() - 1);
        break;
        case SimileAjax.DateTime.WEEK:
        date2.setUTCDate(date2.getUTCDate() - 7);
        break;
        case SimileAjax.DateTime.MONTH:
        date2.setUTCMonth(date2.getUTCMonth() - 1);
        break;
        case SimileAjax.DateTime.YEAR:
        date2.setUTCFullYear(date2.getUTCFullYear() - 1);
        break;
        case SimileAjax.DateTime.DECADE:
        date2.setUTCFullYear(date2.getUTCFullYear() - 10);
        break;
        case SimileAjax.DateTime.CENTURY:
        date2.setUTCFullYear(date2.getUTCFullYear() - 100);
        break;
        case SimileAjax.DateTime.MILLENNIUM:
        date2.setUTCFullYear(date2.getUTCFullYear() - 1000);
        break;
    }
    
    date.setTime(date2.getTime() - timeShift);
};