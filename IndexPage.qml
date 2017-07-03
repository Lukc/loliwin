import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Page {
	id: indexPage

	Component {
		id: featuredApplicationsDelegate

		Item {
			width: featuredGrid.cellWidth
			height: featuredGrid.cellHeight

			Button {
				width: parent.width - 20
				height: parent.height - 20

				anchors.centerIn: parent

				flat: true

				background: Rectangle {
					radius: 5

					color: parent.pressed ? "#DDDDDD" : "#FFFFFF"
				}

				onClicked: {
					console.log(model.name)
					applicationPage.setApplication(model)

					applicationsListPage.category = model.category
					applicationsListPage.updateApplicationsList()

					sideBar.setSelectedCategory(model.category)

					stackView.push(applicationsListPage)
					stackView.push(applicationPage)
				}

				ColumnLayout {
					anchors {
						left: parent.left
						right: parent.right
						margins: 4
					}

					Item {
						// forced padding. Don’t ask.
						height: 0
						width: 1
					}

					Rectangle {
						height: 128
						color: "#FF8888"
						radius: 5
						anchors {
							left: parent.left
							right: parent.right
						}
						gradient: Gradient {
							GradientStop {
								position: 0.0
								color: model.backgroundColor || "#EEEEEE"
							}
							GradientStop {
								position: 1.0
								color:
									model.backgroundColor2 ||
									model.backgroundColor ||
									"#FEFEFE"
							}
						}

						Image {
							source: model.icon || ""
							sourceSize: "110x110"

							anchors.horizontalCenter: parent.horizontalCenter
							anchors.verticalCenter: parent.verticalCenter
						}
					}

					Label {
						text: name
						font.bold: true
					}
					RowLayout {
						anchors {
							left: parent.left
							right: parent.right
						}

						Label {
							text: category
						}
						StarsLabel {
							stars: model.stars
							anchors.right: parent.right
						}
					}
				}
			}
		}
	}

	ColumnLayout {
		anchors.fill: parent

		Rectangle {
			Layout.minimumHeight: 200
			Layout.fillWidth: true

			color: "#73EAEE"

			anchors.top: parent.top

			//Label {
			//	text: "Loliwin"
			//	font {
			//		pixelSize: 96
			//	}
			//	color: "#FFFFFF"

			//	anchors.horizontalCenter: parent.horizontalCenter
			//}

			Image {
				source: "art/lolica.png"
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.verticalCenter: parent.verticalCenter
			}
		}

		Label {
			text: "Bleh"
			anchors.horizontalCenter: parent.horizontalCenter
		}

		GridView {
			id: featuredGrid

			interactive: true
			clip: true

			Layout.fillHeight: true
			Layout.fillWidth: true
			Layout.alignment: Qt.Horizontal

			cellWidth: 236; cellHeight: 208

			model: featuredApplicationsModel
			delegate: featuredApplicationsDelegate

			anchors.horizontalCenter: parent.horizontalCenter
			Layout.maximumWidth: Math.min(model.count, Math.floor(parent.width/cellWidth))*cellWidth
		}
	}
}

