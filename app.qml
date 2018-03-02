import QtQuick 2.10

import Qb 1.0
import Qb.Core 1.0
import Qb.Archive 1.0

import "app.js" as AppJS
import "qbjsx/qbpaths.js" as QbPathsJS


QbApp {
    id: appUI
    
    property alias zipObject: zipObject;
    property alias coreObject: coreObject;

    Component.onCompleted: {
        AppJS.init(appUI,Qt.platform.os);
        var t1 = new QbPathsJS.QbPaths(appUI);
        console.log(t1.documents());
    }

    /**** Initialize all non gui components here **************************************************/
    QbCore{
        id: coreObject
    }

    QbZip{
        id: zipObject
    }

    QbSettings{
        id: settingsObject
        name: appUI.appTitle
    }

    /**** Initialize all gui components here **************************************************/
    Ui{
        id: uiObject
    }
}
