#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QStringList dataList;
    dataList.append("Pointer");
    dataList.append("Skin");
    dataList.append("Dial");


    QStringList dataList1;
    dataList1.append("Calander");
    dataList1.append("Rear Camera");
    dataList1.append("Maps");


    QQmlApplicationEngine engine;
    QQmlContext *ctxt =engine.rootContext();
    ctxt->setContextProperty("myConfiguration", QVariant::fromValue(dataList));

    QQmlContext *ctxt1 =engine.rootContext();
    ctxt1->setContextProperty("myMenu", QVariant::fromValue(dataList1));

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
