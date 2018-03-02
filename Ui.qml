import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

import Qb 1.0
import Qb.Core 1.0
import Qb.Movie 1.0

import "qbjs/qbapp.js" as QbAppJS
import "js/modeldata.js" as ModelDataJS

Pane{
    id: contentContainer
    anchors.fill: parent
    topPadding: 0
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    Material.accent: Material.Amber
    Material.primary: Material.Blue
    Material.background: Material.Grey

    property var projectModel: ([]);


    QbMovieRenderer{
        id: movieRendererObject
    }

    Dialog{
        id: dialogObject
        modal: true
        standardButtons: Dialog.Ok
        x: (contentContainer.width - dialogObject.width)/2.0
    }

    Component.onCompleted: {
        projectModel = ModelDataJS.getQMLFileList();
        //console.log("doing");
        //movieRendererObject.renderPNG(ModelDataJS.getQMLFileList()[0]["absoluteFilePath"],"Test",ModelDataJS.saveAsPath(),Qt.size(500,500));
        //console.log("done");
    }


    ToolBar{
        id: toolBarObject
        width: parent.width
        height: QbCoreOne.getQbCore().scale(50)
        anchors.top: parent.top

        ToolButton{
            id: backButtonObject
            text: QbMF3.icon("mf-keyboard_arrow_left")
            font.family: QbMF3.family
            font.pixelSize: width/2.0
            width: QbCoreOne.getQbCore().scale(50)
            height: QbCoreOne.getQbCore().scale(50)
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            onClicked:{
                QbAppJS.hide();
            }
        }

//        Row{
//            anchors.left: backButtonObject.right
//            anchors.right: menuButtonObject.left
//            height: parent.height
//            TextField {
//                id: widthFieldObject
//                placeholderText: "WIDTH"
//                text: "1200"
//            }

//            TextField{
//                id: heightFieldObject
//                placeholderText: "HEIGHT"
//                text: "630"
//            }
//        }

//        Label {
//            id: titleObject
//            text: "PixQb"
//            font.family: QbFA.family
//            font.pixelSize: QbCoreOne.getQbCore().scale(17)
//            elide: Label.ElideRight
//            horizontalAlignment: Qt.AlignHCenter
//            verticalAlignment: Qt.AlignVCenter
//            width: parent.width
//            height: backButtonObject.height
//            anchors.bottom: parent.bottom
//        }

        ToolButton{
            id: menuButtonObject
            text: QbMF3.icon("mf-more_vert")
            font.family: QbMF3.family
            width: QbCoreOne.getQbCore().scale(50)
            height: QbCoreOne.getQbCore().scale(50)
            font.pixelSize: width/2.0
            anchors.right: parent.right
            onClicked: contextMenuObject.open()
            anchors.bottom: parent.bottom

            Menu {
                id: contextMenuObject

                MenuItem {
                    text: "Refresh"
                    onTriggered: {
                        projectModel = ModelDataJS.getQMLFileList();
                    }
                }
                MenuItem {
                    text: "Exit"
                    onTriggered: {
                        QbAppJS.close();
                    }
                }

            }

        }

    }

    ListView{
        id: projectListView
        clip: true
        width: parent.width
        height: parent.height - toolBarObject.height
        anchors.bottom: parent.bottom
        model: projectModel
        delegate: Item{
            id: __delegate
            width: projectListView .width
            height: QbCoreOne.getQbCore().scale(50)

            Rectangle{
                id: __data_place_holder
                anchors.fill: parent
                color: index%2==0?"lightgrey":"lightblue"
                Button{
                    flat: true
                    anchors.fill: parent

                    topPadding: 0
                    bottomPadding: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0

                    Material.foreground: "black"
                    Material.theme: Material.Light
                    contentItem: Label{
                        topPadding: 0
                        bottomPadding: 0
                        anchors.leftMargin: QbCoreOne.getQbCore().scale(10)
                        anchors.fill: parent
                        text: projectModel[index]["fileName"]//model.fileName+"\n"+size
                        verticalAlignment: Label.AlignVCenter
                    }
                    onClicked: {
                        var filePath = projectModel[index]["absoluteFilePath"];
                        var fileName = projectModel[index]["completeBaseName"];
                        //,Qt.size(widthFieldObject.text,heightFieldObject.text)
                        movieRendererObject.renderPNG(filePath,fileName,ModelDataJS.saveAsPath());
                        dialogObject.title = "Export complete.";
                        dialogObject.open();

                    }
                }

            }
        }

    }
}
