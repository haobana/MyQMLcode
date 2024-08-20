#include "test_class.h"
#include "getkey.h"

test_class::test_class(QObject *parent) : QObject(parent)
{
    setWhatkey(0);

    Getkey *thread=new Getkey();
    connect(thread,&Getkey::keyid,this,&test_class::setWhatkey);
    thread->start();

}
