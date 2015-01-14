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
        source:sourcee //modelData
        scale:scalee //modelData
        width:widthh
        height:Heightt
    }

    Keys.onSpacePressed: {
        switch(index){

        case 0:
            cluster.configurableBackground="image/Skin_4.png"
            cluster.configurableBackground_index = 1
            break;

        case 1:
            cluster.configurableBackground="image/Skin_14.png"
            cluster.configurableBackground_index = 2
            break;

        case 2:
            cluster.configurableBackground="image/Skin_15.png"
            cluster.configurableBackground_index = 3
            break;

        case 3:
            cluster.configurableBackground="image/Skin_16.png"
            cluster.configurableBackground_index = 4
            break;

        case 4:
            cluster.configurableBackground="image/Skin_5.png"
            cluster.configurableBackground_index = 5
            break;

        case 5:
            cluster.configurableBackground="image/Skin_6.png"
            cluster.configurableBackground_index = 6
            break;

        case 6:
            cluster.configurableBackground="image/Skin_7.png"
            cluster.configurableBackground_index = 7
            break;

        case 7:
            cluster.configurableBackground="image/Skin_8.png"
            break;

        case 8:
            cluster.configurableBackground="image/Skin_9.png"
            break;

        case 9:
            cluster.configurableBackground="image/Skin_10.png"
            break;

        case 10:
            cluster.configurableBackground="image/Skin_1.png"
            break;

        case 11:
            cluster.configurableBackground="image/Skin_2.png"
            break;

        case 12:
            cluster.configurableBackground="image/Skin_3.png"
            break;

        case 13:
            cluster.configurableBackground="image/mountain_view.jpg"
            break;

        case 14:
            cluster.configurableBackground="image/Red.jpg"
            break;

        case 15:
            cluster.configurableBackground="image/grass.jpg"
            break;

        case 16:
            cluster.configurableBackground="image/brown.jpg"
            break;

        case 17:
            cluster.configurableBackground="image/hay.jpg"
            break;

        case 18:
            cluster.configurableBackground="image/skyblue.jpg"
            break;

        case 19:
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
