.pragma library

.import "qbjs/qbcore.js" as QbCoreJS
.import "qbjs/qbapp.js" as QbAppJS
.import "js/modeldata.js" as ModelDataJS

var os;
var appUI;
var initialized = false;


function init(_appUI,_os)
{
    appUI = _appUI;
    os = _os;

    //QbCoreJS setup
    QbCoreJS.setup(appUI.coreObject);
    //QbAppJS setup
    QbAppJS.setup(appUI);

    initialized = true;

    //ModelDataJS setup
    var app_root_path =  appUI.pathsObject.documents()+"/PixQb";
    appUI.dirObject.mkpath(app_root_path);
    appUI.dirObject.setPath(app_root_path);
    ModelDataJS.setup(appUI.dirObject);
}
