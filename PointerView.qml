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
            source:"image/needle.png"
        }

        ListElement{
            source:"image/fuelneedle.png"
        }


    }

}
