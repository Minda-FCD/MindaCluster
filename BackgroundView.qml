import QtQuick 2.1

FocusScope {
    clip: true

    ListView {
        id: backgroundView
        x:50;width:300;height:300
        focus: true
        orientation: ListView.Horizontal
        model:backgroundOption; cacheBuffer: 100
        delegate: BackgrouldDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

    ListModel{
        id:backgroundOption

        ListElement{
            source:"image/mountain_view.jpg"
        }

        ListElement{
            source:"image/Red.jpg"
        }
        ListElement{
            source:"image/grass.jpg"
        }
        ListElement{
            source:"image/brown.jpg"
        }
        ListElement{
            source:"image/hay.jpg"
        }
        ListElement{
            source:"image/skyblue.jpg"
        }
        ListElement{
            source:""
        }

    }

}
