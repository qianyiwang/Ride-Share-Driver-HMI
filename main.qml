import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtBluetooth 5.2
import UDPServer 1.0
import "GlobalScript.js" as GlobalScript

ApplicationWindow {

    visible: true
    visibility: "FullScreen"
    title: qsTr("Ride Share Driver HMI")
    color: "black"

    Rectangle{
        id: root_rect
        anchors.fill: parent
        anchors.margins: 15
        color: "black"
        Column{
            spacing: 5
            // trip info rect
            Rectangle{
                id: trip_info_rect
                width: root_rect.width
                height: root_rect.height/5
                color: "steelblue"
                gradient: Gradient{
                    GradientStop{position: 0.0; color: "steelblue"}
                    GradientStop{position: 1.0; color: "darkblue"}
                }

                TripInfoContent{
                    id: trip_info_content
                }
            }

            // three lists
            Row{
                spacing: 10
                Rectangle{
                    width: root_rect.width/3-5
                    height: root_rect.height*5/6
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "steelblue"}
                        GradientStop{position: 1.0; color: "darkblue"}
                    }

                    ReservationRect{
                        id: reservationRect
                    }
                }
                Rectangle{
                    width: root_rect.width/3-5
                    height: root_rect.height*5/6
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "steelblue"}
                        GradientStop{position: 1.0; color: "darkblue"}
                    }

                    OnBoardRect{
                        id: onboardRect
                    }
                }
                Rectangle{
                    width: root_rect.width/3-5
                    height: root_rect.height*5/6
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "steelblue"}
                        GradientStop{position: 1.0; color: "darkblue"}
                    }

                    OffBoardRect{
                        id: offboardRect
                    }
                }
            }
        }

        BusyIndicator{
            id: busy_indecator
            anchors.centerIn: root_rect
            width: root_rect.width/10
            height: root_rect.height/10
            running: true
        }
    }

    UdpServer{
        id: udp_server
        onDataReceived: {
            if(busy_indecator.running===true){
                busy_indecator.running=false
            }
            var msgList = message.split('_')
            var name = msgList[0]
            var address = msgList[1]
            var action = msgList[2]
            var idx, i
            // reservation action
            if(action==="Reservation"){
                GlobalScript.ReservationObj.name.push(name)
                GlobalScript.ReservationObj.address.push(address)
                reservationRect.clearText()
                for(i = 0; i<GlobalScript.ReservationObj.name.length; i++){
                    reservationRect.appendInfo(GlobalScript.ReservationObj.name[i],GlobalScript.ReservationObj.address[i])
                }
            }
            // on board action
            else if(action==="OnBoard"){
                // add into OnBoardObj
                GlobalScript.OnBoardObj.name.push(name)
                GlobalScript.OnBoardObj.address.push(address)
                // remove from ReservationObj
                idx = GlobalScript.ReservationObj.name.indexOf(name);
                GlobalScript.ReservationObj.name.splice(idx, 1);
                GlobalScript.ReservationObj.address.splice(idx, 1);
                // update On Board Text
                onboardRect.clearText()
                for(i = 0; i<GlobalScript.OnBoardObj.name.length; i++){
                    onboardRect.appendInfo(GlobalScript.OnBoardObj.name[i],GlobalScript.OnBoardObj.address[i])
                }
                // update Reservation Text
                reservationRect.clearText()
                for(i = 0; i<GlobalScript.ReservationObj.name.length; i++){
                    reservationRect.appendInfo(GlobalScript.ReservationObj.name[i],GlobalScript.ReservationObj.address[i])
                }
            }

            // off board action
            else if(action==="OffBoarding"){
                // add into OffBoardObj
                GlobalScript.OffBoardObj.name.push(name)
                GlobalScript.OffBoardObj.address.push(address)
                // remove from OnBoardObj
                idx = GlobalScript.OnBoardObj.name.indexOf(name);
                GlobalScript.OnBoardObj.name.splice(idx, 1);
                GlobalScript.OnBoardObj.address.splice(idx, 1);
                // update Off Board Text
                offboardRect.clearText()
                for(i = 0; i<GlobalScript.OffBoardObj.name.length; i++){
                    offboardRect.appendInfo(GlobalScript.OffBoardObj.name[i],GlobalScript.OffBoardObj.address[i])
                }
                // update On Board Text
                onboardRect.clearText()
                for(i = 0; i<GlobalScript.OnBoardObj.name.length; i++){
                    onboardRect.appendInfo(GlobalScript.OnBoardObj.name[i],GlobalScript.OnBoardObj.address[i])
                }
            }
        }
    }

}
