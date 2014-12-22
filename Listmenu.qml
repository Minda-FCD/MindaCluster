import QtQuick 2.1

FocusScope {
    clip: true
    ListView {
        id: list2
        x: 705;width: 300; height: parent.height - 80;
        focus: true
        orientation: ListView.Horizontal
        model:myMenu; cacheBuffer: 400
        delegate: ListmenuDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

}
