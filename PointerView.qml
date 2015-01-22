import QtQuick 2.1

FocusScope {
    clip: true

    ListView {
        id: pointerView
        x:50;width:300;height:300
        focus: true
        orientation: ListView.Horizontal
        model:switch(cluster.configurableBackground_index){case 9:skin_9_pointerOption;break;default:pointerOption;}
        cacheBuffer: 100
        delegate: PointerDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

    ListModel{
        id:pointerOption

        ListElement{
            source:"image/Pointer1.png"
        }
        ListElement{
            source:"image/Pointer2.png"
        }
        ListElement{
            source:"image/Pointer3.png"
        }
        ListElement{
            source:"image/Pointer4.png"
        }
        ListElement{
            source:"image/Pointer5.png"
        }
        ListElement{
            source:"image/Pointer6.png"
        }
        ListElement{
            source:"image/Skin_14_Speedo_RPM_Pointer.png"
        }
    }

    ListModel{
        id:skin_9_pointerOption

        ListElement{
            source:"image/Skin_9_RPM_Pointer1.png"
        }
        ListElement{
            source:"image/Skin_9_RPM_Pointer2.png"
        }
        ListElement{
            source:"image/Skin_9_RPM_Pointer3.png"
        }
        ListElement{
            source:"image/Skin_9_RPM_Pointer4.png"
        }
        ListElement{
            source:"image/Skin_9_RPM_Pointer5.png"
        }
    }

}
