import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Button {
	property bool selected: true
	property bool showAll: false

	signal selected()
	signal unselected()

	checkable: true

	onPressed: {
		if (checked) {
			if (selected) {
				selected = false;
				unselected()
			}
		} else {
			selected = true;
			selected()
		}
	}
	onReleased: {
		if (!selected) {
			checked = false;
		}
	}
}

