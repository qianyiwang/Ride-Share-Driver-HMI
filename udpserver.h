#ifndef UDPSERVER_H
#define UDPSERVER_H

#include <QObject>
#include <QUdpSocket>
#include <QtNetwork>

class UdpServer : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE explicit UdpServer(QObject *parent = 0);
    void sendUdp();

signals:
    void dataReceived(const QString &message);

public slots:
    void readyRead();

private:
    QUdpSocket *socket;
};

#endif // UDPSERVER_H
