import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: element   
    property color innerColor: "#000000"
    property color outerColor: "#ff0000"   
    state:""
    width: 300
    height: 260
    states:[
        State {
            name: "stalled"
            PropertyChanges { target: imageLeft; rotation: 45}
        },
        State {
            name: "paused"
            PropertyChanges { target: imageLeft; rotation: 55}
            PropertyChanges { target: imageCore ; scale: 0}
            PropertyChanges { target: imageCoreLeft; scale: 1}
        },
        State {
            name: "playing"
            PropertyChanges { target: imageLeft; rotation: 360}
        }
    ]
    transitions:[
        Transition {
            to: "paused"
            SequentialAnimation {
                RotationAnimation {target: imageLeft ; duration: 10; to: 45; direction: RotationAnimation.Clockwise }
                ParallelAnimation {
                    NumberAnimation { target: imageKvadLeft ; property: "scale"; to: 1; duration: 400 }
                    NumberAnimation { target: imageCoreLeft ; property: "scale"; to: 0.3; duration: 400 }
                    NumberAnimation { target: imageLeft ; property: "y"; to: -15; duration: 200 }
                    NumberAnimation { target: imageLeft ; property: "x"; to: 6; duration: 200 }
                    NumberAnimation { target: imageRight ; property: "y"; to: 15; duration: 200 }
                    NumberAnimation { target: imageRight ; property: "x"; to: -6; duration: 200 }
                    NumberAnimation { target: imageCoreLeft ; property: "y"; to: -9; duration: 300 }
                    NumberAnimation { target: imageCoreLeft ; property: "x"; to: 9; duration: 300 }
                    NumberAnimation { target: imageCoreRight ; property: "y"; to: 9; duration: 300 }
                    NumberAnimation { target: imageCoreRight ; property: "x"; to: -9; duration: 300 }
                    RotationAnimation {target: imageLeft ; duration: 400; to: 55; direction: RotationAnimation.Clockwise }

                }
            }
        },
        Transition {
            to: "stalled"
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation { target: imageCore ; property: "scale"; to: 1; duration: 400 }
                    NumberAnimation { target: imageKvadLeft ; property: "scale"; to: 0.0; duration: 400 }
                    NumberAnimation { target: imageCoreLeft ; property: "scale"; to: 0.0; duration: 400 }
                    NumberAnimation { target: imageLeft ; property: "y"; to: 0; duration: 300 }
                    NumberAnimation { target: imageLeft ; property: "x"; to: 0; duration: 300 }
                    NumberAnimation { target: imageRight ; property: "y"; to: 0; duration: 300 }
                    NumberAnimation { target: imageRight ; property: "x"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreLeft ; property: "y"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreLeft ; property: "x"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreRight ; property: "y"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreRight ; property: "x"; to: 0; duration: 300 }
                }
                SequentialAnimation {
                    NumberAnimation {target: imageCore ; property: "scale";to: 0.3; duration: 400 }
                    PauseAnimation { duration: 100 }
                    NumberAnimation {target: imageCore ; property: "scale";to: 1; duration: 400 }
                    loops: Animation.Infinite
                }
            }
        },
        Transition {
            to: "playing"
            SequentialAnimation{
                ParallelAnimation {
                    SequentialAnimation{
                        ParallelAnimation {
                          NumberAnimation { target: imageKvadLeft ; property: "scale"; to: 0.0; duration: 400 }
                          NumberAnimation { target: imageCoreLeft ; property: "scale"; to: 1; duration: 400 }
                         }
                        NumberAnimation { target: imageCore ; property: "scale"; to: 1; duration: 10 }
                    }
                    NumberAnimation { target: imageLeft ; property: "y"; to: 0; duration: 200 }
                    NumberAnimation { target: imageLeft ; property: "x"; to: 0; duration: 200 }
                    NumberAnimation { target: imageRight ; property: "y"; to: 0; duration: 200 }
                    NumberAnimation { target: imageRight ; property: "x"; to: 0; duration: 200 }
                    NumberAnimation { target: imageCoreLeft ; property: "y"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreLeft ; property: "x"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreRight ; property: "y"; to: 0; duration: 300 }
                    NumberAnimation { target: imageCoreRight ; property: "x"; to: 0; duration: 300 }
                }
                ParallelAnimation {
                    loops: Animation.Infinite
                    RotationAnimation {target: imageLeft ; duration: 4000; direction: RotationAnimation.Clockwise }

                }
            }
        }
    ]

    Image {
        id: imageLeft
        visible: true
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        source: "Images/pineappleLeft.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            source: imageLeft
            color: outerColor
            anchors.fill: parent  // make image like it lays under red glass
        }
    }

    Image {
        id: imageCoreLeft
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        rotation: imageLeft.rotation
        visible: true
        source: "Images/CoreLeft.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: imageCoreLeft
            source: imageCoreLeft
            color: innerColor // make image like it lays under red glass
        }
    }

    Image {
        id: imageRight
        x: imageRight.x
        y: imageRight.y
        width: parent.width
        height: parent.height
        rotation: imageLeft.rotation
        visible: true
        source: "Images/pineappleRight.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: imageRight
            source: imageRight
            color: outerColor  // make image like it lays under red glass
        }

    }

    Image {
        id: imageCoreRight
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        rotation: imageLeft.rotation
        scale: imageCoreLeft.scale
        visible: imageCoreLeft.visible
        source: "Images/CoreRight.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: imageCoreRight
            source: imageCoreRight
            color: innerColor    // make image like it lays under red glass

         }

    }

    Image {
        id: imageKvadLeft
        x: imageCoreLeft.x
        y: imageCoreLeft.y
        width: parent.width
        height: parent.height
        rotation: imageLeft.rotation
        scale: 0.3
        source: "Images/CoreKvadLeft.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: imageKvadLeft
            source: imageKvadLeft
            color: innerColor  // make image like it lays under red glass
        }
    }

    Image {
        id: imageCore
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        source: "Images/pineappleCore.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: imageCore
            source: imageCore
            color: innerColor  // make image like it lays under red glass
        }
    }

    Image {
        id: imageKvadRight
        x: imageCoreRight.x
        y: imageCoreRight.y
        width: parent.width
        height: parent.height
        rotation: imageLeft.rotation
        scale:imageKvadLeft.scale
        visible: imageKvadLeft.visible
        source: "Images/CoreKvadRight.svg"
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: imageKvadRight
            source: imageKvadRight
            color: innerColor  // make image like it lays under red glass
        }
    }


}

