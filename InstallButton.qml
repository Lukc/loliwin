import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

import Process 1.0

Button {
	property string command : "false"

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

	Process {
		id: process
		onReadyRead: {
			console.log(readAll())
		}
	}

	onClicked: {
		var split = command.match(/\w+|"[^"]+"|'[^']+'/g)
		var arg = []

		for (var i = 1; i < split.length; i++) {
			var element = split[i];

			if (element.charAt(0) == "'") {
				element = element.substring(1, element.length - 1);
			} else if (element.charAt(0) == '"') {
				element = element.substring(1, element.length - 1);
			}

			arg.push(element);
		}

		process.start(split[0], arg)
	}
}

