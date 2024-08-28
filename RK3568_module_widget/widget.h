#ifndef WIDGET_H
#define WIDGET_H

#include <QAbstractButton>
#include <QWidget>

QT_BEGIN_NAMESPACE
namespace Ui { class Widget; }
QT_END_NAMESPACE

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();

private slots:
    void listbuttonClick();
    void timerUpdate();

private:
    Ui::Widget *ui;
    void headerinit();
    void leftlistinit();
    QList<QAbstractButton *> tbtns;
};
#endif // WIDGET_H
