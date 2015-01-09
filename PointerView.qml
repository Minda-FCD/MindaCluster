import QtQuick 2.1

FocusScope {
    clip: true

    ListView {
        id: pointerView
        x:50;width:300;height:300
        focus: true
        orientation: ListView.Horizontal
        model:pointerOption; cacheBuffer: 100
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


    }

}
