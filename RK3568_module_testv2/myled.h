#ifndef MYLED_H
#define MYLED_H

#include <QObject>
#include <QDebug>

extern "C" {
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
}

class MyLed : public QObject
{
    Q_OBJECT
public:
    explicit MyLed(QObject *parent = nullptr);

signals:

public slots:
    void ledcontrol(int flag);
};

#endif // MYLED_H
