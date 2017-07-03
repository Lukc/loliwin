import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Item {
	id: sideBar

	property var category: null

	signal categorySet()

	Layout.minimumWidth: 144
	Layout.maximumWidth: 300

	ListModel {
		id: categoriesListModel

		ListElement {
			name: "Office™"
		}
		ListElement {
			name: "Internet"
		}
		ListElement {
			name: "Other"
		}
		ListElement {
			name: "All applications"
			all: true
		}
	}

	Component {
		id: categoriesListDelegate

		CategoriesListButton {
			onClicked: {
				if (this.checked) {
					category = this.text;

					if (model.all)
						category = null;

					sideBar.categorySet();
				} else {
					while (stackView.pop()) ;;
				}
			}
		}
	}

	ButtonGroup {
		id: categoriesGroup
	}

	Item {
		anchors.fill: parent

		Button {
			id: indexButton

			ButtonGroup.group: categoriesGroup

			Image {
				source: "art/home.svg"
				sourceSize: "32x32"

				anchors.centerIn: parent
			}
			flat: true
			checkable: true
			checked: true

			anchors {
				left: parent.left
				right: parent.right
			}

			onClicked: {
				if (stackView.currentItem == indexPage)
					return;

				while (stackView.pop()) ;;

				if (stackView.currentItem != indexPage)
					stackView.push(indexPage)
			}
		}
		MenuSeparator {
			id: indexSeparator

			anchors {
				top: indexButton.bottom
				left: parent.left
				right: parent.right
			}
		}

		ListView {
			id: categoriesListView

			clip: true

			Layout.fillHeight: true
			anchors {
				top: indexSeparator.bottom
				bottom: parent.bottom
				left: parent.left
				right: parent.right
			}

			model: categoriesListModel
			delegate: categoriesListDelegate
		}
	}

	Button {
		text: "About"
		ButtonGroup.group: categoriesGroup
		checkable: true
		flat: true

		anchors {
			bottom: parent.bottom
			left: parent.left
			right: parent.right
		}

		onClicked: {
			if (stackView.currentItem != aboutPage) {
				while (stackView.pop()) ;;

				stackView.push(aboutPage)
			}
		}
	}

	function setSelectedCategory(category) {
		if (!category) {
			categoriesGroup.checkedButton.checked = false;
		}

		for (var i = 0; i < categoriesGroup.buttons.length; i++) {
			var element = categoriesGroup.buttons[i];

			if (element.text == category)
				element.checked = true;
		}
	}
}

