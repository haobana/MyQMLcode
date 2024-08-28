import QtQuick 2.0
import QtQml 2.0

/*这个文件放的是界面颜色
QtObject 轻量级的类型来包含一组自定义属性
*/
QtObject {
    id: colorConfig
    objectName: "colorConfig"
    property color themeColor1: "#00adab"
    property color themeColor2: "#005974"
    Behavior on themeColor1 {
        ColorAnimation {
            duration: 400
        }
    }
    Behavior on themeColor2 {
        ColorAnimation {
            duration: 400
        }
    }

    property int currentTheme: -1
    onCurrentThemeChanged: {
        var t = themes.get(currentTheme)
        themeColor1 = t.themeColor1
        themeColor2 = t.themeColor2
    }
    property ListModel themes : ListModel {
        ListElement {
            name: "渐变青"
            themeColor1: "#00adab"
            themeColor2: "#005974"
        }

        ListElement {
            name: "暗夜黑"
            themeColor1: "#3D3D3D"
            themeColor2: "#3D3D3D"
        }

        ListElement {
            name: "深绿色"
            themeColor1: "#304F50"
            themeColor2: "#304F50"
        }
    }
}
