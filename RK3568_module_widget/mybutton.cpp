#include "mybutton.h"

MyButton::MyButton(QWidget *parent) : QPushButton(parent)
{
    fontsize=10;
    scalesize=1.5;
    setText("42342");

}

void MyButton::setPixTxt(const QString &imagePath, const QString &textContent)
{
    QPixmap pix;
    pix.load(imagePath);
    pix = pix.scaled(pix.width()*scalesize,pix.height()*scalesize,Qt::KeepAspectRatio, Qt::SmoothTransformation);//将图片宽高扩大两倍，且在矩形内保持宽高比值
    imgLabel=new QLabel;
    imgLabel->setPixmap(pix);
    imgLabel->setAlignment(Qt::AlignCenter); // 居中

    textLabel=new QLabel(textContent);
    QFont font = textLabel->font(); // 获取当前字体
    font.setPointSize(fontsize);     // 设置字体大小为20
    textLabel->setFont(font);       // 应用字体设置
    textLabel->setStyleSheet("QLabel { color : white; }");
    textLabel->setAlignment(Qt::AlignCenter); // 文字居中

    QVBoxLayout *layout=new QVBoxLayout(this);
    layout->addWidget(imgLabel);
    layout->addWidget(textLabel);
    layout->setAlignment(Qt::AlignCenter); // 布局内所有控件居中
}

