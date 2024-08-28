#ifndef MYKEYBOARD_H
#define MYKEYBOARD_H

#include <QThread>
#include <iostream>
#include <QObject>

extern "C" {
#include <fcntl.h>
#include <unistd.h>
#include <linux/input.h>
}

class MyKeyboard : public QThread
{
    Q_OBJECT

public:
    MyKeyboard();
    void run() override;

signals:
    void keystatus(int keyid,int value);
};

#endif // MYKEYBOARD_H
