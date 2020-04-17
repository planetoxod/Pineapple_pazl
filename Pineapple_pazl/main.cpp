
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    QQmlComponent component(&engine,
//            QUrl::fromLocalFile("Pineapple.qml"));
//    QObject *object = component.create();
//    QObject *img = object->findChild<QObject*>("PineappleImage");
//    if (img)
//        img->setProperty("color", "red");
   // delete object;
    return app.exec();
}
