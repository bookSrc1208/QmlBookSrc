import QtQuick 2.0
import QtQuick.Controls 2.4 as Controls14
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    
    // ...
    
    id: window

    visible: true
    width: 360
    height: 520
    title: qsTr("Image Viewer")

    Drawer {
        id: drawer

        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        ListView {
            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked: {
                    drawer.close()
                    //model.triggered()
                    //lst.triggered(index);

                    switch (index){
                    case 0:
                        fileOpenDialog.open();
                        break;
                     case 1:
                         aboutDialog.open();
                         break;
                     default:
                         ;
                    }
                }
            }

            model: ListModel {
                id:lst
                ListElement {
                    text: qsTr("Open...")
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: function(){ fileOpenDialog.open(); }
//                    }


                    function  triggered1(){ fileOpenDialog.open(); }
                }
                ListElement {
                    text: qsTr("About...")
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: function(){ aboutDialog.open(); }
//                    }
                    //triggered: function(){ aboutDialog.open(); }
                    function  triggered(){ fileOpenDialog.open(); }
                }
            }

            function  triggered(index){
                switch (index){
                case 0:
                    fileOpenDialog.open();
                    break;
                 case 1:
                     aboutDialog.open();
                     break;
                 default:
                     ;
                }
            }


            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    
    header: ToolBar {
        Material.background: Material.Orange

        Controls14.ToolButton {
            id: menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            iconSource: "images/baseline-menu-24px.svg"
            onClicked: drawer.open()
        }
        Label {
            anchors.centerIn: parent
            text: "Image Viewer"
            font.pixelSize: 20
            elide: Label.ElideRight
        }
    }

    background: Rectangle {
        color: "darkGray"
    }

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
