import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id:headerroot
    Layout.fillWidth: true
    height: 100

    RowLayout {
        anchors.fill: parent
        spacing: 0
        //渐变色
        LinearGradient {            ///--[Mark]
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(width, 0)        ///1、横向渐变
    //        end: Qt.point(0, height)     ///2、竖向渐变
    //        end: Qt.point(width, height) ///3、横向渐变
            gradient: Gradient {
                GradientStop {  position: 0.0;    color: colorConfig.themeColor1 }
                GradientStop {  position: 1.0;    color: colorConfig.themeColor2 }
            }
        }

        //隐藏侧边栏按钮
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
        //logo
        Image {
            source: "qrc:/Resource/icon/topeet-logo.png"
            Layout.preferredWidth: 250
            Layout.preferredHeight: 70

            Layout.alignment: Qt.AlignLeft
        }
        // 间隔 Item
        Item {
            Layout.fillWidth: true  // 设置间隔宽度
        }

        //title button
        Rectangle {
            Layout.preferredWidth: 300
            height: headerroot.height
            color: "transparent"  // 背景色
            Layout.alignment: Qt.AlignRight

            RowLayout {
                anchors.fill: parent
                spacing: 0

                //dress
                Button {
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    background: Rectangle {
                        color: "transparent"
                    }
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0
                        Image {
                            source: "qrc:/Resource/icon/dress.png"
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 50
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Text {
                            text: "装扮"
                            font.pixelSize: 18
                            color: "white"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    onClicked: {
                        skinBox.show()
                    }
                    CusPopup {
                        id: skinBox
                        barColor: "#f5f5f6"
                        backgroundWidth: 270
                        backgroundHeight: 180
                        borderColor: "#cbcbcb"
                        contentItem: GridView {
                            anchors.fill: parent
                            anchors.margins: 10
                            model: colorConfig.themes
                            cellWidth: 80
                            cellHeight: 80
                            clip: true
                            delegate: Item {
                                width: 80
                                height: 80
                                Rectangle {
                                    anchors.fill: parent
                                    anchors.margins: 4
                                    //color: model.themeColor1
                                    //渐变色
                                    LinearGradient {            ///--[Mark]
                                        anchors.fill: parent
                                        start: Qt.point(0, 0)
                                        end: Qt.point(width, 0)        ///1、横向渐变
                                //        end: Qt.point(0, height)     ///2、竖向渐变
                                //        end: Qt.point(width, height) ///3、横向渐变
                                        gradient: Gradient {
                                            GradientStop {  position: 0.0;    color: model.themeColor1 }
                                            GradientStop {  position: 1.0;    color: model.themeColor2 }
                                        }
                                    }
                                }
                                Rectangle {
                                    anchors.fill: parent
                                    color: "transparent"
                                    border.color: model.themeColor1
                                    border.width: 2
                                    visible: a.containsMouse
                                }
                                Label {
                                    anchors {
                                        centerIn: parent
                                    }
                                    horizontalAlignment: Text.AlignHCenter
                                    color: "white"
                                    text: qsTr(model.name)
                                }
                                Rectangle {
                                    x: parent.width - width
                                    y: parent.height - height
                                    width: 20
                                    height: width
                                    radius: width / 2
                                    color: model.themeColor1
                                    border.width: 3
                                    //border.color: CusConfig.controlBorderColor
                                    visible: colorConfig.currentTheme === index
                                }
                                MouseArea {
                                    id: a
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        colorConfig.currentTheme = index
                                    }
                                }
                            }
                        }
                    }

                }
                //setting
                Button {
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    background: Rectangle {
                        color: "transparent"
                    }
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0
                        Image {
                            source: "qrc:/Resource/icon/setting.png"
                            Layout.preferredWidth: 64
                            Layout.preferredHeight: 64
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Text {
                            text: "设置"
                            font.pixelSize: 18
                            color: "white"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
                //Help
                Button {
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    background: Rectangle {
                        color: "transparent"
                    }
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0
                        Image {
                            source: "qrc:/Resource/icon/help.png"
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 50
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Text {
                            text: "帮助"
                            font.pixelSize: 18
                            color: "white"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
            }
        }


        //最大化最小化 时间显示
        FontLoader { // 加载自定义字体
            id: digitalFont
            source: "qrc:/fonts/DS-DIGI-1.ttf"  // 字体文件路径
        }
        Rectangle {
            Layout.preferredWidth: 180
            height: headerroot.height
            color: "transparent"  // 背景色
            Layout.alignment: Qt.AlignRight  // 对齐下角
            ColumnLayout {
                anchors.fill: parent

                //control button
                RowLayout {
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
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
                    Layout.alignment: Qt.AlignCenter
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

    MouseArea {  //设置可以拖动没有标题的登录界面.
        anchors.fill:parent
        property point clickPos: Qt.point(0, 0)  //定义一个点
        z:-1

        onPressed: {
            clickPos = Qt.point(mouseX, mouseY)
        }

        onPositionChanged: {  //属性的改变
            var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
            windowroot.x += delta.x
            windowroot.y += delta.y
        }
    }
}
