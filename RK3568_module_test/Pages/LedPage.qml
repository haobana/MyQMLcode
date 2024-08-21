import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Page {
    id: pageroot
    property int number: 1999
    signal ledSignal(int value)

    Image {
        id: switchImage
        anchors.centerIn: parent
        source: "qrc:/Resource/srcPage/ledoff.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                // 切换图片
                var offSource = Qt.resolvedUrl("qrc:/Resource/srcPage/ledoff.png");
                var onSource = Qt.resolvedUrl("qrc:/Resource/srcPage/ledon.png");
                if (switchImage.source == offSource) {
                    //直接调用C++对象
                    myled.ledcontrol(1)
                    switchImage.source = onSource
                }
                else if (switchImage.source == onSource) {
                    myled.ledcontrol(0)
                    switchImage.source = offSource
                }
            }
        }
    }

    //每次切换界面时都会调用
    Component.onCompleted: {
        console.log("inininininininini")
        myled.ledcontrol(0)
    }
}
