import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.0

Button {
	height: 96
	anchors.left: parent.left
	anchors.right: parent.right
	flat: true
	clip: true

	ButtonGroup.group: applicationsGroup

	background: Rectangle {
		color:
			pressed ? "#DDDDDD" :
			checked ? "#EEEEEE" :
			"#FFFFFF"
	}

	Image {
		Layout.minimumWidth: 72
		Layout.minimumHeight: 72
		x: 12
		y: 12
		source: icon
		sourceSize: "72x72"
	}

	Label {
		text: model.name
		font.pixelSize: 36
		x: 96
		y: 12
	}

	Label {
		text: description
		color: "#444444"
		x: 100
		y: 60
	}

	StarsLabel {
		id: stars
		stars: model.stars
		x: parent.width - width - 30
		y: 58
	}

	InstallButton {
		y: 10
		x: parent.width - width - 30
		width: stars.width
	}

	onClicked: {
		applicationPage.setApplication(model)
		stackView.push(applicationPage)
	}
}