/*##^##
Designer {
    D{i:3;invisible:true}D{i:2;invisible:true}D{i:1;anchors_height:207;anchors_width:235;anchors_x:61;anchors_y:46}
D{i:8;anchors_x:"-71";anchors_y:70;invisible:true}D{i:34;anchors_x:"-71";anchors_y:70}
D{i:35;anchors_x:"-71";anchors_y:70}D{i:36;anchors_x:0;anchors_y:0}D{i:37;anchors_x:"-71";anchors_y:70;invisible:true}
D{i:38;anchors_height:260;anchors_width:300;anchors_x:"-71";anchors_y:70}D{i:39;anchors_x:"-71";anchors_y:70}
D{i:40;anchors_x:"-71";anchors_y:70}D{i:41;anchors_x:"-71";anchors_y:70}D{i:33;anchors_x:"-71";anchors_y:70}
D{i:43;anchors_x:"-71";anchors_y:70}D{i:44;anchors_x:"-92";anchors_y:63}D{i:45;anchors_x:"-92";anchors_y:63}
D{i:46;anchors_x:"-69";anchors_y:46}D{i:47;anchors_x:"-69";anchors_y:46}D{i:48;anchors_x:0;anchors_y:0}
D{i:49;anchors_x:"-71";anchors_y:70}D{i:50;anchors_x:0;anchors_y:0}D{i:52;anchors_x:"-71";anchors_y:70}
D{i:51;anchors_x:"-71";anchors_y:70}D{i:42;anchors_x:"-71";anchors_y:70}D{i:55;anchors_x:0;anchors_y:0}
D{i:14;anchors_x:"-107";anchors_y:60;invisible:true}D{i:15;anchors_height:260;anchors_width:300;anchors_x:29;anchors_y:"-31"}
D{i:17;anchors_x:"-181";anchors_y:35}D{i:18;anchors_x:"-181";anchors_y:35}D{i:20;anchors_x:"-181";anchors_y:35}
D{i:21;anchors_x:"-92";anchors_y:63}D{i:22;anchors_x:"-92";anchors_y:63}D{i:23;anchors_x:"-69";anchors_y:46}
D{i:16;anchors_x:62;anchors_y:26}D{i:25;anchors_x:0;anchors_y:0}D{i:26;anchors_x:"-71";anchors_y:70}
D{i:27;anchors_x:0;anchors_y:0}D{i:28;anchors_x:"-71";anchors_y:70}D{i:29;anchors_x:"-71";anchors_y:70}
D{i:30;anchors_x:"-71";anchors_y:70}D{i:31;anchors_x:0;anchors_y:0}D{i:32;anchors_x:"-71";anchors_y:70}
D{i:24;anchors_x:"-69";anchors_y:46}D{i:10;anchors_x:"-71";anchors_y:70}D{i:9;anchors_x:"-71";anchors_y:70;invisible:true}
D{i:69;anchors_x:"-71";anchors_y:70}D{i:68;anchors_height:260;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:71;anchors_x:"-71";anchors_y:70}D{i:70;anchors_x:"-71";anchors_y:70}D{i:73;anchors_x:"-71";anchors_y:70}
D{i:72;anchors_x:"-71";anchors_y:70}D{i:75;anchors_x:"-71";anchors_y:70}D{i:74;anchors_x:"-71";anchors_y:70}
D{i:77;anchors_x:"-71";anchors_y:70}D{i:76;anchors_x:"-71";anchors_y:70}
}
##^##*/
