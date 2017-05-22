#ifndef MYUDP_H
#define MYUDP_H

#include <QObject>
#include <QUdpSocket>
#include <QHostAddress>

class MyUDP: public QObject
{
//    Q_OBJECT
public:
    explicit MyUDP(QObject *parent = 0);
    void HelloUDP();

signals:


public slots:
    void readyRead();

private:
    QUdpSocket *socket;
        QHostAddress address;
};

#endif // MYUDP_H
