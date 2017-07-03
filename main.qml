import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
	title: qsTr("LoliWin")
	width: 640
	height: 480

	minimumWidth: 480
	minimumHeight: 480

	x: Screen.width / 2 - width / 2
	y: Screen.height / 2 - height / 2

	SplitView {
		orientation: Qt.Horizontal

		anchors.fill: parent

		SideBar {
			id: sideBar

			onCategorySet: {
				applicationsListPage.category = category;
				applicationsListPage.updateApplicationsList();

				var topPage = stackView.get(0);
				var currentPage = stackView.currentItem;

				if (topPage == indexPage) {
					if (stackView.currentItem == applicationPage) {
						stackView.pop();
					} else if (currentPage == applicationsListPage) {
						 // Ignoring.
					} else {
						stackView.push(applicationsListPage)
					}
				} else {
					while (stackView.pop()) ;;

					stackView.push(indexPage);
					stackView.push(applicationsListPage);
				}
			}
		}

		StackView {
			id: stackView

			clip: true

			Layout.fillHeight: true
			Layout.fillWidth: true

			initialItem: IndexPage {
				id: indexPage
			}

			ApplicationsListPage {
				id: applicationsListPage
				category: sideBar.category
				visible: false
			}

			ApplicationPage {
				id: applicationPage
				appData: null
				visible: false
			}

			AboutPage {
				id: aboutPage
				visible: false
			}
		}
	}

	ListModel {
		id: featuredApplicationsModel
	}

	// reference from which to know that applications exist
	ListModel {
		id: allApplicationsModel

		Component.onCompleted: {
			var xhr = new XMLHttpRequest;

			xhr.open("GET", "./data.json")
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE) {
					var data = JSON.parse(xhr.responseText);

					console.log(data)

					for (var index = 0; index < data.length; index++) {
						var element = data[index];

						allApplicationsModel.append(element)

						if (element.featured)
							featuredApplicationsModel.append(element)
					}
				}
			}

			xhr.send()
		}
	}
}
