package test;

import reaper.Core;

class Test {
	static function main() {

		var masterTrack = Core.GetMasterTrack(0);

    if (masterTrack != null) {
			Core.ShowMessageBox("Found master track", "Test", 0);
    } else {
			Core.ShowMessageBox("Unable to find master track", "Test", 0);
    }
	}
}