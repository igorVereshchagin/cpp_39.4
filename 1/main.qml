import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        id : scene
        anchors.fill: parent
        color: "white"
        state: "InitialState"

        Rectangle {
            id: leftRect
            width: 100
            height: 100
            x: 100
            y: 100
            radius: 5
            color: "lightgrey"
            border.color: "black"
            border.width: 3
            Text {
                anchors.centerIn: parent
                text: "move"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ball.x += 23
                    if (ball.x + ball.width >= rightRect.x)
                        scene.state = "InitialState"
                    else
                        scene.state = "MovedState"
                }
            }
        }
        Rectangle {
            id: rightRect
            width: 100
            height: 100
            x: parent.width - 200
            y: 100
            radius: 5
            color: "lightgrey"
            border.color: "black"
            border.width: 3
            Text {
                anchors.centerIn: parent
                text: "return"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }
        Rectangle {
            id: ball
            width: 90
            height: 90
            radius: width / 2
            color: "green"
            x: leftRect.x + 5
            y: leftRect.y + 5
        }
        states: [
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRect.x + 5;
                }
            },
            State {
                name: "MovedState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            }
        ]
        transitions: [
            Transition {
                from: "MovedState"
                to: "InitialState"
                NumberAnimation {
                    properties: "x, y"
                    duration: 1000
                    easing.type: Easing.InOutBack;
                }
            }
        ]
    }
}
