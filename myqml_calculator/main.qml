import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0



Window {
    id: window
    visible: true //表示部件可见
    visibility: Window.Maximized
    minimumWidth: 400
    minimumHeight: 605
    title: qsTr("计算器")

    property string displayText: "0"
    property real firstNum: 0
    property real secondNum: 0
    property string operator: ""
    property bool nextclear: false

    ColumnLayout{
        id: layout
        anchors.fill: parent
        spacing: 5

        Rectangle{
            id:recttitle
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 100
            color: "lightgrey"
            Text {
                id: display
                text: displayText
                //font.pixelSize: 45
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right  // 确保文本紧贴右侧
                anchors.rightMargin: 10  // 可选：添加一些右边距
                horizontalAlignment: Text.AlignRight
                width: parent.width  // 使文本宽度与父容器一致，以确保对齐效果

                font.pixelSize: Math.min(Math.max(width / (text.length * 0.6), 5), 50) // 最小5，最大45
            }
        }

        GridLayout{
            id:gridlayout1
            flow: GridLayout.LeftToRight
            rows:5
            columns: 4
            height: 325

            Repeater {
                id: digits
                model: ["", "Back", "C", "÷","7", "8", "9", "x", "4", "5", "6", "+", "1", "2", "3", "-","±","0",".","="]
                CustomButton {
                    mytext: modelData
                    onClicked: {
                        buttonClicked(mytext)
                    }
                }
            }

        }
    }

    function buttonClicked(str) {
        //简单计算逻辑实现
        //1.点击清零就显示0
        if(str==="C") {
            displayText = "0";
            firstNum=0;
            secondNum=0;
            operator="";
        }
        //1.1点击退格
        if(str==="Back") {
            displayText=displayText.slice(0,-1);
        }

        //2.点击数字就显示数字
        if(!isNaN(Number(str))) {
            if(nextclear===true) {
                displayText="";
                nextclear=false;
            }
            if(displayText==="0")
                displayText="";
            displayText+=str;
        }
        //2.1点击小数点
        if(str===".") {
            if(nextclear===true) {
                displayText="";
                nextclear=false;
            }
            //只能有一个小数点
            var parts = displayText.split('.');
            if(parts.length <= 1) // true 表示不多于一个点号
                displayText+=".";
        }

        //3.如果是操作符就保存第一个数
        if(str==="+"||str==="-"||str==="x"||str==="÷") {
            firstNum=Number(displayText);
            operator=str;
            nextclear=true;
            console.log("1num",firstNum);
        }
        //3.1点击±加正负
        if(str==="±") {
            //只能有一个负号
            if(displayText!="0") {
                if(displayText[0]==="-")
                    displayText=displayText.substring(1);
                else {
                    var parts = displayText.split('-');
                    if(parts.length <= 1) // true 表示不多于一个点号
                        displayText="-"+displayText;
                }
            }
        }

        //4.如果是等于号就保存第二个数并计算
        if(str==="=") {
            secondNum=Number(displayText);
            console.log("2num",secondNum);
            nextclear=true;
            if(operator==="+")
                displayText=String(firstNum+secondNum);
            if(operator==="-")
                displayText=String(firstNum-secondNum);
            if(operator==="x")
                displayText=String(firstNum*secondNum);
            if(operator==="÷")
                displayText=String(firstNum/secondNum);
            firstNum=0;
            secondNum=0;
        }

        console.log("buttonclick",str)
    }
}

