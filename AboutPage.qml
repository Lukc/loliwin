import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Page {
	id: aboutPage

	Column {
		anchors.fill: parent
		anchors.margins: 30

		Image {
			anchors.horizontalCenter: parent.horizontalCenter
			source: "art/lolica.png"
		}

		Item {
			height: 24
			width: 1
		}

		Label {
			text: "<p>Ce logiciel Libre a été écrit pendant les Rencontres Mondiales du Logiciel Libre pour l’association Lolica.</p><p>Parce que les lolis, c’est bien !</p>eapéletaépe atépedrav peaépc eapédec apevc ardec arpdev rdpeca rdpeca dpec deac pdec daépe caérdpec aéepdvac pdev"
			wrapMode: TextEdit.WordWrap
			width: Math.min(500, parent.width - parent.anchors.margins * 2)
			horizontalAlignment: Text.AlignJustify
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}
}
