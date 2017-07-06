#include <QtQml>
#include <QtQuick/QQuickView>
#include <QGuiApplication>

#include "Process.h"

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	qmlRegisterType<Process>("Process", 1, 0, "Process");

	QQmlApplicationEngine engine("qrc:///main.qml");

	engine.rootObjects().first()->setProperty("visible", true);

	return app.exec();
}

