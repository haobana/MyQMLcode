import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

// 定义一个自定义的按钮组件
Button {
    id: customButton
    Layout.preferredWidth: 60
    Layout.preferredHeight: 60
    Layout.fillWidth: true
    Layout.fillHeight: true
    font.pointSize: 20

    property string mytext: mytext
    text: mytext

    //点击效果
    background: Rectangle {
        border.color: "lightgrey"
        color: customButton.pressed ? "grey" : (customButton.hovered ? "lightgrey" : "white")
        radius: parent.width/2

        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: customButton.clicked()  // 允许事件继续传递

        onEntered: customButton.scale = 1.1
        onExited: customButton.scale = 1.0

        onPressed: customButton.scale = 0.9
        onReleased: customButton.scale = 1.1
    }

    Behavior on scale {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

}
