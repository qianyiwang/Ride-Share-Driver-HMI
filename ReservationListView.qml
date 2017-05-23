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

    function change_mark(name, address, path){
        for(var i=0; i<listModel.count; i++){
            if(listModel.get(i).name===name && listModel.get(i).dest===address){
                listModel.setProperty(i, 'path', path)
            }
        }
    }


    ListModel {
        id: listModel

        ListElement{

            path: 'qrc:/images/deletemark.png'
            name: 'Crige'
            dest: 'Ann Arbor'
        }

        ListElement{
            path: 'qrc:/images/deletemark.png'
            name: 'Dave'
            dest: 'Canton'
        }
    }

    Component{
        id: myDelegate

        Row{
            Image{
                source: path
                sourceSize.width: 48
                sourceSize.height: 48
            }

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
    }

    ListView{
        id: list
        anchors.fill: parent
        model: listModel
        delegate: myDelegate
        spacing: 60

        add: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
        }

        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutBounce }
        }
    }
}

