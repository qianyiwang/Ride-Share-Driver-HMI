import QtQuick 2.2

Rectangle {

    color: "transparent"
    width: parent.width
    height: parent.height

    function appendInfo(newName, newAddress) {
        onboard_person_info.text += "\n\n"+newName+"\t\t\t"+newAddress
    }
    function clearText(){
        onboard_person_info.text = ""
    }
    Column{
        spacing: 20
        Text{
            text: "On Board List"
            font.pointSize: 30
            color: "yellow"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: onboard_person_info
            text: "Bob Lee"+"\t\t\t"+"Allen Park"
            color: "white"
            font.pointSize: 20
        }

    }

}

