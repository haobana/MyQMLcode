import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Window {
    id: window
    visible: true //表示部件可见
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 200
    title: qsTr("Hello World")
    visibility: Window.Maximized // 设置全屏

    ColumnLayout{
        id: layout
        anchors.fill: parent
        spacing: 6

        Rectangle{
            id:recttitle
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                id: mytitle
                //text: test.whatkey
                text: "你按下哪个按键"
                anchors.centerIn: parent

                font.pixelSize: 24
            }
        }

        GridLayout{
            id:gridlayout1
            flow: GridLayout.LeftToRight
            anchors.topMargin: 0
            rows:2
            columns: 2
            rowSpacing: 5
            columnSpacing: 5
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle{
                id:rectvoladd
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: rect1txt
                    text: "vol+"
                    anchors.centerIn: parent

                    font.pixelSize: 24
                }
                border.color: "black"                //他边框颜色是黑色
                border.width: 3                      //他边框宽度是5
                radius: 35
            }
            Rectangle{
                id:rectvolsub
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: rect2txt
                    text: "vol-"
                    anchors.centerIn: parent

                    font.pixelSize: 24
                }
                border.color: "black"                //他边框颜色是黑色
                border.width: 3                      //他边框宽度是5
                radius: 35
                Layout.topMargin: 0
                layer.smooth: false
            }
            Rectangle{
                id:rectback
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: rect3txt
                    text: "back"
                    anchors.centerIn: parent

                    font.pixelSize: 24
                }
                border.color: "black"                //他边框颜色是黑色
                border.width: 3                      //他边框宽度是5
                radius: 35
            }
            Rectangle{
                id:recthome
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    id: rect4txt
                    text: "home"
                    anchors.centerIn: parent

                    font.pixelSize: 24
                }
                border.color: "black"                //他边框颜色是黑色
                border.width: 3                      //他边框宽度是5
                radius: 35
            }
        }

    }

    Connections {
        target: test
        onWhatkeyChanged: {
            if (test.whatkey === 1) {
                rectvoladd.color="green"
            } else if (test.whatkey === 2) {
                rectvolsub.color="green"
            } else if (test.whatkey === 3) {
                rectback.color="green"
            }else if (test.whatkey === 4) {
                recthome.color="green"
            }else {
                rectvoladd.color="white"
                rectvolsub.color="white"
                rectback.color="white"
                recthome.color="white"
            }
        }
    }

}

