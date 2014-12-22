import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 1280
    height: 480

    Rectangle {
        id: cluster
        width:1280; height: 480
        color:"black"


        property bool startFlag: true
        property real dialOpacity : 0
        property real  rpmValue: 0
        property real  speedValue: 0
        property int  gear: 0
        property int fuelValue: 30

        property bool turn_rightFlag: false
        property bool turn_leftFlag: false
        property bool beamFlag: false
        property bool oilFlag: false
        property bool batteryFlag: false
        property bool fuelFlag: false
        property bool parkingFlag: false
        property bool brakeFlag: false

        property string configurablePointer:"image/needle.png"
        property string configurableBackground:""


        function rpmSpeedMeter(){

            rpmMeter.value1 = rpmValue
            speedoMeter.value = speedValue

            switch(gear)
            {
            case 0:
                rpmValue = rpmValue + 5
                speedValue = speedValue + 2
                gear = 1
                break
            case 1:
                if(rpmValue > 60)
                {
                    rpmValue = 30;
                    speedValue = speedValue - 5
                    gear = 2
                }
                rpmValue = rpmValue + 2.5
                speedValue = speedValue + 1.5
                break;

            case 2:
                if(rpmValue > 70)
                {
                    rpmValue = 50;
                    speedValue = speedValue - 4
                    gear = 3
                }
                rpmValue = rpmValue + 2
                speedValue = speedValue + 1


                break;
            case 3:
                if(rpmValue > 80)
                {
                    rpmValue = 60;
                    speedValue = speedValue - 3
                    gear = 4
                }
                rpmValue = rpmValue + 1.5
                speedValue = speedValue + 0.5

                break;
            case 4:
                if(rpmValue > 90)
                {
                    rpmValue = 70;
                    speedValue = speedValue - 1
                    gear = 4
                }
                rpmValue = rpmValue + 1
                speedValue = speedValue + 0.3
                break;

            }
            if(speedValue >120)
            {
                rpmValue = speedValue = gear = 0
            }

        }




        states: [
            State {
                name: "parseConfigurationMenu"
                when: listItem.activeFocus
                PropertyChanges { target: listItem; x: 0 }
            },

            State {
                name: "parseMenuOption"
                when: listmenu.activeFocus
                PropertyChanges { target: listmenu; x: -500 }
            },

            State{
                name: "parsePointers"
                when:viewPointeroption.activeFocus
                PropertyChanges {target:viewPointeroption; x:425}

            },

            State{
                name: "parseBackground"
                when:viewBackgroundoption.activeFocus
                PropertyChanges {target:viewBackgroundoption; x:425}

            }

        ]

        transitions: Transition {
            NumberAnimation { properties: "x"; duration: 600; easing.type: Easing.OutQuint }
        }

        Timer {
            id:rpmAndspeedUpdate
            interval: 200
            running: false
            repeat: true
            onTriggered: {
                if(cluster.startFlag == true)
                    cluster.rpmSpeedMeter()
                else{rpmMeter.value1=0;speedoMeter.value=0;}
            }
        }

        Image{
            id:backGround
            anchors.fill:parent
            source:cluster.configurableBackground
        }


        Image {
            id: straightBeam
            x: 322
            y: 27
            z: 0
            opacity: 1
            source: "image/High_Beam_Indicator.png"
        }

        Image {
            id: fuel_gauge
            x: 552
            y: 47
            z: 0
            opacity: 1
            source: "image/fuel_gauge.png"
        }

        Image {
            id: fuel_pointer
            x: 622
            y: 60
            z: 0
            clip:true
            smooth:true
            opacity: 1
            source: "image/fuelneedle.png"
            transform:Rotation{
                id:fuelpointer
                origin.x: 5; origin.y: 43
                angle: Math.min(Math.max(-70, speedoMeter.value*2.6 - 130), 70)
                Behavior on angle{
                    SpringAnimation{
                        spring:1.4
                        damping: .60
                    }
                }

            }
        }

        Image {
            id: parkingLight
            x: 850
            y: 32
            z: 0
            fillMode: Image.Tile
            source: "image/parkingLight.png"
        }

        Image {
            id: battery_low
            x: 200
            y: 85
            scale: 1.0
            rotation: 90
            z: 0
            source: "image/battery_low1.png"
        }

        Image {
            id: turn_left
            x: 560
            y: 208
            smooth: true
            z: 0
            source: "image/turn_indicator_left.png"
        }

        Image {
            id: turn_right
            x: 660
            y: 208
            smooth: true
            z: 0
            source: "image/turn_indicator.png"
        }


        Image {
            id: petrol_indicator
            x: 980
            y: 59
            z: 0
            scale: 0.4
            source: "image/petrol.png"
        }


        Image {
            id: oilIndication
            x: 110
            y: 182
            z: 0
            source: "image/oilIndicator.png"
        }



        Image {
            id: rpm_active
            x: 260
            y: 79
            z: 3
            opacity: 0
            visible: true
            source: "image/rpm_active.png"
        }

        Image {
            id: speed_active
            x: 695
            y: 75
            z:  3
            opacity: 0
            visible: true
            source: "image/speed_active1.png"
        }

        Image {
            id: brakeDamage
            x: 1070
            y: 190
            z: 0
            source: "image/Brake_failure.png"
        }

        Text {
            id: digitalSpeed
            x: 840
            y: 260
            color: "#99ec14"
            text: parseInt(speedoMeter.value)
            font.family: "Abyssinica SIL"
            font.italic: true
            smooth: true
            opacity: 1
            style: Text.Raised
            z: 6
            font.pixelSize: 35
        }

        Text {
            id: totalDistance
            x: 563
            y: 131
            color: "#a5bcc6"
            text: "Distance: 5000"
            smooth: true
            opacity: 0
            style: Text.Raised
            font.bold: true
            z: 0
            font.pixelSize: 15
        }



        Text {
            id: destination
            x: 363
            y: 131
            color: "#a5bcc6"
            text: "Destination: 51 Street"
            font.family: "Droid Sans Armenian"
            smooth: true
            opacity: 0
            style: Text.Raised
            font.pixelSize: 15
            font.italic: true
            z: 0
        }


        Text {
            id: time
            x: 363
            y: 131
            color: "#a5bcc6"
            text: "Time: 12:45:07"
            smooth: true
            opacity:0
            style: Text.Raised
            font.pixelSize: 15
            font.bold: true
            z: 0
        }


        Text {
            id: date
            x: 363
            y: 131
            color: "#a5bcc6"
            text: " Date: 28:02:2017"
            smooth: true
            opacity: 0
            style: Text.Raised
            font.pixelSize: 15
            font.bold: true
            z: 0
        }

        Text {
            id: oil
            x: 363
            y: 0
            color: "#e61414"
            text: "Engine Oil Low Level"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id: brake
            x: -178
            y: 0
            color: "#f52323"
            text: "Brake Pad Warning"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id: fuelLeak
            x: -178
            y: 0
            color: "#c70a0a"
            text: "Fuel Tank Leakage Warning"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id: battery
            x: -178
            y: 0
            color: "#f21616"
            text: "Battery Low"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id:parkinglight
            x: -178
            y: 0
            color: "#f21616"
            text: "Parking Light ON"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id:highBeam
            x: -178
            y: 0
            color: "#e61414"
            text: "High Beam On"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id: turnright
            x: -178
            y: 0
            color: "#f21616"
            text: "Right Turn"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }

        Text {
            id: turnleft
            x: -178
            y: 0
            color: "#f21616"
            text: "Turn Left"
            smooth: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 15
        }


        Item  {
            id: speedoMeter
            property real value : 0
            width: 300; height: 300
            x: 477
            y: 86
            z: 0
            opacity: 1
            anchors.verticalCenterOffset: -4
            anchors.horizontalCenterOffset: 227
            anchors.centerIn: parent

            Image  { id: speed_inactive; x: -9; y: 8; opacity: 0.8; z: 3; source: "image/speed_inactive.png"

            }

            Image {
                id: speedOverlay
                x: 125
                y: 137
                z: 5
                opacity: 1
                source: "image/overlay_active.png"
            }

            Image  {
                id: needle1
                x: 136; y: 86
                clip: true
                opacity: 1
                z: 3
                smooth: true
                source:cluster.configurablePointer
                transform: Rotation  {
                    id: needle1Rotation
                    origin.x: 5; origin.y: 65
                    angle: Math.min(Math.max(-130, speedoMeter.value*2.6 - 130), 133)

                    Behavior on angle  {
                        SpringAnimation  {
                            spring: 1.4
                            damping: .15
                        }
                    }
                }

            }
        }

        Item  {
            id: rpmMeter
            property real value1 : 0
            width: 300; height: 300

            x: 300
            y: 98
            visible: true
            z: 0
            opacity: 1
            anchors.verticalCenterOffset: 8
            anchors.horizontalCenterOffset: -207
            anchors.centerIn: parent

            Image  { id: rpm_inactive; x: -30; y: 0; opacity: 0.8; z: 3; source: "image/rpm_inactive.png"
                smooth: true
            }

            Image {
                id: rpmOverlay
                x: 98
                y: 137
                z: 5
                opacity: 1
                source: "image/overlay_active.png"
            }

            Image  {
                id: needle
                x: 100; y: 90 ; z:5
                clip: true
                scale: 0.98
                opacity: 1

                smooth: true
                source: cluster.configurablePointer
                transform: Rotation  {
                    id: needleRotation
                    origin.x: 5; origin.y: 65
                    angle: Math.min(Math.max(-130, rpmMeter.value1*2.6 - 130),133)

                    Behavior on angle  {
                        SpringAnimation  {
                            spring: 1.4
                            damping: .15
                        }
                    }
                }
            }

        }

        FocusScope {
            id: configurableFocus
            width: parent.width; height: parent.height
            focus:true

            Rectangle {
                id: configurableOption
                width: 250; height: 50;z:2;y:5
                color: "grey"
                anchors.topMargin: 3
                antialiasing: true
                radius: 10

                Text{
                    id:conf
                    anchors.centerIn: configurableOption
                    text:"Configurable Option"
                    font.pointSize: 12

                }

                states: State {
                    name: "focusConf"; when: configurableOption.activeFocus
                    PropertyChanges { target: configurableOption; color: "#FCFFF5"; scale: 1.1 }
                    PropertyChanges { target: conf; font.pixelSize: 16 }
                }

                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 100 }
                }

                activeFocusOnTab: true
                Keys.onSpacePressed: listItem.focus=true
            }

            Rectangle {
                id: menuOption
                width: 250; height: 50;z:2;y:415;x:950
                color: "grey"
                anchors.topMargin: 3
                antialiasing: true
                radius: 10

                Text{
                    id:menu
                    anchors.centerIn: menuOption
                    text:"Menu"
                    font.pointSize: 12

                }

                states: State {
                    name: "focusMenu"; when: menuOption.activeFocus
                    PropertyChanges { target: menuOption; color: "#FCFFF5"; scale: 1.1 }
                    PropertyChanges { target: menu; font.pixelSize: 16 }
                }

                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 100 }
                }

                activeFocusOnTab: true
                Keys.onSpacePressed: listmenu.focus=true
            }

            Listitem {
                id: listItem
                x:-900;y:0; width: parent.width; height: 320
            }

            Listmenu {
                id: listmenu
                x:1600;y:415; width: parent.width; height: 320

            }

            PointerView{
                id:viewPointeroption ;width: 350; height:350;x:-1300;y:100;z:5

            }

            BackgroundView{
                id:viewBackgroundoption;width:350;height:350;x:1300;y:100;z:0

            }

            StartstopButton{

                id:startStopbutton
                width:parent.width;height:320;y:30


                states: State {
                    name: "focusStartStopButton"; when: startStopbutton.activeFocus
                    PropertyChanges { target: startStopbutton; scale: 1.2  }

                }

                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 100 }
                }

                activeFocusOnTab: true
                Keys.onSpacePressed: {
                    flipped = !flipped
                    cluster.startFlag = !cluster.startFlag
                    if(cluster.startFlag == true)
                    {

                        dialEffectStop.stop()                      // stop dial animation
                        dialEffectStart.start()                    // start dial effect animation
                        indicatorAnimateFocus.stop()               // stop indicator animation
                        indicatorAnimatedDim.start()               // startindictor effect animation
                        rpmAndspeedUpdate.running = true           // start rpmAndspeedUpdate timer
                        dummyAnimation.running=true

                    }
                    else {

                        dialEffectStart.stop()                     // stop dial effect animation
                        dialEffectStop.start()                     // start dial effect stop animation
                        indicatorAnimateFocus.start()              // start indicator focus annimation
                        indicatorAnimatedDim.stop()                // stop indicator animation
                        dummyAnimation.running=false
                    }
                }
            }
        }



        // start dial glowing effect
        ParallelAnimation{
            id: dialEffectStart
            running: false

            NumberAnimation{target: speed_active; property:  "opacity"; to: 1.0; duration: 1000}
            NumberAnimation{target: rpm_active; property: "opacity" ; to : 1.0; duration: 1000}
            NumberAnimation{target: totalDistance; property: "opacity"; to: 1.0; duration: 1000}
            NumberAnimation { target:rpm_active; property:"x";to: 50; duration: 500 }
            NumberAnimation { target:rpm_inactive; property:"x";to: -220; duration: 500 }
            NumberAnimation { target:battery_low; property:"x";to: 80; duration: 500 }
            NumberAnimation { target:battery_low; property:"y";to: 40; duration: 500 }
            NumberAnimation { target:straightBeam; property:"x";to:250; duration: 500 }
            NumberAnimation { target:oilIndication; property: "x"; to: 10; duration: 500}
            NumberAnimation { target:needle; property: "x"; to:-80; duration: 500}
            NumberAnimation { target:rpmOverlay; property: "x"; to:-88; duration: 500}
            NumberAnimation { target: turn_left; property: "x"; to: 380; duration: 500}



            NumberAnimation { target:speed_active; property:"x";to: 850; duration: 500 }
            NumberAnimation { target:speed_inactive; property:"x";to:144; duration: 500 }
            NumberAnimation { target:needle1; property: "x"; to:290; duration: 500}
            NumberAnimation { target:speedOverlay; property: "x"; to:280; duration: 500}
            NumberAnimation { target:parkingLight; property: "x"; to: 920; duration: 500 }
            NumberAnimation { target:petrol_indicator; property: "x"; to: 1070; duration: 500 }
            NumberAnimation { target:petrol_indicator; property: "y"; to: 20; duration: 500 }
            NumberAnimation { target:brakeDamage; property: "x"; to: 1150; duration: 500 }
            NumberAnimation {target: turn_right; property: "x"; to: 800; duration: 500}
            NumberAnimation { target: digitalSpeed; property: "x"; to: 985; duration: 500}


            NumberAnimation{target: totalDistance; property: "x"; to: 27; duration: 800}
            NumberAnimation{target: totalDistance; property: "y"; to: 400; duration: 800}
            NumberAnimation{target: destination; property: "opacity"; to: 1.0; duration: 1000}
            NumberAnimation{target: destination; property: "x"; to: 300; duration: 800}
            NumberAnimation{target: destination; property: "y"; to: 400; duration: 800}
            NumberAnimation{target: time; property: "opacity"; to: 1.0; duration: 1000}
            NumberAnimation{target: time; property: "x"; to: 850; duration: 800}
            NumberAnimation{target: time; property: "y"; to: 400; duration: 800}
            NumberAnimation{target: date; property: "opacity"; to: 1.0; duration: 1000}
            NumberAnimation{target: date; property: "x"; to: 1100; duration: 800}
            NumberAnimation{target: date; property: "y"; to: 400; duration: 800}
            NumberAnimation{target: turn_left; property: "opacity"; to: 0.2; duration: 500}
            NumberAnimation{target: turn_right; property: "opacity"; to: 0.2; duration: 500}


            NumberAnimation {target: digitalSpeed; property: "visible";to:1; duration: 100}
        }

        // decrease active effect of dial
        ParallelAnimation{
            id: dialEffectStop
            running: false
            NumberAnimation{target: speed_active; property:  "opacity"; to: 0; duration: 1500}
            NumberAnimation{target: rpm_active; property:  "opacity"; to: 0; duration: 1500}
            NumberAnimation{target: totalDistance; property: "opacity"; to: 0; duration: 100}
            //NumberAnimation{target: digitRectangle; property: "opacity"; to: 0; duration: 1000}


            //Throwing the RPM meter sideways
            NumberAnimation { target:rpm_active; property:"x";to: 241; duration: 500 }
            NumberAnimation { target:rpm_inactive; property:"x";to: -30; duration: 500 }
            NumberAnimation { target:battery_low; property:"x";to: 200; duration: 500 }
            NumberAnimation { target:battery_low; property:"y";to: 85; duration: 500 }
            NumberAnimation { target:straightBeam; property:"x";to:320; duration: 500 }
            NumberAnimation { target:oilIndication; property: "x"; to: 110; duration: 500}
            NumberAnimation { target:needle; property: "x"; to:100 ; duration: 500}
            NumberAnimation { target:rpmOverlay; property: "x"; to: 98; duration: 500}
            NumberAnimation { target: turn_left; property: "x"; to: 560; duration: 500}

            //Throwing the Speedo meter sideways
            NumberAnimation { target:speed_active; property:"x";to: 695; duration: 500 }
            NumberAnimation { target:speed_inactive; property:"x";to: -9; duration: 500 }
            NumberAnimation { target:needle1; property: "x"; to:136; duration: 500}
            NumberAnimation { target:speedOverlay; property: "x"; to:123; duration: 500}
            NumberAnimation { target:parkingLight; property: "x"; to: 850; duration: 500 }
            NumberAnimation { target:petrol_indicator; property: "x"; to: 980; duration: 500 }
            NumberAnimation { target:petrol_indicator; property: "y"; to: 59; duration: 500 }
            NumberAnimation { target:brakeDamage; property: "x"; to: 1070; duration: 500 }
            NumberAnimation { target: turn_right; property: "x"; to: 660; duration: 500}
            NumberAnimation { target: digitalSpeed; property: "x"; to: 840; duration: 500}



            NumberAnimation{target: totalDistance; property: "x"; to: 363; duration: 200}
            NumberAnimation{target: totalDistance; property: "y"; to: 131; duration: 200}
            NumberAnimation{target: destination; property: "opacity"; to: 0; duration: 100}
            NumberAnimation{target: destination; property: "x"; to: 363; duration: 200}
            NumberAnimation{target: destination; property: "y"; to: 131; duration: 200}
            NumberAnimation{target: time; property: "opacity"; to: 0; duration: 100}
            NumberAnimation{target: time; property: "x"; to: 363; duration: 200}
            NumberAnimation{target: time; property: "y"; to: 131; duration: 200}
            NumberAnimation{target: date; property: "opacity"; to: 0; duration: 100}
            NumberAnimation{target: date; property: "x"; to: 363; duration: 200}
            NumberAnimation{target: date; property: "y"; to: 131; duration: 200}
            NumberAnimation{target: turn_left; property: "opacity"; to: 1; duration: 500}
            NumberAnimation{target: turn_right; property: "opacity"; to: 1; duration: 500}

            NumberAnimation {target: digitalSpeed; property: "visible";to:0; duration: 100}
            NumberAnimation {target: oil; property: "visible";to:0; duration: 100}
            NumberAnimation {target: brake; property: "visible";to:0; duration: 100}
            NumberAnimation {target: fuelLeak; property: "visible";to:0; duration: 100}
            NumberAnimation {target: battery; property: "visible";to:0; duration: 100}
            NumberAnimation {target: parkinglight; property: "visible";to:0; duration: 100}
            NumberAnimation {target: highBeam; property: "visible";to:0; duration: 100}
            NumberAnimation {target: turnleft; property: "visible";to:0; duration: 100}
            NumberAnimation {target: turnright; property: "visible";to:0; duration: 100}


        }



        //increase all indicator opacity
        SequentialAnimation{
            id: indicatorAnimateFocus
            running: false
            NumberAnimation{ target:straightBeam; property: "opacity"; to: 1; duration: 500}
            NumberAnimation{ target:oilIndication; property: "opacity"; to: 1; duration: 100}
            NumberAnimation{ target:battery_low; property: "opacity"; to: 1; duration: 600 }
            NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 1; duration: 300 }
            NumberAnimation{ target:parkingLight; property: "opacity"; to: 1; duration: 100 }
            NumberAnimation{ target:brakeDamage; property: "opacity"; to: 1; duration: 200 }
        }

        // decrease all indicators opacity
        SequentialAnimation{
            id: indicatorAnimatedDim
            running: false
            NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.2; duration: 100}
            NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.2; duration: 100}
            NumberAnimation{ target:battery_low; property: "opacity"; to: 0.2; duration: 100 }
            NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.2; duration: 100 }
            NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.3; duration: 100 }
            NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.3; duration: 100 }

        }

        SequentialAnimation{
            id: dummyAnimation
            running: false
            loops: Animation.Infinite
            NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.3; duration: 100}
            NumberAnimation{ target:highBeam; property: "visible"; to: 1; duration: 100}
            NumberAnimation{ target:highBeam; property: "x"; to: 710; duration: 300}
            NumberAnimation{ target:straightBeam; property: "opacity"; to: 1; duration: 3000}
            NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.2; duration: 100}
            NumberAnimation{ target:highBeam; property: "x"; to: 1280; duration: 3000}
            NumberAnimation{ target:highBeam; property: "visible"; to: 0; duration: 100}

            NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.9; duration: 100}
            NumberAnimation{ target:oil; property: "visible"; to: 1; duration: 100}
            NumberAnimation{ target:oil; property: "x"; to: 710; duration: 700}
            NumberAnimation{ target:oilIndication; property: "opacity"; to: 1; duration: 6000}
            NumberAnimation{ target:oil; property: "x"; to: 1280; duration: 700}
            NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.2; duration: 100}
            NumberAnimation{ target:oil; property: "visible"; to: 0; duration: 1300}


            NumberAnimation{ target:battery_low; property: "opacity"; to: 0.9; duration: 100}
            NumberAnimation{ target:battery; property: "visible"; to: 1; duration: 100}
            NumberAnimation{ target:battery; property: "x"; to: 710; duration: 300}
            NumberAnimation{ target:battery_low; property: "opacity"; to: 1; duration: 6000}
            NumberAnimation{ target:battery_low; property: "opacity"; to: 0.2; duration: 100}
            NumberAnimation{ target:battery; property: "x"; to: 1280; duration: 3000}
            NumberAnimation{ target:battery; property: "visible"; to: 0; duration: 100}


            NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.9; duration: 100 }
            NumberAnimation{ target:fuelLeak; property: "visible"; to: 1; duration: 100}
            NumberAnimation{ target:fuelLeak; property: "x"; to: 305; duration: 300}
            NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.9; duration: 6000 }
            NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.2; duration: 100 }
            NumberAnimation{ target:fuelLeak; property: "x"; to: -150; duration: 3000}
            NumberAnimation{ target:fuelLeak; property: "visible"; to: 0; duration: 100}


            NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.9; duration: 100 }
            NumberAnimation{ target:parkinglight; property: "visible"; to: 1; duration: 100}
            NumberAnimation{ target:parkinglight; property: "x"; to: 310; duration: 300}
            NumberAnimation{ target:parkingLight; property: "opacity"; to: 1; duration: 3000 }
            NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.2; duration: 100 }
            NumberAnimation{ target:parkinglight; property: "x"; to: -150; duration: 3000}
            NumberAnimation{ target:parkinglight; property: "visible"; to: 0; duration: 100}

            NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.9; duration: 100 }
            NumberAnimation{ target:brake; property: "visible"; to: 1; duration: 100}
            NumberAnimation{ target:brake; property: "x"; to: 330; duration: 300}
            NumberAnimation{ target:brakeDamage; property: "opacity"; to: 1; duration: 6000 }
            NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.2; duration: 100 }
            NumberAnimation{ target:brake; property: "visible"; to: 0; duration: 100}
            NumberAnimation{ target:brake; property: "x"; to: -150; duration: 3000}


            NumberAnimation{ target:turnright; property: "visible"; to: 1; duration: 100}

            ParallelAnimation{
                id:indicator
                NumberAnimation{ target:turnright; property: "x"; to: 330; duration: 300}
                NumberAnimation {target:turn_right; property: "opacity";from: 0.1; to: 1.0 ;loops: 30 }
            }

            NumberAnimation{ target:turnright; property: "x"; to: -150; duration: 3000}
            NumberAnimation {target:turn_right; property: "opacity";to: 0 ;loops: 30 }


            NumberAnimation{ target:turnleft; property: "visible"; to: 1; duration: 100}
            ParallelAnimation{
                id:indicator1
                NumberAnimation{ target:turnleft; property: "x"; to: 330; duration: 300}
                NumberAnimation {target:turn_left; property: "opacity";from: 0.1; to: 1.0 ;loops: 30 }
            }

            NumberAnimation{ target:turnleft; property: "x"; to: -150; duration: 3000}
            NumberAnimation {target:turn_left; property: "opacity";to: 0 ;loops: 30 }

        }





    }
}

