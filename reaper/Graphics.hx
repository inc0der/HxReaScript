@:native("gfx")
extern class Graphics {
/**
 * Draws an arc of the circle centered at x,y, with ang1/ang2 being specified in
 * radians.
 */
@:native("arc")
public static function arc(x: Float, y: Float, r: Float, ang1: Dynamic, ang2: Dynamic, ?antialias: Dynamic): Void;
/**
 * Copies from source (-1 = main framebuffer, or an image from gfx.loadimg()
 * etc), using current opacity and copy mode (set with gfx.a, gfx.mode).
If
 * destx/desty are not specified, gfx.x/gfx.y will be used as the destination
 * position.
scale (1.0 is unscaled) will be used only if destw/desth are not
 * specified.
rotation is an angle in radians
srcx/srcy/srcw/srch specify the
 * source rectangle (if omitted srcw/srch default to image
 * size)
destx/desty/destw/desth specify destination rectangle (if not specified
 * destw/desth default to srcw/srch * scale).
 */
@:native("blit")
public static function blit(source: Dynamic, ?scale: Float, ?rotation: Float, ?srcX: Dynamic, ?srcY: Dynamic, ?srcW: Dynamic, ?srcH: Dynamic, ?destX: Dynamic, ?destY: Dynamic, ?destW: Dynamic, ?destH: Dynamic, ?rotXoffs: Dynamic, ?rotYoffs: Dynamic): Void;
/**
 * Deprecated, use gfx.blit instead.
 */
@:native("blitext")
public static function blitext(source: Dynamic, coordinateList: Dynamic, rotation: Float): Void;
/**
 * Blurs the region of the screen between gfx.x,gfx.y and x,y, and updates
 * gfx.x,gfx.y to x,y.
 */
@:native("blurto")
public static function blurto(x: Float, y: Float): Void;
/**
 * Draws a circle, optionally filling/antialiasing.
 */
@:native("circle")
public static function circle(x: Float, y: Float, r: Float, ?fill: Dynamic, ?antialias: Dynamic): Void;
/**
 * Converts the coordinates x,y to screen coordinates, returns those values.
 */
@:native("clienttoscreen")
public static function clienttoscreen(x: Float, y: Float): Void;
/**
 * Blits from srcimg(srcx,srcy,srcw,srch) to destination
 * (destx,desty,destw,desth). Source texture coordinates are s/t, dsdx
 * represents the change in s coordinate for each x pixel, dtdy represents the
 * change in t coordinate for each y pixel, etc. dsdxdy represents the change in
 * dsdx for each line. If usecliprect is specified and 0, then srcw/srch are
 * ignored.
 */
@:native("deltablit")
public static function deltablit(srcImg: Dynamic, srcs: Dynamic, srct: Dynamic, srcW: Dynamic, srcH: Dynamic, destX: Dynamic, destY: Dynamic, destW: Dynamic, destH: Dynamic, dsdX: Dynamic, dtdX: Dynamic, dsdY: Dynamic, dtdY: Dynamic, dsdXdY: Dynamic, dtdXdY: Dynamic, ?usecliprect: Dynamic): Void;
/**
 * Call with v=-1 to query docked state, otherwise v>=0 to set docked state.
 * State is &1 if docked, second byte is docker index (or last docker index if
 * undocked). If wx-wh specified, additional values will be returned with the
 * undocked window position/size
 */
@:native("dock")
public static function dock(v: Dynamic, ?wX: Dynamic, ?wY: Dynamic, ?ww: Dynamic, ?wH: Dynamic): Void;
/**
 * Draws the character (can be a numeric ASCII code as well), to gfx.x, gfx.y,
 * and moves gfx.x over by the size of the character.
 */
@:native("drawchar")
public static function drawchar(cHar: Dynamic): Void;
/**
 * Draws the number n with ndigits of precision to gfx.x, gfx.y, and updates
 * gfx.x to the right side of the drawing. The text height is gfx.texth.
 */
@:native("drawnumber")
public static function drawnumber(n: Dynamic, nDigits: Dynamic): Void;
/**
 * Draws a string at gfx.x, gfx.y, and updates gfx.x/gfx.y so that subsequent
 * draws will occur in a similar place.
If flags, right ,bottom passed in:
 */
@:native("drawstr")
public static function drawstr(str: String, ?flags: Dynamic, ?rigHt: Dynamic, ?bottom: Dynamic): Void;
/**
 * If char is 0 or omitted, returns a character from the keyboard queue, or 0 if
 * no character is available, or -1 if the graphics window is not open. If char
 * is specified and nonzero, that character's status will be checked, and the
 * function will return greater than 0 if it is pressed. Note that calling
 * gfx.getchar() at least once causes gfx.mouse_cap to reflect keyboard
 * modifiers even when the mouse is not captured.
Common values are standard
 * ASCII, such as 'a', 'A', '=' and '1', but for many keys multi-byte values are
 * used, including 'home', 'up', 'down', 'left', 'rght', 'f1'.. 'f12', 'pgup',
 * 'pgdn', 'ins', and 'del'. 
Modified and special keys can also be returned,
 * including:
 */
@:native("getchar")
public static function getchar(cHar: Dynamic, unicHar: Dynamic): Void;
/**
 * Returns success,string for dropped file index idx. call gfx.dropfile(-1) to
 * clear the list when finished.
 */
@:native("getdropfile")
public static function getdropfile(idX: Dynamic): Void;
/**
 * Returns current font index, and the actual font face used by this font (if
 * available).
 */
@:native("getfont")
public static function getfont(): Void;
/**
 * Retreives the dimensions of an image specified by handle, returns w, h pair.
 */
@:native("getimgdim")
public static function getimgdim(handle: Dynamic): Void;
/**
 * Returns r,g,b values [0..1] of the pixel at (gfx.x,gfx.y)
 */
@:native("getpixel")
public static function getpixel(): Void;
/**
 * Fills a gradient rectangle with the color and alpha specified. drdx-dadx
 * reflect the adjustment (per-pixel) applied for each pixel moved to the right,
 * drdy-dady are the adjustment applied for each pixel moved toward the bottom.
 * Normally drdx=adjustamount/w, drdy=adjustamount/h, etc.
 */
@:native("gradrect")
public static function gradrect(x: Float, y: Float, w: Float, h: Float, r: Float, g: Float, b: Float, a: Float, ?drdX: Dynamic, ?dgdX: Dynamic, ?dbdX: Dynamic, ?dadX: Dynamic, ?drdY: Dynamic, ?dgdY: Dynamic, ?dbdY: Dynamic, ?dadY: Dynamic): Void;
/**
 * Initializes the graphics window with title name. Suggested width and height
 * can be specified. If window is already open, a non-empty name will re-title
 * window, or an empty title will resize window. 
Once the graphics window is
 * open, gfx.update() should be called periodically.
 */
@:native("init")
public static function init(name: String, ?wIdtH: Float, ?heigHt: Float, ?dockState: Dynamic, ?xPos: Float, ?yPos: Float): Void;
/**
 * Draws a line from x,y to x2,y2, and if aa is not specified or 0.5 or greater,
 * it will be antialiased.
 */
@:native("line")
public static function line(x: Float, y: Float, x2: Dynamic, y2: Dynamic, ?aa: Dynamic): Void;
/**
 * Draws a line from gfx.x,gfx.y to x,y. If aa is 0.5 or greater, then
 * antialiasing is used. Updates gfx.x and gfx.y to x,y.
 */
@:native("lineto")
public static function lineto(x: Float, y: Float, ?aa: Dynamic): Void;
/**
 * Load image from filename into slot 0..1024-1 specified by image. Returns the
 * image index if success, otherwise -1 if failure. The image will be resized to
 * the dimensions of the image file.
 */
@:native("loadimg")
public static function loadimg(image: Dynamic, fileName: String): Void;
/**
 * Measures the drawing dimensions of a character with the current font (as set
 * by gfx.setfont). Returns width and height of character.
 */
@:native("measurechar")
public static function measurechar(cHar: Dynamic): Void;
/**
 * Measures the drawing dimensions of a string with the current font (as set by
 * gfx.setfont). Returns width and height of string.
 */
@:native("measurestr")
public static function measurestr(str: String): Void;
/**
 * Multiplies each pixel by mul_* and adds add_*, and updates in-place. Useful
 * for changing brightness/contrast, or other effects.
 */
@:native("muladdrect")
public static function muladdrect(x: Float, y: Float, w: Float, h: Float, mulR: Dynamic, mulG: Dynamic, mulB: Dynamic, ?mulA: Dynamic, ?addR: Dynamic, ?addG: Dynamic, ?addB: Dynamic, ?addA: Dynamic): Void;
/**
 * Closes the graphics window.
 */
@:native("quit")
public static function quit(): Void;
/**
 * Fills a rectangle at x,y, w,h pixels in dimension, filled by default.
 */
@:native("rect")
public static function rect(x: Float, y: Float, w: Float, h: Float, ?filled: Dynamic): Void;
/**
 * Fills a rectangle from gfx.x,gfx.y to x,y. Updates gfx.x,gfx.y to x,y.
 */
@:native("rectto")
public static function rectto(x: Float, y: Float): Void;
/**
 * Draws a rectangle with rounded corners.
 */
@:native("roundrect")
public static function roundrect(x: Float, y: Float, w: Float, h: Float, radius: Dynamic, ?antialias: Dynamic): Void;
/**
 * Converts the screen coordinates x,y to client coordinates, returns those
 * values.
 */
@:native("screentoclient")
public static function screentoclient(x: Float, y: Float): Void;
/**
 * Sets gfx.r/gfx.g/gfx.b/gfx.a/gfx.mode/gfx.a2, sets gfx.dest if final
 * parameter specified
 */
@:native("set")
public static function set(r: Float, ?g: Float, ?b: Float, ?a: Float, ?mode: Dynamic, ?dest: Dynamic, ?a2: Dynamic): Void;
/**
 * Sets the mouse cursor to resource_id and/or custom_cursor_name.
 */
@:native("setcursor")
public static function setcursor(reSourceId: Dynamic, customCursorName: Dynamic): Void;
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
public static function setfont(idX: Dynamic, ?fontFace: Dynamic, ?sz: Dynamic, ?flags: Dynamic): Void;
/**
 * Resize image referenced by index 0..1024-1, width and height must be 0-8192.
 * The contents of the image will be undefined after the resize.
 */
@:native("setimgdim")
public static function setimgdim(image: Dynamic, w: Float, h: Float): Void;
/**
 * Writes a pixel of r,g,b to gfx.x,gfx.y.
 */
@:native("setpixel")
public static function setpixel(r: Float, g: Float, b: Float): Void;
/**
 * Shows a popup menu at gfx.x,gfx.y. str is a list of fields separated by |
 * characters. Each field represents a menu item.
Fields can start with special
 * characters:
# : grayed out
! : checked
> : this menu item shows a submenu
< :
 * last item in the current submenu
An empty field will appear as a separator in
 * the menu. gfx.showmenu returns 0 if the user selected nothing from the menu,
 * 1 if the first field is selected, etc.
Example:
gfx.showmenu("first item,
 * followed by separator||!second item, checked|>third item which spawns a
 * submenu|#first item in submenu, grayed out|<second and last item in
 * submenu|fourth item in top menu")
 */
@:native("showmenu")
public static function showmenu(str: String): Void;
/**
 * Blits to destination at (destx,desty), size (destw,desth). div_w and div_h
 * should be 2..64, and table should point to a table of 2*div_w*div_h values
 * (table can be a regular table or (for less overhead) a reaper.array). Each
 * pair in the table represents a S,T coordinate in the source image, and the
 * table is treated as a left-right, top-bottom list of texture coordinates,
 * which will then be rendered to the destination.
 */
@:native("transformblit")
public static function transformblit(srcImg: Dynamic, destX: Dynamic, destY: Dynamic, destW: Dynamic, destH: Dynamic, divW: Dynamic, divH: Dynamic, table: Dynamic): Void;
/**
 * Updates the graphics display, if opened
 */
@:native("update")
public static function update(): Void;
}