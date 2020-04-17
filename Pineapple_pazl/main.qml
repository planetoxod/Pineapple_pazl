import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Pineapple")

    SwipeView {
        id: swipeView
        anchors.rightMargin: 0
        anchors.bottomMargin: -9
        anchors.leftMargin: 0
        anchors.topMargin: 9
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        onCurrentItemChanged:{
            if (currentIndex==0){
                aPineaplle.state = "paused"
            }else if(currentIndex==1){
                aPineaplle.state = "playing"
            }
        }

        Page1Form {
            id: page1Form
        }

        Page2Form {
        }

    }
    Pineapple {
        id: aPineaplle
        anchors.rightMargin: 179
        anchors.left: parent.left
        anchors.leftMargin: 161
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 69
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    Slider {
        id: sliderOuterColor
        anchors.left: parent.left
        anchors.leftMargin: 13
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
        anchors.top: parent.top
        anchors.topMargin: 103
        orientation: Qt.Vertical
        value: 0.5
        onPositionChanged: {
            var mPalette = ["red", "green", "blue", "yellow", "white",
                            "black","aliceblue","brown","gray","olive","orange","orangered"]
            var i = Math.trunc(mPalette.length*value)
            if((i>-1)&&(i<mPalette.length)) aPineaplle.outerColor = mPalette[i]

        }
    }

    Slider {
        id: sliderInnerColor
        x: 547
        anchors.top: parent.top
        anchors.topMargin: 103
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
        anchors.right: parent.right
        anchors.rightMargin: 13
        value: 0.5
        orientation: Qt.Vertical
        onPositionChanged: {
            var mPalette = ["red", "green", "blue", "yellow", "white",
                            "black","aliceblue","brown","gray","olive","orange","orangered"]
            var i = Math.trunc(mPalette.length*value)
            if((i>-1)&&(i<mPalette.length)) aPineaplle.innerColor = mPalette[i]
        }
    }

    Button {
        id: buttonPlay
        width: 77
        height: 25
        text: qsTr("Play")
        anchors.left: parent.left
        anchors.leftMargin: 74
        anchors.top: parent.top
        anchors.topMargin: 79
        onClicked: {
            aPineaplle.state = "playing"
        }
    }

    Button {
        id: buttonStalled
        x: 467
        width: 83
        height: 25
        text: qsTr("Stalled")
        anchors.right: parent.right
        anchors.rightMargin: 90
        anchors.top: parent.top
        anchors.topMargin: 79
        onClicked: {
            aPineaplle.state = "stalled"
        }
    }

    Button {
        id: buttonPaused
        x: 274
        width: 84
        height: 25
        text: qsTr("Paused")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 79
        onClicked: {
            aPineaplle.state = "paused"
        }
    }
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }

}

/*##^##
Designer {
    D{i:2;anchors_x:99}D{i:7;anchors_x:467;anchors_y:70}D{i:8;anchors_width:167;anchors_x:467;anchors_y:70}
D{i:9;anchors_width:167;anchors_x:191;anchors_y:92}D{i:11;anchors_width:167;anchors_x:191;anchors_y:92}
D{i:10;anchors_width:167;anchors_x:191;anchors_y:92}
}
##^##*/
