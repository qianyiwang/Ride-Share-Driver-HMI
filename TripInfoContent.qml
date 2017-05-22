import QtQuick 2.2

Rectangle {

    color: "transparent"
    width: parent.width
    height: parent.height

    function stopUpdate(newText) {
        stop_info.text += newText
    }

    function timeUpdate(newText) {
        time_info.text += newText
    }

    Row{
        anchors.centerIn: parent
        Text {
            id: stop_info
            color: "Yellow"
            text: "Next Stop Name"
            font.pointSize: 30

        }
        Text {
            color: "Yellow"
            text: "--"
            font.pointSize: 30
        }
        Text {
            id: time_info
            color: "Yellow"
            text: "Estimate Arrive Time"
            font.pointSize: 30
        }
    }
}

