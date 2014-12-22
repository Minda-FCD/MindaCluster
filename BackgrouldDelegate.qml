import QtQuick 2.1

Item {
    id: delBackground
    width: ListView.view.width; height: 250; anchors.leftMargin: 10; anchors.rightMargin: 10

    Rectangle {
        id: backgroundRec
        anchors.centerIn: parent; width: 270; height: 170
        color: "transparent"
        antialiasing: true
        radius: 10
        Rectangle { anchors.fill: parent; anchors.margins: 3; color: "black"; antialiasing: true; radius: 8 }
    }


    Image{
        id:backgroundImage
        anchors.centerIn:backgroundRec
        source:modelData
    }

    Keys.onSpacePressed: {
        switch(index){
        case 0:
            cluster.configurableBackground="image/mountain_view.jpg"
            break;
        case 1:
            cluster.configurableBackground="image/Red.jpg"
            break;

        case 2:
            cluster.configurableBackground="image/grass.jpg"
            break;

        case 3:
            cluster.configurableBackground="image/brown.jpg"
            break;

        case 4:
            cluster.configurableBackground="image/hay.jpg"
            break;

        case 5:
            cluster.configurableBackground="image/skyblue.jpg"
            break;

        case 6:
            cluster.configurableBackground=""
            break;
        }
    }

    states: State {
        name: "backgroundState"; when: delBackground.activeFocus
        PropertyChanges { target: backgroundRec; color: "#FCFFF5"; scale: 1.1 }

    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 100 }
    }
}
