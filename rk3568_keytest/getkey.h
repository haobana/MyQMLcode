#ifndef GETKEY_H
#define GETKEY_H

#include <QThread>
#include <iostream>
#include <QObject>

extern "C" {
#include <fcntl.h>
#include <unistd.h>
#include <linux/input.h>
}

class Getkey : public QThread
{
    Q_OBJECT
public:
    Getkey();
    void run() override;

signals:
    void keyid(int);
};

#endif // GETKEY_H
