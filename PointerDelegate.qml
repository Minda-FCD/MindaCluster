import QtQuick 2.1

Item {
    id: delPointer
    width: ListView.view.width; height: 250; anchors.leftMargin: 10; anchors.rightMargin: 10

    Rectangle {
        id: pointerRec
        anchors.centerIn: parent; width: 80; height: 160
        color: "transparent"
        antialiasing: true
        radius: 10
        Rectangle { anchors.fill: parent; anchors.margins: 3; color: "#0d0f11"; antialiasing: true; radius: 8 }
    }

    Image{
        id:pointerImage
        anchors.centerIn:pointerRec
        source:modelData
    }

    Keys.onSpacePressed: {
        switch(index){
        case 0:
               cluster.configurablePointer="image/Pointer1.png"
            break;
        case 1:
                cluster.configurablePointer="image/Pointer2.png"
            break;
        case 2:
                cluster.configurablePointer="image/Pointer3.png"
            break;
        case 3:
                cluster.configurablePointer="image/Pointer4.png"
            break;
        case 4:
                cluster.configurablePointer="image/Pointer5.png"
            break;
        case 5:
                cluster.configurablePointer="image/Pointer6.png"
            break;
        case 6:

            break;
        }

    }

    states: State {
        name: "active"; when: delPointer.activeFocus
        PropertyChanges { target: pointerRec; color: "#FCFFF5"; scale: 1.1 }

    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 100 }
    }
}
