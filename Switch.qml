import QtQuick 2.0

Item {
    id: root
    property bool checked
    property alias color: runner.color
    property color backgroundColor: "#eeeeee"
    property color dimmedColor: "#eeeeee"
    property alias borderRadius: background.radius

    width: height * 2
    height: parent.height
    borderRadius: height / 2

    Rectangle {
        id: background
        anchors.fill: root
        color: root.enabled ? root.backgroundColor : root.dimmedColor
    }

    Rectangle {
        id: runner
        radius: parent.borderRadius
        width: root.width / 2
        height: parent.height
        Behavior on x {
            SmoothedAnimation { duration: 228 }
        }
    }

    state: checked ? "on" : "off"
    states: [
        State {
            name: "off"
            PropertyChanges {
                target: runner
                x: 0
            }
        },
        State {
            name: "on"
            PropertyChanges {
                target: runner
                x: parent.width / 2
            }
        }
    ]
}
