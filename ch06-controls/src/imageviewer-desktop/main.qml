import QtQuick 2.5
//import QtQuick.Controls 2.4 as Controls22
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
//import Qt.labs.platform 1.0

ApplicationWindow {
    
    // ...
    
    visible: true
    width: 640
    height: 480
    title: qsTr("Image Viewer")
    
    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open...")
                iconName: "document-open"
                onTriggered: fileOpenDialog.open()
            }
        }

        Menu {
            title: qsTr("&Help")
            MenuItem {
                text: qsTr("&About...")
                onTriggered: aboutDialog.open()
            }
        }
    }


    toolBar: ToolBar {
        Flow {
            anchors.fill: parent
            ToolButton {
                text: qsTr("Open")

                iconName: "document-open"
                onClicked: fileOpenDialog.open()
            }
        }
    }

//    background: Rectangle {
//        color: "darkGray"
//    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    FileDialog {
        id: fileOpenDialog
        title: "Select an image file"
        folder: shortcuts.documents
        nameFilters: [
            "Image files (*.png *.jpeg *.jpg)",
        ]
        onAccepted: {
            image.source = fileOpenDialog.fileUrl
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }
        standardButtons: StandardButton.Ok
    }

    // ...

}
