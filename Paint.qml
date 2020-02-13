import QtQuick 2.6

Item {
    property string whatColor: "yellow"
    property int widthLineValue: 10

    height: 720; width: 720;

    LineCanvas{
        id: canvas
        color: whatColor
        widthLine: widthLineValue
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        height: 50
        spacing: 25
        y: parent.height - 75

        Switch{
            color: "black"
            checked: whatColor == "black" ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: whatColor = "black"
            }
        }

        Switch{
            color: "red"
            checked: whatColor == "red" ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: whatColor = "red"
            }
        }

        Switch{
            color: "yellow"
            checked: whatColor == "yellow" ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: whatColor = "yellow"
            }
        }

        Switch{
            color: "blue"
            checked: whatColor == "blue" ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: whatColor = "blue"
            }
        }

        Switch{
            color: "green"
            checked: whatColor == "green" ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked: whatColor = "green"
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
}
