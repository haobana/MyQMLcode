#include "myled.h"

MyLed::MyLed(QObject *parent) : QObject(parent)
{

}

/**
 * @brief MyLed::ledcontrol 控制灯亮灭
 */
void MyLed::ledcontrol(int flag)
{
    if(flag==0) {
        ::system("echo 0 > /sys/devices/platform/leds/leds/work/brightness");
    }
    if(flag==1) {
        ::system("echo 1 > /sys/devices/platform/leds/leds/work/brightness");
    }
}
