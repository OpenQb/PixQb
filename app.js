.pragma library

.import "qbjs/qbcore.js" as QbCoreJS
.import "qbjs/qbapp.js" as QbAppJS

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
}
