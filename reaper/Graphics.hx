package reaper;

import reaper.Types;

@:native("gfx")
extern class Graphics {
/**
 * Updates the graphics display, if opened
 */
@:native("update")
public static function update(): Float;
/**
 * Draws a filled triangle, or any convex polygon.
 */
@:native("triangle")
public static function triangle(x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float, ?x4: Float, ?y4: Float, ...args:Array<Float>): Float;
/**
 * Blits to destination at (destx,desty), size (destw,desth). div_w and div_h
 * should be 2..64, and table should point to a table of 2*div_w*div_h values
 * (table can be a regular table or (for less overhead) a reaper.array). Each
 * pair in the table represents a S,T coordinate in the source image, and the
 * table is treated as a left-right, top-bottom list of texture coordinates,
 * which will then be rendered to the destination.
 */
@:native("transformblit")
public static function transformblit(srcImg: Float, destX: Float, destY: Float, destW: Float, destH: Float, divW: Float, divH: Float, table: Float): Float;
/**
 * Shows a popup menu at gfx.x,gfx.y. str is a list of fields separated by |
 * characters. Each field represents a menu item.  Fields can start with special
 * characters:# : grayed out  ! : checked  > : this menu item shows a submenu  <
 * : last item in the current submenuAn empty field will appear as a separator
 * in the menu. gfx.showmenu returns 0 if the user selected nothing from the
 * menu, 1 if the first field is selected, etc.  Example:gfx.showmenu("first
 * item, followed by separator||!second item, checked|>third item which spawns a
 * submenu|#first item in submenu, grayed out|<second and last item in
 * submenu|fourth item in top menu")
 */
@:native("showmenu")
public static function showmenu(str: String): Float;
/**
 * Writes a pixel of r,g,b to gfx.x,gfx.y.
 */
@:native("setpixel")
public static function setpixel(r: Float, g: Float, b: Float): Float;
/**
 * Resize image referenced by index 0..1024-1, width and height must be 0-8192.
 * The contents of the image will be undefined after the resize.
 */
@:native("setimgdim")
public static function setimgdim(image: Float, w: Float, h: Float): Float;
/**
 * Can select a font and optionally configure it. idx=0 for default bitmapped
 * font, no configuration is possible for this font. idx=1..16 for a
 * configurable font, specify fontface such as "Arial", sz of 8-100, and
 * optionally specify flags, which is a multibyte character, which can include
 * 'i' for italics, 'u' for underline, or 'b' for bold. These flags may or may
 * not be supported depending on the font and OS. After calling gfx.setfont(),
 * gfx.texth may be updated to reflect the new average line height.
 */
@:native("setfont")
public static function setfont(idX: Float, ?fontFace: String, ?sz: Float, ?flags: Float): Float;
/**
 * Sets the mouse cursor to resource_id and/or custom_cursor_name.
 */
@:native("setcursor")
public static function setcursor(reSourceId: Float, ?customCursorName: Float): Float;
/**
 * Sets gfx.r/gfx.g/gfx.b/gfx.a/gfx.mode/gfx.a2, sets gfx.dest if final
 * parameter specified
 */
@:native("set")
public static function set(r: Float, ?g: Float, ?b: Float, ?a: Float, ?mode: Float, ?dest: Float, ?a2: Float): Float;
/**
 * Converts the screen coordinates x,y to client coordinates, returns those
 * values.
 */
@:native("screentoclient")
public static function screentoclient(x: Float, y: Float): Float;
/**
 * Draws a rectangle with rounded corners.
 */
@:native("roundrect")
public static function roundrect(x: Float, y: Float, w: Float, h: Float, radius: Float, ?antialias: Float): Float;
/**
 * Fills a rectangle from gfx.x,gfx.y to x,y. Updates gfx.x,gfx.y to x,y.
 */
@:native("rectto")
public static function rectto(x: Float, y: Float): Float;
/**
 * Fills a rectangle at x,y, w,h pixels in dimension, filled by default.
 */
@:native("rect")
public static function rect(x: Float, y: Float, w: Float, h: Float, ?filled: Float): Float;
/**
 * Closes the graphics window.
 */
@:native("quit")
public static function quit(): Float;
/**
 * Formats and draws a string at gfx.x, gfx.y, and updates gfx.x/gfx.y
 * accordingly (the latter only if the formatted string contains newline). For
 * more information on format strings, see sprintf()
 */
@:native("printf")
public static function printf(format: String, ...args:Array<Any>): Float;
/**
 * Multiplies each pixel by mul_* and adds add_*, and updates in-place. Useful
 * for changing brightness/contrast, or other effects.
 */
@:native("muladdrect")
public static function muladdrect(x: Float, y: Float, w: Float, h: Float, mulR: Float, mulG: Float, mulB: Float, ?mulA: Float, ?addR: Float, ?addG: Float, ?addB: Float, ?addA: Float): Float;
/**
 * Measures the drawing dimensions of a string with the current font (as set by
 * gfx.setfont). Returns width and height of string.
 */
@:native("measurestr")
public static function measurestr(str: String): Float;
/**
 * Measures the drawing dimensions of a character with the current font (as set
 * by gfx.setfont). Returns width and height of character.
 */
@:native("measurechar")
public static function measurechar(cHar: Float): Float;
/**
 * Load image from filename into slot 0..1024-1 specified by image. Returns the
 * image index if success, otherwise -1 if failure. The image will be resized to
 * the dimensions of the image file.
 */
@:native("loadimg")
public static function loadimg(image: Float, fileName: String): Float;
/**
 * Draws a line from gfx.x,gfx.y to x,y. If aa is 0.5 or greater, then
 * antialiasing is used. Updates gfx.x and gfx.y to x,y.
 */
@:native("lineto")
public static function lineto(x: Float, y: Float, ?aa: Float): Float;
/**
 * Draws a line from x,y to x2,y2, and if aa is not specified or 0.5 or greater,
 * it will be antialiased.
 */
@:native("line")
public static function line(x: Float, y: Float, x2: Float, y2: Float, ?aa: Float): Float;
/**
 * Initializes the graphics window with title name. Suggested width and height
 * can be specified. If window is already open, a non-empty name will re-title
 * window, or an empty title will resize window.Once the graphics window is
 * open, gfx.update() should be called periodically.
 */
@:native("init")
public static function init(name: String, ?wIdtH: Float, ?heigHt: Float, ?dockState: Float, ?xPos: Float, ?yPos: Float): Float;
/**
 * Fills a gradient rectangle with the color and alpha specified. drdx-dadx
 * reflect the adjustment (per-pixel) applied for each pixel moved to the right,
 * drdy-dady are the adjustment applied for each pixel moved toward the bottom.
 * Normally drdx=adjustamount/w, drdy=adjustamount/h, etc.
 */
@:native("gradrect")
public static function gradrect(x: Float, y: Float, w: Float, h: Float, r: Float, g: Float, b: Float, a: Float, ?drdX: Float, ?dgdX: Float, ?dbdX: Float, ?dadX: Float, ?drdY: Float, ?dgdY: Float, ?dbdY: Float, ?dadY: Float): Float;
/**
 * Returns r,g,b values [0..1] of the pixel at (gfx.x,gfx.y)
 */
@:native("getpixel")
public static function getpixel(): Float;
/**
 * Retreives the dimensions of an image specified by handle, returns w, h pair.
 */
@:native("getimgdim")
public static function getimgdim(handle: Float): Float;
/**
 * Returns current font index, and the actual font face used by this font (if
 * available).
 */
@:native("getfont")
public static function getfont(): Float;
/**
 * Returns success,string for dropped file index idx. call gfx.dropfile(-1) to
 * clear the list when finished.
 */
@:native("getdropfile")
public static function getdropfile(idX: Float): Float;
/**
 * * If unichar is specified, it will be set to the unicode value of the key if
 * available (and the return value may be the unicode value or a raw key value
 * as described above, depending). If unichar is not specified, unicode
 * codepoints greater than 255 will be returned as 'u'<<24 + value
 */
@:native("getchar")
public static function getchar(?cHar: Float, ?unicHar: Float): Float;
/**
 * * flags&256: ignore right/bottom, otherwise text is clipped to (gfx.x, gfx.y,
 * right, bottom)
 */
@:native("drawstr")
public static function drawstr(str: String, ?flags: Float, ?rigHt: Float, ?bottom: Float): Float;
/**
 * Draws the number n with ndigits of precision to gfx.x, gfx.y, and updates
 * gfx.x to the right side of the drawing. The text height is gfx.texth.
 */
@:native("drawnumber")
public static function drawnumber(n: Float, nDigits: Float): Float;
/**
 * Draws the character (can be a numeric ASCII code as well), to gfx.x, gfx.y,
 * and moves gfx.x over by the size of the character.
 */
@:native("drawchar")
public static function drawchar(cHar: Float): Float;
/**
 * Call with v=-1 to query docked state, otherwise v>=0 to set docked state.
 * State is &1 if docked, second byte is docker index (or last docker index if
 * undocked). If wx-wh specified, additional values will be returned with the
 * undocked window position/size
 */
@:native("dock")
public static function dock(v: Float, ?wX: Float, ?wY: Float, ?ww: Float, ?wH: Float): Float;
/**
 * Blits from srcimg(srcx,srcy,srcw,srch) to destination
 * (destx,desty,destw,desth). Source texture coordinates are s/t, dsdx
 * represents the change in s coordinate for each x pixel, dtdy represents the
 * change in t coordinate for each y pixel, etc. dsdxdy represents the change in
 * dsdx for each line. If usecliprect is specified and 0, then srcw/srch are
 * ignored.
 */
@:native("deltablit")
public static function deltablit(srcImg: Float, srcs: Float, srct: Float, srcW: Float, srcH: Float, destX: Float, destY: Float, destW: Float, destH: Float, dsdX: Float, dtdX: Float, dsdY: Float, dtdY: Float, dsdXdY: Float, dtdXdY: Float, ?usecliprect: Float): Float;
/**
 * Converts the coordinates x,y to screen coordinates, returns those values.
 */
@:native("clienttoscreen")
public static function clienttoscreen(x: Float, y: Float): Float;
/**
 * Draws a circle, optionally filling/antialiasing.
 */
@:native("circle")
public static function circle(x: Float, y: Float, r: Float, ?fill: Float, ?antialias: Float): Float;
/**
 * Blurs the region of the screen between gfx.x,gfx.y and x,y, and updates
 * gfx.x,gfx.y to x,y.
 */
@:native("blurto")
public static function blurto(x: Float, y: Float): Float;
/**
 * Deprecated, use gfx.blit instead.
 */
@:native("blitext")
public static function blitext(source: Float, coordinateList: Float, rotation: Float): Float;
/**
 * Copies from source (-1 = main framebuffer, or an image from gfx.loadimg()
 * etc), using current opacity and copy mode (set with gfx.a, gfx.mode).  If
 * destx/desty are not specified, gfx.x/gfx.y will be used as the destination
 * position.  scale (1.0 is unscaled) will be used only if destw/desth are not
 * specified.  rotation is an angle in radians  srcx/srcy/srcw/srch specify the
 * source rectangle (if omitted srcw/srch default to image size) 
 * destx/desty/destw/desth specify destination rectangle (if not specified
 * destw/desth default to srcw/srch * scale).
 */
@:native("blit")
public static function blit(source: Float, ?scale: Float, ?rotation: Float, ?srcX: Float, ?srcY: Float, ?srcW: Float, ?srcH: Float, ?destX: Float, ?destY: Float, ?destW: Float, ?destH: Float, ?rotXoffs: Float, ?rotYoffs: Float): Float;
/**
 * Draws an arc of the circle centered at x,y, with ang1/ang2 being specified in
 * radians.
 */
@:native("arc")
public static function arc(x: Float, y: Float, r: Float, ang1: Float, ang2: Float, ?antialias: Float): Float;

	/** a bitfield of mouse and keyboard modifier state: */
public static var mouse_cap: Float;

	/** horizontal wheel positions, will change typically by 120 or a multiple thereof, the caller should clear the state to 0 after reading it. */
public static var mouse_hwheel: Float;

	/** wheel position, will change typically by 120 or a multiple thereof, the caller should clear the state to 0 after reading it. */
public static var mouse_wheel: Float;

	/** current Y coordinate of the mouse relative to the graphics window. */
public static var mouse_y: Float;

	/** current X coordinate of the mouse relative to the graphics window. */
public static var mouse_x: Float;

	/** to support hidpi/retina, callers should set to 1.0 on initialization, this value will be updated to value greater than 1.0 (such as 2.0) if retina/hidpi. On macOS gfx.w/gfx.h/etc will be doubled, but on other systems gfx.w/gfx.h will remain the same and gfx.ext_retina is a scaling hint for drawing. */
public static var ext_retina: Float;

	/** the (READ-ONLY) height of a line of text in the current font. Do not modify this variable. */
public static var texth: Float;

	/** destination for drawing operations, -1 is main framebuffer, set to 0..1024-1 to have drawing operations go to an offscreen buffer (or loaded image). */
public static var dest: Float;

	/** if greater than -1.0, framebuffer will be cleared to that color. the color for this one is packed RGB (0..255), i.e. red+green*256+blue*65536. The default is 0 (black). */
public static var clear: Float;

	/** current graphics position Y. Some drawing functions use as start position and update. */
public static var y: Float;

	/** current graphics position X. Some drawing functions use as start position and update. */
public static var x: Float;

	/** height of the UI framebuffer. */
public static var h: Float;

	/** width of the UI framebuffer. */
public static var w: Float;

	/** blend mode for drawing. Set mode to 0 for default options. Add 1.0 for additive blend mode (if you wish to do subtractive, set gfx.a to negative and use gfx.mode as additive). Add 2.0 to disable source alpha for gfx.blit(). Add 4.0 to disable filtering for gfx.blit(). */
public static var mode: Float;

	/** alpha for drawing (1=normal). */
public static var a: Float;

	/** current alpha component (0..1) used by drawing operations when writing solid colors (normally ignored but useful when creating transparent images). */
public static var a2: Float;

	/** current blue component (0..1) used by drawing operations. */
public static var b: Float;

	/** current green component (0..1) used by drawing operations. */
public static var g: Float;

	/** current red component (0..1) used by drawing operations. */
public static var r: Float;
}