/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Rectangle {
    width: 400; height: 240
    color: "white"

    ListModel {
        id: appModel
        ListElement { name: "Music"; icon: "image/settings.png" }
        ListElement { name: "Movies"; icon: "image/settings.png" }
        ListElement { name: "Camera"; icon: "image/settings.png" }
        ListElement { name: "Calendar"; icon: "image/settings.png" }
        ListElement { name: "Messaging"; icon: "image/settings.png" }
        ListElement { name: "Todo List"; icon: "image/settings.png" }
        ListElement { name: "Contacts"; icon: "image/settings.png" }
    }

    Component {
        id: appDelegate
        Item {
            width: 100; height: 100
            scale: PathView.iconScale

            Image {
                id: myIcon
                y: 20; anchors.horizontalCenter: parent.horizontalCenter
                source: icon
            }
            Text {
                anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                text: name
            }

            MouseArea {
                anchors.fill: parent
                onClicked: view.currentIndex = index
            }
        }
    }

    Component {
        id: appHighlight
        Rectangle { width: 80; height: 80; color: "lightsteelblue" }
    }

    PathView {
        id: view
        anchors.fill: parent
        highlight: appHighlight
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        focus: true
        model: appModel
        delegate: appDelegate
        path: Path {

            startX: 10; startY: 50;
            PathAttribute { name: "iconScale"; value: 0.5 }
            PathQuad { x: 200; y: 100; controlX: 50; controlY: 200; }
            PathAttribute { name: "iconScale"; value: 1.0 }
            PathQuad { x: 390; y: 50; controlX: 350; controlY: 200 }
            PathAttribute { name: "iconScale"; value: 0.5 }

            /*
            startX: 0; startY: 100
            PathAttribute { name: "iconScale"; value: 0.5 }
            PathCurve { x: 75; y: 75 }
            PathCurve { x: 200; y: 150 }
            PathCurve { x: 325; y: 25 }
            PathAttribute { name: "iconScale"; value: 1.0 }
            PathCurve { x: 390; y: 100 }
            PathAttribute { name: "iconScale"; value: 0.5 }
            */
            /*
            startX: 100; startY: 5
            PathAttribute { name: "iconScale"; value: 0.5 }
            PathArc {x: 15; y: 100;radiusX: 100; radiusY: 100;useLargeArc: true}
            PathAttribute { name: "iconScale"; value: 1.0 }
            */
        }
    }
}
