import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Rectangle {									//(a)
    id: cityDialog
    //title: "city"
    width: 275
    height: 300
    //standardButtons: StandardButton.Save | StandardButton.Cancel														//(b)
    //onAccepted: main.date.text = calendar.selectedDate.toLocaleDateString()		//(c)
    property variant colArray: ["City:", "Country:", "Area:","Popular:","ImageUrl:"]

    property string city: rep.itemAt(0).children[1].text;
    property string country: rep.itemAt(1).children[1].text;
    property string area: rep.itemAt(2).children[1].text;
    property string popular: rep.itemAt(3).children[1].text;
    property string imageurl: rep.itemAt(4).children[1].text;
/*
    Rectangle{
        id:rec
        height: 30
        width: cityDialog.width
        border.color: "red"
        Label{
            id:lab
            anchors.left: parent.left
            //anchors.right: parent.right

            height: rec.height
            text: "City:"
            verticalAlignment: Text.AlignVCenter//colArray[0]
            width: 60
            //background: "gray"
            horizontalAlignment:Text.AlignRight
        }
        TextEdit{
            anchors.left: lab.right
            anchors.right: parent.right
            height: parent.height
            id:textedit
        }
    }
*/
        Column{
            anchors.fill: parent
            //anchors.bottom: parent.bottom
            anchors.margins: 8
            spacing: 2
            Repeater {
                id:rep
                model: 5
                Rectangle{
                    id:rec
                    height: 30
                    width: parent.width
                    border.color: "red"
                    Label{
                        id:lab
                        anchors.left: parent.left
                        //anchors.right: parent.right

                        height: rec.height
                        text: cityDialog.colArray[index]
                        verticalAlignment: Text.AlignVCenter
                        width: 80
                        styleColor: "#c8c4c4"
                        //background: "gray"
                        horizontalAlignment:Text.AlignRight
                    }
                    TextEdit{
                        //id:texteditindex
                        objectName: "textedit"+index
                        anchors.left: lab.right
                        anchors.right: parent.right
                        height: parent.height
                        text:"https://www.ifreesite.com/world/image/yemen_flag.png"

                    }
                }


            }
//            TextEdit{
//                id:text1
//                //anchors.left: rep.left
//                //anchors.right: pa.right
//                width: parent.width
//                height: 30
//                //text:
//                Rectangle{
//                    anchors.fill: parent
//                    border.color: "blue"
//                }
//            }
            Image {
                id: img
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.top: rep.bottom
                height: parent.height-rep.model*32

                source: rep.itemAt(rep.count-1).children[1].text;
                //source:"https://www.ifreesite.com/world/image/yemen_flag.png"
            }
        }

}
