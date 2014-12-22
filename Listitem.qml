
import QtQuick 2.1

FocusScope {
    clip: true


    ListView {
        id: list1
        x: 300;width: 300; height: parent.height - 80
        focus: true
        orientation: ListView.Horizontal
        model: myConfiguration; cacheBuffer: 400
        delegate:ListitemDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

}
