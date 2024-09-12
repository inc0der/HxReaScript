package reaper;

import reaper.ReaperTypes;

@:native("gfx")
extern class Graphics {
  public static var r: Float;

  public static var g: Float;

  public static var b: Float;

  public static var a: Float;

  public static var a2: Float;

  public static var w: Float;
  public static var h: Float;
  public static var x: Float;
  public static var y: Float;
  public static var clear: Float;
  public static var texth: Float;
  
  @:native("mouse_y")
  public static var mouseY: Float;

  public static function init(title: String, width: Int, height: Int): Void;
  @:native("getfont")
  public static function getFont(): Int;

  public static function getPixel(): Float;

  public static function quit(): Void;

  public static function update(): Void;

  public static function arc(x: Float, y: Float, r: Float, startAngle: Float, endAngle: Float, antialias: Bool): Void;
  public static function circle(x: Float, y: Float, r: Float, ?fill: Bool, ?antialias: Bool): Void;
}