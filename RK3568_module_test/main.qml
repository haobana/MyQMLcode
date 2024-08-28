import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import "./Pages"
import "./Component"

ApplicationWindow {
    id: windowroot
    visible: true
    minimumHeight: 800
    minimumWidth: 790
    title: "RK3568_moudle_test"
    visibility: "Maximized"
    flags: Qt.FramelessWindowHint | Qt.Window // 隐藏系统默认的标题栏
    ColorConfig {
        id: colorConfig
    }

    //应用整体布局分为上下
    ColumnLayout {
        anchors.fill: parent
        spacing: 0  // 移除布局之间的间距

        // 上半区标题栏
        Header {id:header}

        //下半区列表和stack
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0  // 移除布局之间的间距

            // 左侧列表
            Rectangle {
                id: sidebar
                visible: true
                width: 120
                Layout.fillHeight: true
                //渐变色
                LinearGradient {            ///--[Mark]
                    anchors.fill: parent
                    start: Qt.point(0, 0)
                    end: Qt.point(width, 0)        ///1、横向渐变
            //        end: Qt.point(0, height)     ///2、竖向渐变
            //        end: Qt.point(width, height) ///3、横向渐变
                    gradient: Gradient {
                        GradientStop {  position: 0.0; color: colorConfig.themeColor1 }
                        GradientStop {  position: 1.0; color: colorConfig.themeColor2 }
                    }
                }
                clip: true


                ListView {
                    id: menuListView
                    width: parent.width
                    height: parent.height
                    model: ListModel  {
                        ListElement {mytext:"Home"; iconSource: "qrc:/Resource/icon/home.png"}
                        ListElement {mytext:"RFID识别"; iconSource: "qrc:/Resource/icon/RFID.png"}
                        ListElement {mytext:"GPS定位"; iconSource: "qrc:/Resource/icon/gps.png"}
                        ListElement {mytext:"串口接发"; iconSource: "qrc:/Resource/icon/uart.png"}
                        ListElement {mytext:"PCIE网卡"; iconSource: "qrc:/Resource/icon/pcienet.png"}
                        ListElement {mytext:"全彩LED灯"; iconSource: "qrc:/Resource/icon/Lamp.png"}
                        ListElement {mytext:"OLED屏幕"; iconSource: "qrc:/Resource/icon/oled.png"}
                        ListElement {mytext:"矩阵键盘"; iconSource: "qrc:/Resource/icon/keyboard.png"}
                        ListElement {mytext:"步进电机"; iconSource: "qrc:/Resource/icon/steering.png"}
                        ListElement {mytext:"继电器"; iconSource: "qrc:/Resource/icon/relay.png"}
                        ListElement {mytext:"风扇调速"; iconSource: "qrc:/Resource/icon/fan.png"}
                        ListElement {mytext:"SG90舵机"; iconSource: "qrc:/Resource/icon/sg90.png"}
                        ListElement {mytext:"HX711称重"; iconSource: "qrc:/Resource/icon/weigh.png"}
                        ListElement {mytext:"温湿度传感器"; iconSource: "qrc:/Resource/icon/temandhum.png"}
                        ListElement {mytext:"姿态传感器"; iconSource: "qrc:/Resource/icon/attitude.png"}
                        ListElement {mytext:"超声波测距"; iconSource: "qrc:/Resource/icon/ultrasonic.png"}
                    }
                    spacing: 0
                    currentIndex: 0  // 默认选中第一个项

                    delegate: Button {
                        id: btn
                        width: menuListView.width
                        height: 100
                        property bool isSelected: menuListView.currentIndex === index

                        background: Rectangle {
                            width: btn.width
                            height: btn.height
                            border.color: "gray"
                            color: {
                                if (btn.isSelected || btn.pressed) {
                                    return "#005270"
                                } else if (btn.hovered) {
                                    return "#1beee0"
                                } else {
                                    return "transparent"
                                }
                            }
                        }


                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 0

                            Image {
                                source: iconSource
                                Layout.preferredWidth: 48
                                Layout.preferredHeight: 48
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Text {
                                id: listItemText
                                text: mytext
                                font.pixelSize: 18
                                color: "white"
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }

                        onClicked: {
                            menuListView.currentIndex = index
                            switchPage(index)
                        }
                    }
                }
            }

            // 右侧显示区
            Item{
                Layout.fillWidth: true
                Layout.fillHeight: true
                StackView{
                    id:pageStackView
                    anchors.fill: parent
                    initialItem:Loader{
                        id:settingsLoader
                        sourceComponent: homePage
                        onLoaded: pageStackView
                    }
                }
                Image {
                    id: bgImg
                    source: "qrc:/Resource/srcPage/bk_flower.jpg"
                    anchors.fill: parent
                    opacity: 0.1
                }
            }
        }
    }

    Component{id:homePage; HomePage{}}
    Component{id:rfidPage; RfidPage{}}
    Component{id:gpsPage; GpsPage{}}
    Component{id:ledPage; LedPage{}}
    Component{id:keyboardPage; KeyboardPage{}}

    function switchPage(index){
        switch(index){
        case 0:
            settingsLoader.sourceComponent = homePage
            break;
        case 1:
            settingsLoader.sourceComponent = rfidPage
            break;
        case 2:
            settingsLoader.sourceComponent = gpsPage
            break;
        case 5:
            settingsLoader.sourceComponent = ledPage
            break;
        case 7:
            settingsLoader.sourceComponent = keyboardPage
            break;
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        z: -1
        onClicked: {
            clickShow.brust(mouse.x, mouse.y, mouse.button)
        }
    }

    Item {
        id: clickShow
        z: 1
        Component {
            id: brushComp
            Item {
                id: circleItem
                property color circleColor
                property real radius: 0
                Rectangle {
                    id: circle
                    anchors.centerIn: parent
                    color: "transparent"
                    width: radius * 2
                    height: radius * 2
                    opacity: 0
                    visible: opacity > 0
                    border.color: circleItem.circleColor
                    border.width: 4
                }
                SequentialAnimation {
                    id: animation
                    running: true
                    loops: 1
                    ParallelAnimation {
                        NumberAnimation {
                            target: circle
                            property: "radius"
                            from: 1
                            to: 60
                            duration: 400
                        }
                        NumberAnimation {
                            target: circle
                            property: "opacity"
                            from: 1
                            to: 0
                            duration: 400
                        }
                    }
                    ScriptAction {
                        script: {
                            circleItem.destroy()
                        }
                    }
                }
            }
        }

        function brust(xPos, yPos, button) {
            brushComp.createObject(clickShow, {x: xPos, y: yPos, circleColor: "dodgerblue"});
        }
    }
}
