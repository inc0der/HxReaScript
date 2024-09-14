package test;

import reaper.Reaper;
import reaper.Graphics;
import reaper.DrawStrFlag;

class Test {
	static function main() {

    var width = 400;
    var height = 300;
    var title = "Test Window wit hxReaScript (Lua)";

    Graphics.init(title, width, height);

    Reaper.defer(Test.update);
	}

  static function changeColor(r: Float, g: Float, b: Float) {
    Graphics.r = r;
    Graphics.g = g;
    Graphics.b = b;
  }

  static function drawTextCenter(text: String) {
    var textW = Graphics.measureText(text);
    Graphics.x = Graphics.w / 2 - textW / 2;
    Graphics.y = Graphics.h / 2;
    Graphics.drawString(text, 0x05);
  }

  static function drawGraphics() {
    Graphics.clear = 0x222222;
    Test.changeColor(0.2, 0.6, 0.2);
    Graphics.circle(Graphics.w / 2, Graphics.h / 2, 100, true, true);
    Test.changeColor(0.2, 0.2, 0.2);
    Test.drawTextCenter("Hello World");
    Graphics.update();
  } 

  static function update () {
    Test.drawGraphics();
    Reaper.defer(Test.update);
  }
}