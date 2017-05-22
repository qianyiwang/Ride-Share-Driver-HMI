import QtQuick 2.2

Rectangle {


    color: "transparent"
    width: parent.width
    height: parent.height

    function appendInfo(newName, newAddress) {
        reservation_person_info.text += "\n\n"+newName+"\n\t\t\t"+newAddress
    }
    function clearText(){
        reservation_person_info.text = ""
    }

    Column{
        spacing: 20
        Text{
            text: "Reservation List"
            font.pointSize: 30
            color: "yellow"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: reservation_person_info
            color: "white"
            font.pointSize: 20
        }

    }

}
