import QtQuick 2.7
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
//import Qt.labs.platform 1.0

ImageViewerWindow {
    
    // ...

    id: window
    
    width: 640
    height: 480
    /*menuBar: MenuBar {
        id:menu
        Menu {
            id:menu1
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open...")
                iconName: "document-open"
                //icon.name: "document-open"
                onTriggered: window.openFileDialog()
            }
        }

        Menu {
            title: qsTr("&Help")
            MenuItem {
                text: qsTr("&About...")
                iconName: "document-about"
                onTriggered: window.openAboutDialog()
            }
        }
    }*/

    header: ToolBar {
        Flow {
            anchors.fill: parent
            ToolButton {
                text: qsTr("Open")
                //iconName: "document-open"
                onClicked: window.openFileDialog()
            }
            ToolButton {
              text: qsTr("File")
              onClicked: menu.open()
          }

        }
    }
    Menu {
        id:menu
        rightMargin: 1
        title: qsTr("File")
        //visible: true
        MenuItem {
            text: qsTr("&Open...")
            //iconName: "document-open"
            //icon.name: "document-open"
            onTriggered: window.openFileDialog()
        }
    }

    // ...

}
