import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 2")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }

    Image {
        id: image1
        anchors.fill: parent
        source: "Images/flamingo.png"
        fillMode: Image.PreserveAspectCrop
    }
}

/*##^##
Designer {
    D{i:3;anchors_x:119;anchors_y:90}
}
##^##*/