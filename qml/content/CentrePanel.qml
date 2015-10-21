import QtQuick 2.2

Rectangle {
	id: centrePanel

    property bool carDoorValue: CarStatus.rfDoor || CarStatus.lfDoor || CarStatus.rrDoor || CarStatus.lrDoor ||
                                CarStatus.trunkDoor || CarStatus.hoodDoor

    onCarDoorValueChanged: {
        if(true === carDoorValue) {
            carDoorPanel.state = "show";
            displayWindow.state = "";
        } else {
            carDoorPanel.state = "";
            displayWindow.state = "show";
        }
    }

    CarDoorPanel {
        id: carDoorPanel
        state: ""
    }
    DisplayWindow {
        id: displayWindow
        state: "show"
    }
    CentreInfo {
        id: centreInfo
        state: "show"
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: carDoorPanel; state: ""}
            PropertyChanges { target: displayWindow; state: "" }
            PropertyChanges { target: centreInfo; state: "" }
        },
        State {
            name: "show"
//            PropertyChanges { target: carDoorPanel; state: "show" }
            PropertyChanges { target: displayWindow; state: "show" }
            PropertyChanges { target: centreInfo; state: "show" }
        }
    ]
}
