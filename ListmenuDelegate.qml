import QtQuick 2.1

Item {
    id: container
    width: ListView.view.width; height: 60; anchors.leftMargin: 10; anchors.rightMargin: 10
    property bool raiseFlag
    Rectangle {
        id: content
        anchors.centerIn: parent; width: container.width - 40; height: container.height - 10
        color: "transparent"
        antialiasing: true
        radius: 10

        Rectangle { anchors.fill: parent; anchors.margins: 3; color: "#1ae7ee"; antialiasing: true; radius: 8 }
    }

    Text {
        id: label
        anchors.centerIn: content
        text: modelData
        color: "#193441"
        font.pixelSize: 14
    }


    Keys.onEnterPressed: {
        switch(index){
        case 0:


            break;
        case 1:

            break;


         case 2:


             break;
        }

    }

    states: State {
        name: "active"; when: container.activeFocus
        PropertyChanges { target: content; color: "#FCFFF5"; scale: 1.1 }
        PropertyChanges { target: label; font.pixelSize: 16 }
    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 100 }
    }
}
