#include "widget.h"
#include "ui_widget.h"
#include <QScrollBar>
#include <QDebug>
#include <QButtonGroup>
#include <QTimer>
#include <QDateTime>
#include <QFontDatabase>

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
{
    ui->setupUi(this);
    showMaximized();

    ui->stackedWidget->setCurrentIndex(0);
    leftlistinit();
    headerinit();
}

Widget::~Widget()
{
    delete ui;
}

void Widget::headerinit()
{
    // 加载外部字体
    int fontId = QFontDatabase::addApplicationFont(":/Resource/fonts/DS-DIGI-1.ttf");
    QString fontFamily = QFontDatabase::applicationFontFamilies(fontId).at(0);
    QFont font(fontFamily, 40);  // 使用加载的字体，并设置大小
    ui->time_label->setFont(font);

    QTimer *timer_calendar;//用来显示当前日期的定时器
    timer_calendar = new QTimer(this);//new一个QTimer对象
    connect(timer_calendar,SIGNAL(timeout()),this,SLOT(timerUpdate()));//连接槽函数
    timer_calendar->start(1000);//每一秒溢出一次进入槽函数
    ui->head_button1->setAttribute(Qt::WA_TranslucentBackground, true);
    ui->head_button2->setAttribute(Qt::WA_TranslucentBackground, true);
    ui->head_button3->setAttribute(Qt::WA_TranslucentBackground, true);

    ui->head_button1->setPixTxt(":/Resource/icon/dress.png","装扮");
    ui->head_button2->setPixTxt(":/Resource/icon/setting.png","设置");
    ui->head_button3->setPixTxt(":/Resource/icon/help.png","帮助");
}

void Widget::leftlistinit()
{
    ui->myButton1->setCheckable(true);
    ui->myButton1->setChecked(true);

    ui->myButton1->setPixTxt(":/Resource/icon/home.png","Home");
    ui->myButton2->setPixTxt(":/Resource/icon/RFID.png","RFID识别");
    ui->myButton3->setPixTxt(":/Resource/icon/gps.png","GPS定位");
    ui->myButton4->setPixTxt(":/Resource/icon/uart.png","串口接发");
    ui->myButton5->setPixTxt(":/Resource/icon/pcienet.png","PCIE网卡");
    ui->myButton6->setPixTxt(":/Resource/icon/Lamp.png","全彩LED灯");
    ui->myButton7->setPixTxt(":/Resource/icon/oled.png","OLED屏幕");
    ui->myButton8->setPixTxt(":/Resource/icon/keyboard.png","矩阵键盘");
    ui->myButton9->setPixTxt(":/Resource/icon/steering.png","步进电机");
    ui->myButton10->setPixTxt(":/Resource/icon/relay.png","继电器");
    ui->myButton11->setPixTxt(":/Resource/icon/fan.png","风扇调速");
    ui->myButton12->setPixTxt(":/Resource/icon/sg90.png","SG90舵机");
    ui->myButton13->setPixTxt(":/Resource/icon/weigh.png","HX711称重");
    ui->myButton14->setPixTxt(":/Resource/icon/temandhum.png","温湿度传感器");
    ui->myButton15->setPixTxt(":/Resource/icon/attitude.png","姿态传感器");
    ui->myButton16->setPixTxt(":/Resource/icon/ultrasonic.png","超声波测距");


    QButtonGroup *buttonGroup = new QButtonGroup(this);
    buttonGroup->setExclusive(true);  // 设置为互斥模式

    tbtns = ui->listscroll->findChildren<QAbstractButton *>();
    foreach (QAbstractButton *btn, tbtns) {
        btn->setCheckable(true);  // 设置为可切换状态
        buttonGroup->addButton(btn);  // 将按钮添加到组中
        connect(btn, SIGNAL(clicked()), this, SLOT(listbuttonClick()));
    }

}

void Widget::listbuttonClick()
{
    QAbstractButton *b = (QAbstractButton *)sender();
    for (int i = 0; i < tbtns.count(); ++i) {
        QAbstractButton *btn = tbtns.at(i);
        btn->setChecked(btn == b);
        if(btn==b) {
            ui->stackedWidget->setCurrentIndex(i);
        }
    }
}

void Widget::timerUpdate()
{
    QDateTime time = QDateTime::currentDateTime();
    QString str = time.toString("hh:mm:ss");

    ui->time_label->setText(str);
}
