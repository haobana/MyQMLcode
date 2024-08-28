#ifndef MYBUTTON_H
#define MYBUTTON_H

#include <QObject>
#include <QPushButton>
#include <QPixmap>
#include <QLabel>
#include <QDebug>
#include <QPainter>
#include <QVBoxLayout>

class MyButton : public QPushButton
{
    Q_OBJECT
public:
    MyButton(QWidget *parent = nullptr);

    void setPixTxt(const QString &imagePath,const QString &textContent); // 设置图片路径 设置文本内容

private:
    QLabel *imgLabel; // 用于显示图片的标签
    QLabel *textLabel; // 用于显示文本的标签
    QString picpath;
    int fontsize;
    float scalesize;
};

#endif // MYBUTTON_H
