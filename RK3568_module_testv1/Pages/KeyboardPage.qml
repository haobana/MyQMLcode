import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id:root
    width: parent.width
    ColumnLayout{
        id: layout
        anchors.fill: parent
        spacing: 10

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
        target: mykey

        onKeystatus: {
            console.log("QML_key:",keyid,value)
            if(keyid===1) {
                if(value===1)
                    rectvoladd.color="green"
                if(value===0)
                    rectvoladd.color="white"
            }
            if(keyid===2) {
                if(value===1)
                    rectvolsub.color="green"
                if(value===0)
                    rectvolsub.color="white"
            }
            if(keyid===3) {
                if(value===1)
                    rectback.color="green"
                if(value===0)
                    rectback.color="white"
            }
            if(keyid===4) {
                if(value===1)
                    recthome.color="green"
                if(value===0)
                    recthome.color="white"
            }
        }
    }
}
