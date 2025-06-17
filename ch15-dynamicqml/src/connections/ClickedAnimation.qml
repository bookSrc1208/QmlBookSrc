import QtQuick 2.5
/*
Rectangle{
    id:root
    property Item target:root
    visible: false
    SequentialAnimation {
        id: clickedAnimation
        PropertyAction {
            target: root.target
            property: "color"
            value: "white"
        }
        ColorAnimation {
            target: root.target
            property: "color"
            to: "green"
            duration: 3000
        }
    }

    function start() {
        clickedAnimation.start();
    }

}
*/

SequentialAnimation {
    //id:root
    //id: clickedAnimation
    property Item target:undefined
    PropertyAction {
        target: parent.target
        property: "color"
        value: "white"
    }
    ColorAnimation {
        target: parent.target
        property: "color"
        to: "green"
        duration: 3000
    }
//    Rectangle{
//        id:rect
//        visible: false
//    }

}

