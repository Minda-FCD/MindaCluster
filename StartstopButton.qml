import QtQuick 2.1

FocusScope {
    id:startStopButton
    clip: false
    property bool flipped: false
    // engine start and stop button with flipable property
    Flipable {
        id: flipable
        width: 50
        height: 64
        x: 610
        y: 300
        scale:0.6

        front: Image { source: "image/Engine_start_stop_inactive.png"; anchors.centerIn: parent }
        back: Image { source: "image/Engine_start_stop_active.png"; anchors.centerIn: parent }
        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }
        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180}
            when: flipped;
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 100 }
        }


    }
}




