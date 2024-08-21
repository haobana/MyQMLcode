import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id:headerroot
    Layout.fillWidth: true
    height: 100
    RowLayout {
        anchors.fill: parent
        spacing: 0
        ShaderEffect {
            anchors.fill: parent
            fragmentShader: "
                uniform lowp float qt_Opacity;
                varying highp vec2 qt_TexCoord0;
                uniform lowp vec4 color1;
                uniform lowp vec4 color2;
                void main() {
                    gl_FragColor = mix(color1, color2, qt_TexCoord0.x) * qt_Opacity;
                }"
            property color color1: globalColor1  // 左侧颜色
            property color color2: globalColor2  // 右侧颜色
        }

        Button {
            id: hidelistbutton
            text: sidebar.visible ? "<<" : ">>"
            Layout.preferredWidth: 40  // 自定义宽度
            Layout.preferredHeight: 20  // 自定义高度
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom  // 对齐左下角
            onClicked: {
                sidebar.visible = !sidebar.visible
                sidebar.width = sidebar.visible ? 200 : 0
            }
        }
        // 间隔 Item
        Item {
            Layout.preferredWidth: 20  // 设置间隔宽度
        }
        Image {
            source: "qrc:/Resource/icon/topeet-logo.png"
            Layout.preferredWidth: 336
            Layout.preferredHeight: 50
            Layout.alignment: Qt.AlignLeft
        }
        // 间隔 Item
        Item {
            Layout.preferredWidth: 20  // 设置间隔宽度
        }
        Text {
            text: "TOPEET RK3568"
            font.pixelSize: 30
            color: "white"
            //anchors.centerIn: parent  // 将 Text 元素精确地居中
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter // 使文本在标题栏中居中
        }


        //----------------------------- right area to display time and close button
        // 加载自定义字体
        FontLoader {
            id: digitalFont
            source: "qrc:/fonts/DS-DIGI-1.ttf"  // 字体文件路径
        }
        Rectangle {
            width: 160
            height: headerroot.height
            color: "transparent"  // 背景色
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom  // 对齐下角
            ColumnLayout {
                anchors.fill: parent

                //control button
                RowLayout {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    spacing: 15  // 按钮之间的间距
                    Button {
                        background: Image {
                            source: "qrc:/Resource/control/minimize.png" // 替换为你的不规则形状图片路径
                        }
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        onClicked: windowroot.showMinimized()

                    }
                    //max is 4 ; normal is 2
                    Button {
                        background: Image {
                            source: windowroot.visibility === 2 ? "qrc:/Resource/control/maxsize.png" : "qrc:/Resource/control/revert.png"  // 最大化/恢复
                        }
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        onClicked: {
                            if (windowroot.visibility === 4) {
                                windowroot.showNormal()  // 恢复窗口
                            } else {
                                windowroot.showMaximized()  // 最大化窗口
                            }
                        }
                    }
                    Button {
                        background: Image {
                            source: "qrc:/Resource/control/close.png" // 替换为你的不规则形状图片路径
                        }
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        onClicked: Qt.quit()  // 退出应用
                    }
                }

                //time
                Text {
                    id: dateTimeLabel
                    text: getCurrentDateTime()
                    font.family: digitalFont.status === FontLoader.Ready ? "DS-DIGITAL" : "Arial"  // 使用自定义字体
                    font.pixelSize: 50
                    color: "white"
                }
            }
        }
    }
    // 获取当前日期和时间的函数
    function getCurrentDateTime() {
        var date = new Date();
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var day = date.getDate().toString().padStart(2, '0');
        var hours = date.getHours().toString().padStart(2, '0');
        var minutes = date.getMinutes().toString().padStart(2, '0');
        var seconds = date.getSeconds().toString().padStart(2, '0');

        return hours + ":" + minutes + ":" + seconds;
    }
    // 每秒更新一次
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateTimeLabel.text = getCurrentDateTime()
    }

    MouseArea{  //设置可以拖动没有标题的登录界面.  /*这个要放在上面，放在最下面的话，会把上面全部屏蔽掉的*/
        anchors.fill:parent
        property point clickPos: "0,0"  //定义一个点
        z:-1

        onPressed: {
            clickPos = Qt.point(mouseX, mouseY)
        }

        onPositionChanged: {  //属性的改变
            var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
            windowroot.setX(windowroot.x+delta.x)
            windowroot.setY(windowroot.y+delta.y)
        }
    }
}
