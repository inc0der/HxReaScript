package test;

import reaper.Reaper;

class Test {
	static function main() {

    var masterTrack = Reaper.GetMasterTrack(0);

    if (masterTrack != null) {
      Reaper.ShowMessageBox("Found master track", "Test", 0);
    } else {
      Reaper.ShowMessageBox("Unable to find master track", "Test", 0);
    }
	}
}