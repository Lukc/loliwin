import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Button {
	height: 48

	anchors.left: parent.left
	anchors.right: parent.right

	flat: true
	checkable: true

	ButtonGroup.group: categoriesGroup

	text: qsTr(model.name)
}

