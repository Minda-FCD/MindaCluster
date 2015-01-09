
import QtQuick 2.1

Item {
   /* id: container1
    width: 180; height: 40; anchors.leftMargin: 10; anchors.rightMargin: 10
    property bool raiseFlag
    Rectangle {
        id: content
        anchors.centerIn: parent; width: container1.width ; height: container1.height - 10
        color: "transparent"
        //antialiasing: true
        radius: 10

        Rectangle { anchors.fill: parent; anchors.margins: 3; color: "#1ae7ee";  radius: 8 } //antialiasing: true;
    }

    Text {
        id: label
        anchors.centerIn: content
        text: modelData
        color: "#193441"
        font.pixelSize: 14
    }


   Keys.onSpacePressed: {
        switch(index){
        case 0:
            viewPointeroption.focus=true
            break;
        case 1:
            viewBackgroundoption.focus=true
            break;
        case 2:
            viewDialoption.focus=true
            break;
        case 3:
            break;
        }

    }

    states: State {
        name: "active"; when: container1.activeFocus
        PropertyChanges { target: content; color: "white"; scale: 1.1 }//"#FCFFF5"
        PropertyChanges { target: label; font.pixelSize: 20 }
    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 100 }
    }*/
}
