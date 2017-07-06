#include <QProcess>
#include <QVariant>

#include <QDebug>

class Process : public QProcess {
	Q_OBJECT

	public:
		Process(QObject *parent = 0) : QProcess(parent) { }

		Q_INVOKABLE void start(const QString &program, const QVariantList &arguments) {
			QStringList args;

			qDebug() << "Process.start() running!";
			qDebug() << program << arguments;

			for (int i = 0; i < arguments.length(); i++) {
				args << arguments[i].toString();
				qDebug() << i << ": " << arguments[i].toString().toUtf8().constData();
			}

			QProcess::start(program, args);
		}

		Q_INVOKABLE QByteArray readAll() {
			return QProcess::readAll();
		}
};
