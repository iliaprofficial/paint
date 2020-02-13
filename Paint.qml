import QtQuick 2.6

Item {
    property string whatColor: "rgba(255, 255, 0, "
    property int widthLineValue: 10
    property string lineColor: whatColor + trans + ")"
    property real trans: 0.5

    height: 720; width: 720;

    function updateColor(){
        lineColor = whatColor + trans + ")"
    }

    LineCanvas{
        id: canvas
        color: lineColor
        widthLine: widthLineValue
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        height: 50
        spacing: 25
        y: parent.height - 75

        Switch{
            color: "black"
            checked: whatColor == "rgba(0, 0, 0, " ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: function(){
                    whatColor = "rgba(0, 0, 0, "
                    updateColor()
                }
            }
        }

        Switch{
            color: "red"
            checked: whatColor == "rgba(255, 0, 0, " ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: function(){
                    whatColor = "rgba(255, 0, 0, "
                    updateColor()
                }
            }
        }

        Switch{
            color: "yellow"
            checked: whatColor == "rgba(255, 255, 0, " ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: function(){
                    whatColor = "rgba(255, 255, 0, "
                    updateColor()
                }
            }
        }

        Switch{
            color: "blue"
            checked: whatColor == "rgba(0, 0, 255, " ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: function(){
                    whatColor = "rgba(0, 0, 255, "
                    updateColor()
                }
            }
        }

        Switch{
            color: "green"
            checked: whatColor == "rgba(0, 255, 0, " ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: function(){
                    whatColor = "rgba(0, 255, 0, "
                    updateColor()
                }
            }
        }
    }

    Column {
        width: 50
        spacing: 25
        x: parent.width - 75
        y: parent.height / 2 - 100

        Button{
            property color backGroundValue: "#eeeeee"
            backGround: backGroundValue
            textValue: "+"
            MouseArea {
                width: 50
                height: 50
                onClicked: widthLineValue++
                onPressed: parent.backGroundValue = "#dddddd"
                onReleased: parent.backGroundValue = "#eeeeee"
            }
        }

        Button{
            property color backGroundValue: "#eeeeee"
            backGround: backGroundValue
            textValue: "-"
            y: 75
            MouseArea {
                width: 50
                height: 50
                onClicked: if(widthLineValue > 1) widthLineValue--
                onPressed: parent.backGroundValue = widthLineValue > 1 ? "#dddddd" : "#ff0000"
                onReleased: parent.backGroundValue = "#eeeeee"
            }
        }

        Button{
            property color backGroundValue: "#eeeeee"
            backGround: backGroundValue
            textValue: "x"
            y: 150
            MouseArea {
                width: 50
                height: 50
                onClicked: canvas.removeColor()
                onPressed: parent.backGroundValue = "#dddddd"
                onReleased: parent.backGroundValue = "#eeeeee"
            }
        }
    }

    Column {
        width: 50
        spacing: 25
        x: 25
        y: parent.height / 2 - 100

        Button{
            property color backGroundValue: "#eeeeee"
            backGround: backGroundValue
            textValue: "+"
            MouseArea {
                width: 50
                height: 50
                onClicked: function(){
                    if(trans < 1) trans += 0.1
                    updateColor()
                }
                onPressed: parent.backGroundValue = trans < 1 ? "#dddddd" : "#ff0000"
                onReleased: parent.backGroundValue = "#eeeeee"
            }
        }

        Button{
            property color backGroundValue: "#eeeeee"
            backGround: backGroundValue
            textValue: "-"
            y: 75
            MouseArea {
                width: 50
                height: 50
                onClicked: function(){
                    if(trans > 0.2) trans -= 0.1
                    updateColor()
                }
                onPressed: parent.backGroundValue = trans > 0.2 ? "#dddddd" : "#ff0000"
                onReleased: parent.backGroundValue = "#eeeeee"
            }
        }
    }
}
