import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: item1
    width: 2000
    height: 1000
    property alias registration_list_rect: registration_list_rect
    property alias registration_list_title: registration_list_title

    RowLayout {
        id: content_info
        x: 8
        y: 79
        width: 770
        height: 390
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: registration_list_rect
            y: 0
            width: 252
            height: 390
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#458af6"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }

            Text {
                id: registration_list_title
                x: 47
                y: 8
                color: "#f7d011"
                text: qsTr("Registration List")
                visible: true
                font.pixelSize: 22
            }
        }

        Rectangle {
            id: onboard_list
            y: 0
            width: 252
            height: 390
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#458af6"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }

            Text {
                id: onboard_list_title
                x: 47
                y: 8
                color: "#f7d011"
                text: qsTr("On Board List")
                font.pixelSize: 22
                visible: true
            }
        }

        Rectangle {
            id: offboard_list
            y: 0
            width: 255
            height: 390
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#458af6"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }
        }
    }

    RowLayout {
        id: title_info
        x: 8
        y: 8
        width: 770
        height: 65
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: stop_info
            width: 380
            height: 65
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#458af6"
                }

                GradientStop {
                    position: 0.997
                    color: "#000000"
                }
            }
        }

        Rectangle {
            id: time_info
            x: 385
            width: 380
            height: 65
            color: "#458af6"
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#458af6"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }
        }
    }

    Rectangle {
        id: background
        x: -39
        y: 0
        width: 2000
        height: 1000
        color: "#000000"
        z: -1
    }
}
