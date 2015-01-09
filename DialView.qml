import QtQuick 2.1

FocusScope {
    clip: true

    ListView {
        id: dialView
        x:50;width:300;height:300
        focus: true
        orientation: ListView.Horizontal
        model:dialOption; cacheBuffer: 100
        delegate: DialDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

    ListModel{
        id:dialOption

        ListElement{
            sourcee:"image/RPM_01.png"
            scalee:0.4
        }

        ListElement{
            sourcee:"image/rpm_inactive.png"
            scalee:0.4
        }


    }

}
