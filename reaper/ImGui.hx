package reaper;

import reaper.Types;

@:native("reaper")
extern class ImGui {
/**
 * Accept contents of a given type. If DragDropFlags_AcceptBeforeDelivery is
 * set
you can peek into the payload before the mouse button is released.
 */
@:native("ImGui_AcceptDragDropPayload")
public static function imGuiAcceptDragDropPayload(ctX: ImGuiContext, tYpe: String, paYload: String, ?flagsIn: Int): Bool;
/**
 * Accept a list of dropped files. See AcceptDragDropPayload and
 * GetDragDropPayloadFile.
 */
@:native("ImGui_AcceptDragDropPayloadFiles")
public static function imGuiAcceptDragDropPayloadFiles(ctX: ImGuiContext, count: Int, ?flagsIn: Int): Bool;
/**
 * Accept a RGB color. See AcceptDragDropPayload.
 */
@:native("ImGui_AcceptDragDropPayloadRGB")
public static function imGuiAcceptDragDropPayloadRgb(ctX: ImGuiContext, rgb: Int, ?flagsIn: Int): Bool;
/**
 * Accept a RGBA color. See AcceptDragDropPayload.
 */
@:native("ImGui_AcceptDragDropPayloadRGBA")
public static function imGuiAcceptDragDropPayloadRgba(ctX: ImGuiContext, rgba: Int, ?flagsIn: Int): Bool;
/**
 * Vertically align upcoming text baseline to StyleVar_FramePadding.y so that
 * it
will align properly to regularly framed items (call if you have text on a
 * line
before a framed item).
 */
@:native("ImGui_AlignTextToFramePadding")
public static function imGuiAlignTextToFramePadding(ctX: ImGuiContext): Void;
/**
 * Square button with an arrow shape. 'dir' is one of the Dir_* values
 */
@:native("ImGui_ArrowButton")
public static function imGuiArrowButton(ctX: ImGuiContext, strId: String, dir: Int): Bool;
/**
 * Link the object's lifetime to the given context.
Objects can be draw list
 * splitters, fonts, images, list clippers, etc.
Call Detach to let the object
 * be garbage-collected after unuse again.
List clipper objects may only be
 * attached to the context they were created for.
 */
@:native("ImGui_Attach")
public static function imGuiAttach(ctX: ImGuiContext, obj: ImGuiResource): Void;
/**
 * Push window to the stack and start appending to it.
- Passing true to
 * 'p_open' shows a window-closing widget in the upper-right
  corner of the
 * window, which clicking will set the boolean to false when returned.
- You may
 * append multiple times to the same window during the same frame by
  calling
 * Begin()/End() pairs multiple times. Some information such as 'flags'
  or
 * 'p_open' will only be considered by the first call to Begin().
- Begin()
 * return false to indicate the window is collapsed or fully clipped,
  so you
 * may early out and omit submitting anything to the window.
 */
@:native("ImGui_Begin")
public static function imGuiBegin(ctX: ImGuiContext, name: String, ?pOpen: Bool, ?flagsIn: Int): Bool;
/**
 * Manual sizing (each axis can use a different setting e.g. size_w=0 and
 * size_h=400):
- = 0.0: use remaining parent window size for this axis
- \>
 * 0.0: use specified size for this axis
- < 0.0: right/bottom-align to
 * specified distance from available content boundaries
Specifying
 * ChildFlags_AutoResizeX or ChildFlags_AutoResizeY makes the sizing
automatic
 * based on child contents.
Combining both ChildFlags_AutoResizeX _and_
 * ChildFlags_AutoResizeY defeats
purpose of a scrolling region and is NOT
 * recommended.
Returns false to indicate the window is collapsed or fully
 * clipped.
 */
@:native("ImGui_BeginChild")
public static function imGuiBeginChild(ctX: ImGuiContext, strId: String, ?sizeWIn: Float, ?sizeHIn: Float, ?cHildFlagsIn: Int, ?windowFlagsIn: Int): Bool;
/**
 * The BeginCombo/EndCombo API allows you to manage your contents and
 * selection
state however you want it, by creating e.g. Selectable items.
 */
@:native("ImGui_BeginCombo")
public static function imGuiBeginCombo(ctX: ImGuiContext, label: String, previeWValue: String, ?flagsIn: Int): Bool;
/**
 * Disable all user interactions and dim items visuals
(applying
 * StyleVar_DisabledAlpha over current colors).
Those can be nested but it
 * cannot be used to enable an already disabled section
(a single
 * BeginDisabled(true) in the stack is enough to keep everything
 * disabled).
Tooltips windows by exception are opted out of
 * disabling.
BeginDisabled(false)/EndDisabled essentially does nothing but is
 * provided to
facilitate use of boolean expressions (as a micro-optimization:
 * if you have tens
of thousands of BeginDisabled(false)/EndDisabled() pairs,
 * you might want to
refactor your code to avoid making those calls)
 */
@:native("ImGui_BeginDisabled")
public static function imGuiBeginDisabled(ctX: ImGuiContext, ?disabledIn: Bool): Void;
/**
 * Call after submitting an item which may be dragged. when this return
 * true,
you can call SetDragDropPayload() + EndDragDropSource()
If you stop
 * calling BeginDragDropSource() the payload is preserved however
it won't have
 * a preview tooltip (we currently display a fallback "..." tooltip
as
 * replacement).
 */
@:native("ImGui_BeginDragDropSource")
public static function imGuiBeginDragDropSource(ctX: ImGuiContext, ?flagsIn: Int): Bool;
/**
 * Call after submitting an item that may receive a payload.
If this returns
 * true, you can call AcceptDragDropPayload + EndDragDropTarget.
 */
@:native("ImGui_BeginDragDropTarget")
public static function imGuiBeginDragDropTarget(ctX: ImGuiContext): Bool;
/**
 * Lock horizontal starting position. See EndGroup.
 */
@:native("ImGui_BeginGroup")
public static function imGuiBeginGroup(ctX: ImGuiContext): Void;
/**
 * Begin/append a tooltip window if preceding item was hovered. Shortcut
 * for
`IsItemHovered(HoveredFlags_ForTooltip) && BeginTooltip()`.
 */
@:native("ImGui_BeginItemTooltip")
public static function imGuiBeginItemTooltip(ctX: ImGuiContext): Bool;
/**
 * Open a framed scrolling region.
You can submit contents and manage your
 * selection state however you want it,
by creating e.g. Selectable or any other
 * items.
- Choose frame width:
  - width  > 0.0: custom
  - width  < 0.0 or
 * -FLT_MIN: right-align
  - width  = 0.0 (default): use current ItemWidth
-
 * Choose frame height:
  - height > 0.0: custom
  - height < 0.0 or -FLT_MIN:
 * bottom-align
  - height = 0.0 (default): arbitrary default height which can
 * fit ~7 items
See EndListBox.
 */
@:native("ImGui_BeginListBox")
public static function imGuiBeginListBox(ctX: ImGuiContext, label: String, ?sizeWIn: Float, ?sizeHIn: Float): Bool;
/**
 * Create a sub-menu entry. only call EndMenu if this returns true!
 */
@:native("ImGui_BeginMenu")
public static function imGuiBeginMenu(ctX: ImGuiContext, label: String, ?enabledIn: Bool): Bool;
/**
 * Append to menu-bar of current window (requires WindowFlags_MenuBar flag
 * set
on parent window). See EndMenuBar.
 */
@:native("ImGui_BeginMenuBar")
public static function imGuiBeginMenuBar(ctX: ImGuiContext): Bool;
/**
 * Query popup state, if open start appending into the window. Call
 * EndPopup
afterwards if returned true. WindowFlags* are forwarded to the
 * window.
Return true if the popup is open, and you can start outputting to it.
 */
@:native("ImGui_BeginPopup")
public static function imGuiBeginPopup(ctX: ImGuiContext, strId: String, ?flagsIn: Int): Bool;
/**
 * This is a helper to handle the simplest case of associating one named
 * popup
to one given widget. You can pass a nil str_id to use the identifier of
 * the last
item. This is essentially the same as calling OpenPopupOnItemClick +
 * BeginPopup
but written to avoid computing the ID twice because
 * BeginPopupContext*
functions may be called very frequently.
If you want to
 * use that on a non-interactive item such as Text you need to pass
in an
 * explicit ID here.
 */
@:native("ImGui_BeginPopupContextItem")
public static function imGuiBeginPopupContextItem(ctX: ImGuiContext, ?strIdIn: String, ?popupFlagsIn: Int): Bool;
/**
 * Open+begin popup when clicked on current window.
 */
@:native("ImGui_BeginPopupContextWindow")
public static function imGuiBeginPopupContextWindow(ctX: ImGuiContext, ?strIdIn: String, ?popupFlagsIn: Int): Bool;
/**
 * Block every interaction behind the window, cannot be closed by user, add
 * a
dimming background, has a title bar. Return true if the modal is open, and
 * you
can start outputting to it. See BeginPopup.
 */
@:native("ImGui_BeginPopupModal")
public static function imGuiBeginPopupModal(ctX: ImGuiContext, name: String, ?pOpen: Bool, ?flagsIn: Int): Bool;
/**
 * Create and append into a TabBar.
 */
@:native("ImGui_BeginTabBar")
public static function imGuiBeginTabBar(ctX: ImGuiContext, strId: String, ?flagsIn: Int): Bool;
/**
 * Create a Tab. Returns true if the Tab is selected.
Set 'p_open' to true to
 * enable the close button.
 */
@:native("ImGui_BeginTabItem")
public static function imGuiBeginTabItem(ctX: ImGuiContext, label: String, ?pOpen: Bool, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_BeginTable")
public static function imGuiBeginTable(ctX: ImGuiContext, strId: String, columns: Int, ?flagsIn: Int, ?outerSizeWIn: Float, ?outerSizeHIn: Float, ?innerWIdtHIn: Float): Bool;
/**
 * Begin/append a tooltip window.
 */
@:native("ImGui_BeginTooltip")
public static function imGuiBeginTooltip(ctX: ImGuiContext): Bool;
/**
 * Draw a small circle + keep the cursor on the same line.
Advance cursor x
 * position by GetTreeNodeToLabelSpacing,
same distance that TreeNode uses.
 */
@:native("ImGui_Bullet")
public static function imGuiBullet(ctX: ImGuiContext): Void;
/**
 * Shortcut for Bullet + Text.
 */
@:native("ImGui_BulletText")
public static function imGuiBulletText(ctX: ImGuiContext, teXt: String): Void;
/** No description available */
@:native("ImGui_Button")
public static function imGuiButton(ctX: ImGuiContext, label: String, ?sizeWIn: Float, ?sizeHIn: Float): Bool;
/**
 * Do not disable navigation/tabbing. Otherwise disabled by default.
 */
@:native("ImGui_ButtonFlags_EnableNav")
public static function imGuiButtonFlagsEnableNav(): Int;
/**
 * React on left mouse button (default).
 */
@:native("ImGui_ButtonFlags_MouseButtonLeft")
public static function imGuiButtonFlagsMouseButtonLeft(): Int;
/**
 * React on center mouse button.
 */
@:native("ImGui_ButtonFlags_MouseButtonMiddle")
public static function imGuiButtonFlagsMouseButtonMiddle(): Int;
/**
 * React on right mouse button.
 */
@:native("ImGui_ButtonFlags_MouseButtonRight")
public static function imGuiButtonFlagsMouseButtonRight(): Int;
/** No description available */
@:native("ImGui_ButtonFlags_None")
public static function imGuiButtonFlagsNone(): Int;
/**
 * Width of item given pushed settings and current cursor position.
NOT
 * necessarily the width of last item unlike most 'Item' functions.
 */
@:native("ImGui_CalcItemWidth")
public static function imGuiCalcItemWidth(ctX: ImGuiContext): Float;
/** No description available */
@:native("ImGui_CalcTextSize")
public static function imGuiCalcTextSize(ctX: ImGuiContext, teXt: String, w: Float, h: Float, ?hIdeTeXtAfterDoubleHashIn: Bool, ?wrapWIdtHIn: Float): Float;
/** No description available */
@:native("ImGui_Checkbox")
public static function imGuiCheckbox(ctX: ImGuiContext, label: String, v: Bool): Bool;
/** No description available */
@:native("ImGui_CheckboxFlags")
public static function imGuiCheckboxFlags(ctX: ImGuiContext, label: String, flags: Int, flagsValue: Int): Bool;
/**
 * Combined with AutoResizeX/AutoResizeY. Always measure size even when child
is
 * hidden, always return true, always disable clipping optimization! NOT
 * RECOMMENDED.
 */
@:native("ImGui_ChildFlags_AlwaysAutoResize")
public static function imGuiChildFlagsAlwaysAutoResize(): Int;
/**
 * Pad with StyleVar_WindowPadding even if no border are drawn (no padding
 * by
default for non-bordered child windows because it makes more sense).
 */
@:native("ImGui_ChildFlags_AlwaysUseWindowPadding")
public static function imGuiChildFlagsAlwaysUseWindowPadding(): Int;
/**
 * Enable auto-resizing width. Read notes above.
 */
@:native("ImGui_ChildFlags_AutoResizeX")
public static function imGuiChildFlagsAutoResizeX(): Int;
/**
 * Enable auto-resizing height. Read notes above.
 */
@:native("ImGui_ChildFlags_AutoResizeY")
public static function imGuiChildFlagsAutoResizeY(): Int;
/**
 * Show an outer border and enable WindowPadding.
 */
@:native("ImGui_ChildFlags_Borders")
public static function imGuiChildFlagsBorders(): Int;
/**
 * Style the child window like a framed item: use Col_FrameBg,
  
 * StyleVar_FrameRounding, StyleVar_FrameBorderSize, StyleVar_FramePadding
  
 * instead of Col_ChildBg, StyleVar_ChildRounding, StyleVar_ChildBorderSize,
  
 * StyleVar_WindowPadding.
 */
@:native("ImGui_ChildFlags_FrameStyle")
public static function imGuiChildFlagsFrameStyle(): Int;
/**
 * Share focus scope, allow keyboard/gamepad navigation to cross over parent
  
 * border to this child or between sibling child windows.
 */
@:native("ImGui_ChildFlags_NavFlattened")
public static function imGuiChildFlagsNavFlattened(): Int;
/** No description available */
@:native("ImGui_ChildFlags_None")
public static function imGuiChildFlagsNone(): Int;
/**
 * Allow resize from right border (layout direction).
Enables .ini saving
 * (unless WindowFlags_NoSavedSettings passed to window flags).
 */
@:native("ImGui_ChildFlags_ResizeX")
public static function imGuiChildFlagsResizeX(): Int;
/**
 * Allow resize from bottom border (layout direction).
Enables .ini saving
 * (unless WindowFlags_NoSavedSettings passed to window flags).
 */
@:native("ImGui_ChildFlags_ResizeY")
public static function imGuiChildFlagsResizeY(): Int;
/**
 * Manually close the popup we have begin-ed into.
Use inside the
 * BeginPopup/EndPopup scope to close manually.
CloseCurrentPopup() is called by
 * default by Selectable/MenuItem when activated.
 */
@:native("ImGui_CloseCurrentPopup")
public static function imGuiCloseCurrentPopup(ctX: ImGuiContext): Void;
/** No description available */
@:native("ImGui_Col_Border")
public static function imGuiColBorder(): Int;
/** No description available */
@:native("ImGui_Col_BorderShadow")
public static function imGuiColBorderShadow(): Int;
/** No description available */
@:native("ImGui_Col_Button")
public static function imGuiColButton(): Int;
/** No description available */
@:native("ImGui_Col_ButtonActive")
public static function imGuiColButtonActive(): Int;
/** No description available */
@:native("ImGui_Col_ButtonHovered")
public static function imGuiColButtonHovered(): Int;
/**
 * Checkbox tick and RadioButton circle
 */
@:native("ImGui_Col_CheckMark")
public static function imGuiColCheckMark(): Int;
/**
 * Background of child windows.
 */
@:native("ImGui_Col_ChildBg")
public static function imGuiColChildBg(): Int;
/**
 * Background color for empty node (e.g. CentralNode with no window docked into
 * it).
 */
@:native("ImGui_Col_DockingEmptyBg")
public static function imGuiColDockingEmptyBg(): Int;
/**
 * Preview overlay color when about to docking something.
 */
@:native("ImGui_Col_DockingPreview")
public static function imGuiColDockingPreview(): Int;
/**
 * Rectangle highlighting a drop target
 */
@:native("ImGui_Col_DragDropTarget")
public static function imGuiColDragDropTarget(): Int;
/**
 * Background of checkbox, radio button, plot, slider, text input.
 */
@:native("ImGui_Col_FrameBg")
public static function imGuiColFrameBg(): Int;
/** No description available */
@:native("ImGui_Col_FrameBgActive")
public static function imGuiColFrameBgActive(): Int;
/** No description available */
@:native("ImGui_Col_FrameBgHovered")
public static function imGuiColFrameBgHovered(): Int;
/**
 * Header* colors are used for CollapsingHeader, TreeNode, Selectable, MenuItem.
 */
@:native("ImGui_Col_Header")
public static function imGuiColHeader(): Int;
/** No description available */
@:native("ImGui_Col_HeaderActive")
public static function imGuiColHeaderActive(): Int;
/** No description available */
@:native("ImGui_Col_HeaderHovered")
public static function imGuiColHeaderHovered(): Int;
/**
 * InputText cursor/caret
 */
@:native("ImGui_Col_InputTextCursor")
public static function imGuiColInputTextCursor(): Int;
/** No description available */
@:native("ImGui_Col_MenuBarBg")
public static function imGuiColMenuBarBg(): Int;
/**
 * Darken/colorize entire screen behind a modal window, when one is active.
 */
@:native("ImGui_Col_ModalWindowDimBg")
public static function imGuiColModalWindowDimBg(): Int;
/**
 * Color of keyboard/gamepad navigation cursor/rectangle, when visible
 */
@:native("ImGui_Col_NavCursor")
public static function imGuiColNavCursor(): Int;
/**
 * Darken/colorize entire screen behind the CTRL+TAB window list, when active.
 */
@:native("ImGui_Col_NavWindowingDimBg")
public static function imGuiColNavWindowingDimBg(): Int;
/**
 * Highlight window when using CTRL+TAB.
 */
@:native("ImGui_Col_NavWindowingHighlight")
public static function imGuiColNavWindowingHighlight(): Int;
/** No description available */
@:native("ImGui_Col_PlotHistogram")
public static function imGuiColPlotHistogram(): Int;
/** No description available */
@:native("ImGui_Col_PlotHistogramHovered")
public static function imGuiColPlotHistogramHovered(): Int;
/** No description available */
@:native("ImGui_Col_PlotLines")
public static function imGuiColPlotLines(): Int;
/** No description available */
@:native("ImGui_Col_PlotLinesHovered")
public static function imGuiColPlotLinesHovered(): Int;
/**
 * Background of popups, menus, tooltips windows.
 */
@:native("ImGui_Col_PopupBg")
public static function imGuiColPopupBg(): Int;
/**
 * Resize grip in lower-right and lower-left corners of windows.
 */
@:native("ImGui_Col_ResizeGrip")
public static function imGuiColResizeGrip(): Int;
/** No description available */
@:native("ImGui_Col_ResizeGripActive")
public static function imGuiColResizeGripActive(): Int;
/** No description available */
@:native("ImGui_Col_ResizeGripHovered")
public static function imGuiColResizeGripHovered(): Int;
/** No description available */
@:native("ImGui_Col_ScrollbarBg")
public static function imGuiColScrollbarBg(): Int;
/** No description available */
@:native("ImGui_Col_ScrollbarGrab")
public static function imGuiColScrollbarGrab(): Int;
/** No description available */
@:native("ImGui_Col_ScrollbarGrabActive")
public static function imGuiColScrollbarGrabActive(): Int;
/** No description available */
@:native("ImGui_Col_ScrollbarGrabHovered")
public static function imGuiColScrollbarGrabHovered(): Int;
/** No description available */
@:native("ImGui_Col_Separator")
public static function imGuiColSeparator(): Int;
/** No description available */
@:native("ImGui_Col_SeparatorActive")
public static function imGuiColSeparatorActive(): Int;
/** No description available */
@:native("ImGui_Col_SeparatorHovered")
public static function imGuiColSeparatorHovered(): Int;
/** No description available */
@:native("ImGui_Col_SliderGrab")
public static function imGuiColSliderGrab(): Int;
/** No description available */
@:native("ImGui_Col_SliderGrabActive")
public static function imGuiColSliderGrabActive(): Int;
/**
 * Tab background, when tab-bar is focused & tab is unselected
 */
@:native("ImGui_Col_Tab")
public static function imGuiColTab(): Int;
/**
 * Tab background, when tab-bar is unfocused & tab is unselected
 */
@:native("ImGui_Col_TabDimmed")
public static function imGuiColTabDimmed(): Int;
/**
 * Tab background, when tab-bar is unfocused & tab is selected
 */
@:native("ImGui_Col_TabDimmedSelected")
public static function imGuiColTabDimmedSelected(): Int;
/**
 * Horizontal overline, when tab-bar is unfocused & tab is selected
 */
@:native("ImGui_Col_TabDimmedSelectedOverline")
public static function imGuiColTabDimmedSelectedOverline(): Int;
/**
 * Tab background, when hovered
 */
@:native("ImGui_Col_TabHovered")
public static function imGuiColTabHovered(): Int;
/**
 * Tab background, when tab-bar is focused & tab is selected
 */
@:native("ImGui_Col_TabSelected")
public static function imGuiColTabSelected(): Int;
/**
 * Tab horizontal overline, when tab-bar is focused & tab is selected
 */
@:native("ImGui_Col_TabSelectedOverline")
public static function imGuiColTabSelectedOverline(): Int;
/**
 * Table inner borders (prefer using Alpha=1.0 here).
 */
@:native("ImGui_Col_TableBorderLight")
public static function imGuiColTableBorderLight(): Int;
/**
 * Table outer and header borders (prefer using Alpha=1.0 here).
 */
@:native("ImGui_Col_TableBorderStrong")
public static function imGuiColTableBorderStrong(): Int;
/**
 * Table header background.
 */
@:native("ImGui_Col_TableHeaderBg")
public static function imGuiColTableHeaderBg(): Int;
/**
 * Table row background (even rows).
 */
@:native("ImGui_Col_TableRowBg")
public static function imGuiColTableRowBg(): Int;
/**
 * Table row background (odd rows).
 */
@:native("ImGui_Col_TableRowBgAlt")
public static function imGuiColTableRowBgAlt(): Int;
/** No description available */
@:native("ImGui_Col_Text")
public static function imGuiColText(): Int;
/** No description available */
@:native("ImGui_Col_TextDisabled")
public static function imGuiColTextDisabled(): Int;
/**
 * Hyperlink color
 */
@:native("ImGui_Col_TextLink")
public static function imGuiColTextLink(): Int;
/**
 * Selected text inside an InputText
 */
@:native("ImGui_Col_TextSelectedBg")
public static function imGuiColTextSelectedBg(): Int;
/**
 * Title bar
 */
@:native("ImGui_Col_TitleBg")
public static function imGuiColTitleBg(): Int;
/**
 * Title bar when focused
 */
@:native("ImGui_Col_TitleBgActive")
public static function imGuiColTitleBgActive(): Int;
/**
 * Title bar when collapsed
 */
@:native("ImGui_Col_TitleBgCollapsed")
public static function imGuiColTitleBgCollapsed(): Int;
/**
 * Tree node hierarchy outlines when using TreeNodeFlags_DrawLines
 */
@:native("ImGui_Col_TreeLines")
public static function imGuiColTreeLines(): Int;
/**
 * Background of normal windows. See also WindowFlags_NoBackground.
 */
@:native("ImGui_Col_WindowBg")
public static function imGuiColWindowBg(): Int;
/**
 * Returns true when opened but do not indent nor push into the ID
 * stack
(because of the TreeNodeFlags_NoTreePushOnOpen flag).
This is basically
 * the same as calling TreeNode(label, TreeNodeFlags_CollapsingHeader).
You can
 * remove the _NoTreePushOnOpen flag if you want behavior closer to
 * normal
TreeNode.
When 'visible' is provided: if 'true' display an additional
 * small close button
on upper right of the header which will set the bool to
 * false when clicked,
if 'false' don't display the header.
 */
@:native("ImGui_CollapsingHeader")
public static function imGuiCollapsingHeader(ctX: ImGuiContext, label: String, ?pVisible: Bool, ?flagsIn: Int): Bool;
/**
 * Display a color square/button, hover for details, return true when
 * pressed.
Color is in 0xRRGGBBAA or, if ColorEditFlags_NoAlpha is set,
 * 0xRRGGBB.
 */
@:native("ImGui_ColorButton")
public static function imGuiColorButton(ctX: ImGuiContext, descId: String, colRgba: Int, ?flagsIn: Int, ?sizeWIn: Float, ?sizeHIn: Float): Bool;
/**
 * Pack 0..1 RGBA values into a 32-bit integer (0xRRGGBBAA).
 */
@:native("ImGui_ColorConvertDouble4ToU32")
public static function imGuiColorConvertDouble4ToU32(r: Float, g: Float, b: Float, a: Float): Int;
/**
 * Convert HSV values (0..1) into RGB (0..1).
 */
@:native("ImGui_ColorConvertHSVtoRGB")
public static function imGuiColorConvertHsVtoRgb(h: Float, s: Float, v: Float): Float;
/**
 * Convert a native color coming from REAPER or 0xRRGGBB to native.
This swaps
 * the red and blue channels on Windows.
 */
@:native("ImGui_ColorConvertNative")
public static function imGuiColorConvertNative(rgb: Int): Int;
/**
 * Convert RGB values (0..1) into HSV (0..1).
 */
@:native("ImGui_ColorConvertRGBtoHSV")
public static function imGuiColorConvertRgBtoHsv(r: Float, g: Float, b: Float): Float;
/**
 * Unpack a 32-bit integer (0xRRGGBBAA) into separate RGBA values (0..1).
 */
@:native("ImGui_ColorConvertU32ToDouble4")
public static function imGuiColorConvertU32ToDouble4(rgba: Int): Float;
/**
 * Color is in 0xXXRRGGBB. XX is ignored and will not be modified.
 */
@:native("ImGui_ColorEdit3")
public static function imGuiColorEdit3(ctX: ImGuiContext, label: String, colRgb: Int, ?flagsIn: Int): Bool;
/**
 * Color is in 0xRRGGBBAA or, if ColorEditFlags_NoAlpha is set, 0xXXRRGGBB
(XX
 * is ignored and will not be modified).
 */
@:native("ImGui_ColorEdit4")
public static function imGuiColorEdit4(ctX: ImGuiContext, label: String, colRgba: Int, ?flagsIn: Int): Bool;
/**
 * ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
 */
@:native("ImGui_ColorEditFlags_AlphaBar")
public static function imGuiColorEditFlagsAlphaBar(): Int;
/**
 * Disable rendering a checkerboard background behind transparent color.
 */
@:native("ImGui_ColorEditFlags_AlphaNoBg")
public static function imGuiColorEditFlagsAlphaNoBg(): Int;
/**
 * Disable alpha in the preview.
   Contrary to _NoAlpha it may still be edited
 * when calling ColorEdit4/ColorPicker4.
   For ColorButton this does the same
 * as _NoAlpha.
 */
@:native("ImGui_ColorEditFlags_AlphaOpaque")
public static function imGuiColorEditFlagsAlphaOpaque(): Int;
/**
 * Display half opaque / half transparent preview.
 */
@:native("ImGui_ColorEditFlags_AlphaPreviewHalf")
public static function imGuiColorEditFlagsAlphaPreviewHalf(): Int;
/**
 * ColorEdit: override _display_ type to HSV. ColorPicker:
   select any
 * combination using one or more of RGB/HSV/Hex.
 */
@:native("ImGui_ColorEditFlags_DisplayHSV")
public static function imGuiColorEditFlagsDisplayHsv(): Int;
/**
 * ColorEdit: override _display_ type to Hex. ColorPicker:
   select any
 * combination using one or more of RGB/HSV/Hex.
 */
@:native("ImGui_ColorEditFlags_DisplayHex")
public static function imGuiColorEditFlagsDisplayHex(): Int;
/**
 * ColorEdit: override _display_ type to RGB. ColorPicker:
   select any
 * combination using one or more of RGB/HSV/Hex.
 */
@:native("ImGui_ColorEditFlags_DisplayRGB")
public static function imGuiColorEditFlagsDisplayRgb(): Int;
/**
 * ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0..1.0
 
 * floats instead of 0..255 integers. No round-trip of value via integers.
 */
@:native("ImGui_ColorEditFlags_Float")
public static function imGuiColorEditFlagsFloat(): Int;
/**
 * ColorEdit, ColorPicker: input and output data in HSV format.
 */
@:native("ImGui_ColorEditFlags_InputHSV")
public static function imGuiColorEditFlagsInputHsv(): Int;
/**
 * ColorEdit, ColorPicker: input and output data in RGB format.
 */
@:native("ImGui_ColorEditFlags_InputRGB")
public static function imGuiColorEditFlagsInputRgb(): Int;
/**
 * ColorEdit, ColorPicker, ColorButton: ignore Alpha component
  (will only read
 * 3 components from the input pointer).
 */
@:native("ImGui_ColorEditFlags_NoAlpha")
public static function imGuiColorEditFlagsNoAlpha(): Int;
/**
 * ColorButton: disable border (which is enforced by default).
 */
@:native("ImGui_ColorEditFlags_NoBorder")
public static function imGuiColorEditFlagsNoBorder(): Int;
/**
 * ColorEdit: disable drag and drop target. ColorButton: disable drag and drop
 * source.
 */
@:native("ImGui_ColorEditFlags_NoDragDrop")
public static function imGuiColorEditFlagsNoDragDrop(): Int;
/**
 * ColorEdit, ColorPicker: disable inputs sliders/text widgets
   (e.g. to show
 * only the small preview color square).
 */
@:native("ImGui_ColorEditFlags_NoInputs")
public static function imGuiColorEditFlagsNoInputs(): Int;
/**
 * ColorEdit, ColorPicker: disable display of inline text label
   (the label is
 * still forwarded to the tooltip and picker).
 */
@:native("ImGui_ColorEditFlags_NoLabel")
public static function imGuiColorEditFlagsNoLabel(): Int;
/**
 * ColorEdit: disable toggling options menu when right-clicking on inputs/small
 * preview.
 */
@:native("ImGui_ColorEditFlags_NoOptions")
public static function imGuiColorEditFlagsNoOptions(): Int;
/**
 * ColorEdit: disable picker when clicking on color square.
 */
@:native("ImGui_ColorEditFlags_NoPicker")
public static function imGuiColorEditFlagsNoPicker(): Int;
/**
 * ColorPicker: disable bigger color preview on right side of the picker,
   use
 * small color square preview instead.
 */
@:native("ImGui_ColorEditFlags_NoSidePreview")
public static function imGuiColorEditFlagsNoSidePreview(): Int;
/**
 * ColorEdit, ColorPicker: disable color square preview next to the inputs.
  
 * (e.g. to show only the inputs).
 */
@:native("ImGui_ColorEditFlags_NoSmallPreview")
public static function imGuiColorEditFlagsNoSmallPreview(): Int;
/**
 * ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the
 * preview.
 */
@:native("ImGui_ColorEditFlags_NoTooltip")
public static function imGuiColorEditFlagsNoTooltip(): Int;
/** No description available */
@:native("ImGui_ColorEditFlags_None")
public static function imGuiColorEditFlagsNone(): Int;
/**
 * ColorPicker: bar for Hue, rectangle for Sat/Value.
 */
@:native("ImGui_ColorEditFlags_PickerHueBar")
public static function imGuiColorEditFlagsPickerHueBar(): Int;
/**
 * ColorPicker: wheel for Hue, triangle for Sat/Value.
 */
@:native("ImGui_ColorEditFlags_PickerHueWheel")
public static function imGuiColorEditFlagsPickerHueWheel(): Int;
/**
 * ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255.
 */
@:native("ImGui_ColorEditFlags_Uint8")
public static function imGuiColorEditFlagsUint8(): Int;
/**
 * Color is in 0xXXRRGGBB. XX is ignored and will not be modified.
 */
@:native("ImGui_ColorPicker3")
public static function imGuiColorPicker3(ctX: ImGuiContext, label: String, colRgb: Int, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_ColorPicker4")
public static function imGuiColorPicker4(ctX: ImGuiContext, label: String, colRgba: Int, ?flagsIn: Int, ?refColIn: Int): Bool;
/**
 * Helper over BeginCombo/EndCombo for convenience purpose. Each item must
 * be
null-terminated (requires REAPER v6.44 or newer for EEL and Lua).
 */
@:native("ImGui_Combo")
public static function imGuiCombo(ctX: ImGuiContext, label: String, currentItem: Int, items: String, ?popupMaXHeigHtInItemsIn: Int): Bool;
/**
 * Max ~20 items visible.
 */
@:native("ImGui_ComboFlags_HeightLarge")
public static function imGuiComboFlagsHeightLarge(): Int;
/**
 * As many fitting items as possible.
 */
@:native("ImGui_ComboFlags_HeightLargest")
public static function imGuiComboFlagsHeightLargest(): Int;
/**
 * Max ~8 items visible (default).
 */
@:native("ImGui_ComboFlags_HeightRegular")
public static function imGuiComboFlagsHeightRegular(): Int;
/**
 * Max ~4 items visible. Tip: If you want your combo popup to be a specific
 * size
you can use SetNextWindowSizeConstraints prior to calling BeginCombo.
 */
@:native("ImGui_ComboFlags_HeightSmall")
public static function imGuiComboFlagsHeightSmall(): Int;
/**
 * Display on the preview box without the square arrow button.
 */
@:native("ImGui_ComboFlags_NoArrowButton")
public static function imGuiComboFlagsNoArrowButton(): Int;
/**
 * Display only a square arrow button.
 */
@:native("ImGui_ComboFlags_NoPreview")
public static function imGuiComboFlagsNoPreview(): Int;
/** No description available */
@:native("ImGui_ComboFlags_None")
public static function imGuiComboFlagsNone(): Int;
/**
 * Align the popup toward the left by default.
 */
@:native("ImGui_ComboFlags_PopupAlignLeft")
public static function imGuiComboFlagsPopupAlignLeft(): Int;
/**
 * Width dynamically calculated from preview contents.
 */
@:native("ImGui_ComboFlags_WidthFitPreview")
public static function imGuiComboFlagsWidthFitPreview(): Int;
/**
 * No condition (always set the variable).
 */
@:native("ImGui_Cond_Always")
public static function imGuiCondAlways(): Int;
/**
 * Set the variable if the object/window is appearing after being
  
 * hidden/inactive (or the first time).
 */
@:native("ImGui_Cond_Appearing")
public static function imGuiCondAppearing(): Int;
/**
 * Set the variable if the object/window has no persistently saved data
   (no
 * entry in .ini file).
 */
@:native("ImGui_Cond_FirstUseEver")
public static function imGuiCondFirstUseEver(): Int;
/**
 * Set the variable once per runtime session (only the first call will succeed).
 */
@:native("ImGui_Cond_Once")
public static function imGuiCondOnce(): Int;
/**
 * Enable docking functionality.
 */
@:native("ImGui_ConfigFlags_DockingEnable")
public static function imGuiConfigFlagsDockingEnable(): Int;
/**
 * Master keyboard navigation enable flag.
   Enable full Tabbing + directional
 * arrows + space/enter to activate.
 */
@:native("ImGui_ConfigFlags_NavEnableKeyboard")
public static function imGuiConfigFlagsNavEnableKeyboard(): Int;
/**
 * Instruct dear imgui to disable keyboard inputs and interactions.
This is done
 * by ignoring keyboard events and clearing existing states.
 */
@:native("ImGui_ConfigFlags_NoKeyboard")
public static function imGuiConfigFlagsNoKeyboard(): Int;
/**
 * Instruct dear imgui to disable mouse inputs and interactions
 */
@:native("ImGui_ConfigFlags_NoMouse")
public static function imGuiConfigFlagsNoMouse(): Int;
/**
 * Instruct backend to not alter mouse cursor shape and visibility.
 */
@:native("ImGui_ConfigFlags_NoMouseCursorChange")
public static function imGuiConfigFlagsNoMouseCursorChange(): Int;
/**
 * Disable state restoration and persistence for the whole context.
 */
@:native("ImGui_ConfigFlags_NoSavedSettings")
public static function imGuiConfigFlagsNoSavedSettings(): Int;
/** No description available */
@:native("ImGui_ConfigFlags_None")
public static function imGuiConfigFlagsNone(): Int;
/**
 * Some calls to Begin()/BeginChild() will return false.
Will cycle through
 * window depths then repeat. Suggested use:
 * add
"SetConfigVar(ConfigVar_DebugBeginReturnValueLoop(), GetKeyMods() ==
 * Mod_Shift"
in your main loop then occasionally press SHIFT.
Windows should be
 * flickering while running.
 */
@:native("ImGui_ConfigVar_DebugBeginReturnValueLoop")
public static function imGuiConfigVarDebugBeginReturnValueLoop(): Int;
/**
 * First-time calls to Begin()/BeginChild() will return false.
**Needs to be set
 * at context startup time** if you don't want to miss windows.
 */
@:native("ImGui_ConfigVar_DebugBeginReturnValueOnce")
public static function imGuiConfigVarDebugBeginReturnValueOnce(): Int;
/**
 * Highlight and show an error message popup when multiple items have
 * conflicting
   identifiers.
   - Code should use PushID/PopID in loops, or
 * append "##xx" to same-label identifiers.
   - Empty label e.g. Button("") ==
 * same ID as parent widget/node. Use Button("##xx") instead!
 */
@:native("ImGui_ConfigVar_DebugHighlightIdConflicts")
public static function imGuiConfigVarDebugHighlightIdConflicts(): Int;
/**
 * Simplified docking mode: disable window splitting, so docking is limited to
 
 * merging multiple windows together into tab-bars.
 */
@:native("ImGui_ConfigVar_DockingNoSplit")
public static function imGuiConfigVarDockingNoSplit(): Int;
/**
 * Make window or viewport transparent when docking and only display docking
  
 * boxes on the target viewport.
 */
@:native("ImGui_ConfigVar_DockingTransparentPayload")
public static function imGuiConfigVarDockingTransparentPayload(): Int;
/**
 * Enable docking with holding Shift key
   (reduce visual noise, allows
 * dropping in wider space
 */
@:native("ImGui_ConfigVar_DockingWithShift")
public static function imGuiConfigVarDockingWithShift(): Int;
/**
 * Enable turning Drag* widgets into text input with a simple mouse
  
 * click-release (without moving). Not desirable on devices without a keyboard.
 */
@:native("ImGui_ConfigVar_DragClickToInputText")
public static function imGuiConfigVarDragClickToInputText(): Int;
/**
 * ConfigFlags_*
 */
@:native("ImGui_ConfigVar_Flags")
public static function imGuiConfigVarFlags(): Int;
/**
 * Delay for IsItemHovered(HoveredFlags_DelayNormal).
   Usually used along with
 * ConfigVar_HoverStationaryDelay.
 */
@:native("ImGui_ConfigVar_HoverDelayNormal")
public static function imGuiConfigVarHoverDelayNormal(): Int;
/**
 * Delay for IsItemHovered(HoveredFlags_DelayShort).
   Usually used along with
 * ConfigVar_HoverStationaryDelay.
 */
@:native("ImGui_ConfigVar_HoverDelayShort")
public static function imGuiConfigVarHoverDelayShort(): Int;
/**
 * Default flags when using IsItemHovered(HoveredFlags_ForTooltip) or
  
 * BeginItemTooltip()/SetItemTooltip() while using mouse.
 */
@:native("ImGui_ConfigVar_HoverFlagsForTooltipMouse")
public static function imGuiConfigVarHoverFlagsForTooltipMouse(): Int;
/**
 * Default flags when using IsItemHovered(HoveredFlags_ForTooltip) or
  
 * BeginItemTooltip()/SetItemTooltip() while using keyboard/gamepad.
 */
@:native("ImGui_ConfigVar_HoverFlagsForTooltipNav")
public static function imGuiConfigVarHoverFlagsForTooltipNav(): Int;
/**
 * Delay for IsItemHovered(HoveredFlags_Stationary).
   Time required to
 * consider mouse stationary.
 */
@:native("ImGui_ConfigVar_HoverStationaryDelay")
public static function imGuiConfigVarHoverStationaryDelay(): Int;
/**
 * Enable blinking cursor (optional as some users consider it to be
 * distracting).
 */
@:native("ImGui_ConfigVar_InputTextCursorBlink")
public static function imGuiConfigVarInputTextCursorBlink(): Int;
/**
 * Pressing Enter will keep item active and select contents (single-line only).
 */
@:native("ImGui_ConfigVar_InputTextEnterKeepActive")
public static function imGuiConfigVarInputTextEnterKeepActive(): Int;
/**
 * Enable input queue trickling: some types of events submitted during the same

 * frame (e.g. button down + up) will be spread over multiple frames, improving

 * interactions with low framerates.
   Warning: when this option is disabled
 * mouse clicks and key presses faster
   than a frame will be lost.
   This
 * affects accessiblity features and some input devices.
 */
@:native("ImGui_ConfigVar_InputTrickleEventQueue")
public static function imGuiConfigVarInputTrickleEventQueue(): Int;
/**
 * When holding a key/button, time before it starts repeating, in seconds
  
 * (for buttons in Repeat mode, etc.).
 */
@:native("ImGui_ConfigVar_KeyRepeatDelay")
public static function imGuiConfigVarKeyRepeatDelay(): Int;
/**
 * When holding a key/button, rate at which it repeats, in seconds.
 */
@:native("ImGui_ConfigVar_KeyRepeatRate")
public static function imGuiConfigVarKeyRepeatRate(): Int;
/**
 * Enabled by default on macOS. Swap Cmd<>Ctrl keys, OS X style text editing
  
 * cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead

 * of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End,
  
 * Double click selects by word instead of selecting whole text,
 * Multi-selection
   in lists uses Cmd/Super instead of Ctrl.
 */
@:native("ImGui_ConfigVar_MacOSXBehaviors")
public static function imGuiConfigVarMacOsxBehaviors(): Int;
/**
 * Distance threshold to stay in to validate a double-click, in pixels.
 */
@:native("ImGui_ConfigVar_MouseDoubleClickMaxDist")
public static function imGuiConfigVarMouseDoubleClickMaxDist(): Int;
/**
 * Time for a double-click, in seconds.
 */
@:native("ImGui_ConfigVar_MouseDoubleClickTime")
public static function imGuiConfigVarMouseDoubleClickTime(): Int;
/**
 * Distance threshold before considering we are dragging.
 */
@:native("ImGui_ConfigVar_MouseDragThreshold")
public static function imGuiConfigVarMouseDragThreshold(): Int;
/**
 * Instruct navigation to not capture global keyboard input
   (see
 * SetNextFrameWantCaptureKeyboard).
 */
@:native("ImGui_ConfigVar_NavCaptureKeyboard")
public static function imGuiConfigVarNavCaptureKeyboard(): Int;
/**
 * Navigation cursor is always visible.
 */
@:native("ImGui_ConfigVar_NavCursorVisibleAlways")
public static function imGuiConfigVarNavCursorVisibleAlways(): Int;
/**
 * Using directional navigation key makes the cursor visible.
   Mouse click
 * hides the cursor.
 */
@:native("ImGui_ConfigVar_NavCursorVisibleAuto")
public static function imGuiConfigVarNavCursorVisibleAuto(): Int;
/**
 * Pressing Escape can clear focused item + navigation id/highlight.
   Set to
 * false if you want to always keep highlight on.
 */
@:native("ImGui_ConfigVar_NavEscapeClearFocusItem")
public static function imGuiConfigVarNavEscapeClearFocusItem(): Int;
/**
 * Pressing Escape can clear focused window as well
   (superset of
 * ConfigVar_NavEscapeClearFocusItem).
 */
@:native("ImGui_ConfigVar_NavEscapeClearFocusWindow")
public static function imGuiConfigVarNavEscapeClearFocusWindow(): Int;
/**
 * Directional/tabbing navigation teleports the mouse cursor.
 */
@:native("ImGui_ConfigVar_NavMoveSetMousePos")
public static function imGuiConfigVarNavMoveSetMousePos(): Int;
/**
 * Enable scrolling page by page when clicking outside the scrollbar grab.
  
 * When disabled, always scroll to clicked location.
   When enabled,
 * Shift+Click scrolls to clicked location.
 */
@:native("ImGui_ConfigVar_ScrollbarScrollByPage")
public static function imGuiConfigVarScrollbarScrollByPage(): Int;
/**
 * Disable default OS window decoration. Enabling decoration can create
  
 * subsequent issues at OS levels (e.g. minimum window size).
 */
@:native("ImGui_ConfigVar_ViewportsNoDecoration")
public static function imGuiConfigVarViewportsNoDecoration(): Int;
/**
 * Enable allowing to move windows only when clicking on their title bar.
  
 * Does not apply to windows without a title bar.
 */
@:native("ImGui_ConfigVar_WindowsMoveFromTitleBarOnly")
public static function imGuiConfigVarWindowsMoveFromTitleBarOnly(): Int;
/**
 * Enable resizing of windows from their edges and from the lower-left corner.
 */
@:native("ImGui_ConfigVar_WindowsResizeFromEdges")
public static function imGuiConfigVarWindowsResizeFromEdges(): Int;
/**
 * Create a new ReaImGui context.
The context will remain valid as long as it is
 * used in each defer cycle.
The label is used for the tab text when windows are
 * docked in REAPER
and also as a unique identifier for storing settings.
 */
@:native("ImGui_CreateContext")
public static function imGuiCreateContext(label: String, ?configFlagsIn: Int): ImGuiContext;
/** No description available */
@:native("ImGui_CreateDrawListSplitter")
public static function imGuiCreateDrawListSplitter(draWList: ImGuiDrawList): ImGuiDrawListSplitter;
/**
 * Load a font matching a font family name.
The family name can be an installed
 * font or one of the generic fonts:
sans-serif, serif, monospace, cursive,
 * fantasy.
See CreateFontFromFile.
 */
@:native("ImGui_CreateFont")
public static function imGuiCreateFont(familY: String, ?flagsIn: Int): ImGuiFont;
/**
 * Load a font from a file. Available characters are limited to those
contained
 * in the file.
Bits 0-15 of 'index' are the the index of the face in the font
 * file (starting
from 0). Set to 0 if the font file contains only one font
 * face.
Bits 16-30 (for TrueType GX and OpenType Font Variations only) specify
 * the
named instance index for the current face index (starting from 1).
0
 * ignores named instances.
The font styles in 'flags' are simulated by the
 * rasterizer.
See also CreateFontFromMem.
 */
@:native("ImGui_CreateFontFromFile")
public static function imGuiCreateFontFromFile(file: String, ?indeXIn: Int, ?flagsIn: Int): ImGuiFont;
/**
 * Requires REAPER v6.44 or newer for EEL and Lua. Use CreateFont or
explicitely
 * specify data_sz to support older versions.
See CreateFontFromFile for the
 * meaning of 'index' and 'flags'.
 */
@:native("ImGui_CreateFontFromMem")
public static function imGuiCreateFontFromMem(data: String, ?indeXIn: Int, ?flagsIn: Int): ImGuiFont;
/**
 * Compile an EEL program.
Standard EEL
 * [math](https://www.reaper.fm/sdk/js/basiccode.php#js_basicfunc)
and
 * [string](https://www.reaper.fm/sdk/js/strings.php#js_string_funcs)
functions
 * are available in addition to callback-specific functions
(see
 * InputTextCallback_*).
 */
@:native("ImGui_CreateFunctionFromEEL")
public static function imGuiCreateFunctionFromEel(code: String): ImGuiFunction;
/**
 * The returned object is valid as long as it is used in each defer cycle
unless
 * attached to a context (see Attach).
('flags' currently unused and reserved
 * for future expansion)
 */
@:native("ImGui_CreateImage")
public static function imGuiCreateImage(file: String, ?flagsIn: Int): ImGuiImage;
/**
 * Copies pixel data from a LICE bitmap created using JS_LICE_CreateBitmap.
 */
@:native("ImGui_CreateImageFromLICE")
public static function imGuiCreateImageFromLice(bitmap: LiceIBitmap, ?flagsIn: Int): ImGuiImage;
/**
 * Requires REAPER v6.44 or newer for EEL and Lua. Load from a file
 * using
CreateImage or explicitely specify data_sz to support older versions.
 */
@:native("ImGui_CreateImageFromMem")
public static function imGuiCreateImageFromMem(data: String, ?flagsIn: Int): ImGuiImage;
/**
 * Create a blank image of the specified dimensions. See Image_SetPixels_Array.
 */
@:native("ImGui_CreateImageFromSize")
public static function imGuiCreateImageFromSize(wIdtH: Int, heigHt: Int, ?flagsIn: Int): ImGuiImage;
/** No description available */
@:native("ImGui_CreateImageSet")
public static function imGuiCreateImageSet(): ImGuiImageSet;
/**
 * The returned clipper object is only valid for the given context and is
 * valid
as long as it is used in each defer cycle unless attached (see Attach).
 */
@:native("ImGui_CreateListClipper")
public static function imGuiCreateListClipper(ctX: ImGuiContext): ImGuiListClipper;
/**
 * Valid while used every frame unless attached to a context (see Attach).
 */
@:native("ImGui_CreateTextFilter")
public static function imGuiCreateTextFilter(?defaultFilterIn: String): ImGuiTextFilter;
/** No description available */
@:native("ImGui_DebugFlashStyleColor")
public static function imGuiDebugFlashStyleColor(ctX: ImGuiContext, idX: Int): Void;
/**
 * Add a line to the debug log window. See ShowDebugLogWindow.
 */
@:native("ImGui_DebugLog")
public static function imGuiDebugLog(ctX: ImGuiContext, teXt: String): Void;
/** No description available */
@:native("ImGui_DebugStartItemPicker")
public static function imGuiDebugStartItemPicker(ctX: ImGuiContext): Void;
/**
 * Helper tool to diagnose between text encoding issues and font loading
 * issues.
Pass your UTF-8 string and verify that there are correct.
 */
@:native("ImGui_DebugTextEncoding")
public static function imGuiDebugTextEncoding(ctX: ImGuiContext, teXt: String): Void;
/**
 * Unlink the object's lifetime. Unattached objects are automatically
 * destroyed
when left unused. You may check whether an object has been
 * destroyed using
ValidatePtr.
 */
@:native("ImGui_Detach")
public static function imGuiDetach(ctX: ImGuiContext, obj: ImGuiResource): Void;
/** No description available */
@:native("ImGui_Dir_Down")
public static function imGuiDirDown(): Int;
/** No description available */
@:native("ImGui_Dir_Left")
public static function imGuiDirLeft(): Int;
/** No description available */
@:native("ImGui_Dir_None")
public static function imGuiDirNone(): Int;
/** No description available */
@:native("ImGui_Dir_Right")
public static function imGuiDirRight(): Int;
/** No description available */
@:native("ImGui_Dir_Up")
public static function imGuiDirUp(): Int;
/** No description available */
@:native("ImGui_DragDouble")
public static function imGuiDragDouble(ctX: ImGuiContext, label: String, v: Float, ?vSpeedIn: Float, ?vMinIn: Float, ?vMaXIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragDouble2")
public static function imGuiDragDouble2(ctX: ImGuiContext, label: String, v1: Float, v2: Float, ?vSpeedIn: Float, ?vMinIn: Float, ?vMaXIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragDouble3")
public static function imGuiDragDouble3(ctX: ImGuiContext, label: String, v1: Float, v2: Float, v3: Float, ?vSpeedIn: Float, ?vMinIn: Float, ?vMaXIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragDouble4")
public static function imGuiDragDouble4(ctX: ImGuiContext, label: String, v1: Float, v2: Float, v3: Float, v4: Float, ?vSpeedIn: Float, ?vMinIn: Float, ?vMaXIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragDoubleN")
public static function imGuiDragDoubleN(ctX: ImGuiContext, label: String, values: ReaperArray, ?speedIn: Float, ?minIn: Float, ?maXIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/**
 * AcceptDragDropPayload will returns true even before the mouse button is
  
 * released. You can then check GetDragDropPayload/is_delivery to test if the
  
 * payload needs to be delivered.
 */
@:native("ImGui_DragDropFlags_AcceptBeforeDelivery")
public static function imGuiDragDropFlagsAcceptBeforeDelivery(): Int;
/**
 * Do not draw the default highlight rectangle when hovering over target.
 */
@:native("ImGui_DragDropFlags_AcceptNoDrawDefaultRect")
public static function imGuiDragDropFlagsAcceptNoDrawDefaultRect(): Int;
/**
 * Request hiding the BeginDragDropSource tooltip from the BeginDragDropTarget
 * site.
 */
@:native("ImGui_DragDropFlags_AcceptNoPreviewTooltip")
public static function imGuiDragDropFlagsAcceptNoPreviewTooltip(): Int;
/**
 * For peeking ahead and inspecting the payload before delivery.
   Equivalent
 * to DragDropFlags_AcceptBeforeDelivery |
  
 * DragDropFlags_AcceptNoDrawDefaultRect.
 */
@:native("ImGui_DragDropFlags_AcceptPeekOnly")
public static function imGuiDragDropFlagsAcceptPeekOnly(): Int;
/** No description available */
@:native("ImGui_DragDropFlags_None")
public static function imGuiDragDropFlagsNone(): Int;
/**
 * Automatically expire the payload if the source cease to be submitted
  
 * (otherwise payloads are persisting while being dragged).
 */
@:native("ImGui_DragDropFlags_PayloadAutoExpire")
public static function imGuiDragDropFlagsPayloadAutoExpire(): Int;
/**
 * Allow items such as Text, Image that have no unique identifier to be used as

 * drag source, by manufacturing a temporary identifier based on their
  
 * window-relative position. This is extremely unusual within the dear imgui
  
 * ecosystem and so we made it explicit.
 */
@:native("ImGui_DragDropFlags_SourceAllowNullID")
public static function imGuiDragDropFlagsSourceAllowNullId(): Int;
/**
 * External source (from outside of dear imgui), won't attempt to read current
 
 * item/window info. Will always return true.
   Only one Extern source can be
 * active simultaneously.
 */
@:native("ImGui_DragDropFlags_SourceExtern")
public static function imGuiDragDropFlagsSourceExtern(): Int;
/**
 * By default, when dragging we clear data so that IsItemHovered will return
  
 * false, to avoid subsequent user code submitting tooltips. This flag disables

 * this behavior so you can still call IsItemHovered on the source item.
 */
@:native("ImGui_DragDropFlags_SourceNoDisableHover")
public static function imGuiDragDropFlagsSourceNoDisableHover(): Int;
/**
 * Disable the behavior that allows to open tree nodes and collapsing header by

 * holding over them while dragging a source item.
 */
@:native("ImGui_DragDropFlags_SourceNoHoldToOpenOthers")
public static function imGuiDragDropFlagsSourceNoHoldToOpenOthers(): Int;
/**
 * By default, a successful call to BeginDragDropSource opens a tooltip so you
 
 * can display a preview or description of the source contents.
   This flag
 * disables this behavior.
 */
@:native("ImGui_DragDropFlags_SourceNoPreviewTooltip")
public static function imGuiDragDropFlagsSourceNoPreviewTooltip(): Int;
/** No description available */
@:native("ImGui_DragFloatRange2")
public static function imGuiDragFloatRange2(ctX: ImGuiContext, label: String, vCurrentMin: Float, vCurrentMaX: Float, ?vSpeedIn: Float, ?vMinIn: Float, ?vMaXIn: Float, ?formatIn: String, ?formatMaXIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragInt")
public static function imGuiDragInt(ctX: ImGuiContext, label: String, v: Int, ?vSpeedIn: Float, ?vMinIn: Int, ?vMaXIn: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragInt2")
public static function imGuiDragInt2(ctX: ImGuiContext, label: String, v1: Int, v2: Int, ?vSpeedIn: Float, ?vMinIn: Int, ?vMaXIn: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragInt3")
public static function imGuiDragInt3(ctX: ImGuiContext, label: String, v1: Int, v2: Int, v3: Int, ?vSpeedIn: Float, ?vMinIn: Int, ?vMaXIn: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragInt4")
public static function imGuiDragInt4(ctX: ImGuiContext, label: String, v1: Int, v2: Int, v3: Int, v4: Int, ?vSpeedIn: Float, ?vMinIn: Int, ?vMaXIn: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_DragIntRange2")
public static function imGuiDragIntRange2(ctX: ImGuiContext, label: String, vCurrentMin: Int, vCurrentMaX: Int, ?vSpeedIn: Float, ?vMinIn: Int, ?vMaXIn: Int, ?formatIn: String, ?formatMaXIn: String, ?flagsIn: Int): Bool;
/**
 * DrawList_PathStroke, DrawList_AddPolyline: specify that shape should be
  
 * closed (Important: this is always == 1 for legacy reason).
 */
@:native("ImGui_DrawFlags_Closed")
public static function imGuiDrawFlagsClosed(): Int;
/** No description available */
@:native("ImGui_DrawFlags_None")
public static function imGuiDrawFlagsNone(): Int;
/** No description available */
@:native("ImGui_DrawFlags_RoundCornersAll")
public static function imGuiDrawFlagsRoundCornersAll(): Int;
/** No description available */
@:native("ImGui_DrawFlags_RoundCornersBottom")
public static function imGuiDrawFlagsRoundCornersBottom(): Int;
/**
 * DrawList_AddRect, DrawList_AddRectFilled, DrawList_PathRect: enable rounding

 * bottom-left corner only (when rounding > 0.0, we default to all corners).
 */
@:native("ImGui_DrawFlags_RoundCornersBottomLeft")
public static function imGuiDrawFlagsRoundCornersBottomLeft(): Int;
/**
 * DrawList_AddRect, DrawList_AddRectFilled, DrawList_PathRect: enable rounding

 * bottom-right corner only (when rounding > 0.0, we default to all corners).
 */
@:native("ImGui_DrawFlags_RoundCornersBottomRight")
public static function imGuiDrawFlagsRoundCornersBottomRight(): Int;
/** No description available */
@:native("ImGui_DrawFlags_RoundCornersLeft")
public static function imGuiDrawFlagsRoundCornersLeft(): Int;
/**
 * DrawList_AddRect, DrawList_AddRectFilled, DrawList_PathRect: disable
 * rounding
   on all corners (when rounding > 0.0). This is NOT zero, NOT an
 * implicit flag!.
 */
@:native("ImGui_DrawFlags_RoundCornersNone")
public static function imGuiDrawFlagsRoundCornersNone(): Int;
/** No description available */
@:native("ImGui_DrawFlags_RoundCornersRight")
public static function imGuiDrawFlagsRoundCornersRight(): Int;
/** No description available */
@:native("ImGui_DrawFlags_RoundCornersTop")
public static function imGuiDrawFlagsRoundCornersTop(): Int;
/**
 * DrawList_AddRect, DrawList_AddRectFilled, DrawList_PathRect: enable rounding

 * top-left corner only (when rounding > 0.0, we default to all corners).
 */
@:native("ImGui_DrawFlags_RoundCornersTopLeft")
public static function imGuiDrawFlagsRoundCornersTopLeft(): Int;
/**
 * DrawList_AddRect, DrawList_AddRectFilled, DrawList_PathRect: enable rounding

 * top-right corner only (when rounding > 0.0, we default to all corners).
 */
@:native("ImGui_DrawFlags_RoundCornersTopRight")
public static function imGuiDrawFlagsRoundCornersTopRight(): Int;
/** No description available */
@:native("ImGui_DrawListSplitter_Clear")
public static function imGuiDrawListSplitterClear(splitter: ImGuiDrawListSplitter): Void;
/** No description available */
@:native("ImGui_DrawListSplitter_Merge")
public static function imGuiDrawListSplitterMerge(splitter: ImGuiDrawListSplitter): Void;
/** No description available */
@:native("ImGui_DrawListSplitter_SetCurrentChannel")
public static function imGuiDrawListSplitterSetCurrentChannel(splitter: ImGuiDrawListSplitter, cHannelIdX: Int): Void;
/** No description available */
@:native("ImGui_DrawListSplitter_Split")
public static function imGuiDrawListSplitterSplit(splitter: ImGuiDrawListSplitter, count: Int): Void;
/**
 * Cubic Bezier (4 control points)
 */
@:native("ImGui_DrawList_AddBezierCubic")
public static function imGuiDrawListAddBezierCubic(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, colRgba: Int, tHickness: Float, ?numSegmentsIn: Int): Void;
/**
 * Quadratic Bezier (3 control points)
 */
@:native("ImGui_DrawList_AddBezierQuadratic")
public static function imGuiDrawListAddBezierQuadratic(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, colRgba: Int, tHickness: Float, ?numSegmentsIn: Int): Void;
/**
 * Use "num_segments == 0" to automatically calculate tessellation (preferred).
 */
@:native("ImGui_DrawList_AddCircle")
public static function imGuiDrawListAddCircle(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radius: Float, colRgba: Int, ?numSegmentsIn: Int, ?tHicknessIn: Float): Void;
/**
 * Use "num_segments == 0" to automatically calculate tessellation (preferred).
 */
@:native("ImGui_DrawList_AddCircleFilled")
public static function imGuiDrawListAddCircleFilled(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radius: Float, colRgba: Int, ?numSegmentsIn: Int): Void;
/**
 * Concave polygon fill is more expensive than convex one: it has O(N^2)
 * complexity.
 */
@:native("ImGui_DrawList_AddConcavePolyFilled")
public static function imGuiDrawListAddConcavePolyFilled(draWList: ImGuiDrawList, points: ReaperArray, colRgba: Int): Void;
/**
 * Note: Anti-aliased filling requires points to be in clockwise order.
 */
@:native("ImGui_DrawList_AddConvexPolyFilled")
public static function imGuiDrawListAddConvexPolyFilled(draWList: ImGuiDrawList, points: ReaperArray, colRgba: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddEllipse")
public static function imGuiDrawListAddEllipse(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radiusX: Float, radiusY: Float, colRgba: Int, ?rotIn: Float, ?numSegmentsIn: Int, ?tHicknessIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddEllipseFilled")
public static function imGuiDrawListAddEllipseFilled(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radiusX: Float, radiusY: Float, colRgba: Int, ?rotIn: Float, ?numSegmentsIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddImage")
public static function imGuiDrawListAddImage(draWList: ImGuiDrawList, image: ImGuiImage, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, ?uvMinXIn: Float, ?uvMinYIn: Float, ?uvMaXXIn: Float, ?uvMaXYIn: Float, ?colRgbaIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddImageQuad")
public static function imGuiDrawListAddImageQuad(draWList: ImGuiDrawList, image: ImGuiImage, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, ?uv1XIn: Float, ?uv1YIn: Float, ?uv2XIn: Float, ?uv2YIn: Float, ?uv3XIn: Float, ?uv3YIn: Float, ?uv4XIn: Float, ?uv4YIn: Float, ?colRgbaIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddImageRounded")
public static function imGuiDrawListAddImageRounded(draWList: ImGuiDrawList, image: ImGuiImage, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, uvMinX: Float, uvMinY: Float, uvMaXX: Float, uvMaXY: Float, colRgba: Int, rounding: Float, ?flagsIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddLine")
public static function imGuiDrawListAddLine(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, colRgba: Int, ?tHicknessIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddNgon")
public static function imGuiDrawListAddNgon(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radius: Float, colRgba: Int, numSegments: Int, ?tHicknessIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddNgonFilled")
public static function imGuiDrawListAddNgonFilled(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radius: Float, colRgba: Int, numSegments: Int): Void;
/**
 * Points is a list of x,y coordinates.
 */
@:native("ImGui_DrawList_AddPolyline")
public static function imGuiDrawListAddPolyline(draWList: ImGuiDrawList, points: ReaperArray, colRgba: Int, flags: Int, tHickness: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddQuad")
public static function imGuiDrawListAddQuad(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, colRgba: Int, ?tHicknessIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddQuadFilled")
public static function imGuiDrawListAddQuadFilled(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, colRgba: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddRect")
public static function imGuiDrawListAddRect(draWList: ImGuiDrawList, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, colRgba: Int, ?roundingIn: Float, ?flagsIn: Int, ?tHicknessIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddRectFilled")
public static function imGuiDrawListAddRectFilled(draWList: ImGuiDrawList, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, colRgba: Int, ?roundingIn: Float, ?flagsIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddRectFilledMultiColor")
public static function imGuiDrawListAddRectFilledMultiColor(draWList: ImGuiDrawList, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, colUprLeft: Int, colUprRigHt: Int, colBotRigHt: Int, colBotLeft: Int): Void;
/** No description available */
@:native("ImGui_DrawList_AddText")
public static function imGuiDrawListAddText(draWList: ImGuiDrawList, x: Float, y: Float, colRgba: Int, teXt: String): Void;
/**
 * The last pushed font is used if font is nil.
The size of the last pushed font
 * is used if font_size is 0.
cpu_fine_clip_rect_* only takes effect if all four
 * are non-nil.
 */
@:native("ImGui_DrawList_AddTextEx")
public static function imGuiDrawListAddTextEx(draWList: ImGuiDrawList, font: ImGuiFont, fontSize: Float, posX: Float, posY: Float, colRgba: Int, teXt: String, ?wrapWIdtHIn: Float, ?cpuFineClipRectMinXIn: Float, ?cpuFineClipRectMinYIn: Float, ?cpuFineClipRectMaXXIn: Float, ?cpuFineClipRectMaXYIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddTriangle")
public static function imGuiDrawListAddTriangle(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, colRgba: Int, ?tHicknessIn: Float): Void;
/** No description available */
@:native("ImGui_DrawList_AddTriangleFilled")
public static function imGuiDrawListAddTriangleFilled(draWList: ImGuiDrawList, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, colRgba: Int): Void;
/** No description available */
@:native("ImGui_DrawList_PathArcTo")
public static function imGuiDrawListPathArcTo(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radius: Float, aMin: Float, aMaX: Float, ?numSegmentsIn: Int): Void;
/**
 * Use precomputed angles for a 12 steps circle.
 */
@:native("ImGui_DrawList_PathArcToFast")
public static function imGuiDrawListPathArcToFast(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radius: Float, aMinOf12: Int, aMaXOf12: Int): Void;
/**
 * Cubic Bezier (4 control points)
 */
@:native("ImGui_DrawList_PathBezierCubicCurveTo")
public static function imGuiDrawListPathBezierCubicCurveTo(draWList: ImGuiDrawList, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, ?numSegmentsIn: Int): Void;
/**
 * Quadratic Bezier (3 control points)
 */
@:native("ImGui_DrawList_PathBezierQuadraticCurveTo")
public static function imGuiDrawListPathBezierQuadraticCurveTo(draWList: ImGuiDrawList, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, ?numSegmentsIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_PathClear")
public static function imGuiDrawListPathClear(draWList: ImGuiDrawList): Void;
/**
 * Ellipse
 */
@:native("ImGui_DrawList_PathEllipticalArcTo")
public static function imGuiDrawListPathEllipticalArcTo(draWList: ImGuiDrawList, centerX: Float, centerY: Float, radiusX: Float, radiusY: Float, rot: Float, aMin: Float, aMaX: Float, ?numSegmentsIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_PathFillConcave")
public static function imGuiDrawListPathFillConcave(draWList: ImGuiDrawList, colRgba: Int): Void;
/** No description available */
@:native("ImGui_DrawList_PathFillConvex")
public static function imGuiDrawListPathFillConvex(draWList: ImGuiDrawList, colRgba: Int): Void;
/** No description available */
@:native("ImGui_DrawList_PathLineTo")
public static function imGuiDrawListPathLineTo(draWList: ImGuiDrawList, posX: Float, posY: Float): Void;
/** No description available */
@:native("ImGui_DrawList_PathRect")
public static function imGuiDrawListPathRect(draWList: ImGuiDrawList, rectMinX: Float, rectMinY: Float, rectMaXX: Float, rectMaXY: Float, ?roundingIn: Float, ?flagsIn: Int): Void;
/** No description available */
@:native("ImGui_DrawList_PathStroke")
public static function imGuiDrawListPathStroke(draWList: ImGuiDrawList, colRgba: Int, ?flagsIn: Int, ?tHicknessIn: Float): Void;
/**
 * See DrawList_PushClipRect
 */
@:native("ImGui_DrawList_PopClipRect")
public static function imGuiDrawListPopClipRect(draWList: ImGuiDrawList): Void;
/**
 * Render-level scissoring. Prefer using higher-level PushClipRect to
 * affect
logic (hit-testing and widget culling).
 */
@:native("ImGui_DrawList_PushClipRect")
public static function imGuiDrawListPushClipRect(draWList: ImGuiDrawList, clipRectMinX: Float, clipRectMinY: Float, clipRectMaXX: Float, clipRectMaXY: Float, ?intersectWitHCurrentClipRectIn: Bool): Void;
/** No description available */
@:native("ImGui_DrawList_PushClipRectFullScreen")
public static function imGuiDrawListPushClipRectFullScreen(draWList: ImGuiDrawList): Void;
/**
 * Add a dummy item of given size. unlike InvisibleButton, Dummy() won't take
 * the
mouse click or be navigable into.
 */
@:native("ImGui_Dummy")
public static function imGuiDummy(ctX: ImGuiContext, sizeW: Float, sizeH: Float): Void;
/**
 * Pop window from the stack. See Begin.
 */
@:native("ImGui_End")
public static function imGuiEnd(ctX: ImGuiContext): Void;
/**
 * See BeginChild.
 */
@:native("ImGui_EndChild")
public static function imGuiEndChild(ctX: ImGuiContext): Void;
/**
 * Only call EndCombo() if BeginCombo returns true!
 */
@:native("ImGui_EndCombo")
public static function imGuiEndCombo(ctX: ImGuiContext): Void;
/**
 * See BeginDisabled.
 */
@:native("ImGui_EndDisabled")
public static function imGuiEndDisabled(ctX: ImGuiContext): Void;
/**
 * Only call EndDragDropSource() if BeginDragDropSource returns true!
 */
@:native("ImGui_EndDragDropSource")
public static function imGuiEndDragDropSource(ctX: ImGuiContext): Void;
/**
 * Only call EndDragDropTarget() if BeginDragDropTarget returns true!
 */
@:native("ImGui_EndDragDropTarget")
public static function imGuiEndDragDropTarget(ctX: ImGuiContext): Void;
/**
 * Unlock horizontal starting position + capture the whole group bounding
 * box
into one "item" (so you can use IsItemHovered or layout primitives such
 * as
SameLine on whole group, etc.).
See BeginGroup.
 */
@:native("ImGui_EndGroup")
public static function imGuiEndGroup(ctX: ImGuiContext): Void;
/**
 * Only call EndListBox() if BeginListBox returned true!
 */
@:native("ImGui_EndListBox")
public static function imGuiEndListBox(ctX: ImGuiContext): Void;
/**
 * Only call EndMenu() if BeginMenu returns true!
 */
@:native("ImGui_EndMenu")
public static function imGuiEndMenu(ctX: ImGuiContext): Void;
/**
 * Only call EndMenuBar if BeginMenuBar returns true!
 */
@:native("ImGui_EndMenuBar")
public static function imGuiEndMenuBar(ctX: ImGuiContext): Void;
/**
 * Only call EndPopup() if BeginPopup*() returns true!
 */
@:native("ImGui_EndPopup")
public static function imGuiEndPopup(ctX: ImGuiContext): Void;
/**
 * Only call EndTabBar() if BeginTabBar() returns true!
 */
@:native("ImGui_EndTabBar")
public static function imGuiEndTabBar(ctX: ImGuiContext): Void;
/**
 * Only call EndTabItem() if BeginTabItem() returns true!
 */
@:native("ImGui_EndTabItem")
public static function imGuiEndTabItem(ctX: ImGuiContext): Void;
/**
 * Only call EndTable() if BeginTable() returns true!
 */
@:native("ImGui_EndTable")
public static function imGuiEndTable(ctX: ImGuiContext): Void;
/**
 * Only call EndTooltip() if BeginTooltip()/BeginItemTooltip() returns true.
 */
@:native("ImGui_EndTooltip")
public static function imGuiEndTooltip(ctX: ImGuiContext): Void;
/**
 * Return true if any window is focused.
 */
@:native("ImGui_FocusedFlags_AnyWindow")
public static function imGuiFocusedFlagsAnyWindow(): Int;
/**
 * Return true if any children of the window is focused.
 */
@:native("ImGui_FocusedFlags_ChildWindows")
public static function imGuiFocusedFlagsChildWindows(): Int;
/**
 * Consider docking hierarchy (treat dockspace host as parent of docked window)

 * (when used with _ChildWindows or _RootWindow).
 */
@:native("ImGui_FocusedFlags_DockHierarchy")
public static function imGuiFocusedFlagsDockHierarchy(): Int;
/**
 * Do not consider popup hierarchy (do not treat popup emitter as parent of
  
 * popup) (when used with _ChildWindows or _RootWindow).
 */
@:native("ImGui_FocusedFlags_NoPopupHierarchy")
public static function imGuiFocusedFlagsNoPopupHierarchy(): Int;
/** No description available */
@:native("ImGui_FocusedFlags_None")
public static function imGuiFocusedFlagsNone(): Int;
/**
 * FocusedFlags_RootWindow | FocusedFlags_ChildWindows
 */
@:native("ImGui_FocusedFlags_RootAndChildWindows")
public static function imGuiFocusedFlagsRootAndChildWindows(): Int;
/**
 * Test from root window (top most parent of the current hierarchy).
 */
@:native("ImGui_FocusedFlags_RootWindow")
public static function imGuiFocusedFlagsRootWindow(): Int;
/** No description available */
@:native("ImGui_FontFlags_Bold")
public static function imGuiFontFlagsBold(): Int;
/** No description available */
@:native("ImGui_FontFlags_Italic")
public static function imGuiFontFlagsItalic(): Int;
/** No description available */
@:native("ImGui_FontFlags_None")
public static function imGuiFontFlagsNone(): Int;
/** No description available */
@:native("ImGui_Function_Execute")
public static function imGuiFunctionExecute(func: ImGuiFunction): Void;
/** No description available */
@:native("ImGui_Function_GetValue")
public static function imGuiFunctionGetValue(func: ImGuiFunction, name: String): Float;
/**
 * Copy the values in the function's memory starting at the address stored
in
 * the given variable into the array.
 */
@:native("ImGui_Function_GetValue_Array")
public static function imGuiFunctionGetValueArray(func: ImGuiFunction, name: String, values: ReaperArray): Void;
/**
 * Read from a string slot or a named string (when name starts with a `#`).
 */
@:native("ImGui_Function_GetValue_String")
public static function imGuiFunctionGetValueString(func: ImGuiFunction, name: String): String;
/** No description available */
@:native("ImGui_Function_SetValue")
public static function imGuiFunctionSetValue(func: ImGuiFunction, name: String, value: Float): Void;
/**
 * Copy the values in the array to the function's memory at the address
 * stored
in the given variable.
 */
@:native("ImGui_Function_SetValue_Array")
public static function imGuiFunctionSetValueArray(func: ImGuiFunction, name: String, values: ReaperArray): Void;
/**
 * Write to a string slot or a named string (when name starts with a `#`).
 */
@:native("ImGui_Function_SetValue_String")
public static function imGuiFunctionSetValueString(func: ImGuiFunction, name: String, value: String): Void;
/**
 * This draw list will be the first rendering one. Useful to quickly
 * draw
shapes/text behind dear imgui contents.
 */
@:native("ImGui_GetBackgroundDrawList")
public static function imGuiGetBackgroundDrawList(ctX: ImGuiContext): ImGuiDrawList;
/**
 * Returns the path to the directory containing imgui.lua, imgui.py and
 * gfx2imgui.lua.
 */
@:native("ImGui_GetBuiltinPath")
public static function imGuiGetBuiltinPath(): String;
/** No description available */
@:native("ImGui_GetClipboardText")
public static function imGuiGetClipboardText(ctX: ImGuiContext): String;
/**
 * Retrieve given style color with style alpha applied and optional extra
 * alpha
multiplier, packed as a 32-bit value (RGBA). See Col_* for available
 * style colors.
 */
@:native("ImGui_GetColor")
public static function imGuiGetColor(ctX: ImGuiContext, idX: Int, ?alpHaMulIn: Float): Int;
/**
 * Retrieve given color with style alpha applied, packed as a 32-bit value
 * (RGBA).
 */
@:native("ImGui_GetColorEx")
public static function imGuiGetColorEx(ctX: ImGuiContext, colRgba: Int, ?alpHaMulIn: Float): Int;
/** No description available */
@:native("ImGui_GetConfigVar")
public static function imGuiGetConfigVar(ctX: ImGuiContext, varIdX: Int): Float;
/**
 * Available space from current position. This is your best friend.
 */
@:native("ImGui_GetContentRegionAvail")
public static function imGuiGetContentRegionAvail(ctX: ImGuiContext): Float;
/**
 * Cursor position in window-local coordinates.
 */
@:native("ImGui_GetCursorPos")
public static function imGuiGetCursorPos(ctX: ImGuiContext): Float;
/**
 * Cursor X position in window-local coordinates.
 */
@:native("ImGui_GetCursorPosX")
public static function imGuiGetCursorPosX(ctX: ImGuiContext): Float;
/**
 * Cursor Y position in window-local coordinates.
 */
@:native("ImGui_GetCursorPosY")
public static function imGuiGetCursorPosY(ctX: ImGuiContext): Float;
/**
 * Cursor position in absolute screen coordinates.
Prefer using this rather than
 * GetCursorPos (it's also more useful to work with
the DrawList API).
 */
@:native("ImGui_GetCursorScreenPos")
public static function imGuiGetCursorScreenPos(ctX: ImGuiContext): Float;
/**
 * Initial cursor position in window coordinates.
Call GetCursorScreenPos after
 * Begin to get the absolute coordinates version.
 */
@:native("ImGui_GetCursorStartPos")
public static function imGuiGetCursorStartPos(ctX: ImGuiContext): Float;
/**
 * Time elapsed since last frame, in seconds.
 */
@:native("ImGui_GetDeltaTime")
public static function imGuiGetDeltaTime(ctX: ImGuiContext): Float;
/**
 * Peek directly into the current payload from anywhere.
Returns false when drag
 * and drop is finished or inactive.
 */
@:native("ImGui_GetDragDropPayload")
public static function imGuiGetDragDropPayload(ctX: ImGuiContext): Bool;
/**
 * Get a filename from the list of dropped files.
Returns false if index is out
 * of bounds.
 */
@:native("ImGui_GetDragDropPayloadFile")
public static function imGuiGetDragDropPayloadFile(ctX: ImGuiContext, indeX: Int): Bool;
/**
 * Get the current font
 */
@:native("ImGui_GetFont")
public static function imGuiGetFont(ctX: ImGuiContext): ImGuiFont;
/**
 * Get current font size (= height in pixels) of current font with current
 * scale
applied.
 */
@:native("ImGui_GetFontSize")
public static function imGuiGetFontSize(ctX: ImGuiContext): Float;
/**
 * This draw list will be the last rendered one. Useful to quickly
 * draw
shapes/text over dear imgui contents.
 */
@:native("ImGui_GetForegroundDrawList")
public static function imGuiGetForegroundDrawList(ctX: ImGuiContext): ImGuiDrawList;
/**
 * Get global imgui frame count. incremented by 1 every frame.
 */
@:native("ImGui_GetFrameCount")
public static function imGuiGetFrameCount(ctX: ImGuiContext): Int;
/**
 * GetFontSize + StyleVar_FramePadding.y * 2
 */
@:native("ImGui_GetFrameHeight")
public static function imGuiGetFrameHeight(ctX: ImGuiContext): Float;
/**
 * GetFontSize + StyleVar_FramePadding.y * 2 + StyleVar_ItemSpacing.y
(distance
 * in pixels between 2 consecutive lines of framed widgets).
 */
@:native("ImGui_GetFrameHeightWithSpacing")
public static function imGuiGetFrameHeightWithSpacing(ctX: ImGuiContext): Float;
/**
 * Estimate of application framerate (rolling average over 60 frames, based
 * on
GetDeltaTime), in frame per second. Solely for convenience.
 */
@:native("ImGui_GetFramerate")
public static function imGuiGetFramerate(ctX: ImGuiContext): Float;
/**
 * Read from ImGui's character input queue.
Call with increasing idx until false
 * is returned.
 */
@:native("ImGui_GetInputQueueCharacter")
public static function imGuiGetInputQueueCharacter(ctX: ImGuiContext, idX: Int): Bool;
/**
 * Get lower-right bounding rectangle of the last item (screen space)
 */
@:native("ImGui_GetItemRectMax")
public static function imGuiGetItemRectMax(ctX: ImGuiContext): Float;
/**
 * Get upper-left bounding rectangle of the last item (screen space)
 */
@:native("ImGui_GetItemRectMin")
public static function imGuiGetItemRectMin(ctX: ImGuiContext): Float;
/**
 * Get size of last item
 */
@:native("ImGui_GetItemRectSize")
public static function imGuiGetItemRectSize(ctX: ImGuiContext): Float;
/**
 * Duration the keyboard key has been down (0.0 == just pressed)
 */
@:native("ImGui_GetKeyDownDuration")
public static function imGuiGetKeyDownDuration(ctX: ImGuiContext, keY: Int): Float;
/**
 * Flags for the Ctrl/Shift/Alt/Super keys. Uses Mod_* values.
 */
@:native("ImGui_GetKeyMods")
public static function imGuiGetKeyMods(ctX: ImGuiContext): Int;
/**
 * Uses provided repeat rate/delay. Return a count, most often 0 or 1 but
 * might
be >1 if ConfigVar_RepeatRate is small enough that GetDeltaTime >
 * RepeatRate.
 */
@:native("ImGui_GetKeyPressedAmount")
public static function imGuiGetKeyPressedAmount(ctX: ImGuiContext, keY: Int, repeatDelaY: Float, rate: Float): Int;
/**
 * Currently represents REAPER's main window (arrange view).
WARNING: This may
 * change or be removed in the future.
 */
@:native("ImGui_GetMainViewport")
public static function imGuiGetMainViewport(ctX: ImGuiContext): ImGuiViewport;
/**
 * Return the number of successive mouse-clicks at the time where a click happen
 * (otherwise 0).
 */
@:native("ImGui_GetMouseClickedCount")
public static function imGuiGetMouseClickedCount(ctX: ImGuiContext, button: Int): Int;
/** No description available */
@:native("ImGui_GetMouseClickedPos")
public static function imGuiGetMouseClickedPos(ctX: ImGuiContext, button: Int): Float;
/**
 * Get desired mouse cursor shape, reset every frame. This is updated during the
 * frame.
 */
@:native("ImGui_GetMouseCursor")
public static function imGuiGetMouseCursor(ctX: ImGuiContext): Int;
/**
 * Mouse delta. Note that this is zero if either current or previous
 * position
are invalid (-FLT_MAX,-FLT_MAX), so a disappearing/reappearing mouse
 * won't have
a huge delta.
 */
@:native("ImGui_GetMouseDelta")
public static function imGuiGetMouseDelta(ctX: ImGuiContext): Float;
/**
 * Duration the mouse button has been down (0.0 == just clicked)
 */
@:native("ImGui_GetMouseDownDuration")
public static function imGuiGetMouseDownDuration(ctX: ImGuiContext, button: Int): Float;
/**
 * Return the delta from the initial clicking position while the mouse button
 * is
pressed or was just released. This is locked and return 0.0 until the
 * mouse
moves past a distance threshold at least once (uses
 * ConfigVar_MouseDragThreshold
if lock_threshold < 0.0).
 */
@:native("ImGui_GetMouseDragDelta")
public static function imGuiGetMouseDragDelta(ctX: ImGuiContext, x: Float, y: Float, ?buttonIn: Int, ?lockTHresHoldIn: Float): Float;
/** No description available */
@:native("ImGui_GetMousePos")
public static function imGuiGetMousePos(ctX: ImGuiContext): Float;
/**
 * Retrieve mouse position at the time of opening popup we have
 * BeginPopup()
into (helper to avoid user backing that value themselves).
 */
@:native("ImGui_GetMousePosOnOpeningCurrentPopup")
public static function imGuiGetMousePosOnOpeningCurrentPopup(ctX: ImGuiContext): Float;
/**
 * Vertical: 1 unit scrolls about 5 lines text. >0 scrolls Up, <0 scrolls
 * Down.
Hold SHIFT to turn vertical scroll into horizontal scroll
Horizontal:
 * >0 scrolls Left, <0 scrolls Right.
Most users don't have a mouse with a
 * horizontal wheel.
 */
@:native("ImGui_GetMouseWheel")
public static function imGuiGetMouseWheel(ctX: ImGuiContext): Float;
/**
 * Get maximum scrolling amount ~~ ContentSize.x - WindowSize.x -
 * DecorationsSize.x
 */
@:native("ImGui_GetScrollMaxX")
public static function imGuiGetScrollMaxX(ctX: ImGuiContext): Float;
/**
 * Get maximum scrolling amount ~~ ContentSize.y - WindowSize.y -
 * DecorationsSize.y
 */
@:native("ImGui_GetScrollMaxY")
public static function imGuiGetScrollMaxY(ctX: ImGuiContext): Float;
/**
 * Get scrolling amount [0 .. GetScrollMaxX()]
 */
@:native("ImGui_GetScrollX")
public static function imGuiGetScrollX(ctX: ImGuiContext): Float;
/**
 * Get scrolling amount [0 .. GetScrollMaxY()]
 */
@:native("ImGui_GetScrollY")
public static function imGuiGetScrollY(ctX: ImGuiContext): Float;
/**
 * Retrieve style color as stored in ImGuiStyle structure.
Use to feed back into
 * PushStyleColor, Otherwise use GetColor to get style color
with style alpha
 * baked in. See Col_* for available style colors.
 */
@:native("ImGui_GetStyleColor")
public static function imGuiGetStyleColor(ctX: ImGuiContext, idX: Int): Int;
/** No description available */
@:native("ImGui_GetStyleVar")
public static function imGuiGetStyleVar(ctX: ImGuiContext, varIdX: Int): Float;
/**
 * Same as GetFontSize
 */
@:native("ImGui_GetTextLineHeight")
public static function imGuiGetTextLineHeight(ctX: ImGuiContext): Float;
/**
 * GetFontSize + StyleVar_ItemSpacing.y
(distance in pixels between 2
 * consecutive lines of text).
 */
@:native("ImGui_GetTextLineHeightWithSpacing")
public static function imGuiGetTextLineHeightWithSpacing(ctX: ImGuiContext): Float;
/**
 * Get global imgui time. Incremented every frame.
 */
@:native("ImGui_GetTime")
public static function imGuiGetTime(ctX: ImGuiContext): Float;
/**
 * Horizontal distance preceding label when using TreeNode*() or Bullet()
==
 * (GetFontSize + StyleVar_FramePadding.x*2) for a regular unframed TreeNode.
 */
@:native("ImGui_GetTreeNodeToLabelSpacing")
public static function imGuiGetTreeNodeToLabelSpacing(ctX: ImGuiContext): Float;
/** No description available */
@:native("ImGui_GetVersion")
public static function imGuiGetVersion(): String;
/** No description available */
@:native("ImGui_GetWindowDockID")
public static function imGuiGetWindowDockId(ctX: ImGuiContext): Int;
/**
 * Get DPI scale currently associated to the current window's viewport
(1.0 = 96
 * DPI).
 */
@:native("ImGui_GetWindowDpiScale")
public static function imGuiGetWindowDpiScale(ctX: ImGuiContext): Float;
/**
 * The draw list associated to the current window, to append your own drawing
 * primitives
 */
@:native("ImGui_GetWindowDrawList")
public static function imGuiGetWindowDrawList(ctX: ImGuiContext): ImGuiDrawList;
/**
 * Get current window height (shortcut for (GetWindowSize().h).
It is unlikely
 * you ever need to use this!
 */
@:native("ImGui_GetWindowHeight")
public static function imGuiGetWindowHeight(ctX: ImGuiContext): Float;
/**
 * Get current window position in screen space.
It is unlikely you ever need to
 * use this!
Consider always using GetCursorScreenPos and GetContentRegionAvail
 * instead.
 */
@:native("ImGui_GetWindowPos")
public static function imGuiGetWindowPos(ctX: ImGuiContext): Float;
/**
 * Get current window size.
It is unlikely you ever need to use this!
Consider
 * always using GetCursorScreenPos and GetContentRegionAvail instead.
 */
@:native("ImGui_GetWindowSize")
public static function imGuiGetWindowSize(ctX: ImGuiContext): Float;
/**
 * Get viewport currently associated to the current window.
 */
@:native("ImGui_GetWindowViewport")
public static function imGuiGetWindowViewport(ctX: ImGuiContext): ImGuiViewport;
/**
 * Get current window width (shortcut for (GetWindowSize().w).
It is unlikely
 * you ever need to use this!
 */
@:native("ImGui_GetWindowWidth")
public static function imGuiGetWindowWidth(ctX: ImGuiContext): Float;
/**
 * Return true even if an active item is blocking access to this item/window.
  
 * Useful for Drag and Drop patterns.
 */
@:native("ImGui_HoveredFlags_AllowWhenBlockedByActiveItem")
public static function imGuiHoveredFlagsAllowWhenBlockedByActiveItem(): Int;
/**
 * Return true even if a popup window is normally blocking access to this
 * item/window.
 */
@:native("ImGui_HoveredFlags_AllowWhenBlockedByPopup")
public static function imGuiHoveredFlagsAllowWhenBlockedByPopup(): Int;
/**
 * Return true even if the item is disabled.
 */
@:native("ImGui_HoveredFlags_AllowWhenDisabled")
public static function imGuiHoveredFlagsAllowWhenDisabled(): Int;
/**
 * HoveredFlags_AllowWhenOverlappedByItem |
 * HoveredFlags_AllowWhenOverlappedByWindow
 */
@:native("ImGui_HoveredFlags_AllowWhenOverlapped")
public static function imGuiHoveredFlagsAllowWhenOverlapped(): Int;
/**
 * Return true even if the item uses AllowOverlap mode and is overlapped by
  
 * another hoverable item.
 */
@:native("ImGui_HoveredFlags_AllowWhenOverlappedByItem")
public static function imGuiHoveredFlagsAllowWhenOverlappedByItem(): Int;
/**
 * Return true even if the position is obstructed or overlapped by another
 * window.
 */
@:native("ImGui_HoveredFlags_AllowWhenOverlappedByWindow")
public static function imGuiHoveredFlagsAllowWhenOverlappedByWindow(): Int;
/**
 * Return true if any window is hovered.
 */
@:native("ImGui_HoveredFlags_AnyWindow")
public static function imGuiHoveredFlagsAnyWindow(): Int;
/**
 * Return true if any children of the window is hovered.
 */
@:native("ImGui_HoveredFlags_ChildWindows")
public static function imGuiHoveredFlagsChildWindows(): Int;
/**
 * Return true immediately (default). As this is the default you generally
 * ignore this.
 */
@:native("ImGui_HoveredFlags_DelayNone")
public static function imGuiHoveredFlagsDelayNone(): Int;
/**
 * Return true after ConfigVar_HoverDelayNormal elapsed (~0.40 sec)
   (shared
 * between items) + requires mouse to be stationary for
  
 * ConfigVar_HoverStationaryDelay (once per item).
 */
@:native("ImGui_HoveredFlags_DelayNormal")
public static function imGuiHoveredFlagsDelayNormal(): Int;
/**
 * Return true after ConfigVar_HoverDelayShort elapsed (~0.15 sec)
   (shared
 * between items) + requires mouse to be stationary for
  
 * ConfigVar_HoverStationaryDelay (once per item).
 */
@:native("ImGui_HoveredFlags_DelayShort")
public static function imGuiHoveredFlagsDelayShort(): Int;
/**
 * Consider docking hierarchy (treat dockspace host as
  parent of docked
 * window) (when used with _ChildWindows or _RootWindow).
 */
@:native("ImGui_HoveredFlags_DockHierarchy")
public static function imGuiHoveredFlagsDockHierarchy(): Int;
/**
 * Typically used with IsItemHovered() before SetTooltip().
   This is a
 * shortcut to pull flags from ConfigVar_HoverFlagsForTooltip* where
   you can
 * reconfigure the desired behavior.
   For frequently actioned or hovered items
 * providing a tooltip, you want may to use
   this (defaults to stationary +
 * delay) so the tooltip doesn't show too often.
   For items which main purpose
 * is to be hovered, or items with low affordance,
   or in less consistent
 * apps, prefer no delay or shorter delay.
 */
@:native("ImGui_HoveredFlags_ForTooltip")
public static function imGuiHoveredFlagsForTooltip(): Int;
/**
 * Disable using keyboard/gamepad navigation state when active, always query
 * mouse.
 */
@:native("ImGui_HoveredFlags_NoNavOverride")
public static function imGuiHoveredFlagsNoNavOverride(): Int;
/**
 * Do not consider popup hierarchy (do not treat popup
  emitter as parent of
 * popup) (when used with _ChildWindows or _RootWindow).
 */
@:native("ImGui_HoveredFlags_NoPopupHierarchy")
public static function imGuiHoveredFlagsNoPopupHierarchy(): Int;
/**
 * Disable shared delay system where moving from one item to the next keeps
  
 * the previous timer for a short time (standard for tooltips with long delays
 */
@:native("ImGui_HoveredFlags_NoSharedDelay")
public static function imGuiHoveredFlagsNoSharedDelay(): Int;
/**
 * Return true if directly over the item/window, not obstructed by another
  
 * window, not obstructed by an active popup or modal blocking inputs under
 * them.
 */
@:native("ImGui_HoveredFlags_None")
public static function imGuiHoveredFlagsNone(): Int;
/**
 * HoveredFlags_AllowWhenBlockedByPopup |
  
 * HoveredFlags_AllowWhenBlockedByActiveItem | HoveredFlags_AllowWhenOverlapped
 */
@:native("ImGui_HoveredFlags_RectOnly")
public static function imGuiHoveredFlagsRectOnly(): Int;
/**
 * HoveredFlags_RootWindow | HoveredFlags_ChildWindows
 */
@:native("ImGui_HoveredFlags_RootAndChildWindows")
public static function imGuiHoveredFlagsRootAndChildWindows(): Int;
/**
 * Test from root window (top most parent of the current hierarchy).
 */
@:native("ImGui_HoveredFlags_RootWindow")
public static function imGuiHoveredFlagsRootWindow(): Int;
/**
 * Require mouse to be stationary for ConfigVar_HoverStationaryDelay (~0.15
 * sec)
   _at least one time_. After this, can move on same item/window.
  
 * Using the stationary test tends to reduces the need for a long delay.
 */
@:native("ImGui_HoveredFlags_Stationary")
public static function imGuiHoveredFlagsStationary(): Int;
/**
 * Adds StyleVar_ImageBorderSize on each side.
 */
@:native("ImGui_Image")
public static function imGuiImage(ctX: ImGuiContext, image: ImGuiImage, imageSizeW: Float, imageSizeH: Float, ?uv0XIn: Float, ?uv0YIn: Float, ?uv1XIn: Float, ?uv1YIn: Float): Void;
/**
 * Draws a background based on regular Button color + optionally an
 * inner
background if specified. Adds StyleVar_FramePadding to provided size.
 */
@:native("ImGui_ImageButton")
public static function imGuiImageButton(ctX: ImGuiContext, strId: String, image: ImGuiImage, imageSizeW: Float, imageSizeH: Float, ?uv0XIn: Float, ?uv0YIn: Float, ?uv1XIn: Float, ?uv1YIn: Float, ?bgColRgbaIn: Int, ?tintColRgbaIn: Int): Bool;
/**
 * Return nil instead of returning an error.
 */
@:native("ImGui_ImageFlags_NoErrors")
public static function imGuiImageFlagsNoErrors(): Int;
/** No description available */
@:native("ImGui_ImageFlags_None")
public static function imGuiImageFlagsNone(): Int;
/**
 * 'img' cannot be another ImageSet.
 */
@:native("ImGui_ImageSet_Add")
public static function imGuiImageSetAdd(set: ImGuiImageSet, scale: Float, image: ImGuiImage): Void;
/**
 * Draws a background based on regular Button color + optionally an
 * inner
background if specified. Adds StyleVar_FramePadding to provided size.
 */
@:native("ImGui_ImageWithBg")
public static function imGuiImageWithBg(ctX: ImGuiContext, image: ImGuiImage, imageSizeW: Float, imageSizeH: Float, ?uv0XIn: Float, ?uv0YIn: Float, ?uv1XIn: Float, ?uv1YIn: Float, ?bgColRgbaIn: Int, ?tintColRgbaIn: Int): Void;
/**
 * Read the pixel data of the given rectangle. Pixel format is 0xRRGGBBAAp+0.
 */
@:native("ImGui_Image_GetPixels_Array")
public static function imGuiImageGetPixelsArray(image: ImGuiBitmap, x: Int, y: Int, w: Int, h: Int, piXels: ReaperArray, ?offSetIn: Int, ?pitcHIn: Int): Void;
/** No description available */
@:native("ImGui_Image_GetSize")
public static function imGuiImageGetSize(image: ImGuiImage): Float;
/**
 * Write the pixel data of the given rectangle. Pixel format is 0xRRGGBBAAp+0.
 */
@:native("ImGui_Image_SetPixels_Array")
public static function imGuiImageSetPixelsArray(image: ImGuiBitmap, x: Int, y: Int, w: Int, h: Int, piXels: ReaperArray, ?offSetIn: Int, ?pitcHIn: Int): Void;
/**
 * Move content position toward the right, by 'indent_w',
 * or
StyleVar_IndentSpacing if 'indent_w' <= 0. See Unindent.
 */
@:native("ImGui_Indent")
public static function imGuiIndent(ctX: ImGuiContext, ?indentWIn: Float): Void;
/** No description available */
@:native("ImGui_InputDouble")
public static function imGuiInputDouble(ctX: ImGuiContext, label: String, v: Float, ?stepIn: Float, ?stepFastIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputDouble2")
public static function imGuiInputDouble2(ctX: ImGuiContext, label: String, v1: Float, v2: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputDouble3")
public static function imGuiInputDouble3(ctX: ImGuiContext, label: String, v1: Float, v2: Float, v3: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputDouble4")
public static function imGuiInputDouble4(ctX: ImGuiContext, label: String, v1: Float, v2: Float, v3: Float, v4: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputDoubleN")
public static function imGuiInputDoubleN(ctX: ImGuiContext, label: String, values: ReaperArray, ?stepIn: Float, ?stepFastIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputFlags_None")
public static function imGuiInputFlagsNone(): Int;
/**
 * Enable repeat. Return true on successive repeats.
 */
@:native("ImGui_InputFlags_Repeat")
public static function imGuiInputFlagsRepeat(): Int;
/**
 * Route to active item only.
 */
@:native("ImGui_InputFlags_RouteActive")
public static function imGuiInputFlagsRouteActive(): Int;
/**
 * Do not register route, poll keys directly.
 */
@:native("ImGui_InputFlags_RouteAlways")
public static function imGuiInputFlagsRouteAlways(): Int;
/**
 * Route to windows in the focus stack. Deep-most focused window takes inputs.
 
 * Active item takes inputs over deep-most focused window.
 */
@:native("ImGui_InputFlags_RouteFocused")
public static function imGuiInputFlagsRouteFocused(): Int;
/**
 * Option: route evaluated from the point of view of root window rather than
 * current window.
 */
@:native("ImGui_InputFlags_RouteFromRootWindow")
public static function imGuiInputFlagsRouteFromRootWindow(): Int;
/**
 * Global route (unless a focused window or active item registered the route).
 */
@:native("ImGui_InputFlags_RouteGlobal")
public static function imGuiInputFlagsRouteGlobal(): Int;
/**
 * Global route: higher priority than active item. Unlikely you need to
   use
 * that: will interfere with every active items, e.g. Ctrl+A registered by
  
 * InputText will be overridden by this. May not be fully honored as
 * user/internal
   code is likely to always assume they can access keys when
 * active.
 */
@:native("ImGui_InputFlags_RouteOverActive")
public static function imGuiInputFlagsRouteOverActive(): Int;
/**
 * Global route: higher priority than focused route
   (unless active item in
 * focused route).
 */
@:native("ImGui_InputFlags_RouteOverFocused")
public static function imGuiInputFlagsRouteOverFocused(): Int;
/**
 * Option: global route: will not be applied if underlying background/void is
  
 * focused (== no Dear ImGui windows are focused). Useful for overlay
 * applications.
 */
@:native("ImGui_InputFlags_RouteUnlessBgFocused")
public static function imGuiInputFlagsRouteUnlessBgFocused(): Int;
/**
 * Automatically display a tooltip when hovering item
 */
@:native("ImGui_InputFlags_Tooltip")
public static function imGuiInputFlagsTooltip(): Int;
/** No description available */
@:native("ImGui_InputInt")
public static function imGuiInputInt(ctX: ImGuiContext, label: String, v: Int, ?stepIn: Int, ?stepFastIn: Int, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputInt2")
public static function imGuiInputInt2(ctX: ImGuiContext, label: String, v1: Int, v2: Int, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputInt3")
public static function imGuiInputInt3(ctX: ImGuiContext, label: String, v1: Int, v2: Int, v3: Int, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputInt4")
public static function imGuiInputInt4(ctX: ImGuiContext, label: String, v1: Int, v2: Int, v3: Int, v4: Int, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_InputText")
public static function imGuiInputText(ctX: ImGuiContext, label: String, buf: String, ?flagsIn: Int, callbackIn: ImGuiFunction): Bool;
/**
 * Pressing TAB input a '\t' character into the text field.
 */
@:native("ImGui_InputTextFlags_AllowTabInput")
public static function imGuiInputTextFlagsAllowTabInput(): Int;
/**
 * Overwrite mode.
 */
@:native("ImGui_InputTextFlags_AlwaysOverwrite")
public static function imGuiInputTextFlagsAlwaysOverwrite(): Int;
/**
 * Select entire text when first taking mouse focus.
 */
@:native("ImGui_InputTextFlags_AutoSelectAll")
public static function imGuiInputTextFlagsAutoSelectAll(): Int;
/**
 * Callback on each iteration. User code may query cursor position, modify text
 * buffer.
 */
@:native("ImGui_InputTextFlags_CallbackAlways")
public static function imGuiInputTextFlagsCallbackAlways(): Int;
/**
 * Callback on character inputs to replace or discard them.
   Modify
 * 'EventChar' to replace or 'EventChar = 0' to discard.
 */
@:native("ImGui_InputTextFlags_CallbackCharFilter")
public static function imGuiInputTextFlagsCallbackCharFilter(): Int;
/**
 * Callback on pressing TAB (for completion handling).
 */
@:native("ImGui_InputTextFlags_CallbackCompletion")
public static function imGuiInputTextFlagsCallbackCompletion(): Int;
/**
 * Callback on any edit. Note that InputText already returns true on edit +
  
 * you can always use IsItemEdited. The callback is useful to manipulate the
  
 * underlying buffer while focus is active.
 */
@:native("ImGui_InputTextFlags_CallbackEdit")
public static function imGuiInputTextFlagsCallbackEdit(): Int;
/**
 * Callback on pressing Up/Down arrows (for history handling).
 */
@:native("ImGui_InputTextFlags_CallbackHistory")
public static function imGuiInputTextFlagsCallbackHistory(): Int;
/**
 * Allow 0123456789.+-*/.
 */
@:native("ImGui_InputTextFlags_CharsDecimal")
public static function imGuiInputTextFlagsCharsDecimal(): Int;
/**
 * Allow 0123456789ABCDEFabcdef.
 */
@:native("ImGui_InputTextFlags_CharsHexadecimal")
public static function imGuiInputTextFlagsCharsHexadecimal(): Int;
/**
 * Filter out spaces, tabs.
 */
@:native("ImGui_InputTextFlags_CharsNoBlank")
public static function imGuiInputTextFlagsCharsNoBlank(): Int;
/**
 * Allow 0123456789.+-*/eE (Scientific notation input).
 */
@:native("ImGui_InputTextFlags_CharsScientific")
public static function imGuiInputTextFlagsCharsScientific(): Int;
/**
 * Turn a..z into A..Z.
 */
@:native("ImGui_InputTextFlags_CharsUppercase")
public static function imGuiInputTextFlagsCharsUppercase(): Int;
/**
 * In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter
  
 * (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
 */
@:native("ImGui_InputTextFlags_CtrlEnterForNewLine")
public static function imGuiInputTextFlagsCtrlEnterForNewLine(): Int;
/**
 * InputDouble(), InputInt() etc. only: when value is zero, do not display it.
 
 * Generally used with InputTextFlags_ParseEmptyRefVal.
 */
@:native("ImGui_InputTextFlags_DisplayEmptyRefVal")
public static function imGuiInputTextFlagsDisplayEmptyRefVal(): Int;
/**
 * When text doesn't fit, elide left side to ensure right side stays visible.
  
 * Useful for path/filenames. Single-line only!
 */
@:native("ImGui_InputTextFlags_ElideLeft")
public static function imGuiInputTextFlagsElideLeft(): Int;
/**
 * Return true when Enter is pressed (as opposed to every time the value was
  
 * modified). Consider using IsItemDeactivatedAfterEdit instead!
 */
@:native("ImGui_InputTextFlags_EnterReturnsTrue")
public static function imGuiInputTextFlagsEnterReturnsTrue(): Int;
/**
 * Escape key clears content if not empty, and deactivate otherwise
  
 * (constrast to default behavior of Escape to revert).
 */
@:native("ImGui_InputTextFlags_EscapeClearsAll")
public static function imGuiInputTextFlagsEscapeClearsAll(): Int;
/**
 * Disable following the cursor horizontally.
 */
@:native("ImGui_InputTextFlags_NoHorizontalScroll")
public static function imGuiInputTextFlagsNoHorizontalScroll(): Int;
/**
 * Disable undo/redo. Note that input text owns the text data while active.
 */
@:native("ImGui_InputTextFlags_NoUndoRedo")
public static function imGuiInputTextFlagsNoUndoRedo(): Int;
/** No description available */
@:native("ImGui_InputTextFlags_None")
public static function imGuiInputTextFlagsNone(): Int;
/**
 * InputDouble(), InputInt() etc. only: parse empty string as zero value.
 */
@:native("ImGui_InputTextFlags_ParseEmptyRefVal")
public static function imGuiInputTextFlagsParseEmptyRefVal(): Int;
/**
 * Password mode, display all characters as '*'.
 */
@:native("ImGui_InputTextFlags_Password")
public static function imGuiInputTextFlagsPassword(): Int;
/**
 * Read-only mode.
 */
@:native("ImGui_InputTextFlags_ReadOnly")
public static function imGuiInputTextFlagsReadOnly(): Int;
/** No description available */
@:native("ImGui_InputTextMultiline")
public static function imGuiInputTextMultiline(ctX: ImGuiContext, label: String, buf: String, ?sizeWIn: Float, ?sizeHIn: Float, ?flagsIn: Int, callbackIn: ImGuiFunction): Bool;
/** No description available */
@:native("ImGui_InputTextWithHint")
public static function imGuiInputTextWithHint(ctX: ImGuiContext, label: String, hint: String, buf: String, ?flagsIn: Int, callbackIn: ImGuiFunction): Bool;
/**
 * Flexible button behavior without the visuals, frequently useful to
 * build
custom behaviors using the public api (along with IsItemActive,
 * IsItemHovered, etc.).
 */
@:native("ImGui_InvisibleButton")
public static function imGuiInvisibleButton(ctX: ImGuiContext, strId: String, sizeW: Float, sizeH: Float, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_IsAnyItemActive")
public static function imGuiIsAnyItemActive(ctX: ImGuiContext): Bool;
/** No description available */
@:native("ImGui_IsAnyItemFocused")
public static function imGuiIsAnyItemFocused(ctX: ImGuiContext): Bool;
/** No description available */
@:native("ImGui_IsAnyItemHovered")
public static function imGuiIsAnyItemHovered(ctX: ImGuiContext): Bool;
/**
 * Is any mouse button held?
 */
@:native("ImGui_IsAnyMouseDown")
public static function imGuiIsAnyMouseDown(ctX: ImGuiContext): Bool;
/**
 * Was the last item just made active (item was previously inactive).
 */
@:native("ImGui_IsItemActivated")
public static function imGuiIsItemActivated(ctX: ImGuiContext): Bool;
/**
 * Is the last item active? (e.g. button being held, text field being
 * edited.
This will continuously return true while holding mouse button on an
 * item.
Items that don't interact will always return false.
 */
@:native("ImGui_IsItemActive")
public static function imGuiIsItemActive(ctX: ImGuiContext): Bool;
/**
 * Is the last item clicked? (e.g. button/node just clicked on)
==
 * IsMouseClicked(mouse_button) && IsItemHovered().
This is NOT equivalent to
 * the behavior of e.g. Button.
Most widgets have specific reactions based on
 * mouse-up/down state, mouse position etc.
 */
@:native("ImGui_IsItemClicked")
public static function imGuiIsItemClicked(ctX: ImGuiContext, ?mouseButtonIn: Int): Bool;
/**
 * Was the last item just made inactive (item was previously active).
Useful for
 * Undo/Redo patterns with widgets that require continuous editing.
 */
@:native("ImGui_IsItemDeactivated")
public static function imGuiIsItemDeactivated(ctX: ImGuiContext): Bool;
/**
 * Was the last item just made inactive and made a value change when it
 * was
active? (e.g. Slider/Drag moved).
Useful for Undo/Redo patterns with
 * widgets that require continuous editing. Note
that you may get false
 * positives (some widgets such as Combo/ListBox/Selectable
will return true
 * even when clicking an already selected item).
 */
@:native("ImGui_IsItemDeactivatedAfterEdit")
public static function imGuiIsItemDeactivatedAfterEdit(ctX: ImGuiContext): Bool;
/**
 * Did the last item modify its underlying value this frame? or was
 * pressed?
This is generally the same as the "bool" return value of many
 * widgets.
 */
@:native("ImGui_IsItemEdited")
public static function imGuiIsItemEdited(ctX: ImGuiContext): Bool;
/**
 * Is the last item focused for keyboard/gamepad navigation?
 */
@:native("ImGui_IsItemFocused")
public static function imGuiIsItemFocused(ctX: ImGuiContext): Bool;
/**
 * Is the last item hovered? (and usable, aka not blocked by a popup, etc.).
See
 * HoveredFlags_* for more options.
 */
@:native("ImGui_IsItemHovered")
public static function imGuiIsItemHovered(ctX: ImGuiContext, ?flagsIn: Int): Bool;
/**
 * Was the last item open state toggled? Set by TreeNode.
 */
@:native("ImGui_IsItemToggledOpen")
public static function imGuiIsItemToggledOpen(ctX: ImGuiContext): Bool;
/**
 * Is the last item visible? (items may be out of sight because of
 * clipping/scrolling)
 */
@:native("ImGui_IsItemVisible")
public static function imGuiIsItemVisible(ctX: ImGuiContext): Bool;
/**
 * Was key chord (mods + key) pressed? You can pass e.g. `Mod_Ctrl | Key_S`
as a
 * key chord. This doesn't do any routing or focus check, consider using
 * the
Shortcut function instead.
 */
@:native("ImGui_IsKeyChordPressed")
public static function imGuiIsKeyChordPressed(ctX: ImGuiContext, keYCHord: Int): Bool;
/**
 * Is key being held.
 */
@:native("ImGui_IsKeyDown")
public static function imGuiIsKeyDown(ctX: ImGuiContext, keY: Int): Bool;
/**
 * Was key pressed (went from !Down to Down)?
If repeat=true, uses
 * ConfigVar_KeyRepeatDelay / ConfigVar_KeyRepeatRate.
 */
@:native("ImGui_IsKeyPressed")
public static function imGuiIsKeyPressed(ctX: ImGuiContext, keY: Int, ?repeatIn: Bool): Bool;
/**
 * Was key released (went from Down to !Down)?
 */
@:native("ImGui_IsKeyReleased")
public static function imGuiIsKeyReleased(ctX: ImGuiContext, keY: Int): Bool;
/**
 * Did mouse button clicked? (went from !Down to Down).
Same as
 * GetMouseClickedCount() == 1.
 */
@:native("ImGui_IsMouseClicked")
public static function imGuiIsMouseClicked(ctX: ImGuiContext, button: Int, ?repeatIn: Bool): Bool;
/**
 * Did mouse button double-clicked? Same as GetMouseClickedCount() == 2.
(Note
 * that a double-click will also report IsMouseClicked() == true)
 */
@:native("ImGui_IsMouseDoubleClicked")
public static function imGuiIsMouseDoubleClicked(ctX: ImGuiContext, button: Int): Bool;
/**
 * Is mouse button held?
 */
@:native("ImGui_IsMouseDown")
public static function imGuiIsMouseDown(ctX: ImGuiContext, button: Int): Bool;
/**
 * Is mouse dragging? (uses ConfigVar_MouseDragThreshold if lock_threshold <
 * 0.0)
 */
@:native("ImGui_IsMouseDragging")
public static function imGuiIsMouseDragging(ctX: ImGuiContext, button: Int, ?lockTHresHoldIn: Float): Bool;
/**
 * Is mouse hovering given bounding rect (in screen space).
Clipped by current
 * clipping settings, but disregarding of other consideration
of focus/window
 * ordering/popup-block.
 */
@:native("ImGui_IsMouseHoveringRect")
public static function imGuiIsMouseHoveringRect(ctX: ImGuiContext, rMinX: Float, rMinY: Float, rMaXX: Float, rMaXY: Float, ?clipIn: Bool): Bool;
/** No description available */
@:native("ImGui_IsMousePosValid")
public static function imGuiIsMousePosValid(ctX: ImGuiContext, ?mousePosXIn: Float, ?mousePosYIn: Float): Bool;
/**
 * Did mouse button released? (went from Down to !Down)
 */
@:native("ImGui_IsMouseReleased")
public static function imGuiIsMouseReleased(ctX: ImGuiContext, button: Int): Bool;
/**
 * Delayed mouse release (use sparingly!). Generally used with
`delay >=
 * ConfigVar_MouseDoubleClickTime` + combined with a
`GetMouseClickedCount()==1`
 * test. This is a very rarely used UI idiom,
but some apps use this: e.g. MS
 * Explorer single click on an icon to rename.
 */
@:native("ImGui_IsMouseReleasedWithDelay")
public static function imGuiIsMouseReleasedWithDelay(ctX: ImGuiContext, button: Int, delaY: Float): Bool;
/**
 * Return true if the popup is open at the current BeginPopup level of the
popup
 * stack.
- With PopupFlags_AnyPopupId: return true if any popup is open at the
 * current
  BeginPopup() level of the popup stack.
- With PopupFlags_AnyPopupId
 * + PopupFlags_AnyPopupLevel: return true if any
  popup is open.
 */
@:native("ImGui_IsPopupOpen")
public static function imGuiIsPopupOpen(ctX: ImGuiContext, strId: String, ?flagsIn: Int): Bool;
/**
 * Test if rectangle (of given size, starting from cursor position) is
visible /
 * not clipped.
 */
@:native("ImGui_IsRectVisible")
public static function imGuiIsRectVisible(ctX: ImGuiContext, sizeW: Float, sizeH: Float): Bool;
/**
 * Test if rectangle (in screen space) is visible / not clipped. to
 * perform
coarse clipping on user's side.
 */
@:native("ImGui_IsRectVisibleEx")
public static function imGuiIsRectVisibleEx(ctX: ImGuiContext, rectMinX: Float, rectMinY: Float, rectMaXX: Float, rectMaXY: Float): Bool;
/**
 * Use after Begin/BeginPopup/BeginPopupModal to tell if a window just opened.
 */
@:native("ImGui_IsWindowAppearing")
public static function imGuiIsWindowAppearing(ctX: ImGuiContext): Bool;
/**
 * Is current window docked into another window or a REAPER docker?
 */
@:native("ImGui_IsWindowDocked")
public static function imGuiIsWindowDocked(ctX: ImGuiContext): Bool;
/**
 * Is current window focused? or its root/child, depending on flags.
See flags
 * for options.
 */
@:native("ImGui_IsWindowFocused")
public static function imGuiIsWindowFocused(ctX: ImGuiContext, ?flagsIn: Int): Bool;
/**
 * Is current window hovered and hoverable (e.g. not blocked by a
 * popup/modal)?
See HoveredFlags_* for options.
 */
@:native("ImGui_IsWindowHovered")
public static function imGuiIsWindowHovered(ctX: ImGuiContext, ?flagsIn: Int): Bool;
/**
 * Allow submitting an item with the same identifier as an item already
  
 * submitted this frame without triggering a warning tooltip if
  
 * ConfigVar_ConfigDebugHighlightIdConflicts is set.
 */
@:native("ImGui_ItemFlags_AllowDuplicateId")
public static function imGuiItemFlagsAllowDuplicateId(): Int;
/**
 * MenuItem/Selectable automatically close their parent popup window.
   Default
 * = true
 */
@:native("ImGui_ItemFlags_AutoClosePopups")
public static function imGuiItemFlagsAutoClosePopups(): Int;
/**
 * Any button-like behavior will have repeat mode enabled (based on
  
 * ConfigVar_KeyRepeatDelay and ConfigVar_KeyRepeatRate values). Note that you
 
 * can also call IsItemActive after any button to tell if it is being held.
  
 * Default = false
 */
@:native("ImGui_ItemFlags_ButtonRepeat")
public static function imGuiItemFlagsButtonRepeat(): Int;
/**
 * Disable any form of focusing (keyboard/gamepad directional navigation and
  
 * SetKeyboardFocusHere calls). Default = false
 */
@:native("ImGui_ItemFlags_NoNav")
public static function imGuiItemFlagsNoNav(): Int;
/**
 * Disable item being a candidate for default focus (e.g. used by title bar
  
 * items). Default = false
 */
@:native("ImGui_ItemFlags_NoNavDefaultFocus")
public static function imGuiItemFlagsNoNavDefaultFocus(): Int;
/**
 * Disable keyboard tabbing. This is a "lighter" version of ItemFlags_NoNav.
  
 * Default = false.
 */
@:native("ImGui_ItemFlags_NoTabStop")
public static function imGuiItemFlagsNoTabStop(): Int;
/** No description available */
@:native("ImGui_ItemFlags_None")
public static function imGuiItemFlagsNone(): Int;
/** No description available */
@:native("ImGui_Key_0")
public static function imGuiKey0(): Int;
/** No description available */
@:native("ImGui_Key_1")
public static function imGuiKey1(): Int;
/** No description available */
@:native("ImGui_Key_2")
public static function imGuiKey2(): Int;
/** No description available */
@:native("ImGui_Key_3")
public static function imGuiKey3(): Int;
/** No description available */
@:native("ImGui_Key_4")
public static function imGuiKey4(): Int;
/** No description available */
@:native("ImGui_Key_5")
public static function imGuiKey5(): Int;
/** No description available */
@:native("ImGui_Key_6")
public static function imGuiKey6(): Int;
/** No description available */
@:native("ImGui_Key_7")
public static function imGuiKey7(): Int;
/** No description available */
@:native("ImGui_Key_8")
public static function imGuiKey8(): Int;
/** No description available */
@:native("ImGui_Key_9")
public static function imGuiKey9(): Int;
/** No description available */
@:native("ImGui_Key_A")
public static function imGuiKeyA(): Int;
/**
 * '
 */
@:native("ImGui_Key_Apostrophe")
public static function imGuiKeyApostrophe(): Int;
/**
 * Available on some keyboard/mouses. Often referred as "Browser Back".
 */
@:native("ImGui_Key_AppBack")
public static function imGuiKeyAppBack(): Int;
/** No description available */
@:native("ImGui_Key_AppForward")
public static function imGuiKeyAppForward(): Int;
/** No description available */
@:native("ImGui_Key_B")
public static function imGuiKeyB(): Int;
/**
 * \
 */
@:native("ImGui_Key_Backslash")
public static function imGuiKeyBackslash(): Int;
/** No description available */
@:native("ImGui_Key_Backspace")
public static function imGuiKeyBackspace(): Int;
/** No description available */
@:native("ImGui_Key_C")
public static function imGuiKeyC(): Int;
/** No description available */
@:native("ImGui_Key_CapsLock")
public static function imGuiKeyCapsLock(): Int;
/**
 * ,
 */
@:native("ImGui_Key_Comma")
public static function imGuiKeyComma(): Int;
/** No description available */
@:native("ImGui_Key_D")
public static function imGuiKeyD(): Int;
/** No description available */
@:native("ImGui_Key_Delete")
public static function imGuiKeyDelete(): Int;
/** No description available */
@:native("ImGui_Key_DownArrow")
public static function imGuiKeyDownArrow(): Int;
/** No description available */
@:native("ImGui_Key_E")
public static function imGuiKeyE(): Int;
/** No description available */
@:native("ImGui_Key_End")
public static function imGuiKeyEnd(): Int;
/** No description available */
@:native("ImGui_Key_Enter")
public static function imGuiKeyEnter(): Int;
/**
 * =
 */
@:native("ImGui_Key_Equal")
public static function imGuiKeyEqual(): Int;
/** No description available */
@:native("ImGui_Key_Escape")
public static function imGuiKeyEscape(): Int;
/** No description available */
@:native("ImGui_Key_F")
public static function imGuiKeyF(): Int;
/** No description available */
@:native("ImGui_Key_F1")
public static function imGuiKeyF1(): Int;
/** No description available */
@:native("ImGui_Key_F10")
public static function imGuiKeyF10(): Int;
/** No description available */
@:native("ImGui_Key_F11")
public static function imGuiKeyF11(): Int;
/** No description available */
@:native("ImGui_Key_F12")
public static function imGuiKeyF12(): Int;
/** No description available */
@:native("ImGui_Key_F13")
public static function imGuiKeyF13(): Int;
/** No description available */
@:native("ImGui_Key_F14")
public static function imGuiKeyF14(): Int;
/** No description available */
@:native("ImGui_Key_F15")
public static function imGuiKeyF15(): Int;
/** No description available */
@:native("ImGui_Key_F16")
public static function imGuiKeyF16(): Int;
/** No description available */
@:native("ImGui_Key_F17")
public static function imGuiKeyF17(): Int;
/** No description available */
@:native("ImGui_Key_F18")
public static function imGuiKeyF18(): Int;
/** No description available */
@:native("ImGui_Key_F19")
public static function imGuiKeyF19(): Int;
/** No description available */
@:native("ImGui_Key_F2")
public static function imGuiKeyF2(): Int;
/** No description available */
@:native("ImGui_Key_F20")
public static function imGuiKeyF20(): Int;
/** No description available */
@:native("ImGui_Key_F21")
public static function imGuiKeyF21(): Int;
/** No description available */
@:native("ImGui_Key_F22")
public static function imGuiKeyF22(): Int;
/** No description available */
@:native("ImGui_Key_F23")
public static function imGuiKeyF23(): Int;
/** No description available */
@:native("ImGui_Key_F24")
public static function imGuiKeyF24(): Int;
/** No description available */
@:native("ImGui_Key_F3")
public static function imGuiKeyF3(): Int;
/** No description available */
@:native("ImGui_Key_F4")
public static function imGuiKeyF4(): Int;
/** No description available */
@:native("ImGui_Key_F5")
public static function imGuiKeyF5(): Int;
/** No description available */
@:native("ImGui_Key_F6")
public static function imGuiKeyF6(): Int;
/** No description available */
@:native("ImGui_Key_F7")
public static function imGuiKeyF7(): Int;
/** No description available */
@:native("ImGui_Key_F8")
public static function imGuiKeyF8(): Int;
/** No description available */
@:native("ImGui_Key_F9")
public static function imGuiKeyF9(): Int;
/** No description available */
@:native("ImGui_Key_G")
public static function imGuiKeyG(): Int;
/**
 * `
 */
@:native("ImGui_Key_GraveAccent")
public static function imGuiKeyGraveAccent(): Int;
/** No description available */
@:native("ImGui_Key_H")
public static function imGuiKeyH(): Int;
/** No description available */
@:native("ImGui_Key_Home")
public static function imGuiKeyHome(): Int;
/** No description available */
@:native("ImGui_Key_I")
public static function imGuiKeyI(): Int;
/** No description available */
@:native("ImGui_Key_Insert")
public static function imGuiKeyInsert(): Int;
/** No description available */
@:native("ImGui_Key_J")
public static function imGuiKeyJ(): Int;
/** No description available */
@:native("ImGui_Key_K")
public static function imGuiKeyK(): Int;
/** No description available */
@:native("ImGui_Key_Keypad0")
public static function imGuiKeyKeypad0(): Int;
/** No description available */
@:native("ImGui_Key_Keypad1")
public static function imGuiKeyKeypad1(): Int;
/** No description available */
@:native("ImGui_Key_Keypad2")
public static function imGuiKeyKeypad2(): Int;
/** No description available */
@:native("ImGui_Key_Keypad3")
public static function imGuiKeyKeypad3(): Int;
/** No description available */
@:native("ImGui_Key_Keypad4")
public static function imGuiKeyKeypad4(): Int;
/** No description available */
@:native("ImGui_Key_Keypad5")
public static function imGuiKeyKeypad5(): Int;
/** No description available */
@:native("ImGui_Key_Keypad6")
public static function imGuiKeyKeypad6(): Int;
/** No description available */
@:native("ImGui_Key_Keypad7")
public static function imGuiKeyKeypad7(): Int;
/** No description available */
@:native("ImGui_Key_Keypad8")
public static function imGuiKeyKeypad8(): Int;
/** No description available */
@:native("ImGui_Key_Keypad9")
public static function imGuiKeyKeypad9(): Int;
/** No description available */
@:native("ImGui_Key_KeypadAdd")
public static function imGuiKeyKeypadAdd(): Int;
/** No description available */
@:native("ImGui_Key_KeypadDecimal")
public static function imGuiKeyKeypadDecimal(): Int;
/** No description available */
@:native("ImGui_Key_KeypadDivide")
public static function imGuiKeyKeypadDivide(): Int;
/** No description available */
@:native("ImGui_Key_KeypadEnter")
public static function imGuiKeyKeypadEnter(): Int;
/** No description available */
@:native("ImGui_Key_KeypadEqual")
public static function imGuiKeyKeypadEqual(): Int;
/** No description available */
@:native("ImGui_Key_KeypadMultiply")
public static function imGuiKeyKeypadMultiply(): Int;
/** No description available */
@:native("ImGui_Key_KeypadSubtract")
public static function imGuiKeyKeypadSubtract(): Int;
/** No description available */
@:native("ImGui_Key_L")
public static function imGuiKeyL(): Int;
/**
 * See also Mod_Alt
 */
@:native("ImGui_Key_LeftAlt")
public static function imGuiKeyLeftAlt(): Int;
/** No description available */
@:native("ImGui_Key_LeftArrow")
public static function imGuiKeyLeftArrow(): Int;
/**
 * [
 */
@:native("ImGui_Key_LeftBracket")
public static function imGuiKeyLeftBracket(): Int;
/**
 * See also Mod_Ctrl
 */
@:native("ImGui_Key_LeftCtrl")
public static function imGuiKeyLeftCtrl(): Int;
/**
 * See also Mod_Shift
 */
@:native("ImGui_Key_LeftShift")
public static function imGuiKeyLeftShift(): Int;
/**
 * See also Mod_Super
 */
@:native("ImGui_Key_LeftSuper")
public static function imGuiKeyLeftSuper(): Int;
/** No description available */
@:native("ImGui_Key_M")
public static function imGuiKeyM(): Int;
/**
 * Also known as the application key
 */
@:native("ImGui_Key_Menu")
public static function imGuiKeyMenu(): Int;
/**
 * -
 */
@:native("ImGui_Key_Minus")
public static function imGuiKeyMinus(): Int;
/** No description available */
@:native("ImGui_Key_MouseLeft")
public static function imGuiKeyMouseLeft(): Int;
/** No description available */
@:native("ImGui_Key_MouseMiddle")
public static function imGuiKeyMouseMiddle(): Int;
/** No description available */
@:native("ImGui_Key_MouseRight")
public static function imGuiKeyMouseRight(): Int;
/** No description available */
@:native("ImGui_Key_MouseWheelX")
public static function imGuiKeyMouseWheelX(): Int;
/** No description available */
@:native("ImGui_Key_MouseWheelY")
public static function imGuiKeyMouseWheelY(): Int;
/** No description available */
@:native("ImGui_Key_MouseX1")
public static function imGuiKeyMouseX1(): Int;
/** No description available */
@:native("ImGui_Key_MouseX2")
public static function imGuiKeyMouseX2(): Int;
/** No description available */
@:native("ImGui_Key_N")
public static function imGuiKeyN(): Int;
/** No description available */
@:native("ImGui_Key_NumLock")
public static function imGuiKeyNumLock(): Int;
/** No description available */
@:native("ImGui_Key_O")
public static function imGuiKeyO(): Int;
/**
 * Key next to the left shift on ISO keyboards.
 */
@:native("ImGui_Key_Oem102")
public static function imGuiKeyOem102(): Int;
/** No description available */
@:native("ImGui_Key_P")
public static function imGuiKeyP(): Int;
/** No description available */
@:native("ImGui_Key_PageDown")
public static function imGuiKeyPageDown(): Int;
/** No description available */
@:native("ImGui_Key_PageUp")
public static function imGuiKeyPageUp(): Int;
/** No description available */
@:native("ImGui_Key_Pause")
public static function imGuiKeyPause(): Int;
/**
 * .
 */
@:native("ImGui_Key_Period")
public static function imGuiKeyPeriod(): Int;
/** No description available */
@:native("ImGui_Key_PrintScreen")
public static function imGuiKeyPrintScreen(): Int;
/** No description available */
@:native("ImGui_Key_Q")
public static function imGuiKeyQ(): Int;
/** No description available */
@:native("ImGui_Key_R")
public static function imGuiKeyR(): Int;
/**
 * See also Mod_Alt
 */
@:native("ImGui_Key_RightAlt")
public static function imGuiKeyRightAlt(): Int;
/** No description available */
@:native("ImGui_Key_RightArrow")
public static function imGuiKeyRightArrow(): Int;
/**
 * ]
 */
@:native("ImGui_Key_RightBracket")
public static function imGuiKeyRightBracket(): Int;
/**
 * See also Mod_Ctrl
 */
@:native("ImGui_Key_RightCtrl")
public static function imGuiKeyRightCtrl(): Int;
/**
 * See also Mod_Shift
 */
@:native("ImGui_Key_RightShift")
public static function imGuiKeyRightShift(): Int;
/**
 * See also Mod_Super
 */
@:native("ImGui_Key_RightSuper")
public static function imGuiKeyRightSuper(): Int;
/** No description available */
@:native("ImGui_Key_S")
public static function imGuiKeyS(): Int;
/** No description available */
@:native("ImGui_Key_ScrollLock")
public static function imGuiKeyScrollLock(): Int;
/**
 * ;
 */
@:native("ImGui_Key_Semicolon")
public static function imGuiKeySemicolon(): Int;
/**
 * /
 */
@:native("ImGui_Key_Slash")
public static function imGuiKeySlash(): Int;
/** No description available */
@:native("ImGui_Key_Space")
public static function imGuiKeySpace(): Int;
/** No description available */
@:native("ImGui_Key_T")
public static function imGuiKeyT(): Int;
/** No description available */
@:native("ImGui_Key_Tab")
public static function imGuiKeyTab(): Int;
/** No description available */
@:native("ImGui_Key_U")
public static function imGuiKeyU(): Int;
/** No description available */
@:native("ImGui_Key_UpArrow")
public static function imGuiKeyUpArrow(): Int;
/** No description available */
@:native("ImGui_Key_V")
public static function imGuiKeyV(): Int;
/** No description available */
@:native("ImGui_Key_W")
public static function imGuiKeyW(): Int;
/** No description available */
@:native("ImGui_Key_X")
public static function imGuiKeyX(): Int;
/** No description available */
@:native("ImGui_Key_Y")
public static function imGuiKeyY(): Int;
/** No description available */
@:native("ImGui_Key_Z")
public static function imGuiKeyZ(): Int;
/**
 * Display text+label aligned the same way as value+label widgets
 */
@:native("ImGui_LabelText")
public static function imGuiLabelText(ctX: ImGuiContext, label: String, teXt: String): Void;
/**
 * This is an helper over BeginListBox/EndListBox for convenience purpose.
Each
 * item must be null-terminated (requires REAPER v6.44 or newer for EEL and
 * Lua).
 */
@:native("ImGui_ListBox")
public static function imGuiListBox(ctX: ImGuiContext, label: String, currentItem: Int, items: String, ?heightInItemsIn: Int): Bool;
/**
 * - items_count: Use INT_MAX from NumericLimits_Int if you don't know how
 * many
items you have (in which case the cursor won't be advanced in the final
 * step,
and you can call SeekCursorForItem manually if you need)
-
 * items_height: Use -1.0 to be calculated automatically on first step.
 
 * Otherwise pass in the distance between your items, typically
 
 * GetTextLineHeightWithSpacing or GetFrameHeightWithSpacing.
 */
@:native("ImGui_ListClipper_Begin")
public static function imGuiListClipperBegin(clipper: ImGuiListClipper, itemsCount: Int, ?itemsHeigHtIn: Float): Void;
/**
 * Automatically called on the last call of ListClipper_Step that returns false.
 */
@:native("ImGui_ListClipper_End")
public static function imGuiListClipperEnd(clipper: ImGuiListClipper): Void;
/** No description available */
@:native("ImGui_ListClipper_GetDisplayRange")
public static function imGuiListClipperGetDisplayRange(clipper: ImGuiListClipper): Int;
/**
 * Call ListClipper_IncludeItemByIndex or ListClipper_IncludeItemsByIndex
 * before
the first call to ListClipper_Step if you need a range of items to be
 * displayed
regardless of visibility.
(Due to alignment / padding of certain
 * items it is possible that an extra item
may be included on either end of the
 * display range).
 */
@:native("ImGui_ListClipper_IncludeItemByIndex")
public static function imGuiListClipperIncludeItemByIndex(clipper: ImGuiListClipper, itemIndeX: Int): Void;
/**
 * See ListClipper_IncludeItemByIndex.
item_end is exclusive e.g. use (42, 42+1)
 * to make item 42 never clipped.
 */
@:native("ImGui_ListClipper_IncludeItemsByIndex")
public static function imGuiListClipperIncludeItemsByIndex(clipper: ImGuiListClipper, itemBegin: Int, itemEnd: Int): Void;
/**
 * Seek cursor toward given item. This is automatically called while
 * stepping.
The only reason to call this is: you can use
 * ListClipper_Begin(INT_MAX) if you
don't know item count ahead of time. In
 * this case, after all steps are done,
you'll want to call
 * SeekCursorForItem(items_count).
 */
@:native("ImGui_ListClipper_SeekCursorForItem")
public static function imGuiListClipperSeekCursorForItem(clipper: ImGuiListClipper, itemsCount: Int): Void;
/**
 * Call until it returns false. The display_start/display_end fields
 * from
ListClipper_GetDisplayRange will be set and you can process/draw those
 * items.
 */
@:native("ImGui_ListClipper_Step")
public static function imGuiListClipperStep(clipper: ImGuiListClipper): Bool;
/**
 * Stop logging (close file, etc.)
 */
@:native("ImGui_LogFinish")
public static function imGuiLogFinish(ctX: ImGuiContext): Void;
/**
 * Pass text data straight to log (without being displayed)
 */
@:native("ImGui_LogText")
public static function imGuiLogText(ctX: ImGuiContext, teXt: String): Void;
/**
 * Start logging all text output from the interface to the OS clipboard.
See
 * also SetClipboardText.
 */
@:native("ImGui_LogToClipboard")
public static function imGuiLogToClipboard(ctX: ImGuiContext, ?autoOpenDeptHIn: Int): Void;
/**
 * Start logging all text output from the interface to a file.
The data is saved
 * to $resource_path/imgui_log.txt if filename is nil.
 */
@:native("ImGui_LogToFile")
public static function imGuiLogToFile(ctX: ImGuiContext, ?autoOpenDeptHIn: Int, ?fileNameIn: String): Void;
/**
 * Start logging all text output from the interface to the TTY (stdout).
 */
@:native("ImGui_LogToTTY")
public static function imGuiLogToTty(ctX: ImGuiContext, ?autoOpenDeptHIn: Int): Void;
/**
 * Return true when activated. Shortcuts are displayed for convenience but
 * not
processed by ImGui at the moment. Toggle state is written to 'selected'
 * when
provided.
 */
@:native("ImGui_MenuItem")
public static function imGuiMenuItem(ctX: ImGuiContext, label: String, ?sHortcutIn: String, ?pSelected: Bool, ?enabledIn: Bool): Bool;
/** No description available */
@:native("ImGui_Mod_Alt")
public static function imGuiModAlt(): Int;
/**
 * Cmd when ConfigVar_MacOSXBehaviors is enabled.
 */
@:native("ImGui_Mod_Ctrl")
public static function imGuiModCtrl(): Int;
/** No description available */
@:native("ImGui_Mod_None")
public static function imGuiModNone(): Int;
/** No description available */
@:native("ImGui_Mod_Shift")
public static function imGuiModShift(): Int;
/**
 * Ctrl when ConfigVar_MacOSXBehaviors is enabled.
 */
@:native("ImGui_Mod_Super")
public static function imGuiModSuper(): Int;
/** No description available */
@:native("ImGui_MouseButton_Left")
public static function imGuiMouseButtonLeft(): Int;
/** No description available */
@:native("ImGui_MouseButton_Middle")
public static function imGuiMouseButtonMiddle(): Int;
/** No description available */
@:native("ImGui_MouseButton_Right")
public static function imGuiMouseButtonRight(): Int;
/** No description available */
@:native("ImGui_MouseCursor_Arrow")
public static function imGuiMouseCursorArrow(): Int;
/**
 * (Unused by Dear ImGui functions. Use for e.g. hyperlinks)
 */
@:native("ImGui_MouseCursor_Hand")
public static function imGuiMouseCursorHand(): Int;
/** No description available */
@:native("ImGui_MouseCursor_None")
public static function imGuiMouseCursorNone(): Int;
/**
 * When hovering something with disallowed interaction. Usually a crossed
 * circle.
 */
@:native("ImGui_MouseCursor_NotAllowed")
public static function imGuiMouseCursorNotAllowed(): Int;
/**
 * When waiting for something to process/load, but application is still
 * interactive.
 */
@:native("ImGui_MouseCursor_Progress")
public static function imGuiMouseCursorProgress(): Int;
/**
 * (Unused by Dear ImGui functions)
 */
@:native("ImGui_MouseCursor_ResizeAll")
public static function imGuiMouseCursorResizeAll(): Int;
/**
 * When hovering over a vertical border or a column.
 */
@:native("ImGui_MouseCursor_ResizeEW")
public static function imGuiMouseCursorResizeEw(): Int;
/**
 * When hovering over the bottom-left corner of a window.
 */
@:native("ImGui_MouseCursor_ResizeNESW")
public static function imGuiMouseCursorResizeNesw(): Int;
/**
 * When hovering over a horizontal border.
 */
@:native("ImGui_MouseCursor_ResizeNS")
public static function imGuiMouseCursorResizeNs(): Int;
/**
 * When hovering over the bottom-right corner of a window.
 */
@:native("ImGui_MouseCursor_ResizeNWSE")
public static function imGuiMouseCursorResizeNwse(): Int;
/**
 * When hovering over InputText, etc.
 */
@:native("ImGui_MouseCursor_TextInput")
public static function imGuiMouseCursorTextInput(): Int;
/**
 * When waiting for something to process/load.
 */
@:native("ImGui_MouseCursor_Wait")
public static function imGuiMouseCursorWait(): Int;
/**
 * Undo a SameLine() or force a new line when in a horizontal-layout context.
 */
@:native("ImGui_NewLine")
public static function imGuiNewLine(ctX: ImGuiContext): Void;
/**
 * Returns DBL_MIN and DBL_MAX for this system.
 */
@:native("ImGui_NumericLimits_Double")
public static function imGuiNumericLimitsDouble(): Float;
/**
 * Returns FLT_MIN and FLT_MAX for this system.
 */
@:native("ImGui_NumericLimits_Float")
public static function imGuiNumericLimitsFloat(): Float;
/**
 * Returns INT_MIN and INT_MAX for this system.
 */
@:native("ImGui_NumericLimits_Int")
public static function imGuiNumericLimitsInt(): Int;
/**
 * Set popup state to open (don't call every frame!).
ImGuiPopupFlags are
 * available for opening options.
If not modal: they can be closed by clicking
 * anywhere outside them, or by
pressing ESCAPE.
Use
 * PopupFlags_NoOpenOverExistingPopup to avoid opening a popup if
 * there's
already one at the same level.
 */
@:native("ImGui_OpenPopup")
public static function imGuiOpenPopup(ctX: ImGuiContext, strId: String, ?popupFlagsIn: Int): Void;
/**
 * Helper to open popup when clicked on last item. return true when just
 * opened.
(Note: actually triggers on the mouse _released_ event to be
 * consistent with
popup behaviors.)
 */
@:native("ImGui_OpenPopupOnItemClick")
public static function imGuiOpenPopupOnItemClick(ctX: ImGuiContext, ?strIdIn: String, ?popupFlagsIn: Int): Void;
/** No description available */
@:native("ImGui_PlotHistogram")
public static function imGuiPlotHistogram(ctX: ImGuiContext, label: String, values: ReaperArray, ?valuesOffSetIn: Int, ?overlaYTeXtIn: String, ?scaleMinIn: Float, ?scaleMaXIn: Float, ?grapHSizeWIn: Float, ?grapHSizeHIn: Float): Void;
/** No description available */
@:native("ImGui_PlotLines")
public static function imGuiPlotLines(ctX: ImGuiContext, label: String, values: ReaperArray, ?valuesOffSetIn: Int, ?overlaYTeXtIn: String, ?scaleMinIn: Float, ?scaleMaXIn: Float, ?grapHSizeWIn: Float, ?grapHSizeHIn: Float): Void;
/**
 * Convert a position from the current platform's native coordinate
 * position
system to ReaImGui global coordinates (or vice versa).
This
 * effectively flips the Y coordinate on macOS and applies HiDPI scaling
 * on
Windows and Linux.
 */
@:native("ImGui_PointConvertNative")
public static function imGuiPointConvertNative(ctX: ImGuiContext, x: Float, y: Float, ?toNativeIn: Bool): Float;
/**
 * See PushClipRect
 */
@:native("ImGui_PopClipRect")
public static function imGuiPopClipRect(ctX: ImGuiContext): Void;
/**
 * See PushFont.
 */
@:native("ImGui_PopFont")
public static function imGuiPopFont(ctX: ImGuiContext): Void;
/**
 * Pop from the ID stack.
 */
@:native("ImGui_PopID")
public static function imGuiPopId(ctX: ImGuiContext): Void;
/**
 * See PushItemFlag
 */
@:native("ImGui_PopItemFlag")
public static function imGuiPopItemFlag(ctX: ImGuiContext): Void;
/**
 * See PushItemWidth
 */
@:native("ImGui_PopItemWidth")
public static function imGuiPopItemWidth(ctX: ImGuiContext): Void;
/** No description available */
@:native("ImGui_PopStyleColor")
public static function imGuiPopStyleColor(ctX: ImGuiContext, ?countIn: Int): Void;
/**
 * Reset a style variable.
 */
@:native("ImGui_PopStyleVar")
public static function imGuiPopStyleVar(ctX: ImGuiContext, ?countIn: Int): Void;
/** No description available */
@:native("ImGui_PopTextWrapPos")
public static function imGuiPopTextWrapPos(ctX: ImGuiContext): Void;
/**
 * PopupFlags_AnyPopupId | PopupFlags_AnyPopupLevel
 */
@:native("ImGui_PopupFlags_AnyPopup")
public static function imGuiPopupFlagsAnyPopup(): Int;
/**
 * Ignore the str_id parameter and test for any popup.
 */
@:native("ImGui_PopupFlags_AnyPopupId")
public static function imGuiPopupFlagsAnyPopupId(): Int;
/**
 * Search/test at any level of the popup stack (default test in the current
 * level).
 */
@:native("ImGui_PopupFlags_AnyPopupLevel")
public static function imGuiPopupFlagsAnyPopupLevel(): Int;
/**
 * Open on Left Mouse release.
   Guaranteed to always be == 0 (same as
 * MouseButton_Left).
 */
@:native("ImGui_PopupFlags_MouseButtonLeft")
public static function imGuiPopupFlagsMouseButtonLeft(): Int;
/**
 * Open on Middle Mouse release.
   Guaranteed to always be == 2 (same as
 * MouseButton_Middle).
 */
@:native("ImGui_PopupFlags_MouseButtonMiddle")
public static function imGuiPopupFlagsMouseButtonMiddle(): Int;
/**
 * Open on Right Mouse release.
   Guaranteed to always be == 1 (same as
 * MouseButton_Right).
 */
@:native("ImGui_PopupFlags_MouseButtonRight")
public static function imGuiPopupFlagsMouseButtonRight(): Int;
/**
 * Don't open if there's already a popup at the same level of the popup stack.
 */
@:native("ImGui_PopupFlags_NoOpenOverExistingPopup")
public static function imGuiPopupFlagsNoOpenOverExistingPopup(): Int;
/**
 * For BeginPopupContextWindow: don't return true when hovering items,
   only
 * when hovering empty space.
 */
@:native("ImGui_PopupFlags_NoOpenOverItems")
public static function imGuiPopupFlagsNoOpenOverItems(): Int;
/**
 * Don't reopen same popup if already open
   (won't reposition, won't
 * reinitialize navigation).
 */
@:native("ImGui_PopupFlags_NoReopen")
public static function imGuiPopupFlagsNoReopen(): Int;
/** No description available */
@:native("ImGui_PopupFlags_None")
public static function imGuiPopupFlagsNone(): Int;
/**
 * Fraction < 0.0 displays an indeterminate progress bar animation since
 * v0.9.1.
The value must be animated along with time, for example `-1.0 *
 * ImGui.GetTime()`.
 */
@:native("ImGui_ProgressBar")
public static function imGuiProgressBar(ctX: ImGuiContext, fraction: Float, ?sizeArgWIn: Float, ?sizeArgHIn: Float, ?overlaYIn: String): Void;
/** No description available */
@:native("ImGui_PushClipRect")
public static function imGuiPushClipRect(ctX: ImGuiContext, clipRectMinX: Float, clipRectMinY: Float, clipRectMaXX: Float, clipRectMaXY: Float, intersectWitHCurrentClipRect: Bool): Void;
/**
 * Change the current font. Pass font=nil to only change the size. See PopFont.
 */
@:native("ImGui_PushFont")
public static function imGuiPushFont(ctX: ImGuiContext, font: ImGuiFont, fontSizeBaseUnscaled: Float): Void;
/**
 * Push string into the ID stack.
 */
@:native("ImGui_PushID")
public static function imGuiPushId(ctX: ImGuiContext, strId: String): Void;
/**
 * Modify specified shared item flag for certain widgets.
Example:
 * `PushItemFlag(ItemFlags_NoTabStop, true)`.
 */
@:native("ImGui_PushItemFlag")
public static function imGuiPushItemFlag(ctX: ImGuiContext, option: Int, enabled: Bool): Void;
/**
 * Push width of items for common large "item+label" widgets.
- \>0.0: width in
 * pixels
- <0.0 align xx pixels to the right of window
  (so -FLT_MIN always
 * align width to the right side)
- 0.0 = default to ~2/3 of windows width.
 */
@:native("ImGui_PushItemWidth")
public static function imGuiPushItemWidth(ctX: ImGuiContext, itemWIdtH: Float): Void;
/**
 * Temporarily modify a style color.
Call PopStyleColor to undo after use
 * (before the end of the frame).
See Col_* for available style colors.
 */
@:native("ImGui_PushStyleColor")
public static function imGuiPushStyleColor(ctX: ImGuiContext, idX: Int, colRgba: Int): Void;
/**
 * Temporarily modify a style variable.
Call PopStyleVar to undo after use
 * (before the end of the frame).
See StyleVar_* for possible values of 'idx'.
 */
@:native("ImGui_PushStyleVar")
public static function imGuiPushStyleVar(ctX: ImGuiContext, idX: Int, val1: Float, ?val2In: Float): Void;
/**
 * Modify the X component of a style variable. See PushStyleVar.
 */
@:native("ImGui_PushStyleVarX")
public static function imGuiPushStyleVarX(ctX: ImGuiContext, idX: Int, valX: Float): Void;
/**
 * Modify the X component of a style variable. See PushStyleVar.
 */
@:native("ImGui_PushStyleVarY")
public static function imGuiPushStyleVarY(ctX: ImGuiContext, idX: Int, valY: Float): Void;
/**
 * Push word-wrapping position for Text*() commands.
-  < 0.0: no wrapping
-  =
 * 0.0: wrap to end of window (or column)
- \> 0.0: wrap at 'wrap_pos_x'
 * position in window local space.
 */
@:native("ImGui_PushTextWrapPos")
public static function imGuiPushTextWrapPos(ctX: ImGuiContext, ?wrapLocalPosXIn: Float): Void;
/**
 * Use with e.g. if (RadioButton("one", my_value==1)) { my_value = 1; }
 */
@:native("ImGui_RadioButton")
public static function imGuiRadioButton(ctX: ImGuiContext, label: String, active: Bool): Bool;
/**
 * Shortcut to handle RadioButton's example pattern when value is an integer
 */
@:native("ImGui_RadioButtonEx")
public static function imGuiRadioButtonEx(ctX: ImGuiContext, label: String, v: Int, vButton: Int): Bool;
/** No description available */
@:native("ImGui_ResetMouseDragDelta")
public static function imGuiResetMouseDragDelta(ctX: ImGuiContext, ?buttonIn: Int): Void;
/**
 * Call between widgets or groups to layout them horizontally.
X position given
 * in window coordinates.
 */
@:native("ImGui_SameLine")
public static function imGuiSameLine(ctX: ImGuiContext, ?offSetFromStartXIn: Float, ?spacingIn: Float): Void;
/** No description available */
@:native("ImGui_Selectable")
public static function imGuiSelectable(ctX: ImGuiContext, label: String, ?pSelected: Bool, ?flagsIn: Int, ?sizeWIn: Float, ?sizeHIn: Float): Bool;
/**
 * Generate press events on double clicks too.
 */
@:native("ImGui_SelectableFlags_AllowDoubleClick")
public static function imGuiSelectableFlagsAllowDoubleClick(): Int;
/**
 * Hit testing to allow subsequent widgets to overlap this one.
 */
@:native("ImGui_SelectableFlags_AllowOverlap")
public static function imGuiSelectableFlagsAllowOverlap(): Int;
/**
 * Cannot be selected, display grayed out text.
 */
@:native("ImGui_SelectableFlags_Disabled")
public static function imGuiSelectableFlagsDisabled(): Int;
/**
 * Make the item be displayed as if it is hovered.
 */
@:native("ImGui_SelectableFlags_Highlight")
public static function imGuiSelectableFlagsHighlight(): Int;
/**
 * Clicking this doesn't close parent popup window (overrides
 * ItemFlags_AutoClosePopups)
 */
@:native("ImGui_SelectableFlags_NoAutoClosePopups")
public static function imGuiSelectableFlagsNoAutoClosePopups(): Int;
/** No description available */
@:native("ImGui_SelectableFlags_None")
public static function imGuiSelectableFlagsNone(): Int;
/**
 * Frame will span all columns of its container table (text will still fit in
 * current column).
 */
@:native("ImGui_SelectableFlags_SpanAllColumns")
public static function imGuiSelectableFlagsSpanAllColumns(): Int;
/**
 * Separator, generally horizontal. inside a menu bar or in horizontal
 * layout
mode, this becomes a vertical separator.
 */
@:native("ImGui_Separator")
public static function imGuiSeparator(ctX: ImGuiContext): Void;
/**
 * Text formatted with an horizontal line
 */
@:native("ImGui_SeparatorText")
public static function imGuiSeparatorText(ctX: ImGuiContext, label: String): Void;
/**
 * See also the LogToClipboard function to capture GUI into clipboard,
or easily
 * output text data to the clipboard.
 */
@:native("ImGui_SetClipboardText")
public static function imGuiSetClipboardText(ctX: ImGuiContext, teXt: String): Void;
/**
 * Picker type, etc. User will be able to change many settings, unless you
 * pass
the _NoOptions flag to your calls.
 */
@:native("ImGui_SetColorEditOptions")
public static function imGuiSetColorEditOptions(ctX: ImGuiContext, flags: Int): Void;
/** No description available */
@:native("ImGui_SetConfigVar")
public static function imGuiSetConfigVar(ctX: ImGuiContext, varIdX: Int, value: Float): Void;
/**
 * Cursor position in window
 */
@:native("ImGui_SetCursorPos")
public static function imGuiSetCursorPos(ctX: ImGuiContext, localPosX: Float, localPosY: Float): Void;
/**
 * Cursor X position in window
 */
@:native("ImGui_SetCursorPosX")
public static function imGuiSetCursorPosX(ctX: ImGuiContext, localX: Float): Void;
/**
 * Cursor Y position in window
 */
@:native("ImGui_SetCursorPosY")
public static function imGuiSetCursorPosY(ctX: ImGuiContext, localY: Float): Void;
/**
 * Cursor position in absolute screen coordinates.
 */
@:native("ImGui_SetCursorScreenPos")
public static function imGuiSetCursorScreenPos(ctX: ImGuiContext, posX: Float, posY: Float): Void;
/**
 * The type is a user defined string of maximum 32 characters.
Strings starting
 * with '_' are reserved for dear imgui internal types.
Data is copied and held
 * by imgui.
 */
@:native("ImGui_SetDragDropPayload")
public static function imGuiSetDragDropPayload(ctX: ImGuiContext, tYpe: String, data: String, ?condIn: Int): Bool;
/**
 * Make last item the default focused item of a newly appearing window.
 */
@:native("ImGui_SetItemDefaultFocus")
public static function imGuiSetItemDefaultFocus(ctX: ImGuiContext): Void;
/**
 * Set a text-only tooltip if preceding item was hovered.
Override any previous
 * call to SetTooltip(). Shortcut for
`if
 * (IsItemHovered(HoveredFlags_ForTooltip)) { SetTooltip(...); }`.
 */
@:native("ImGui_SetItemTooltip")
public static function imGuiSetItemTooltip(ctX: ImGuiContext, teXt: String): Void;
/**
 * Focus keyboard on the next widget. Use positive 'offset' to access
 * sub
components of a multiple component widget. Use -1 to access previous
 * widget.
 */
@:native("ImGui_SetKeyboardFocusHere")
public static function imGuiSetKeyboardFocusHere(ctX: ImGuiContext, ?offSetIn: Int): Void;
/**
 * Set desired mouse cursor shape. See MouseCursor_* for possible values.
 */
@:native("ImGui_SetMouseCursor")
public static function imGuiSetMouseCursor(ctX: ImGuiContext, cursorTYpe: Int): Void;
/**
 * Alter visibility of keyboard/gamepad cursor. By default: shown when using
 * an
arrow key, hidden when clicking with the mouse.
 */
@:native("ImGui_SetNavCursorVisible")
public static function imGuiSetNavCursorVisible(ctX: ImGuiContext, visible: Bool): Void;
/**
 * Request capture of keyboard shortcuts in REAPER's global scope for the next
 * frame.
 */
@:native("ImGui_SetNextFrameWantCaptureKeyboard")
public static function imGuiSetNextFrameWantCaptureKeyboard(ctX: ImGuiContext, wantCaptureKeYboard: Bool): Void;
/**
 * Allow next item to be overlapped by a subsequent item.
Useful with invisible
 * buttons, selectable, treenode covering an area where
subsequent items may
 * need to be added. Note that both Selectable() and TreeNode()
have dedicated
 * flags doing this.
 */
@:native("ImGui_SetNextItemAllowOverlap")
public static function imGuiSetNextItemAllowOverlap(ctX: ImGuiContext): Void;
/**
 * Set next TreeNode/CollapsingHeader open state.
Can also be done with the
 * TreeNodeFlags_DefaultOpen flag.
 */
@:native("ImGui_SetNextItemOpen")
public static function imGuiSetNextItemOpen(ctX: ImGuiContext, isOpen: Bool, ?condIn: Int): Void;
/** No description available */
@:native("ImGui_SetNextItemShortcut")
public static function imGuiSetNextItemShortcut(ctX: ImGuiContext, keYCHord: Int, ?flagsIn: Int): Void;
/**
 * Set width of the _next_ common large "item+label" widget.
- \>0.0: width in
 * pixels
- <0.0 align xx pixels to the right of window
  (so -FLT_MIN always
 * align width to the right side)
 */
@:native("ImGui_SetNextItemWidth")
public static function imGuiSetNextItemWidth(ctX: ImGuiContext, itemWIdtH: Float): Void;
/**
 * Set next window background color alpha. Helper to easily override the
 * Alpha
component of Col_WindowBg/Col_ChildBg/Col_PopupBg.
You may also use
 * WindowFlags_NoBackground for a fully transparent window.
 */
@:native("ImGui_SetNextWindowBgAlpha")
public static function imGuiSetNextWindowBgAlpha(ctX: ImGuiContext, alpHa: Float): Void;
/**
 * Set next window collapsed state.
 */
@:native("ImGui_SetNextWindowCollapsed")
public static function imGuiSetNextWindowCollapsed(ctX: ImGuiContext, collapsed: Bool, ?condIn: Int): Void;
/**
 * Set next window content size (~ scrollable client area, which enforce
 * the
range of scrollbars). Not including window decorations (title bar, menu
 * bar,
etc.) nor StyleVar_WindowPadding. set an axis to 0.0 to leave it
 * automatic.
 */
@:native("ImGui_SetNextWindowContentSize")
public static function imGuiSetNextWindowContentSize(ctX: ImGuiContext, sizeW: Float, sizeH: Float): Void;
/** No description available */
@:native("ImGui_SetNextWindowDockID")
public static function imGuiSetNextWindowDockId(ctX: ImGuiContext, dockId: Int, ?condIn: Int): Void;
/**
 * Set next window to be focused / top-most.
 */
@:native("ImGui_SetNextWindowFocus")
public static function imGuiSetNextWindowFocus(ctX: ImGuiContext): Void;
/**
 * Set next window position. Use pivot=(0.5,0.5) to center on given point, etc.
 */
@:native("ImGui_SetNextWindowPos")
public static function imGuiSetNextWindowPos(ctX: ImGuiContext, posX: Float, posY: Float, ?condIn: Int, ?pivotXIn: Float, ?pivotYIn: Float): Void;
/**
 * Set next window scrolling value (use < 0.0 to not affect a given axis).
 */
@:native("ImGui_SetNextWindowScroll")
public static function imGuiSetNextWindowScroll(ctX: ImGuiContext, scrollX: Float, scrollY: Float): Void;
/**
 * Set next window size. set axis to 0.0 to force an auto-fit on this axis.
 */
@:native("ImGui_SetNextWindowSize")
public static function imGuiSetNextWindowSize(ctX: ImGuiContext, sizeW: Float, sizeH: Float, ?condIn: Int): Void;
/**
 * Set next window size limits. Use 0.0 or FLT_MAX (second return value
 * of
NumericLimits_Float) if you don't want limits.
Use -1 for both min and max
 * of same axis to preserve current size (which itself
is a constraint).
Use
 * callback to apply non-trivial programmatic constraints.
 */
@:native("ImGui_SetNextWindowSizeConstraints")
public static function imGuiSetNextWindowSizeConstraints(ctX: ImGuiContext, sizeMinW: Float, sizeMinH: Float, sizeMaXW: Float, sizeMaXH: Float, customCallbackIn: ImGuiFunction): Void;
/**
 * Adjust scrolling amount to make given position visible.
Generally
 * GetCursorStartPos() + offset to compute a valid position.
 */
@:native("ImGui_SetScrollFromPosX")
public static function imGuiSetScrollFromPosX(ctX: ImGuiContext, localX: Float, ?centerXRatioIn: Float): Void;
/**
 * Adjust scrolling amount to make given position visible.
Generally
 * GetCursorStartPos() + offset to compute a valid position.
 */
@:native("ImGui_SetScrollFromPosY")
public static function imGuiSetScrollFromPosY(ctX: ImGuiContext, localY: Float, ?centerYRatioIn: Float): Void;
/**
 * Adjust scrolling amount to make current cursor position
 * visible.
center_x_ratio=0.0: left, 0.5: center, 1.0: right.
When using to
 * make a "default/current item" visible,
consider using SetItemDefaultFocus
 * instead.
 */
@:native("ImGui_SetScrollHereX")
public static function imGuiSetScrollHereX(ctX: ImGuiContext, ?centerXRatioIn: Float): Void;
/**
 * Adjust scrolling amount to make current cursor position
 * visible.
center_y_ratio=0.0: top, 0.5: center, 1.0: bottom.
When using to
 * make a "default/current item" visible,
consider using SetItemDefaultFocus
 * instead.
 */
@:native("ImGui_SetScrollHereY")
public static function imGuiSetScrollHereY(ctX: ImGuiContext, ?centerYRatioIn: Float): Void;
/**
 * Set scrolling amount [0 .. GetScrollMaxX()]
 */
@:native("ImGui_SetScrollX")
public static function imGuiSetScrollX(ctX: ImGuiContext, scrollX: Float): Void;
/**
 * Set scrolling amount [0 .. GetScrollMaxY()]
 */
@:native("ImGui_SetScrollY")
public static function imGuiSetScrollY(ctX: ImGuiContext, scrollY: Float): Void;
/**
 * Notify TabBar or Docking system of a closed tab/window ahead
(useful to
 * reduce visual flicker on reorderable tab bars).
For tab-bar: call after
 * BeginTabBar and before Tab submissions.
Otherwise call with a window name.
 */
@:native("ImGui_SetTabItemClosed")
public static function imGuiSetTabItemClosed(ctX: ImGuiContext, tabOrDockedWindoWLabel: String): Void;
/**
 * Set a text-only tooltip. Often used after a IsItemHovered() check.
Override
 * any previous call to SetTooltip.
Shortcut for `if (BeginTooltip()) {
 * Text(...); EndTooltip(); }`.
 */
@:native("ImGui_SetTooltip")
public static function imGuiSetTooltip(ctX: ImGuiContext, teXt: String): Void;
/**
 * (Not recommended) Set current window collapsed state.
Prefer using
 * SetNextWindowCollapsed.
 */
@:native("ImGui_SetWindowCollapsed")
public static function imGuiSetWindowCollapsed(ctX: ImGuiContext, collapsed: Bool, ?condIn: Int): Void;
/**
 * Set named window collapsed state.
 */
@:native("ImGui_SetWindowCollapsedEx")
public static function imGuiSetWindowCollapsedEx(ctX: ImGuiContext, name: String, collapsed: Bool, ?condIn: Int): Void;
/**
 * (Not recommended) Set current window to be focused / top-most.
Prefer using
 * SetNextWindowFocus.
 */
@:native("ImGui_SetWindowFocus")
public static function imGuiSetWindowFocus(ctX: ImGuiContext): Void;
/**
 * Set named window to be focused / top-most. Use an empty name to remove focus.
 */
@:native("ImGui_SetWindowFocusEx")
public static function imGuiSetWindowFocusEx(ctX: ImGuiContext, name: String): Void;
/**
 * (Not recommended) Set current window position - call within Begin/End.
Prefer
 * using SetNextWindowPos, as this may incur tearing and minor side-effects.
 */
@:native("ImGui_SetWindowPos")
public static function imGuiSetWindowPos(ctX: ImGuiContext, posX: Float, posY: Float, ?condIn: Int): Void;
/**
 * Set named window position.
 */
@:native("ImGui_SetWindowPosEx")
public static function imGuiSetWindowPosEx(ctX: ImGuiContext, name: String, posX: Float, posY: Float, ?condIn: Int): Void;
/**
 * (Not recommended) Set current window size - call within Begin/End.
Set size_w
 * and size_h to 0 to force an auto-fit.
Prefer using SetNextWindowSize, as this
 * may incur tearing and minor side-effects.
 */
@:native("ImGui_SetWindowSize")
public static function imGuiSetWindowSize(ctX: ImGuiContext, sizeW: Float, sizeH: Float, ?condIn: Int): Void;
/**
 * Set named window size. Set axis to 0.0 to force an auto-fit on this axis.
 */
@:native("ImGui_SetWindowSizeEx")
public static function imGuiSetWindowSizeEx(ctX: ImGuiContext, name: String, sizeW: Float, sizeH: Float, ?condIn: Int): Void;
/** No description available */
@:native("ImGui_Shortcut")
public static function imGuiShortcut(ctX: ImGuiContext, keYCHord: Int, ?flagsIn: Int): Bool;
/**
 * Create About window.
Display ReaImGui version, Dear ImGui version, credits
 * and build/system information.
 */
@:native("ImGui_ShowAboutWindow")
public static function imGuiShowAboutWindow(ctX: ImGuiContext, ?pOpen: Bool): Bool;
/**
 * Create Debug Log window. display a simplified log of important dear imgui
 * events.
 */
@:native("ImGui_ShowDebugLogWindow")
public static function imGuiShowDebugLogWindow(ctX: ImGuiContext, ?pOpen: Bool): Bool;
/**
 * Create Stack Tool window. Hover items with mouse to query information
 * about
the source of their unique ID.
 */
@:native("ImGui_ShowIDStackToolWindow")
public static function imGuiShowIdStackToolWindow(ctX: ImGuiContext, ?pOpen: Bool): Bool;
/**
 * Create Metrics/Debugger window.
Display Dear ImGui internals: windows, draw
 * commands, various internal state, etc.
 */
@:native("ImGui_ShowMetricsWindow")
public static function imGuiShowMetricsWindow(ctX: ImGuiContext, ?pOpen: Bool): Bool;
/** No description available */
@:native("ImGui_SliderAngle")
public static function imGuiSliderAngle(ctX: ImGuiContext, label: String, vRad: Float, ?vDegreesMinIn: Float, ?vDegreesMaXIn: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderDouble")
public static function imGuiSliderDouble(ctX: ImGuiContext, label: String, v: Float, vMin: Float, vMaX: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderDouble2")
public static function imGuiSliderDouble2(ctX: ImGuiContext, label: String, v1: Float, v2: Float, vMin: Float, vMaX: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderDouble3")
public static function imGuiSliderDouble3(ctX: ImGuiContext, label: String, v1: Float, v2: Float, v3: Float, vMin: Float, vMaX: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderDouble4")
public static function imGuiSliderDouble4(ctX: ImGuiContext, label: String, v1: Float, v2: Float, v3: Float, v4: Float, vMin: Float, vMaX: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderDoubleN")
public static function imGuiSliderDoubleN(ctX: ImGuiContext, label: String, values: ReaperArray, vMin: Float, vMaX: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/**
 * SliderFlags_ClampOnInput | SliderFlags_ClampZeroRange
 */
@:native("ImGui_SliderFlags_AlwaysClamp")
public static function imGuiSliderFlagsAlwaysClamp(): Int;
/**
 * Clamp value to min/max bounds when input manually with Ctrl+Click.
   By
 * default Ctrl+Click allows going out of bounds.
 */
@:native("ImGui_SliderFlags_ClampOnInput")
public static function imGuiSliderFlagsClampOnInput(): Int;
/**
 * Clamp even if min==max==0. Otherwise due to legacy reason Drag* functions
  
 * don't clamp with those values. When your clamping limits are dynamic you
  
 * almost always want to use it.
 */
@:native("ImGui_SliderFlags_ClampZeroRange")
public static function imGuiSliderFlagsClampZeroRange(): Int;
/**
 * Make the widget logarithmic (linear otherwise).
   Consider using
 * SliderFlags_NoRoundToFormat with this if using a format-string
   with small
 * amount of digits.
 */
@:native("ImGui_SliderFlags_Logarithmic")
public static function imGuiSliderFlagsLogarithmic(): Int;
/**
 * Disable CTRL+Click or Enter key allowing to input text directly into the
 * widget.
 */
@:native("ImGui_SliderFlags_NoInput")
public static function imGuiSliderFlagsNoInput(): Int;
/**
 * Disable rounding underlying value to match precision of the display format
  
 * string (e.g. %.3f values are rounded to those 3 digits).
 */
@:native("ImGui_SliderFlags_NoRoundToFormat")
public static function imGuiSliderFlagsNoRoundToFormat(): Int;
/**
 * Disable keyboard modifiers altering tweak speed.
   Useful if you want to
 * alter tweak speed yourself based on your own logic.
 */
@:native("ImGui_SliderFlags_NoSpeedTweaks")
public static function imGuiSliderFlagsNoSpeedTweaks(): Int;
/** No description available */
@:native("ImGui_SliderFlags_None")
public static function imGuiSliderFlagsNone(): Int;
/**
 * Enable wrapping around from max to min and from min to max.
   Only supported
 * by Drag* functions for now.
 */
@:native("ImGui_SliderFlags_WrapAround")
public static function imGuiSliderFlagsWrapAround(): Int;
/** No description available */
@:native("ImGui_SliderInt")
public static function imGuiSliderInt(ctX: ImGuiContext, label: String, v: Int, vMin: Int, vMaX: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderInt2")
public static function imGuiSliderInt2(ctX: ImGuiContext, label: String, v1: Int, v2: Int, vMin: Int, vMaX: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderInt3")
public static function imGuiSliderInt3(ctX: ImGuiContext, label: String, v1: Int, v2: Int, v3: Int, vMin: Int, vMaX: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_SliderInt4")
public static function imGuiSliderInt4(ctX: ImGuiContext, label: String, v1: Int, v2: Int, v3: Int, v4: Int, vMin: Int, vMaX: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/**
 * Button with StyleVar_FramePadding.y == 0 to easily embed within text.
 */
@:native("ImGui_SmallButton")
public static function imGuiSmallButton(ctX: ImGuiContext, label: String): Bool;
/**
 * Ascending = 0->9, A->Z etc.
 */
@:native("ImGui_SortDirection_Ascending")
public static function imGuiSortDirectionAscending(): Int;
/**
 * Descending = 9->0, Z->A etc.
 */
@:native("ImGui_SortDirection_Descending")
public static function imGuiSortDirectionDescending(): Int;
/** No description available */
@:native("ImGui_SortDirection_None")
public static function imGuiSortDirectionNone(): Int;
/**
 * Add vertical spacing.
 */
@:native("ImGui_Spacing")
public static function imGuiSpacing(ctX: ImGuiContext): Void;
/**
 * Global alpha applies to everything in Dear ImGui.
 */
@:native("ImGui_StyleVar_Alpha")
public static function imGuiStyleVarAlpha(): Int;
/**
 * Alignment of button text when button is larger than text.
   Defaults to
 * (0.5, 0.5) (centered).
 */
@:native("ImGui_StyleVar_ButtonTextAlign")
public static function imGuiStyleVarButtonTextAlign(): Int;
/**
 * Padding within a table cell.
   CellPadding.x is locked for entire table.
  
 * CellPadding.y may be altered between different rows.
 */
@:native("ImGui_StyleVar_CellPadding")
public static function imGuiStyleVarCellPadding(): Int;
/**
 * Thickness of border around child windows. Generally set to 0.0 or 1.0.
  
 * (Other values are not well tested and more CPU/GPU costly).
 */
@:native("ImGui_StyleVar_ChildBorderSize")
public static function imGuiStyleVarChildBorderSize(): Int;
/**
 * Radius of child window corners rounding. Set to 0.0 to have rectangular
 * windows.
 */
@:native("ImGui_StyleVar_ChildRounding")
public static function imGuiStyleVarChildRounding(): Int;
/**
 * Additional alpha multiplier applied by BeginDisabled.
  Multiply over current
 * value of Alpha.
 */
@:native("ImGui_StyleVar_DisabledAlpha")
public static function imGuiStyleVarDisabledAlpha(): Int;
/**
 * Thickness of border around frames. Generally set to 0.0 or 1.0.
   (Other
 * values are not well tested and more CPU/GPU costly).
 */
@:native("ImGui_StyleVar_FrameBorderSize")
public static function imGuiStyleVarFrameBorderSize(): Int;
/**
 * Padding within a framed rectangle (used by most widgets).
 */
@:native("ImGui_StyleVar_FramePadding")
public static function imGuiStyleVarFramePadding(): Int;
/**
 * Radius of frame corners rounding.
   Set to 0.0 to have rectangular frame
 * (used by most widgets).
 */
@:native("ImGui_StyleVar_FrameRounding")
public static function imGuiStyleVarFrameRounding(): Int;
/**
 * Minimum width/height of a grab box for slider/scrollbar.
 */
@:native("ImGui_StyleVar_GrabMinSize")
public static function imGuiStyleVarGrabMinSize(): Int;
/**
 * Radius of grabs corners rounding. Set to 0.0 to have rectangular slider
 * grabs.
 */
@:native("ImGui_StyleVar_GrabRounding")
public static function imGuiStyleVarGrabRounding(): Int;
/**
 * Thickness of border around Image calls.
 */
@:native("ImGui_StyleVar_ImageBorderSize")
public static function imGuiStyleVarImageBorderSize(): Int;
/**
 * Horizontal indentation when e.g. entering a tree node.
   Generally ==
 * (GetFontSize + StyleVar_FramePadding.x*2).
 */
@:native("ImGui_StyleVar_IndentSpacing")
public static function imGuiStyleVarIndentSpacing(): Int;
/**
 * Horizontal and vertical spacing between within elements of a composed widget

 * (e.g. a slider and its label).
 */
@:native("ImGui_StyleVar_ItemInnerSpacing")
public static function imGuiStyleVarItemInnerSpacing(): Int;
/**
 * Horizontal and vertical spacing between widgets/lines.
 */
@:native("ImGui_StyleVar_ItemSpacing")
public static function imGuiStyleVarItemSpacing(): Int;
/**
 * Thickness of border around popup/tooltip windows. Generally set to 0.0 or
 * 1.0.
   (Other values are not well tested and more CPU/GPU costly).
 */
@:native("ImGui_StyleVar_PopupBorderSize")
public static function imGuiStyleVarPopupBorderSize(): Int;
/**
 * Radius of popup window corners rounding.
   (Note that tooltip windows use
 * StyleVar_WindowRounding.)
 */
@:native("ImGui_StyleVar_PopupRounding")
public static function imGuiStyleVarPopupRounding(): Int;
/**
 * Radius of grab corners for scrollbar.
 */
@:native("ImGui_StyleVar_ScrollbarRounding")
public static function imGuiStyleVarScrollbarRounding(): Int;
/**
 * Width of the vertical scrollbar, Height of the horizontal scrollbar.
 */
@:native("ImGui_StyleVar_ScrollbarSize")
public static function imGuiStyleVarScrollbarSize(): Int;
/**
 * Alignment of selectable text. Defaults to (0.0, 0.0) (top-left aligned).
  
 * It's generally important to keep this left-aligned if you want to lay
  
 * multiple items on a same line.
 */
@:native("ImGui_StyleVar_SelectableTextAlign")
public static function imGuiStyleVarSelectableTextAlign(): Int;
/**
 * Alignment of text within the separator.
Defaults to (0.0, 0.5) (left aligned,
 * center).
 */
@:native("ImGui_StyleVar_SeparatorTextAlign")
public static function imGuiStyleVarSeparatorTextAlign(): Int;
/**
 * Thickness of border in SeparatorText()
 */
@:native("ImGui_StyleVar_SeparatorTextBorderSize")
public static function imGuiStyleVarSeparatorTextBorderSize(): Int;
/**
 * Horizontal offset of text from each edge of the separator + spacing on
 * other
axis. Generally small values. .y is recommended to be ==
 * StyleVar_FramePadding.y.
 */
@:native("ImGui_StyleVar_SeparatorTextPadding")
public static function imGuiStyleVarSeparatorTextPadding(): Int;
/**
 * Thickness of tab-bar separator, which takes on the tab active color to denote
 * focus.
 */
@:native("ImGui_StyleVar_TabBarBorderSize")
public static function imGuiStyleVarTabBarBorderSize(): Int;
/**
 * Thickness of tab-bar overline, which highlights the selected tab-bar.
 */
@:native("ImGui_StyleVar_TabBarOverlineSize")
public static function imGuiStyleVarTabBarOverlineSize(): Int;
/**
 * Thickness of border around tabs.
 */
@:native("ImGui_StyleVar_TabBorderSize")
public static function imGuiStyleVarTabBorderSize(): Int;
/**
 * Radius of upper corners of a tab. Set to 0.0 to have rectangular tabs.
 */
@:native("ImGui_StyleVar_TabRounding")
public static function imGuiStyleVarTabRounding(): Int;
/**
 * Angle of angled headers (supported values range from -50.0 degrees to +50.0
 * degrees).
 */
@:native("ImGui_StyleVar_TableAngledHeadersAngle")
public static function imGuiStyleVarTableAngledHeadersAngle(): Int;
/**
 * Alignment of angled headers within the cell
 */
@:native("ImGui_StyleVar_TableAngledHeadersTextAlign")
public static function imGuiStyleVarTableAngledHeadersTextAlign(): Int;
/**
 * Radius of lines connecting child nodes to the vertical line.
 */
@:native("ImGui_StyleVar_TreeLinesRounding")
public static function imGuiStyleVarTreeLinesRounding(): Int;
/**
 * Thickness of outlines when using TreeNodeFlags_DrawLines.
 */
@:native("ImGui_StyleVar_TreeLinesSize")
public static function imGuiStyleVarTreeLinesSize(): Int;
/**
 * Thickness of border around windows. Generally set to 0.0 or 1.0.
  (Other
 * values are not well tested and more CPU/GPU costly).
 */
@:native("ImGui_StyleVar_WindowBorderSize")
public static function imGuiStyleVarWindowBorderSize(): Int;
/**
 * Minimum window size. This is a global setting.
  If you want to constrain
 * individual windows, use SetNextWindowSizeConstraints.
 */
@:native("ImGui_StyleVar_WindowMinSize")
public static function imGuiStyleVarWindowMinSize(): Int;
/**
 * Padding within a window.
 */
@:native("ImGui_StyleVar_WindowPadding")
public static function imGuiStyleVarWindowPadding(): Int;
/**
 * Radius of window corners rounding. Set to 0.0 to have rectangular windows.
 
 * Large values tend to lead to variety of artifacts and are not recommended.
 */
@:native("ImGui_StyleVar_WindowRounding")
public static function imGuiStyleVarWindowRounding(): Int;
/**
 * Alignment for title bar text.
   Defaults to (0.0,0.5) for
 * left-aligned,vertically centered.
 */
@:native("ImGui_StyleVar_WindowTitleAlign")
public static function imGuiStyleVarWindowTitleAlign(): Int;
/**
 * Automatically select new tabs when they appear.
 */
@:native("ImGui_TabBarFlags_AutoSelectNewTabs")
public static function imGuiTabBarFlagsAutoSelectNewTabs(): Int;
/**
 * Draw selected overline markers over selected tab
 */
@:native("ImGui_TabBarFlags_DrawSelectedOverline")
public static function imGuiTabBarFlagsDrawSelectedOverline(): Int;
/**
 * Resize tabs when they don't fit.
 */
@:native("ImGui_TabBarFlags_FittingPolicyResizeDown")
public static function imGuiTabBarFlagsFittingPolicyResizeDown(): Int;
/**
 * Add scroll buttons when tabs don't fit.
 */
@:native("ImGui_TabBarFlags_FittingPolicyScroll")
public static function imGuiTabBarFlagsFittingPolicyScroll(): Int;
/**
 * Disable behavior of closing tabs (that are submitted with p_open != nil)
  
 * with middle mouse button. You may handle this behavior manually on user's
  
 * side with if(IsItemHovered() && IsMouseClicked(2)) p_open = false.
 */
@:native("ImGui_TabBarFlags_NoCloseWithMiddleMouseButton")
public static function imGuiTabBarFlagsNoCloseWithMiddleMouseButton(): Int;
/**
 * Disable scrolling buttons (apply when fitting policy is
  
 * TabBarFlags_FittingPolicyScroll).
 */
@:native("ImGui_TabBarFlags_NoTabListScrollingButtons")
public static function imGuiTabBarFlagsNoTabListScrollingButtons(): Int;
/**
 * Disable tooltips when hovering a tab.
 */
@:native("ImGui_TabBarFlags_NoTooltip")
public static function imGuiTabBarFlagsNoTooltip(): Int;
/** No description available */
@:native("ImGui_TabBarFlags_None")
public static function imGuiTabBarFlagsNone(): Int;
/**
 * Allow manually dragging tabs to re-order them + New tabs are appended at
  
 * the end of list.
 */
@:native("ImGui_TabBarFlags_Reorderable")
public static function imGuiTabBarFlagsReorderable(): Int;
/**
 * Disable buttons to open the tab list popup.
 */
@:native("ImGui_TabBarFlags_TabListPopupButton")
public static function imGuiTabBarFlagsTabListPopupButton(): Int;
/**
 * Create a Tab behaving like a button. Return true when clicked.
Cannot be
 * selected in the tab bar.
 */
@:native("ImGui_TabItemButton")
public static function imGuiTabItemButton(ctX: ImGuiContext, label: String, ?flagsIn: Int): Bool;
/**
 * Enforce the tab position to the left of the tab bar (after the tab list popup
 * button).
 */
@:native("ImGui_TabItemFlags_Leading")
public static function imGuiTabItemFlagsLeading(): Int;
/**
 * Tab is selected when trying to close + closure is not immediately assumed
  
 * (will wait for user to stop submitting the tab).
   Otherwise closure is
 * assumed when pressing the X, so if you keep submitting
   the tab may
 * reappear at end of tab bar.
 */
@:native("ImGui_TabItemFlags_NoAssumedClosure")
public static function imGuiTabItemFlagsNoAssumedClosure(): Int;
/**
 * Disable behavior of closing tabs (that are submitted with p_open != nil)
 * with
   middle mouse button. You can still repro this behavior on user's side
 * with
   if(IsItemHovered() && IsMouseClicked(2)) p_open = false.
 */
@:native("ImGui_TabItemFlags_NoCloseWithMiddleMouseButton")
public static function imGuiTabItemFlagsNoCloseWithMiddleMouseButton(): Int;
/**
 * Don't call PushID()/PopID() on BeginTabItem/EndTabItem.
 */
@:native("ImGui_TabItemFlags_NoPushId")
public static function imGuiTabItemFlagsNoPushId(): Int;
/**
 * Disable reordering this tab or having another tab cross over this tab.
 */
@:native("ImGui_TabItemFlags_NoReorder")
public static function imGuiTabItemFlagsNoReorder(): Int;
/**
 * Disable tooltip for the given tab.
 */
@:native("ImGui_TabItemFlags_NoTooltip")
public static function imGuiTabItemFlagsNoTooltip(): Int;
/** No description available */
@:native("ImGui_TabItemFlags_None")
public static function imGuiTabItemFlagsNone(): Int;
/**
 * Trigger flag to programmatically make the tab selected when calling
 * BeginTabItem.
 */
@:native("ImGui_TabItemFlags_SetSelected")
public static function imGuiTabItemFlagsSetSelected(): Int;
/**
 * Enforce the tab position to the right of the tab bar (before the scrolling
 * buttons).
 */
@:native("ImGui_TabItemFlags_Trailing")
public static function imGuiTabItemFlagsTrailing(): Int;
/**
 * Display a dot next to the title + set TabItemFlags_NoAssumedClosure.
 */
@:native("ImGui_TabItemFlags_UnsavedDocument")
public static function imGuiTabItemFlagsUnsavedDocument(): Int;
/**
 * Submit a row with angled headers for every column with
 * the
TableColumnFlags_AngledHeader flag. Must be the first row.
 */
@:native("ImGui_TableAngledHeadersRow")
public static function imGuiTableAngledHeadersRow(ctX: ImGuiContext): Void;
/**
 * Set cell background color (top-most color).
 */
@:native("ImGui_TableBgTarget_CellBg")
public static function imGuiTableBgTargetCellBg(): Int;
/** No description available */
@:native("ImGui_TableBgTarget_None")
public static function imGuiTableBgTargetNone(): Int;
/**
 * Set row background color 0 (generally used for background,
   automatically
 * set when TableFlags_RowBg is used).
 */
@:native("ImGui_TableBgTarget_RowBg0")
public static function imGuiTableBgTargetRowBg0(): Int;
/**
 * Set row background color 1 (generally used for selection marking).
 */
@:native("ImGui_TableBgTarget_RowBg1")
public static function imGuiTableBgTargetRowBg1(): Int;
/**
 * TableHeadersRow will submit an angled header row for this column.
   Note
 * this will add an extra row.
 */
@:native("ImGui_TableColumnFlags_AngledHeader")
public static function imGuiTableColumnFlagsAngledHeader(): Int;
/**
 * Default as a hidden/disabled column.
 */
@:native("ImGui_TableColumnFlags_DefaultHide")
public static function imGuiTableColumnFlagsDefaultHide(): Int;
/**
 * Default as a sorting column.
 */
@:native("ImGui_TableColumnFlags_DefaultSort")
public static function imGuiTableColumnFlagsDefaultSort(): Int;
/**
 * Overriding/master disable flag: hide column, won't show in context menu
  
 * (unlike calling TableSetColumnEnabled which manipulates the user accessible
 * state).
 */
@:native("ImGui_TableColumnFlags_Disabled")
public static function imGuiTableColumnFlagsDisabled(): Int;
/**
 * Ignore current Indent value when entering cell (default for columns > 0).
  
 * Indentation changes _within_ the cell will still be honored.
 */
@:native("ImGui_TableColumnFlags_IndentDisable")
public static function imGuiTableColumnFlagsIndentDisable(): Int;
/**
 * Use current Indent value when entering cell (default for column 0).
 */
@:native("ImGui_TableColumnFlags_IndentEnable")
public static function imGuiTableColumnFlagsIndentEnable(): Int;
/**
 * Status: is enabled == not hidden by user/api (referred to as "Hide" in
  
 * _DefaultHide and _NoHide) flags.
 */
@:native("ImGui_TableColumnFlags_IsEnabled")
public static function imGuiTableColumnFlagsIsEnabled(): Int;
/**
 * Status: is hovered by mouse.
 */
@:native("ImGui_TableColumnFlags_IsHovered")
public static function imGuiTableColumnFlagsIsHovered(): Int;
/**
 * Status: is currently part of the sort specs.
 */
@:native("ImGui_TableColumnFlags_IsSorted")
public static function imGuiTableColumnFlagsIsSorted(): Int;
/**
 * Status: is visible == is enabled AND not clipped by scrolling.
 */
@:native("ImGui_TableColumnFlags_IsVisible")
public static function imGuiTableColumnFlagsIsVisible(): Int;
/**
 * Disable clipping for this column
   (all NoClip columns will render in a same
 * draw command).
 */
@:native("ImGui_TableColumnFlags_NoClip")
public static function imGuiTableColumnFlagsNoClip(): Int;
/**
 * TableHeadersRow will submit an empty label for this column.
   Convenient for
 * some small columns.
   Name will still appear in context menu or in angled
 * headers.
   You may append into this cell by calling TableSetColumnIndex
 * right after
   the TableHeadersRow call.
 */
@:native("ImGui_TableColumnFlags_NoHeaderLabel")
public static function imGuiTableColumnFlagsNoHeaderLabel(): Int;
/**
 * Disable header text width contribution to automatic column width.
 */
@:native("ImGui_TableColumnFlags_NoHeaderWidth")
public static function imGuiTableColumnFlagsNoHeaderWidth(): Int;
/**
 * Disable ability to hide/disable this column.
 */
@:native("ImGui_TableColumnFlags_NoHide")
public static function imGuiTableColumnFlagsNoHide(): Int;
/**
 * Disable manual reordering this column, this will also prevent other columns
 
 * from crossing over this column.
 */
@:native("ImGui_TableColumnFlags_NoReorder")
public static function imGuiTableColumnFlagsNoReorder(): Int;
/**
 * Disable manual resizing.
 */
@:native("ImGui_TableColumnFlags_NoResize")
public static function imGuiTableColumnFlagsNoResize(): Int;
/**
 * Disable ability to sort on this field
   (even if TableFlags_Sortable is set
 * on the table).
 */
@:native("ImGui_TableColumnFlags_NoSort")
public static function imGuiTableColumnFlagsNoSort(): Int;
/**
 * Disable ability to sort in the ascending direction.
 */
@:native("ImGui_TableColumnFlags_NoSortAscending")
public static function imGuiTableColumnFlagsNoSortAscending(): Int;
/**
 * Disable ability to sort in the descending direction.
 */
@:native("ImGui_TableColumnFlags_NoSortDescending")
public static function imGuiTableColumnFlagsNoSortDescending(): Int;
/** No description available */
@:native("ImGui_TableColumnFlags_None")
public static function imGuiTableColumnFlagsNone(): Int;
/**
 * Make the initial sort direction Ascending when first sorting on this column
 * (default).
 */
@:native("ImGui_TableColumnFlags_PreferSortAscending")
public static function imGuiTableColumnFlagsPreferSortAscending(): Int;
/**
 * Make the initial sort direction Descending when first sorting on this column.
 */
@:native("ImGui_TableColumnFlags_PreferSortDescending")
public static function imGuiTableColumnFlagsPreferSortDescending(): Int;
/**
 * Column will not stretch. Preferable with horizontal scrolling enabled
  
 * (default if table sizing policy is _SizingFixedFit and table is resizable).
 */
@:native("ImGui_TableColumnFlags_WidthFixed")
public static function imGuiTableColumnFlagsWidthFixed(): Int;
/**
 * Column will stretch. Preferable with horizontal scrolling disabled
  
 * (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).
 */
@:native("ImGui_TableColumnFlags_WidthStretch")
public static function imGuiTableColumnFlagsWidthStretch(): Int;
/**
 * Draw all borders.
 */
@:native("ImGui_TableFlags_Borders")
public static function imGuiTableFlagsBorders(): Int;
/**
 * Draw horizontal borders.
 */
@:native("ImGui_TableFlags_BordersH")
public static function imGuiTableFlagsBordersH(): Int;
/**
 * Draw inner borders.
 */
@:native("ImGui_TableFlags_BordersInner")
public static function imGuiTableFlagsBordersInner(): Int;
/**
 * Draw horizontal borders between rows.
 */
@:native("ImGui_TableFlags_BordersInnerH")
public static function imGuiTableFlagsBordersInnerH(): Int;
/**
 * Draw vertical borders between columns.
 */
@:native("ImGui_TableFlags_BordersInnerV")
public static function imGuiTableFlagsBordersInnerV(): Int;
/**
 * Draw outer borders.
 */
@:native("ImGui_TableFlags_BordersOuter")
public static function imGuiTableFlagsBordersOuter(): Int;
/**
 * Draw horizontal borders at the top and bottom.
 */
@:native("ImGui_TableFlags_BordersOuterH")
public static function imGuiTableFlagsBordersOuterH(): Int;
/**
 * Draw vertical borders on the left and right sides.
 */
@:native("ImGui_TableFlags_BordersOuterV")
public static function imGuiTableFlagsBordersOuterV(): Int;
/**
 * Draw vertical borders.
 */
@:native("ImGui_TableFlags_BordersV")
public static function imGuiTableFlagsBordersV(): Int;
/**
 * Right-click on columns body/contents will display table context menu.
   By
 * default it is available in TableHeadersRow.
 */
@:native("ImGui_TableFlags_ContextMenuInBody")
public static function imGuiTableFlagsContextMenuInBody(): Int;
/**
 * Enable hiding/disabling columns in context menu.
 */
@:native("ImGui_TableFlags_Hideable")
public static function imGuiTableFlagsHideable(): Int;
/**
 * Highlight column headers when hovered (may evolve into a fuller highlight.)
 */
@:native("ImGui_TableFlags_HighlightHoveredColumn")
public static function imGuiTableFlagsHighlightHoveredColumn(): Int;
/**
 * Disable clipping rectangle for every individual columns
   (reduce draw
 * command count, items will be able to overflow into other columns).
  
 * Generally incompatible with TableSetupScrollFreeze.
 */
@:native("ImGui_TableFlags_NoClip")
public static function imGuiTableFlagsNoClip(): Int;
/**
 * Make outer width auto-fit to columns, overriding outer_size.x value. Only
  
 * available when ScrollX/ScrollY are disabled and Stretch columns are not used.
 */
@:native("ImGui_TableFlags_NoHostExtendX")
public static function imGuiTableFlagsNoHostExtendX(): Int;
/**
 * Make outer height stop exactly at outer_size.y (prevent auto-extending table

 * past the limit). Only available when ScrollX/ScrollY are disabled.
   Data
 * below the limit will be clipped and not visible.
 */
@:native("ImGui_TableFlags_NoHostExtendY")
public static function imGuiTableFlagsNoHostExtendY(): Int;
/**
 * Disable keeping column always minimally visible when ScrollX is off and
 * table
   gets too small. Not recommended if columns are resizable.
 */
@:native("ImGui_TableFlags_NoKeepColumnsVisible")
public static function imGuiTableFlagsNoKeepColumnsVisible(): Int;
/**
 * Disable inner padding between columns (double inner padding if
  
 * TableFlags_BordersOuterV is on, single inner padding if BordersOuterV is
 * off).
 */
@:native("ImGui_TableFlags_NoPadInnerX")
public static function imGuiTableFlagsNoPadInnerX(): Int;
/**
 * Default if TableFlags_BordersOuterV is off. Disable outermost padding.
 */
@:native("ImGui_TableFlags_NoPadOuterX")
public static function imGuiTableFlagsNoPadOuterX(): Int;
/**
 * Disable persisting columns order, width and sort settings in the .ini file.
 */
@:native("ImGui_TableFlags_NoSavedSettings")
public static function imGuiTableFlagsNoSavedSettings(): Int;
/** No description available */
@:native("ImGui_TableFlags_None")
public static function imGuiTableFlagsNone(): Int;
/**
 * Default if TableFlags_BordersOuterV is on. Enable outermost padding.
  
 * Generally desirable if you have headers.
 */
@:native("ImGui_TableFlags_PadOuterX")
public static function imGuiTableFlagsPadOuterX(): Int;
/**
 * Disable distributing remainder width to stretched columns (width allocation
 
 * on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this
  
 * flag: 33,33,33).
   With larger number of columns, resizing will appear to be
 * less smooth.
 */
@:native("ImGui_TableFlags_PreciseWidths")
public static function imGuiTableFlagsPreciseWidths(): Int;
/**
 * Enable reordering columns in header row
   (need calling TableSetupColumn +
 * TableHeadersRow to display headers).
 */
@:native("ImGui_TableFlags_Reorderable")
public static function imGuiTableFlagsReorderable(): Int;
/**
 * Enable resizing columns.
 */
@:native("ImGui_TableFlags_Resizable")
public static function imGuiTableFlagsResizable(): Int;
/**
 * Set each RowBg color with Col_TableRowBg or Col_TableRowBgAlt (equivalent of

 * calling TableSetBgColor with TableBgTarget_RowBg0 on each row manually).
 */
@:native("ImGui_TableFlags_RowBg")
public static function imGuiTableFlagsRowBg(): Int;
/**
 * Enable horizontal scrolling. Require 'outer_size' parameter of BeginTable to

 * specify the container size. Changes default sizing policy.
   Because this
 * creates a child window, ScrollY is currently generally
   recommended when
 * using ScrollX.
 */
@:native("ImGui_TableFlags_ScrollX")
public static function imGuiTableFlagsScrollX(): Int;
/**
 * Enable vertical scrolling.
   Require 'outer_size' parameter of BeginTable to
 * specify the container size.
 */
@:native("ImGui_TableFlags_ScrollY")
public static function imGuiTableFlagsScrollY(): Int;
/**
 * Columns default to _WidthFixed or _WidthAuto (if resizable or not
 * resizable),
   matching contents width.
 */
@:native("ImGui_TableFlags_SizingFixedFit")
public static function imGuiTableFlagsSizingFixedFit(): Int;
/**
 * Columns default to _WidthFixed or _WidthAuto (if resizable or not
 * resizable),
   matching the maximum contents width of all columns.
  
 * Implicitly enable TableFlags_NoKeepColumnsVisible.
 */
@:native("ImGui_TableFlags_SizingFixedSame")
public static function imGuiTableFlagsSizingFixedSame(): Int;
/**
 * Columns default to _WidthStretch with default weights proportional to each
  
 * columns contents widths.
 */
@:native("ImGui_TableFlags_SizingStretchProp")
public static function imGuiTableFlagsSizingStretchProp(): Int;
/**
 * Columns default to _WidthStretch with default weights all equal,
   unless
 * overriden by TableSetupColumn.
 */
@:native("ImGui_TableFlags_SizingStretchSame")
public static function imGuiTableFlagsSizingStretchSame(): Int;
/**
 * Hold shift when clicking headers to sort on multiple column.
  
 * TableGetColumnSortSpecs may return specs where (SpecsCount > 1).
 */
@:native("ImGui_TableFlags_SortMulti")
public static function imGuiTableFlagsSortMulti(): Int;
/**
 * Allow no sorting, disable default sorting.
   TableGetColumnSortSpecs may
 * return specs where (SpecsCount == 0).
 */
@:native("ImGui_TableFlags_SortTristate")
public static function imGuiTableFlagsSortTristate(): Int;
/**
 * Enable sorting. Call TableNeedSort/TableGetColumnSortSpecs to obtain sort
 * specs.
   Also see TableFlags_SortMulti and TableFlags_SortTristate.
 */
@:native("ImGui_TableFlags_Sortable")
public static function imGuiTableFlagsSortable(): Int;
/**
 * Return number of columns (value passed to BeginTable).
 */
@:native("ImGui_TableGetColumnCount")
public static function imGuiTableGetColumnCount(ctX: ImGuiContext): Int;
/**
 * Return column flags so you can query their
 * Enabled/Visible/Sorted/Hovered
status flags. Pass -1 to use current column.
 */
@:native("ImGui_TableGetColumnFlags")
public static function imGuiTableGetColumnFlags(ctX: ImGuiContext, ?columnNIn: Int): Int;
/**
 * Return current column index.
 */
@:native("ImGui_TableGetColumnIndex")
public static function imGuiTableGetColumnIndex(ctX: ImGuiContext): Int;
/**
 * Return "" if column didn't have a name declared by TableSetupColumn.
Pass -1
 * to use current column.
 */
@:native("ImGui_TableGetColumnName")
public static function imGuiTableGetColumnName(ctX: ImGuiContext, ?columnNIn: Int): String;
/**
 * Sorting specification for one column of a table.
Call while incrementing 'id'
 * from 0 until false is returned.
- id:             Index of the sorting
 * specification (always stored in order
  starting from 0, tables sorted on a
 * single criteria will always have a 0 here)
- column_index:   Index of the
 * column
- column_user_id: User ID of the column (if specified by a
 * TableSetupColumn call)
- sort_direction: SortDirection_Ascending or
 * SortDirection_Descending
See TableNeedSort.
 */
@:native("ImGui_TableGetColumnSortSpecs")
public static function imGuiTableGetColumnSortSpecs(ctX: ImGuiContext, id: Int): Bool;
/**
 * Returns hovered column or -1 when table is not hovered. Returns
 * columns_count
if the unused space at the right of visible columns is
 * hovered.
Can also use (TableGetColumnFlags() & TableColumnFlags_IsHovered)
 * instead.
 */
@:native("ImGui_TableGetHoveredColumn")
public static function imGuiTableGetHoveredColumn(ctX: ImGuiContext): Int;
/**
 * Return current row index.
 */
@:native("ImGui_TableGetRowIndex")
public static function imGuiTableGetRowIndex(ctX: ImGuiContext): Int;
/**
 * Submit one header cell manually (rarely used). See TableSetupColumn.
 */
@:native("ImGui_TableHeader")
public static function imGuiTableHeader(ctX: ImGuiContext, label: String): Void;
/**
 * Submit a row with headers cells based on data provided to TableSetupColumn
+
 * submit context menu.
 */
@:native("ImGui_TableHeadersRow")
public static function imGuiTableHeadersRow(ctX: ImGuiContext): Void;
/**
 * Return true once when sorting specs have changed since last call,
or the
 * first time. 'has_specs' is false when not sorting.
See
 * TableGetColumnSortSpecs.
 */
@:native("ImGui_TableNeedSort")
public static function imGuiTableNeedSort(ctX: ImGuiContext): Bool;
/**
 * Append into the next column (or first column of next row if currently in
last
 * column). Return true when column is visible.
 */
@:native("ImGui_TableNextColumn")
public static function imGuiTableNextColumn(ctX: ImGuiContext): Bool;
/**
 * Append into the first cell of a new row.
 */
@:native("ImGui_TableNextRow")
public static function imGuiTableNextRow(ctX: ImGuiContext, ?roWFlagsIn: Int, ?minRoWHeigHtIn: Float): Void;
/**
 * Identify header row (set default background color + width of its contents
  
 * accounted different for auto column width).
 */
@:native("ImGui_TableRowFlags_Headers")
public static function imGuiTableRowFlagsHeaders(): Int;
/**
 * For TableNextRow.
 */
@:native("ImGui_TableRowFlags_None")
public static function imGuiTableRowFlagsNone(): Int;
/**
 * Change the color of a cell, row, or column.
See TableBgTarget_* flags for
 * details.
 */
@:native("ImGui_TableSetBgColor")
public static function imGuiTableSetBgColor(ctX: ImGuiContext, target: Int, colorRgba: Int, ?columnNIn: Int): Void;
/**
 * Change user-accessible enabled/disabled state of a column, set to false
 * to
hide the column. Note that end-user can use the context menu to change
 * this
themselves (right-click in headers, or right-click in columns body
 * with
TableFlags_ContextMenuInBody).
- Require table to have the
 * TableFlags_Hideable flag because we are manipulating
  user accessible
 * state.
- Request will be applied during next layout, which happens on the
 * first call to
  TableNextRow after Begin_Table.
- For the getter you can
 * test
  (TableGetColumnFlags() & TableColumnFlags_IsEnabled) != 0.
 */
@:native("ImGui_TableSetColumnEnabled")
public static function imGuiTableSetColumnEnabled(ctX: ImGuiContext, columnN: Int, v: Bool): Void;
/**
 * Append into the specified column. Return true when column is visible.
 */
@:native("ImGui_TableSetColumnIndex")
public static function imGuiTableSetColumnIndex(ctX: ImGuiContext, columnN: Int): Bool;
/**
 * Use to specify label, resizing policy, default width/weight, id,
various
 * other flags etc.
 */
@:native("ImGui_TableSetupColumn")
public static function imGuiTableSetupColumn(ctX: ImGuiContext, label: String, ?flagsIn: Int, ?initWIdtHOrWeigHtIn: Float, ?userIdIn: Int): Void;
/**
 * Lock columns/rows so they stay visible when scrolled.
 */
@:native("ImGui_TableSetupScrollFreeze")
public static function imGuiTableSetupScrollFreeze(ctX: ImGuiContext, cols: Int, roWs: Int): Void;
/** No description available */
@:native("ImGui_Text")
public static function imGuiText(ctX: ImGuiContext, teXt: String): Void;
/**
 * Shortcut for PushStyleColor(Col_Text, color); Text(text); PopStyleColor();
 */
@:native("ImGui_TextColored")
public static function imGuiTextColored(ctX: ImGuiContext, colRgba: Int, teXt: String): Void;
/** No description available */
@:native("ImGui_TextDisabled")
public static function imGuiTextDisabled(ctX: ImGuiContext, teXt: String): Void;
/** No description available */
@:native("ImGui_TextFilter_Clear")
public static function imGuiTextFilterClear(filter: ImGuiTextFilter): Void;
/**
 * Helper calling InputText+TextFilter_Set
 */
@:native("ImGui_TextFilter_Draw")
public static function imGuiTextFilterDraw(filter: ImGuiTextFilter, ctX: ImGuiContext, ?labelIn: String, ?wIdtHIn: Float): Bool;
/** No description available */
@:native("ImGui_TextFilter_Get")
public static function imGuiTextFilterGet(filter: ImGuiTextFilter): String;
/** No description available */
@:native("ImGui_TextFilter_IsActive")
public static function imGuiTextFilterIsActive(filter: ImGuiTextFilter): Bool;
/** No description available */
@:native("ImGui_TextFilter_PassFilter")
public static function imGuiTextFilterPassFilter(filter: ImGuiTextFilter, teXt: String): Bool;
/** No description available */
@:native("ImGui_TextFilter_Set")
public static function imGuiTextFilterSet(filter: ImGuiTextFilter, filterTeXt: String): Void;
/**
 * Hyperlink text button, returns true when clicked.
 */
@:native("ImGui_TextLink")
public static function imGuiTextLink(ctX: ImGuiContext, label: String): Bool;
/**
 * Hyperlink text button, automatically open file/url when clicked
 */
@:native("ImGui_TextLinkOpenURL")
public static function imGuiTextLinkOpenUrl(ctX: ImGuiContext, label: String, ?urlIn: String): Bool;
/**
 * Shortcut for PushTextWrapPos(0.0); Text(text); PopTextWrapPos();.
Note that
 * this won't work on an auto-resizing window if there's no other
widgets to
 * extend the window width, yoy may need to set a size using
SetNextWindowSize.
 */
@:native("ImGui_TextWrapped")
public static function imGuiTextWrapped(ctX: ImGuiContext, teXt: String): Void;
/**
 * TreeNode functions return true when the node is open, in which case you
 * need
to also call TreePop when you are finished displaying the tree node
 * contents.
 */
@:native("ImGui_TreeNode")
public static function imGuiTreeNode(ctX: ImGuiContext, label: String, ?flagsIn: Int): Bool;
/**
 * Helper variation to easily decorelate the id from the displayed string.
Read
 * the [FAQ](https://dearimgui.com/faq) about why and how to use ID.
To align
 * arbitrary text at the same level as a TreeNode you can use Bullet.
 */
@:native("ImGui_TreeNodeEx")
public static function imGuiTreeNodeEx(ctX: ImGuiContext, strId: String, label: String, ?flagsIn: Int): Bool;
/**
 * Hit testing to allow subsequent widgets to overlap this one.
 */
@:native("ImGui_TreeNodeFlags_AllowOverlap")
public static function imGuiTreeNodeFlagsAllowOverlap(): Int;
/**
 * Display a bullet instead of arrow. IMPORTANT: node can still be marked
  
 * open/close if you don't set the _Leaf flag!
 */
@:native("ImGui_TreeNodeFlags_Bullet")
public static function imGuiTreeNodeFlagsBullet(): Int;
/**
 * TreeNodeFlags_Framed | TreeNodeFlags_NoTreePushOnOpen |
 * TreeNodeFlags_NoAutoOpenOnLog
 */
@:native("ImGui_TreeNodeFlags_CollapsingHeader")
public static function imGuiTreeNodeFlagsCollapsingHeader(): Int;
/**
 * Default node to be open.
 */
@:native("ImGui_TreeNodeFlags_DefaultOpen")
public static function imGuiTreeNodeFlagsDefaultOpen(): Int;
/**
 * Horizontal lines to child nodes.
   Vertical line drawn down to TreePop()
 * position: cover full contents.
   Faster (for large trees).
 */
@:native("ImGui_TreeNodeFlags_DrawLinesFull")
public static function imGuiTreeNodeFlagsDrawLinesFull(): Int;
/**
 * No lines drawn
 */
@:native("ImGui_TreeNodeFlags_DrawLinesNone")
public static function imGuiTreeNodeFlagsDrawLinesNone(): Int;
/**
 * Horizontal lines to child nodes.
   Vertical line drawn down to bottom-most
 * child node.
   Slower (for large trees).
 */
@:native("ImGui_TreeNodeFlags_DrawLinesToNodes")
public static function imGuiTreeNodeFlagsDrawLinesToNodes(): Int;
/**
 * Use FramePadding (even for an unframed text node) to vertically align text
  
 * baseline to regular widget height.
   Equivalent to calling
 * AlignTextToFramePadding before the node.
 */
@:native("ImGui_TreeNodeFlags_FramePadding")
public static function imGuiTreeNodeFlagsFramePadding(): Int;
/**
 * Draw frame with background (e.g. for CollapsingHeader).
 */
@:native("ImGui_TreeNodeFlags_Framed")
public static function imGuiTreeNodeFlagsFramed(): Int;
/**
 * Label will span all columns of its container table
 */
@:native("ImGui_TreeNodeFlags_LabelSpanAllColumns")
public static function imGuiTreeNodeFlagsLabelSpanAllColumns(): Int;
/**
 * No collapsing, no arrow (use as a convenience for leaf nodes).
 */
@:native("ImGui_TreeNodeFlags_Leaf")
public static function imGuiTreeNodeFlagsLeaf(): Int;
/**
 * Nav: left arrow moves back to parent. This is processed in TreePop when
  
 * there's an unfullfilled Left nav request remaining.
 */
@:native("ImGui_TreeNodeFlags_NavLeftJumpsToParent")
public static function imGuiTreeNodeFlagsNavLeftJumpsToParent(): Int;
/**
 * Don't automatically and temporarily open node when Logging is active
   (by
 * default logging will automatically open tree nodes).
 */
@:native("ImGui_TreeNodeFlags_NoAutoOpenOnLog")
public static function imGuiTreeNodeFlagsNoAutoOpenOnLog(): Int;
/**
 * Don't do a TreePush when open (e.g. for CollapsingHeader)
   = no extra
 * indent nor pushing on ID stack.
 */
@:native("ImGui_TreeNodeFlags_NoTreePushOnOpen")
public static function imGuiTreeNodeFlagsNoTreePushOnOpen(): Int;
/** No description available */
@:native("ImGui_TreeNodeFlags_None")
public static function imGuiTreeNodeFlagsNone(): Int;
/**
 * Open when clicking on the arrow part (default for multi-select unless any
  
 * _OpenOnXXX behavior is set explicitly). Both behaviors may be combined.
 */
@:native("ImGui_TreeNodeFlags_OpenOnArrow")
public static function imGuiTreeNodeFlagsOpenOnArrow(): Int;
/**
 * Open on double-click instead of simple click (default for multi-select
 * unless
   any _OpenOnXXX behavior is set explicitly). Both behaviors may be
 * combined.
 */
@:native("ImGui_TreeNodeFlags_OpenOnDoubleClick")
public static function imGuiTreeNodeFlagsOpenOnDoubleClick(): Int;
/**
 * Draw as selected.
 */
@:native("ImGui_TreeNodeFlags_Selected")
public static function imGuiTreeNodeFlagsSelected(): Int;
/**
 * Frame will span all columns of its container table (label will still fit in
 * current column).
 */
@:native("ImGui_TreeNodeFlags_SpanAllColumns")
public static function imGuiTreeNodeFlagsSpanAllColumns(): Int;
/**
 * Extend hit box to the right-most edge, even if not framed.
   This is not the
 * default in order to allow adding other items on the same line.
   In the
 * future we may refactor the hit system to be front-to-back,
   allowing
 * natural overlaps and then this can become the default.
 */
@:native("ImGui_TreeNodeFlags_SpanAvailWidth")
public static function imGuiTreeNodeFlagsSpanAvailWidth(): Int;
/**
 * Extend hit box to the left-most and right-most edges (bypass the indented
 * area).
 */
@:native("ImGui_TreeNodeFlags_SpanFullWidth")
public static function imGuiTreeNodeFlagsSpanFullWidth(): Int;
/**
 * Narrow hit box + narrow hovering highlight, will only cover the label text.
 */
@:native("ImGui_TreeNodeFlags_SpanLabelWidth")
public static function imGuiTreeNodeFlagsSpanLabelWidth(): Int;
/**
 * Unindent()+PopID()
 */
@:native("ImGui_TreePop")
public static function imGuiTreePop(ctX: ImGuiContext): Void;
/**
 * Indent()+PushID(). Already called by TreeNode when returning true,
but you
 * can call TreePush/TreePop yourself if desired.
 */
@:native("ImGui_TreePush")
public static function imGuiTreePush(ctX: ImGuiContext, strId: String): Void;
/**
 * Move content position back to the left, by 'indent_w',
 * or
StyleVar_IndentSpacing if 'indent_w' <= 0
 */
@:native("ImGui_Unindent")
public static function imGuiUnindent(ctX: ImGuiContext, ?indentWIn: Float): Void;
/** No description available */
@:native("ImGui_VSliderDouble")
public static function imGuiVSliderDouble(ctX: ImGuiContext, label: String, sizeW: Float, sizeH: Float, v: Float, vMin: Float, vMaX: Float, ?formatIn: String, ?flagsIn: Int): Bool;
/** No description available */
@:native("ImGui_VSliderInt")
public static function imGuiVSliderInt(ctX: ImGuiContext, label: String, sizeW: Float, sizeH: Float, v: Int, vMin: Int, vMaX: Int, ?formatIn: String, ?flagsIn: Int): Bool;
/**
 * Return whether the given pointer is a valid instance of one of the
 * following
types (indentation represents inheritance):
- ImGui_Context*
-
 * ImGui_DrawList*
- ImGui_DrawListSplitter*
- ImGui_Font*
- ImGui_Function*
-
 * ImGui_Image*
  - ImGui_Bitmap*
  - ImGui_ImageSet*
- ImGui_ListClipper*
-
 * ImGui_TextFilter*
- ImGui_Viewport*
 */
@:native("ImGui_ValidatePtr")
public static function imGuiValidatePtr(pointer: Identifier, tYpe: String): Bool;
/**
 * Center of the viewport.
 */
@:native("ImGui_Viewport_GetCenter")
public static function imGuiViewportGetCenter(vieWport: ImGuiViewport): Float;
/**
 * Main Area: Position of the viewport
 */
@:native("ImGui_Viewport_GetPos")
public static function imGuiViewportGetPos(vieWport: ImGuiViewport): Float;
/**
 * Main Area: Size of the viewport.
 */
@:native("ImGui_Viewport_GetSize")
public static function imGuiViewportGetSize(vieWport: ImGuiViewport): Float;
/**
 * Center of the viewport's work area.
 */
@:native("ImGui_Viewport_GetWorkCenter")
public static function imGuiViewportGetWorkCenter(vieWport: ImGuiViewport): Float;
/**
 * >= Viewport_GetPos
 */
@:native("ImGui_Viewport_GetWorkPos")
public static function imGuiViewportGetWorkPos(vieWport: ImGuiViewport): Float;
/**
 * <= Viewport_GetSize
 */
@:native("ImGui_Viewport_GetWorkSize")
public static function imGuiViewportGetWorkSize(vieWport: ImGuiViewport): Float;
/**
 * Resize every window to its content every frame.
 */
@:native("ImGui_WindowFlags_AlwaysAutoResize")
public static function imGuiWindowFlagsAlwaysAutoResize(): Int;
/**
 * Always show horizontal scrollbar (even if ContentSize.x < Size.x).
 */
@:native("ImGui_WindowFlags_AlwaysHorizontalScrollbar")
public static function imGuiWindowFlagsAlwaysHorizontalScrollbar(): Int;
/**
 * Always show vertical scrollbar (even if ContentSize.y < Size.y).
 */
@:native("ImGui_WindowFlags_AlwaysVerticalScrollbar")
public static function imGuiWindowFlagsAlwaysVerticalScrollbar(): Int;
/**
 * Allow horizontal scrollbar to appear (off by default).
   You may use
 * SetNextWindowContentSize(width, 0.0) prior to calling Begin() to
   specify
 * width. Read code in the demo's "Horizontal Scrolling" section.
 */
@:native("ImGui_WindowFlags_HorizontalScrollbar")
public static function imGuiWindowFlagsHorizontalScrollbar(): Int;
/**
 * Has a menu-bar.
 */
@:native("ImGui_WindowFlags_MenuBar")
public static function imGuiWindowFlagsMenuBar(): Int;
/**
 * Disable drawing background color (WindowBg, etc.) and outside border.
  
 * Similar as using SetNextWindowBgAlpha(0.0).
 */
@:native("ImGui_WindowFlags_NoBackground")
public static function imGuiWindowFlagsNoBackground(): Int;
/**
 * Disable user collapsing window by double-clicking on it.
   Also referred to
 * as Window Menu Button (e.g. within a docking node).
 */
@:native("ImGui_WindowFlags_NoCollapse")
public static function imGuiWindowFlagsNoCollapse(): Int;
/**
 * WindowFlags_NoTitleBar | WindowFlags_NoResize | WindowFlags_NoScrollbar |
  
 * WindowFlags_NoCollapse
 */
@:native("ImGui_WindowFlags_NoDecoration")
public static function imGuiWindowFlagsNoDecoration(): Int;
/**
 * Disable docking of this window.
 */
@:native("ImGui_WindowFlags_NoDocking")
public static function imGuiWindowFlagsNoDocking(): Int;
/**
 * Disable taking focus when transitioning from hidden to visible state.
 */
@:native("ImGui_WindowFlags_NoFocusOnAppearing")
public static function imGuiWindowFlagsNoFocusOnAppearing(): Int;
/**
 * WindowFlags_NoMouseInputs | WindowFlags_NoNavInputs | WindowFlags_NoNavFocus
 */
@:native("ImGui_WindowFlags_NoInputs")
public static function imGuiWindowFlagsNoInputs(): Int;
/**
 * Disable catching mouse, hovering test with pass through.
 */
@:native("ImGui_WindowFlags_NoMouseInputs")
public static function imGuiWindowFlagsNoMouseInputs(): Int;
/**
 * Disable user moving the window.
 */
@:native("ImGui_WindowFlags_NoMove")
public static function imGuiWindowFlagsNoMove(): Int;
/**
 * WindowFlags_NoNavInputs | WindowFlags_NoNavFocus
 */
@:native("ImGui_WindowFlags_NoNav")
public static function imGuiWindowFlagsNoNav(): Int;
/**
 * No focusing toward this window with keyboard/gamepad navigation
   (e.g.
 * skipped by CTRL+TAB).
 */
@:native("ImGui_WindowFlags_NoNavFocus")
public static function imGuiWindowFlagsNoNavFocus(): Int;
/**
 * No keyboard/gamepad navigation within the window.
 */
@:native("ImGui_WindowFlags_NoNavInputs")
public static function imGuiWindowFlagsNoNavInputs(): Int;
/**
 * Disable user resizing with the lower-right grip.
 */
@:native("ImGui_WindowFlags_NoResize")
public static function imGuiWindowFlagsNoResize(): Int;
/**
 * Never load/save settings in .ini file.
 */
@:native("ImGui_WindowFlags_NoSavedSettings")
public static function imGuiWindowFlagsNoSavedSettings(): Int;
/**
 * Disable user vertically scrolling with mouse wheel.
   On child window, mouse
 * wheel will be forwarded to the parent unless
   NoScrollbar is also set.
 */
@:native("ImGui_WindowFlags_NoScrollWithMouse")
public static function imGuiWindowFlagsNoScrollWithMouse(): Int;
/**
 * Disable scrollbars (window can still scroll with mouse or programmatically).
 */
@:native("ImGui_WindowFlags_NoScrollbar")
public static function imGuiWindowFlagsNoScrollbar(): Int;
/**
 * Disable title-bar.
 */
@:native("ImGui_WindowFlags_NoTitleBar")
public static function imGuiWindowFlagsNoTitleBar(): Int;
/**
 * Default flag.
 */
@:native("ImGui_WindowFlags_None")
public static function imGuiWindowFlagsNone(): Int;
/**
 * Show the window above all non-topmost windows.
 */
@:native("ImGui_WindowFlags_TopMost")
public static function imGuiWindowFlagsTopMost(): Int;
/**
 * Display a dot next to the title. When used in a tab/docking context,
   tab
 * is selected when clicking the X + closure is not assumed
   (will wait for
 * user to stop submitting the tab).
   Otherwise closure is assumed when
 * pressing the X,
   so if you keep submitting the tab may reappear at end of
 * tab bar.
 */
@:native("ImGui_WindowFlags_UnsavedDocument")
public static function imGuiWindowFlagsUnsavedDocument(): Int;
/**
 * Internal use only.
 */
@:native("ImGui__getapi")
public static function imGuiGetapi(version: String, sYmbolName: String): Identifier;
/**
 * Internal use only.
 */
@:native("ImGui__geterr")
public static function imGuiGeterr(): String;
/**
 * Internal use only.
 */
@:native("ImGui__init")
public static function imGuiInit(buf: String): String;
/**
 * Internal use only.
 */
@:native("ImGui__setshim")
public static function imGuiSetshim(version: String, sYmbolName: String): Void;
/**
 * Internal use only.
 */
@:native("ImGui__shim")
public static function imGuiShim(: ImGuiContext, : ImGuiFont): Void;
}