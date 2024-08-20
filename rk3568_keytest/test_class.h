#ifndef TEST_CLASS_H
#define TEST_CLASS_H

#include <QObject>

class test_class : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int whatkey READ whatkey WRITE setWhatkey NOTIFY whatkeyChanged)
    int m_whatkey;

public:
    explicit test_class(QObject *parent = nullptr);

    //*****************************************
    int whatkey() const
    {
        return m_whatkey;
    }
public slots:
    void setWhatkey(int whatkey)
    {
        if (m_whatkey == whatkey)
            return;

        m_whatkey = whatkey;
        emit whatkeyChanged(m_whatkey);
    }
signals:
    void whatkeyChanged(int whatkey);

};

#endif // TEST_CLASS_H
