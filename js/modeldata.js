.pragma library

var gDir;

function setup(_dir)
{
    gDir = _dir;
}

function saveAsPath()
{
    return gDir.absolutePath();
}

function getQMLFileList()
{
    var fileList = [];

    if(gDir)
    {
        gDir.setNameFilters("*.qml");
        fileList = gDir.entryInfoList();
    }

    return fileList;
}
