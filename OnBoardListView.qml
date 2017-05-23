import QtQuick 2.0

Item {
    anchors.fill: parent

    function appendInfo(newName, newAddress) {
        listModel.append({"name": newName,"dest": newAddress})
    }

    function removeItem(name, address){
        for(var i=0; i<listModel.count; i++){
            if(listModel.get(i).name===name && listModel.get(i).dest===address){
                listModel.remove(i)
            }
        }
    }

    ListModel {
        id: listModel
        ListElement{
            name: 'Gray'
            dest: 'Ann Arbor'
        }

        ListElement{
            name: 'Abe'
            dest: 'Canton'
        }

        ListElement{
            name: 'Jeff'
            dest: 'Ann Arbor'
        }

        ListElement{
            name: 'Zarc'
            dest: 'Canton'
        }
    }

    Component{
        id: myDelegate
        Column{
            Text{
                text: 'Name: ' + name
                color: "white"
                font.pointSize: 20
            }
            Text{
                text: 'Destination: ' + dest
                color: "white"
                font.pointSize: 20
            }
        }

    }

    ListView{
        anchors.fill: parent
        model: listModel
        delegate: myDelegate
        spacing: 60

        add: Transition {
                NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
                NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
            }

        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 600; easing.type: Easing.OutBounce }
        }
    }
}
