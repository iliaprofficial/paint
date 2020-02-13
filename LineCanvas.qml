import QtQuick 2.14

Item {
    property var lines: []
    property string color
    property int widthLine

    anchors.fill: parent

    function paintLines(ctx, lines){
        for(var i = 0; i < lines.length; i++){
            var line = lines[i];
            ctx.beginPath();
            ctx.strokeStyle = line['color'];
            ctx.lineWidth = line['width'];
            var radius = line['width'] / 2;
            ctx.moveTo(line['points'][0]['x'] + radius, line['points'][0]['y'] + radius);
            for(var j = 1; j < line['points'].length; j++)
                ctx.lineTo(line['points'][j]['x'] + radius, line['points'][j]['y'] + radius);
            ctx.stroke();
        }
    }

    function removeColor(){
        lines = lines.filter(function(line){
            return line['color'] !== color
        })
        canvas.requestPaint();
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = canvas.getContext("2d");
            ctx.clearRect(0, 0, width, height);
            paintLines(ctx, lines);
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: lines.push({
            'color': color,
            'width': widthLine,
            'points': [{'x': mouseX, 'y': mouseY}]
        })
        onPositionChanged: {
            lines[lines.length - 1]['points'].push({'x':mouseX, 'y':mouseY});
            canvas.requestPaint();
        }
    }
}
