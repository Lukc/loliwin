import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Page {
	property var category: null

	// on-screen applications
	ListModel {
		id: applicationsListModel
	}

	Component {
		id: applicationsListDelegate

		ApplicationsListButton {}
	}

	function updateApplicationsList() {
		var i;
		var element;

		applicationsListModel.clear()

		if (!category) {
			for (i = 0; i < allApplicationsModel.count; i++)
				applicationsListModel.append(allApplicationsModel.get(i));

			return;
		}

		for (i = 0; i < allApplicationsModel.count; i++) {
			var element = allApplicationsModel.get(i);

			if (element.category == category)
				applicationsListModel.append(element);
		}
	}

	Component.onCompleted: {
		updateApplicationsList();
	}

	ButtonGroup {
		id: applicationsGroup
	}

	ListView {
		id: applicationsListView

		anchors.fill: parent

		model: applicationsListModel
		delegate: applicationsListDelegate

		ScrollBar.vertical: ScrollBar {
			parent: applicationsListView.parent
			anchors {
				top: applicationsListView.top
				bottom: applicationsListView.bottom
				right: applicationsListView.right
			}
		}
	}
}
