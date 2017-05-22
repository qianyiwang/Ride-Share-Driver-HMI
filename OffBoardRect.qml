import QtQuick 2.2

Rectangle {

    color: "transparent"
    width: parent.width
    height: parent.height

    function appendInfo(newName) {
        offboard_person_info.text += "\n\n"+newName
    }
    function clearText(){
        offboard_person_info.text = ""
    }

    Column{
        spacing: 20
        Text{
            text: "Off Board List"
            font.pointSize: 30
            color: "yellow"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: offboard_person_info
            color: "white"
            font.pointSize: 20
        }

    }

}
