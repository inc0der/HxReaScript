package reaper;

import reaper.Types;

@:native("reaper")
extern class ImGui {
/**
 * @since 0.1
 */
@:native("SetScrollY")
public static function setScrollY(ctX: Dynamic, scrollY: Float): Void;
/**
 * @since 0.1
 */
@:native("SetScrollX")
public static function setScrollX(ctX: Dynamic, scrollX: Float): Void;
/**
 * @since 0.1
 */
@:native("SetScrollHereY")
public static function setScrollHereY(ctX: Dynamic, ?centerYRatio: Float): Void;
/**
 * @since 0.1
 */
@:native("SetScrollHereX")
public static function setScrollHereX(ctX: Dynamic, ?centerXRatio: Float): Void;
/**
 * @since 0.1
 */
@:native("SetScrollFromPosY")
public static function setScrollFromPosY(ctX: Dynamic, localY: Float, ?centerYRatio: Float): Void;
/**
 * @since 0.1
 */
@:native("SetScrollFromPosX")
public static function setScrollFromPosX(ctX: Dynamic, localX: Float, ?centerXRatio: Float): Void;
/**
 * @since 0.1
 */
@:native("GetScrollY")
public static function getScrollY(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetScrollX")
public static function getScrollX(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetScrollMaxY")
public static function getScrollMaxY(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetScrollMaxX")
public static function getScrollMaxX(ctX: Dynamic): Float;
/**
 * @since 0.5
 */
@:native("SetWindowSizeEx")
public static function setWindowSizeEx(ctX: Dynamic, name: String, sizeW: Float, sizeH: Float, ?cond: Int): Void;
/**
 * @since 0.5
 */
@:native("SetWindowSize")
public static function setWindowSize(ctX: Dynamic, sizeW: Float, sizeH: Float, ?cond: Int): Void;
/**
 * @since 0.5
 */
@:native("SetWindowPosEx")
public static function setWindowPosEx(ctX: Dynamic, name: String, posX: Float, posY: Float, ?cond: Int): Void;
/**
 * @since 0.5
 */
@:native("SetWindowPos")
public static function setWindowPos(ctX: Dynamic, posX: Float, posY: Float, ?cond: Int): Void;
/**
 * @since 0.5
 */
@:native("SetWindowFocusEx")
public static function setWindowFocusEx(ctX: Dynamic, name: String): Void;
/**
 * @since 0.5
 */
@:native("SetWindowFocus")
public static function setWindowFocus(ctX: Dynamic): Void;
/**
 * @since 0.5
 */
@:native("SetWindowCollapsedEx")
public static function setWindowCollapsedEx(ctX: Dynamic, name: String, collapsed: Bool, ?cond: Int): Void;
/**
 * @since 0.5
 */
@:native("SetWindowCollapsed")
public static function setWindowCollapsed(ctX: Dynamic, collapsed: Bool, ?cond: Int): Void;
/**
 * @since 0.8.5
 */
@:native("SetNextWindowSizeConstraints")
public static function setNextWindowSizeConstraints(ctX: Dynamic, sizeMinW: Float, sizeMinH: Float, sizeMaXW: Float, sizeMaXH: Float, ?customCallback: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowSize")
public static function setNextWindowSize(ctX: Dynamic, sizeW: Float, sizeH: Float, ?cond: Int): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowScroll")
public static function setNextWindowScroll(ctX: Dynamic, scrollX: Float, scrollY: Float): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowPos")
public static function setNextWindowPos(ctX: Dynamic, posX: Float, posY: Float, ?cond: Int, ?pivotX: Float, ?pivotY: Float): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowFocus")
public static function setNextWindowFocus(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowContentSize")
public static function setNextWindowContentSize(ctX: Dynamic, sizeW: Float, sizeH: Float): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowCollapsed")
public static function setNextWindowCollapsed(ctX: Dynamic, collapsed: Bool, ?cond: Int): Void;
/**
 * @since 0.1
 */
@:native("SetNextWindowBgAlpha")
public static function setNextWindowBgAlpha(ctX: Dynamic, alpHa: Float): Void;
/**
 * @since 0.9
 */
@:native("IsWindowHovered")
public static function isWindowHovered(ctX: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsWindowFocused")
public static function isWindowFocused(ctX: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsWindowAppearing")
public static function isWindowAppearing(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("GetWindowWidth")
public static function getWindowWidth(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetWindowSize")
public static function getWindowSize(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetWindowPos")
public static function getWindowPos(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetWindowHeight")
public static function getWindowHeight(ctX: Dynamic): Float;
/**
 * @since 0.7.2
 */
@:native("GetWindowDpiScale")
public static function getWindowDpiScale(ctX: Dynamic): Float;
/**
 * @since 0.5
 */
@:native("SetNextWindowDockID")
public static function setNextWindowDockId(ctX: Dynamic, dockId: Int, ?cond: Int): Void;
/**
 * @since 0.5
 */
@:native("IsWindowDocked")
public static function isWindowDocked(ctX: Dynamic): Bool;
/**
 * @since 0.5
 */
@:native("GetWindowDockID")
public static function getWindowDockId(ctX: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("ShowMetricsWindow")
public static function showMetricsWindow(ctX: Dynamic, ?pOpen: Bool): Bool;
/**
 * @since 0.9
 */
@:native("ShowIDStackToolWindow")
public static function showIdStackToolWindow(ctX: Dynamic, ?pOpen: Bool): Bool;
/**
 * @since 0.7
 */
@:native("ShowDebugLogWindow")
public static function showDebugLogWindow(ctX: Dynamic, ?pOpen: Bool): Bool;
/**
 * @since 0.5.4
 */
@:native("ShowAboutWindow")
public static function showAboutWindow(ctX: Dynamic, ?pOpen: Bool): Bool;
/**
 * @since 0.1
 */
@:native("GetWindowContentRegionMin")
public static function getWindowContentRegionMin(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetWindowContentRegionMax")
public static function getWindowContentRegionMax(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetContentRegionMax")
public static function getContentRegionMax(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetContentRegionAvail")
public static function getContentRegionAvail(ctX: Dynamic): Float;
/**
 * @since 0.8
 */
@:native("EndChild")
public static function endChild(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginChild")
public static function beginChild(ctX: Dynamic, strId: String, ?sizeW: Float, ?sizeH: Float, ?cHildFlags: Int, ?windowFlags: Int): Bool;
/**
 * @since 0.8
 */
@:native("End")
public static function end(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("Begin")
public static function begin(ctX: Dynamic, name: String, ?pOpen: Bool, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("Viewport_GetWorkSize")
public static function viewportGetWorkSize(vieWport: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("Viewport_GetWorkPos")
public static function viewportGetWorkPos(vieWport: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("Viewport_GetWorkCenter")
public static function viewportGetWorkCenter(vieWport: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("Viewport_GetSize")
public static function viewportGetSize(vieWport: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("Viewport_GetPos")
public static function viewportGetPos(vieWport: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("Viewport_GetCenter")
public static function viewportGetCenter(vieWport: Dynamic): Float;
/**
 * @since 0.7
 */
@:native("GetWindowViewport")
public static function getWindowViewport(ctX: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("GetMainViewport")
public static function getMainViewport(ctX: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("LogToTTY")
public static function logToTty(ctX: Dynamic, ?autoOpenDeptH: Int): Void;
/**
 * @since 0.1
 */
@:native("LogToFile")
public static function logToFile(ctX: Dynamic, ?autoOpenDeptH: Int, ?fileName: String): Void;
/**
 * @since 0.1
 */
@:native("LogToClipboard")
public static function logToClipboard(ctX: Dynamic, ?autoOpenDeptH: Int): Void;
/**
 * @since 0.1
 */
@:native("LogText")
public static function logText(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("LogFinish")
public static function logFinish(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("PushID")
public static function pushId(ctX: Dynamic, strId: String): Void;
/**
 * @since 0.1
 */
@:native("PopID")
public static function popId(ctX: Dynamic): Void;
/**
 * @since 0.7
 */
@:native("ColorConvertU32ToDouble4")
public static function colorConvertU32ToDouble4(rgba: Int): Float;
/**
 * @since 0.7
 */
@:native("ColorConvertRGBtoHSV")
public static function colorConvertRgBtoHsv(r: Float, g: Float, b: Float): Float;
/**
 * @since 0.3
 */
@:native("ColorConvertNative")
public static function colorConvertNative(rgb: Int): Int;
/**
 * @since 0.7
 */
@:native("ColorConvertHSVtoRGB")
public static function colorConvertHsVtoRgb(h: Float, s: Float, v: Float): Float;
/**
 * @since 0.7
 */
@:native("ColorConvertDouble4ToU32")
public static function colorConvertDouble4ToU32(r: Float, g: Float, b: Float, a: Float): Int;
/**
 * @since 0.1
 */
@:native("SetClipboardText")
public static function setClipboardText(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("GetClipboardText")
public static function getClipboardText(ctX: Dynamic): String;
/**
 * @since 0.3
 */
@:native("ValidatePtr")
public static function validatePtr(pointer: Userdata, tYpe: String): Bool;
/**
 * @since 0.1
 */
@:native("ProgressBar")
public static function progressBar(ctX: Dynamic, fraction: Float, ?sizeArgW: Float, ?sizeArgH: Float, ?overlaY: String): Void;
/**
 * @since 0.5.1
 */
@:native("PointConvertNative")
public static function pointConvertNative(ctX: Dynamic, x: Float, y: Float, ?toNative: Bool): Float;
/**
 * @since 0.8.4
 */
@:native("NumericLimits_Int")
public static function numericLimitsInt(): Int;
/**
 * @since 0.4
 */
@:native("NumericLimits_Float")
public static function numericLimitsFloat(): Float;
/**
 * @since 0.8.4
 */
@:native("NumericLimits_Double")
public static function numericLimitsDouble(): Float;
/**
 * @since 0.7
 */
@:native("GetVersion")
public static function getVersion(): String;
/**
 * @since 0.9
 */
@:native("GetBuiltinPath")
public static function getBuiltinPath(): String;
/**
 * @since 0.1
 */
@:native("TreePush")
public static function treePush(ctX: Dynamic, strId: String): Void;
/**
 * @since 0.1
 */
@:native("TreePop")
public static function treePop(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("TreeNodeEx")
public static function treeNodeEx(ctX: Dynamic, strId: String, label: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("TreeNode")
public static function treeNode(ctX: Dynamic, label: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SetNextItemOpen")
public static function setNextItemOpen(ctX: Dynamic, isOpen: Bool, ?cond: Int): Void;
/**
 * @since 0.1
 */
@:native("IsItemToggledOpen")
public static function isItemToggledOpen(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("GetTreeNodeToLabelSpacing")
public static function getTreeNodeToLabelSpacing(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("CollapsingHeader")
public static function collapsingHeader(ctX: Dynamic, label: String, ?pVisible: Bool, ?flags: Int): Bool;
/**
 * @since 0.5.6
 */
@:native("TextFilter_Set")
public static function textFilterSet(filter: Dynamic, filterTeXt: String): Void;
/**
 * @since 0.5.6
 */
@:native("TextFilter_PassFilter")
public static function textFilterPassFilter(filter: Dynamic, teXt: String): Bool;
/**
 * @since 0.5.6
 */
@:native("TextFilter_IsActive")
public static function textFilterIsActive(filter: Dynamic): Bool;
/**
 * @since 0.5.6
 */
@:native("TextFilter_Get")
public static function textFilterGet(filter: Dynamic): String;
/**
 * @since 0.5.6
 */
@:native("TextFilter_Draw")
public static function textFilterDraw(filter: Dynamic, ctX: Dynamic, ?label: String, ?wIdtH: Float): Bool;
/**
 * @since 0.5.6
 */
@:native("TextFilter_Clear")
public static function textFilterClear(filter: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("CreateTextFilter")
public static function createTextFilter(?defaultFilter: String): Dynamic;
/**
 * @since 0.8.5
 */
@:native("InputTextWithHint")
public static function inputTextWithHint(ctX: Dynamic, label: String, hint: String, buf: String, ?flags: Int, ?callback: Dynamic): Bool;
/**
 * @since 0.8.5
 */
@:native("InputTextMultiline")
public static function inputTextMultiline(ctX: Dynamic, label: String, buf: String, ?sizeW: Float, ?sizeH: Float, ?flags: Int, ?callback: Dynamic): Bool;
/**
 * @since 0.8.5
 */
@:native("InputText")
public static function inputText(ctX: Dynamic, label: String, buf: String, ?flags: Int, ?callback: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("InputInt4")
public static function inputInt4(ctX: Dynamic, label: String, v1: Int, v2: Int, v3: Int, v4: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputInt3")
public static function inputInt3(ctX: Dynamic, label: String, v1: Int, v2: Int, v3: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputInt2")
public static function inputInt2(ctX: Dynamic, label: String, v1: Int, v2: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputInt")
public static function inputInt(ctX: Dynamic, label: String, v: Int, ?step: Int, ?stepFast: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputDoubleN")
public static function inputDoubleN(ctX: Dynamic, label: String, values: ReaperArray, ?step: Float, ?stepFast: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputDouble4")
public static function inputDouble4(ctX: Dynamic, label: String, v1: Float, v2: Float, v3: Float, v4: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputDouble3")
public static function inputDouble3(ctX: Dynamic, label: String, v1: Float, v2: Float, v3: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputDouble2")
public static function inputDouble2(ctX: Dynamic, label: String, v1: Float, v2: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("InputDouble")
public static function inputDouble(ctX: Dynamic, label: String, v: Float, ?step: Float, ?stepFast: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("TextWrapped")
public static function textWrapped(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("TextDisabled")
public static function textDisabled(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("TextColored")
public static function textColored(ctX: Dynamic, colRgba: Int, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("Text")
public static function text(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("PushTextWrapPos")
public static function pushTextWrapPos(ctX: Dynamic, ?wrapLocalPosX: Float): Void;
/**
 * @since 0.1
 */
@:native("PopTextWrapPos")
public static function popTextWrapPos(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("LabelText")
public static function labelText(ctX: Dynamic, label: String, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("GetTextLineHeightWithSpacing")
public static function getTextLineHeightWithSpacing(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetTextLineHeight")
public static function getTextLineHeight(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetFrameHeightWithSpacing")
public static function getFrameHeightWithSpacing(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetFrameHeight")
public static function getFrameHeight(ctX: Dynamic): Float;
/**
 * @since 0.7
 */
@:native("DebugTextEncoding")
public static function debugTextEncoding(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("CalcTextSize")
public static function calcTextSize(ctX: Dynamic, teXt: String, ?1: Dynamic, ?2: Dynamic, ?hIdeTeXtAfterDoubleHash: Bool, ?wrapWIdtH: Float): Float;
/**
 * @since 0.1
 */
@:native("BulletText")
public static function bulletText(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("Bullet")
public static function bullet(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("AlignTextToFramePadding")
public static function alignTextToFramePadding(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("TableNeedSort")
public static function tableNeedSort(ctX: Dynamic): Bool;
/**
 * @since 0.9
 */
@:native("TableGetColumnSortSpecs")
public static function tableGetColumnSortSpecs(ctX: Dynamic, id: Int): Bool;
/**
 * @since 0.1
 */
@:native("TableSetupScrollFreeze")
public static function tableSetupScrollFreeze(ctX: Dynamic, cols: Int, roWs: Int): Void;
/**
 * @since 0.1
 */
@:native("TableSetupColumn")
public static function tableSetupColumn(ctX: Dynamic, label: String, ?flags: Int, ?initWIdtHOrWeigHt: Float, ?userId: Int): Void;
/**
 * @since 0.4.1
 */
@:native("TableSetColumnEnabled")
public static function tableSetColumnEnabled(ctX: Dynamic, columnN: Int, v: Bool): Void;
/**
 * @since 0.1
 */
@:native("TableHeadersRow")
public static function tableHeadersRow(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("TableHeader")
public static function tableHeader(ctX: Dynamic, label: String): Void;
/**
 * @since 0.9.2
 */
@:native("TableGetHoveredColumn")
public static function tableGetHoveredColumn(ctX: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("TableGetColumnName")
public static function tableGetColumnName(ctX: Dynamic, ?columnN: Int): String;
/**
 * @since 0.1
 */
@:native("TableGetColumnFlags")
public static function tableGetColumnFlags(ctX: Dynamic, ?columnN: Int): Int;
/**
 * @since 0.1
 */
@:native("TableAngledHeadersRow")
public static function tableAngledHeadersRow(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("TableSetBgColor")
public static function tableSetBgColor(ctX: Dynamic, target: Int, colorRgba: Int, ?columnN: Int): Void;
/**
 * @since 0.8
 */
@:native("TableSetColumnIndex")
public static function tableSetColumnIndex(ctX: Dynamic, columnN: Int): Bool;
/**
 * @since 0.9
 */
@:native("TableNextRow")
public static function tableNextRow(ctX: Dynamic, ?roWFlags: Int, ?minRoWHeigHt: Float): Void;
/**
 * @since 0.8
 */
@:native("TableNextColumn")
public static function tableNextColumn(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("TableGetRowIndex")
public static function tableGetRowIndex(ctX: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("TableGetColumnIndex")
public static function tableGetColumnIndex(ctX: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("TableGetColumnCount")
public static function tableGetColumnCount(ctX: Dynamic): Int;
/**
 * @since 0.8
 */
@:native("EndTable")
public static function endTable(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginTable")
public static function beginTable(ctX: Dynamic, strId: String, columns: Int, ?flags: Int, ?outerSizeW: Float, ?outerSizeH: Float, ?innerWIdtH: Float): Bool;
/**
 * @since 0.1
 */
@:native("TabItemButton")
public static function tabItemButton(ctX: Dynamic, label: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SetTabItemClosed")
public static function setTabItemClosed(ctX: Dynamic, tabOrDockedWindoWLabel: String): Void;
/**
 * @since 0.1
 */
@:native("EndTabItem")
public static function endTabItem(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginTabItem")
public static function beginTabItem(ctX: Dynamic, label: String, ?pOpen: Bool, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("EndTabBar")
public static function endTabBar(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginTabBar")
public static function beginTabBar(ctX: Dynamic, strId: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("PushStyleVar")
public static function pushStyleVar(ctX: Dynamic, varIdX: Int, val1: Float, ?val2: Float): Void;
/**
 * @since 0.1
 */
@:native("PopStyleVar")
public static function popStyleVar(ctX: Dynamic, ?count: Int): Void;
/**
 * @since 0.1
 */
@:native("GetStyleVar")
public static function getStyleVar(ctX: Dynamic, varIdX: Int): Float;
/**
 * @since 0.1
 */
@:native("PushStyleColor")
public static function pushStyleColor(ctX: Dynamic, idX: Int, colRgba: Int): Void;
/**
 * @since 0.1
 */
@:native("PopStyleColor")
public static function popStyleColor(ctX: Dynamic, ?count: Int): Void;
/**
 * @since 0.1
 */
@:native("GetStyleColor")
public static function getStyleColor(ctX: Dynamic, idX: Int): Int;
/**
 * @since 0.1
 */
@:native("GetColorEx")
public static function getColorEx(ctX: Dynamic, colRgba: Int, ?alpHaMul: Float): Int;
/**
 * @since 0.1
 */
@:native("GetColor")
public static function getColor(ctX: Dynamic, idX: Int, ?alpHaMul: Float): Int;
/**
 * @since 0.9
 */
@:native("DebugFlashStyleColor")
public static function debugFlashStyleColor(ctX: Dynamic, idX: Int): Void;
/**
 * @since 0.1
 */
@:native("SetTooltip")
public static function setTooltip(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.9
 */
@:native("SetItemTooltip")
public static function setItemTooltip(ctX: Dynamic, teXt: String): Void;
/**
 * @since 0.8
 */
@:native("EndTooltip")
public static function endTooltip(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginTooltip")
public static function beginTooltip(ctX: Dynamic): Bool;
/**
 * @nodiscard
 */
@:native("BeginItemTooltip")
public static function beginItemTooltip(ctX: Dynamic): Bool;
/**
 * @nodiscard
 */
@:native("BeginPopupContextWindow")
public static function beginPopupContextWindow(ctX: Dynamic, ?strId: String, ?popupFlags: Int): Bool;
/**
 * @nodiscard
 */
@:native("BeginPopupContextItem")
public static function beginPopupContextItem(ctX: Dynamic, ?strId: String, ?popupFlags: Int): Bool;
/**
 * @since 0.1
 */
@:native("OpenPopupOnItemClick")
public static function openPopupOnItemClick(ctX: Dynamic, ?strId: String, ?popupFlags: Int): Void;
/**
 * @since 0.1
 */
@:native("OpenPopup")
public static function openPopup(ctX: Dynamic, strId: String, ?popupFlags: Int): Void;
/**
 * @since 0.1
 */
@:native("IsPopupOpen")
public static function isPopupOpen(ctX: Dynamic, strId: String, ?flags: Int): Bool;
/**
 * @since 0.8
 */
@:native("EndPopup")
public static function endPopup(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("CloseCurrentPopup")
public static function closeCurrentPopup(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginPopupModal")
public static function beginPopupModal(ctX: Dynamic, name: String, ?pOpen: Bool, ?flags: Int): Bool;
/**
 * @nodiscard
 */
@:native("BeginPopup")
public static function beginPopup(ctX: Dynamic, strId: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("PlotLines")
public static function plotLines(ctX: Dynamic, label: String, values: ReaperArray, ?valuesOffSet: Int, ?overlaYTeXt: String, ?scaleMin: Float, ?scaleMaX: Float, ?grapHSizeW: Float, ?grapHSizeH: Float): Void;
/**
 * @since 0.1
 */
@:native("PlotHistogram")
public static function plotHistogram(ctX: Dynamic, label: String, values: ReaperArray, ?valuesOffSet: Int, ?overlaYTeXt: String, ?scaleMin: Float, ?scaleMaX: Float, ?grapHSizeW: Float, ?grapHSizeH: Float): Void;
/**
 * @since 0.1
 */
@:native("MenuItem")
public static function menuItem(ctX: Dynamic, label: String, ?sHortcut: String, ?pSelected: Bool, ?enabled: Bool): Bool;
/**
 * @since 0.1
 */
@:native("EndMenuBar")
public static function endMenuBar(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("EndMenu")
public static function endMenu(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginMenuBar")
public static function beginMenuBar(ctX: Dynamic): Bool;
/**
 * @nodiscard
 */
@:native("BeginMenu")
public static function beginMenu(ctX: Dynamic, label: String, ?enabled: Bool): Bool;
/**
 * @since 0.1
 */
@:native("ListClipper_Step")
public static function listClipperStep(clipper: Dynamic): Bool;
/**
 * @since 0.9
 */
@:native("ListClipper_IncludeItemsByIndex")
public static function listClipperIncludeItemsByIndex(clipper: Dynamic, itemBegin: Int, itemEnd: Int): Void;
/**
 * @since 0.9
 */
@:native("ListClipper_IncludeItemByIndex")
public static function listClipperIncludeItemByIndex(clipper: Dynamic, itemIndeX: Int): Void;
/**
 * @since 0.3
 */
@:native("ListClipper_GetDisplayRange")
public static function listClipperGetDisplayRange(clipper: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("ListClipper_End")
public static function listClipperEnd(clipper: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("ListClipper_Begin")
public static function listClipperBegin(clipper: Dynamic, itemsCount: Int, ?itemsHeigHt: Float): Void;
/**
 * @nodiscard
 */
@:native("CreateListClipper")
public static function createListClipper(ctX: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("SetCursorScreenPos")
public static function setCursorScreenPos(ctX: Dynamic, posX: Float, posY: Float): Void;
/**
 * @since 0.1
 */
@:native("SetCursorPosY")
public static function setCursorPosY(ctX: Dynamic, localY: Float): Void;
/**
 * @since 0.1
 */
@:native("SetCursorPosX")
public static function setCursorPosX(ctX: Dynamic, localX: Float): Void;
/**
 * @since 0.1
 */
@:native("SetCursorPos")
public static function setCursorPos(ctX: Dynamic, localPosX: Float, localPosY: Float): Void;
/**
 * @since 0.1
 */
@:native("GetCursorStartPos")
public static function getCursorStartPos(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetCursorScreenPos")
public static function getCursorScreenPos(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetCursorPosY")
public static function getCursorPosY(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetCursorPosX")
public static function getCursorPosX(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetCursorPos")
public static function getCursorPos(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("PushClipRect")
public static function pushClipRect(ctX: Dynamic, clipRectMinX: Float, clipRectMinY: Float, clipRectMaXX: Float, clipRectMaXY: Float, intersectWitHCurrentClipRect: Bool): Void;
/**
 * @since 0.1
 */
@:native("PopClipRect")
public static function popClipRect(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("IsRectVisibleEx")
public static function isRectVisibleEx(ctX: Dynamic, rectMinX: Float, rectMinY: Float, rectMaXX: Float, rectMaXY: Float): Bool;
/**
 * @since 0.1
 */
@:native("IsRectVisible")
public static function isRectVisible(ctX: Dynamic, sizeW: Float, sizeH: Float): Bool;
/**
 * @since 0.1
 */
@:native("Unindent")
public static function unindent(ctX: Dynamic, ?indentW: Float): Void;
/**
 * @since 0.1
 */
@:native("Spacing")
public static function spacing(ctX: Dynamic): Void;
/**
 * @since 0.8.4
 */
@:native("SeparatorText")
public static function separatorText(ctX: Dynamic, label: String): Void;
/**
 * @since 0.1
 */
@:native("Separator")
public static function separator(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("SameLine")
public static function sameLine(ctX: Dynamic, ?offSetFromStartX: Float, ?spacing: Float): Void;
/**
 * @since 0.1
 */
@:native("NewLine")
public static function newLine(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("Indent")
public static function indent(ctX: Dynamic, ?indentW: Float): Void;
/**
 * @since 0.8
 */
@:native("EndGroup")
public static function endGroup(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("Dummy")
public static function dummy(ctX: Dynamic, sizeW: Float, sizeH: Float): Void;
/**
 * @since 0.1
 */
@:native("BeginGroup")
public static function beginGroup(ctX: Dynamic): Void;
/**
 * @since 0.9.2
 */
@:native("Shortcut")
public static function shortcut(ctX: Dynamic, keYCHord: Int, ?flags: Int): Bool;
/**
 * @since 0.9.2
 */
@:native("SetNextItemShortcut")
public static function setNextItemShortcut(ctX: Dynamic, keYCHord: Int, ?flags: Int): Void;
/**
 * @since 0.9
 */
@:native("IsKeyChordPressed")
public static function isKeyChordPressed(ctX: Dynamic, keYCHord: Int): Bool;
/**
 * @since 0.1
 */
@:native("SetMouseCursor")
public static function setMouseCursor(ctX: Dynamic, cursorTYpe: Int): Void;
/**
 * @since 0.1
 */
@:native("GetMouseCursor")
public static function getMouseCursor(ctX: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("ResetMouseDragDelta")
public static function resetMouseDragDelta(ctX: Dynamic, ?button: Int): Void;
/**
 * @since 0.1
 */
@:native("IsMouseReleased")
public static function isMouseReleased(ctX: Dynamic, button: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsMousePosValid")
public static function isMousePosValid(ctX: Dynamic, ?mousePosX: Float, ?mousePosY: Float): Bool;
/**
 * @since 0.1
 */
@:native("IsMouseHoveringRect")
public static function isMouseHoveringRect(ctX: Dynamic, rMinX: Float, rMinY: Float, rMaXX: Float, rMaXY: Float, ?clip: Bool): Bool;
/**
 * @since 0.1
 */
@:native("IsMouseDragging")
public static function isMouseDragging(ctX: Dynamic, button: Int, ?lockTHresHold: Float): Bool;
/**
 * @since 0.1
 */
@:native("IsMouseDown")
public static function isMouseDown(ctX: Dynamic, button: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsMouseDoubleClicked")
public static function isMouseDoubleClicked(ctX: Dynamic, button: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsMouseClicked")
public static function isMouseClicked(ctX: Dynamic, button: Int, ?repeat: Bool): Bool;
/**
 * @since 0.1
 */
@:native("IsAnyMouseDown")
public static function isAnyMouseDown(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("GetMouseWheel")
public static function getMouseWheel(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetMousePosOnOpeningCurrentPopup")
public static function getMousePosOnOpeningCurrentPopup(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetMousePos")
public static function getMousePos(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetMouseDragDelta")
public static function getMouseDragDelta(ctX: Dynamic, ?1: Dynamic, ?2: Dynamic, ?button: Int, ?lockTHresHold: Float): Float;
/**
 * @since 0.1
 */
@:native("GetMouseDownDuration")
public static function getMouseDownDuration(ctX: Dynamic, button: Int): Float;
/**
 * @since 0.1
 */
@:native("GetMouseDelta")
public static function getMouseDelta(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetMouseClickedPos")
public static function getMouseClickedPos(ctX: Dynamic, button: Int): Float;
/**
 * @since 0.5.10
 */
@:native("GetMouseClickedCount")
public static function getMouseClickedCount(ctX: Dynamic, button: Int): Int;
/**
 * @since 0.7
 */
@:native("SetNextFrameWantCaptureKeyboard")
public static function setNextFrameWantCaptureKeyboard(ctX: Dynamic, wantCaptureKeYboard: Bool): Void;
/**
 * @since 0.9
 */
@:native("IsKeyReleased")
public static function isKeyReleased(ctX: Dynamic, keY: Int): Bool;
/**
 * @since 0.9
 */
@:native("IsKeyPressed")
public static function isKeyPressed(ctX: Dynamic, keY: Int, ?repeat: Bool): Bool;
/**
 * @since 0.9
 */
@:native("IsKeyDown")
public static function isKeyDown(ctX: Dynamic, keY: Int): Bool;
/**
 * @since 0.9
 */
@:native("GetKeyPressedAmount")
public static function getKeyPressedAmount(ctX: Dynamic, keY: Int, repeatDelaY: Float, rate: Float): Int;
/**
 * @since 0.8
 */
@:native("GetKeyMods")
public static function getKeyMods(ctX: Dynamic): Int;
/**
 * @since 0.9
 */
@:native("GetKeyDownDuration")
public static function getKeyDownDuration(ctX: Dynamic, keY: Int): Float;
/**
 * @since 0.1
 */
@:native("GetInputQueueCharacter")
public static function getInputQueueCharacter(ctX: Dynamic, idX: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsItemVisible")
public static function isItemVisible(ctX: Dynamic): Bool;
/**
 * @since 0.9
 */
@:native("IsItemHovered")
public static function isItemHovered(ctX: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsItemFocused")
public static function isItemFocused(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsItemEdited")
public static function isItemEdited(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsItemDeactivatedAfterEdit")
public static function isItemDeactivatedAfterEdit(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsItemDeactivated")
public static function isItemDeactivated(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsItemClicked")
public static function isItemClicked(ctX: Dynamic, ?mouseButton: Int): Bool;
/**
 * @since 0.1
 */
@:native("IsItemActive")
public static function isItemActive(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsItemActivated")
public static function isItemActivated(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsAnyItemHovered")
public static function isAnyItemHovered(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsAnyItemFocused")
public static function isAnyItemFocused(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("IsAnyItemActive")
public static function isAnyItemActive(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("SetKeyboardFocusHere")
public static function setKeyboardFocusHere(ctX: Dynamic, ?offSet: Int): Void;
/**
 * @since 0.1
 */
@:native("SetItemDefaultFocus")
public static function setItemDefaultFocus(ctX: Dynamic): Void;
/**
 * @since 0.8.5
 */
@:native("PushTabStop")
public static function pushTabStop(ctX: Dynamic, tabStop: Bool): Void;
/**
 * @since 0.8.5
 */
@:native("PopTabStop")
public static function popTabStop(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("SetNextItemWidth")
public static function setNextItemWidth(ctX: Dynamic, itemWIdtH: Float): Void;
/**
 * @since 0.1
 */
@:native("PushItemWidth")
public static function pushItemWidth(ctX: Dynamic, itemWIdtH: Float): Void;
/**
 * @since 0.1
 */
@:native("PopItemWidth")
public static function popItemWidth(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("GetItemRectSize")
public static function getItemRectSize(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetItemRectMin")
public static function getItemRectMin(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetItemRectMax")
public static function getItemRectMax(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("CalcItemWidth")
public static function calcItemWidth(ctX: Dynamic): Float;
/**
 * @since 0.9
 */
@:native("SetNextItemAllowOverlap")
public static function setNextItemAllowOverlap(ctX: Dynamic): Void;
/**
 * @since 0.5.5
 */
@:native("EndDisabled")
public static function endDisabled(ctX: Dynamic): Void;
/**
 * @since 0.9
 */
@:native("DebugStartItemPicker")
public static function debugStartItemPicker(ctX: Dynamic): Void;
/**
 * @since 0.5.5
 */
@:native("BeginDisabled")
public static function beginDisabled(ctX: Dynamic, ?disabled: Bool): Void;
/**
 * @since 0.8
 */
@:native("ImageSet_Add")
public static function imageSetAdd(set: Dynamic, scale: Float, image: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("CreateImageSet")
public static function createImageSet(): Dynamic;
/**
 * @since 0.8
 */
@:native("Image_GetSize")
public static function imageGetSize(image: Dynamic): Float;
/**
 * @since 0.8
 */
@:native("ImageButton")
public static function imageButton(ctX: Dynamic, strId: String, image: Dynamic, imageSizeW: Float, imageSizeH: Float, ?uv0X: Float, ?uv0Y: Float, ?uv1X: Float, ?uv1Y: Float, ?bgColRgba: Int, ?tintColRgba: Int): Bool;
/**
 * @since 0.8
 */
@:native("Image")
public static function image(ctX: Dynamic, image: Dynamic, imageSizeW: Float, imageSizeH: Float, ?uv0X: Float, ?uv0Y: Float, ?uv1X: Float, ?uv1Y: Float, ?tintColRgba: Int, ?borderColRgba: Int): Void;
/**
 * @nodiscard
 */
@:native("CreateImageFromMem")
public static function createImageFromMem(data: String, ?flags: Int): Dynamic;
/**
 * @nodiscard
 */
@:native("CreateImageFromLICE")
public static function createImageFromLice(bitmap: Dynamic, ?flags: Int): Dynamic;
/**
 * @nodiscard
 */
@:native("CreateImage")
public static function createImage(file: String, ?flags: Int): Dynamic;
/**
 * @since 0.8.5
 */
@:native("Function_SetValue_String")
public static function functionSetValueString(func: Dynamic, name: String, value: String): Void;
/**
 * @since 0.8.5
 */
@:native("Function_SetValue_Array")
public static function functionSetValueArray(func: Dynamic, name: String, values: ReaperArray): Void;
/**
 * @since 0.8.5
 */
@:native("Function_SetValue")
public static function functionSetValue(func: Dynamic, name: String, value: Float): Void;
/**
 * @since 0.8.5
 */
@:native("Function_GetValue_String")
public static function functionGetValueString(func: Dynamic, name: String): String;
/**
 * @since 0.8.5
 */
@:native("Function_GetValue_Array")
public static function functionGetValueArray(func: Dynamic, name: String, values: ReaperArray): Void;
/**
 * @since 0.8.5
 */
@:native("Function_GetValue")
public static function functionGetValue(func: Dynamic, name: String): Float;
/**
 * @since 0.8.5
 */
@:native("Function_Execute")
public static function functionExecute(func: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("CreateFunctionFromEEL")
public static function createFunctionFromEel(code: String): Dynamic;
/**
 * @since 0.4
 */
@:native("PushFont")
public static function pushFont(ctX: Dynamic, font: haxe.extern.EitherType<Dynamic, Void>): Void;
/**
 * @since 0.4
 */
@:native("PopFont")
public static function popFont(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("GetFontSize")
public static function getFontSize(ctX: Dynamic): Float;
/**
 * @since 0.4
 */
@:native("GetFont")
public static function getFont(ctX: Dynamic): Dynamic;
/**
 * @nodiscard
 */
@:native("CreateFontFromMem")
public static function createFontFromMem(data: String, size: Int, ?flags: Int): Dynamic;
/**
 * @nodiscard
 */
@:native("CreateFont")
public static function createFont(familYOrFile: String, size: Int, ?flags: Int): Dynamic;
/**
 * @since 0.2
 */
@:native("DrawList_PathStroke")
public static function drawListPathStroke(draWList: Dynamic, colRgba: Int, ?flags: Int, ?tHickness: Float): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathRect")
public static function drawListPathRect(draWList: Dynamic, rectMinX: Float, rectMinY: Float, rectMaXX: Float, rectMaXY: Float, ?rounding: Float, ?flags: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathLineTo")
public static function drawListPathLineTo(draWList: Dynamic, posX: Float, posY: Float): Void;
/**
 * @since 0.5.1
 */
@:native("DrawList_PathFillConvex")
public static function drawListPathFillConvex(draWList: Dynamic, colRgba: Int): Void;
/**
 * @since 0.9
 */
@:native("DrawList_PathFillConcave")
public static function drawListPathFillConcave(draWList: Dynamic, colRgba: Int): Void;
/**
 * @since 0.9
 */
@:native("DrawList_PathEllipticalArcTo")
public static function drawListPathEllipticalArcTo(draWList: Dynamic, centerX: Float, centerY: Float, radiusX: Float, radiusY: Float, rot: Float, aMin: Float, aMaX: Float, ?numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathClear")
public static function drawListPathClear(draWList: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathBezierQuadraticCurveTo")
public static function drawListPathBezierQuadraticCurveTo(draWList: Dynamic, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, ?numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathBezierCubicCurveTo")
public static function drawListPathBezierCubicCurveTo(draWList: Dynamic, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, ?numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathArcToFast")
public static function drawListPathArcToFast(draWList: Dynamic, centerX: Float, centerY: Float, radius: Float, aMinOf12: Int, aMaXOf12: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PathArcTo")
public static function drawListPathArcTo(draWList: Dynamic, centerX: Float, centerY: Float, radius: Float, aMin: Float, aMaX: Float, ?numSegments: Int): Void;
/**
 * @since 0.7.1
 */
@:native("DrawListSplitter_Split")
public static function drawListSplitterSplit(splitter: Dynamic, count: Int): Void;
/**
 * @since 0.7.1
 */
@:native("DrawListSplitter_SetCurrentChannel")
public static function drawListSplitterSetCurrentChannel(splitter: Dynamic, cHannelIdX: Int): Void;
/**
 * @since 0.7.1
 */
@:native("DrawListSplitter_Merge")
public static function drawListSplitterMerge(splitter: Dynamic): Void;
/**
 * @since 0.7.1
 */
@:native("DrawListSplitter_Clear")
public static function drawListSplitterClear(splitter: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("CreateDrawListSplitter")
public static function createDrawListSplitter(draWList: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("DrawList_AddTriangleFilled")
public static function drawListAddTriangleFilled(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, colRgba: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddTriangle")
public static function drawListAddTriangle(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, colRgba: Int, ?tHickness: Float): Void;
/**
 * @since 0.4
 */
@:native("DrawList_AddTextEx")
public static function drawListAddTextEx(draWList: Dynamic, font: haxe.extern.EitherType<Dynamic, Void>, fontSize: Float, posX: Float, posY: Float, colRgba: Int, teXt: String, ?wrapWIdtH: Float, ?cpuFineClipRectMinX: Float, ?cpuFineClipRectMinY: Float, ?cpuFineClipRectMaXX: Float, ?cpuFineClipRectMaXY: Float): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddText")
public static function drawListAddText(draWList: Dynamic, x: Float, y: Float, colRgba: Int, teXt: String): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddRectFilledMultiColor")
public static function drawListAddRectFilledMultiColor(draWList: Dynamic, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, colUprLeft: Int, colUprRigHt: Int, colBotRigHt: Int, colBotLeft: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddRectFilled")
public static function drawListAddRectFilled(draWList: Dynamic, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, colRgba: Int, ?rounding: Float, ?flags: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddRect")
public static function drawListAddRect(draWList: Dynamic, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, colRgba: Int, ?rounding: Float, ?flags: Int, ?tHickness: Float): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddQuadFilled")
public static function drawListAddQuadFilled(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, colRgba: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddQuad")
public static function drawListAddQuad(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, colRgba: Int, ?tHickness: Float): Void;
/**
 * @since 0.2
 */
@:native("DrawList_AddPolyline")
public static function drawListAddPolyline(draWList: Dynamic, points: ReaperArray, colRgba: Int, flags: Int, tHickness: Float): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddNgonFilled")
public static function drawListAddNgonFilled(draWList: Dynamic, centerX: Float, centerY: Float, radius: Float, colRgba: Int, numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddNgon")
public static function drawListAddNgon(draWList: Dynamic, centerX: Float, centerY: Float, radius: Float, colRgba: Int, numSegments: Int, ?tHickness: Float): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddLine")
public static function drawListAddLine(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, colRgba: Int, ?tHickness: Float): Void;
/**
 * @since 0.8
 */
@:native("DrawList_AddImageRounded")
public static function drawListAddImageRounded(draWList: Dynamic, image: Dynamic, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, uvMinX: Float, uvMinY: Float, uvMaXX: Float, uvMaXY: Float, colRgba: Int, rounding: Float, ?flags: Int): Void;
/**
 * @since 0.8
 */
@:native("DrawList_AddImageQuad")
public static function drawListAddImageQuad(draWList: Dynamic, image: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, ?uv1X: Float, ?uv1Y: Float, ?uv2X: Float, ?uv2Y: Float, ?uv3X: Float, ?uv3Y: Float, ?uv4X: Float, ?uv4Y: Float, ?colRgba: Int): Void;
/**
 * @since 0.8
 */
@:native("DrawList_AddImage")
public static function drawListAddImage(draWList: Dynamic, image: Dynamic, pMinX: Float, pMinY: Float, pMaXX: Float, pMaXY: Float, ?uvMinX: Float, ?uvMinY: Float, ?uvMaXX: Float, ?uvMaXY: Float, ?colRgba: Int): Void;
/**
 * @since 0.9
 */
@:native("DrawList_AddEllipseFilled")
public static function drawListAddEllipseFilled(draWList: Dynamic, centerX: Float, centerY: Float, radiusX: Float, radiusY: Float, colRgba: Int, ?rot: Float, ?numSegments: Int): Void;
/**
 * @since 0.9
 */
@:native("DrawList_AddEllipse")
public static function drawListAddEllipse(draWList: Dynamic, centerX: Float, centerY: Float, radiusX: Float, radiusY: Float, colRgba: Int, ?rot: Float, ?numSegments: Int, ?tHickness: Float): Void;
/**
 * @since 0.6
 */
@:native("DrawList_AddConvexPolyFilled")
public static function drawListAddConvexPolyFilled(draWList: Dynamic, points: ReaperArray, colRgba: Int): Void;
/**
 * @since 0.9
 */
@:native("DrawList_AddConcavePolyFilled")
public static function drawListAddConcavePolyFilled(draWList: Dynamic, points: ReaperArray, colRgba: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddCircleFilled")
public static function drawListAddCircleFilled(draWList: Dynamic, centerX: Float, centerY: Float, radius: Float, colRgba: Int, ?numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddCircle")
public static function drawListAddCircle(draWList: Dynamic, centerX: Float, centerY: Float, radius: Float, colRgba: Int, ?numSegments: Int, ?tHickness: Float): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddBezierQuadratic")
public static function drawListAddBezierQuadratic(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, colRgba: Int, tHickness: Float, ?numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("DrawList_AddBezierCubic")
public static function drawListAddBezierCubic(draWList: Dynamic, p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, p3X: Float, p3Y: Float, p4X: Float, p4Y: Float, colRgba: Int, tHickness: Float, ?numSegments: Int): Void;
/**
 * @since 0.1
 */
@:native("GetWindowDrawList")
public static function getWindowDrawList(ctX: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("GetForegroundDrawList")
public static function getForegroundDrawList(ctX: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("GetBackgroundDrawList")
public static function getBackgroundDrawList(ctX: Dynamic): Dynamic;
/**
 * @since 0.1
 */
@:native("DrawList_PushClipRectFullScreen")
public static function drawListPushClipRectFullScreen(draWList: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PushClipRect")
public static function drawListPushClipRect(draWList: Dynamic, clipRectMinX: Float, clipRectMinY: Float, clipRectMaXX: Float, clipRectMaXY: Float, ?intersectWitHCurrentClipRect: Bool): Void;
/**
 * @since 0.1
 */
@:native("DrawList_PopClipRect")
public static function drawListPopClipRect(draWList: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("VSliderInt")
public static function vsliderInt(ctX: Dynamic, label: String, sizeW: Float, sizeH: Float, v: Int, vMin: Int, vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("VSliderDouble")
public static function vsliderDouble(ctX: Dynamic, label: String, sizeW: Float, sizeH: Float, v: Float, vMin: Float, vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderInt4")
public static function sliderInt4(ctX: Dynamic, label: String, v1: Int, v2: Int, v3: Int, v4: Int, vMin: Int, vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderInt3")
public static function sliderInt3(ctX: Dynamic, label: String, v1: Int, v2: Int, v3: Int, vMin: Int, vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderInt2")
public static function sliderInt2(ctX: Dynamic, label: String, v1: Int, v2: Int, vMin: Int, vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderInt")
public static function sliderInt(ctX: Dynamic, label: String, v: Int, vMin: Int, vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderDoubleN")
public static function sliderDoubleN(ctX: Dynamic, label: String, values: ReaperArray, vMin: Float, vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderDouble4")
public static function sliderDouble4(ctX: Dynamic, label: String, v1: Float, v2: Float, v3: Float, v4: Float, vMin: Float, vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderDouble3")
public static function sliderDouble3(ctX: Dynamic, label: String, v1: Float, v2: Float, v3: Float, vMin: Float, vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderDouble2")
public static function sliderDouble2(ctX: Dynamic, label: String, v1: Float, v2: Float, vMin: Float, vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderDouble")
public static function sliderDouble(ctX: Dynamic, label: String, v: Float, vMin: Float, vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SliderAngle")
public static function sliderAngle(ctX: Dynamic, label: String, vRad: Float, ?vDegreesMin: Float, ?vDegreesMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragIntRange2")
public static function dragIntRange2(ctX: Dynamic, label: String, vCurrentMin: Int, vCurrentMaX: Int, ?vSpeed: Float, ?vMin: Int, ?vMaX: Int, ?format: String, ?formatMaX: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragInt4")
public static function dragInt4(ctX: Dynamic, label: String, v1: Int, v2: Int, v3: Int, v4: Int, ?vSpeed: Float, ?vMin: Int, ?vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragInt3")
public static function dragInt3(ctX: Dynamic, label: String, v1: Int, v2: Int, v3: Int, ?vSpeed: Float, ?vMin: Int, ?vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragInt2")
public static function dragInt2(ctX: Dynamic, label: String, v1: Int, v2: Int, ?vSpeed: Float, ?vMin: Int, ?vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragInt")
public static function dragInt(ctX: Dynamic, label: String, v: Int, ?vSpeed: Float, ?vMin: Int, ?vMaX: Int, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragFloatRange2")
public static function dragFloatRange2(ctX: Dynamic, label: String, vCurrentMin: Float, vCurrentMaX: Float, ?vSpeed: Float, ?vMin: Float, ?vMaX: Float, ?format: String, ?formatMaX: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragDoubleN")
public static function dragDoubleN(ctX: Dynamic, label: String, values: ReaperArray, ?speed: Float, ?min: Float, ?maX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragDouble4")
public static function dragDouble4(ctX: Dynamic, label: String, v1: Float, v2: Float, v3: Float, v4: Float, ?vSpeed: Float, ?vMin: Float, ?vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragDouble3")
public static function dragDouble3(ctX: Dynamic, label: String, v1: Float, v2: Float, v3: Float, ?vSpeed: Float, ?vMin: Float, ?vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragDouble2")
public static function dragDouble2(ctX: Dynamic, label: String, v1: Float, v2: Float, ?vSpeed: Float, ?vMin: Float, ?vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("DragDouble")
public static function dragDouble(ctX: Dynamic, label: String, v: Float, ?vSpeed: Float, ?vMin: Float, ?vMaX: Float, ?format: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SetDragDropPayload")
public static function setDragDropPayload(ctX: Dynamic, tYpe: String, data: String, ?cond: Int): Bool;
/**
 * @since 0.1
 */
@:native("GetDragDropPayloadFile")
public static function getDragDropPayloadFile(ctX: Dynamic, indeX: Int): Bool;
/**
 * @since 0.1
 */
@:native("GetDragDropPayload")
public static function getDragDropPayload(ctX: Dynamic): Bool;
/**
 * @since 0.1
 */
@:native("EndDragDropTarget")
public static function endDragDropTarget(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("EndDragDropSource")
public static function endDragDropSource(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginDragDropTarget")
public static function beginDragDropTarget(ctX: Dynamic): Bool;
/**
 * @nodiscard
 */
@:native("BeginDragDropSource")
public static function beginDragDropSource(ctX: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("AcceptDragDropPayloadRGBA")
public static function acceptDragDropPayloadRgba(ctX: Dynamic, ?1: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("AcceptDragDropPayloadRGB")
public static function acceptDragDropPayloadRgb(ctX: Dynamic, ?1: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("AcceptDragDropPayloadFiles")
public static function acceptDragDropPayloadFiles(ctX: Dynamic, ?1: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("AcceptDragDropPayload")
public static function acceptDragDropPayload(ctX: Dynamic, tYpe: String, ?1: Dynamic, ?flags: Int): Bool;
/**
 * @since 0.7
 */
@:native("SetConfigVar")
public static function setConfigVar(ctX: Dynamic, varIdX: Int, value: Float): Void;
/**
 * @since 0.7
 */
@:native("GetConfigVar")
public static function getConfigVar(ctX: Dynamic, varIdX: Int): Float;
/**
 * @since 0.1
 */
@:native("GetTime")
public static function getTime(ctX: Dynamic): Float;
/**
 * @since 0.8
 */
@:native("GetFramerate")
public static function getFramerate(ctX: Dynamic): Float;
/**
 * @since 0.1
 */
@:native("GetFrameCount")
public static function getFrameCount(ctX: Dynamic): Int;
/**
 * @since 0.1
 */
@:native("GetDeltaTime")
public static function getDeltaTime(ctX: Dynamic): Float;
/**
 * @since 0.8
 */
@:native("Detach")
public static function detach(ctX: Dynamic, obj: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("CreateContext")
public static function createContext(label: String, ?configFlags: Int): Dynamic;
/**
 * @since 0.8
 */
@:native("Attach")
public static function attach(ctX: Dynamic, obj: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("Selectable")
public static function selectable(ctX: Dynamic, label: String, ?pSelected: Bool, ?flags: Int, ?sizeW: Float, ?sizeH: Float): Bool;
/**
 * @since 0.7
 */
@:native("ListBox")
public static function listBox(ctX: Dynamic, label: String, currentItem: Int, items: String, ?heightInItems: Int): Bool;
/**
 * @since 0.1
 */
@:native("EndListBox")
public static function endListBox(ctX: Dynamic): Void;
/**
 * @nodiscard
 */
@:native("BeginListBox")
public static function beginListBox(ctX: Dynamic, label: String, ?sizeW: Float, ?sizeH: Float): Bool;
/**
 * @since 0.1
 */
@:native("EndCombo")
public static function endCombo(ctX: Dynamic): Void;
/**
 * @since 0.7
 */
@:native("Combo")
public static function combo(ctX: Dynamic, label: String, currentItem: Int, items: String, ?popupMaXHeigHtInItems: Int): Bool;
/**
 * @nodiscard
 */
@:native("BeginCombo")
public static function beginCombo(ctX: Dynamic, label: String, previeWValue: String, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("SetColorEditOptions")
public static function setColorEditOptions(ctX: Dynamic, flags: Int): Void;
/**
 * @since 0.1
 */
@:native("ColorPicker4")
public static function colorPicker4(ctX: Dynamic, label: String, colRgba: Int, ?flags: Int, ?refCol: Int): Bool;
/**
 * @since 0.1
 */
@:native("ColorPicker3")
public static function colorPicker3(ctX: Dynamic, label: String, colRgb: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("ColorEdit4")
public static function colorEdit4(ctX: Dynamic, label: String, colRgba: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("ColorEdit3")
public static function colorEdit3(ctX: Dynamic, label: String, colRgb: Int, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("ColorButton")
public static function colorButton(ctX: Dynamic, descId: String, colRgba: Int, ?flags: Int, ?sizeW: Float, ?sizeH: Float): Bool;
/**
 * @since 0.1
 */
@:native("SmallButton")
public static function smallButton(ctX: Dynamic, label: String): Bool;
/**
 * @since 0.1
 */
@:native("RadioButtonEx")
public static function radioButtonEx(ctX: Dynamic, label: String, v: Int, vButton: Int): Bool;
/**
 * @since 0.1
 */
@:native("RadioButton")
public static function radioButton(ctX: Dynamic, label: String, active: Bool): Bool;
/**
 * @since 0.1
 */
@:native("PushButtonRepeat")
public static function pushButtonRepeat(ctX: Dynamic, repeat: Bool): Void;
/**
 * @since 0.1
 */
@:native("PopButtonRepeat")
public static function popButtonRepeat(ctX: Dynamic): Void;
/**
 * @since 0.1
 */
@:native("InvisibleButton")
public static function invisibleButton(ctX: Dynamic, strId: String, sizeW: Float, sizeH: Float, ?flags: Int): Bool;
/**
 * @since 0.1
 */
@:native("CheckboxFlags")
public static function checkboxFlags(ctX: Dynamic, label: String, flags: Int, flagsValue: Int): Bool;
/**
 * @since 0.1
 */
@:native("Checkbox")
public static function checkbox(ctX: Dynamic, label: String, v: Bool): Bool;
/**
 * @since 0.1
 */
@:native("Button")
public static function button(ctX: Dynamic, label: String, ?sizeW: Float, ?sizeH: Float): Bool;
/**
 * @since 0.1
 */
@:native("ArrowButton")
public static function arrowButton(ctX: Dynamic, strId: String, dir: Int): Bool;
}