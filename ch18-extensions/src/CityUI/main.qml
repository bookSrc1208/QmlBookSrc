import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import org.example.io 1.0

ApplicationWindow {
    id: root
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    Action {
        id: save
        text: qsTr("&Save")
        shortcut: StandardKey.Save
        onTriggered: {
            saveDocument()
        }
    }

    Action {
        id: open
        text: qsTr("&Open")
        shortcut: StandardKey.Open
        onTriggered: openDialog.open()
    }
    Action {
        id: add
        text: qsTr("&Add")
        onTriggered: {
            cityDialog.set();
            cityDialog.setType(cityDialog.dlgType.add)
            cityDialog.open()
//            console.log("11111");
//            if(cityDialog.result === Dialog.Accepted){
//                console.log("22222");
//                viewmode.append(cityDialog.get());
//            }

//            view.addColumn()
//            cityDialog.set()
//            cityDialog.open();
            //JSON.parse(io.text)
            //view.model.push('{ "area": "1928", "city": "Tianjin", "country": "China", "flag": "https://www.ifreesite.com/world/image/china_flag.png", "population": "13831900" }');
//         var arr = new   Array();
//            arr.push({})
            //view.addColumn()
            //console.log('111');
//            if(typeof view.model == 'undefined'){
//                //console.log('222');
//                view.model = new Array();
//            }
            //console.log('333');
            //view.model.push({ "area": "1928", "city": "Tianjin", "country": "China", "flag": "https://www.ifreesite.com/world/image/china_flag.png", "population": "13831900" });
            //view.addColumn()
            //view.update();
            //viewmode.append({ "area": "1928", "city": "Tianjin", "country": "China", "flag": "https://www.ifreesite.com/world/image/china_flag.png", "population": "13831900" })

            //console.log(typeof view.model)
            //console.log(view.model instanceof Array)
            //console.log(view.model.length)
        }
    }

    Action {
        id: exit
        text: qsTr("E&xit")
        onTriggered: Qt.quit();
    }
    Dialog {									//(a)
        id: cityDialog
        title: "city"
        width: 275
        height: 300
        standardButtons: StandardButton.Save | StandardButton.Cancel							//(b)
        property variant colArray: ["City", "Country", "Area","Population","ImageUrl"]
        property int type: 0//TYPE.add
        //enum Type {add, mod}//5.10 新加
        property variant dlgType: {"add":0, "mod":1}

/*
        //alias
        property string city: rep.itemAt(0).children[1].text;
        property string country: rep.itemAt(1).children[1].text;
        property string area: rep.itemAt(2).children[1].text;
        property string popular: rep.itemAt(3).children[1].text;
        property string imageurl: rep.itemAt(4).children[1].text;
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
                    property alias text: input.text
                    id:rec
                    border.color:"#E3E3E3"
                    height: 30
                    width: parent.width
                    Rectangle{
                        id:lab
                        anchors.left: parent.left
                        //anchors.right: parent.right
                        width: 80
                        height: rec.height
                        color:"#E3E3E3"
                        Text{
                            text: cityDialog.colArray[index]+":"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment:Text.AlignRight

                            anchors.fill: parent

                        }
                    }
                    TextInput{
                        id:input
                        objectName: "textedit"+index
                        anchors.left: lab.right
                        anchors.right: parent.right
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment:Text.AlignLeft
                        selectByMouse:true
                        clip: true
                        text:"https://www.ifreesite.com/world/image/china_flag.png"
                    }
                }


            }
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
        function set(city,country,area,popular,imageurl){
            rep.itemAt(0).children[1].text = getstr(city);
            rep.itemAt(1).children[1].text = getstr(country);
            rep.itemAt(2).children[1].text = getstr(area);
            rep.itemAt(3).children[1].text = getstr(popular);
            rep.itemAt(4).children[1].text = (getstr(imageurl) === "" )? "https://www.ifreesite.com/world/image/china_flag.png" :getstr(imageurl);
        }
        function get(){
            var obj = {
                "city":     rep.itemAt(0).text,
                "country":  rep.itemAt(1).text,
                "area":     rep.itemAt(2).text,
            "population":   rep.itemAt(3).text,
                "flag":     rep.itemAt(4).text,
            }
            console.log(obj.city+obj.country+obj.area+obj.population+obj.flag)
            return obj;
        }
        function getstr(str){
            if(str === undefined)
                return ""
            return str;
        }
        function setType(t){
            type = t;
        }

        onAccepted:{
            if(type === 0)//Type.add
                viewmode.append(cityDialog.get());
            else{
                viewmode.set(view.currentRow,cityDialog.get())
            }
        }

    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action: open }
            MenuItem { action: save }
            MenuItem { action: add }
            MenuSeparator {}
            MenuItem { action: exit }
        }
    }


    function readDocument() {
        viewmode.clear();
        io.source = openDialog.fileUrl;
        io.read();
        var arr = JSON.parse(io.text);
        for(var i=0;i<arr.length;i++){
            viewmode.append(arr[i])
        }

        //view.model =
    }

    function saveDocument() {
        var data = view.model
        var arr = new Array();
        for(var i=0;i<viewmode.count;i++){
            arr.push(viewmode.get(i))
        }
        io.text = JSON.stringify(arr, null, 4)
        io.write()
    }

    ListModel {
        id: viewmode
    }

    TableView {
        id: view
        model: viewmode
        anchors.fill: parent
        TableViewColumn {
            role: 'city'
            title: "City"
            width: 120
        }
        TableViewColumn {
            role: 'country'
            title: "Country"
            width: 120
        }
        TableViewColumn {
            role: 'area'
            title: "Area"
            width: 80
        }
        TableViewColumn {
            role: 'population'
            title: "Population"
            width: 80
        }
        TableViewColumn {
            delegate: Item {
                Image {
                    fillMode: Image.PreserveAspectFit//PreserveAspectFit
                    height: parent.height
                    anchors.centerIn: parent
                    source: styleData.value //'flags/' + styleData.value
                }
            }
            role: 'flag'
            title: "Flag"
            width: 40
        }
        TableViewColumn {
            delegate: Button {
                iconSource: "remove.png"
                onClicked: {
                    var data = view.model
                    data.splice(styleData.row, 1)
                    view.model = data
                }
            }
            width: 40
        }

        onDoubleClicked:{
            var obj = viewmode.get(row);

            cityDialog.set(obj.city,obj.country,obj.area,obj.population,obj.flag);
            cityDialog.setType(cityDialog.dlgType.mod)
            cityDialog.open();
        }

    }

    FileDialog {
        id: openDialog
        onAccepted: {
            root.readDocument()
        }
    }

    FileIO {
        id: io
    }

}
