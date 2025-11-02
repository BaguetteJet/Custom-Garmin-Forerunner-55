import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Communications;

class RetroWatchFaceView extends WatchUi.WatchFace {

    var colours as Array<Graphics.ColorValue>;
    var pix;
    var height;

    function initialize() {
        WatchFace.initialize();
        colours = [Graphics.COLOR_BLACK, Graphics.COLOR_RED, Graphics.COLOR_GREEN, Graphics.COLOR_YELLOW, Graphics.COLOR_DK_BLUE, Graphics.COLOR_PINK, Graphics.COLOR_BLUE, Graphics.COLOR_WHITE];
        pix = (System.getDeviceSettings().screenWidth*0.05).toNumber();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc) {

        var currentTime = getTime();
        var upperText = ActivityMonitor.getInfo().steps;
        var lowerText = "Hello World";

        var colour1 = Graphics.COLOR_WHITE;
        var colour2 = Graphics.COLOR_BLACK;
        var colour3 = Graphics.COLOR_BLUE;
        var colour4 = Graphics.COLOR_DK_BLUE;

        if (System.getDeviceSettings().notificationCount > 0) {
            colour1 = Graphics.COLOR_BLACK;
            colour2 = Graphics.COLOR_WHITE;
            colour3 = Graphics.COLOR_DK_BLUE;
            colour4 = Graphics.COLOR_BLUE;
        }

        if (System.getSystemStats().battery < 20) {colour3 = Graphics.COLOR_RED;}

        dc.setColor(colour2, colour2);
        dc.clear();

        dc.setColor(colour1, Graphics.COLOR_TRANSPARENT);

        // Display Time
        dc.drawText(
            dc.getWidth()/2,
            dc.getHeight()/3.1,
            Graphics.FONT_NUMBER_MEDIUM,
            currentTime,
            Graphics.TEXT_JUSTIFY_CENTER
        );
        // Display Lower Text
        dc.drawText(
            dc.getWidth()/2,
            dc.getHeight()/1.5,
            Graphics.FONT_MEDIUM,
            lowerText,  
            Graphics.TEXT_JUSTIFY_CENTER
        );
        // Display Upper Text
        dc.drawText(
            dc.getWidth()/2,
            dc.getHeight()/8,
            Graphics.FONT_XTINY,
            upperText,
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // 8-Bit colour boxes
        for (var i = 0; i < 8; i++) {
            dc.setColor(colours[i], Graphics.COLOR_TRANSPARENT);
            dc.fillRectangle(dc.getWidth()/2 - pix*2*(4-i), dc.getHeight()/2 - pix*5, pix*2, pix*2);
        }

        // Draw Battery Arc
        var ARCLENGTH = 60;
        var ARCWIDTH = 3;
        dc.setPenWidth(ARCWIDTH);

        var WIDTH = dc.getWidth();
        var HEIGHT = dc.getHeight();
        
        dc.setColor(colour4, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(WIDTH / 2, HEIGHT / 2, HEIGHT / 2 - ARCWIDTH / 2 + 1, Graphics.ARC_CLOCKWISE, 180 + ARCLENGTH / 2, 180 - ARCLENGTH / 2);

        dc.setColor(colour3, Graphics.COLOR_TRANSPARENT);
        dc.drawArc(WIDTH / 2, HEIGHT / 2, HEIGHT / 2 - ARCWIDTH / 2 + 1, Graphics.ARC_CLOCKWISE, 180 + ARCLENGTH / 2, 180 + ARCLENGTH / 2 - ARCLENGTH * System.getSystemStats().battery / 100);
    }

    function getTime() as String {
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour.format("%02d"), clockTime.min.format("%02d")]);
        return timeString;
    }

    function getDate() as String {
        var now = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format("$1$, $2$ $3$", [now.day_of_week, now.month, now.day]);
        return dateString;
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
