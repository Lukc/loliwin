import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.0

Row {
	default property int stars

	Label {
		text: stars >= 1 ? "★" : "☆"
	}

	Label {
		text: stars >= 2 ? "★" : "☆"
	}

	Label {
		text: stars >= 3 ? "★" : "☆"
	}

	Label {
		text: stars >= 4 ? "★" : "☆"
	}

	Label {
		text: stars >= 5 ? "★" : "☆"
	}
}

