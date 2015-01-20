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
            cluster.configurableBackground=""
            cluster.configurableBackground_index = 9
            rpm_active.opacity   = cluster.startFlag==true? 0:0
            speed_active.opacity = cluster.startFlag==true? 0:0
            break;

        case 1:
            cluster.configurableBackground=""
            cluster.configurableBackground_index = 12
            rpm_active.opacity   = cluster.startFlag==true? 0:0
            speed_active.opacity = cluster.startFlag==true? 0:0
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
            cluster.configurableBackground="image/Skin_4.png"
            cluster.configurableBackground_index = 1
            switch(cluster.configurableDial_index)
            {
             case 1:
                 rpm_active.opacity   = cluster.startFlag==true? 0:0
                 needle.x             = cluster.startFlag==true?-76:74
                 needle.y             = cluster.startFlag==true? 44:64
                 rpm_inactive.x       = cluster.startFlag==true? -175:-30
                 rpm_inactive.y       = cluster.startFlag==true? 18:20
                 rpm_inactive.scale   = cluster.startFlag==true? 1.4:1

                 speed_active.opacity = cluster.startFlag==true? 0:0
                 needle1.x            = cluster.startFlag==true? 311:127
                 needle1.y            = cluster.startFlag==true? 52:72
                 speed_inactive.x     = cluster.startFlag==true? 166:-9
                 speed_inactive.y     = cluster.startFlag==true? 26:28
                 speed_inactive.scale = cluster.startFlag==true? 1.4:1
                 break;

             case 2:
                 rpm_active.opacity   = cluster.startFlag==true? 1:0
                 needle.x             = cluster.startFlag==true?-77:102
                 needle.y             = cluster.startFlag==true? 54:84
                 rpm_inactive.x       = cluster.startFlag==true? -205:-30
                 rpm_inactive.y       = cluster.startFlag==true? -10:20
                 rpm_inactive.scale   = cluster.startFlag==true? 1.2:1

                 speed_active.opacity = cluster.startFlag==true? 1:0
                 needle1.x            = cluster.startFlag==true? 319:124
                 needle1.y            = cluster.startFlag==true? 61:91
                 speed_inactive.x     = cluster.startFlag==true? 186:-9
                 speed_inactive.y     = cluster.startFlag==true? -2:28
                 speed_inactive.scale = cluster.startFlag==true? 1.2:1
                 break;

             case 3:
                 rpm_active.opacity   = cluster.startFlag==true? 0:0
                 needle.x             = cluster.startFlag==true?-84:91
                 needle.y             = cluster.startFlag==true? 50:82
                 rpm_inactive.x       = cluster.startFlag==true? -205:-30
                 rpm_inactive.y       = cluster.startFlag==true? -10:20
                 rpm_inactive.scale   = cluster.startFlag==true? 1.2:1

                 speed_active.opacity = cluster.startFlag==true? 0:0
                 needle1.x            = cluster.startFlag==true? 307:112
                 needle1.y            = cluster.startFlag==true? 60:90
                 speed_inactive.x     = cluster.startFlag==true? 186:-9
                 speed_inactive.y     = cluster.startFlag==true? -2:28
                 speed_inactive.scale = cluster.startFlag==true? 1.2:1

                 break;
            }
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
            cluster.configurableBackground_index = 8
            break;

        case 8:
            cluster.configurableBackground="image/Skin_5.png"
            cluster.configurableBackground_index = 5
            break;

        case 9:
            cluster.configurableBackground="image/Skin_10.png"
            cluster.configurableBackground_index = 10
            break;

        case 10:
            cluster.configurableBackground="image/Skin_11.png"
            cluster.configurableBackground_index = 11
            break;

        case 11:
            cluster.configurableBackground="image/Skin_14.png"
            cluster.configurableBackground_index = 2
            break;

        case 12:
            cluster.configurableBackground="image/Skin_3.png"
            cluster.configurableBackground_index = 13
            break;

        case 13:
            cluster.configurableBackground="image/mountain_view.jpg"
            cluster.configurableBackground_index = 14
            break;

        case 14:
            cluster.configurableBackground="image/Red.jpg"
            cluster.configurableBackground_index = 15
            break;

        case 15:
            cluster.configurableBackground="image/grass.jpg"
            cluster.configurableBackground_index = 16
            break;

        case 16:
            cluster.configurableBackground="image/brown.jpg"
            cluster.configurableBackground_index = 17
            break;

        case 17:
            cluster.configurableBackground="image/hay.jpg"
            cluster.configurableBackground_index = 18
            break;

        case 18:
            cluster.configurableBackground="image/skyblue.jpg"
            cluster.configurableBackground_index = 19
            break;

        case 19:
            cluster.configurableBackground=""
            cluster.configurableBackground_index = 20
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
