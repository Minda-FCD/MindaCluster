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
            sourcee:"image/Skin_4.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_5.png"
            scalee: 0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_6.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_7.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_8.png"
            scalee: 0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_9.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_10.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_1.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_2.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/Skin_3.png"
            scalee:0.22
            widthh:1082
            Heightt:480
        }
        ListElement{
            sourcee:"image/mountain_view.jpg"
            scalee:1
            widthh:284
            Heightt:177
        }

        ListElement{
            sourcee:"image/Red.jpg"
            scalee:1
            widthh:284
            Heightt:177
        }
        ListElement{
            sourcee:"image/grass.jpg"
            scalee:1
            widthh:284
            Heightt:177
        }
        ListElement{
            sourcee:"image/brown.jpg"
            scalee:1
            widthh:284
            Heightt:177
        }
        ListElement{
            sourcee:"image/hay.jpg"
            scalee:1
            widthh:284
            Heightt:177
        }
        ListElement{
            sourcee:"image/skyblue.jpg"
            scalee:1
            widthh:284
            Heightt:177
        }
        ListElement{
            sourcee:""
            scalee:1
            widthh:284
            Heightt:177
        }

    }

}
