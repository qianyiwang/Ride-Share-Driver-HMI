#include <QApplication>
#include <QQmlApplicationEngine>
#include "udpserver.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // declear udpserver version
    qmlRegisterType<UdpServer>("UDPServer", 1,0, "UdpServer");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    UdpServer udpServer;

    return app.exec();
}
