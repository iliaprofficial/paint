import QtQuick 2.0

Item {
    property string textValue
    property color backGround

    Rectangle {
        width: 50
        height: 50
        color: backGround
        radius: 25
        Text {
            anchors.centerIn: parent
            text: textValue
            color: "#000000"
            font { bold: true; pixelSize: 25 }
        }
    }
}
