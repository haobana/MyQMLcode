#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#include <QQuickItem>
#include "myled.h"
#include "mykeyboard.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //--------------module------------------
    //led
    MyLed myled;
    engine.rootContext()->setContextProperty("myled", &myled); // 注册C++对象
    //keyboard
    MyKeyboard mykey;
    mykey.start();
    engine.rootContext()->setContextProperty("mykey", &mykey); // 注册C++对象
    //--------------module------------------

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
