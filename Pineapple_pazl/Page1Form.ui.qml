import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }


    Image {
        id: image
        anchors.fill: parent
        source: "Images/Geometricheskie-kartiny-Eduardo-Rodriguez-Calzado.jpg"
        fillMode: Image.PreserveAspectCrop


    }

    Label {
        color: "#eff1f2"
        text: qsTr("")
        styleColor: "#0b0a0a"
        renderType: Text.QtRendering
        font.pointSize: 11
        anchors.verticalCenterOffset: -145
        anchors.horizontalCenterOffset: -249
        anchors.centerIn: parent
    }

}


