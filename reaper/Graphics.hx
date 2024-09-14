package reaper;

import reaper.DrawStrFlag;

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

  public static var mode: Float;

  public static var dest: Float;

  public static var clear: Float;

  @:native("texth")
  public static var textH: Float;

  @:native("ext_retina")
  public static var ext_retina : Float;
  
  @:native("mouse_x")
  public static var mouseX  : Float;

  @:native("mouse_y")
  public static var mouseY  : Float;

  @:native("mouse_wheel")
  public static var mouseWheel   : Float;

  @:native("mouse_hwheel")
  public static var mouseHorzWheel   : Float;

  @:native("mouse_cap")
  public static var mouseCap   : Float;

  public static function init(title: String, ?width: Int, ?height: Int, ?dockState: Bool, ?x: Float, ?y: Float): Void;

  @:native("getfont")
  public static function getFont(): Int;

  @:native("getpixel")
  public static function getPixel(): Float;

  public static function quit(): Void;

  public static function update(): Void;
  
  // fx.blit(source[, scale, rotation, srcx, srcy, srcw, srch, destx, desty, destw, desth, rotxoffs, rotyoffs])
  public static function blit(src: Int, ?scale: Float, ?rotation: Float, ?srcx: Float, ?srcy: Float, ?srcw: Float, ?srch: Float, ?destx: Float, ?desty: Float, ?destw: Float, ?desth: Float, ?rotxoffs: Float, ?rotyoffs: Float): Void;

  // gfx.blitext(source,coordinatelist,rotation)
  @:native("blitext")
  public static function blitText(src: Int, coordList: Float, ?rotation: Float): Void;

  @:native("blurto")
  public static function blurTo(x: Float, y: Float): Void;

  public static function arc(x: Float, y: Float, r: Float, startAngle: Float, endAngle: Float, antialias: Bool): Void;

  public static function circle(x: Float, y: Float, r: Float, ?fill: Bool, ?antialias: Bool): Void;

  @:native("drawstr")
  public static function drawString(text: String, ?flags: Int, ?right: Bool, ?bottom: Bool): Void;

  @:native("clienttoscreen")
  public static function clientToScreen(x: Float, y: Float): Void;

  /**
   * @TODO Unsure about this method and it's proper types.
   *
   * Blits from srcimg(srcx,srcy,srcw,srch) to destination (destx,desty,destw,desth).
   *  Source texture coordinates are s/t, dsdx represents the change in s coordinate
   * for each x pixel, dtdy represents the change in t coordinate for each y pixel,
   * etc. dsdxdy represents the change in dsdx for each line. If usecliprect is
   * specified and 0, then srcw/srch are ignored. 
   */
  @:native("deltablit")
  public static function deltaBlit(srcImg: String, srcs: Float, srct: Float, srcw: Float, srch: Float, destx: Float, desty: Float, destw: Float, desth: Float, dsdx: Float, dtdx: Float, dsdy: Float, dtdy: Float, dsdxdy: Float, dtdxdy: Float, ?useClipRect: Bool): Void;

  public static function dock(v: Float, ?wx: Float, ?wy: Float, ?ww: Float, ?wh: Float)  : Void;

  @:native("measurestr")
  public static function measureText(text: String): Float;

}