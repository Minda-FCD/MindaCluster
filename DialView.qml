import QtQuick 2.1

FocusScope {
    clip: true

    ListView {
        id: dialView
        x:50;width:300;height:300
        focus: true
        orientation: ListView.Horizontal
        model:switch(cluster.configurableBackground_index){case 9:skin_9_dialOption;break;default:dialOption;}
        cacheBuffer: 100
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
            ListElement{
                sourcee:"image/original Speedo.png"
                scalee:0.4
            }
        }


    ListModel{
        id:skin_9_dialOption

            ListElement{
                sourcee:"image/Skin_9_Speedo.png"
                scalee:0.4
            }
            ListElement{
                sourcee:"image/Skin_9_Speedo1.png"
                scalee:0.4
            }
        }

}
