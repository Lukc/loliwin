import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Button {
	contentItem: Label {
		text: "Install"
		color: "#FFFFFF"
		font.pixelSize: 18

		anchors.centerIn: parent
	}

	background: Rectangle {
		color:
			parent.pressed ? "#11AA11" :
			parent.hovered ? "#66EE66" :
			"#22DD22"

		radius: 5
	}

	onClicked: {
		console.log("Hey, iNstalling NAOE")
	}
}

