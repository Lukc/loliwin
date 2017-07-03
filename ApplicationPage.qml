import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Page {
	id: applicationPage

	property var appData: null

	function setApplication(input) {
		appData = {
			name: input.name,
			category: input.category,
			icon: input.icon || "",
			description: input.description,
			longDescription: input.longDescription
		}
	}

	Flickable {
		anchors.fill: parent
		flickableDirection: Flickable.VerticalFlick

		Column {
			anchors.fill: parent
			padding: 30

			Item {
				height: 24
			}

			Row {
				Layout.fillWidth: true

				Image {
					source: appData ? appData.icon : ""
					sourceSize: "128x128"
				}

				Item {
					width: 30
					height: 1
				}

				Column {
					id: header

					Layout.fillWidth: true

					Label {
						text: appData ? appData.name || "???" : "???"
						font.pixelSize: 64
					}

					Button {
						text: appData ? appData.category || "" : ""
						flat: true

						onClicked: {
							sideBar.setSelectedCategory(appData.category)
							stackView.pop()
						}
					}
				}
			}

			Item {
				width: 1
				height: 12
			}

			Label {
				text: appData ? appData.longDescription || "" : ""
				wrapMode: TextEdit.WordWrap
				horizontalAlignment: Text.AlignJustify

				width: parent.width - parent.padding * 2
			}
		}

		InstallButton {
			x: parent.width - width - 30
			y: header.height - height + 30
		}
	}
}

