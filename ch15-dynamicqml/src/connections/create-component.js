// M1>>
var component;

function createAnimationObject(qmlfile,root,js) {
    component = Qt.createComponent(qmlfile);
    if (component.status === Component.Ready || component.status === Component.Error) {
        finishCreation(root,js);
    } else {
        component.statusChanged.connect(finishCreation);
    }
}

function finishCreation(root,js) {
    if (component.status === Component.Ready) {
        var image = component.createObject(root, js);
        if (image === null) {
            console.log("Error creating image");
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
    }
}

// <<M1
