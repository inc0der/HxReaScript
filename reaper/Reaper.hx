package reaper;

import reaper.Types;

@:native("reaper")
extern class Reaper {
/**
 * @overload fun(size: integer, table: reaper.array): reaper.array
 */
@:native("new_array")
public static function newArray(size: Int): ReaperArray;
/**
 * To get more info on stuff that was found under mouse cursor see
 * BR_GetMouseCursorContext_Envelope, BR_GetMouseCursorContext_Item,
 * BR_GetMouseCursorContext_MIDI, BR_GetMouseCursorContext_Position,
 * BR_GetMouseCursorContext_Take, BR_GetMouseCursorContext_Track
 */
@:native("BR_GetMouseCursorContext")
public static function brGetMouseCursorContext(): String;
/**
 * Returns the path to the directory containing imgui.lua, imgui.py and
 * gfx2imgui.lua.
 */
@:native("ImGui_GetBuiltinPath")
public static function imGuiGetBuiltinPath(): String;
/**
 * Write (number) value to shared memory attached-to by gmem_attach(). index can
 * be [0..1<<25).Before you can write into a currently unused variable with
 * index "index", you must call gmem_attach first!
 */
@:native("gmem_write")
public static function gmemWrite(indeX: Int, value: Float): Void;
/**
 * Read (number) value from shared memory attached-to by gmem_attach(). index
 * can be [0..1<<25).returns nil if not available
 */
@:native("gmem_read")
public static function gmemRead(indeX: Int): Float;
/**
 * Causes gmem_read()/gmem_write() to read EEL2/JSFX/Video shared memory segment
 * named by parameter. Set to empty string to detach. 6.20+: returns previous
 * shared memory segment name.Must be called, before you can use a specific
 * gmem-variable-index with gmem_write!
 */
@:native("gmem_attach")
public static function gmemAttach(sHaredMemorYName: String): String;
/**
 * * flag&8: set script toggle state off
 */
@:native("set_action_options")
public static function setActionOptions(flag: Int): Void;
/**
 * Adds code to be executed when the script finishes or is ended by the user.
 * Typically used to clean up after the user terminates defer() or runloop()
 * code.
 */
@:native("atexit")
public static function atexit(_function: () -> Void): Bool;
/**
 * Note that no undo point will be automatically created when the script
 * finishes, unless you create it explicitly.
 */
@:native("runloop")
public static function runloop(_function: () -> Void): Bool;
/**
 * Note that no undo point will be automatically created when the script
 * finishes, unless you create it explicitly.
 */
@:native("defer")
public static function defer(_function: () -> Void): Bool;
/**
 * (flags may include V=virtkey, S=shift, A=alt/option, C=control/command,
 * W=win/control)
 */
@:native("get_action_context")
public static function getActionContext(): Bool;
/**
 * Stop audio preview. id -1 stops all.
 */
@:native("Xen_StopSourcePreview")
public static function xenStopSourcePreview(previeWId: Int): Int;
/**
 * If the given PCM_source does not belong to an existing MediaItem/Take, it
 * will be deleted by the preview system when the preview is stopped.
 */
@:native("Xen_StartSourcePreview")
public static function xenStartSourcePreview(source: PcmSource, gain: Float, loop: Bool, ?outputcHanindeXIn: Int): Int;
/**
 * Get interleaved audio data from media source
 */
@:native("Xen_GetMediaSourceSamples")
public static function xenGetMediaSourceSamples(src: PcmSource, destbuf: Userdata, destbufoffSet: Int, numframes: Int, numcHans: Int, sampleRate: Float, sourcePosition: Float): Int;
/**
 * Write interleaved audio data to disk
 */
@:native("Xen_AudioWriter_Write")
public static function xenAudioWriterWrite(writer: AudioWriter, numframes: Int, data: Userdata, offSet: Int): Int;
/**
 * Destroys writer
 */
@:native("Xen_AudioWriter_Destroy")
public static function xenAudioWriterDestroy(writer: AudioWriter): Void;
/**
 * Creates writer for 32 bit floating point WAV
 */
@:native("Xen_AudioWriter_Create")
public static function xenAudioWriterCreate(fileName: String, numcHans: Int, sampleRate: Int): AudioWriter;
/**
 * [ULT] Deprecated, see GetSetMediaItemInfo_String (v5.95+). Set item notes.
 */
@:native("ULT_SetMediaItemNote")
public static function ultSetMediaItemNote(item: MediaItem, note: String): Void;
/**
 * [ULT] Deprecated, see GetSetMediaItemInfo_String (v5.95+). Get item notes.
 */
@:native("ULT_GetMediaItemNote")
public static function ultGetMediaItemNote(item: MediaItem): String;
/**
 * Focuses the active/open MIDI editor.
 */
@:native("SN_FocusMIDIEditor")
public static function snFocusMidiEditor(): Void;
/**
 * [S&M] Attach Resources slot actions to a given bookmark.
 */
@:native("SNM_TieResourceSlotActions")
public static function snmTieResourceSlotActions(bookmarkId: Int): Void;
/**
 * [S&M] Tags a media file thanks to <a
 * href="https://taglib.github.io">TagLib</a>. Supported tags: "artist",
 * "album", "genre", "comment", "title", "track" (track number) or "year". Use
 * an empty tagval to clear a tag. When a file is opened in REAPER, turn it
 * offline before using this function. Returns false if nothing updated. See
 * SNM_ReadMediaFileTag.
 */
@:native("SNM_TagMediaFile")
public static function snmTagMediaFile(fn: String, tag: String, tagval: String): Bool;
/**
 * [S&M] Sets a string preference (general prefs only). Returns false if failed
 * (e.g. varname not found or value too long). See get_config_var_string.
 */
@:native("SNM_SetStringConfigVar")
public static function snmSetStringConfigVar(varName: String, neWvalue: String): Bool;
/**
 * [S&M] Deprecated, see SetProjectMarker4 -- Same function as
 * SetProjectMarker3() except it can set empty names "".
 */
@:native("SNM_SetProjectMarker")
public static function snmSetProjectMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, num: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String, color: Int): Bool;
/**
 * [S&M] SNM_SetLongConfigVar.
 */
@:native("SNM_SetLongConfigVarEx")
public static function snmSetLongConfigVarEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, varName: String, neWHigHValue: Int, neWLoWValue: Int): Bool;
/**
 * [S&M] Sets a 64-bit integer preference from two 32-bit integers (look in
 * project prefs first, then in general prefs). Returns false if failed (e.g.
 * varname not found).
 */
@:native("SNM_SetLongConfigVar")
public static function snmSetLongConfigVar(varName: String, neWHigHValue: Int, neWLoWValue: Int): Bool;
/**
 * [S&M] See SNM_SetIntConfigVar.
 */
@:native("SNM_SetIntConfigVarEx")
public static function snmSetIntConfigVarEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, varName: String, neWvalue: Int): Bool;
/**
 * [S&M] Sets an integer preference (look in project prefs first, then in
 * general prefs). Returns false if failed (e.g. varname not found or newvalue
 * out of range).
 */
@:native("SNM_SetIntConfigVar")
public static function snmSetIntConfigVar(varName: String, neWvalue: Int): Bool;
/**
 * [S&M] Sets the "fast string" content. Returns str for facility.
 */
@:native("SNM_SetFastString")
public static function snmSetFastString(str: WdlFastString, neWstr: String): WdlFastString;
/**
 * [S&M] See SNM_SetDoubleConfigVar.
 */
@:native("SNM_SetDoubleConfigVarEx")
public static function snmSetDoubleConfigVarEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, varName: String, neWvalue: Float): Bool;
/**
 * [S&M] Sets a floating-point preference (look in project prefs first, then in
 * general prefs). Returns false if failed (e.g. varname not found or newvalue
 * out of range).
 */
@:native("SNM_SetDoubleConfigVar")
public static function snmSetDoubleConfigVar(varName: String, neWvalue: Float): Bool;
/**
 * [S&M] Select a bookmark of the Resources window. Returns the related bookmark
 * id (or -1 if failed).
 */
@:native("SNM_SelectResourceBookmark")
public static function snmSelectResourceBookmark(name: String): Int;
/**
 * [S&M] Removes all receives from srctr. Returns false if nothing updated.
 */
@:native("SNM_RemoveReceivesFrom")
public static function snmRemoveReceivesFrom(tr: MediaTrack, srctr: MediaTrack): Bool;
/**
 * [S&M] Deprecated, see RemoveTrackSend (v5.15pre1+). Removes a receive.
 * Returns false if nothing updated.
 */
@:native("SNM_RemoveReceive")
public static function snmRemoveReceive(tr: MediaTrack, rcvIdX: Int): Bool;
/**
 * [S&M] Reads a media file tag. Supported tags: "artist", "album", "genre",
 * "comment", "title", "track" (track number) or "year". Returns false if tag
 * was not found. See SNM_TagMediaFile.
 */
@:native("SNM_ReadMediaFileTag")
public static function snmReadMediaFileTag(fn: String, tag: String): Bool;
/**
 * fxId: fx index in chain or -1 for the selected fx. what: 0 to remove, -1 to
 * move fx up in chain, 1 to move fx down in chain.
 */
@:native("SNM_MoveOrRemoveTrackFX")
public static function snmMoveOrRemoveTrackFx(tr: MediaTrack, fXId: Int, wHat: Int): Bool;
/**
 * [S&M] Deprecated, see GetMediaSourceType. Gets the source type of a take.
 * Returns false if failed (e.g. take with empty source, etc..)
 */
@:native("SNM_GetSourceType")
public static function snmGetSourceType(take: MediaItemTake, tYpe: WdlFastString): Bool;
/**
 * Note: this function cannot deal with empty takes, see SNM_GetSetSourceState.
 */
@:native("SNM_GetSetSourceState2")
public static function snmGetSetSourceState2(take: MediaItemTake, state: WdlFastString, setneWvalue: Bool): Bool;
/**
 * Note: this function does not use a MediaItem_Take* param in order to manage
 * empty takes (i.e. takes with MediaItem_Take*==NULL), see
 * SNM_GetSetSourceState2.
 */
@:native("SNM_GetSetSourceState")
public static function snmGetSetSourceState(item: MediaItem, takeIdX: Int, state: WdlFastString, setneWvalue: Bool): Bool;
/**
 * Note: unlike the native GetSetObjectState, calling to FreeHeapPtr() is not
 * required.
 */
@:native("SNM_GetSetObjectState")
public static function snmGetSetObjectState(obj: Userdata, state: WdlFastString, setneWvalue: Bool, wantminimalState: Bool): Bool;
/**
 * [S&M] Gets a marker/region name. Returns true if marker/region found.
 */
@:native("SNM_GetProjectMarkerName")
public static function snmGetProjectMarkerName(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, num: Int, isrgn: Bool, name: WdlFastString): Bool;
/**
 * [S&M] Gets a take by GUID as string. The GUID must be enclosed in braces {}.
 * To get take GUID as string, see BR_GetMediaItemTakeGUID
 */
@:native("SNM_GetMediaItemTakeByGUID")
public static function snmGetMediaItemTakeByGuid(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, guId: String): MediaItemTake;
/**
 * [S&M] See SNM_GetLongConfigVar.
 */
@:native("SNM_GetLongConfigVarEx")
public static function snmGetLongConfigVarEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, varName: String): Bool;
/**
 * [S&M] Reads a 64-bit integer preference split in two 32-bit integers (look in
 * project prefs first, then in general prefs). Returns false if failed (e.g.
 * varname not found).
 */
@:native("SNM_GetLongConfigVar")
public static function snmGetLongConfigVar(varName: String): Bool;
/**
 * [S&M] See SNM_GetIntConfigVar.
 */
@:native("SNM_GetIntConfigVarEx")
public static function snmGetIntConfigVarEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, varName: String, errvalue: Int): Int;
/**
 * [S&M] Returns an integer preference (look in project prefs first, then in
 * general prefs). Returns errvalue if failed (e.g. varname not found).
 */
@:native("SNM_GetIntConfigVar")
public static function snmGetIntConfigVar(varName: String, errvalue: Int): Int;
/**
 * [S&M] Gets the "fast string" length.
 */
@:native("SNM_GetFastStringLength")
public static function snmGetFastStringLength(str: WdlFastString): Int;
/**
 * [S&M] Gets the "fast string" content.
 */
@:native("SNM_GetFastString")
public static function snmGetFastString(str: WdlFastString): String;
/**
 * [S&M] See SNM_GetDoubleConfigVar.
 */
@:native("SNM_GetDoubleConfigVarEx")
public static function snmGetDoubleConfigVarEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, varName: String, errvalue: Float): Float;
/**
 * [S&M] Returns a floating-point preference (look in project prefs first, then
 * in general prefs). Returns errvalue if failed (e.g. varname not found).
 */
@:native("SNM_GetDoubleConfigVar")
public static function snmGetDoubleConfigVar(varName: String, errvalue: Float): Float;
/**
 * [S&M] Deletes a "fast string" instance.
 */
@:native("SNM_DeleteFastString")
public static function snmDeleteFastString(str: WdlFastString): Void;
/**
 * [S&M] Instantiates a new "fast string". You must delete this string, see
 * SNM_DeleteFastString.
 */
@:native("SNM_CreateFastString")
public static function snmCreateFastString(str: String): WdlFastString;
/**
 * [S&M] Add an FX parameter knob in the TCP. Returns false if nothing updated
 * (invalid parameters, knob already present, etc..)
 */
@:native("SNM_AddTCPFXParm")
public static function snmAddTcpfxParm(tr: MediaTrack, fXId: Int, prmId: Int): Bool;
/**
 * Note: obeys default sends preferences, supports frozen tracks, etc..
 */
@:native("SNM_AddReceive")
public static function snmAddReceive(src: MediaTrack, dest: MediaTrack, tYpe: Int): Bool;
/**
 * Run pending operations and save the configuration file. If refreshUI is true
 * the browser and manager windows are guaranteed to be refreshed (otherwise it
 * depends on which operations are in the queue).
 */
@:native("ReaPack_ProcessQueue")
public static function reaPackProcessQueue(refresHUi: Bool): Void;
/**
 * autoInstall: 0=manual, 1=when sychronizing, 2=obey user setting
 */
@:native("ReaPack_GetRepositoryInfo")
public static function reaPackGetRepositoryInfo(name: String): Bool;
/**
 * Delete the returned object from memory after use with ReaPack_FreeEntry.
 */
@:native("ReaPack_GetOwner")
public static function reaPackGetOwner(fn: String): PackageEntry;
/**
 * type: 1=script, 2=extension, 3=effect, 4=data, 5=theme, 6=langpack,
 * 7=webinterface
 */
@:native("ReaPack_GetEntryInfo")
public static function reaPackGetEntryInfo(entrY: PackageEntry): Bool;
/**
 * Free resources allocated for the given package entry.
 */
@:native("ReaPack_FreeEntry")
public static function reaPackFreeEntry(entrY: PackageEntry): Bool;
/**
 * type: see ReaPack_GetEntryInfo.
 */
@:native("ReaPack_EnumOwnedFiles")
public static function reaPackEnumOwnedFiles(entrY: PackageEntry, indeX: Int): Bool;
/**
 * Returns 0 if both versions are equal, a positive value if ver1 is higher than
 * ver2 and a negative value otherwise.
 */
@:native("ReaPack_CompareVersions")
public static function reaPackCompareVersions(ver1: String, ver2: String): Int;
/**
 * Opens the package browser with the given filter string.
 */
@:native("ReaPack_BrowsePackages")
public static function reaPackBrowsePackages(filter: String): Void;
/**
 * autoInstall: usually set to 2 (obey user setting).
 */
@:native("ReaPack_AddSetRepository")
public static function reaPackAddSetRepository(name: String, url: String, enable: Bool, autoInstall: Int): Bool;
/**
 * The repository index is downloaded asynchronously if the cached copy doesn't
 * exist or is older than one week.
 */
@:native("ReaPack_AboutRepository")
public static function reaPackAboutRepository(repoName: String): Bool;
/**
 * The repository index is downloaded asynchronously if the cached copy doesn't
 * exist or is older than one week.
 */
@:native("ReaPack_AboutInstalledPackage")
public static function reaPackAboutInstalledPackage(entrY: PackageEntry): Bool;
/**
 * Equivalent to win32 API GetSystemMetrics(). Note: Only SM_C[XY]SCREEN,
 * SM_C[XY][HV]SCROLL and SM_CYMENU are currently supported on macOS and Linux
 * as of REAPER 6.68. Check the <a
 * href="https://github.com/justinfrankel/WDL/blob/main/WDL/swell">SWELL source
 * code</a> for up-to-date support information (swell-wnd.mm,
 * swell-wnd-generic.cpp).
 */
@:native("NF_Win32_GetSystemMetrics")
public static function nfWin32GetSystemMetrics(nIndeX: Int): Int;
/**
 * Redraw the Notes window (call if you've changed a subtitle via
 * NF_SetSWSMarkerRegionSub which is currently displayed in the Notes window and
 * you want to appear the new subtitle immediately.)
 */
@:native("NF_UpdateSWSMarkerRegionSubWindow")
public static function nfUpdateSwsMarkerRegionSubWindow(): Void;
/**
 * Deprecated, see TakeFX_GetNamedConfigParm/'fx_ident' (v6.37+). See
 * BR_TrackFX_GetFXModuleName. fx: counted consecutively across all takes
 * (zero-based).
 */
@:native("NF_TakeFX_GetFXModuleName")
public static function nfTakeFxGetFxModuleName(item: MediaItem, fX: Int): Bool;
/**
 * Set SWS analysis/normalize options (same as running action 'SWS: Set RMS
 * analysis/normalize options'). targetLevel: target RMS normalize level (dB),
 * windowSize: window size for peak RMS (sec.)
 */
@:native("NF_SetSWS_RMSoptions")
public static function nfSetSwsRmSoptions(targetLevel: Float, windowSize: Float): Bool;
/** No description available */
@:native("NF_SetSWSTrackNotes")
public static function nfSetSwsTrackNotes(track: MediaTrack, str: String): Void;
/**
 * Set SWS/S&M marker/region subtitle. markerRegionIdx: Refers to index that can
 * be passed to EnumProjectMarkers (not displayed marker/region index). Returns
 * true if subtitle is set successfully (i.e. marker/region with specified index
 * is present in project). Lua code example <a
 * href="https://github.com/ReaTeam/ReaScripts-Templates/blob/master/Markers%20and%20Regions/NF_Get%20SWS%20markers%20and%20regions%20notes.lua">here</a>.
 */
@:native("NF_SetSWSMarkerRegionSub")
public static function nfSetSwsMarkerRegionSub(markerRegionSub: String, markerRegionIdX: Int): Bool;
/**
 * Only works for actions / scripts from Main action section. Project must be
 * saved after setting project track selection action to be persistent.
 */
@:native("NF_SetProjectTrackSelectionAction")
public static function nfSetProjectTrackSelectionAction(str: String): Bool;
/**
 * Only works for actions / scripts from Main action section. Project must be
 * saved after setting project startup action to be persistent.
 */
@:native("NF_SetProjectStartupAction")
public static function nfSetProjectStartupAction(str: String): Bool;
/**
 * NOnly works for actions / scripts from Main action section.
 */
@:native("NF_SetGlobalStartupAction")
public static function nfSetGlobalStartupAction(str: String): Bool;
/**
 * 100 means scroll one page. Negative values scroll left.
 */
@:native("NF_ScrollHorizontallyByPercentage")
public static function nfScrollHorizontallyByPercentage(amount: Int): Void;
/**
 * Returns the bitrate of an audio file in kb/s if available (0 otherwise). For
 * supported filetypes see <a
 * href="https://taglib.org/api/classTagLib_1_1AudioProperties.html#ae5b7650b50f8c8f8cc022f25cfee48c5">TagLib::AudioProperties::bitrate</a>.
 */
@:native("NF_ReadAudioFileBitrate")
public static function nfReadAudioFileBitrate(fn: String): Int;
/** No description available */
@:native("NF_GetThemeDefaultTCPHeights")
public static function nfGetThemeDefaultTcpHeights(): Int;
/**
 * Get SWS analysis/normalize options. See NF_SetSWS_RMSoptions.
 */
@:native("NF_GetSWS_RMSoptions")
public static function nfGetSwsRmSoptions(): Float;
/** No description available */
@:native("NF_GetSWSTrackNotes")
public static function nfGetSwsTrackNotes(track: MediaTrack): String;
/**
 * Returns SWS/S&M marker/region subtitle. markerRegionIdx: Refers to index that
 * can be passed to EnumProjectMarkers (not displayed marker/region index).
 * Returns empty string if marker/region with specified index not found or
 * marker/region subtitle not set. Lua code example <a
 * href="https://github.com/ReaTeam/ReaScripts-Templates/blob/master/Markers%20and%20Regions/NF_Get%20SWS%20markers%20and%20regions%20notes.lua">here</a>.
 */
@:native("NF_GetSWSMarkerRegionSub")
public static function nfGetSwsMarkerRegionSub(markerRegionIdX: Int): String;
/**
 * Gets action description and command ID number (for native actions) or named
 * command IDs / identifier strings (for extension actions /ReaScripts) if
 * project track selection action is set, otherwise empty string. Returns false
 * on failure.
 */
@:native("NF_GetProjectTrackSelectionAction")
public static function nfGetProjectTrackSelectionAction(): Bool;
/**
 * Gets action description and command ID number (for native actions) or named
 * command IDs / identifier strings (for extension actions /ReaScripts) if
 * project startup action is set, otherwise empty string. Returns false on
 * failure.
 */
@:native("NF_GetProjectStartupAction")
public static function nfGetProjectStartupAction(): Bool;
/**
 * Obeys 'Window size for peak RMS' setting in 'SWS: Set RMS analysis/normalize
 * options' for calculation. Returns -150.0 if MIDI take or empty item.
 */
@:native("NF_GetMediaItemPeakRMS_Windowed")
public static function nfGetMediaItemPeakRmsWindowed(item: MediaItem): Float;
/**
 * Returns -150.0 if MIDI take or empty item.
 */
@:native("NF_GetMediaItemPeakRMS_NonWindowed")
public static function nfGetMediaItemPeakRmsNonWindowed(item: MediaItem): Float;
/**
 * See NF_GetMediaItemMaxPeak, additionally returns maxPeakPos (relative to item
 * position).
 */
@:native("NF_GetMediaItemMaxPeakAndMaxPeakPos")
public static function nfGetMediaItemMaxPeakAndMaxPeakPos(item: MediaItem): Float;
/**
 * Returns -150.0 if MIDI take or empty item.
 */
@:native("NF_GetMediaItemMaxPeak")
public static function nfGetMediaItemMaxPeak(item: MediaItem): Float;
/**
 * Returns -150.0 if MIDI take or empty item.
 */
@:native("NF_GetMediaItemAverageRMS")
public static function nfGetMediaItemAverageRms(item: MediaItem): Float;
/**
 * Gets action description and command ID number (for native actions) or named
 * command IDs / identifier strings (for extension actions /ReaScripts) if
 * global startup action is set, otherwise empty string. Returns false on
 * failure.
 */
@:native("NF_GetGlobalStartupAction")
public static function nfGetGlobalStartupAction(): Bool;
/**
 * Deletes a take from an item. takeIdx is zero-based. Returns true on success.
 */
@:native("NF_DeleteTakeFromItem")
public static function nfDeleteTakeFromItem(item: MediaItem, takeIdX: Int): Bool;
/**
 * Returns true if project track selection action was cleared successfully.
 */
@:native("NF_ClearProjectTrackSelectionAction")
public static function nfClearProjectTrackSelectionAction(): Bool;
/**
 * Returns true if project startup action was cleared successfully.
 */
@:native("NF_ClearProjectStartupAction")
public static function nfClearProjectStartupAction(): Bool;
/**
 * Returns true if global startup action was cleared successfully.
 */
@:native("NF_ClearGlobalStartupAction")
public static function nfClearGlobalStartupAction(): Bool;
/**
 * Input string may contain null bytes in REAPER 6.44 or newer. Note: Doesn't
 * allow padding in the middle (e.g. concatenated encoded strings), doesn't
 * allow newlines.
 */
@:native("NF_Base64_Encode")
public static function nfBase64Encode(str: String, usePadding: Bool): String;
/**
 * Returns true on success.
 */
@:native("NF_Base64_Decode")
public static function nfBase64Decode(base64Str: String): Bool;
/**
 * Does LUFS integrated analysis only. Faster than full loudness analysis
 * (NF_AnalyzeTakeLoudness) . Use this if only LUFS integrated is required. Take
 * vol. env. is taken into account. See: <a
 * href="http://wiki.cockos.com/wiki/index.php/Measure_and_normalize_loudness_with_SWS">Signal
 * flow</a>
 */
@:native("NF_AnalyzeTakeLoudness_IntegratedOnly")
public static function nfAnalyzeTakeLoudnessIntegratedOnly(take: MediaItemTake): Bool;
/**
 * Same as NF_AnalyzeTakeLoudness but additionally returns shortTermMaxPos and
 * momentaryMaxPos (in absolute project time). Note: shortTermMaxPos and
 * momentaryMaxPos indicate the beginning of time <em>intervalls</em>, (3 sec.
 * and 0.4 sec. resp.).
 */
@:native("NF_AnalyzeTakeLoudness2")
public static function nfAnalyzeTakeLoudness2(take: MediaItemTake, analYzeTruePeak: Bool): Bool;
/**
 * Full loudness analysis. retval: returns true on successful analysis, false on
 * MIDI take or when analysis failed for some reason. analyzeTruePeak=true: Also
 * do true peak analysis. Returns true peak value in dBTP and true peak position
 * (relative to item position). Considerably slower than without true peak
 * analysis (since it uses oversampling). Note: Short term uses a time window of
 * 3 sec. for calculation. So for items shorter than this shortTermMaxOut can't
 * be calculated correctly. Momentary uses a time window of 0.4 sec.
 */
@:native("NF_AnalyzeTakeLoudness")
public static function nfAnalyzeTakeLoudness(take: MediaItemTake, analYzeTruePeak: Bool): Bool;
/**
 * This function combines all other NF_Peak/RMS functions in a single one and
 * additionally returns peak RMS positions. Lua example code <a
 * href="https://forum.cockos.com/showpost.php?p=2050961&postcount=6">here</a>.
 * Note: It's recommended to use this function with ReaScript/Lua as it provides
 * reaper.array objects. If using this function with other scripting languages,
 * you must provide arrays in the <a
 * href="https://forum.cockos.com/showpost.php?p=2039829&postcount=2">reaper.array</a>
 * format.
 */
@:native("NF_AnalyzeMediaItemPeakAndRMS")
public static function nfAnalyzeMediaItemPeakAndRms(item: MediaItem, windowSize: Float, reaperArraYPeaks: Userdata, reaperArraYPeakPositions: Userdata, reaperArraYRmSs: Userdata, reaperArraYRmSPositions: Userdata): Bool;
/**
 * Write MRP_Array to disk as a 32 bit floating point mono wav file
 */
@:native("MRP_WriteArrayToFile")
public static function mrpWriteArrayToFile(arraY: MrpArray, fileName: String, sampleRate: Float): Void;
/**
 * Set window title
 */
@:native("MRP_WindowSetTitle")
public static function mrpWindowSetTitle(windoW: MrpWindow, title: String): Void;
/**
 * Returns true if control was manipulated
 */
@:native("MRP_WindowIsDirtyControl")
public static function mrpWindowIsDirtyControl(windoW: MrpWindow, controlName: String): Bool;
/**
 * Returns if the window has been closed and the ReaScript defer loop should
 * likely be exited
 */
@:native("MRP_WindowIsClosed")
public static function mrpWindowIsClosed(windoW: MrpWindow): Bool;
/**
 * Clears the dirty states of the controls in a window.
 */
@:native("MRP_WindowClearDirtyControls")
public static function mrpWindowClearDirtyControls(windoW: MrpWindow): Void;
/**
 * Add a control to window. Controltypename is the type of control to create.
 * Objectname must be a unique id
 */
@:native("MRP_WindowAddControl")
public static function mrpWindowAddControl(windoW: MrpWindow, controltYpeName: String, objectName: String): Void;
/**
 * Set window dirty state (ie, if something was changed in the controls)
 */
@:native("MRP_SetWindowDirty")
public static function mrpSetWindowDirty(windoW: MrpWindow, wHicH: Int, state: Bool): Void;
/**
 * Set a text property associated with control. Meaning of 'which' depends on
 * the control targeted.
 */
@:native("MRP_SetControlString")
public static function mrpSetControlString(windoW: MrpWindow, controlName: String, wHicH: Int, teXt: String): Void;
/**
 * Set an integer point number associated with control. Meaning of 'which'
 * depends on the control targeted.
 */
@:native("MRP_SetControlIntNumber")
public static function mrpSetControlIntNumber(windoW: MrpWindow, controlName: String, wHicH: Int, value: Int): Void;
/**
 * Set a floating point number associated with control. Meaning of 'which'
 * depends on the control targeted.
 */
@:native("MRP_SetControlFloatNumber")
public static function mrpSetControlFloatNumber(windoW: MrpWindow, controlName: String, wHicH: Int, value: Float): Void;
/**
 * Set MRP control position and size
 */
@:native("MRP_SetControlBounds")
public static function mrpSetControlBounds(windoW: MrpWindow, name: String, x: Float, y: Float, w: Float, h: Float): Void;
/**
 * Set MRP_Array element value. No safety checks done for array or index
 * validity, so use at your own peril!
 */
@:native("MRP_SetArrayValue")
public static function mrpSetArrayValue(arraY: MrpArray, indeX: Int, value: Float): Void;
/**
 * Send a command message to control. Currently only the envelope control
 * understands some messages.
 */
@:native("MRP_SendCommandString")
public static function mrpSendCommandString(windoW: MrpWindow, controlName: String, commandteXt: String): Void;
/**
 * return media item
 */
@:native("MRP_ReturnMediaItem")
public static function mrpReturnMediaItem(): MediaItem;
/**
 * Multiply 2 MRP_Arrays of same length. Result is written to 3rd array. Uses
 * multiple threads.
 */
@:native("MRP_MultiplyArraysMT")
public static function mrpMultiplyArraysMt(arraY1: MrpArray, arraY2: MrpArray, arraY3: MrpArray): Void;
/**
 * Multiply 2 MRP_Arrays of same length. Result is written to 3rd array.
 */
@:native("MRP_MultiplyArrays")
public static function mrpMultiplyArrays(arraY1: MrpArray, arraY2: MrpArray, arraY3: MrpArray): Void;
/**
 * add two numbers
 */
@:native("MRP_IntPointer")
public static function mrpIntPointer(n1: Int, n2: Int): Int;
/**
 * Get window geometry values. which : 0 x, 1 y, 2 w, 3 h
 */
@:native("MRP_GetWindowPosSizeValue")
public static function mrpGetWindowPosSizeValue(windoW: MrpWindow, wHicH: Int): Int;
/**
 * Get window dirty state (ie, if something was changed in the window). which :
 * 0 window size
 */
@:native("MRP_GetWindowDirty")
public static function mrpGetWindowDirty(windoW: MrpWindow, wHicHDirtY: Int): Bool;
/**
 * Get an integer point number associated with control. Meaning of 'which'
 * depends on the control targeted.
 */
@:native("MRP_GetControlIntNumber")
public static function mrpGetControlIntNumber(windoW: MrpWindow, controlName: String, wHicH: Int): Int;
/**
 * Get a floating point number associated with control. Meaning of 'which'
 * depends on the control targeted.
 */
@:native("MRP_GetControlFloatNumber")
public static function mrpGetControlFloatNumber(windoW: MrpWindow, controlName: String, wHicH: Int): Float;
/**
 * Get MRP_Array element value. No safety checks done for array or index
 * validity, so use at your own peril!
 */
@:native("MRP_GetArrayValue")
public static function mrpGetArrayValue(arraY: MrpArray, indeX: Int): Float;
/**
 * Generate a sine wave into a MRP_Array
 */
@:native("MRP_GenerateSine")
public static function mrpGenerateSine(arraY: MrpArray, sampleRate: Float, frequencY: Float): Void;
/**
 * add two numbers
 */
@:native("MRP_DoublePointerAsInt")
public static function mrpDoublePointerAsInt(n1: Float, n2: Float): Int;
/**
 * add two numbers
 */
@:native("MRP_DoublePointer")
public static function mrpDoublePointer(n1: Float, n2: Float): Float;
/**
 * do nothing, return null
 */
@:native("MRP_DoNothing")
public static function mrpDoNothing(): Void;
/**
 * Destroy window
 */
@:native("MRP_DestroyWindow")
public static function mrpDestroyWindow(windoW: MrpWindow): Void;
/**
 * Destroy a previously created MRP_Array
 */
@:native("MRP_DestroyArray")
public static function mrpDestroyArray(arraY: MrpArray): Void;
/**
 * Create window
 */
@:native("MRP_CreateWindow")
public static function mrpCreateWindow(title: String): MrpWindow;
/**
 * Create an array of 64 bit floating point numbers. Note that these will leak
 * memory if they are not later destroyed with MRP_DestroyArray!
 */
@:native("MRP_CreateArray")
public static function mrpCreateArray(size: Int): MrpArray;
/**
 * add two numbers
 */
@:native("MRP_CastDoubleToInt")
public static function mrpCastDoubleToInt(n1: Float, n2: Float): Int;
/**
 * This <em>function</em> isn't really <strong>correct...</strong> it calculates
 * a 64 bit hash but returns it as a 32 bit int. Should reimplement this. Or
 * rather, even more confusingly : The hash will be 32 bit when building for 32
 * bit architecture and 64 bit when building for 64 bit architecture! It comes
 * down to how size_t is of different size between the 32 and 64 bit
 * architectures.
 */
@:native("MRP_CalculateEnvelopeHash")
public static function mrpCalculateEnvelopeHash(env: TrackEnvelope): Int;
/**
 * 2 : 'mode-is-global' bitmask/flags, first 6 bits
 */
@:native("MCULive_SetOption")
public static function mcuLiveSetOption(option: Int, value: Int): Void;
/**
 * Set meter value 0 ... 1.0. Type 0 = linear, 1 = track volume (with decay).
 */
@:native("MCULive_SetMeterValue")
public static function mcuLiveSetMeterValue(device: Int, meterIdX: Int, val: Float, tYpe: Int): Int;
/**
 * Set fader to value 0 ... 1.0. Type 0 = linear, 1 = track volume, 2 = pan.
 * Returns scaled value.
 */
@:native("MCULive_SetFaderValue")
public static function mcuLiveSetFaderValue(device: Int, faderIdX: Int, val: Float, tYpe: Int): Int;
/**
 * Set encoder to value 0 ... 1.0. Type 0 = linear, 1 = track volume, 2 = pan.
 * Returns scaled value.
 */
@:native("MCULive_SetEncoderValue")
public static function mcuLiveSetEncoderValue(device: Int, encIdX: Int, val: Float, tYpe: Int): Int;
/**
 * Write to display. 112 characters, 56 per row.
 */
@:native("MCULive_SetDisplay")
public static function mcuLiveSetDisplay(device: Int, pos: Int, message: String, pad: Int): Void;
/**
 * Enables/disables default out-of-the-box operation.
 */
@:native("MCULive_SetDefault")
public static function mcuLiveSetDefault(device: Int, isSet: Bool): Void;
/**
 * Set button led/mode/state. Value 0 = off,1 = blink, 0x7f = on, usually.
 */
@:native("MCULive_SetButtonValue")
public static function mcuLiveSetButtonValue(device: Int, button: Int, value: Int): Int;
/**
 * Buttons function as press only by default. Set false for press and release
 * function.
 */
@:native("MCULive_SetButtonPressOnly")
public static function mcuLiveSetButtonPressOnly(device: Int, button: Int, isSet: Bool): Int;
/**
 * Set button as MIDI passthrough.
 */
@:native("MCULive_SetButtonPassthrough")
public static function mcuLiveSetButtonPassthrough(device: Int, button: Int, isSet: Bool): Int;
/**
 * Sends MIDI message to device. If string is provided, individual bytes are not
 * sent. Returns number of sent bytes.
 */
@:native("MCULive_SendMIDIMessage")
public static function mcuLiveSendMidiMessage(device: Int, status: Int, data1: Int, data2: Int, ?msgIn: String): Int;
/**
 * Reset device. device < 0 resets all and returns number of devices.
 */
@:native("MCULive_Reset")
public static function mcuLiveReset(device: Int): Int;
/**
 * ex vv vv : set volume fader, x=track index, 8=master
 */
@:native("MCULive_Map")
public static function mcuLiveMap(device: Int, button: Int, commandId: Int, isRemap: Bool): Int;
/**
 * Gets MIDI message from input buffer/queue. Gets (pops/pulls) indexed message
 * (status, data1, data2 and frame_offset) from queue and retval is total
 * size/length left in queue. E.g. continuously read all indiviual messages with
 * deferred script. Frame offset resolution is 1/1024000 seconds, not audio
 * samples. Long messages are returned as optional strings of byte characters.
 * msgIdx -1 returns size (length) of buffer. Read also non-MCU devices by
 * creating MCULive device with their input.
 */
@:native("MCULive_GetMIDIMessage")
public static function mcuLiveGetMidiMessage(device: Int, msgIdX: Int): Int;
/**
 * Returns zero-indexed fader parameter value. 0 = lastpos, 1 = lasttouch, 2 =
 * lastmove (any fader)
 */
@:native("MCULive_GetFaderValue")
public static function mcuLiveGetFaderValue(device: Int, faderIdX: Int, param: Int): Float;
/**
 * Returns zero-indexed encoder parameter value. 0 = lastpos, 1 = lasttouch
 */
@:native("MCULive_GetEncoderValue")
public static function mcuLiveGetEncoderValue(device: Int, encIdX: Int, param: Int): Float;
/**
 * Get MIDI input or output dev ID. type 0 is input dev, type 1 is output dev.
 * device < 0 returns number of MCULive devices.
 */
@:native("MCULive_GetDevice")
public static function mcuLiveGetDevice(device: Int, tYpe: Int): Int;
/**
 * Get current button state.
 */
@:native("MCULive_GetButtonValue")
public static function mcuLiveGetButtonValue(device: Int, button: Int): Int;
/**
 * Set safed. Set isSet = true to safe fx name. Set isSet = false to unsafe fx
 * name.
 */
@:native("Llm_SetSafed")
public static function llmSetSafed(fXName: String, isSet: Bool): String;
/**
 * Set pdc limit as factor of audio buffer size.
 */
@:native("Llm_SetPdcLimit")
public static function llmSetPdcLimit(pdcFactor: Float): Void;
/**
 * Set parameter change. Set val1 = val2 to clear change. Set parameter_index =
 * -666 to clear all changes. Use this function to set parameter changes between
 * values val1 and val2 for fx_name and parameter_index instead of disabling the
 * effect. Use custom fx names to identify individual fx.
 */
@:native("Llm_SetParameterChange")
public static function llmSetParameterChange(fXName: String, parameterIndeX: Int, val1: Float, val2: Float): Void;
/**
 * Set to include MonitoringFX. In REAPER land this means the fx on the master
 * track record fx chain. Indexed as fx# + 0x1000000, 0-based.
 */
@:native("Llm_SetMonitoringFX")
public static function llmSetMonitoringFx(enable: Bool): Void;
/**
 * Set keep pdc
 */
@:native("Llm_SetKeepPdc")
public static function llmSetKeepPdc(enable: Bool): Void;
/**
 * Set clear safe. Set clear_manually_safed_fx = true to clear manually safed fx
 */
@:native("Llm_SetClearSafe")
public static function llmSetClearSafe(cleArManuallYSafedFX: Bool): Void;
/**
 * Get version. Returns the version of the plugin as integers and the commit
 * hash as a string. The string is truncated to commitOut_sz.
 */
@:native("Llm_GetVersion")
public static function llmGetVersion(): Int;
/**
 * Get safed. Returns a string of the form "track:fx;track:fx;..." where track
 * is the track number and fx is the fx index. The string is truncated to
 * safeStringOut_sz. 1-based indexing is used. The string is followed by a |
 * delimited list of fx names that have been set safed.
 */
@:native("Llm_GetSafed")
public static function llmGetSafed(): String;
/**
 * Get paths. Returns a string of the form
 * "start:fx#1.fx#2...;track:fxs;...;end:fxs" where track is the track number
 * and fx is the fx index. The string is truncated to pathStringOut_sz. 1-based
 * indexing is used. If no MediaTrack* start is provided, all monitored input
 * tracks are used. If no MediaTrack* end is provided, all hardware output
 * tracks are used. If includeFx is true, the fx indices are included.
 */
@:native("Llm_GetPaths")
public static function llmGetPaths(includeFX: Bool, ?startIn: MediaTrack, ?endIn: MediaTrack): String;
/**
 * Do. Call this function to run one ReaLlm cycle. Use this function to run
 * ReaLlm on arbitrary time intervals e.g. from a deferred script.
 */
@:native("Llm_Do")
public static function llmDo(): Void;
/**
 * * The original zip specification did not support Unicode. Some applications
 * still use this outdated specification by default, or try to use the local
 * code page. This may lead to incompatibility and incorrect retrieval of file
 * or entry names.
 */
@:native("JS_Zip_Open")
public static function jsZipOpen(zipFile: String, mode: String, compressionLevel: Int): Userdata;
/**
 * On error, returns a negative number (< 0).
 */
@:native("JS_Zip_ListAllEntries")
public static function jsZipListAllEntries(zipHandle: Userdata): Int;
/**
 * Returns the number of extracted files on success, negative number (< 0) on
 * error.
 */
@:native("JS_Zip_Extract")
public static function jsZipExtract(zipFile: String, outputFolder: String): Int;
/**
 * Returns a descriptive string for the given error code.
 */
@:native("JS_Zip_ErrorString")
public static function jsZipErrorString(errorNum: Int): String;
/**
 * Returns 0 on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_OpenByName")
public static function jsZipEntryOpenByName(zipHandle: Userdata, entrYName: String): Int;
/**
 * Returns 0 on success, negative number on error.
 */
@:native("JS_Zip_Entry_OpenByIndex")
public static function jsZipEntryOpenByIndex(zipHandle: Userdata, indeX: Int): Int;
/**
 * Returns information about the zip archive's open entry.
 */
@:native("JS_Zip_Entry_Info")
public static function jsZipEntryInfo(zipHandle: Userdata): Int;
/**
 * Returns the number of bytes extracted on success, negative number (< 0) on
 * error.
 */
@:native("JS_Zip_Entry_ExtractToMemory")
public static function jsZipEntryExtractToMemory(zipHandle: Userdata): Int;
/**
 * Returns 0 on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_ExtractToFile")
public static function jsZipEntryExtractToFile(zipHandle: Userdata, outputFile: String): Int;
/**
 * Returns 0 on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_CompressMemory")
public static function jsZipEntryCompressMemory(zipHandle: Userdata, buf: String, bufSize: Int): Int;
/**
 * Returns 0 on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_CompressFile")
public static function jsZipEntryCompressFile(zipHandle: Userdata, inputFile: String): Int;
/**
 * Returns 0 on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_Close")
public static function jsZipEntryClose(zipHandle: Userdata): Int;
/**
 * Returns the number of deleted entries on success, negative number (< 0) on
 * error.
 */
@:native("JS_Zip_DeleteEntries")
public static function jsZipDeleteEntries(zipHandle: Userdata, entrYNames: String, entrYNamesStrLen: Int): Int;
/** No description available */
@:native("JS_Zip_CountEntries")
public static function jsZipCountEntries(zipHandle: Userdata): Int;
/**
 * Closes the zip archive, using either the file name or the zip handle.
 * Finalizes entries and releases resources.
 */
@:native("JS_Zip_Close")
public static function jsZipClose(zipFile: String, ?zipHandle: Userdata): Int;
/**
 * Similar to the Win32 function UpdateWindow.
 */
@:native("JS_Window_Update")
public static function jsWindowUpdate(windowHwnd: Userdata): Void;
/**
 * * state: One of the following options: "SHOW", "SHOWNA" (or
 * "SHOWNOACTIVATE"), "SHOWMINIMIZED", "HIDE", "NORMAL", "SHOWNORMAL",
 * "SHOWMAXIMIZED", "SHOWDEFAULT" or "RESTORE". On Linux and macOS, only the
 * first four options are fully implemented.
 */
@:native("JS_Window_Show")
public static function jsWindowShow(windowHwnd: Userdata, state: String): Void;
/**
 * * InsertAfterHWND: For compatibility with older versions, this parameter is
 * still available, and is optional. If ZOrder is "INSERTAFTER", insertAfterHWND
 * must be a handle to the window behind which windowHWND will be placed in the
 * Z order, equivalent to setting ZOrder to this HWND; otherwise,
 * insertAfterHWND is ignored and can be left out (or it can simply be set to
 * the same value as windowHWND).
 */
@:native("JS_Window_SetZOrder")
public static function jsWindowSetZorder(windowHwnd: Userdata, zorder: String, ?insertAfterHWnd: Userdata): Bool;
/**
 * Changes the title of the specified window. Returns true if successful.
 */
@:native("JS_Window_SetTitle")
public static function jsWindowSetTitle(windowHwnd: Userdata, title: String): Bool;
/**
 * On Linux and macOS, "MAXIMIZE" has not yet been implmented, and the remaining
 * styles may appear slightly different from their WindowsOS counterparts.
 */
@:native("JS_Window_SetStyle")
public static function jsWindowSetStyle(windowHwnd: Userdata, stYle: String): Bool;
/**
 * NOTE: API functions can scroll REAPER's windows, but cannot zoom them. 
 * Instead, use actions such as "View: Zoom to one loop iteration".
 */
@:native("JS_Window_SetScrollPos")
public static function jsWindowSetScrollPos(windowHwnd: Userdata, scrollbar: String, position: Int): Bool;
/**
 * * flags: Any combination of the standard flags, of which "NOMOVE", "NOSIZE",
 * "NOZORDER", "NOACTIVATE", "SHOWWINDOW", "FRAMECHANGED" and "NOCOPYBITS"
 * should be valid cross-platform.
 */
@:native("JS_Window_SetPosition")
public static function jsWindowSetPosition(windowHwnd: Userdata, left: Int, top: Int, wIdtH: Int, heigHt: Int, ?zorder: String, ?flags: String): Bool;
/**
 * Only on WindowsOS: If parentHWND is not specified, the desktop window becomes
 * the new parent window.
 */
@:native("JS_Window_SetParent")
public static function jsWindowSetParent(cHildHWnd: Userdata, ?parentHWnd: Userdata): Userdata;
/**
 * Transparency can only be applied to top-level windows. If windowHWND refers
 * to a child window, the entire top-level window that contains windowHWND will
 * be made transparent.
 */
@:native("JS_Window_SetOpacity")
public static function jsWindowSetOpacity(windowHwnd: Userdata, mode: String, value: Float): Bool;
/**
 * info: "USERDATA", "WNDPROC", "DLGPROC", "ID", "EXSTYLE" or "STYLE", and only
 * on WindowOS, "INSTANCE" and "PARENT".
 */
@:native("JS_Window_SetLong")
public static function jsWindowSetLong(windowHwnd: Userdata, info: String, value: Float): Float;
/**
 * Brings the specified window into the foreground, activates the window, and
 * directs keyboard input to it.
 */
@:native("JS_Window_SetForeground")
public static function jsWindowSetForeground(windowHwnd: Userdata): Void;
/**
 * Sets the keyboard focus to the specified window.
 */
@:native("JS_Window_SetFocus")
public static function jsWindowSetFocus(windowHwnd: Userdata): Void;
/**
 * * On all platforms, client coordinates are relative to the upper left corner
 * of the client area.
 */
@:native("JS_Window_ScreenToClient")
public static function jsWindowScreenToClient(windowHwnd: Userdata, x: Int, y: Int): Int;
/**
 * * Equivalent to calling JS_Window_SetPosition with NOMOVE, NOZORDER,
 * NOACTIVATE and NOOWNERZORDER flags set.
 */
@:native("JS_Window_Resize")
public static function jsWindowResize(windowHwnd: Userdata, wIdtH: Int, heigHt: Int): Void;
/**
 * In the case of windows that are listed among the Action list's contexts (such
 * as the Media Explorer), the commandIDs of the actions in the Actions list may
 * be used.
 */
@:native("JS_Window_OnCommand")
public static function jsWindowOnCommand(windowHwnd: Userdata, commandId: Int): Bool;
/**
 * * Equivalent to calling JS_Window_SetPosition with NOSIZE, NOZORDER,
 * NOACTIVATE and NOOWNERZORDER flags set.
 */
@:native("JS_Window_Move")
public static function jsWindowMove(windowHwnd: Userdata, left: Int, top: Int): Void;
/**
 * Deprecated - use GetViewportFromRect instead.
 */
@:native("JS_Window_MonitorFromRect")
public static function jsWindowMonitorFromRect(x1: Int, y1: Int, x2: Int, y2: Int, wantWork: Bool): Int;
/**
 * * exact: Match entire title exactly, or match substring of title.
 */
@:native("JS_Window_ListFind")
public static function jsWindowListFind(title: String, eXact: Bool): Int;
/**
 * * list: A comma-separated string of hexadecimal values. Each value is an
 * address that can be converted to a HWND by the function
 * Window_HandleFromAddress.
 */
@:native("JS_Window_ListAllTop")
public static function jsWindowListAllTop(): Int;
/**
 * Each value is an address that can be converted to a HWND by the function
 * Window_HandleFromAddress.
 */
@:native("JS_Window_ListAllChild")
public static function jsWindowListAllChild(parentHWnd: Userdata): Int;
/**
 * NOTE: Since REAPER v5.974, windows can be checked using the native function
 * ValidatePtr(windowHWND, "HWND").
 */
@:native("JS_Window_IsWindow")
public static function jsWindowIsWindow(windowHwnd: Userdata): Bool;
/**
 * Determines the visibility state of the window.
 */
@:native("JS_Window_IsVisible")
public static function jsWindowIsVisible(windowHwnd: Userdata): Bool;
/**
 * Determines whether a window is a child window or descendant window of a
 * specified parent window.
 */
@:native("JS_Window_IsChild")
public static function jsWindowIsChild(parentHWnd: Userdata, cHildHWnd: Userdata): Bool;
/**
 * Similar to the Win32 function InvalidateRect.
 */
@:native("JS_Window_InvalidateRect")
public static function jsWindowInvalidateRect(windowHwnd: Userdata, left: Int, top: Int, rigHt: Int, bottom: Int, eraseBackground: Bool): Bool;
/**
 * Converts an address to a handle (such as a HWND) that can be utilized by
 * REAPER and other API functions.
 */
@:native("JS_Window_HandleFromAddress")
public static function jsWindowHandleFromAddress(address: Float): Userdata;
/**
 * wantWork: Returns the work area of the display, which excludes the system
 * taskbar or application desktop toolbars.
 */
@:native("JS_Window_GetViewportFromRect")
public static function jsWindowGetViewportFromRect(x1: Int, y1: Int, x2: Int, y2: Int, wantWork: Bool): Int;
/**
 * Returns the title (if any) of the specified window.
 */
@:native("JS_Window_GetTitle")
public static function jsWindowGetTitle(windowHwnd: Userdata): String;
/**
 * * Leftmost or topmost visible pixel position, as well as the visible page
 * size, the range minimum and maximum, and scroll box tracking position.
 */
@:native("JS_Window_GetScrollInfo")
public static function jsWindowGetScrollInfo(windowHwnd: Userdata, scrollbar: String): Bool;
/**
 * (Refer to documentation for Win32 C++ function GetWindow.)
 */
@:native("JS_Window_GetRelated")
public static function jsWindowGetRelated(windowHwnd: Userdata, relation: String): Userdata;
/**
 * * The pixel at (right, bottom) lies immediately outside the rectangle.
 */
@:native("JS_Window_GetRect")
public static function jsWindowGetRect(windowHwnd: Userdata): Bool;
/**
 * Returns NULL if the window is unowned or if the function otherwise fails.
 */
@:native("JS_Window_GetParent")
public static function jsWindowGetParent(windowHwnd: Userdata): Userdata;
/**
 * If the function fails, a null pointer is returned.
 */
@:native("JS_Window_GetLongPtr")
public static function jsWindowGetLongPtr(windowHwnd: Userdata, info: String): Userdata;
/**
 * If the function fails, the return value is 0.
 */
@:native("JS_Window_GetLong")
public static function jsWindowGetLong(windowHwnd: Userdata, info: String): Float;
/**
 * Retrieves a HWND to the top-level foreground window (the window with which
 * the user is currently working).
 */
@:native("JS_Window_GetForeground")
public static function jsWindowGetForeground(): Userdata;
/**
 * Retrieves a HWND to the window that has the keyboard focus, if the window is
 * attached to the calling thread's message queue.
 */
@:native("JS_Window_GetFocus")
public static function jsWindowGetFocus(): Userdata;
/** No description available */
@:native("JS_Window_GetClientSize")
public static function jsWindowGetClientSize(windowHwnd: Userdata): Bool;
/**
 * * On macOS, screen coordinates are relative to the *bottom* left corner of
 * the primary display, and the positive Y-axis points upward.
 */
@:native("JS_Window_GetClientRect")
public static function jsWindowGetClientRect(windowHwnd: Userdata): Bool;
/**
 * WARNING: May not be fully implemented on macOS and Linux.
 */
@:native("JS_Window_GetClassName")
public static function jsWindowGetClassName(windowHwnd: Userdata): String;
/**
 * * On macOS, screen coordinates are relative to the *bottom* left corner of
 * the primary display, and the positive Y-axis points upward.
 */
@:native("JS_Window_FromPoint")
public static function jsWindowFromPoint(x: Int, y: Int): Userdata;
/**
 * * exact: Match entire title length, or match substring of title. In both
 * cases, matching is not case sensitive.
 */
@:native("JS_Window_FindTop")
public static function jsWindowFindTop(title: String, eXact: Bool): Userdata;
/**
 * * title: An empty string, "", will match all windows. (Search is not case
 * sensitive.)
 */
@:native("JS_Window_FindEx")
public static function jsWindowFindEx(parentHWnd: Userdata, cHildHWnd: Userdata, className: String, title: String): Userdata;
/**
 * (The ID of a window may be retrieved by JS_Window_GetLongPtr.)
 */
@:native("JS_Window_FindChildByID")
public static function jsWindowFindChildById(parentHWnd: Userdata, id: Int): Userdata;
/**
 * * exact: Match entire title length, or match substring of title. In both
 * cases, matching is not case sensitive.
 */
@:native("JS_Window_FindChild")
public static function jsWindowFindChild(parentHWnd: Userdata, title: String, eXact: Bool): Userdata;
/**
 * * exact: Match entire title, or match substring of title.
 */
@:native("JS_Window_Find")
public static function jsWindowFind(title: String, eXact: Bool): Userdata;
/**
 * WARNING: If using mode -1, any BitBlt()/StretchBlt() MUST have the source
 * bitmap persist. If it is resized after Blit it could cause crashes.
 */
@:native("JS_Window_EnableMetal")
public static function jsWindowEnableMetal(windowHwnd: Userdata): Int;
/**
 * Enables or disables mouse and keyboard input to the specified window or
 * control.
 */
@:native("JS_Window_Enable")
public static function jsWindowEnable(windowHwnd: Userdata, enable: Bool): Void;
/**
 * Destroys the specified window.
 */
@:native("JS_Window_Destroy")
public static function jsWindowDestroy(windowHwnd: Userdata): Void;
/**
 * NOTE: On Linux and macOS, the window contents are only updated *between*
 * defer cycles, so the window cannot be animated by for/while loops within a
 * single defer cycle.
 */
@:native("JS_Window_Create")
public static function jsWindowCreate(title: String, className: String, x: Int, y: Int, w: Int, h: Int, ?stYle: String, ?oWnerHWnd: Userdata): Userdata;
/**
 * * On all platforms, client coordinates are relative to the upper left corner
 * of the client area.
 */
@:native("JS_Window_ClientToScreen")
public static function jsWindowClientToScreen(windowHwnd: Userdata, x: Int, y: Int): Int;
/**
 * WARNING: This function does not yet work on Linux.
 */
@:native("JS_Window_AttachTopmostPin")
public static function jsWindowAttachTopmostPin(windowHwnd: Userdata): Void;
/** No description available */
@:native("JS_Window_AttachResizeGrip")
public static function jsWindowAttachResizeGrip(windowHwnd: Userdata): Void;
/**
 * * exact: Match entire title exactly, or match substring of title.
 */
@:native("JS_Window_ArrayFind")
public static function jsWindowArrayFind(title: String, eXact: Bool, reaperarraY: Userdata): Int;
/**
 * * The addresses are stored in the provided reaper.array, and can be converted
 * to REAPER objects (HWNDs) by the function JS_Window_HandleFromAddress.
 */
@:native("JS_Window_ArrayAllTop")
public static function jsWindowArrayAllTop(reaperarraY: Userdata): Int;
/**
 * * The addresses are stored in the provided reaper.array, and can be converted
 * to REAPER objects (HWNDs) by the function JS_Window_HandleFromAddress.
 */
@:native("JS_Window_ArrayAllChild")
public static function jsWindowArrayAllChild(parentHWnd: Userdata, reaperarraY: Userdata): Int;
/** No description available */
@:native("JS_Window_AddressFromHandle")
public static function jsWindowAddressFromHandle(handle: Userdata): Float;
/**
 * * Useful for simulating mouse clicks and calling mouse modifier actions from
 * scripts.
 */
@:native("JS_WindowMessage_Send")
public static function jsWindowMessageSend(windowHwnd: Userdata, message: String, wParam: Float, wParamHigHWord: Int, lParam: Float, lParamHigHWord: Int): Int;
/**
 * Release script intercepts of window messages for specified window.
 */
@:native("JS_WindowMessage_ReleaseWindow")
public static function jsWindowMessageReleaseWindow(windowHwnd: Userdata): Void;
/**
 * Release script intercepts of window messages for all windows.
 */
@:native("JS_WindowMessage_ReleaseAll")
public static function jsWindowMessageReleaseAll(): Void;
/**
 * * messages: "WM_SETCURSOR,WM_MOUSEHWHEEL" or "0x0020,0x020E", for example.
 */
@:native("JS_WindowMessage_Release")
public static function jsWindowMessageRelease(windowHwnd: Userdata, messages: String): Int;
/**
 * * Useful for simulating mouse clicks and calling mouse modifier actions from
 * scripts.
 */
@:native("JS_WindowMessage_Post")
public static function jsWindowMessagePost(windowHwnd: Userdata, message: String, wParam: Float, wParamHigHWord: Int, lParam: Float, lParamHigHWord: Int): Bool;
/**
 * * wParamHigh, lParamLow and lParamHigh are signed, whereas wParamLow is
 * unsigned.
 */
@:native("JS_WindowMessage_Peek")
public static function jsWindowMessagePeek(windowHwnd: Userdata, message: String): Bool;
/**
 * Returns 1 if successful, 0 if the message type is not yet being intercepted,
 * or -2 if the argument could not be parsed.
 */
@:native("JS_WindowMessage_PassThrough")
public static function jsWindowMessagePassThrough(windowHwnd: Userdata, message: String, passTHrougH: Bool): Int;
/**
 * Returns a string with a list of all message types currently being intercepted
 * for the specified window.
 */
@:native("JS_WindowMessage_ListIntercepts")
public static function jsWindowMessageListIntercepts(windowHwnd: Userdata): Bool;
/**
 * * To check whether a message type is being blocked or passed through, Peek
 * the message type, or retrieve the entire List of intercepts.
 */
@:native("JS_WindowMessage_InterceptList")
public static function jsWindowMessageInterceptList(windowHwnd: Userdata, messages: String): Int;
/**
 * Keyboard events are usually *not* received by any individual window. To
 * intercept keyboard events, use the VKey functions.
 */
@:native("JS_WindowMessage_Intercept")
public static function jsWindowMessageIntercept(windowHwnd: Userdata, message: String, passTHrougH: Bool): Int;
/**
 * Returns: If keyCode refers to a single key, the intercept state of that key
 * is returned.  If keyCode = -1, the state of the key that is most strongly
 * blocked (highest intercept state) is returned.
 */
@:native("JS_VKeys_Intercept")
public static function jsVKeysIntercept(keYCode: Int, intercept: Int): Int;
/**
 * Note: Mouse buttons and modifier keys are not (currently) reliably detected,
 * and JS_Mouse_GetState can be used instead.
 */
@:native("JS_VKeys_GetUp")
public static function jsVKeysGetUp(cutoffTime: Float): String;
/**
 * * Auto-repeated KEYDOWN messages are ignored.
 */
@:native("JS_VKeys_GetState")
public static function jsVKeysGetState(cutoffTime: Float): String;
/**
 * * Auto-repeated KEYDOWN messages are ignored.
 */
@:native("JS_VKeys_GetDown")
public static function jsVKeysGetDown(cutoffTime: Float): String;
/**
 * Returns the memory contents starting at address[offset] as a packed string.
 * Offset is added as steps of 1 byte (char) each.
 */
@:native("JS_String")
public static function jsString(pointer: Userdata, offSet: Int, lengtHCHars: Int): Bool;
/**
 * Returns the version of the js_ReaScriptAPI extension.
 */
@:native("JS_ReaScriptAPI_Version")
public static function jsReaScriptApiVersion(): Float;
/**
 * * On macOS, screen coordinates are relative to the *bottom* left corner of
 * the primary display, and the positive Y-axis points upward.
 */
@:native("JS_Mouse_SetPosition")
public static function jsMouseSetPosition(x: Int, y: Int): Bool;
/**
 * Sets the mouse cursor.  (Only lasts while script is running, and for a single
 * "defer" cycle.)
 */
@:native("JS_Mouse_SetCursor")
public static function jsMouseSetCursor(cursorHandle: Userdata): Void;
/**
 * If successful, returns a handle to the cursor, which can be used in
 * JS_Mouse_SetCursor.
 */
@:native("JS_Mouse_LoadCursorFromFile")
public static function jsMouseLoadCursorFromFile(patHAndFileName: String, ?forceNeWLoad: Bool): Userdata;
/**
 * If successful, returns a handle to the cursor, which can be used in
 * JS_Mouse_SetCursor.
 */
@:native("JS_Mouse_LoadCursor")
public static function jsMouseLoadCursor(cursorNumber: Int): Userdata;
/**
 * * flags, state: The parameter and the return value both use the same format
 * as gfx.mouse_cap. For example, to get the states of the left mouse button and
 * the ctrl key, use flags = 0b00000101.
 */
@:native("JS_Mouse_GetState")
public static function jsMouseGetState(flags: Int): Int;
/**
 * On Linux and macOS, retrieves a handle to the last cursor set by REAPER or
 * its extensions via SWELL.
 */
@:native("JS_Mouse_GetCursor")
public static function jsMouseGetCursor(): Userdata;
/**
 * Copies a packed string into a memory buffer.
 */
@:native("JS_Mem_FromString")
public static function jsMemFromString(mallocPointer: Userdata, offSet: Int, packedString: String, stringLengtH: Int): Bool;
/**
 * Frees memory that was previously allocated by JS_Mem_Alloc.
 */
@:native("JS_Mem_Free")
public static function jsMemFree(mallocPointer: Userdata): Bool;
/**
 * Allocates memory for general use by functions that require memory buffers.
 */
@:native("JS_Mem_Alloc")
public static function jsMemAlloc(sizeBYtes: Int): Userdata;
/**
 * * list: Comma-separated string of hexadecimal values. Each value is an
 * address that can be converted to a HWND by the function
 * Window_HandleFromAddress.
 */
@:native("JS_MIDIEditor_ListAll")
public static function jsMidiEditorListAll(): Int;
/**
 * * The address of each MIDI editor window is stored in the provided
 * reaper.array. Each address can be converted to a REAPER object (HWND) by the
 * function JS_Window_HandleFromAddress.
 */
@:native("JS_MIDIEditor_ArrayAll")
public static function jsMidiEditorArrayAll(reaperarraY: Userdata): Int;
/**
 * Example: reaper.JS_Localize("Actions", "common", "", 20)
 */
@:native("JS_Localize")
public static function jsLocalize(usEnglisH: String, langPackSection: String): String;
/**
 * Currently, this fuction only accepts ASCII text.
 */
@:native("JS_ListView_SetItemText")
public static function jsListViewSetItemText(listvieWHWnd: Userdata, indeX: Int, subItem: Int, teXt: String): Void;
/**
 * Warning: this function uses the Win32 bitmask values, which differ from the
 * values used by WDL/swell.
 */
@:native("JS_ListView_SetItemState")
public static function jsListViewSetItemState(listvieWHWnd: Userdata, indeX: Int, state: Int, mask: Int): Void;
/**
 * * retval: Number of selected items found; negative or zero if an error
 * occured.
 */
@:native("JS_ListView_ListAllSelItems")
public static function jsListViewListAllSelItems(listvieWHWnd: Userdata): Int;
/** No description available */
@:native("JS_ListView_HitTest")
public static function jsListViewHitTest(listvieWHWnd: Userdata, clientX: Int, clientY: Int): Int;
/** No description available */
@:native("JS_ListView_GetTopIndex")
public static function jsListViewGetTopIndex(listvieWHWnd: Userdata): Int;
/** No description available */
@:native("JS_ListView_GetSelectedCount")
public static function jsListViewGetSelectedCount(listvieWHWnd: Userdata): Int;
/** No description available */
@:native("JS_ListView_GetItemText")
public static function jsListViewGetItemText(listvieWHWnd: Userdata, indeX: Int, subItem: Int): String;
/**
 * Warning: this function uses the Win32 bitmask values, which differ from the
 * values used by WDL/swell.
 */
@:native("JS_ListView_GetItemState")
public static function jsListViewGetItemState(listvieWHWnd: Userdata, indeX: Int): Int;
/**
 * Returns client coordinates of the item.
 */
@:native("JS_ListView_GetItemRect")
public static function jsListViewGetItemRect(listvieWHWnd: Userdata, indeX: Int): Bool;
/** No description available */
@:native("JS_ListView_GetItemCount")
public static function jsListViewGetItemCount(listvieWHWnd: Userdata): Int;
/**
 * Returns the text and state of specified item.
 */
@:native("JS_ListView_GetItem")
public static function jsListViewGetItem(listvieWHWnd: Userdata, indeX: Int, subItem: Int): String;
/** No description available */
@:native("JS_ListView_GetHeader")
public static function jsListViewGetHeader(listvieWHWnd: Userdata): Userdata;
/**
 * Returns the index and text of the focused item, if any.
 */
@:native("JS_ListView_GetFocusedItem")
public static function jsListViewGetFocusedItem(listvieWHWnd: Userdata): Int;
/**
 * Returns the index of the next selected list item with index greater that the
 * specified number. Returns -1 if no selected items left.
 */
@:native("JS_ListView_EnumSelItems")
public static function jsListViewEnumSelItems(listvieWHWnd: Userdata, indeX: Int): Int;
/** No description available */
@:native("JS_ListView_EnsureVisible")
public static function jsListViewEnsureVisible(listvieWHWnd: Userdata, indeX: Int, partialOk: Bool): Void;
/** No description available */
@:native("JS_LICE_WritePNG")
public static function jsLiceWritePng(fileName: String, bitmap: Userdata, wantAlpHa: Bool): Bool;
/**
 * * forceBaseline is an optional boolean parameter that ensures compatibility
 * with all JPEG viewers by preventing too low quality, "cubist" settings.
 */
@:native("JS_LICE_WriteJPG")
public static function jsLiceWriteJpg(fileName: String, bitmap: Userdata, qualitY: Int, ?forceBaseLine: Bool): Bool;
/**
 * "VERTICAL", "BOTTOMUP", "NATIVE", "BLUR", "INVERT", "MONO", "SHADOW" or
 * "OUTLINE".
 */
@:native("JS_LICE_SetFontFromGDI")
public static function jsLiceSetFontFromGdi(liceFont: Userdata, gdiFont: Userdata, moreFormats: String): Void;
/**
 * Sets the color of font FX such as shadow.
 */
@:native("JS_LICE_SetFontFXColor")
public static function jsLiceSetFontFxColor(liceFont: Userdata, color: Int): Void;
/** No description available */
@:native("JS_LICE_SetFontColor")
public static function jsLiceSetFontColor(liceFont: Userdata, color: Int): Void;
/**
 * Sets the color of the font background.
 */
@:native("JS_LICE_SetFontBkColor")
public static function jsLiceSetFontBkColor(liceFont: Userdata, color: Int): Void;
/**
 * Sets all pixels that match the given color's RGB values to fully transparent,
 * and all other pixels to fully opaque.  (All pixels' RGB values remain
 * unchanged.)
 */
@:native("JS_LICE_SetAlphaFromColorMask")
public static function jsLiceSetAlphaFromColorMask(bitmap: Userdata, colorRgb: Int): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable
 * per-pixel alpha blending.
 */
@:native("JS_LICE_ScaledBlit")
public static function jsLiceScaledBlit(destBitmap: Userdata, dstX: Int, dstY: Int, dstW: Int, dstH: Int, srcBitmap: Userdata, srcX: Float, srcY: Float, srcW: Float, srcH: Float, alpHa: Float, mode: String): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_RoundRect")
public static function jsLiceRoundRect(bitmap: Userdata, x: Float, y: Float, w: Float, h: Float, cornerradius: Int, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable
 * per-pixel alpha blending.
 */
@:native("JS_LICE_RotatedBlit")
public static function jsLiceRotatedBlit(destBitmap: Userdata, dstX: Int, dstY: Int, dstW: Int, dstH: Int, sourceBitmap: Userdata, srcX: Float, srcY: Float, srcW: Float, srcH: Float, angle: Float, rotXcent: Float, rotYcent: Float, cliptoSourcerect: Bool, alpHa: Float, mode: String): Void;
/** No description available */
@:native("JS_LICE_Resize")
public static function jsLiceResize(bitmap: Userdata, wIdtH: Int, heigHt: Int): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_PutPixel")
public static function jsLicePutPixel(bitmap: Userdata, x: Int, y: Int, color: Float, alpHa: Float, mode: String): Void;
/**
 * reaper.JS_LICE_Blit(bitmap, x, y, bitmap, x, y, w, h, 0.5, "ADD").
 */
@:native("JS_LICE_ProcessRect")
public static function jsLiceProcessRect(bitmap: Userdata, x: Int, y: Int, w: Int, h: Int, mode: String, operand: Float): Bool;
/** No description available */
@:native("JS_LICE_MeasureText")
public static function jsLiceMeasureText(teXt: String): Int;
/**
 * Returns a system LICE bitmap containing the PNG.
 */
@:native("JS_LICE_LoadPNGFromMemory")
public static function jsLiceLoadPngFromMemory(buffer: String, bufsize: Int): Userdata;
/**
 * Returns a system LICE bitmap containing the PNG.
 */
@:native("JS_LICE_LoadPNG")
public static function jsLiceLoadPng(fileName: String): Userdata;
/**
 * Returns a system LICE bitmap containing the JPEG.
 */
@:native("JS_LICE_LoadJPGFromMemory")
public static function jsLiceLoadJpgFromMemory(buffer: String, bufsize: Int): Userdata;
/**
 * Returns a system LICE bitmap containing the JPEG.
 */
@:native("JS_LICE_LoadJPG")
public static function jsLiceLoadJpg(fileName: String): Userdata;
/** No description available */
@:native("JS_LICE_ListAllBitmaps")
public static function jsLiceListAllBitmaps(): Int;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Line")
public static function jsLiceLine(bitmap: Userdata, x1: Float, y1: Float, x2: Float, y2: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/** No description available */
@:native("JS_LICE_IsFlipped")
public static function jsLiceIsFlipped(bitmap: Userdata): Bool;
/** No description available */
@:native("JS_LICE_GradRect")
public static function jsLiceGradRect(bitmap: Userdata, dstX: Int, dstY: Int, dstW: Int, dstH: Int, ir: Float, ig: Float, ib: Float, ia: Float, drdX: Float, dgdX: Float, dbdX: Float, dadX: Float, drdY: Float, dgdY: Float, dbdY: Float, dadY: Float, mode: String): Void;
/** No description available */
@:native("JS_LICE_GetWidth")
public static function jsLiceGetWidth(bitmap: Userdata): Int;
/**
 * Returns the color of the specified pixel.
 */
@:native("JS_LICE_GetPixel")
public static function jsLiceGetPixel(bitmap: Userdata, x: Int, y: Int): Float;
/** No description available */
@:native("JS_LICE_GetHeight")
public static function jsLiceGetHeight(bitmap: Userdata): Int;
/** No description available */
@:native("JS_LICE_GetDC")
public static function jsLiceGetDc(bitmap: Userdata): Userdata;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillTriangle")
public static function jsLiceFillTriangle(bitmap: Userdata, x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, color: Int, alpHa: Float, mode: String): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillRect")
public static function jsLiceFillRect(bitmap: Userdata, x: Int, y: Int, w: Int, h: Int, color: Int, alpHa: Float, mode: String): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillPolygon")
public static function jsLiceFillPolygon(bitmap: Userdata, packedX: String, packedY: String, numPoints: Int, color: Int, alpHa: Float, mode: String): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillCircle")
public static function jsLiceFillCircle(bitmap: Userdata, cX: Float, cY: Float, r: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/** No description available */
@:native("JS_LICE_DrawText")
public static function jsLiceDrawText(bitmap: Userdata, liceFont: Userdata, teXt: String, teXtLen: Int, x1: Int, y1: Int, x2: Int, y2: Int): Int;
/** No description available */
@:native("JS_LICE_DrawChar")
public static function jsLiceDrawChar(bitmap: Userdata, x: Int, y: Int, c: Int, color: Int, alpHa: Float, mode: Int): Void;
/** No description available */
@:native("JS_LICE_DestroyFont")
public static function jsLiceDestroyFont(liceFont: Userdata): Void;
/**
 * Deletes the bitmap, and also unlinks bitmap from any composited window.
 */
@:native("JS_LICE_DestroyBitmap")
public static function jsLiceDestroyBitmap(bitmap: Userdata): Void;
/** No description available */
@:native("JS_LICE_CreateFont")
public static function jsLiceCreateFont(): Userdata;
/** No description available */
@:native("JS_LICE_CreateBitmap")
public static function jsLiceCreateBitmap(isSYsBitmap: Bool, wIdtH: Int, heigHt: Int): Userdata;
/** No description available */
@:native("JS_LICE_Clear")
public static function jsLiceClear(bitmap: Userdata, color: Int): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Circle")
public static function jsLiceCircle(bitmap: Userdata, cX: Float, cY: Float, r: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/**
 * * "ALPHAMUL", which overwrites the destination with a per-pixel
 * alpha-multiplied copy of the source. (Similar to first clearing the
 * destination with 0x00000000 and then blitting with "COPY,ALPHA".)
 */
@:native("JS_LICE_Blit")
public static function jsLiceBlit(destBitmap: Userdata, dstX: Int, dstY: Int, sourceBitmap: Userdata, srcX: Int, srcY: Int, wIdtH: Int, heigHt: Int, alpHa: Float, mode: String): Void;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Bezier")
public static function jsLiceBezier(bitmap: Userdata, xstart: Float, ystart: Float, xctl1: Float, yctl1: Float, xctl2: Float, yctl2: Float, xend: Float, yend: Float, tol: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/** No description available */
@:native("JS_LICE_ArrayAllBitmaps")
public static function jsLiceArrayAllBitmaps(reaperarraY: Userdata): Int;
/**
 * LICE color format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Arc")
public static function jsLiceArc(bitmap: Userdata, cX: Float, cY: Float, r: Float, minAngle: Float, maXAngle: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/**
 * Hue is rolled over, saturation and value are clamped, all 0..1. (Alpha
 * remains unchanged.)
 */
@:native("JS_LICE_AlterRectHSV")
public static function jsLiceAlterRectHsv(bitmap: Userdata, x: Int, y: Int, w: Int, h: Int, hue: Float, saturation: Float, value: Float): Void;
/**
 * Hue is rolled over, saturation and value are clamped, all 0..1. (Alpha
 * remains unchanged.)
 */
@:native("JS_LICE_AlterBitmapHSV")
public static function jsLiceAlterBitmapHsv(bitmap: Userdata, hue: Float, saturation: Float, value: Float): Void;
/**
 * Returns the 4-byte signed integer at address[offset]. Offset is added as
 * steps of 4 bytes each.
 */
@:native("JS_Int")
public static function jsInt(pointer: Userdata, offSet: Int): Int;
/** No description available */
@:native("JS_Header_GetItemCount")
public static function jsHeaderGetItemCount(headerHWnd: Userdata): Int;
/**
 * WARNING: On WindowsOS, GDI_Blit does not perform alpha multiplication of the
 * source bitmap. For proper color rendering, a separate pre-multiplication step
 * is therefore required, using either LICE_Blit or LICE_ProcessRect.
 */
@:native("JS_GDI_StretchBlit")
public static function jsGdiStretchBlit(destHdc: Userdata, dstX: Int, dstY: Int, dstW: Int, dstH: Int, sourceHdc: Userdata, srcX: Int, srXY: Int, srcW: Int, srcH: Int, ?mode: String): Void;
/** No description available */
@:native("JS_GDI_SetTextColor")
public static function jsGdiSetTextColor(deviceHdc: Userdata, color: Int): Void;
/** No description available */
@:native("JS_GDI_SetTextBkMode")
public static function jsGdiSetTextBkMode(deviceHdc: Userdata, mode: Int): Void;
/** No description available */
@:native("JS_GDI_SetTextBkColor")
public static function jsGdiSetTextBkColor(deviceHdc: Userdata, color: Int): Void;
/** No description available */
@:native("JS_GDI_SetPixel")
public static function jsGdiSetPixel(deviceHdc: Userdata, x: Int, y: Int, color: Int): Void;
/**
 * Activates a font, pen, or fill brush for subsequent drawing in the specified
 * device context.
 */
@:native("JS_GDI_SelectObject")
public static function jsGdiSelectObject(deviceHdc: Userdata, gdiObject: Userdata): Userdata;
/**
 * NOTE: Any GDI HDC should be released immediately after drawing, and deferred
 * scripts should get and release new DCs in each cycle.
 */
@:native("JS_GDI_ReleaseDC")
public static function jsGdiReleaseDc(deviceHdc: Userdata, ?windowHwnd: Userdata): Int;
/**
 * packedX and packedY are strings of points, each packed as "<i4".
 */
@:native("JS_GDI_Polyline")
public static function jsGdiPolyline(deviceHdc: Userdata, packedX: String, packedY: String, numPoints: Int): Void;
/** No description available */
@:native("JS_GDI_Line")
public static function jsGdiLine(deviceHdc: Userdata, x1: Int, y1: Int, x2: Int, y2: Int): Void;
/**
 * Returns the device context for the entire window, including title bar and
 * frame.
 */
@:native("JS_GDI_GetWindowDC")
public static function jsGdiGetWindowDc(windowHwnd: Userdata): Userdata;
/** No description available */
@:native("JS_GDI_GetTextColor")
public static function jsGdiGetTextColor(deviceHdc: Userdata): Int;
/** No description available */
@:native("JS_GDI_GetSysColor")
public static function jsGdiGetSysColor(guiElement: String): Int;
/**
 * WARNING: Only available on Windows, not Linux or macOS.
 */
@:native("JS_GDI_GetScreenDC")
public static function jsGdiGetScreenDc(): Userdata;
/**
 * Returns the device context for the client area of the specified window.
 */
@:native("JS_GDI_GetClientDC")
public static function jsGdiGetClientDc(windowHwnd: Userdata): Userdata;
/** No description available */
@:native("JS_GDI_FillRoundRect")
public static function jsGdiFillRoundRect(deviceHdc: Userdata, left: Int, top: Int, rigHt: Int, bottom: Int, xrnd: Int, yrnd: Int): Void;
/** No description available */
@:native("JS_GDI_FillRect")
public static function jsGdiFillRect(deviceHdc: Userdata, left: Int, top: Int, rigHt: Int, bottom: Int): Void;
/**
 * packedX and packedY are strings of points, each packed as "<i4".
 */
@:native("JS_GDI_FillPolygon")
public static function jsGdiFillPolygon(deviceHdc: Userdata, packedX: String, packedY: String, numPoints: Int): Void;
/** No description available */
@:native("JS_GDI_FillEllipse")
public static function jsGdiFillEllipse(deviceHdc: Userdata, left: Int, top: Int, rigHt: Int, bottom: Int): Void;
/**
 * * align: Combination of: "TOP", "VCENTER", "LEFT", "HCENTER", "RIGHT",
 * "BOTTOM", "WORDBREAK", "SINGLELINE", "NOCLIP", "CALCRECT", "NOPREFIX" or
 * "ELLIPSIS"
 */
@:native("JS_GDI_DrawText")
public static function jsGdiDrawText(deviceHdc: Userdata, teXt: String, len: Int, left: Int, top: Int, rigHt: Int, bottom: Int, align: String): Int;
/** No description available */
@:native("JS_GDI_DeleteObject")
public static function jsGdiDeleteObject(gdiObject: Userdata): Void;
/** No description available */
@:native("JS_GDI_CreatePen")
public static function jsGdiCreatePen(wIdtH: Int, color: Int): Userdata;
/**
 * Note: Text color must be set separately.
 */
@:native("JS_GDI_CreateFont")
public static function jsGdiCreateFont(heigHt: Int, weigHt: Int, angle: Int, italic: Bool, underLine: Bool, strike: Bool, fontName: String): Userdata;
/** No description available */
@:native("JS_GDI_CreateFillBrush")
public static function jsGdiCreateFillBrush(color: Int): Userdata;
/**
 * WARNING: On WindowsOS, GDI_Blit does not perform alpha multiplication of the
 * source bitmap. For proper color rendering, a separate pre-multiplication step
 * is therefore required, using either LICE_Blit or LICE_ProcessRect.
 */
@:native("JS_GDI_Blit")
public static function jsGdiBlit(destHdc: Userdata, dstX: Int, dstY: Int, sourceHdc: Userdata, srcX: Int, srXY: Int, wIdtH: Int, heigHt: Int, ?mode: String): Void;
/**
 * retval is 0 if successful, negative if not.
 */
@:native("JS_File_Stat")
public static function jsFileStat(filePatH: String): Int;
/**
 * Returns the 8-byte floating point value at address[offset]. Offset is added
 * as steps of 8 bytes each.
 */
@:native("JS_Double")
public static function jsDouble(pointer: Userdata, offSet: Int): Float;
/**
 * extensionList is as described for JS_Dialog_BrowseForOpenFiles.
 */
@:native("JS_Dialog_BrowseForSaveFile")
public static function jsDialogBrowseForSaveFile(windowTitle: String, initialFolder: String, initialFile: String, eXtensionList: String): Int;
/**
 * * REAPER's IDE and ShowConsoleMsg only display strings up to the first \0
 * byte. If multiple files were selected, only the first substring containing
 * the path will be displayed. This is not a problem for Lua or EEL, which can
 * access the full string beyond the first \0 byte as usual.
 */
@:native("JS_Dialog_BrowseForOpenFiles")
public static function jsDialogBrowseForOpenFiles(windowTitle: String, initialFolder: String, initialFile: String, eXtensionList: String, alloWMultiple: Bool): Int;
/**
 * retval is 1 if a file was selected, 0 if the user cancelled the dialog, and
 * -1 if an error occurred.
 */
@:native("JS_Dialog_BrowseForFolder")
public static function jsDialogBrowseForFolder(caption: String, initialFolder: String): Int;
/**
 * If no bitmap is specified, all bitmaps composited to the window will be
 * unlinked -- even those by other scripts.
 */
@:native("JS_Composite_Unlink")
public static function jsCompositeUnlink(windowHwnd: Userdata, ?bitmap: Userdata, ?autoUpdate: Bool): Void;
/**
 * retval is the number of linked bitmaps found, or negative if an error
 * occured.
 */
@:native("JS_Composite_ListBitmaps")
public static function jsCompositeListBitmaps(windowHwnd: Userdata): Int;
/**
 * * If delay times have not previously been set for this window, prev time
 * values are 0.
 */
@:native("JS_Composite_Delay")
public static function jsCompositeDelay(windowHwnd: Userdata, minTime: Float, maXTime: Float, numBitmapsWHenMaX: Int): Int;
/**
 * 1 if successful, otherwise -1 = windowHWND is not a window, -3 = Could not
 * obtain the original window process, -4 = sysBitmap is not a LICE bitmap, -5 =
 * sysBitmap is not a system bitmap, -6 = Could not obtain the window HDC, -7 =
 * Error when subclassing to new window process.
 */
@:native("JS_Composite")
public static function jsComposite(windowHwnd: Userdata, dstX: Int, dstY: Int, dstW: Int, dstH: Int, sYsBitmap: Userdata, srcX: Int, srcY: Int, srcW: Int, srcH: Int, ?autoUpdate: Bool): Int;
/**
 * Returns the unsigned byte at address[offset]. Offset is added as steps of 1
 * byte each.
 */
@:native("JS_Byte")
public static function jsByte(pointer: Userdata, offSet: Int): Int;
/**
 * 0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 = MIDI Event
 * List Editor, 32062 = MIDI Inline Editor, 32063 = Media Explorer.
 */
@:native("JS_Actions_GetShortcutDesc")
public static function jsActionsGetShortcutDesc(section: Int, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * If the shortcut index is higher than the current number of shortcuts, it will
 * add a new shortcut.
 */
@:native("JS_Actions_DoShortcutDialog")
public static function jsActionsDoShortcutDialog(section: Int, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * 0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 = MIDI Event
 * List Editor, 32062 = MIDI Inline Editor, 32063 = Media Explorer.
 */
@:native("JS_Actions_DeleteShortcut")
public static function jsActionsDeleteShortcut(section: Int, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * 0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 = MIDI Event
 * List Editor, 32062 = MIDI Inline Editor, 32063 = Media Explorer.
 */
@:native("JS_Actions_CountShortcuts")
public static function jsActionsCountShortcuts(section: Int, cmdId: Int): Int;
/** No description available */
@:native("JB_SetSWSExtraProjectNotes")
public static function jbSetSwsExtraProjectNotes(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, str: String): Void;
/** No description available */
@:native("JB_GetSWSExtraProjectNotes")
public static function jbGetSwsExtraProjectNotes(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): String;
/**
 * Returns a string by parsing wildcards relative to the supplied MediaItem_Take
 */
@:native("GU_WildcardParseTake")
public static function guWildcardParseTake(take: MediaItemTake, input: String): String;
/**
 * Returns duration in seconds for PCM_source from end til RMS threshold is
 * breached in reverse. Returns -1 if invalid
 */
@:native("GU_PCM_Source_TimeToRMSR")
public static function guPcmSourceTimeToRmsr(source: PcmSource, bufferSize: Int, tHresHold: Float): Float;
/**
 * Returns duration in seconds for PCM_source from start til RMS threshold is
 * breached. Returns -1 if invalid
 */
@:native("GU_PCM_Source_TimeToRMS")
public static function guPcmSourceTimeToRms(source: PcmSource, bufferSize: Int, tHresHold: Float): Float;
/**
 * Returns duration in seconds for PCM_source from end til peak threshold is
 * breached in reverse. Returns -1 if invalid
 */
@:native("GU_PCM_Source_TimeToPeakR")
public static function guPcmSourceTimeToPeakR(source: PcmSource, bufferSize: Int, tHresHold: Float): Float;
/**
 * Returns duration in seconds for PCM_source from start til peak threshold is
 * breached. Returns -1 if invalid
 */
@:native("GU_PCM_Source_TimeToPeak")
public static function guPcmSourceTimeToPeak(source: PcmSource, bufferSize: Int, tHresHold: Float): Float;
/**
 * Checks if PCM_source is mono by comparing all channels
 */
@:native("GU_PCM_Source_IsMono")
public static function guPcmSourceIsMono(source: PcmSource): Bool;
/**
 * Checks if PCM_source has embedded Media Cue Markers
 */
@:native("GU_PCM_Source_HasRegion")
public static function guPcmSourceHasRegion(source: PcmSource): Bool;
/**
 * Gets a PCM_source's sample value at a point in time (seconds)
 */
@:native("GU_PCM_Source_GetSampleValue")
public static function guPcmSourceGetSampleValue(source: PcmSource, time: Float): Float;
/**
 * Gets the current GUtilitiesAPI version
 */
@:native("GU_GUtilitiesAPI_GetVersion")
public static function guGUtilitiesApiGetVersion(): String;
/**
 * Checks if file or directory exists
 */
@:native("GU_Filesystem_PathExists")
public static function guFilesystemPathExists(patH: String): Bool;
/**
 * Returns the first found file's path from within a given path. Returns an
 * empty string if not found
 */
@:native("GU_Filesystem_FindFileInPath")
public static function guFilesystemFindFileInPath(patH: String, fileName: String): String;
/**
 * Returns the next valid file in a directory each time this function is called
 * with the same path. Returns an empty string if path does not contain any more
 * valid files. Flags can be passed as an argument to determine which media
 * files are valid. A flag with a value of -1 will reset the cache, otherwise,
 * the following flags can be used: ALL = 0, WAV = 1, AIFF = 2, FLAC = 4, MP3 =
 * 8, OGG = 16, BWF = 32, W64 = 64, WAVPACK = 128, GIF = 256, MP4 = 512
 */
@:native("GU_Filesystem_EnumerateMediaFiles")
public static function guFilesystemEnumerateMediaFiles(patH: String, flags: Int): String;
/**
 * Returns count and filesize in megabytes for all valid media files within the
 * path. Returns -1 if path is invalid. Flags can be passed as an argument to
 * determine which media files are valid. A flag with a value of -1 will reset
 * the cache, otherwise, the following flags can be used: ALL = 0, WAV = 1, AIFF
 * = 2, FLAC = 4, MP3 = 8, OGG = 16, BWF = 32, W64 = 64, WAVPACK = 128, GIF =
 * 256, MP4 = 512
 */
@:native("GU_Filesystem_CountMediaFiles")
public static function guFilesystemCountMediaFiles(patH: String, flags: Int): Int;
/**
 * Writes a config file to the GUtilities folder in Reaper's resource folder
 */
@:native("GU_Config_Write")
public static function guConfigWrite(fileName: String, categorY: String, keY: String, value: String): Bool;
/**
 * Reads from a config file in the GUtilities folder in Reaper's resource folder
 */
@:native("GU_Config_Read")
public static function guConfigRead(fileName: String, categorY: String, keY: String): Bool;
/**
 * Prefixing paramId with "-" reverses direction; useful for creating separate
 * next/previous mappings for bands or list type value navigation.
 */
@:native("Fab_Map")
public static function fabMap(fXId: String, command: Int, paramId: String, control: Int, ?bandsIn: Int, ?stepIn: Float, ?accelIn: Float, ?minvalIn: Float, ?maXvalIn: Float): Bool;
/**
 * Returns target FX and parameter index for given ReaFab command in context of
 * selected track and ReaFab FX index. Valid command range 1 ... 24. Returns
 * false if no such command mapping is found. Returns param index -1 for ReaFab
 * internal band change command.
 */
@:native("Fab_Get")
public static function fabGet(command: Int): Bool;
/**
 * Dumps current control mapping into .lua file under
 * ResourcePath/Scripts/reafab_dump-timestamp.lua
 */
@:native("Fab_Dump")
public static function fabDump(): Void;
/**
 * Runs ReaFab actions/commands. First parameter (command) is ReaFab command
 * number, e.g. 3 for 3rd encoder rotation. Second parameter (val) is MIDI CC
 * Relative value. Value 1 is increment of 1, 127 is decrement of 1. 2 is inc 2,
 * 126 is dec 2 and so on. For button press (commands 9-32) a value of 127 is
 * recommended.
 */
@:native("Fab_Do")
public static function fabDo(command: Int, val: Int): Bool;
/**
 * Clears ReaFab control map, optionally based on matching idString. Returns
 * true on success.
 */
@:native("Fab_Clear")
public static function fabClear(?idStringIn: String): Bool;
/**
 * [FNG] Set MIDI note property. See FNG_GetMidiNoteIntProperty for the list of
 * supported properties.
 */
@:native("FNG_SetMidiNoteIntProperty")
public static function fngSetMidiNoteIntProperty(mIdiNote: RprMidiNote, propertY: String, value: Int): Void;
/**
 * [FNG] Get MIDI note property. Supported properties: CHANNEL, LENGTH, MUTED,
 * PITCH, POSITION, SELECTED and VELOCITY.
 */
@:native("FNG_GetMidiNoteIntProperty")
public static function fngGetMidiNoteIntProperty(mIdiNote: RprMidiNote, propertY: String): Int;
/**
 * [FNG] Get a MIDI note from a MIDI take at specified index
 */
@:native("FNG_GetMidiNote")
public static function fngGetMidiNote(mIdiTake: RprMidiTake, indeX: Int): RprMidiNote;
/**
 * [FNG] Commit changes to MIDI take and free allocated memory
 */
@:native("FNG_FreeMidiTake")
public static function fngFreeMidiTake(mIdiTake: RprMidiTake): Void;
/**
 * [FNG] Count of how many MIDI notes are in the MIDI take
 */
@:native("FNG_CountMidiNotes")
public static function fngCountMidiNotes(mIdiTake: RprMidiTake): Int;
/**
 * [FNG] Allocate a RprMidiTake from a take pointer. Returns a NULL pointer if
 * the take is not an in-project MIDI take
 */
@:native("FNG_AllocMidiTake")
public static function fngAllocMidiTake(take: MediaItemTake): RprMidiTake;
/**
 * [FNG] Add MIDI note to MIDI take
 */
@:native("FNG_AddMidiNote")
public static function fngAddMidiNote(mIdiTake: RprMidiTake): RprMidiNote;
/**
 * (MIDI Razor Edits only for the time being) Destroy an HWND created by
 * CreateChildWindowForHWND.
 */
@:native("DestroyChildWindow")
public static function destroyChildWindow(cHildHWnd: Userdata): Bool;
/**
 * (MIDI Razor Edits only for the time being) Create a new Win32 HWND floating
 * above an existing HWND.
 */
@:native("CreateChildWindowForHWND")
public static function createChildWindowForHwnd(parentHWnd: Userdata, title: String): Userdata;
/**
 * Open the given file or URL in the default application. See also
 * CF_LocateInExplorer.
 */
@:native("CF_ShellExecute")
public static function cfShellExecute(file: String): Bool;
/**
 * Set the online/offline status of the given source (closes files when
 * set=false).
 */
@:native("CF_SetMediaSourceOnline")
public static function cfSetMediaSourceOnline(src: PcmSource, set: Bool): Void;
/**
 * Set one of 16 SWS custom colors (0xBBGGRR on Windows, 0xRRGGBB everyhwere
 * else). Index is zero-based.
 */
@:native("CF_SetCustomColor")
public static function cfSetCustomColor(indeX: Int, color: Int): Void;
/**
 * Write the given string into the system clipboard.
 */
@:native("CF_SetClipboard")
public static function cfSetClipboard(str: String): Void;
/**
 * Modifier values: nil = read from keyboard, 0 = no modifier, &4 = Control (Cmd
 * on macOS), &8 = Shift, &16 = Alt, &32 = Super
 */
@:native("CF_SendActionShortcut")
public static function cfSendActionShortcut(hWnd: Userdata, section: Int, keY: Int, ?modifiersIn: Int): Bool;
/**
 * Set which track effect is active in the track's FX chain. The FX chain window
 * does not have to be open.
 */
@:native("CF_SelectTrackFX")
public static function cfSelectTrackFx(track: MediaTrack, indeX: Int): Bool;
/**
 * Set which take effect is active in the take's FX chain. The FX chain window
 * does not have to be open.
 */
@:native("CF_SelectTakeFX")
public static function cfSelectTakeFx(take: MediaItemTake, indeX: Int): Bool;
/**
 * Stop and destroy all currently active preview objects.
 */
@:native("CF_Preview_StopAll")
public static function cfPreviewStopAll(): Void;
/**
 * Stop and destroy a preview object.
 */
@:native("CF_Preview_Stop")
public static function cfPreviewStop(previeW: CfPreview): Bool;
/**
 * See CF_Preview_GetValue.
 */
@:native("CF_Preview_SetValue")
public static function cfPreviewSetValue(previeW: CfPreview, name: String, neWValue: Float): Bool;
/** No description available */
@:native("CF_Preview_SetOutputTrack")
public static function cfPreviewSetOutputTrack(previeW: CfPreview, project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack): Bool;
/**
 * Start playback of the configured preview object.
 */
@:native("CF_Preview_Play")
public static function cfPreviewPlay(previeW: CfPreview): Bool;
/**
 * I_PITCHMODE    highest 16 bits=pitch shift mode (see EnumPitchShiftModes),
 * lower 16 bits=pitch shift submode (see EnumPitchShiftSubModes)
 */
@:native("CF_Preview_GetValue")
public static function cfPreviewGetValue(previeW: CfPreview, name: String): Bool;
/**
 * Return the maximum sample value played since the last read. Refresh speed
 * depends on buffer size.
 */
@:native("CF_Preview_GetPeak")
public static function cfPreviewGetPeak(previeW: CfPreview, cHannel: Int): Bool;
/** No description available */
@:native("CF_Preview_GetOutputTrack")
public static function cfPreviewGetOutputTrack(previeW: CfPreview): MediaTrack;
/**
 * Give a section source created using PCM_Source_CreateFromType("SECTION").
 * Offset and length are ignored if 0. Negative length to subtract from the
 * total length of the source.
 */
@:native("CF_PCM_Source_SetSectionInfo")
public static function cfPcmSourceSetSectionInfo(section: PcmSource, source: PcmSource, offSet: Float, lengtH: Float, reverse: Bool, ?fadeIn: Float): Bool;
/**
 * Warning: this function is no-op on Windows XP (the input string is returned
 * as-is).
 */
@:native("CF_NormalizeUTF8")
public static function cfNormalizeUtf8(input: String, mode: Int): String;
/**
 * Select the given file in explorer/finder.
 */
@:native("CF_LocateInExplorer")
public static function cfLocateInExplorer(file: String): Bool;
/**
 * Return a handle to the given track FX chain window. Set wantInputChain to get
 * the track's input/monitoring FX chain.
 */
@:native("CF_GetTrackFXChainEx")
public static function cfGetTrackFxChainEx(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack, wantInputCHain: Bool): FxChain;
/**
 * Return a handle to the given track FX chain window.
 */
@:native("CF_GetTrackFXChain")
public static function cfGetTrackFxChain(track: MediaTrack): FxChain;
/**
 * Return a handle to the given take FX chain window. HACK: This temporarily
 * renames the take in order to disambiguate the take FX chain window from
 * similarily named takes.
 */
@:native("CF_GetTakeFXChain")
public static function cfGetTakeFxChain(take: MediaItemTake): FxChain;
/**
 * Return the current SWS version number.
 */
@:native("CF_GetSWSVersion")
public static function cfGetSwsVersion(): String;
/**
 * Get the project associated with this source (BWF, subproject...).
 */
@:native("CF_GetMediaSourceRPP")
public static function cfGetMediaSourceRpp(src: PcmSource): Bool;
/**
 * Returns the online/offline status of the given source.
 */
@:native("CF_GetMediaSourceOnline")
public static function cfGetMediaSourceOnline(src: PcmSource): Bool;
/**
 * Get the value of the given metadata field (eg. DESC, ORIG, ORIGREF, DATE,
 * TIME, UMI, CODINGHISTORY for BWF).
 */
@:native("CF_GetMediaSourceMetadata")
public static function cfGetMediaSourceMetadata(src: PcmSource, name: String, out: String): Bool;
/**
 * Returns the bit rate for WAVE (wav, aif) and streaming/variable formats (mp3,
 * ogg, opus). REAPER v6.19 or later is required for non-WAVE formats.
 */
@:native("CF_GetMediaSourceBitRate")
public static function cfGetMediaSourceBitRate(src: PcmSource): Float;
/**
 * Returns the bit depth if available (0 otherwise).
 */
@:native("CF_GetMediaSourceBitDepth")
public static function cfGetMediaSourceBitDepth(src: PcmSource): Int;
/**
 * Return a handle to the currently focused FX chain window.
 */
@:native("CF_GetFocusedFXChain")
public static function cfGetFocusedFxChain(): FxChain;
/**
 * Get one of 16 SWS custom colors (0xBBGGRR on Windows, 0xRRGGBB everyhwere
 * else). Index is zero-based.
 */
@:native("CF_GetCustomColor")
public static function cfGetCustomColor(indeX: Int): Int;
/**
 * Deprecated, see kbd_getTextFromCmd (v6.71+). Wrapper for the unexposed
 * kbd_getTextFromCmd API function. See CF_EnumerateActions for common section
 * IDs.
 */
@:native("CF_GetCommandText")
public static function cfGetCommandText(section: Int, command: Int): String;
/**
 * [DEPRECATED: Use CF_GetClipboard] Read the contents of the system clipboard.
 * See SNM_CreateFastString and SNM_DeleteFastString.
 */
@:native("CF_GetClipboardBig")
public static function cfGetClipboardBig(output: WdlFastString): String;
/**
 * Read the contents of the system clipboard.
 */
@:native("CF_GetClipboard")
public static function cfGetClipboard(): String;
/**
 * Export the source to the given file (MIDI only).
 */
@:native("CF_ExportMediaSource")
public static function cfExportMediaSource(src: PcmSource, fn: String): Bool;
/**
 * Main=0, Main (alt recording)=100, MIDI Editor=32060, MIDI Event List
 * Editor=32061, MIDI Inline Editor=32062, Media Explorer=32063
 */
@:native("CF_EnumerateActions")
public static function cfEnumerateActions(section: Int, indeX: Int): Int;
/**
 * Return the index of the next selected effect in the given FX chain. Start
 * index should be -1. Returns -1 if there are no more selected effects.
 */
@:native("CF_EnumSelectedFX")
public static function cfEnumSelectedFx(hWnd: FxChain, indeX: Int): Int;
/**
 * Enumerate the source's media cues. Returns the next index or 0 when finished.
 */
@:native("CF_EnumMediaSourceCues")
public static function cfEnumMediaSourceCues(src: PcmSource, indeX: Int): Int;
/**
 * - the output track no longer exists
 */
@:native("CF_CreatePreview")
public static function cfCreatePreview(source: PcmSource): CfPreview;
/**
 * Transport start/stop.
 */
@:native("Blink_StartStop")
public static function blinkStartStop(): Void;
/**
 * Set tempo to given bpm value, taking effect (heard from speakers)at given
 * wall clock time.
 */
@:native("Blink_SetTempoAtTime")
public static function blinkSetTempoAtTime(bpm: Float, time: Float): Void;
/**
 * Set timeline tempo to given bpm value.
 */
@:native("Blink_SetTempo")
public static function blinkSetTempo(bpm: Float): Void;
/**
 * Enable start/stop synchronization.
 */
@:native("Blink_SetStartStopSyncEnabled")
public static function blinkSetStartStopSyncEnabled(enable: Bool): Void;
/**
 * Set quantum. Usually this is set to length of one measure/bar in quarter
 * notes.
 */
@:native("Blink_SetQuantum")
public static function blinkSetQuantum(quantum: Float): Void;
/**
 * Set Blink as Puppet. When enabled, Blink attempts to synchronize local REAPER
 * tempo to Link session tempo by adjusting current active tempo/time signature
 * marker, or broadcasts local REAPER tempo changes into Link session, and
 * attempts to correct possible offset by adjusting REAPER playrate. Based on
 * cumulative single beat phase since Link session transport start, regardless
 * of quantum.
 */
@:native("Blink_SetPuppet")
public static function blinkSetPuppet(enable: Bool): Void;
/**
 * Convenience function to start or stop transport at given time and attempt to
 * map given beat to this time in context of given quantum.
 */
@:native("Blink_SetPlayingAndBeatAtTimeRequest")
public static function blinkSetPlayingAndBeatAtTimeRequest(plaYing: Bool, time: Float, beat: Float, quantum: Float): Void;
/**
 * Set if transport should be playing or stopped, taking effect at given time.
 */
@:native("Blink_SetPlaying")
public static function blinkSetPlaying(plaYing: Bool, time: Float): Void;
/**
 * Set Blink as Master. Puppet needs to be enabled first. Same as Puppet, but
 * possible beat offset is broadcast to Link session, effectively forcing local
 * REAPER timeline on peers. Only one, if any, Blink should be Master in Link
 * session.
 */
@:native("Blink_SetMaster")
public static function blinkSetMaster(enable: Bool): Void;
/**
 * Set launch offset. This is used to compensate for possible constant REAPER
 * transport launch delay, if such exists.
 */
@:native("Blink_SetLaunchOffset")
public static function blinkSetLaunchOffset(offSet: Float): Void;
/**
 * Enable/disable Blink. In Blink methods transport, tempo and timeline refer to
 * Link session, not local REAPER instance.
 */
@:native("Blink_SetEnabled")
public static function blinkSetEnabled(enable: Bool): Void;
/**
 * Captures REAPER Transport commands and 'Tempo: Increase/Decrease current
 * project tempo by' commands and broadcasts them into Link session. When used
 * with Master or Puppet mode enabled, provides better integration between
 * REAPER and Link session transport and tempos.
 */
@:native("Blink_SetCaptureTransportCommands")
public static function blinkSetCaptureTransportCommands(enable: Bool): Void;
/**
 * Attempt to map given beat to given time in context of given quantum.
 */
@:native("Blink_SetBeatAtTimeRequest")
public static function blinkSetBeatAtTimeRequest(bpm: Float, time: Float, quantum: Float): Void;
/**
 * Rudely re-map beat/time relationship for all peers in Link session.
 */
@:native("Blink_SetBeatAtTimeForce")
public static function blinkSetBeatAtTimeForce(bpm: Float, time: Float, quantum: Float): Void;
/**
 * Convenience function to attempt to map given beat to time when transport is
 * starting to play in context of given quantum. This function evaluates to a
 * no-op if GetPlaying() equals false.
 */
@:native("Blink_SetBeatAtStartPlayingTimeRequest")
public static function blinkSetBeatAtStartPlayingTimeRequest(beat: Float, quantum: Float): Void;
/**
 * Get Blink version.
 */
@:native("Blink_GetVersion")
public static function blinkGetVersion(): Float;
/**
 * Get timeline offset. This is the offset between REAPER timeline and Link
 * session timeline.
 */
@:native("Blink_GetTimelineOffset")
public static function blinkGetTimelineOffset(): Float;
/**
 * Get time at which transport start/stop occurs.
 */
@:native("Blink_GetTimeForPlaying")
public static function blinkGetTimeForPlaying(): Float;
/**
 * Get time at which given beat occurs for given quantum.
 */
@:native("Blink_GetTimeAtBeat")
public static function blinkGetTimeAtBeat(beat: Float, quantum: Float): Float;
/**
 * Tempo of timeline, in quarter note Beats Per Minute.
 */
@:native("Blink_GetTempo")
public static function blinkGetTempo(): Float;
/**
 * Is start/stop synchronization enabled?
 */
@:native("Blink_GetStartStopSyncEnabled")
public static function blinkGetStartStopSyncEnabled(): Bool;
/**
 * Get quantum.
 */
@:native("Blink_GetQuantum")
public static function blinkGetQuantum(): Float;
/**
 * Is Blink Puppet?
 */
@:native("Blink_GetPuppet")
public static function blinkGetPuppet(): Bool;
/**
 * Is transport playing?
 */
@:native("Blink_GetPlaying")
public static function blinkGetPlaying(): Bool;
/**
 * Get session phase at given time for given quantum.
 */
@:native("Blink_GetPhaseAtTime")
public static function blinkGetPhaseAtTime(time: Float, quantum: Float): Float;
/**
 * How many peers are currently connected in Link session?
 */
@:native("Blink_GetNumPeers")
public static function blinkGetNumPeers(): Int;
/**
 * Is Blink Master?
 */
@:native("Blink_GetMaster")
public static function blinkGetMaster(): Bool;
/**
 * Is Blink currently enabled?
 */
@:native("Blink_GetEnabled")
public static function blinkGetEnabled(): Bool;
/**
 * Clock used by Blink.
 */
@:native("Blink_GetClockNow")
public static function blinkGetClockNow(): Float;
/**
 * Get session beat value corresponding to given time for given quantum.
 */
@:native("Blink_GetBeatAtTime")
public static function blinkGetBeatAtTime(time: Float, quantum: Float): Float;
/**
 * Get audio buffer timing information. This is the length (size) of audio
 * buffer in samples, sample rate and 'latest audio buffer switch wall clock
 * time' in seconds.
 */
@:native("Blink_GetAudioBufferTimingInfo")
public static function blinkGetAudioBufferTimingInfo(): Int;
/**
 * [BR] Equivalent to win32 API WritePrivateProfileString(). For example, you
 * can use this to write to REAPER.ini. You can pass an empty string as value to
 * delete a key.
 */
@:native("BR_Win32_WritePrivateProfileString")
public static function brWin32WritePrivateProfileString(sectionName: String, keYName: String, value: String, filePatH: String): Bool;
/**
 * [BR] Equivalent to win32 API WindowFromPoint().
 */
@:native("BR_Win32_WindowFromPoint")
public static function brWin32WindowFromPoint(x: Int, y: Int): Userdata;
/**
 * [BR] Convert string to HWND. To convert HWND back to string, see
 * BR_Win32_HwndToString.
 */
@:native("BR_Win32_StringToHwnd")
public static function brWin32StringToHwnd(string: String): Userdata;
/**
 * [BR] Equivalent to win32 API ShowWindow().
 */
@:native("BR_Win32_ShowWindow")
public static function brWin32ShowWindow(hWnd: Userdata, cmdSHoW: Int): Bool;
/**
 * [BR] Equivalent to win32 API ShellExecute() with HWND set to main window
 */
@:native("BR_Win32_ShellExecute")
public static function brWin32ShellExecute(operation: String, file: String, parameters: String, directorY: String, sHoWFlags: Int): Int;
/**
 * hwndInsertAfter may be a string: "HWND_BOTTOM", "HWND_NOTOPMOST", "HWND_TOP",
 * "HWND_TOPMOST" or a string obtained with BR_Win32_HwndToString.
 */
@:native("BR_Win32_SetWindowPos")
public static function brWin32SetWindowPos(hWnd: Userdata, hWndInsertAfter: String, x: Int, y: Int, wIdtH: Int, heigHt: Int, flags: Int): Bool;
/**
 * [BR] Equivalent to win32 API SetWindowLong().
 */
@:native("BR_Win32_SetWindowLong")
public static function brWin32SetWindowLong(hWnd: Userdata, indeX: Int, neWLong: Int): Int;
/**
 * [BR] Equivalent to win32 API SetForegroundWindow().
 */
@:native("BR_Win32_SetForegroundWindow")
public static function brWin32SetForegroundWindow(hWnd: Userdata): Int;
/**
 * [BR] Equivalent to win32 API SetFocus().
 */
@:native("BR_Win32_SetFocus")
public static function brWin32SetFocus(hWnd: Userdata): Userdata;
/**
 * [BR] Equivalent to win32 API SendMessage().
 */
@:native("BR_Win32_SendMessage")
public static function brWin32SendMessage(hWnd: Userdata, msg: Int, wParam: Int, lParam: Int): Int;
/**
 * [BR] Equivalent to win32 API ClientToScreen().
 */
@:native("BR_Win32_ScreenToClient")
public static function brWin32ScreenToClient(hWnd: Userdata, xIn: Int, yIn: Int): Int;
/**
 * [BR] Alternative to MIDIEditor_GetActive. REAPER seems to have problems with
 * extensions using HWND type for exported functions so all BR_Win32 functions
 * use void* instead of HWND type.
 */
@:native("BR_Win32_MIDIEditor_GetActive")
public static function brWin32MidiEditorGetActive(): Userdata;
/**
 * [BR] Equivalent to win32 API MAKEWPARAM().
 */
@:native("BR_Win32_MAKEWPARAM")
public static function brWin32Makewparam(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKEWORD().
 */
@:native("BR_Win32_MAKEWORD")
public static function brWin32Makeword(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKELRESULT().
 */
@:native("BR_Win32_MAKELRESULT")
public static function brWin32Makelresult(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKELPARAM().
 */
@:native("BR_Win32_MAKELPARAM")
public static function brWin32Makelparam(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKELONG().
 */
@:native("BR_Win32_MAKELONG")
public static function brWin32Makelong(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API LOWORD().
 */
@:native("BR_Win32_LOWORD")
public static function brWin32Loword(value: Int): Int;
/**
 * [BR] Equivalent to win32 API LOBYTE().
 */
@:native("BR_Win32_LOBYTE")
public static function brWin32Lobyte(value: Int): Int;
/**
 * [BR] Equivalent to win32 API IsWindowVisible().
 */
@:native("BR_Win32_IsWindowVisible")
public static function brWin32IsWindowVisible(hWnd: Userdata): Bool;
/**
 * [BR] Equivalent to win32 API IsWindow().
 */
@:native("BR_Win32_IsWindow")
public static function brWin32IsWindow(hWnd: Userdata): Bool;
/**
 * [BR] Convert HWND to string. To convert string back to HWND, see
 * BR_Win32_StringToHwnd.
 */
@:native("BR_Win32_HwndToString")
public static function brWin32HwndToString(hWnd: Userdata): String;
/**
 * [BR] Equivalent to win32 API HIWORD().
 */
@:native("BR_Win32_HIWORD")
public static function brWin32Hiword(value: Int): Int;
/**
 * [BR] Equivalent to win32 API HIBYTE().
 */
@:native("BR_Win32_HIBYTE")
public static function brWin32Hibyte(value: Int): Int;
/**
 * [BR] Equivalent to win32 API GetWindowText().
 */
@:native("BR_Win32_GetWindowText")
public static function brWin32GetWindowText(hWnd: Userdata): Int;
/**
 * [BR] Equivalent to win32 API GetWindowRect().
 */
@:native("BR_Win32_GetWindowRect")
public static function brWin32GetWindowRect(hWnd: Userdata): Bool;
/**
 * [BR] Equivalent to win32 API GetWindowLong().
 */
@:native("BR_Win32_GetWindowLong")
public static function brWin32GetWindowLong(hWnd: Userdata, indeX: Int): Int;
/**
 * [BR] Equivalent to win32 API GetWindow().
 */
@:native("BR_Win32_GetWindow")
public static function brWin32GetWindow(hWnd: Userdata, cmd: Int): Userdata;
/**
 * [BR] Equivalent to win32 API GetPrivateProfileString(). For example, you can
 * use this to get values from REAPER.ini.
 */
@:native("BR_Win32_GetPrivateProfileString")
public static function brWin32GetPrivateProfileString(sectionName: String, keYName: String, defaultString: String, filePatH: String): Int;
/**
 * [BR] Equivalent to win32 API GetParent().
 */
@:native("BR_Win32_GetParent")
public static function brWin32GetParent(hWnd: Userdata): Userdata;
/**
 * [BR] Get coordinates for screen which is nearest to supplied coordinates.
 * Pass workingAreaOnly as true to get screen coordinates excluding taskbar (or
 * menu bar on OSX).
 */
@:native("BR_Win32_GetMonitorRectFromRect")
public static function brWin32GetMonitorRectFromRect(workingAreaOnlY: Bool, leftIn: Int, topIn: Int, rigHtIn: Int, bottomIn: Int): Int;
/**
 * [BR] Get mixer window HWND. isDockedOut will be set to true if mixer is
 * docked
 */
@:native("BR_Win32_GetMixerHwnd")
public static function brWin32GetMixerHwnd(): Userdata;
/**
 * [BR] Alternative to GetMainHwnd. REAPER seems to have problems with
 * extensions using HWND type for exported functions so all BR_Win32 functions
 * use void* instead of HWND type
 */
@:native("BR_Win32_GetMainHwnd")
public static function brWin32GetMainHwnd(): Userdata;
/**
 * [BR] Equivalent to win32 API GetForegroundWindow().
 */
@:native("BR_Win32_GetForegroundWindow")
public static function brWin32GetForegroundWindow(): Userdata;
/**
 * [BR] Equivalent to win32 API GetFocus().
 */
@:native("BR_Win32_GetFocus")
public static function brWin32GetFocus(): Userdata;
/**
 * [BR] Equivalent to win32 API GetCursorPos().
 */
@:native("BR_Win32_GetCursorPos")
public static function brWin32GetCursorPos(): Bool;
/**
 * WS_MAXIMIZE, WS_OVERLAPPEDWINDOW
 */
@:native("BR_Win32_GetConstant")
public static function brWin32GetConstant(constantName: String): Int;
/**
 * [BR] Equivalent to win32 API GET_Y_LPARAM().
 */
@:native("BR_Win32_GET_Y_LPARAM")
public static function brWin32GetYLparam(lParam: Int): Int;
/**
 * [BR] Equivalent to win32 API GET_X_LPARAM().
 */
@:native("BR_Win32_GET_X_LPARAM")
public static function brWin32GetXLparam(lParam: Int): Int;
/**
 * [BR] Equivalent to win32 API FindWindowEx(). Since ReaScript doesn't allow
 * passing NULL (None in Python, nil in Lua etc...) parameters, to search by
 * supplied class or name set searchClass and searchName accordingly. HWND
 * parameters should be passed as either "0" to signify NULL or as string
 * obtained from BR_Win32_HwndToString.
 */
@:native("BR_Win32_FindWindowEx")
public static function brWin32FindWindowEx(hWndParent: String, hWndChildAfter: String, className: String, windowName: String, searcHClass: Bool, searcHName: Bool): Userdata;
/**
 * [BR] Equivalent to win32 API ClientToScreen().
 */
@:native("BR_Win32_ClientToScreen")
public static function brWin32ClientToScreen(hWnd: Userdata, xIn: Int, yIn: Int): Int;
/**
 * [BR] Equivalent to win32 API ComboBox_FindStringExact().
 */
@:native("BR_Win32_CB_FindStringExact")
public static function brWin32CbFindStringExact(comboBoXHWnd: Userdata, startId: Int, string: String): Int;
/**
 * [BR] Equivalent to win32 API ComboBox_FindString().
 */
@:native("BR_Win32_CB_FindString")
public static function brWin32CbFindString(comboBoXHWnd: Userdata, startId: Int, string: String): Int;
/**
 * [BR] Deprecated, see TrackFX_GetNamedConfigParm/'fx_ident' (v6.37+). Get the
 * exact name (like effect.dll, effect.vst3, etc...) of an FX.
 */
@:native("BR_TrackFX_GetFXModuleName")
public static function brTrackFxGetFxModuleName(track: MediaTrack, fX: Int): Bool;
/**
 * Position will hold mouse cursor position in arrange if applicable.
 */
@:native("BR_TrackAtMouseCursor")
public static function brTrackAtMouseCursor(): MediaTrack;
/**
 * [BR] Get take under mouse cursor. Position is mouse cursor position in
 * arrange.
 */
@:native("BR_TakeAtMouseCursor")
public static function brTakeAtMouseCursor(): MediaItemTake;
/**
 * [BR] Differs from BR_SetTakeSourceFromFile only that it can also preserve
 * existing take media source properties.
 */
@:native("BR_SetTakeSourceFromFile2")
public static function brSetTakeSourceFromFile2(take: MediaItemTake, fileNameIn: String, inProjectData: Bool, keepSourceProperties: Bool): Bool;
/**
 * Note: To set source from existing take, see SNM_GetSetSourceState2.
 */
@:native("BR_SetTakeSourceFromFile")
public static function brSetTakeSourceFromFile(take: MediaItemTake, fileNameIn: String, inProjectData: Bool): Bool;
/**
 * [BR] Set "ignore project tempo" information for MIDI take. Returns true in
 * case the take was successfully updated.
 */
@:native("BR_SetMidiTakeTempoInfo")
public static function brSetMidiTakeTempoInfo(take: MediaItemTake, ignoreProjTempo: Bool, bpm: Float, num: Int, den: Int): Bool;
/**
 * To get media track layouts, see BR_GetMediaTrackLayouts.
 */
@:native("BR_SetMediaTrackLayouts")
public static function brSetMediaTrackLayouts(track: MediaTrack, mcPLaYoutNameIn: String, tcPLaYoutNameIn: String): Bool;
/**
 * To get source properties, see BR_GetMediaSourceProperties.
 */
@:native("BR_SetMediaSourceProperties")
public static function brSetMediaSourceProperties(take: MediaItemTake, section: Bool, start: Float, lengtH: Float, fade: Float, reverse: Bool): Bool;
/**
 * To get image resource, see BR_GetMediaItemImageResource.
 */
@:native("BR_SetMediaItemImageResource")
public static function brSetMediaItemImageResource(item: MediaItem, imageIn: String, imageFlags: Int): Void;
/**
 * [BR] Set item start and end edges' position - returns true in case of any
 * changes
 */
@:native("BR_SetItemEdges")
public static function brSetItemEdges(item: MediaItem, startTime: Float, endTime: Float): Bool;
/**
 * [BR] Deprecated, see GetSet_ArrangeView2 (REAPER v5.12pre4+) -- Set start and
 * end time position of arrange view. To get arrange view instead, see
 * BR_GetArrangeView.
 */
@:native("BR_SetArrangeView")
public static function brSetArrangeView(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, startTime: Float, endTime: Float): Void;
/**
 * [BR] Get position at mouse cursor. To check ruler along with arrange, pass
 * checkRuler=true. Returns -1 if cursor is not over arrange/ruler.
 */
@:native("BR_PositionAtMouseCursor")
public static function brPositionAtMouseCursor(cHeckRuler: Bool): Float;
/**
 * Valid CC lanes: CC0-127=CC, 0x100|(0-31)=14-bit CC, 0x200=velocity,
 * 0x201=pitch, 0x202=program, 0x203=channel pressure, 0x204=bank/program
 * select, 0x205=text, 0x206=sysex, 0x207
 */
@:native("BR_MIDI_CCLaneReplace")
public static function brMidiCcLaneReplace(mIdiEditor: Userdata, laneId: Int, neWCc: Int): Bool;
/**
 * [BR] Remove CC lane in midi editor. Top visible CC lane is laneId 0. Returns
 * true on success
 */
@:native("BR_MIDI_CCLaneRemove")
public static function brMidiCcLaneRemove(mIdiEditor: Userdata, laneId: Int): Bool;
/**
 * [BR] Get media item under mouse cursor. Position is mouse cursor position in
 * arrange.
 */
@:native("BR_ItemAtMouseCursor")
public static function brItemAtMouseCursor(): MediaItem;
/**
 * [BR] Check if take is MIDI take, in case MIDI take is in-project MIDI source
 * data, inProjectMidiOut will be true, otherwise false.
 */
@:native("BR_IsTakeMidi")
public static function brIsTakeMidi(take: MediaItemTake): Bool;
/**
 * [SWS] Check if take has MIDI inline editor open and returns true or false.
 */
@:native("BR_IsMidiOpenInInlineEditor")
public static function brIsMidiOpenInInlineEditor(take: MediaItemTake): Bool;
/**
 * [BR] Returns FX count for supplied take
 */
@:native("BR_GetTakeFXCount")
public static function brGetTakeFxCount(take: MediaItemTake): Int;
/**
 * Note: To get or set other send attributes, see
 * BR_GetMediaTrackSendInfo_Envelope and BR_GetMediaTrackSendInfo_Track.
 */
@:native("BR_GetSetTrackSendInfo")
public static function brGetSetTrackSendInfo(track: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String, setNeWValue: Bool, neWValue: Float): Float;
/**
 * [BR] Get previous grid division before the time position. For more grid
 * division functions, see BR_GetClosestGridDivision and BR_GetNextGridDivision.
 */
@:native("BR_GetPrevGridDivision")
public static function brGetPrevGridDivision(position: Float): Float;
/**
 * [BR] Get next grid division after the time position. For more grid divisions
 * function, see BR_GetClosestGridDivision and BR_GetPrevGridDivision.
 */
@:native("BR_GetNextGridDivision")
public static function brGetNextGridDivision(position: Float): Float;
/**
 * [BR] Returns track under mouse cursor that was captured with the last call to
 * BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_Track")
public static function brGetMouseCursorContextTrack(): MediaTrack;
/**
 * [BR] Returns take under mouse cursor that was captured with the last call to
 * BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_Take")
public static function brGetMouseCursorContextTake(): MediaItemTake;
/**
 * [BR] Returns id of a stretch marker under mouse cursor that was captured with
 * the last call to BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_StretchMarker")
public static function brGetMouseCursorContextStretchMarker(): Int;
/**
 * [BR] Returns project time position in arrange/ruler/midi editor that was
 * captured with the last call to BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_Position")
public static function brGetMouseCursorContextPosition(): Float;
/**
 * Note: due to API limitations, if mouse is over inline MIDI editor with some
 * note rows hidden, noteRow will be -1
 */
@:native("BR_GetMouseCursorContext_MIDI")
public static function brGetMouseCursorContextMidi(): Userdata;
/**
 * [BR] Returns item under mouse cursor that was captured with the last call to
 * BR_GetMouseCursorContext. Note that the function will return item even if
 * mouse cursor is over some other track lane element like stretch marker or
 * envelope. This enables for easier identification of items when you want to
 * ignore elements within the item.
 */
@:native("BR_GetMouseCursorContext_Item")
public static function brGetMouseCursorContextItem(): MediaItem;
/**
 * [BR] Returns envelope that was captured with the last call to
 * BR_GetMouseCursorContext. In case the envelope belongs to take, takeEnvelope
 * will be true.
 */
@:native("BR_GetMouseCursorContext_Envelope")
public static function brGetMouseCursorContextEnvelope(): TrackEnvelope;
/**
 * [BR] Get "ignore project tempo" information for MIDI take. Returns true if
 * take can ignore project tempo (no matter if it's actually ignored), otherwise
 * false.
 */
@:native("BR_GetMidiTakeTempoInfo")
public static function brGetMidiTakeTempoInfo(take: MediaItemTake): Bool;
/**
 * [BR] Get MIDI take pool GUID as a string (guidStringOut_sz should be at least
 * 64). Returns true if take is pooled.
 */
@:native("BR_GetMidiTakePoolGUID")
public static function brGetMidiTakePoolGuid(take: MediaItemTake): Bool;
/**
 * [BR] Get MIDI take source length in PPQ. In case the take isn't MIDI, return
 * value will be -1.
 */
@:native("BR_GetMidiSourceLenPPQ")
public static function brGetMidiSourceLenPpq(take: MediaItemTake): Float;
/**
 * Note: To get or set other send attributes, see BR_GetSetTrackSendInfo and
 * BR_GetMediaTrackSendInfo_Envelope.
 */
@:native("BR_GetMediaTrackSendInfo_Track")
public static function brGetMediaTrackSendInfoTrack(track: MediaTrack, categorY: Int, sendIdX: Int, trackTYpe: Int): MediaTrack;
/**
 * Note: To get or set other send attributes, see BR_GetSetTrackSendInfo and
 * BR_GetMediaTrackSendInfo_Track.
 */
@:native("BR_GetMediaTrackSendInfo_Envelope")
public static function brGetMediaTrackSendInfoEnvelope(track: MediaTrack, categorY: Int, sendIdX: Int, envelopeTYpe: Int): TrackEnvelope;
/**
 * [BR] Deprecated, see GetSetMediaTrackInfo (REAPER v5.02+). Get media track
 * layouts for MCP and TCP. Empty string ("") means that layout is set to the
 * default layout. To set media track layouts, see BR_SetMediaTrackLayouts.
 */
@:native("BR_GetMediaTrackLayouts")
public static function brGetMediaTrackLayouts(track: MediaTrack): String;
/**
 * [BR] Deprecated, see GetSetMediaTrackInfo_String (v5.95+). Get media track
 * GUID as a string (guidStringOut_sz should be at least 64). To get media track
 * back from GUID string, see BR_GetMediaTrackByGUID.
 */
@:native("BR_GetMediaTrackGUID")
public static function brGetMediaTrackGuid(track: MediaTrack): String;
/**
 * [BR] Get media track freeze count (if track isn't frozen at all, returns 0).
 */
@:native("BR_GetMediaTrackFreezeCount")
public static function brGetMediaTrackFreezeCount(track: MediaTrack): Int;
/**
 * [BR] Get media track from GUID string. Note that the GUID must be enclosed in
 * braces {}. To get track's GUID as a string, see GetSetMediaTrackInfo_String.
 */
@:native("BR_GetMediaTrackByGUID")
public static function brGetMediaTrackByGuid(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, guIdStringIn: String): MediaTrack;
/**
 * To set source properties, see BR_SetMediaSourceProperties.
 */
@:native("BR_GetMediaSourceProperties")
public static function brGetMediaSourceProperties(take: MediaItemTake): Bool;
/**
 * [BR] Get media item take GUID as a string (guidStringOut_sz should be at
 * least 64). To get take from GUID string, see SNM_GetMediaItemTakeByGUID.
 */
@:native("BR_GetMediaItemTakeGUID")
public static function brGetMediaItemTakeGuid(take: MediaItemTake): String;
/**
 * [BR] Get currently loaded image resource and its flags for a given item.
 * Returns false if there is no image resource set. To set image resource, see
 * BR_SetMediaItemImageResource.
 */
@:native("BR_GetMediaItemImageResource")
public static function brGetMediaItemImageResource(item: MediaItem): Bool;
/**
 * [BR] Get media item GUID as a string (guidStringOut_sz should be at least
 * 64). To get media item back from GUID string, see BR_GetMediaItemByGUID.
 */
@:native("BR_GetMediaItemGUID")
public static function brGetMediaItemGuid(item: MediaItem): String;
/**
 * [BR] Get media item from GUID string. Note that the GUID must be enclosed in
 * braces {}. To get item's GUID as a string, see BR_GetMediaItemGUID.
 */
@:native("BR_GetMediaItemByGUID")
public static function brGetMediaItemByGuid(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, guIdStringIn: String): MediaItem;
/**
 * [BR] Get current theme information. themePathOut is set to full theme path
 * and themeNameOut is set to theme name excluding any path info and extension
 */
@:native("BR_GetCurrentTheme")
public static function brGetCurrentTheme(): String;
/**
 * [BR] Get closest grid division to position. Note that this functions is
 * different from SnapToGrid in two regards. SnapToGrid() needs snap enabled to
 * work and this one works always. Secondly, grid divisions are different from
 * grid lines because some grid lines may be hidden due to zoom level - this
 * function ignores grid line visibility and always searches for the closest
 * grid division at given position. For more grid division functions, see
 * BR_GetNextGridDivision and BR_GetPrevGridDivision.
 */
@:native("BR_GetClosestGridDivision")
public static function brGetClosestGridDivision(position: Float): Float;
/**
 * [BR] Deprecated, see GetSet_ArrangeView2 (REAPER v5.12pre4+) -- Get start and
 * end time position of arrange view. To set arrange view instead, see
 * BR_SetArrangeView.
 */
@:native("BR_GetArrangeView")
public static function brGetArrangeView(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * [BR] Get envelope value at time position for the envelope object allocated
 * with BR_EnvAlloc.
 */
@:native("BR_EnvValueAtPos")
public static function brEnvValueAtPos(envelope: BrEnvelope, position: Float): Float;
/**
 * [BR] Sort envelope points by position. The only reason to call this is if
 * sorted points are explicitly needed after editing them with BR_EnvSetPoint.
 * Note that you do not have to call this before doing BR_EnvFree since it does
 * handle unsorted points too.
 */
@:native("BR_EnvSortPoints")
public static function brEnvSortPoints(envelope: BrEnvelope): Void;
/**
 * Setting automationItemsOptions requires REAPER 5.979+.
 */
@:native("BR_EnvSetProperties")
public static function brEnvSetProperties(envelope: BrEnvelope, active: Bool, visible: Bool, armed: Bool, inLane: Bool, laneHeigHt: Int, defaultSHape: Int, faderScaling: Bool, ?automationItemsOptionsIn: Int): Void;
/**
 * Returns true on success.
 */
@:native("BR_EnvSetPoint")
public static function brEnvSetPoint(envelope: BrEnvelope, id: Int, position: Float, value: Float, sHape: Int, selected: Bool, bezier: Float): Bool;
/**
 * automationItemsOptions: -1->project default, &1=0->don't attach to underl.
 * env., &1->attach to underl. env. on right side,  &2->attach to underl. env.
 * on both sides, &4: bypass underl. env.
 */
@:native("BR_EnvGetProperties")
public static function brEnvGetProperties(envelope: BrEnvelope): Bool;
/**
 * [BR] Get envelope point by id (zero-based) from the envelope object allocated
 * with BR_EnvAlloc. Returns true on success.
 */
@:native("BR_EnvGetPoint")
public static function brEnvGetPoint(envelope: BrEnvelope, id: Int): Bool;
/**
 * [BR] Get parent track of envelope object allocated with BR_EnvAlloc. If take
 * envelope, returns NULL.
 */
@:native("BR_EnvGetParentTrack")
public static function brEnvGetParentTrack(envelope: BrEnvelope): MediaTrack;
/**
 * [BR] If envelope object allocated with BR_EnvAlloc is take envelope, returns
 * parent media item take, otherwise NULL.
 */
@:native("BR_EnvGetParentTake")
public static function brEnvGetParentTake(envelope: BrEnvelope): MediaItemTake;
/**
 * [BR] Free envelope object allocated with BR_EnvAlloc and commit changes if
 * needed. Returns true if changes were committed successfully. Note that when
 * envelope object wasn't modified nothing will get committed even if commit =
 * true - in that case function returns false.
 */
@:native("BR_EnvFree")
public static function brEnvFree(envelope: BrEnvelope, commit: Bool): Bool;
/**
 * [BR] Find previous envelope point before time position in the envelope object
 * allocated with BR_EnvAlloc. Returns envelope point id (zero-based) on success
 * or -1 on failure.
 */
@:native("BR_EnvFindPrevious")
public static function brEnvFindPrevious(envelope: BrEnvelope, position: Float): Int;
/**
 * [BR] Find next envelope point after time position in the envelope object
 * allocated with BR_EnvAlloc. Returns envelope point id (zero-based) on success
 * or -1 on failure.
 */
@:native("BR_EnvFindNext")
public static function brEnvFindNext(envelope: BrEnvelope, position: Float): Int;
/**
 * [BR] Find envelope point at time position in the envelope object allocated
 * with BR_EnvAlloc. Pass delta > 0 to search surrounding range - in that case
 * the closest point to position within delta will be searched for. Returns
 * envelope point id (zero-based) on success or -1 on failure.
 */
@:native("BR_EnvFind")
public static function brEnvFind(envelope: BrEnvelope, position: Float, delta: Float): Int;
/**
 * [BR] Delete envelope point by index (zero-based) in the envelope object
 * allocated with BR_EnvAlloc. Returns true on success.
 */
@:native("BR_EnvDeletePoint")
public static function brEnvDeletePoint(envelope: BrEnvelope, id: Int): Bool;
/**
 * [BR] Count envelope points in the envelope object allocated with BR_EnvAlloc.
 */
@:native("BR_EnvCountPoints")
public static function brEnvCountPoints(envelope: BrEnvelope): Int;
/**
 * For further manipulation see BR_EnvCountPoints, BR_EnvDeletePoint,
 * BR_EnvFind, BR_EnvFindNext, BR_EnvFindPrevious, BR_EnvGetParentTake,
 * BR_EnvGetParentTrack, BR_EnvGetPoint, BR_EnvGetProperties, BR_EnvSetPoint,
 * BR_EnvSetProperties, BR_EnvValueAtPos.
 */
@:native("BR_EnvAlloc")
public static function brEnvAlloc(envelope: TrackEnvelope, takeEnvelopesUseProjectTime: Bool): BrEnvelope;
/**
 * Opens the prefs to a page, use pageByName if page is 0.
 */
@:native("ViewPrefs")
public static function viewPrefs(page: Int, pageBYName: String): Void;
/**
 * Return true if the pointer is a valid object of the right type in proj (proj
 * is ignored if pointer is itself a project). Supported types are: ReaProject*,
 * MediaTrack*, MediaItem*, MediaItem_Take*, TrackEnvelope* and PCM_source*.
 */
@:native("ValidatePtr2")
public static function validatePtr2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, pointer: Userdata, ctYpeName: String): Bool;
/**
 * see ValidatePtr2
 */
@:native("ValidatePtr")
public static function validatePtr(pointer: Userdata, ctYpeName: String): Bool;
/**
 * Redraw the arrange view and ruler
 */
@:native("UpdateTimeline")
public static function updateTimeline(): Void;
/**
 * Recalculate lane arrangement for fixed lane tracks, including auto-removing
 * empty lanes at the bottom of the track
 */
@:native("UpdateItemLanes")
public static function updateItemLanes(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Bool;
/** No description available */
@:native("UpdateItemInProject")
public static function updateItemInProject(item: MediaItem): Void;
/**
 * Redraw the arrange view
 */
@:native("UpdateArrange")
public static function updateArrange(): Void;
/**
 * trackparm=-1 by default,or if updating one fx chain,you can specify track
 * index
 */
@:native("Undo_OnStateChangeEx2")
public static function undoOnStateChangeEx2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, descCHange: String, wHicHStates: Int, trackpArm: Int): Void;
/**
 * trackparm=-1 by default,or if updating one fx chain,you can specify track
 * index
 */
@:native("Undo_OnStateChangeEx")
public static function undoOnStateChangeEx(descCHange: String, wHicHStates: Int, trackpArm: Int): Void;
/** No description available */
@:native("Undo_OnStateChange_Item")
public static function undoOnStateChangeItem(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, name: String, item: MediaItem): Void;
/**
 * limited state change to items
 */
@:native("Undo_OnStateChange2")
public static function undoOnStateChange2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, descCHange: String): Void;
/**
 * limited state change to items
 */
@:native("Undo_OnStateChange")
public static function undoOnStateChange(descCHange: String): Void;
/**
 * call to end the block,with extra flags if any,and a description
 */
@:native("Undo_EndBlock2")
public static function undoEndBlock2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, descCHange: String, eXtraFlags: Int): Void;
/**
 * call to end the block,with extra flags if any,and a description
 */
@:native("Undo_EndBlock")
public static function undoEndBlock(descCHange: String, eXtraFlags: Int): Void;
/**
 * nonzero if success
 */
@:native("Undo_DoUndo2")
public static function undoDoUndo2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * nonzero if success
 */
@:native("Undo_DoRedo2")
public static function undoDoRedo2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * returns string of last action,if able,NULL if not
 */
@:native("Undo_CanUndo2")
public static function undoCanUndo2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): String;
/**
 * returns string of next action,if able,NULL if not
 */
@:native("Undo_CanRedo2")
public static function undoCanRedo2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): String;
/**
 * call to start a new block
 */
@:native("Undo_BeginBlock2")
public static function undoBeginBlock2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/**
 * call to start a new block
 */
@:native("Undo_BeginBlock")
public static function undoBeginBlock(): Void;
/** No description available */
@:native("TrackList_UpdateAllExternalSurfaces")
public static function trackListUpdateAllExternalSurfaces(): Void;
/** No description available */
@:native("TrackList_AdjustWindows")
public static function trackListAdjustWindows(isMinor: Bool): Void;
/**
 * showflag=0 for hidechain, =1 for show chain(index valid), =2 for hide
 * floating window(index valid), =3 for show floating window (index valid) FX
 * indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_Show")
public static function trackFxShow(track: MediaTrack, indeX: Int, sHoWFlag: Int): Void;
/**
 * Sets the preset idx, or the factory preset (idx==-2), or the default user
 * preset (idx==-1). Returns true on success. See TrackFX_GetPresetIndex. FX
 * indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetPresetByIndex")
public static function trackFxSetPresetByIndex(track: MediaTrack, fX: Int, idX: Int): Bool;
/**
 * Activate a preset with the name shown in the REAPER dropdown. Full paths to
 * .vstpreset files are also supported for VST3 plug-ins. See TrackFX_GetPreset.
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetPreset")
public static function trackFxSetPreset(track: MediaTrack, fX: Int, preSetName: String): Bool;
/**
 * sets the channel mapping bitmask for a particular pin. returns false if
 * unsupported (not all types of plug-ins support this capability). Add
 * 0x1000000 to pin index in order to access the second 64 bits of mappings
 * independent of the first 64 bits. FX indices for tracks can have 0x1000000
 * added to them in order to reference record input FX (normal tracks) or
 * hardware output FX (master track). FX indices can have 0x2000000 added to
 * them, in which case they will be used to address FX in containers. To address
 * a container, the 1-based subitem is multiplied by one plus the count of the
 * FX chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetPinMappings")
public static function trackFxSetPinMappings(tr: MediaTrack, fX: Int, isoutput: Int, pin: Int, loW32Bits: Int, hi32Bits: Int): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetParamNormalized")
public static function trackFxSetParamNormalized(track: MediaTrack, fX: Int, param: Int, value: Float): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetParam")
public static function trackFxSetParam(track: MediaTrack, fX: Int, param: Int, val: Float): Bool;
/**
 * Open this FX UI. See TrackFX_GetOpen FX indices for tracks can have 0x1000000
 * added to them in order to reference record input FX (normal tracks) or
 * hardware output FX (master track). FX indices can have 0x2000000 added to
 * them, in which case they will be used to address FX in containers. To address
 * a container, the 1-based subitem is multiplied by one plus the count of the
 * FX chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetOpen")
public static function trackFxSetOpen(track: MediaTrack, fX: Int, open: Bool): Void;
/**
 * See TrackFX_GetOffline FX indices for tracks can have 0x1000000 added to them
 * in order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_SetOffline")
public static function trackFxSetOffline(track: MediaTrack, fX: Int, offLine: Bool): Void;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_SetNamedConfigParm")
public static function trackFxSetNamedConfigParm(track: MediaTrack, fX: Int, pArmName: String, value: String): Bool;
/**
 * See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_GetEQBandEnabled,
 * TrackFX_SetEQBandEnabled. FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_SetEQParam")
public static function trackFxSetEqParam(track: MediaTrack, fXIdX: Int, bandtYpe: Int, bandIdX: Int, paramtYpe: Int, val: Float, isnorm: Bool): Bool;
/**
 * See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_SetEQParam,
 * TrackFX_GetEQBandEnabled. FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_SetEQBandEnabled")
public static function trackFxSetEqBandEnabled(track: MediaTrack, fXIdX: Int, bandtYpe: Int, bandIdX: Int, enable: Bool): Bool;
/**
 * See TrackFX_GetEnabled FX indices for tracks can have 0x1000000 added to them
 * in order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_SetEnabled")
public static function trackFxSetEnabled(track: MediaTrack, fX: Int, enabled: Bool): Void;
/**
 * presetmove==1 activates the next preset, presetmove==-1 activates the
 * previous preset, etc. FX indices for tracks can have 0x1000000 added to them
 * in order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_NavigatePresets")
public static function trackFxNavigatePresets(track: MediaTrack, fX: Int, preSetmove: Int): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetUserPresetFilename")
public static function trackFxGetUserPresetFilename(track: MediaTrack, fX: Int): String;
/**
 * returns count of record input FX. To access record input FX, use a FX indices
 * [0x1000000..0x1000000+n). On the master track, this accesses monitoring FX
 * rather than record input FX.
 */
@:native("TrackFX_GetRecCount")
public static function trackFxGetRecCount(track: MediaTrack): Int;
/**
 * returns index of effect visible in record input chain, or -1 for chain
 * hidden, or -2 for chain visible but no effect selected
 */
@:native("TrackFX_GetRecChainVisible")
public static function trackFxGetRecChainVisible(track: MediaTrack): Int;
/**
 * Returns current preset index, or -1 if error. numberOfPresetsOut will be set
 * to total number of presets available. See TrackFX_SetPresetByIndex FX indices
 * for tracks can have 0x1000000 added to them in order to reference record
 * input FX (normal tracks) or hardware output FX (master track). FX indices can
 * have 0x2000000 added to them, in which case they will be used to address FX
 * in containers. To address a container, the 1-based subitem is multiplied by
 * one plus the count of the FX chain and added to the 1-based container item
 * index. e.g. to address the third item in the container at the second position
 * of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetPresetIndex")
public static function trackFxGetPresetIndex(track: MediaTrack, fX: Int): Int;
/**
 * Get the name of the preset currently showing in the REAPER dropdown, or the
 * full path to a factory preset file for VST3 plug-ins (.vstpreset). See
 * TrackFX_SetPreset. FX indices for tracks can have 0x1000000 added to them in
 * order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetPreset")
public static function trackFxGetPreset(track: MediaTrack, fX: Int): Bool;
/**
 * gets the effective channel mapping bitmask for a particular pin. high32Out
 * will be set to the high 32 bits. Add 0x1000000 to pin index in order to
 * access the second 64 bits of mappings independent of the first 64 bits. FX
 * indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetPinMappings")
public static function trackFxGetPinMappings(tr: MediaTrack, fX: Int, isoutput: Int, pin: Int): Int;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParamNormalized")
public static function trackFxGetParamNormalized(track: MediaTrack, fX: Int, param: Int): Float;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParamName")
public static function trackFxGetParamName(track: MediaTrack, fX: Int, param: Int): Bool;
/**
 * gets an identifying string for the parameter FX indices for tracks can have
 * 0x1000000 added to them in order to reference record input FX (normal tracks)
 * or hardware output FX (master track). FX indices can have 0x2000000 added to
 * them, in which case they will be used to address FX in containers. To address
 * a container, the 1-based subitem is multiplied by one plus the count of the
 * FX chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParamIdent")
public static function trackFxGetParamIdent(track: MediaTrack, fX: Int, param: Int): Bool;
/**
 * gets the parameter index from an identifying string (:wet, :bypass, :delta,
 * or a string returned from GetParamIdent), or -1 if unknown. FX indices for
 * tracks can have 0x1000000 added to them in order to reference record input FX
 * (normal tracks) or hardware output FX (master track). FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParamFromIdent")
public static function trackFxGetParamFromIdent(track: MediaTrack, fX: Int, identStr: String): Int;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParamEx")
public static function trackFxGetParamEx(track: MediaTrack, fX: Int, param: Int): Float;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParameterStepSizes")
public static function trackFxGetParameterStepSizes(track: MediaTrack, fX: Int, param: Int): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetParam")
public static function trackFxGetParam(track: MediaTrack, fX: Int, param: Int): Float;
/**
 * Returns true if this FX UI is open in the FX chain window or a floating
 * window. See TrackFX_SetOpen FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetOpen")
public static function trackFxGetOpen(track: MediaTrack, fX: Int): Bool;
/**
 * See TrackFX_SetOffline FX indices for tracks can have 0x1000000 added to them
 * in order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetOffline")
public static function trackFxGetOffline(track: MediaTrack, fX: Int): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetNumParams")
public static function trackFxGetNumParams(track: MediaTrack, fX: Int): Int;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetNamedConfigParm")
public static function trackFxGetNamedConfigParm(track: MediaTrack, fX: Int, pArmName: String): Bool;
/**
 * Gets the number of input/output pins for FX if available, returns plug-in
 * type or -1 on error FX indices for tracks can have 0x1000000 added to them in
 * order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetIOSize")
public static function trackFxGetIoSize(track: MediaTrack, fX: Int): Int;
/**
 * Get the index of the first track FX insert that is a virtual instrument, or
 * -1 if none. See TrackFX_GetEQ, TrackFX_GetByName.
 */
@:native("TrackFX_GetInstrument")
public static function trackFxGetInstrument(track: MediaTrack): Int;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetFXName")
public static function trackFxGetFxName(track: MediaTrack, fX: Int): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetFXGUID")
public static function trackFxGetFxguid(track: MediaTrack, fX: Int): String;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetFormattedParamValue")
public static function trackFxGetFormattedParamValue(track: MediaTrack, fX: Int, param: Int): Bool;
/**
 * returns HWND of floating window for effect index, if any FX indices for
 * tracks can have 0x1000000 added to them in order to reference record input FX
 * (normal tracks) or hardware output FX (master track). FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_GetFloatingWindow")
public static function trackFxGetFloatingWindow(track: MediaTrack, indeX: Int): Hwnd;
/**
 * See TrackFX_GetEQ, TrackFX_SetEQParam, TrackFX_GetEQBandEnabled,
 * TrackFX_SetEQBandEnabled. FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetEQParam")
public static function trackFxGetEqParam(track: MediaTrack, fXIdX: Int, paramIdX: Int): Bool;
/**
 * See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_SetEQParam,
 * TrackFX_SetEQBandEnabled. FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetEQBandEnabled")
public static function trackFxGetEqBandEnabled(track: MediaTrack, fXIdX: Int, bandtYpe: Int, bandIdX: Int): Bool;
/**
 * Get the index of ReaEQ in the track FX chain. If ReaEQ is not in the chain
 * and instantiate is true, it will be inserted. See TrackFX_GetInstrument,
 * TrackFX_GetByName.
 */
@:native("TrackFX_GetEQ")
public static function trackFxGetEq(track: MediaTrack, instantiate: Bool): Int;
/**
 * See TrackFX_SetEnabled FX indices for tracks can have 0x1000000 added to them
 * in order to reference record input FX (normal tracks) or hardware output FX
 * (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_GetEnabled")
public static function trackFxGetEnabled(track: MediaTrack, fX: Int): Bool;
/** No description available */
@:native("TrackFX_GetCount")
public static function trackFxGetCount(track: MediaTrack): Int;
/**
 * returns index of effect visible in chain, or -1 for chain hidden, or -2 for
 * chain visible but no effect selected
 */
@:native("TrackFX_GetChainVisible")
public static function trackFxGetChainVisible(track: MediaTrack): Int;
/**
 * Get the index of the first track FX insert that matches fxname. If the FX is
 * not in the chain and instantiate is true, it will be inserted. See
 * TrackFX_GetInstrument, TrackFX_GetEQ. Deprecated in favor of
 * TrackFX_AddByName.
 */
@:native("TrackFX_GetByName")
public static function trackFxGetByName(track: MediaTrack, fXName: String, instantiate: Bool): Int;
/**
 * Note: only works with FX that support Cockos VST extensions. FX indices for
 * tracks can have 0x1000000 added to them in order to reference record input FX
 * (normal tracks) or hardware output FX (master track). FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_FormatParamValueNormalized")
public static function trackFxFormatParamValueNormalized(track: MediaTrack, fX: Int, param: Int, value: Float, buf: String): Bool;
/**
 * Note: only works with FX that support Cockos VST extensions. FX indices for
 * tracks can have 0x1000000 added to them in order to reference record input FX
 * (normal tracks) or hardware output FX (master track). FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_FormatParamValue")
public static function trackFxFormatParamValue(track: MediaTrack, fX: Int, param: Int, val: Float): Bool;
/**
 * FX indices for tracks can have 0x1000000 added to them in order to reference
 * record input FX (normal tracks) or hardware output FX (master track). FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_EndParamEdit")
public static function trackFxEndParamEdit(track: MediaTrack, fX: Int, param: Int): Bool;
/**
 * Remove a FX from track chain (returns true on success) FX indices for tracks
 * can have 0x1000000 added to them in order to reference record input FX
 * (normal tracks) or hardware output FX (master track). FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_Delete")
public static function trackFxDelete(track: MediaTrack, fX: Int): Bool;
/**
 * Copies (or moves) FX from src_track to dest_track. Can be used with
 * src_track=dest_track to reorder, FX indices have 0x1000000 set to reference
 * input FX. FX indices for tracks can have 0x1000000 added to them in order to
 * reference record input FX (normal tracks) or hardware output FX (master
 * track). FX indices can have 0x2000000 added to them, in which case they will
 * be used to address FX in containers. To address a container, the 1-based
 * subitem is multiplied by one plus the count of the FX chain and added to the
 * 1-based container item index. e.g. to address the third item in the container
 * at the second position of the track FX chain for tr, the index would be
 * 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_CopyToTrack")
public static function trackFxCopyToTrack(srcTrack: MediaTrack, srcFX: Int, destTrack: MediaTrack, destFX: Int, isMove: Bool): Void;
/**
 * Copies (or moves) FX from src_track to dest_take. src_fx can have 0x1000000
 * set to reference input FX. FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TrackFX_CopyToTake")
public static function trackFxCopyToTake(srcTrack: MediaTrack, srcFX: Int, destTake: MediaItemTake, destFX: Int, isMove: Bool): Void;
/**
 * Adds or queries the position of a named FX from the track FX chain
 * (recFX=false) or record input FX/monitoring FX (recFX=true, monitoring FX are
 * on master track). Specify a negative value for instantiate to always create a
 * new effect, 0 to only query the first instance of an effect, or a positive
 * value to add an instance if one is not found. If instantiate is <= -1000, it
 * is used for the insertion position (-1000 is first item in chain, -1001 is
 * second, etc). fxname can have prefix to specify type:
 * VST3:,VST2:,VST:,AU:,JS:, or DX:, or FXADD: which adds selected items from
 * the currently-open FX browser, FXADD:2 to limit to 2 FX added, or FXADD:2e to
 * only succeed if exactly 2 FX are selected. Returns -1 on failure or the new
 * position in chain on success. FX indices can have 0x2000000 added to them, in
 * which case they will be used to address FX in containers. To address a
 * container, the 1-based subitem is multiplied by one plus the count of the FX
 * chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TrackFX_AddByName")
public static function trackFxAddByName(track: MediaTrack, fXName: String, recFX: Bool, instantiate: Int): Int;
/**
 * displays tooltip at location, or removes if empty string
 */
@:native("TrackCtl_SetToolTip")
public static function trackCtlSetToolTip(fmt: String, xPos: Int, yPos: Int, topmost: Bool): Void;
/**
 * Returns peak meter value (1.0=+0dB, 0.0=-inf) for channel. If channel==1024
 * or channel==1025, returns loudness values if this is the master track or this
 * track's VU meters are set to display loudness.
 */
@:native("Track_GetPeakInfo")
public static function trackGetPeakInfo(track: MediaTrack, cHannel: Int): Float;
/**
 * Returns meter hold state, in dB*0.01 (0 = +0dB, -0.01 = -1dB, 0.02 = +2dB,
 * etc). If clear is set, clears the meter hold. If channel==1024 or
 * channel==1025, returns loudness values if this is the master track or this
 * track's VU meters are set to display loudness.
 */
@:native("Track_GetPeakHoldDB")
public static function trackGetPeakHoldDb(track: MediaTrack, cHannel: Int, clear: Bool): Float;
/**
 * send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
 */
@:native("ToggleTrackSendUIMute")
public static function toggleTrackSendUiMute(track: MediaTrack, sendIdX: Int): Bool;
/**
 * Converts project time position to quarter note count (QN). QN is counted from
 * the start of the project, regardless of any partial measures. See
 * TimeMap2_timeToQN
 */
@:native("TimeMap_timeToQN_abs")
public static function timeMapTimeToQnAbs(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, tPos: Float): Float;
/**
 * converts project QN position to time.
 */
@:native("TimeMap_timeToQN")
public static function timeMapTimeToQn(tPos: Float): Float;
/**
 * Converts project quarter note count (QN) to time. QN is counted from the
 * start of the project, regardless of any partial measures. See
 * TimeMap2_QNToTime
 */
@:native("TimeMap_QNToTime_abs")
public static function timeMapQnToTimeAbs(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, qn: Float): Float;
/**
 * converts project QN position to time.
 */
@:native("TimeMap_QNToTime")
public static function timeMapQnToTime(qn: Float): Float;
/**
 * Find which measure the given QN position falls in.
 */
@:native("TimeMap_QNToMeasures")
public static function timeMapQnToMeasures(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, qn: Float): Int;
/**
 * get the effective time signature and tempo
 */
@:native("TimeMap_GetTimeSigAtTime")
public static function timeMapGetTimeSigAtTime(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float): Int;
/**
 * Fills in a string representing the active metronome pattern. For example, in
 * a 7/8 measure divided 3+4, the pattern might be "ABCABCD". For backwards
 * compatibility, by default the function will return 1 for each primary beat
 * and 2 for each non-primary beat, so "1221222" in this example, and does not
 * support triplets. If buf is set to "EXTENDED", the function will return the
 * full string as displayed in the pattern editor, including all beat types and
 * triplet representations. Pass in "SET:string" with a correctly formed pattern
 * string matching the current time signature numerator to set the click
 * pattern. The time signature numerator can be deduced from the returned
 * string, and the function returns the time signature denominator.
 */
@:native("TimeMap_GetMetronomePattern")
public static function timeMapGetMetronomePattern(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float, pattern: String): Int;
/**
 * Get the QN position and time signature information for the start of a
 * measure. Return the time in seconds of the measure start.
 */
@:native("TimeMap_GetMeasureInfo")
public static function timeMapGetMeasureInfo(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, measure: Int): Float;
/**
 * get the effective BPM at the time (seconds) position (i.e. 2x in /8
 * signatures)
 */
@:native("TimeMap_GetDividedBpmAtTime")
public static function timeMapGetDividedBpmAtTime(time: Float): Float;
/**
 * Gets project framerate, and optionally whether it is drop-frame timecode
 */
@:native("TimeMap_curFrameRate")
public static function timeMapCurFrameRate(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * converts project time position to QN position.
 */
@:native("TimeMap2_timeToQN")
public static function timeMap2TimeToQn(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, tPos: Float): Float;
/**
 * if cdenom is non-NULL, will be set to the current time signature denominator.
 */
@:native("TimeMap2_timeToBeats")
public static function timeMap2TimeToBeats(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, tPos: Float): Float;
/**
 * converts project QN position to time.
 */
@:native("TimeMap2_QNToTime")
public static function timeMap2QnToTime(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, qn: Float): Float;
/**
 * when does the next time map (tempo or time sig) change occur
 */
@:native("TimeMap2_GetNextChangeTime")
public static function timeMap2GetNextChangeTime(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float): Float;
/**
 * get the effective BPM at the time (seconds) position (i.e. 2x in /8
 * signatures)
 */
@:native("TimeMap2_GetDividedBpmAtTime")
public static function timeMap2GetDividedBpmAtTime(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float): Float;
/**
 * convert a beat position (or optionally a beats+measures if measures is
 * non-NULL) to time.
 */
@:native("TimeMap2_beatsToTime")
public static function timeMap2BeatsToTime(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, tPos: Float, ?measuresIn: Int): Float;
/**
 * Gets a precise system timestamp in seconds
 */
@:native("time_precise")
public static function timePrecise(): Float;
/**
 * sets theme layout parameter to value. persist=true in order to have change
 * loaded on next theme load. note that the caller should update layouts via ???
 * to make changes visible.
 */
@:native("ThemeLayout_SetParameter")
public static function themeLayoutSetParameter(wp: Int, value: Int, persist: Bool): Bool;
/**
 * Sets theme layout override for a particular section -- section can be
 * 'global' or 'mcp' etc. If setting global layout, prefix a ! to the layout
 * string to clear any per-layout overrides. Returns false if failed.
 */
@:native("ThemeLayout_SetLayout")
public static function themeLayoutSetLayout(section: String, laYout: String): Bool;
/**
 * Refreshes all layouts
 */
@:native("ThemeLayout_RefreshAll")
public static function themeLayoutRefreshAll(): Void;
/**
 * returns theme layout parameter. return value is cfg-name, or nil/empty if out
 * of range.
 */
@:native("ThemeLayout_GetParameter")
public static function themeLayoutGetParameter(wp: Int): String;
/**
 * Gets theme layout information. section can be 'global' for global layout
 * override, 'seclist' to enumerate a list of layout sections, otherwise a
 * layout section such as 'mcp', 'tcp', 'trans', etc. idx can be -1 to query the
 * current value, -2 to get the description of the section (if not global), -3
 * will return the current context DPI-scaling (256=normal, 512=retina, etc), or
 * 0..x. returns false if failed.
 */
@:native("ThemeLayout_GetLayout")
public static function themeLayoutGetLayout(section: String, idX: Int): Bool;
/**
 * Returns true if the active take contains MIDI.
 */
@:native("TakeIsMIDI")
public static function takeIsMidi(take: MediaItemTake): Bool;
/**
 * showflag=0 for hidechain, =1 for show chain(index valid), =2 for hide
 * floating window(index valid), =3 for show floating window (index valid) FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_Show")
public static function takeFxShow(take: MediaItemTake, indeX: Int, sHoWFlag: Int): Void;
/**
 * Sets the preset idx, or the factory preset (idx==-2), or the default user
 * preset (idx==-1). Returns true on success. See TakeFX_GetPresetIndex. FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetPresetByIndex")
public static function takeFxSetPresetByIndex(take: MediaItemTake, fX: Int, idX: Int): Bool;
/**
 * Activate a preset with the name shown in the REAPER dropdown. Full paths to
 * .vstpreset files are also supported for VST3 plug-ins. See TakeFX_GetPreset.
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetPreset")
public static function takeFxSetPreset(take: MediaItemTake, fX: Int, preSetName: String): Bool;
/**
 * sets the channel mapping bitmask for a particular pin. returns false if
 * unsupported (not all types of plug-ins support this capability). Add
 * 0x1000000 to pin index in order to access the second 64 bits of mappings
 * independent of the first 64 bits. FX indices can have 0x2000000 added to
 * them, in which case they will be used to address FX in containers. To address
 * a container, the 1-based subitem is multiplied by one plus the count of the
 * FX chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetPinMappings")
public static function takeFxSetPinMappings(take: MediaItemTake, fX: Int, isoutput: Int, pin: Int, loW32Bits: Int, hi32Bits: Int): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetParamNormalized")
public static function takeFxSetParamNormalized(take: MediaItemTake, fX: Int, param: Int, value: Float): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetParam")
public static function takeFxSetParam(take: MediaItemTake, fX: Int, param: Int, val: Float): Bool;
/**
 * Open this FX UI. See TakeFX_GetOpen FX indices can have 0x2000000 added to
 * them, in which case they will be used to address FX in containers. To address
 * a container, the 1-based subitem is multiplied by one plus the count of the
 * FX chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetOpen")
public static function takeFxSetOpen(take: MediaItemTake, fX: Int, open: Bool): Void;
/**
 * See TakeFX_GetOffline FX indices can have 0x2000000 added to them, in which
 * case they will be used to address FX in containers. To address a container,
 * the 1-based subitem is multiplied by one plus the count of the FX chain and
 * added to the 1-based container item index. e.g. to address the third item in
 * the container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_SetOffline")
public static function takeFxSetOffline(take: MediaItemTake, fX: Int, offLine: Bool): Void;
/**
 * gets plug-in specific named configuration value (returns true on success).
 * see TrackFX_SetNamedConfigParm FX indices can have 0x2000000 added to them,
 * in which case they will be used to address FX in containers. To address a
 * container, the 1-based subitem is multiplied by one plus the count of the FX
 * chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_SetNamedConfigParm")
public static function takeFxSetNamedConfigParm(take: MediaItemTake, fX: Int, pArmName: String, value: String): Bool;
/**
 * See TakeFX_GetEnabled FX indices can have 0x2000000 added to them, in which
 * case they will be used to address FX in containers. To address a container,
 * the 1-based subitem is multiplied by one plus the count of the FX chain and
 * added to the 1-based container item index. e.g. to address the third item in
 * the container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_SetEnabled")
public static function takeFxSetEnabled(take: MediaItemTake, fX: Int, enabled: Bool): Void;
/**
 * presetmove==1 activates the next preset, presetmove==-1 activates the
 * previous preset, etc. FX indices can have 0x2000000 added to them, in which
 * case they will be used to address FX in containers. To address a container,
 * the 1-based subitem is multiplied by one plus the count of the FX chain and
 * added to the 1-based container item index. e.g. to address the third item in
 * the container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_NavigatePresets")
public static function takeFxNavigatePresets(take: MediaItemTake, fX: Int, preSetmove: Int): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetUserPresetFilename")
public static function takeFxGetUserPresetFilename(take: MediaItemTake, fX: Int): String;
/**
 * Returns current preset index, or -1 if error. numberOfPresetsOut will be set
 * to total number of presets available. See TakeFX_SetPresetByIndex FX indices
 * can have 0x2000000 added to them, in which case they will be used to address
 * FX in containers. To address a container, the 1-based subitem is multiplied
 * by one plus the count of the FX chain and added to the 1-based container item
 * index. e.g. to address the third item in the container at the second position
 * of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetPresetIndex")
public static function takeFxGetPresetIndex(take: MediaItemTake, fX: Int): Int;
/**
 * Get the name of the preset currently showing in the REAPER dropdown, or the
 * full path to a factory preset file for VST3 plug-ins (.vstpreset). See
 * TakeFX_SetPreset. FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_GetPreset")
public static function takeFxGetPreset(take: MediaItemTake, fX: Int): Bool;
/**
 * gets the effective channel mapping bitmask for a particular pin. high32Out
 * will be set to the high 32 bits. Add 0x1000000 to pin index in order to
 * access the second 64 bits of mappings independent of the first 64 bits. FX
 * indices can have 0x2000000 added to them, in which case they will be used to
 * address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetPinMappings")
public static function takeFxGetPinMappings(take: MediaItemTake, fX: Int, isoutput: Int, pin: Int): Int;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParamNormalized")
public static function takeFxGetParamNormalized(take: MediaItemTake, fX: Int, param: Int): Float;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParamName")
public static function takeFxGetParamName(take: MediaItemTake, fX: Int, param: Int): Bool;
/**
 * gets an identifying string for the parameter FX indices can have 0x2000000
 * added to them, in which case they will be used to address FX in containers.
 * To address a container, the 1-based subitem is multiplied by one plus the
 * count of the FX chain and added to the 1-based container item index. e.g. to
 * address the third item in the container at the second position of the track
 * FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) +
 * 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm
 * with container_count and similar logic. In REAPER v7.06+, you can use the
 * much more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParamIdent")
public static function takeFxGetParamIdent(take: MediaItemTake, fX: Int, param: Int): Bool;
/**
 * gets the parameter index from an identifying string (:wet, :bypass, or a
 * string returned from GetParamIdent), or -1 if unknown. FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParamFromIdent")
public static function takeFxGetParamFromIdent(take: MediaItemTake, fX: Int, identStr: String): Int;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParamEx")
public static function takeFxGetParamEx(take: MediaItemTake, fX: Int, param: Int): Float;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParameterStepSizes")
public static function takeFxGetParameterStepSizes(take: MediaItemTake, fX: Int, param: Int): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetParam")
public static function takeFxGetParam(take: MediaItemTake, fX: Int, param: Int): Float;
/**
 * Returns true if this FX UI is open in the FX chain window or a floating
 * window. See TakeFX_SetOpen FX indices can have 0x2000000 added to them, in
 * which case they will be used to address FX in containers. To address a
 * container, the 1-based subitem is multiplied by one plus the count of the FX
 * chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetOpen")
public static function takeFxGetOpen(take: MediaItemTake, fX: Int): Bool;
/**
 * See TakeFX_SetOffline FX indices can have 0x2000000 added to them, in which
 * case they will be used to address FX in containers. To address a container,
 * the 1-based subitem is multiplied by one plus the count of the FX chain and
 * added to the 1-based container item index. e.g. to address the third item in
 * the container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_GetOffline")
public static function takeFxGetOffline(take: MediaItemTake, fX: Int): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetNumParams")
public static function takeFxGetNumParams(take: MediaItemTake, fX: Int): Int;
/**
 * gets plug-in specific named configuration value (returns true on success).
 * see TrackFX_GetNamedConfigParm FX indices can have 0x2000000 added to them,
 * in which case they will be used to address FX in containers. To address a
 * container, the 1-based subitem is multiplied by one plus the count of the FX
 * chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetNamedConfigParm")
public static function takeFxGetNamedConfigParm(take: MediaItemTake, fX: Int, pArmName: String): Bool;
/**
 * Gets the number of input/output pins for FX if available, returns plug-in
 * type or -1 on error FX indices can have 0x2000000 added to them, in which
 * case they will be used to address FX in containers. To address a container,
 * the 1-based subitem is multiplied by one plus the count of the FX chain and
 * added to the 1-based container item index. e.g. to address the third item in
 * the container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_GetIOSize")
public static function takeFxGetIoSize(take: MediaItemTake, fX: Int): Int;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetFXName")
public static function takeFxGetFxName(take: MediaItemTake, fX: Int): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetFXGUID")
public static function takeFxGetFxguid(take: MediaItemTake, fX: Int): String;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetFormattedParamValue")
public static function takeFxGetFormattedParamValue(take: MediaItemTake, fX: Int, param: Int): Bool;
/**
 * returns HWND of floating window for effect index, if any FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetFloatingWindow")
public static function takeFxGetFloatingWindow(take: MediaItemTake, indeX: Int): Hwnd;
/**
 * Returns the FX parameter envelope. If the envelope does not exist and
 * create=true, the envelope will be created. If the envelope already exists and
 * is bypassed and create=true, then the envelope will be unbypassed. FX indices
 * can have 0x2000000 added to them, in which case they will be used to address
 * FX in containers. To address a container, the 1-based subitem is multiplied
 * by one plus the count of the FX chain and added to the 1-based container item
 * index. e.g. to address the third item in the container at the second position
 * of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_GetEnvelope")
public static function takeFxGetEnvelope(take: MediaItemTake, fXindeX: Int, parameterindeX: Int, create: Bool): TrackEnvelope;
/**
 * See TakeFX_SetEnabled FX indices can have 0x2000000 added to them, in which
 * case they will be used to address FX in containers. To address a container,
 * the 1-based subitem is multiplied by one plus the count of the FX chain and
 * added to the 1-based container item index. e.g. to address the third item in
 * the container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_GetEnabled")
public static function takeFxGetEnabled(take: MediaItemTake, fX: Int): Bool;
/** No description available */
@:native("TakeFX_GetCount")
public static function takeFxGetCount(take: MediaItemTake): Int;
/**
 * returns index of effect visible in chain, or -1 for chain hidden, or -2 for
 * chain visible but no effect selected
 */
@:native("TakeFX_GetChainVisible")
public static function takeFxGetChainVisible(take: MediaItemTake): Int;
/**
 * Note: only works with FX that support Cockos VST extensions. FX indices can
 * have 0x2000000 added to them, in which case they will be used to address FX
 * in containers. To address a container, the 1-based subitem is multiplied by
 * one plus the count of the FX chain and added to the 1-based container item
 * index. e.g. to address the third item in the container at the second position
 * of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_FormatParamValueNormalized")
public static function takeFxFormatParamValueNormalized(take: MediaItemTake, fX: Int, param: Int, value: Float, buf: String): Bool;
/**
 * Note: only works with FX that support Cockos VST extensions. FX indices can
 * have 0x2000000 added to them, in which case they will be used to address FX
 * in containers. To address a container, the 1-based subitem is multiplied by
 * one plus the count of the FX chain and added to the 1-based container item
 * index. e.g. to address the third item in the container at the second position
 * of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_FormatParamValue")
public static function takeFxFormatParamValue(take: MediaItemTake, fX: Int, param: Int, val: Float): Bool;
/**
 * FX indices can have 0x2000000 added to them, in which case they will be used
 * to address FX in containers. To address a container, the 1-based subitem is
 * multiplied by one plus the count of the FX chain and added to the 1-based
 * container item index. e.g. to address the third item in the container at the
 * second position of the track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_EndParamEdit")
public static function takeFxEndParamEdit(take: MediaItemTake, fX: Int, param: Int): Bool;
/**
 * Remove a FX from take chain (returns true on success) FX indices can have
 * 0x2000000 added to them, in which case they will be used to address FX in
 * containers. To address a container, the 1-based subitem is multiplied by one
 * plus the count of the FX chain and added to the 1-based container item index.
 * e.g. to address the third item in the container at the second position of the
 * track FX chain for tr, the index would be 0x2000000 +
 * 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using
 * TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER
 * v7.06+, you can use the much more convenient method to navigate hierarchies,
 * see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_Delete")
public static function takeFxDelete(take: MediaItemTake, fX: Int): Bool;
/**
 * Copies (or moves) FX from src_take to dest_track. dest_fx can have 0x1000000
 * set to reference input FX. FX indices for tracks can have 0x1000000 added to
 * them in order to reference record input FX (normal tracks) or hardware output
 * FX (master track). FX indices can have 0x2000000 added to them, in which case
 * they will be used to address FX in containers. To address a container, the
 * 1-based subitem is multiplied by one plus the count of the FX chain and added
 * to the 1-based container item index. e.g. to address the third item in the
 * container at the second position of the track FX chain for tr, the index
 * would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to
 * sub-containers using TrackFX_GetNamedConfigParm with container_count and
 * similar logic. In REAPER v7.06+, you can use the much more convenient method
 * to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container
 * and container_item.X.
 */
@:native("TakeFX_CopyToTrack")
public static function takeFxCopyToTrack(srcTake: MediaItemTake, srcFX: Int, destTrack: MediaTrack, destFX: Int, isMove: Bool): Void;
/**
 * Copies (or moves) FX from src_take to dest_take. Can be used with
 * src_take=dest_take to reorder. FX indices can have 0x2000000 added to them,
 * in which case they will be used to address FX in containers. To address a
 * container, the 1-based subitem is multiplied by one plus the count of the FX
 * chain and added to the 1-based container item index. e.g. to address the
 * third item in the container at the second position of the track FX chain for
 * tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can
 * be extended to sub-containers using TrackFX_GetNamedConfigParm with
 * container_count and similar logic. In REAPER v7.06+, you can use the much
 * more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_CopyToTake")
public static function takeFxCopyToTake(srcTake: MediaItemTake, srcFX: Int, destTake: MediaItemTake, destFX: Int, isMove: Bool): Void;
/**
 * Adds or queries the position of a named FX in a take. See TrackFX_AddByName()
 * for information on fxname and instantiate. FX indices can have 0x2000000
 * added to them, in which case they will be used to address FX in containers.
 * To address a container, the 1-based subitem is multiplied by one plus the
 * count of the FX chain and added to the 1-based container item index. e.g. to
 * address the third item in the container at the second position of the track
 * FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) +
 * 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm
 * with container_count and similar logic. In REAPER v7.06+, you can use the
 * much more convenient method to navigate hierarchies, see
 * TrackFX_GetNamedConfigParm with parent_container and container_item.X.
 */
@:native("TakeFX_AddByName")
public static function takeFxAddByName(take: MediaItemTake, fXName: String, instantiate: Int): Int;
/**
 * Stuffs a 3 byte MIDI message into either the Virtual MIDI Keyboard queue, or
 * the MIDI-as-control input queue, or sends to a MIDI hardware output. mode=0
 * for VKB, 1 for control (actions map etc), 2 for VKB-on-current-channel; 16
 * for external MIDI device 0, 17 for external MIDI device 1, etc; see
 * GetNumMIDIOutputs, GetMIDIOutputName.
 */
@:native("StuffMIDIMessage")
public static function stuffMidiMessage(mode: Int, msg1: Int, msg2: Int, msg3: Int): Void;
/** No description available */
@:native("stringToGuid")
public static function stringToGuid(str: String, gGuId: String): String;
/**
 * the original item becomes the left-hand split, the function returns the
 * right-hand split (or NULL if the split failed)
 */
@:native("SplitMediaItem")
public static function splitMediaItem(item: MediaItem, position: Float): Dynamic;
/**
 * gets the splash window, in case you want to display a message over it.
 * Returns NULL when the splash window is not displayed.
 */
@:native("Splash_GetWnd")
public static function splashGetWnd(): Hwnd;
/**
 * solo=2 for SIP
 */
@:native("SoloAllTracks")
public static function soloAllTracks(solo: Int): Void;
/** No description available */
@:native("SnapToGrid")
public static function snapToGrid(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, timePos: Float): Float;
/** No description available */
@:native("SLIDER2DB")
public static function slider2Db(y: Float): Float;
/**
 * shows a context menu, valid names include: track_input, track_panel,
 * track_area, track_routing, item, ruler, envelope, envelope_point,
 * envelope_item. ctxOptional can be a track pointer for track_*, item pointer
 * for item* (but is optional). for envelope_point, ctx2Optional has point
 * index, ctx3Optional has item index (0=main envelope, 1=first AI). for
 * envelope_item, ctx2Optional has AI index (1=first AI)
 */
@:native("ShowPopupMenu")
public static function showPopupMenu(name: String, ?x: Int, ?y: Int, ?hWndParent: Hwnd, ?ctX: Userdata, ?ctX2: Int, ?ctX3: Int): Void;
/**
 * type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL :
 * ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO
 */
@:native("ShowMessageBox")
public static function showMessageBox(msg: String, title: String, tYpe: Int): Int;
/**
 * Show a message to the user (also useful for debugging). Send "\n" for
 * newline, "" to clear the console. Prefix string with "!SHOW:" and text will
 * be added to console without opening the window. See ClearConsole
 */
@:native("ShowConsoleMsg")
public static function showConsoleMsg(msg: String): Void;
/** No description available */
@:native("ShowActionList")
public static function showActionList(?section: haxe.extern.EitherType<Dynamic, Int>, ?callerWnd: Hwnd): Void;
/**
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUIWidth")
public static function setTrackUiWidth(track: MediaTrack, wIdtH: Float, relative: Bool, done: Bool, igngroupFlags: Int): Float;
/**
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUIVolume")
public static function setTrackUiVolume(track: MediaTrack, volume: Float, relative: Bool, done: Bool, igngroupFlags: Int): Float;
/**
 * solo: <0 toggles, 1 sets solo (default mode), 0=unsets solo, 2 sets solo
 * (non-SIP), 4 sets solo (SIP). returns new value or -1 if error.
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUISolo")
public static function setTrackUiSolo(track: MediaTrack, solo: Int, igngroupFlags: Int): Int;
/**
 * recarm: <0 toggles, >0 sets recarm, 0=unsets recarm. returns new value or -1
 * if error. igngroupflags: &1 to prevent track grouping, &2 to prevent
 * selection ganging
 */
@:native("SetTrackUIRecArm")
public static function setTrackUiRecArm(track: MediaTrack, recArm: Int, igngroupFlags: Int): Int;
/**
 * polarity (AKA phase): <0 toggles, 0=normal, >0=inverted. returns new value or
 * -1 if error.igngroupflags: &1 to prevent track grouping, &2 to prevent
 * selection ganging
 */
@:native("SetTrackUIPolarity")
public static function setTrackUiPolarity(track: MediaTrack, polaritY: Int, igngroupFlags: Int): Int;
/**
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUIPan")
public static function setTrackUiPan(track: MediaTrack, pan: Float, relative: Bool, done: Bool, igngroupFlags: Int): Float;
/**
 * mute: <0 toggles, >0 sets mute, 0=unsets mute. returns new value or -1 if
 * error. igngroupflags: &1 to prevent track grouping, &2 to prevent selection
 * ganging
 */
@:native("SetTrackUIMute")
public static function setTrackUiMute(track: MediaTrack, mute: Int, igngroupFlags: Int): Int;
/**
 * monitor: 0=no monitoring, 1=monitoring, 2=auto-monitoring. returns new value
 * or -1 if error. igngroupflags: &1 to prevent track grouping, &2 to prevent
 * selection ganging
 */
@:native("SetTrackUIInputMonitor")
public static function setTrackUiInputMonitor(track: MediaTrack, monitor: Int, igngroupFlags: Int): Int;
/**
 * Sets the RPPXML state of a track, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("SetTrackStateChunk")
public static function setTrackStateChunk(track: MediaTrack, str: String, ?isundo: Bool): Bool;
/**
 * send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
 * isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal
 * tweak.
 */
@:native("SetTrackSendUIVol")
public static function setTrackSendUiVol(track: MediaTrack, sendIdX: Int, vol: Float, isend: Int): Bool;
/**
 * send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
 * isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal
 * tweak.
 */
@:native("SetTrackSendUIPan")
public static function setTrackSendUiPan(track: MediaTrack, sendIdX: Int, pan: Float, isend: Int): Bool;
/**
 * See CreateTrackSend, RemoveTrackSend, GetTrackNumSends.
 */
@:native("SetTrackSendInfo_Value")
public static function setTrackSendInfoValue(tr: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String, neWvalue: Float): Bool;
/** No description available */
@:native("SetTrackSelected")
public static function setTrackSelected(track: MediaTrack, selected: Bool): Void;
/**
 * channel < 0 assigns note name to all channels. pitch 128 assigns name for
 * CC0, pitch 129 for CC1, etc.
 */
@:native("SetTrackMIDINoteNameEx")
public static function setTrackMidiNoteNameEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack, pitcH: Int, cHan: Int, name: String): Bool;
/**
 * channel < 0 assigns these note names to all channels.
 */
@:native("SetTrackMIDINoteName")
public static function setTrackMidiNoteName(track: Int, pitcH: Int, cHan: Int, name: String): Bool;
/**
 * Set all MIDI lyrics on the track. Lyrics will be stuffed into any MIDI items
 * found in range. Flag is unused at present. str is passed in as beat position,
 * tab, text, tab (example with flag=2: "1.1.2\tLyric for measure 1 beat
 * 2\t2.1.1\tLyric for measure 2 beat 1	"). See GetTrackMIDILyrics
 */
@:native("SetTrackMIDILyrics")
public static function setTrackMidiLyrics(track: MediaTrack, flag: Int, str: String): Bool;
/**
 * Set the custom track color, color is OS dependent (i.e. ColorToNative(r,g,b).
 * To unset the track color, see SetMediaTrackInfo_Value I_CUSTOMCOLOR
 */
@:native("SetTrackColor")
public static function setTrackColor(track: MediaTrack, color: Int): Void;
/** No description available */
@:native("SetTrackAutomationMode")
public static function setTrackAutomationMode(tr: MediaTrack, mode: Int): Void;
/**
 * Updates the toggle state of an action, returns true if succeeded. Only
 * ReaScripts can have their toggle states changed programmatically. See
 * RefreshToolbar2.
 */
@:native("SetToggleCommandState")
public static function setToggleCommandState(sectionId: Int, commandId: Int, state: Int): Bool;
/**
 * * <strong>group_63</strong> : Group #64
 */
@:native("SetThemeColor")
public static function setThemeColor(iniKeY: String, color: Int, ?flags: Int): Int;
/**
 * Set parameters of a tempo/time signature marker. Provide either timepos (with
 * measurepos=-1, beatpos=-1), or measurepos and beatpos (with timepos=-1). If
 * timesig_num and timesig_denom are zero, the previous time signature will be
 * used. ptidx=-1 will insert a new tempo/time signature marker. See
 * CountTempoTimeSigMarkers, GetTempoTimeSigMarker, AddTempoTimeSigMarker.
 */
@:native("SetTempoTimeSigMarker")
public static function setTempoTimeSigMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, ptIdX: Int, timePos: Float, measurePos: Int, beatPos: Float, bpm: Float, timesigNum: Int, timesigDenom: Int, linearTempo: Bool): Bool;
/**
 * See GetTakeStretchMarkerSlope
 */
@:native("SetTakeStretchMarkerSlope")
public static function setTakeStretchMarkerSlope(take: MediaItemTake, idX: Int, slope: Float): Bool;
/**
 * Adds or updates a stretch marker. If idx<0, stretch marker will be added. If
 * idx>=0, stretch marker will be updated. When adding, if srcposInOptional is
 * omitted, source position will be auto-calculated. When updating a stretch
 * marker, if srcposInOptional is omitted, srcpos will not be modified.
 * Position/srcposition values will be constrained to nearby stretch markers.
 * Returns index of stretch marker, or -1 if did not insert (or marker already
 * existed at time).
 */
@:native("SetTakeStretchMarker")
public static function setTakeStretchMarker(take: MediaItemTake, idX: Int, pos: Float, ?srcPosIn: Float): Int;
/**
 * Inserts or updates a take marker. If idx<0, a take marker will be added,
 * otherwise an existing take marker will be updated. Returns the index of the
 * new or updated take marker (which may change if srcPos is updated). See
 * GetNumTakeMarkers, GetTakeMarker, DeleteTakeMarker
 */
@:native("SetTakeMarker")
public static function setTakeMarker(take: MediaItemTake, idX: Int, nameIn: String, ?srcPosIn: Float, ?colorIn: Int): Int;
/**
 * Add (flag > 0) or remove (flag < 0) a track from this region when using the
 * region render matrix. If adding, flag==2 means force mono, flag==4 means
 * force stereo, flag==N means force N/2 channels.
 */
@:native("SetRegionRenderMatrix")
public static function setRegionRenderMatrix(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, regionindeX: Int, track: MediaTrack, flag: Int): Void;
/**
 * Save a key/value pair for a specific extension, to be restored the next time
 * this specific project is loaded. Typically extname will be the name of a
 * reascript or extension section. If key is NULL or "", all extended data for
 * that extname will be deleted.  If val is NULL or "", the data previously
 * associated with that key will be deleted. Returns the size of the state for
 * this extname. See GetProjExtState, EnumProjExtState.
 */
@:native("SetProjExtState")
public static function setProjExtState(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, eXtName: String, keY: String, value: String): Int;
/**
 * Differs from SetProjectMarker4 in that markrgnidx is 0 for the first
 * marker/region, 1 for the next, etc (see EnumProjectMarkers3), rather than
 * representing the displayed marker/region ID number (see SetProjectMarker3).
 * IDnumber < 0 to ignore. Function will fail if attempting to set a duplicate
 * ID number for a region (duplicate ID numbers for markers are OK). flags&1 to
 * clear name. If flags&2, markers will not be re-sorted, and after making
 * updates, you MUST call SetProjectMarkerByIndex2 with markrgnidx=-1 and
 * flags&2 to force re-sort/UI updates.
 */
@:native("SetProjectMarkerByIndex2")
public static function setProjectMarkerByIndex2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnIdX: Int, isrgn: Bool, pos: Float, rgnend: Float, idnumber: Int, name: String, color: Int, flags: Int): Bool;
/**
 * See SetProjectMarkerByIndex2.
 */
@:native("SetProjectMarkerByIndex")
public static function setProjectMarkerByIndex(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnIdX: Int, isrgn: Bool, pos: Float, rgnend: Float, idnumber: Int, name: String, color: Int): Bool;
/**
 * color should be 0 to not change, or ColorToNative(r,g,b)|0x1000000, flags&1
 * to clear name
 */
@:native("SetProjectMarker4")
public static function setProjectMarker4(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String, color: Int, flags: Int): Bool;
/**
 * Note: this function can't clear a marker's name (an empty string will leave
 * the name unchanged), see SetProjectMarker4.
 */
@:native("SetProjectMarker3")
public static function setProjectMarker3(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String, color: Int): Bool;
/**
 * Note: this function can't clear a marker's name (an empty string will leave
 * the name unchanged), see SetProjectMarker4.
 */
@:native("SetProjectMarker2")
public static function setProjectMarker2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String): Bool;
/**
 * Note: this function can't clear a marker's name (an empty string will leave
 * the name unchanged), see SetProjectMarker4.
 */
@:native("SetProjectMarker")
public static function setProjectMarker(markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String): Bool;
/**
 * Set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half note
 * triplet, etc.
 */
@:native("SetProjectGrid")
public static function setProjectGrid(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, division: Float): Void;
/**
 * Set exactly one track selected, deselect all others
 */
@:native("SetOnlyTrackSelected")
public static function setOnlyTrackSelected(track: MediaTrack): Void;
/**
 * See GetMouseModifier.
 */
@:native("SetMouseModifier")
public static function setMouseModifier(conteXt: String, modifierFlag: Int, action: String): Void;
/**
 * Scroll the mixer so that leftmosttrack is the leftmost visible track. Returns
 * the leftmost track after scrolling, which may be different from the passed-in
 * track if there are not enough tracks to its right.
 */
@:native("SetMixerScroll")
public static function setMixerScroll(leftmosttrack: MediaTrack): MediaTrack;
/**
 * Set the MIDI editor grid division. 0.25=quarter note, 1.0/3.0=half note
 * tripet, etc.
 */
@:native("SetMIDIEditorGrid")
public static function setMidiEditorGrid(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, division: Float): Void;
/**
 * D_PLAY_OFFSET : double * : track media playback offset, units depend on
 * I_PLAY_OFFSET_FLAG
 */
@:native("SetMediaTrackInfo_Value")
public static function setMediaTrackInfoValue(tr: MediaTrack, pArmName: String, neWvalue: Float): Bool;
/**
 * IP_TAKENUMBER : int : take number (read-only, returns the take number
 * directly)
 */
@:native("SetMediaItemTakeInfo_Value")
public static function setMediaItemTakeInfoValue(take: MediaItemTake, pArmName: String, neWvalue: Float): Bool;
/**
 * Set media source of media item take. The old source will not be destroyed, it
 * is the caller's responsibility to retrieve it and destroy it after. If source
 * already exists in any project, it will be duplicated before being set. C/C++
 * code should not use this and instead use GetSetMediaItemTakeInfo() with
 * P_SOURCE to manage ownership directly.
 */
@:native("SetMediaItemTake_Source")
public static function setMediaItemTakeSource(take: MediaItemTake, source: PcmSource): Bool;
/** No description available */
@:native("SetMediaItemSelected")
public static function setMediaItemSelected(item: MediaItem, selected: Bool): Void;
/**
 * See UpdateArrange().
 */
@:native("SetMediaItemPosition")
public static function setMediaItemPosition(item: MediaItem, position: Float, refresHUi: Bool): Bool;
/**
 * See UpdateArrange().
 */
@:native("SetMediaItemLength")
public static function setMediaItemLength(item: MediaItem, lengtH: Float, refresHUi: Bool): Bool;
/**
 * B_FIXEDLANE_HIDDEN : bool * : true if displaying only one fixed lane and this
 * item is in a different lane (read-only)
 */
@:native("SetMediaItemInfo_Value")
public static function setMediaItemInfoValue(item: MediaItem, pArmName: String, neWvalue: Float): Bool;
/**
 * set &1 to show the master track in the TCP, &2 to HIDE in the mixer. Returns
 * the previous visibility state. See GetMasterTrackVisibility.
 */
@:native("SetMasterTrackVisibility")
public static function setMasterTrackVisibility(flag: Int): Int;
/**
 * Sets the RPPXML state of an item, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("SetItemStateChunk")
public static function setItemStateChunk(item: MediaItem, str: String, ?isundo: Bool): Bool;
/**
 * mode: see GetGlobalAutomationOverride
 */
@:native("SetGlobalAutomationOverride")
public static function setGlobalAutomationOverride(mode: Int): Void;
/**
 * Set the extended state value for a specific section and key. persist=true
 * means the value should be stored and reloaded the next time REAPER is opened.
 * See GetExtState, DeleteExtState, HasExtState.
 */
@:native("SetExtState")
public static function setExtState(section: String, keY: String, value: String, persist: Bool): Void;
/**
 * Sets the RPPXML state of an envelope, returns true if successful. Undo flag
 * is a performance/caching hint.
 */
@:native("SetEnvelopeStateChunk")
public static function setEnvelopeStateChunk(env: TrackEnvelope, str: String, ?isundo: Bool): Bool;
/**
 * See CountEnvelopePointsEx, GetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("SetEnvelopePointEx")
public static function setEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, ptIdX: Int, ?timeIn: Float, ?valueIn: Float, ?sHapeIn: Int, ?tensionIn: Float, ?selectedIn: Bool, ?noSortIn: Bool): Bool;
/**
 * Set attributes of an envelope point. Values that are not supplied will be
 * ignored. If setting multiple points at once, set noSort=true, and call
 * Envelope_SortPoints when done. See SetEnvelopePointEx.
 */
@:native("SetEnvelopePoint")
public static function setEnvelopePoint(envelope: TrackEnvelope, ptIdX: Int, ?timeIn: Float, ?valueIn: Float, ?sHapeIn: Int, ?tensionIn: Float, ?selectedIn: Bool, ?noSortIn: Bool): Bool;
/** No description available */
@:native("SetEditCurPos2")
public static function setEditCurPos2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float, movevieW: Bool, seekPlaY: Bool): Void;
/** No description available */
@:native("SetEditCurPos")
public static function setEditCurPos(time: Float, movevieW: Bool, seekPlaY: Bool): Void;
/**
 * You must use this to change the focus programmatically. mode=0 to focus track
 * panels, 1 to focus the arrange window, 2 to focus the arrange window and
 * select env (or env==NULL to clear the current track/take envelope selection)
 */
@:native("SetCursorContext")
public static function setCursorContext(mode: Int, ?envIn: TrackEnvelope): Void;
/**
 * set current BPM in project, set wantUndo=true to add undo point
 */
@:native("SetCurrentBPM")
public static function setCurrentBpm(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, bpm: Float, wantUndo: Bool): Void;
/**
 * sets all or selected tracks to mode.
 */
@:native("SetAutomationMode")
public static function setAutomationMode(mode: Int, onlYSel: Bool): Void;
/**
 * set this take active in this media item
 */
@:native("SetActiveTake")
public static function setActiveTake(take: MediaItemTake): Void;
/**
 * for i=1, #sysex do msg = msg .. string.char(sysex[i]) end
 */
@:native("SendMIDIMessageToHardware")
public static function sendMidiMessageToHardware(output: Int, msg: String): Void;
/** No description available */
@:native("SelectProjectInstance")
public static function selectProjectInstance(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/** No description available */
@:native("SelectAllMediaItems")
public static function selectAllMediaItems(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, selected: Bool): Void;
/** No description available */
@:native("SectionFromUniqueID")
public static function sectionFromUniqueId(uniqueId: Int): Dynamic;
/**
 * See GetEnvelopeScalingMode.
 */
@:native("ScaleToEnvelopeMode")
public static function scaleToEnvelopeMode(scalingMode: Int, val: Float): Float;
/**
 * See GetEnvelopeScalingMode.
 */
@:native("ScaleFromEnvelopeMode")
public static function scaleFromEnvelopeMode(scalingMode: Int, val: Float): Float;
/**
 * Get the named command for the given command ID. The returned string will not
 * start with '_' (e.g. it will return "SWS_ABOUT"), it will be NULL if
 * command_id is a native action.
 */
@:native("ReverseNamedCommandLookup")
public static function reverseNamedCommandLookup(commandId: Int): String;
/**
 * Resolves a filename "in" by using project settings etc. If no file found, out
 * will be a copy of in.
 */
@:native("resolve_fn2")
public static function resolveFn2(_in: String, out: String, ?cHeckSubDir: String): String;
/**
 * See resolve_fn2.
 */
@:native("resolve_fn")
public static function resolveFn(_in: String, out: String): String;
/** No description available */
@:native("Resample_EnumModes")
public static function resampleEnumModes(mode: Int): String;
/**
 * Moves all selected tracks to immediately above track specified by index
 * beforeTrackIdx, returns false if no tracks were selected. makePrevFolder=0
 * for normal, 1 = as child of track preceding track specified by
 * beforeTrackIdx, 2 = if track preceding track specified by beforeTrackIdx is
 * last track in folder, extend folder
 */
@:native("ReorderSelectedTracks")
public static function reorderSelectedTracks(beforeTrackIdX: Int, makePrevFolder: Int): Bool;
/**
 * Not available while playing back.
 */
@:native("RenderFileSection")
public static function renderFileSection(sourceFileName: String, targetFileName: String, startPercent: Float, endPercent: Float, plaYRate: Float): Bool;
/**
 * Remove a send/receive/hardware output, return true on success. category is <0
 * for receives, 0=sends, >0 for hardware outputs. See CreateTrackSend,
 * GetSetTrackSendInfo, GetTrackSendInfo_Value, SetTrackSendInfo_Value,
 * GetTrackNumSends.
 */
@:native("RemoveTrackSend")
public static function removeTrackSend(tr: MediaTrack, categorY: Int, sendIdX: Int): Bool;
/**
 * Makes a filename "in" relative to the current project, if any.
 */
@:native("relative_fn")
public static function relativeFn(_in: String, out: String): String;
/**
 * Refresh the toolbar button states of a toggle action.
 */
@:native("RefreshToolbar2")
public static function refreshToolbar2(sectionId: Int, commandId: Int): Void;
/**
 * See RefreshToolbar2.
 */
@:native("RefreshToolbar")
public static function refreshToolbar(commandId: Int): Void;
/**
 * garbage-collects extra open files and closes them. if flags has 1 set, this
 * is done incrementally (call this from a regular timer, if desired). if flags
 * has 2 set, files are aggressively closed (they may need to be re-opened very
 * soon). returns number of files closed by this call.
 */
@:native("reduce_open_files")
public static function reduceOpenFiles(flags: Int): Int;
/**
 * returns positive value on success, 0 on failure.
 */
@:native("RecursiveCreateDirectory")
public static function recursiveCreateDirectory(patH: String, ignored: Int): Int;
/**
 * Causes REAPER to display the error message after the current ReaScript
 * finishes. If called within a Lua context and errmsg has a ! prefix, script
 * execution will be terminated.
 */
@:native("ReaScriptError")
public static function reaScriptError(errmsg: String): Void;
/**
 * Uses the action list to choose an action. Call with session_mode=1 to create
 * a session (init_id will be the initial action to select, or 0), then poll
 * with session_mode=0, checking return value for user-selected action (will
 * return 0 if no action selected yet, or -1 if the action window is no longer
 * available). When finished, call with session_mode=-1.
 */
@:native("PromptForAction")
public static function promptForAction(sessionMode: Int, initId: Int, sectionId: Int): Int;
/**
 * adds prevent_count to the UI refresh prevention state; always add then remove
 * the same amount, or major disfunction will occur
 */
@:native("PreventUIRefresh")
public static function preventUiRefresh(preventCount: Int): Void;
/** No description available */
@:native("PluginWantsAlwaysRunFx")
public static function pluginWantsAlwaysRunFx(amt: Int): Void;
/**
 * If a section/reverse block, retrieves offset/len/reverse. return true if
 * success
 */
@:native("PCM_Source_GetSectionInfo")
public static function pcmSourceGetSectionInfo(src: PcmSource): Bool;
/**
 * Gets block of peak samples to buf. Note that the peak samples are
 * interleaved, but in two or three blocks (maximums, then minimums, then
 * extra). Return value has 20 bits of returned sample count, then 4 bits of
 * output_mode (0xf00000), then a bit to signify whether extra_type was
 * available (0x1000000). extra_type can be 115 ('s') for spectral information,
 * which will return peak samples as integers with the low 15 bits frequency,
 * next 14 bits tonality.
 */
@:native("PCM_Source_GetPeaks")
public static function pcmSourceGetPeaks(src: PcmSource, peakRate: Float, startTime: Float, numcHannels: Int, numsamplespercHannel: Int, wantEXtraTYpe: Int, buf: ReaperArray): Int;
/**
 * Deletes a PCM_source -- be sure that you remove any project reference before
 * deleting a source
 */
@:native("PCM_Source_Destroy")
public static function pcmSourceDestroy(src: PcmSource): Void;
/**
 * Valid types include "WAVE", "MIDI", or whatever plug-ins define as well.
 */
@:native("PCM_Source_CreateFromType")
public static function pcmSourceCreateFromType(sourcetYpe: String): PcmSource;
/**
 * Create a PCM_source from filename, and override pref of MIDI files being
 * imported as in-project MIDI events.
 */
@:native("PCM_Source_CreateFromFileEx")
public static function pcmSourceCreateFromFileEx(fileName: String, forcenoMIdiImp: Bool): PcmSource;
/**
 * See PCM_Source_CreateFromFileEx.
 */
@:native("PCM_Source_CreateFromFile")
public static function pcmSourceCreateFromFile(fileName: String): PcmSource;
/**
 * Calls and returns PCM_source::PeaksBuild_Begin() if mode=0, PeaksBuild_Run()
 * if mode=1, and PeaksBuild_Finish() if mode=2. Normal use is to call
 * PCM_Source_BuildPeaks(src,0), and if that returns nonzero, call
 * PCM_Source_BuildPeaks(src,1) periodically until it returns zero (it returns
 * the percentage of the file remaining), then call PCM_Source_BuildPeaks(src,2)
 * to finalize. If PCM_Source_BuildPeaks(src,0) returns zero, then no further
 * action is necessary.
 */
@:native("PCM_Source_BuildPeaks")
public static function pcmSourceBuildPeaks(src: PcmSource, mode: Int): Int;
/** No description available */
@:native("PCM_Sink_ShowConfig")
public static function pcmSinkShowConfig(cfg: String, hWndParent: Hwnd): Hwnd;
/** No description available */
@:native("PCM_Sink_GetExtension")
public static function pcmSinkGetExtension(data: String): String;
/** No description available */
@:native("PCM_Sink_Enum")
public static function pcmSinkEnum(idX: Int): Int;
/** No description available */
@:native("parsepanstr")
public static function parsepanstr(str: String): Float;
/**
 * 5=h:m:s:f
 */
@:native("parse_timestr_pos")
public static function parseTimestrPos(buf: String, modeoverrIde: Int): Float;
/**
 * 5=h:m:s:f
 */
@:native("parse_timestr_len")
public static function parseTimestrLen(buf: String, offSet: Float, modeoverrIde: Int): Float;
/**
 * Parse hh:mm:ss.sss time string, return time in seconds (or 0.0 on error). See
 * parse_timestr_pos, parse_timestr_len.
 */
@:native("parse_timestr")
public static function parseTimestr(buf: String): Float;
/**
 * Send an OSC message directly to REAPER. The value argument may be NULL. The
 * message will be matched against the default OSC patterns.
 */
@:native("OscLocalMessageToHost")
public static function oscLocalMessageToHost(message: String, ?valueIn: Float): Void;
/**
 * Opens mediafn in the Media Explorer, play=true will play the file immediately
 * (or toggle playback if mediafn was already open), =false will just select it.
 */
@:native("OpenMediaExplorer")
public static function openMediaExplorer(mediaFn: String, plaY: Bool): Hwnd;
/** No description available */
@:native("OpenColorThemeFile")
public static function openColorThemeFile(fn: String): Bool;
/**
 * direct way to simulate stop button hit
 */
@:native("OnStopButtonEx")
public static function onStopButtonEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/**
 * direct way to simulate stop button hit
 */
@:native("OnStopButton")
public static function onStopButton(): Void;
/**
 * direct way to simulate play button hit
 */
@:native("OnPlayButtonEx")
public static function onPlayButtonEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/**
 * direct way to simulate play button hit
 */
@:native("OnPlayButton")
public static function onPlayButton(): Void;
/**
 * direct way to simulate pause button hit
 */
@:native("OnPauseButtonEx")
public static function onPauseButtonEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/**
 * direct way to simulate pause button hit
 */
@:native("OnPauseButton")
public static function onPauseButton(): Void;
/**
 * Get the command ID number for named command that was registered by an
 * extension such as "_SWS_ABOUT" or "_113088d11ae641c193a2b7ede3041ad5" for a
 * ReaScript or a custom action.
 */
@:native("NamedCommandLookup")
public static function namedCommandLookup(commandName: String): Int;
/** No description available */
@:native("my_getViewport")
public static function myGetViewport(rLeft: Int, rTop: Int, rRigHt: Int, rBot: Int, srLeft: Int, srTop: Int, srRigHt: Int, srBot: Int, wantWorkArea: Bool): Int;
/** No description available */
@:native("MuteAllTracks")
public static function muteAllTracks(mute: Bool): Void;
/**
 * returns TRUE if move succeeded
 */
@:native("MoveMediaItemToTrack")
public static function moveMediaItemToTrack(item: MediaItem, desttr: MediaTrack): Bool;
/** No description available */
@:native("MoveEditCursor")
public static function moveEditCursor(adjamt: Float, dosel: Bool): Void;
/** No description available */
@:native("mkvolstr")
public static function mkvolstr(strNeed64: String, vol: Float): String;
/** No description available */
@:native("mkvolpanstr")
public static function mkvolpanstr(strNeed64: String, vol: Float, pan: Float): String;
/** No description available */
@:native("mkpanstr")
public static function mkpanstr(strNeed64: String, pan: Float): String;
/**
 * Get or set MIDI editor settings for this track. pitchwheelrange: semitones up
 * or down. flags &1: snap pitch lane edits to semitones if pitchwheel range is
 * defined.
 */
@:native("MIDIEditorFlagsForTrack")
public static function midiEditorFlagsForTrack(track: MediaTrack, pitcHWHeelrange: Int, flags: Int, isSet: Bool): Int;
/**
 * See MIDIEditor_GetSetting_int
 */
@:native("MIDIEditor_SetSetting_int")
public static function midiEditorSetSettingInt(mIdieditor: Hwnd, settingDesc: String, setting: Int): Bool;
/**
 * see MIDIEditor_GetActive, MIDIEditor_LastFocused_OnCommand
 */
@:native("MIDIEditor_OnCommand")
public static function midiEditorOnCommand(mIdieditor: Hwnd, commandId: Int): Bool;
/**
 * see MIDIEditor_OnCommand
 */
@:native("MIDIEditor_LastFocused_OnCommand")
public static function midiEditorLastFocusedOnCommand(commandId: Int, isListvieWcommand: Bool): Bool;
/**
 * get the take that is currently being edited in this MIDI editor. see
 * MIDIEditor_EnumTakes
 */
@:native("MIDIEditor_GetTake")
public static function midiEditorGetTake(mIdieditor: Hwnd): MediaItemTake;
/**
 * See MIDIEditor_GetActive, MIDIEditor_GetSetting_int
 */
@:native("MIDIEditor_GetSetting_str")
public static function midiEditorGetSettingStr(mIdieditor: Hwnd, settingDesc: String): Bool;
/**
 * See MIDIEditor_SetSetting_int, MIDIEditor_GetActive,
 * MIDIEditor_GetSetting_str
 */
@:native("MIDIEditor_GetSetting_int")
public static function midiEditorGetSettingInt(mIdieditor: Hwnd, settingDesc: String): Int;
/**
 * see MIDIEditor_GetActive, MIDIEditor_OnCommand
 */
@:native("MIDIEditor_GetMode")
public static function midiEditorGetMode(mIdieditor: Hwnd): Int;
/**
 * see MIDIEditor_GetMode, MIDIEditor_OnCommand
 */
@:native("MIDIEditor_GetActive")
public static function midiEditorGetActive(): Hwnd;
/**
 * list the takes that are currently being edited in this MIDI editor, starting
 * with the active take. See MIDIEditor_GetTake
 */
@:native("MIDIEditor_EnumTakes")
public static function midiEditorEnumTakes(mIdieditor: Hwnd, takeindeX: Int, editableOnlY: Bool): MediaItemTake;
/**
 * Sort MIDI events after multiple calls to MIDI_SetNote, MIDI_SetCC, etc.
 */
@:native("MIDI_Sort")
public static function midiSort(take: MediaItemTake): Void;
/**
 * Set MIDI text or sysex event properties. Properties passed as NULL will not
 * be set. Allowable types are -1:sysex (msg should not include bounding
 * F0..F7), 1-14:MIDI text event types, 15=REAPER notation event. set noSort if
 * setting multiple events, then call MIDI_Sort when done.
 */
@:native("MIDI_SetTextSysexEvt")
public static function midiSetTextSysexEvt(take: MediaItemTake, teXtsYXevtIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?ppqPosIn: Float, ?tYpeIn: Int, ?msg: String, ?noSortIn: Bool): Bool;
/**
 * Set MIDI note properties. Properties passed as NULL (or negative values) will
 * not be set. Set noSort if setting multiple events, then call MIDI_Sort when
 * done. Setting multiple note start positions at once is done more safely by
 * deleting and re-inserting the notes.
 */
@:native("MIDI_SetNote")
public static function midiSetNote(take: MediaItemTake, noteIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?startppqPosIn: Float, ?endppqPosIn: Float, ?cHanIn: Int, ?pitcHIn: Int, ?velIn: Int, ?noSortIn: Bool): Bool;
/**
 * Set the start/end positions of a media item that contains a MIDI take.
 */
@:native("MIDI_SetItemExtents")
public static function midiSetItemExtents(item: MediaItem, startQn: Float, endQn: Float): Bool;
/**
 * Set MIDI event properties. Properties passed as NULL will not be set.  set
 * noSort if setting multiple events, then call MIDI_Sort when done.
 */
@:native("MIDI_SetEvt")
public static function midiSetEvt(take: MediaItemTake, evtIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?ppqPosIn: Float, ?msg: String, ?noSortIn: Bool): Bool;
/**
 * Set CC shape and bezier tension. set noSort if setting multiple events, then
 * call MIDI_Sort when done. See MIDI_SetCC, MIDI_GetCCShape
 */
@:native("MIDI_SetCCShape")
public static function midiSetCcShape(take: MediaItemTake, ccIdX: Int, sHape: Int, beztension: Float, ?noSortIn: Bool): Bool;
/**
 * Set MIDI CC event properties. Properties passed as NULL will not be set. set
 * noSort if setting multiple events, then call MIDI_Sort when done.
 */
@:native("MIDI_SetCC")
public static function midiSetCc(take: MediaItemTake, ccIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?ppqPosIn: Float, ?cHanmsgIn: Int, ?cHanIn: Int, ?msg2In: Int, ?msg3In: Int, ?noSortIn: Bool): Bool;
/**
 * See MIDI_GetAllEvts.
 */
@:native("MIDI_SetAllEvts")
public static function midiSetAllEvts(take: MediaItemTake, buf: String): Bool;
/**
 * Select or deselect all MIDI content.
 */
@:native("MIDI_SelectAll")
public static function midiSelectAll(take: MediaItemTake, select: Bool): Void;
/**
 * Reset (close and re-open) all MIDI devices
 */
@:native("midi_reinit")
public static function midiReinit(): Void;
/**
 * Synchronously updates any open MIDI editors for MIDI take
 */
@:native("MIDI_RefreshEditors")
public static function midiRefreshEditors(tk: MediaItemTake): Void;
/**
 * Insert a new MIDI text or sysex event. Allowable types are -1:sysex (msg
 * should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER
 * notation event.
 */
@:native("MIDI_InsertTextSysexEvt")
public static function midiInsertTextSysexEvt(take: MediaItemTake, selected: Bool, muted: Bool, ppqPos: Float, tYpe: Int, bYtestr: String): Bool;
/**
 * Insert a new MIDI note. Set noSort if inserting multiple events, then call
 * MIDI_Sort when done.
 */
@:native("MIDI_InsertNote")
public static function midiInsertNote(take: MediaItemTake, selected: Bool, muted: Bool, startppqPos: Float, endppqPos: Float, cHan: Int, pitcH: Int, vel: Int, ?noSortIn: Bool): Bool;
/**
 * Insert a new MIDI event.
 */
@:native("MIDI_InsertEvt")
public static function midiInsertEvt(take: MediaItemTake, selected: Bool, muted: Bool, ppqPos: Float, bYtestr: String): Bool;
/**
 * Insert a new MIDI CC event.
 */
@:native("MIDI_InsertCC")
public static function midiInsertCc(take: MediaItemTake, selected: Bool, muted: Bool, ppqPos: Float, cHanmsg: Int, cHan: Int, msg2: Int, msg3: Int): Bool;
/**
 * Opens MIDI devices as configured in preferences. force_reinit_input and
 * force_reinit_output force a particular device index to close/re-open (pass -1
 * to not force any devices to reopen).
 */
@:native("midi_init")
public static function midiInit(forceReinitInput: Int, forceReinitOutput: Int): Void;
/**
 * Get a string that only changes when the MIDI data changes. If
 * notesonly==true, then the string changes only when the MIDI notes change. See
 * MIDI_GetHash
 */
@:native("MIDI_GetTrackHash")
public static function midiGetTrackHash(track: MediaTrack, notesonlY: Bool): Bool;
/**
 * Get MIDI meta-event properties. Allowable types are -1:sysex (msg should not
 * include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation
 * event. For all other meta-messages, type is returned as -2 and msg returned
 * as all zeroes. See MIDI_GetEvt.
 */
@:native("MIDI_GetTextSysexEvt")
public static function midiGetTextSysexEvt(take: MediaItemTake, teXtsYXevtIdX: Int, ?selected: Bool, ?muted: Bool, ?ppqPos: Float, ?tYpe: Int, ?msg: String): Bool;
/**
 * Get the active scale in the media source, if any. root 0=C, 1=C#, etc. scale
 * &0x1=root, &0x2=minor 2nd, &0x4=major 2nd, &0x8=minor 3rd, &0xF=fourth, etc.
 */
@:native("MIDI_GetScale")
public static function midiGetScale(take: MediaItemTake): Bool;
/**
 * Gets a recent MIDI input event from the global history. idx=0 for the most
 * recent event, which also latches to the latest MIDI event state (to get a
 * more recent list, calling with idx=0 is necessary). idx=1 next most recent
 * event, returns a non-zero sequence number for the event, or zero if no more
 * events. tsOut will be set to the timestamp in samples relative to the current
 * position (0 is current, -48000 is one second ago, etc). devIdxOut will have
 * the low 16 bits set to the input device index, and 0x10000 will be set if
 * device was enabled only for control. projPosOut will be set to project
 * position in seconds if project was playing back at time of event, otherwise
 * -1. Large SysEx events will not be included in this event list.
 */
@:native("MIDI_GetRecentInputEvent")
public static function midiGetRecentInputEvent(idX: Int): Int;
/**
 * Returns the project time in seconds corresponding to a specific MIDI tick
 * (ppq) position.
 */
@:native("MIDI_GetProjTimeFromPPQPos")
public static function midiGetProjTimeFromPpqPos(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Returns the project time in quarter notes corresponding to a specific MIDI
 * tick (ppq) position.
 */
@:native("MIDI_GetProjQNFromPPQPos")
public static function midiGetProjQnFromPpqPos(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to a specific project time
 * in seconds.
 */
@:native("MIDI_GetPPQPosFromProjTime")
public static function midiGetPpqPosFromProjTime(take: MediaItemTake, projTime: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to a specific project time
 * in quarter notes.
 */
@:native("MIDI_GetPPQPosFromProjQN")
public static function midiGetPpqPosFromProjQn(take: MediaItemTake, projqn: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to the start of the
 * measure.
 */
@:native("MIDI_GetPPQPos_StartOfMeasure")
public static function midiGetPpqPosStartOfMeasure(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to the end of the measure.
 */
@:native("MIDI_GetPPQPos_EndOfMeasure")
public static function midiGetPpqPosEndOfMeasure(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Get MIDI note properties.
 */
@:native("MIDI_GetNote")
public static function midiGetNote(take: MediaItemTake, noteIdX: Int): Bool;
/**
 * Get a string that only changes when the MIDI data changes. If
 * notesonly==true, then the string changes only when the MIDI notes change. See
 * MIDI_GetTrackHash
 */
@:native("MIDI_GetHash")
public static function midiGetHash(take: MediaItemTake, notesonlY: Bool): Bool;
/**
 * Returns the most recent MIDI editor grid size for this MIDI take, in QN.
 * Swing is between 0 and 1. Note length is 0 if it follows the grid size.
 */
@:native("MIDI_GetGrid")
public static function midiGetGrid(take: MediaItemTake): Float;
/**
 * Get MIDI event properties.
 */
@:native("MIDI_GetEvt")
public static function midiGetEvt(take: MediaItemTake, evtIdX: Int): Bool;
/**
 * Get CC shape and bezier tension. See MIDI_GetCC, MIDI_SetCCShape
 */
@:native("MIDI_GetCCShape")
public static function midiGetCcShape(take: MediaItemTake, ccIdX: Int): Bool;
/**
 * Get MIDI CC event properties.
 */
@:native("MIDI_GetCC")
public static function midiGetCc(take: MediaItemTake, ccIdX: Int): Bool;
/**
 * See MIDI_SetAllEvts.
 */
@:native("MIDI_GetAllEvts")
public static function midiGetAllEvts(take: MediaItemTake): Bool;
/**
 * Returns the index of the next selected MIDI text/sysex event after textsyxidx
 * (-1 if there are no more selected events).
 */
@:native("MIDI_EnumSelTextSysexEvts")
public static function midiEnumSelTextSysexEvts(take: MediaItemTake, teXtsYXIdX: Int): Int;
/**
 * Returns the index of the next selected MIDI note after noteidx (-1 if there
 * are no more selected events).
 */
@:native("MIDI_EnumSelNotes")
public static function midiEnumSelNotes(take: MediaItemTake, noteIdX: Int): Int;
/**
 * Returns the index of the next selected MIDI event after evtidx (-1 if there
 * are no more selected events).
 */
@:native("MIDI_EnumSelEvts")
public static function midiEnumSelEvts(take: MediaItemTake, evtIdX: Int): Int;
/**
 * Returns the index of the next selected MIDI CC event after ccidx (-1 if there
 * are no more selected events).
 */
@:native("MIDI_EnumSelCC")
public static function midiEnumSelCc(take: MediaItemTake, ccIdX: Int): Int;
/**
 * Disable sorting for all MIDI insert, delete, get and set functions, until
 * MIDI_Sort is called.
 */
@:native("MIDI_DisableSort")
public static function midiDisableSort(take: MediaItemTake): Void;
/**
 * Delete a MIDI text or sysex event.
 */
@:native("MIDI_DeleteTextSysexEvt")
public static function midiDeleteTextSysexEvt(take: MediaItemTake, teXtsYXevtIdX: Int): Bool;
/**
 * Delete a MIDI note.
 */
@:native("MIDI_DeleteNote")
public static function midiDeleteNote(take: MediaItemTake, noteIdX: Int): Bool;
/**
 * Delete a MIDI event.
 */
@:native("MIDI_DeleteEvt")
public static function midiDeleteEvt(take: MediaItemTake, evtIdX: Int): Bool;
/**
 * Delete a MIDI CC event.
 */
@:native("MIDI_DeleteCC")
public static function midiDeleteCc(take: MediaItemTake, ccIdX: Int): Bool;
/**
 * Count the number of notes, CC events, and text/sysex events in a given MIDI
 * item.
 */
@:native("MIDI_CountEvts")
public static function midiCountEvts(take: MediaItemTake): Int;
/**
 * Get a string that only changes when menu/toolbar entries are added or removed
 * (not re-ordered). Can be used to determine if a customized menu/toolbar
 * differs from the default, or if the default changed after a menu/toolbar was
 * customized. flag==0: current default menu/toolbar; flag==1: current
 * customized menu/toolbar; flag==2: default menu/toolbar at the time the
 * current menu/toolbar was most recently customized, if it was customized in
 * REAPER v7.08 or later.
 */
@:native("Menu_GetHash")
public static function menuGetHash(menuName: String, flag: Int): Bool;
/**
 * Returns 1 if the track holds the item, 2 if the track is a folder containing
 * the track that holds the item, etc.
 */
@:native("MediaItemDescendsFromTrack")
public static function mediaItemDescendsFromTrack(item: MediaItem, track: MediaTrack): Int;
/**
 * Get information about the most recently previewed Media Explorer file.
 * filename: last played file name. filemode: &1:insert on new track, &2:insert
 * into sampler, &8:tempo sync 1x, &16:tempo sync 0.5x, &32:tempo sync 2x,
 * &64:do not preserve pitch when changing playrate, &128:loop selection exists,
 * &256:time selection exists, &512:apply pitch/rate adjustment on insert,
 * &1024:apply volume adjustment on insert, &2048:apply normalization on insert,
 * &8192:reverse preview. startpct/endpct: time selection in [0.0, 1.0].
 * pitchshift/voladj/rateadj: current pitch/volume/playrate preview adjustments.
 * srcbpm: source media tempo. extrainfo: currently unused.
 */
@:native("MediaExplorerGetLastPlayedFileInfo")
public static function mediaExplorerGetLastPlayedFileInfo(): Bool;
/**
 * type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL :
 * ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO
 */
@:native("MB")
public static function mb(msg: String, title: String, tYpe: Int): Int;
/**
 * Convert the tempo to/from a value between 0 and 1, representing bpm in the
 * range of 40-296 bpm.
 */
@:native("Master_NormalizeTempo")
public static function masterNormalizeTempo(bpm: Float, isnormalized: Bool): Float;
/**
 * Convert play rate to/from a value between 0 and 1, representing the position
 * on the project playrate slider.
 */
@:native("Master_NormalizePlayRate")
public static function masterNormalizePlayRate(plaYRate: Float, isnormalized: Bool): Float;
/** No description available */
@:native("Master_GetTempo")
public static function masterGetTempo(): Float;
/** No description available */
@:native("Master_GetPlayRateAtTime")
public static function masterGetPlayRateAtTime(timeS: Float, proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/** No description available */
@:native("Master_GetPlayRate")
public static function masterGetPlayRate(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * If track is supplied, item is ignored
 */
@:native("MarkTrackItemsDirty")
public static function markTrackItemsDirty(track: MediaTrack, item: MediaItem): Void;
/**
 * Marks project as dirty (needing save) if 'undo/prompt to save' is enabled in
 * preferences.
 */
@:native("MarkProjectDirty")
public static function markProjectDirty(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/** No description available */
@:native("Main_UpdateLoopInfo")
public static function mainUpdateLoopInfo(ignoremask: Int): Void;
/**
 * Save the project. options: &1=save selected tracks as track template,
 * &2=include media with track template, &4=include envelopes with track
 * template, &8=if not saving template, set as the new project filename for this
 * ReaProject. See Main_openProject, Main_SaveProject.
 */
@:native("Main_SaveProjectEx")
public static function mainSaveProjectEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, fileName: String, options: Int): Void;
/**
 * Save the project.
 */
@:native("Main_SaveProject")
public static function mainSaveProject(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, ?forceSaveAsIn: Bool): Void;
/**
 * If passed a .RTrackTemplate file, adds the template to the existing project.
 */
@:native("Main_openProject")
public static function mainOpenProject(name: String): Void;
/**
 * Performs an action belonging to the main action section. To perform
 * non-native actions (ReaScripts, custom or extension plugins' actions) safely,
 * see NamedCommandLookup().
 */
@:native("Main_OnCommandEx")
public static function mainOnCommandEx(command: Int, flag: Int, proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Void;
/**
 * See Main_OnCommandEx.
 */
@:native("Main_OnCommand")
public static function mainOnCommand(command: Int, flag: Int): Void;
/**
 * Move the loop selection left or right. Returns true if snap is enabled.
 */
@:native("Loop_OnArrow")
public static function loopOnArrow(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, direction: Int): Bool;
/**
 * Returns a localized version of src_string, in section section. flags can have
 * 1 set to only localize if sprintf-style formatting matches the original.
 */
@:native("LocalizeString")
public static function localizeString(srcString: String, section: String, ?flags: Int): String;
/**
 * Returns false if the line is entirely offscreen.
 */
@:native("LICE_ClipLine")
public static function liceClipLine(pX1: Int, pY1: Int, pX2: Int, pY2: Int, xLo: Int, yLo: Int, xHi: Int, yHi: Int): Bool;
/** No description available */
@:native("kbd_getTextFromCmd")
public static function kbdGetTextFromCmd(cmd: Int, section: haxe.extern.EitherType<Dynamic, Int>): String;
/** No description available */
@:native("kbd_enumerateActions")
public static function kbdEnumerateActions(section: haxe.extern.EitherType<Dynamic, Int>, idX: Int): Int;
/**
 * Updates joystick state from hardware, returns true if successful
 * (joystick_get* will not be valid until joystick_update() is called
 * successfully)
 */
@:native("joystick_update")
public static function joystickUpdate(dev: JoystickDevice): Bool;
/**
 * returns POV value (usually 0..655.35, or 655.35 on error)
 */
@:native("joystick_getpov")
public static function joystickGetpov(dev: JoystickDevice, pov: Int): Float;
/**
 * returns button count
 */
@:native("joystick_getinfo")
public static function joystickGetinfo(dev: JoystickDevice): Int;
/**
 * returns button pressed mask, 1=first button, 2=second...
 */
@:native("joystick_getbuttonmask")
public static function joystickGetbuttonmask(dev: JoystickDevice): Int;
/**
 * returns axis value (-1..1)
 */
@:native("joystick_getaxis")
public static function joystickGetaxis(dev: JoystickDevice, aXis: Int): Float;
/**
 * enumerates installed devices, returns GUID as a string
 */
@:native("joystick_enum")
public static function joystickEnum(indeX: Int): String;
/**
 * destroys a joystick device
 */
@:native("joystick_destroy")
public static function joystickDestroy(device: JoystickDevice): Void;
/**
 * creates a joystick device
 */
@:native("joystick_create")
public static function joystickCreate(guIdGuId: String): JoystickDevice;
/**
 * If mixer==true, returns true if the track is visible in the mixer.  If
 * mixer==false, returns true if the track is visible in the track control
 * panel.
 */
@:native("IsTrackVisible")
public static function isTrackVisible(track: MediaTrack, miXer: Bool): Bool;
/** No description available */
@:native("IsTrackSelected")
public static function isTrackSelected(track: MediaTrack): Bool;
/**
 * Is the project dirty (needing save)? Always returns 0 if 'undo/prompt to
 * save' is disabled in preferences.
 */
@:native("IsProjectDirty")
public static function isProjectDirty(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/** No description available */
@:native("IsMediaItemSelected")
public static function isMediaItemSelected(item: MediaItem): Bool;
/**
 * If wantOthers is set, then "RPP", "TXT" and other project-type formats will
 * also pass.
 */
@:native("IsMediaExtension")
public static function isMediaExtension(eXt: String, wantOtHers: Bool): Bool;
/**
 * inserts a track in project proj at idx, this will be clamped to
 * 0..CountTracks(proj). flags&1 for default envelopes/FX, otherwise no enabled
 * fx/envelopes will be added.
 */
@:native("InsertTrackInProject")
public static function insertTrackInProject(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, idX: Int, flags: Int): Void;
/**
 * inserts a track at idx,of course this will be clamped to 0..GetNumTracks().
 * wantDefaults=TRUE for default envelopes/FX,otherwise no enabled fx/env.
 * Superseded, see InsertTrackInProject
 */
@:native("InsertTrackAtIndex")
public static function insertTrackAtIndex(idX: Int, wantDefaults: Bool): Void;
/**
 * See InsertMedia.
 */
@:native("InsertMediaSection")
public static function insertMediaSection(file: String, mode: Int, startpct: Float, endpct: Float, pitcHsHift: Float): Int;
/**
 * mode: 0=add to current track, 1=add new track, 3=add to selected items as
 * takes, &4=stretch/loop to fit time sel, &8=try to match tempo 1x, &16=try to
 * match tempo 0.5x, &32=try to match tempo 2x, &64=don't preserve pitch when
 * matching tempo, &128=no loop/section if startpct/endpct set, &256=force loop
 * regardless of global preference for looping imported items, &512=use high
 * word as absolute track index if mode&3==0 or mode&2048, &1024=insert into
 * reasamplomatic on a new track (add 1 to insert on last selected track),
 * &2048=insert into open reasamplomatic instance (add 512 to use high word as
 * absolute track index), &4096=move to source preferred position (BWF start
 * offset), &8192=reverse. &16384=apply ripple according to project setting
 */
@:native("InsertMedia")
public static function insertMedia(file: String, mode: Int): Int;
/**
 * See CountEnvelopePointsEx, GetEnvelopePointEx, SetEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("InsertEnvelopePointEx")
public static function insertEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, time: Float, value: Float, sHape: Int, tension: Float, selected: Bool, ?noSortIn: Bool): Bool;
/**
 * Insert an envelope point. If setting multiple points at once, set
 * noSort=true, and call Envelope_SortPoints when done. See
 * InsertEnvelopePointEx.
 */
@:native("InsertEnvelopePoint")
public static function insertEnvelopePoint(envelope: TrackEnvelope, time: Float, value: Float, sHape: Int, tension: Float, selected: Bool, ?noSortIn: Bool): Bool;
/**
 * Insert a new automation item. pool_id < 0 collects existing envelope points
 * into the automation item; if pool_id is >= 0 the automation item will be a
 * new instance of that pool (which will be created as an empty instance if it
 * does not exist). Returns the index of the item, suitable for passing to other
 * automation item API functions. See GetSetAutomationItemInfo.
 */
@:native("InsertAutomationItem")
public static function insertAutomationItem(env: TrackEnvelope, poolId: Int, position: Float, lengtH: Float): Int;
/** No description available */
@:native("image_resolve_fn")
public static function imageResolveFn(_in: String, out: String): String;
/** No description available */
@:native("Help_Set")
public static function helpSet(helpstring: String, isTemporarYHelp: Bool): Void;
/**
 * returns name of track plugin that is supplying MIDI programs,or NULL if there
 * is none
 */
@:native("HasTrackMIDIProgramsEx")
public static function hasTrackMidiProgramsEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack): String;
/**
 * returns name of track plugin that is supplying MIDI programs,or NULL if there
 * is none
 */
@:native("HasTrackMIDIPrograms")
public static function hasTrackMidiPrograms(track: Int): String;
/**
 * Returns true if there exists an extended state value for a specific section
 * and key. See SetExtState, GetExtState, DeleteExtState.
 */
@:native("HasExtState")
public static function hasExtState(section: String, keY: String): Bool;
/**
 * dest should be at least 64 chars long to be safe
 */
@:native("guidToString")
public static function guidToString(gGuId: String, destNeed64: String): String;
/**
 * this is just like win32 GetSysColor() but can have overrides.
 */
@:native("GSC_mainwnd")
public static function gscMainwnd(t: Int): Int;
/**
 * Runs the system color chooser dialog.  Returns 0 if the user cancels the
 * dialog.
 */
@:native("GR_SelectColor")
public static function grSelectColor(hWnd: Hwnd): Int;
/**
 * Seek to region after current region finishes playing (smooth seek). If
 * use_timeline_order==true, region_index 1 refers to the first region on the
 * timeline.  If use_timeline_order==false, region_index 1 refers to the first
 * region with the user-editable index of 1.
 */
@:native("GoToRegion")
public static function goToRegion(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, regionIndeX: Int, uSeTimeLineOrder: Bool): Void;
/**
 * Go to marker. If use_timeline_order==true, marker_index 1 refers to the first
 * marker on the timeline.  If use_timeline_order==false, marker_index 1 refers
 * to the first marker with the user-editable index of 1.
 */
@:native("GoToMarker")
public static function goToMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markerIndeX: Int, uSeTimeLineOrder: Bool): Void;
/**
 * Maximum fields is 16. Values are returned as a comma-separated string.
 * Returns false if the user canceled the dialog. You can supply special extra
 * information via additional caption fields: extrawidth=XXX to increase text
 * field width, separator=X to use a different separator for returned fields.
 */
@:native("GetUserInputs")
public static function getUserInputs(title: String, numInputs: Int, captionsCsv: String, retvalsCsv: String): Bool;
/**
 * returns true if the user selected a valid file, false if the user canceled
 * the dialog
 */
@:native("GetUserFileNameForRead")
public static function getUserFileNameForRead(fileNameNeed4096: String, title: String, defeXt: String): Bool;
/**
 * retrieves the last timestamps of audio xrun (yellow-flash, if available),
 * media xrun (red-flash), and the current time stamp (all milliseconds)
 */
@:native("GetUnderrunTime")
public static function getUnderrunTime(): Int;
/** No description available */
@:native("GetTrackUIVolPan")
public static function getTrackUiVolPan(track: MediaTrack): Bool;
/** No description available */
@:native("GetTrackUIPan")
public static function getTrackUiPan(track: MediaTrack): Bool;
/** No description available */
@:native("GetTrackUIMute")
public static function getTrackUiMute(track: MediaTrack): Bool;
/**
 * Gets the RPPXML state of a track, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("GetTrackStateChunk")
public static function getTrackStateChunk(track: MediaTrack, str: String, ?isundo: Bool): Bool;
/**
 * &1024=hide from MCP
 */
@:native("GetTrackState")
public static function getTrackState(track: MediaTrack): String;
/**
 * send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See
 * GetTrackReceiveUIVolPan.
 */
@:native("GetTrackSendUIVolPan")
public static function getTrackSendUiVolPan(track: MediaTrack, sendIndeX: Int): Bool;
/**
 * send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See
 * GetTrackReceiveUIMute.
 */
@:native("GetTrackSendUIMute")
public static function getTrackSendUiMute(track: MediaTrack, sendIndeX: Int): Bool;
/**
 * send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See
 * GetTrackReceiveName.
 */
@:native("GetTrackSendName")
public static function getTrackSendName(track: MediaTrack, sendIndeX: Int): Bool;
/**
 * See CreateTrackSend, RemoveTrackSend, GetTrackNumSends.
 */
@:native("GetTrackSendInfo_Value")
public static function getTrackSendInfoValue(tr: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String): Float;
/**
 * See GetTrackSendUIVolPan.
 */
@:native("GetTrackReceiveUIVolPan")
public static function getTrackReceiveUiVolPan(track: MediaTrack, recvIndeX: Int): Bool;
/**
 * See GetTrackSendUIMute.
 */
@:native("GetTrackReceiveUIMute")
public static function getTrackReceiveUiMute(track: MediaTrack, recvIndeX: Int): Bool;
/**
 * See GetTrackSendName.
 */
@:native("GetTrackReceiveName")
public static function getTrackReceiveName(track: MediaTrack, recvIndeX: Int): Bool;
/**
 * returns number of sends/receives/hardware outputs - category is <0 for
 * receives, 0=sends, >0 for hardware outputs
 */
@:native("GetTrackNumSends")
public static function getTrackNumSends(tr: MediaTrack, categorY: Int): Int;
/** No description available */
@:native("GetTrackNumMediaItems")
public static function getTrackNumMediaItems(tr: MediaTrack): Int;
/**
 * Returns "MASTER" for master track, "Track N" if track has no name.
 */
@:native("GetTrackName")
public static function getTrackName(track: MediaTrack): Bool;
/** No description available */
@:native("GetTrackMIDINoteRange")
public static function getTrackMidiNoteRange(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack): Int;
/**
 * Get note/CC name. pitch 128 for CC0 name, 129 for CC1 name, etc. See
 * SetTrackMIDINoteNameEx
 */
@:native("GetTrackMIDINoteNameEx")
public static function getTrackMidiNoteNameEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack, pitcH: Int, cHan: Int): String;
/**
 * see GetTrackMIDINoteNameEx
 */
@:native("GetTrackMIDINoteName")
public static function getTrackMidiNoteName(track: Int, pitcH: Int, cHan: Int): String;
/**
 * Get all MIDI lyrics on the track. Lyrics will be returned as one string with
 * tabs between each word. flag&1: double tabs at the end of each measure and
 * triple tabs when skipping measures, flag&2: each lyric is preceded by its
 * beat position in the project (example with flag=2: "1.1.2\tLyric for measure
 * 1 beat 2\t2.1.1\tLyric for measure 2 beat 1	"). See SetTrackMIDILyrics
 */
@:native("GetTrackMIDILyrics")
public static function getTrackMidiLyrics(track: MediaTrack, flag: Int): Bool;
/** No description available */
@:native("GetTrackMediaItem")
public static function getTrackMediaItem(tr: MediaTrack, itemIdX: Int): MediaItem;
/** No description available */
@:native("GetTrackGUID")
public static function getTrackGuid(tr: MediaTrack): String;
/**
 * Returns the track from the screen coordinates specified. If the screen
 * coordinates refer to a window associated to the track (such as FX), the track
 * will be returned. infoOutOptional will be set to 1 if it is likely an
 * envelope, 2 if it is likely a track FX. For a free item positioning or fixed
 * lane track, the second byte of infoOutOptional will be set to the
 * (approximate, for fipm tracks) item lane underneath the mouse. See
 * GetThingFromPoint.
 */
@:native("GetTrackFromPoint")
public static function getTrackFromPoint(screenX: Int, screenY: Int): MediaTrack;
/** No description available */
@:native("GetTrackEnvelopeByName")
public static function getTrackEnvelopeByName(track: MediaTrack, envName: String): TrackEnvelope;
/**
 * Gets a built-in track envelope by configuration chunk name, like "<VOLENV",
 * or GUID string, like "{B577250D-146F-B544-9B34-F24FBE488F1F}".
 */
@:native("GetTrackEnvelopeByChunkName")
public static function getTrackEnvelopeByChunkName(tr: MediaTrack, cfgcHunkNameOrGuId: String): TrackEnvelope;
/** No description available */
@:native("GetTrackEnvelope")
public static function getTrackEnvelope(track: MediaTrack, envIdX: Int): TrackEnvelope;
/** No description available */
@:native("GetTrackDepth")
public static function getTrackDepth(track: MediaTrack): Int;
/**
 * Returns the track custom color as OS dependent color|0x1000000 (i.e.
 * ColorToNative(r,g,b)|0x1000000). Black is returned as 0x1000000, no color
 * setting is returned as 0.
 */
@:native("GetTrackColor")
public static function getTrackColor(track: MediaTrack): Int;
/**
 * return the track mode, regardless of global override
 */
@:native("GetTrackAutomationMode")
public static function getTrackAutomationMode(tr: MediaTrack): Int;
/**
 * get a track from a project by track count (zero-based) (proj=0 for active
 * project)
 */
@:native("GetTrack")
public static function getTrack(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, trackIdX: Int): MediaTrack;
/**
 * mode can be 0 to query last touched parameter, or 1 to query currently
 * focused FX. Returns false if failed. If successful, trackIdxOut will be track
 * index (-1 is master track, 0 is first track). itemidxOut will be 0-based item
 * index if an item, or -1 if not an item. takeidxOut will be 0-based take
 * index. fxidxOut will be FX index, potentially with 0x2000000 set to signify
 * container-addressing, or with 0x1000000 set to signify record-input FX.
 * parmOut will be set to the parameter index if querying last-touched. parmOut
 * will have 1 set if querying focused state and FX is no longer focused but
 * still open.
 */
@:native("GetTouchedOrFocusedFX")
public static function getTouchedOrFocusedFx(mode: Int): Bool;
/**
 * gets a tooltip window,in case you want to ask it for font information. Can
 * return NULL.
 */
@:native("GetTooltipWindow")
public static function getTooltipWindow(): Hwnd;
/**
 * For the main action context, the MIDI editor, or the media explorer, returns
 * the toggle state of the action. 0=off, 1=on, -1=NA because the action does
 * not have on/off states. For the MIDI editor, the action state for the most
 * recently focused window will be returned.
 */
@:native("GetToggleCommandStateEx")
public static function getToggleCommandStateEx(sectionId: Int, commandId: Int): Int;
/**
 * See GetToggleCommandStateEx.
 */
@:native("GetToggleCommandState")
public static function getToggleCommandState(commandId: Int): Int;
/**
 * Hit tests a point in screen coordinates. Updates infoOut with information
 * such as "arrange", "fx_chain", "fx_0" (first FX in chain, floating),
 * "spacer_0" (spacer before first track). If a track panel is hit, string will
 * begin with "tcp" or "mcp" or "tcp.mute" etc (future versions may append
 * additional information). May return NULL with valid info string to indicate
 * non-track thing.
 */
@:native("GetThingFromPoint")
public static function getThingFromPoint(screenX: Int, screenY: Int): MediaTrack;
/**
 * Returns the theme color specified, or -1 on failure. If the low bit of flags
 * is set, the color as originally specified by the theme (before any
 * transformations) is returned, otherwise the current (possibly transformed and
 * modified) color is returned. See SetThemeColor for a list of valid ini_key.
 */
@:native("GetThemeColor")
public static function getThemeColor(iniKeY: String, ?flags: Int): Int;
/**
 * Get information about a tempo/time signature marker. See
 * CountTempoTimeSigMarkers, SetTempoTimeSigMarker, AddTempoTimeSigMarker.
 */
@:native("GetTempoTimeSigMarker")
public static function getTempoTimeSigMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, ptIdX: Int): Bool;
/**
 * finds the playrate and target length to insert this item stretched to a round
 * power-of-2 number of bars, between 1/8 and 256
 */
@:native("GetTempoMatchPlayRate")
public static function getTempoMatchPlayRate(source: PcmSource, srcscale: Float, position: Float, mult: Float): Bool;
/**
 * Get information about a specific FX parameter knob (see CountTCPFXParms).
 */
@:native("GetTCPFXParm")
public static function getTcpfxParm(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack, indeX: Int): Bool;
/**
 * See SetTakeStretchMarkerSlope
 */
@:native("GetTakeStretchMarkerSlope")
public static function getTakeStretchMarkerSlope(take: MediaItemTake, idX: Int): Float;
/**
 * Gets information on a stretch marker, idx is 0..n. Returns -1 if stretch
 * marker not valid. posOut will be set to position in item, srcposOutOptional
 * will be set to source media position. Returns index. if input index is -1,
 * the following marker is found using position (or source position if position
 * is -1). If position/source position are used to find marker position, their
 * values are not updated.
 */
@:native("GetTakeStretchMarker")
public static function getTakeStretchMarker(take: MediaItemTake, idX: Int): Int;
/**
 * Returns number of stretch markers in take
 */
@:native("GetTakeNumStretchMarkers")
public static function getTakeNumStretchMarkers(take: MediaItemTake): Int;
/**
 * returns NULL if the take is not valid
 */
@:native("GetTakeName")
public static function getTakeName(take: MediaItemTake): String;
/**
 * Get information about a take marker. Returns the position in media item
 * source time, or -1 if the take marker does not exist. See GetNumTakeMarkers,
 * SetTakeMarker, DeleteTakeMarker
 */
@:native("GetTakeMarker")
public static function getTakeMarker(take: MediaItemTake, idX: Int): Float;
/** No description available */
@:native("GetTakeEnvelopeByName")
public static function getTakeEnvelopeByName(take: MediaItemTake, envName: String): TrackEnvelope;
/** No description available */
@:native("GetTakeEnvelope")
public static function getTakeEnvelope(take: MediaItemTake, envIdX: Int): TrackEnvelope;
/**
 * get a take from an item by take count (zero-based)
 */
@:native("GetTake")
public static function getTake(item: MediaItem, takeIdX: Int): MediaItemTake;
/** No description available */
@:native("GetSubProjectFromSource")
public static function getSubProjectFromSource(src: PcmSource): Dynamic;
/**
 * deprecated -- see SetTrackStateChunk, GetTrackStateChunk
 */
@:native("GetSetTrackState2")
public static function getSetTrackState2(track: MediaTrack, str: String, isundo: Bool): Bool;
/**
 * deprecated -- see SetTrackStateChunk, GetTrackStateChunk
 */
@:native("GetSetTrackState")
public static function getSetTrackState(track: MediaTrack, str: String): Bool;
/**
 * P_EXT:xyz : char * : extension-specific persistent data
 */
@:native("GetSetTrackSendInfo_String")
public static function getSetTrackSendInfoString(tr: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * Note: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and
 * _FOLLOW, which is deprecated but still supported (scripts that must support
 * v6.11 and earlier can use the deprecated strings).
 */
@:native("GetSetTrackGroupMembershipHigh")
public static function getSetTrackGroupMembershipHigh(tr: MediaTrack, groupName: String, setmask: Int, setvalue: Int): Int;
/**
 * Note: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and
 * _FOLLOW, which is deprecated but still supported (scripts that must support
 * v6.11 and earlier can use the deprecated strings).
 */
@:native("GetSetTrackGroupMembershipEx")
public static function getSetTrackGroupMembershipEx(tr: MediaTrack, groupName: String, offSet: Int, setmask: Int, setvalue: Int): Int;
/**
 * Note: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and
 * _FOLLOW, which is deprecated but still supported (scripts that must support
 * v6.11 and earlier can use the deprecated strings).
 */
@:native("GetSetTrackGroupMembership")
public static function getSetTrackGroupMembership(tr: MediaTrack, groupName: String, setmask: Int, setvalue: Int): Int;
/**
 * Gets or sets the attribute flag of a tempo/time signature marker. flag
 * &1=sets time signature and starts new measure, &2=does not set tempo,
 * &4=allow previous partial measure if starting new measure, &8=set new
 * metronome pattern if starting new measure, &16=reset ruler grid if starting
 * new measure
 */
@:native("GetSetTempoTimeSigMarkerFlag")
public static function getSetTempoTimeSigMarkerFlag(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, pointIndeX: Int, flag: Int, isSet: Bool): Int;
/**
 * -1 == query,0=clear,1=set,>1=toggle . returns new value
 */
@:native("GetSetRepeatEx")
public static function getSetRepeatEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, val: Int): Int;
/**
 * -1 == query,0=clear,1=set,>1=toggle . returns new value
 */
@:native("GetSetRepeat")
public static function getSetRepeat(val: Int): Int;
/**
 * gets or sets project notes, notesNeedBig_sz is ignored when setting
 */
@:native("GetSetProjectNotes")
public static function getSetProjectNotes(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, set: Bool, notes: String): String;
/**
 * <code>"wave" "aiff" "caff" "raw " "iso " "ddp " "flac" "mp3l" "oggv" "OggS"
 * "FFMP" "WMF " "GIF " "LCF " "wvpk" </code>
 */
@:native("GetSetProjectInfo_String")
public static function getSetProjectInfoString(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, desc: String, valuestrNeedBig: String, isSet: Bool): Bool;
/**
 * PROJECT_SRATE_USE : set to 1 if project sample rate is used
 */
@:native("GetSetProjectInfo")
public static function getSetProjectInfo(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, desc: String, value: Float, isSet: Bool): Float;
/**
 * Get or set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half
 * note triplet, etc. swingmode can be 1 for swing enabled, swingamt is -1..1.
 * swingmode can be 3 for measure-grid. Returns grid configuration flags
 */
@:native("GetSetProjectGrid")
public static function getSetProjectGrid(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, set: Bool, ?division: Float, ?sWingmode: Int, ?sWingamt: Float): Int;
/**
 * deprecated, see GetSetProjectInfo_String with desc="PROJECT_AUTHOR"
 */
@:native("GetSetProjectAuthor")
public static function getSetProjectAuthor(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, set: Bool, autHor: String): String;
/**
 * GUID : GUID * : 16-byte GUID, can query or update. If using a _String()
 * function, GUID is a string {xyz-...}.
 */
@:native("GetSetMediaTrackInfo_String")
public static function getSetMediaTrackInfoString(tr: MediaTrack, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * GUID : GUID * : 16-byte GUID, can query or update. If using a _String()
 * function, GUID is a string {xyz-...}.
 */
@:native("GetSetMediaItemTakeInfo_String")
public static function getSetMediaItemTakeInfoString(tk: MediaItemTake, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * GUID : GUID * : 16-byte GUID, can query or update. If using a _String()
 * function, GUID is a string {xyz-...}.
 */
@:native("GetSetMediaItemInfo_String")
public static function getSetMediaItemInfoString(item: MediaItem, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * deprecated -- see SetItemStateChunk, GetItemStateChunk
 */
@:native("GetSetItemState2")
public static function getSetItemState2(item: MediaItem, str: String, isundo: Bool): Bool;
/**
 * deprecated -- see SetItemStateChunk, GetItemStateChunk
 */
@:native("GetSetItemState")
public static function getSetItemState(item: MediaItem, str: String): Bool;
/**
 * deprecated -- see SetEnvelopeStateChunk, GetEnvelopeStateChunk
 */
@:native("GetSetEnvelopeState2")
public static function getSetEnvelopeState2(env: TrackEnvelope, str: String, isundo: Bool): Bool;
/**
 * deprecated -- see SetEnvelopeStateChunk, GetEnvelopeStateChunk
 */
@:native("GetSetEnvelopeState")
public static function getSetEnvelopeState(env: TrackEnvelope, str: String): Bool;
/**
 * Note that when writing some of these attributes you will need to manually
 * update the arrange and/or track panels, see TrackList_AdjustWindows
 */
@:native("GetSetEnvelopeInfo_String")
public static function getSetEnvelopeInfoString(env: TrackEnvelope, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * P_POOL_EXT:xyz : char * : extension-specific persistent data
 */
@:native("GetSetAutomationItemInfo_String")
public static function getSetAutomationItemInfoString(env: TrackEnvelope, autoitemIdX: Int, desc: String, valuestrNeedBig: String, isSet: Bool): Bool;
/**
 * D_POOL_QNLEN : double * : automation item pooled source length in quarter
 * notes (setting will affect all pooled instances)
 */
@:native("GetSetAutomationItemInfo")
public static function getSetAutomationItemInfo(env: TrackEnvelope, autoitemIdX: Int, desc: String, value: Float, isSet: Bool): Float;
/** No description available */
@:native("GetSet_LoopTimeRange2")
public static function getSetLoopTimeRange2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, isSet: Bool, isLoop: Bool, start: Float, end: Float, alloWautoseek: Bool): Float;
/** No description available */
@:native("GetSet_LoopTimeRange")
public static function getSetLoopTimeRange(isSet: Bool, isLoop: Bool, start: Float, end: Float, alloWautoseek: Bool): Float;
/**
 * Gets or sets the arrange view start/end time for screen coordinates. use
 * screen_x_start=screen_x_end=0 to use the full arrange view's start/end time
 */
@:native("GetSet_ArrangeView2")
public static function getSetArrangeView2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, isSet: Bool, screenXStart: Int, screenXEnd: Int, ?startTime: Float, ?endTime: Float): Float;
/**
 * get the currently selected track envelope, returns NULL/nil if no envelope is
 * selected
 */
@:native("GetSelectedTrackEnvelope")
public static function getSelectedTrackEnvelope(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): TrackEnvelope;
/**
 * Get a selected track from a project (proj=0 for active project) by selected
 * track count (zero-based).
 */
@:native("GetSelectedTrack2")
public static function getSelectedTrack2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, seltrackIdX: Int, wantMaster: Bool): MediaTrack;
/**
 * Get a selected track from a project (proj=0 for active project) by selected
 * track count (zero-based). This function ignores the master track, see
 * GetSelectedTrack2.
 */
@:native("GetSelectedTrack")
public static function getSelectedTrack(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, seltrackIdX: Int): MediaTrack;
/**
 * Discouraged, because GetSelectedMediaItem can be inefficient if media items
 * are added, rearranged, or deleted in between calls. Instead see
 * CountMediaItems, GetMediaItem, IsMediaItemSelected.
 */
@:native("GetSelectedMediaItem")
public static function getSelectedMediaItem(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, selitem: Int): MediaItem;
/**
 * get the currently selected envelope, returns NULL/nil if no envelope is
 * selected
 */
@:native("GetSelectedEnvelope")
public static function getSelectedEnvelope(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): TrackEnvelope;
/**
 * returns path where ini files are stored, other things are in subdirectories.
 */
@:native("GetResourcePath")
public static function getResourcePath(): String;
/**
 * Get the value previously associated with this extname and key, the last time
 * the project was saved. See SetProjExtState, EnumProjExtState.
 */
@:native("GetProjExtState")
public static function getProjExtState(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, eXtName: String, keY: String): Int;
/**
 * this does not reflect tempo envelopes but is purely what is set in the
 * project settings.
 */
@:native("GetProjectTimeSignature2")
public static function getProjectTimeSignature2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * deprecated
 */
@:native("GetProjectTimeSignature")
public static function getProjectTimeSignature(): Float;
/**
 * Gets project time offset in seconds (project settings - project start time).
 * If rndframe is true, the offset is rounded to a multiple of the project frame
 * size.
 */
@:native("GetProjectTimeOffset")
public static function getProjectTimeOffset(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, rndframe: Bool): Float;
/**
 * returns an integer that changes when the project state changes
 */
@:native("GetProjectStateChangeCount")
public static function getProjectStateChangeCount(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * Get the project recording path.
 */
@:native("GetProjectPathEx")
public static function getProjectPathEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): String;
/**
 * Get the project recording path.
 */
@:native("GetProjectPath")
public static function getProjectPath(): String;
/** No description available */
@:native("GetProjectName")
public static function getProjectName(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): String;
/**
 * returns length of project (maximum of end of media item, markers, end of
 * regions, tempo map
 */
@:native("GetProjectLength")
public static function getProjectLength(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * &1=playing, &2=paused, &4=is recording
 */
@:native("GetPlayStateEx")
public static function getPlayStateEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * &1=playing, &2=paused, &4=is recording
 */
@:native("GetPlayState")
public static function getPlayState(): Int;
/**
 * returns latency-compensated actual-what-you-hear position
 */
@:native("GetPlayPositionEx")
public static function getPlayPositionEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * returns position of next audio block being processed
 */
@:native("GetPlayPosition2Ex")
public static function getPlayPosition2Ex(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * returns position of next audio block being processed
 */
@:native("GetPlayPosition2")
public static function getPlayPosition2(): Float;
/**
 * returns latency-compensated actual-what-you-hear position
 */
@:native("GetPlayPosition")
public static function getPlayPosition(): Float;
/**
 * Like GetPeakFileNameEx, but you can specify peaksfileextension such as
 * ".reapeaks"
 */
@:native("GetPeakFileNameEx2")
public static function getPeakFileNameEx2(fn: String, buf: String, forWrite: Bool, peaksfileeXtension: String): String;
/**
 * get the peak file name for a given file (can be either filename.reapeaks,or a
 * hashed filename in another path)
 */
@:native("GetPeakFileNameEx")
public static function getPeakFileNameEx(fn: String, buf: String, forWrite: Bool): String;
/**
 * get the peak file name for a given file (can be either filename.reapeaks,or a
 * hashed filename in another path)
 */
@:native("GetPeakFileName")
public static function getPeakFileName(fn: String): String;
/** No description available */
@:native("GetParentTrack")
public static function getParentTrack(track: MediaTrack): MediaTrack;
/**
 * returns output latency in seconds
 */
@:native("GetOutputLatency")
public static function getOutputLatency(): Float;
/** No description available */
@:native("GetOutputChannelName")
public static function getOutputChannelName(cHannelIndeX: Int): String;
/**
 * Returns "Win32", "Win64", "OSX32", "OSX64", "macOS-arm64", or "Other".
 */
@:native("GetOS")
public static function getOs(): String;
/**
 * Returns number of tracks in current project, see CountTracks()
 */
@:native("GetNumTracks")
public static function getNumTracks(): Int;
/**
 * Returns number of take markers. See GetTakeMarker, SetTakeMarker,
 * DeleteTakeMarker
 */
@:native("GetNumTakeMarkers")
public static function getNumTakeMarkers(take: MediaItemTake): Int;
/**
 * returns max number of real midi hardware outputs
 */
@:native("GetNumMIDIOutputs")
public static function getNumMidiOutputs(): Int;
/**
 * returns max number of real midi hardware inputs
 */
@:native("GetNumMIDIInputs")
public static function getNumMidiInputs(): Int;
/**
 * Return number of normal audio hardware outputs available
 */
@:native("GetNumAudioOutputs")
public static function getNumAudioOutputs(): Int;
/**
 * Return number of normal audio hardware inputs available
 */
@:native("GetNumAudioInputs")
public static function getNumAudioInputs(): Int;
/**
 * get mouse position in screen coordinates
 */
@:native("GetMousePosition")
public static function getMousePosition(): Int;
/**
 * See SetMouseModifier for more information.
 */
@:native("GetMouseModifier")
public static function getMouseModifier(conteXt: String, modifierFlag: Int): String;
/**
 * Get the leftmost track visible in the mixer
 */
@:native("GetMixerScroll")
public static function getMixerScroll(): MediaTrack;
/**
 * returns true if device present
 */
@:native("GetMIDIOutputName")
public static function getMidiOutputName(dev: Int, nameout: String): Bool;
/**
 * returns true if device present
 */
@:native("GetMIDIInputName")
public static function getMidiInputName(dev: Int, nameout: String): Bool;
/**
 * P_PROJECT : ReaProject * : parent project (read-only)
 */
@:native("GetMediaTrackInfo_Value")
public static function getMediaTrackInfoValue(tr: MediaTrack, pArmName: String): Float;
/**
 * copies the media source type ("WAV", "MIDI", etc) to typebuf
 */
@:native("GetMediaSourceType")
public static function getMediaSourceType(source: PcmSource): String;
/**
 * Returns the sample rate. MIDI source media will return zero.
 */
@:native("GetMediaSourceSampleRate")
public static function getMediaSourceSampleRate(source: PcmSource): Int;
/**
 * Returns the parent source, or NULL if src is the root source. This can be
 * used to retrieve the parent properties of sections or reversed sources for
 * example.
 */
@:native("GetMediaSourceParent")
public static function getMediaSourceParent(src: PcmSource): PcmSource;
/**
 * Returns the number of channels in the source media.
 */
@:native("GetMediaSourceNumChannels")
public static function getMediaSourceNumChannels(source: PcmSource): Int;
/**
 * Returns the length of the source media. If the media source is beat-based,
 * the length will be in quarter notes, otherwise it will be in seconds.
 */
@:native("GetMediaSourceLength")
public static function getMediaSourceLength(source: PcmSource): Float;
/**
 * Copies the media source filename to filenamebuf. Note that in-project MIDI
 * media sources have no associated filename. See GetMediaSourceParent.
 */
@:native("GetMediaSourceFileName")
public static function getMediaSourceFileName(source: PcmSource): String;
/** No description available */
@:native("GetMediaItemTrack")
public static function getMediaItemTrack(item: MediaItem): MediaTrack;
/**
 * P_SOURCE : PCM_source *. Note that if setting this, you should first retrieve
 * the old source, set the new, THEN delete the old.
 */
@:native("GetMediaItemTakeInfo_Value")
public static function getMediaItemTakeInfoValue(take: MediaItemTake, pArmName: String): Float;
/** No description available */
@:native("GetMediaItemTakeByGUID")
public static function getMediaItemTakeByGuid(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, guIdGuId: String): MediaItemTake;
/**
 * Get parent track of media item take
 */
@:native("GetMediaItemTake_Track")
public static function getMediaItemTakeTrack(take: MediaItemTake): MediaTrack;
/**
 * Get media source of media item take
 */
@:native("GetMediaItemTake_Source")
public static function getMediaItemTakeSource(take: MediaItemTake): PcmSource;
/**
 * Gets block of peak samples to buf. Note that the peak samples are
 * interleaved, but in two or three blocks (maximums, then minimums, then
 * extra). Return value has 20 bits of returned sample count, then 4 bits of
 * output_mode (0xf00000), then a bit to signify whether extra_type was
 * available (0x1000000). extra_type can be 115 ('s') for spectral information,
 * which will return peak samples as integers with the low 15 bits frequency,
 * next 14 bits tonality.
 */
@:native("GetMediaItemTake_Peaks")
public static function getMediaItemTakePeaks(take: MediaItemTake, peakRate: Float, startTime: Float, numcHannels: Int, numsamplespercHannel: Int, wantEXtraTYpe: Int, buf: ReaperArray): Int;
/**
 * Get parent item of media item take
 */
@:native("GetMediaItemTake_Item")
public static function getMediaItemTakeItem(take: MediaItemTake): MediaItem;
/** No description available */
@:native("GetMediaItemTake")
public static function getMediaItemTake(item: MediaItem, tk: Int): MediaItemTake;
/** No description available */
@:native("GetMediaItemNumTakes")
public static function getMediaItemNumTakes(item: MediaItem): Int;
/**
 * P_TRACK : MediaTrack * : (read-only)
 */
@:native("GetMediaItemInfo_Value")
public static function getMediaItemInfoValue(item: MediaItem, pArmName: String): Float;
/**
 * get an item from a project by item count (zero-based) (proj=0 for active
 * project)
 */
@:native("GetMediaItem")
public static function getMediaItem(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, itemIdX: Int): MediaItem;
/**
 * Get text-based metadata from a media file for a given identifier. Call with
 * identifier="" to list all identifiers contained in the file, separated by
 * newlines. May return "[Binary data]" for metadata that REAPER doesn't handle.
 */
@:native("GetMediaFileMetadata")
public static function getMediaFileMetadata(mediaSource: PcmSource, identifier: String): Int;
/** No description available */
@:native("GetMaxMidiOutputs")
public static function getMaxMidiOutputs(): Int;
/**
 * returns max dev for midi inputs/outputs
 */
@:native("GetMaxMidiInputs")
public static function getMaxMidiInputs(): Int;
/**
 * returns &1 if the master track is visible in the TCP, &2 if NOT visible in
 * the mixer. See SetMasterTrackVisibility.
 */
@:native("GetMasterTrackVisibility")
public static function getMasterTrackVisibility(): Int;
/** No description available */
@:native("GetMasterTrack")
public static function getMasterTrack(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): MediaTrack;
/**
 * &1=master mute,&2=master solo. This is deprecated as you can just query the
 * master track as well.
 */
@:native("GetMasterMuteSoloFlags")
public static function getMasterMuteSoloFlags(): Int;
/** No description available */
@:native("GetMainHwnd")
public static function getMainHwnd(): Hwnd;
/** No description available */
@:native("GetLastTouchedTrack")
public static function getLastTouchedTrack(): MediaTrack;
/**
 * Returns true if the last touched FX parameter is valid, false otherwise. The
 * low word of tracknumber is the 1-based track index -- 0 means the master
 * track, 1 means track 1, etc. If the high word of tracknumber is nonzero, it
 * refers to the 1-based item index (1 is the first item on the track, etc). For
 * track FX, the low 24 bits of fxnumber refer to the FX index in the chain, and
 * if the next 8 bits are 01, then the FX is record FX. For item FX, the low
 * word defines the FX index in the chain, and the high word defines the take
 * number. Deprecated, see GetTouchedOrFocusedFX.
 */
@:native("GetLastTouchedFX")
public static function getLastTouchedFx(): Bool;
/**
 * Get the last project marker before time, and/or the project region that
 * includes time. markeridx and regionidx are returned not necessarily as the
 * displayed marker/region index, but as the index that can be passed to
 * EnumProjectMarkers. Either or both of markeridx and regionidx may be NULL.
 * See EnumProjectMarkers.
 */
@:native("GetLastMarkerAndCurRegion")
public static function getLastMarkerAndCurRegion(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float): Int;
/** No description available */
@:native("GetLastColorThemeFile")
public static function getLastColorThemeFile(): String;
/**
 * Gets the RPPXML state of an item, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("GetItemStateChunk")
public static function getItemStateChunk(item: MediaItem, str: String, ?isundo: Bool): Bool;
/** No description available */
@:native("GetItemProjectContext")
public static function getItemProjectContext(item: MediaItem): Dynamic;
/**
 * Returns the first item at the screen coordinates specified. If allow_locked
 * is false, locked items are ignored. If takeOutOptional specified, returns the
 * take hit. See GetThingFromPoint.
 */
@:native("GetItemFromPoint")
public static function getItemFromPoint(screenX: Int, screenY: Int, alloWLocked: Bool): MediaItem;
/**
 * returns time of relevant edit, set which_item to the pcm_source (if
 * applicable), flags (if specified) will be set to 1 for edge resizing, 2 for
 * fade change, 4 for item move, 8 for item slip edit (edit cursor time or start
 * of item)
 */
@:native("GetItemEditingTime2")
public static function getItemEditingTime2(): PcmSource;
/**
 * Gets the audio device input/output latency in samples
 */
@:native("GetInputOutputLatency")
public static function getInputOutputLatency(): Int;
/** No description available */
@:native("GetInputChannelName")
public static function getInputChannelName(cHannelIndeX: Int): String;
/**
 * returns approximate input level if available, 0-511 mono inputs, |1024 for
 * stereo pairs, 4096+devidx*32 for MIDI devices
 */
@:native("GetInputActivityLevel")
public static function getInputActivityLevel(inputId: Int): Float;
/**
 * returns pixels/second
 */
@:native("GetHZoomLevel")
public static function getHzoomLevel(): Float;
/**
 * return -1=no override, 0=trim/read, 1=read, 2=touch, 3=write, 4=latch,
 * 5=bypass
 */
@:native("GetGlobalAutomationOverride")
public static function getGlobalAutomationOverride(): Int;
/**
 * Returns the FX parameter envelope. If the envelope does not exist and
 * create=true, the envelope will be created. If the envelope already exists and
 * is bypassed and create=true, then the envelope will be unbypassed.
 */
@:native("GetFXEnvelope")
public static function getFxEnvelope(track: MediaTrack, fXindeX: Int, parameterindeX: Int, create: Bool): TrackEnvelope;
/**
 * returns free disk space in megabytes, pathIdx 0 for normal, 1 for alternate.
 */
@:native("GetFreeDiskSpaceForRecordPath")
public static function getFreeDiskSpaceForRecordPath(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, patHIdX: Int): Int;
/**
 * Return value has 1 set if track FX, 2 if take/item FX, 4 set if FX is no
 * longer focused but still open. tracknumber==0 means the master track, 1 means
 * track 1, etc. itemnumber is zero-based (or -1 if not an item). For
 * interpretation of fxnumber, see GetLastTouchedFX. Deprecated, see
 * GetTouchedOrFocusedFX
 */
@:native("GetFocusedFX2")
public static function getFocusedFx2(): Int;
/**
 * This function is deprecated (returns GetFocusedFX2()&3), see
 * GetTouchedOrFocusedFX.
 */
@:native("GetFocusedFX")
public static function getFocusedFx(): Int;
/**
 * Get the extended state value for a specific section and key. See SetExtState,
 * DeleteExtState, HasExtState.
 */
@:native("GetExtState")
public static function getExtState(section: String, keY: String): String;
/**
 * returns path of REAPER.exe (not including EXE), i.e. C:\Program Files\REAPER
 */
@:native("GetExePath")
public static function getExePath(): String;
/**
 * gets information on the UI state of an envelope: returns &1 if
 * automation/modulation is playing back, &2 if automation is being actively
 * written, &4 if the envelope recently had an effective automation mode change
 */
@:native("GetEnvelopeUIState")
public static function getEnvelopeUiState(env: TrackEnvelope): Int;
/**
 * Gets the RPPXML state of an envelope, returns true if successful. Undo flag
 * is a performance/caching hint.
 */
@:native("GetEnvelopeStateChunk")
public static function getEnvelopeStateChunk(env: TrackEnvelope, str: String, ?isundo: Bool): Bool;
/**
 * Returns the envelope scaling mode: 0=no scaling, 1=fader scaling. All API
 * functions deal with raw envelope point values, to convert raw from/to scaled
 * values see ScaleFromEnvelopeMode, ScaleToEnvelopeMode.
 */
@:native("GetEnvelopeScalingMode")
public static function getEnvelopeScalingMode(env: TrackEnvelope): Int;
/**
 * See CountEnvelopePointsEx, SetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("GetEnvelopePointEx")
public static function getEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, ptIdX: Int): Bool;
/**
 * See GetEnvelopePointEx, SetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("GetEnvelopePointByTimeEx")
public static function getEnvelopePointByTimeEx(envelope: TrackEnvelope, autoitemIdX: Int, time: Float): Int;
/**
 * Returns the envelope point at or immediately prior to the given time
 * position. See GetEnvelopePointByTimeEx.
 */
@:native("GetEnvelopePointByTime")
public static function getEnvelopePointByTime(envelope: TrackEnvelope, time: Float): Int;
/**
 * Get the attributes of an envelope point. See GetEnvelopePointEx.
 */
@:native("GetEnvelopePoint")
public static function getEnvelopePoint(envelope: TrackEnvelope, ptIdX: Int): Bool;
/** No description available */
@:native("GetEnvelopeName")
public static function getEnvelopeName(env: TrackEnvelope): Bool;
/**
 * I_RECV_IDX : int : 1-based index of receive in P_DESTTRACK or 0 if not a
 * send/receive
 */
@:native("GetEnvelopeInfo_Value")
public static function getEnvelopeInfoValue(env: TrackEnvelope, pArmName: String): Float;
/**
 * Returns the custom take, item, or track color that is used (according to the
 * user preference) to color the media item. The returned color is OS
 * dependent|0x01000000 (i.e. ColorToNative(r,g,b)|0x01000000), so a return of
 * zero means "no color", not black.
 */
@:native("GetDisplayedMediaItemColor2")
public static function getDisplayedMediaItemColor2(item: MediaItem, take: MediaItemTake): Int;
/**
 * see GetDisplayedMediaItemColor2.
 */
@:native("GetDisplayedMediaItemColor")
public static function getDisplayedMediaItemColor(item: MediaItem): Int;
/**
 * edit cursor position
 */
@:native("GetCursorPositionEx")
public static function getCursorPositionEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Float;
/**
 * edit cursor position
 */
@:native("GetCursorPosition")
public static function getCursorPosition(): Float;
/**
 * 0 if track panels, 1 if items, 2 if envelopes, otherwise unknown (unlikely
 * when want_last_valid is true)
 */
@:native("GetCursorContext2")
public static function getCursorContext2(wantLastValId: Bool): Int;
/**
 * return the current cursor context: 0 if track panels, 1 if items, 2 if
 * envelopes, otherwise unknown
 */
@:native("GetCursorContext")
public static function getCursorContext(): Int;
/**
 * returns current project if in load/save (usually only used from
 * project_config_extension_t)
 */
@:native("GetCurrentProjectInLoadSave")
public static function getCurrentProjectInLoadSave(): Dynamic;
/**
 * gets the dock ID desired by ident_str, if any
 */
@:native("GetConfigWantsDock")
public static function getConfigWantsDock(identStr: String): Int;
/**
 * get information about the currently open audio device. attribute can be MODE,
 * IDENT_IN, IDENT_OUT, BSIZE, SRATE, BPS. returns false if unknown attribute or
 * device not open.
 */
@:native("GetAudioDeviceInfo")
public static function getAudioDeviceInfo(attribute: String): Bool;
/**
 * Get the start time of the audio that can be returned from this accessor. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("GetAudioAccessorStartTime")
public static function getAudioAccessorStartTime(accessor: AudioAccessor): Float;
/**
 * </code>
 */
@:native("GetAudioAccessorSamples")
public static function getAudioAccessorSamples(accessor: AudioAccessor, sampleRate: Int, numcHannels: Int, startTimeSec: Float, numsamplespercHannel: Int, samplebuffer: ReaperArray): Int;
/**
 * Deprecated. See AudioAccessorStateChanged instead.
 */
@:native("GetAudioAccessorHash")
public static function getAudioAccessorHash(accessor: AudioAccessor, hashNeed128: String): String;
/**
 * Get the end time of the audio that can be returned from this accessor. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorSamples.
 */
@:native("GetAudioAccessorEndTime")
public static function getAudioAccessorEndTime(accessor: AudioAccessor): Float;
/**
 * gets the currently armed command and section name (returns 0 if nothing
 * armed). section name is empty-string for main section.
 */
@:native("GetArmedCommand")
public static function getArmedCommand(): Int;
/**
 * Returns app version which may include an OS/arch signifier, such as: "6.17"
 * (windows 32-bit), "6.17/x64" (windows 64-bit), "6.17/OSX64" (macOS 64-bit
 * Intel), "6.17/OSX" (macOS 32-bit), "6.17/macOS-arm64", "6.17/linux-x86_64",
 * "6.17/linux-i686", "6.17/linux-aarch64", "6.17/linux-armv7l", etc
 */
@:native("GetAppVersion")
public static function getAppVersion(): String;
/**
 * returns the bitwise OR of all project play states (1=playing, 2=pause,
 * 4=recording)
 */
@:native("GetAllProjectPlayStates")
public static function getAllProjectPlayStates(ignoreProject: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * get the active take in this item
 */
@:native("GetActiveTake")
public static function getActiveTake(item: MediaItem): MediaItemTake;
/**
 * See CountActionShortcuts,DeleteActionShortcut,DoActionShortcutDialog.
 */
@:native("GetActionShortcutDesc")
public static function getActionShortcutDesc(section: haxe.extern.EitherType<Dynamic, Int>, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * Get reaper.ini full filename.
 */
@:native("get_ini_file")
public static function getIniFile(): String;
/**
 * gets ini configuration variable value as string
 */
@:native("get_config_var_string")
public static function getConfigVarString(name: String): Bool;
/** No description available */
@:native("genGuid")
public static function genGuid(): String;
/**
 * 5=h:m:s:f
 */
@:native("format_timestr_pos")
public static function formatTimestrPos(tPos: Float, buf: String, modeoverrIde: Int): String;
/**
 * offset is start of where the length will be calculated from
 */
@:native("format_timestr_len")
public static function formatTimestrLen(tPos: Float, buf: String, offSet: Float, modeoverrIde: Int): String;
/**
 * Format tpos (which is time in seconds) as hh:mm:ss.sss. See
 * format_timestr_pos, format_timestr_len.
 */
@:native("format_timestr")
public static function formatTimestr(tPos: Float, buf: String): String;
/**
 * Find the tempo/time signature marker that falls at or before this time
 * position (the marker that is in effect as of this time position).
 */
@:native("FindTempoTimeSigMarker")
public static function findTempoTimeSigMarker(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, time: Float): Int;
/**
 * returns true if path points to a valid, readable file
 */
@:native("file_exists")
public static function fileExists(patH: String): Bool;
/**
 * Executes command line, returns NULL on total failure, otherwise the return
 * value, a newline, and then the output of the command. If timeoutmsec is 0,
 * command will be allowed to run indefinitely (recommended for large amounts of
 * returned output). timeoutmsec is -1 for no wait/terminate, -2 for no wait and
 * minimize
 */
@:native("ExecProcess")
public static function execProcess(cmdLine: String, timeoutmsec: Int): String;
/**
 * Sort envelope points by time. autoitem_idx=-1 for the underlying envelope, 0
 * for the first automation item on the envelope, etc. See SetEnvelopePoint,
 * InsertEnvelopePoint.
 */
@:native("Envelope_SortPointsEx")
public static function envelopeSortPointsEx(envelope: TrackEnvelope, autoitemIdX: Int): Bool;
/**
 * Sort envelope points by time. See SetEnvelopePoint, InsertEnvelopePoint.
 */
@:native("Envelope_SortPoints")
public static function envelopeSortPoints(envelope: TrackEnvelope): Bool;
/**
 * If track envelope, gets the track from the envelope. If FX, indexOut set to
 * FX index, index2Out set to parameter index, otherwise -1.
 */
@:native("Envelope_GetParentTrack")
public static function envelopeGetParentTrack(env: TrackEnvelope): MediaTrack;
/**
 * If take envelope, gets the take from the envelope. If FX, indexOut set to FX
 * index, index2Out set to parameter index, otherwise -1.
 */
@:native("Envelope_GetParentTake")
public static function envelopeGetParentTake(env: TrackEnvelope): MediaItemTake;
/**
 * Formats the value of an envelope to a user-readable form
 */
@:native("Envelope_FormatValue")
public static function envelopeFormatValue(env: TrackEnvelope, value: Float): String;
/**
 * Get the effective envelope value at a given time position. samplesRequested
 * is how long the caller expects until the next call to Envelope_Evaluate
 * (often, the buffer block size). The return value is how many samples beyond
 * that time position that the returned values are valid. dVdS is the change in
 * value per sample (first derivative), ddVdS is the second derivative, dddVdS
 * is the third derivative. See GetEnvelopeScalingMode.
 */
@:native("Envelope_Evaluate")
public static function envelopeEvaluate(envelope: TrackEnvelope, time: Float, sampleRate: Float, samplesRequested: Int): Int;
/**
 * returns false if there are no plugins on the track that support MIDI
 * programs,or if all programs have been enumerated
 */
@:native("EnumTrackMIDIProgramNamesEx")
public static function enumTrackMidiProgramNamesEx(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack, programNumber: Int, programName: String): Bool;
/**
 * returns false if there are no plugins on the track that support MIDI
 * programs,or if all programs have been enumerated
 */
@:native("EnumTrackMIDIProgramNames")
public static function enumTrackMidiProgramNames(track: Int, programNumber: Int, programName: String): Bool;
/**
 * Enumerate which tracks will be rendered within this region when using the
 * region render matrix. When called with rendertrack==0, the function returns
 * the first track that will be rendered (which may be the master track);
 * rendertrack==1 will return the next track rendered, and so on. The function
 * returns NULL when there are no more tracks that will be rendered within this
 * region.
 */
@:native("EnumRegionRenderMatrix")
public static function enumRegionRenderMatrix(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, regionindeX: Int, rendertrack: Int): MediaTrack;
/**
 * Enumerate the data stored with the project for a specific extname. Returns
 * false when there is no more data. See SetProjExtState, GetProjExtState.
 */
@:native("EnumProjExtState")
public static function enumProjExtState(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, eXtName: String, idX: Int): Bool;
/**
 * idx=-1 for current project,projfn can be NULL if not interested in filename.
 * use idx 0x40000000 for currently rendering project, if any.
 */
@:native("EnumProjects")
public static function enumProjects(idX: Int): Dynamic;
/** No description available */
@:native("EnumProjectMarkers3")
public static function enumProjectMarkers3(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, idX: Int): Int;
/** No description available */
@:native("EnumProjectMarkers2")
public static function enumProjectMarkers2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, idX: Int): Int;
/** No description available */
@:native("EnumProjectMarkers")
public static function enumProjectMarkers(idX: Int): Int;
/**
 * Returns submode name, or NULL
 */
@:native("EnumPitchShiftSubModes")
public static function enumPitchShiftSubModes(mode: Int, submode: Int): String;
/**
 * Start querying modes at 0, returns FALSE when no more modes possible, sets
 * strOut to NULL if a mode is currently unsupported
 */
@:native("EnumPitchShiftModes")
public static function enumPitchShiftModes(mode: Int): Bool;
/**
 * Enumerates installed FX. Returns true if successful, sets nameOut and
 * identOut to name and ident of FX at index.
 */
@:native("EnumInstalledFX")
public static function enumInstalledFx(indeX: Int): Bool;
/**
 * List the subdirectories in the "path" directory. Use subdirindex = -1 to
 * force re-read of directory (invalidate cache). Returns NULL/nil when all
 * subdirectories have been listed. See EnumerateFiles
 */
@:native("EnumerateSubdirectories")
public static function enumerateSubdirectories(patH: String, subDirindeX: Int): String;
/**
 * List the files in the "path" directory. Returns NULL/nil when all files have
 * been listed. Use fileindex = -1 to force re-read of directory (invalidate
 * cache). See EnumerateSubdirectories
 */
@:native("EnumerateFiles")
public static function enumerateFiles(patH: String, fileindeX: Int): String;
/**
 * call with a saved window rect for your window and it'll correct any
 * positioning info.
 */
@:native("EnsureNotCompletelyOffscreen")
public static function ensureNotCompletelyOffscreen(rLeft: Int, rTop: Int, rRigHt: Int, rBot: Int): Int;
/**
 * Open the tempo/time signature marker editor dialog.
 */
@:native("EditTempoTimeSigMarker")
public static function editTempoTimeSigMarker(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markerindeX: Int): Bool;
/** No description available */
@:native("DockWindowRemove")
public static function dockWindowRemove(hWnd: Hwnd): Void;
/** No description available */
@:native("DockWindowRefreshForHWND")
public static function dockWindowRefreshForHwnd(hWnd: Hwnd): Void;
/** No description available */
@:native("DockWindowRefresh")
public static function dockWindowRefresh(): Void;
/** No description available */
@:native("DockWindowAddEx")
public static function dockWindowAddEx(hWnd: Hwnd, name: String, identstr: String, alloWSHoW: Bool): Void;
/** No description available */
@:native("DockWindowAdd")
public static function dockWindowAdd(hWnd: Hwnd, name: String, pos: Int, alloWSHoW: Bool): Void;
/** No description available */
@:native("DockWindowActivate")
public static function dockWindowActivate(hWnd: Hwnd): Void;
/**
 * returns dock index that contains hwnd, or -1
 */
@:native("DockIsChildOfDock")
public static function dockIsChildOfDock(hWnd: Hwnd): Int;
/**
 * -1=not found, 0=bottom, 1=left, 2=top, 3=right, 4=floating
 */
@:native("DockGetPosition")
public static function dockGetPosition(wHicHDock: Int): Int;
/**
 * updates preference for docker window ident_str to be in dock whichDock on
 * next open
 */
@:native("Dock_UpdateDockID")
public static function dockUpdateDockId(identStr: String, wHicHDock: Int): Void;
/**
 * See CountActionShortcuts, GetActionShortcutDesc, DeleteActionShortcut.
 */
@:native("DoActionShortcutDialog")
public static function doActionShortcutDialog(hWnd: Hwnd, section: haxe.extern.EitherType<Dynamic, Int>, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * Destroy an audio accessor. Must only call from the main thread. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, AudioAccessorStateChanged,
 * GetAudioAccessorStartTime, GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("DestroyAudioAccessor")
public static function destroyAudioAccessor(accessor: AudioAccessor): Void;
/** No description available */
@:native("DeleteTrackMediaItem")
public static function deleteTrackMediaItem(tr: MediaTrack, it: MediaItem): Bool;
/**
 * deletes a track
 */
@:native("DeleteTrack")
public static function deleteTrack(tr: MediaTrack): Void;
/**
 * Delete a tempo/time signature marker.
 */
@:native("DeleteTempoTimeSigMarker")
public static function deleteTempoTimeSigMarker(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markerindeX: Int): Bool;
/**
 * Deletes one or more stretch markers. Returns number of stretch markers
 * deleted.
 */
@:native("DeleteTakeStretchMarkers")
public static function deleteTakeStretchMarkers(take: MediaItemTake, idX: Int, ?countIn: Int): Int;
/**
 * Delete a take marker. Note that idx will change for all following take
 * markers. See GetNumTakeMarkers, GetTakeMarker, SetTakeMarker
 */
@:native("DeleteTakeMarker")
public static function deleteTakeMarker(take: MediaItemTake, idX: Int): Bool;
/**
 * Differs from DeleteProjectMarker only in that markrgnidx is 0 for the first
 * marker/region, 1 for the next, etc (see EnumProjectMarkers3), rather than
 * representing the displayed marker/region ID number (see SetProjectMarker4).
 */
@:native("DeleteProjectMarkerByIndex")
public static function deleteProjectMarkerByIndex(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnIdX: Int): Bool;
/**
 * Delete a marker.  proj==NULL for the active project.
 */
@:native("DeleteProjectMarker")
public static function deleteProjectMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, markrgnindeXnumber: Int, isrgn: Bool): Bool;
/**
 * Delete the extended state value for a specific section and key. persist=true
 * means the value should remain deleted the next time REAPER is opened. See
 * SetExtState, GetExtState, HasExtState.
 */
@:native("DeleteExtState")
public static function deleteExtState(section: String, keY: String, persist: Bool): Void;
/**
 * Delete a range of envelope points. autoitem_idx=-1 for the underlying
 * envelope, 0 for the first automation item on the envelope, etc.
 */
@:native("DeleteEnvelopePointRangeEx")
public static function deleteEnvelopePointRangeEx(envelope: TrackEnvelope, autoitemIdX: Int, timeStart: Float, timeEnd: Float): Bool;
/**
 * Delete a range of envelope points. See DeleteEnvelopePointRangeEx,
 * DeleteEnvelopePointEx.
 */
@:native("DeleteEnvelopePointRange")
public static function deleteEnvelopePointRange(envelope: TrackEnvelope, timeStart: Float, timeEnd: Float): Bool;
/**
 * See CountEnvelopePointsEx, GetEnvelopePointEx, SetEnvelopePointEx,
 * InsertEnvelopePointEx.
 */
@:native("DeleteEnvelopePointEx")
public static function deleteEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, ptIdX: Int): Bool;
/**
 * See CountActionShortcuts, GetActionShortcutDesc, DoActionShortcutDialog.
 */
@:native("DeleteActionShortcut")
public static function deleteActionShortcut(section: haxe.extern.EitherType<Dynamic, Int>, cmdId: Int, sHortcutIdX: Int): Bool;
/** No description available */
@:native("DB2SLIDER")
public static function db2Slider(x: Float): Float;
/** No description available */
@:native("CSurf_TrackToID")
public static function csurfTrackToId(track: MediaTrack, mcpVieW: Bool): Int;
/** No description available */
@:native("CSurf_TrackFromID")
public static function csurfTrackFromId(idX: Int, mcpVieW: Bool): MediaTrack;
/** No description available */
@:native("CSurf_SetTrackListChange")
public static function csurfSetTrackListChange(): Void;
/** No description available */
@:native("CSurf_SetSurfaceVolume")
public static function csurfSetSurfaceVolume(trackId: MediaTrack, volume: Float, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceSolo")
public static function csurfSetSurfaceSolo(trackId: MediaTrack, solo: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceSelected")
public static function csurfSetSurfaceSelected(trackId: MediaTrack, selected: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceRecArm")
public static function csurfSetSurfaceRecArm(trackId: MediaTrack, recArm: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfacePan")
public static function csurfSetSurfacePan(trackId: MediaTrack, pan: Float, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceMute")
public static function csurfSetSurfaceMute(trackId: MediaTrack, mute: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetRepeatState")
public static function csurfSetRepeatState(rep: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetPlayState")
public static function csurfSetPlayState(plaY: Bool, pause: Bool, rec: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetAutoMode")
public static function csurfSetAutoMode(mode: Int, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_ScrubAmt")
public static function csurfScrubAmt(amt: Float): Void;
/** No description available */
@:native("CSurf_ResetAllCachedVolPanStates")
public static function csurfResetAllCachedVolPanStates(): Void;
/** No description available */
@:native("CSurf_OnZoom")
public static function csurfOnZoom(xDir: Int, yDir: Int): Void;
/** No description available */
@:native("CSurf_OnWidthChangeEx")
public static function csurfOnWidthChangeEx(trackId: MediaTrack, wIdtH: Float, relative: Bool, alloWGang: Bool): Float;
/** No description available */
@:native("CSurf_OnWidthChange")
public static function csurfOnWidthChange(trackId: MediaTrack, wIdtH: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnVolumeChangeEx")
public static function csurfOnVolumeChangeEx(trackId: MediaTrack, volume: Float, relative: Bool, alloWGang: Bool): Float;
/** No description available */
@:native("CSurf_OnVolumeChange")
public static function csurfOnVolumeChange(trackId: MediaTrack, volume: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnTrackSelection")
public static function csurfOnTrackSelection(trackId: MediaTrack): Void;
/** No description available */
@:native("CSurf_OnTempoChange")
public static function csurfOnTempoChange(bpm: Float): Void;
/** No description available */
@:native("CSurf_OnStop")
public static function csurfOnStop(): Void;
/** No description available */
@:native("CSurf_OnSoloChangeEx")
public static function csurfOnSoloChangeEx(trackId: MediaTrack, solo: Int, alloWGang: Bool): Bool;
/** No description available */
@:native("CSurf_OnSoloChange")
public static function csurfOnSoloChange(trackId: MediaTrack, solo: Int): Bool;
/** No description available */
@:native("CSurf_OnSendVolumeChange")
public static function csurfOnSendVolumeChange(trackId: MediaTrack, sendIndeX: Int, volume: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnSendPanChange")
public static function csurfOnSendPanChange(trackId: MediaTrack, sendIndeX: Int, pan: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnSelectedChange")
public static function csurfOnSelectedChange(trackId: MediaTrack, selected: Int): Bool;
/** No description available */
@:native("CSurf_OnScroll")
public static function csurfOnScroll(xDir: Int, yDir: Int): Void;
/** No description available */
@:native("CSurf_OnRewFwd")
public static function csurfOnRewFwd(seekPlaY: Int, dir: Int): Void;
/** No description available */
@:native("CSurf_OnRew")
public static function csurfOnRew(seekPlaY: Int): Void;
/** No description available */
@:native("CSurf_OnRecvVolumeChange")
public static function csurfOnRecvVolumeChange(trackId: MediaTrack, recvIndeX: Int, volume: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnRecvPanChange")
public static function csurfOnRecvPanChange(trackId: MediaTrack, recvIndeX: Int, pan: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnRecord")
public static function csurfOnRecord(): Void;
/** No description available */
@:native("CSurf_OnRecArmChangeEx")
public static function csurfOnRecArmChangeEx(trackId: MediaTrack, recArm: Int, alloWGang: Bool): Bool;
/** No description available */
@:native("CSurf_OnRecArmChange")
public static function csurfOnRecArmChange(trackId: MediaTrack, recArm: Int): Bool;
/** No description available */
@:native("CSurf_OnPlayRateChange")
public static function csurfOnPlayRateChange(plaYRate: Float): Void;
/** No description available */
@:native("CSurf_OnPlay")
public static function csurfOnPlay(): Void;
/** No description available */
@:native("CSurf_OnPause")
public static function csurfOnPause(): Void;
/** No description available */
@:native("CSurf_OnPanChangeEx")
public static function csurfOnPanChangeEx(trackId: MediaTrack, pan: Float, relative: Bool, alloWGang: Bool): Float;
/** No description available */
@:native("CSurf_OnPanChange")
public static function csurfOnPanChange(trackId: MediaTrack, pan: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnMuteChangeEx")
public static function csurfOnMuteChangeEx(trackId: MediaTrack, mute: Int, alloWGang: Bool): Bool;
/** No description available */
@:native("CSurf_OnMuteChange")
public static function csurfOnMuteChange(trackId: MediaTrack, mute: Int): Bool;
/** No description available */
@:native("CSurf_OnInputMonitorChangeEx")
public static function csurfOnInputMonitorChangeEx(trackId: MediaTrack, monitor: Int, alloWGang: Bool): Int;
/** No description available */
@:native("CSurf_OnInputMonitorChange")
public static function csurfOnInputMonitorChange(trackId: MediaTrack, monitor: Int): Int;
/** No description available */
@:native("CSurf_OnFXChange")
public static function csurfOnFxChange(trackId: MediaTrack, en: Int): Bool;
/** No description available */
@:native("CSurf_OnFwd")
public static function csurfOnFwd(seekPlaY: Int): Void;
/** No description available */
@:native("CSurf_OnArrow")
public static function csurfOnArrow(wHicHDir: Int, wantzoom: Bool): Void;
/** No description available */
@:native("CSurf_NumTracks")
public static function csurfNumTracks(mcpVieW: Bool): Int;
/** No description available */
@:native("CSurf_GoStart")
public static function csurfGoStart(): Void;
/** No description available */
@:native("CSurf_GoEnd")
public static function csurfGoEnd(): Void;
/** No description available */
@:native("CSurf_GetTouchState")
public static function csurfGetTouchState(trackId: MediaTrack, isPan: Int): Bool;
/**
 * call this to force flushing of the undo states after using CSurf_On*Change()
 */
@:native("CSurf_FlushUndo")
public static function csurfFlushUndo(force: Bool): Void;
/**
 * Create a send/receive (desttrInOptional!=NULL), or a hardware output
 * (desttrInOptional==NULL) with default properties, return >=0 on success (==
 * new send/receive index). See RemoveTrackSend, GetSetTrackSendInfo,
 * GetTrackSendInfo_Value, SetTrackSendInfo_Value.
 */
@:native("CreateTrackSend")
public static function createTrackSend(tr: MediaTrack, ?desttrIn: MediaTrack): Int;
/**
 * Create an audio accessor object for this track. Must only call from the main
 * thread. See CreateTakeAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("CreateTrackAudioAccessor")
public static function createTrackAudioAccessor(track: MediaTrack): AudioAccessor;
/**
 * Create an audio accessor object for this take. Must only call from the main
 * thread. See CreateTrackAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("CreateTakeAudioAccessor")
public static function createTakeAudioAccessor(take: MediaItemTake): AudioAccessor;
/**
 * Create a new MIDI media item, containing no MIDI events. Time is in seconds
 * unless qn is set.
 */
@:native("CreateNewMIDIItemInProj")
public static function createNewMidiItemInProj(track: MediaTrack, startTime: Float, endTime: Float, ?qnIn: Bool): MediaItem;
/**
 * count the number of tracks in the project (proj=0 for active project)
 */
@:native("CountTracks")
public static function countTracks(?proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * count the number of items in the track
 */
@:native("CountTrackMediaItems")
public static function countTrackMediaItems(track: MediaTrack): Int;
/**
 * see GetTrackEnvelope
 */
@:native("CountTrackEnvelopes")
public static function countTrackEnvelopes(track: MediaTrack): Int;
/**
 * Count the number of tempo/time signature markers in the project. See
 * GetTempoTimeSigMarker, SetTempoTimeSigMarker, AddTempoTimeSigMarker.
 */
@:native("CountTempoTimeSigMarkers")
public static function countTempoTimeSigMarkers(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * Count the number of FX parameter knobs displayed on the track control panel.
 */
@:native("CountTCPFXParms")
public static function countTcpfxParms(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, track: MediaTrack): Int;
/**
 * count the number of takes in the item
 */
@:native("CountTakes")
public static function countTakes(item: MediaItem): Int;
/**
 * See GetTakeEnvelope
 */
@:native("CountTakeEnvelopes")
public static function countTakeEnvelopes(take: MediaItemTake): Int;
/**
 * Count the number of selected tracks in the project (proj=0 for active
 * project).
 */
@:native("CountSelectedTracks2")
public static function countSelectedTracks2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, wantMaster: Bool): Int;
/**
 * Count the number of selected tracks in the project (proj=0 for active
 * project). This function ignores the master track, see CountSelectedTracks2.
 */
@:native("CountSelectedTracks")
public static function countSelectedTracks(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * Discouraged, because GetSelectedMediaItem can be inefficient if media items
 * are added, rearranged, or deleted in between calls. Instead see
 * CountMediaItems, GetMediaItem, IsMediaItemSelected.
 */
@:native("CountSelectedMediaItems")
public static function countSelectedMediaItems(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * num_markersOut and num_regionsOut may be NULL.
 */
@:native("CountProjectMarkers")
public static function countProjectMarkers(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * count the number of items in the project (proj=0 for active project)
 */
@:native("CountMediaItems")
public static function countMediaItems(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Int;
/**
 * See GetEnvelopePointEx, SetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("CountEnvelopePointsEx")
public static function countEnvelopePointsEx(envelope: TrackEnvelope, autoitemIdX: Int): Int;
/**
 * Returns the number of points in the envelope. See CountEnvelopePointsEx.
 */
@:native("CountEnvelopePoints")
public static function countEnvelopePoints(envelope: TrackEnvelope): Int;
/**
 * Returns the number of automation items on this envelope. See
 * GetSetAutomationItemInfo
 */
@:native("CountAutomationItems")
public static function countAutomationItems(env: TrackEnvelope): Int;
/**
 * see GetActionShortcutDesc, DeleteActionShortcut, DoActionShortcutDialog.
 */
@:native("CountActionShortcuts")
public static function countActionShortcuts(section: haxe.extern.EitherType<Dynamic, Int>, cmdId: Int): Int;
/**
 * Make an OS dependent color from RGB values (e.g. RGB() macro on Windows). r,g
 * and b are in [0..255]. See ColorFromNative.
 */
@:native("ColorToNative")
public static function colorToNative(r: Int, g: Int, b: Int): Int;
/**
 * Extract RGB values from an OS dependent color. See ColorToNative.
 */
@:native("ColorFromNative")
public static function colorFromNative(col: Int): Int;
/**
 * resets the global peak caches
 */
@:native("ClearPeakCache")
public static function clearPeakCache(): Void;
/**
 * Clear the ReaScript console. See ShowConsoleMsg
 */
@:native("ClearConsole")
public static function clearConsole(): Void;
/** No description available */
@:native("ClearAllRecArmed")
public static function clearAllRecArmed(): Void;
/**
 * Calculate normalize adjustment for source media. normalizeTo: 0=LUFS-I,
 * 1=RMS-I, 2=peak, 3=true peak, 4=LUFS-M max, 5=LUFS-S max. normalizeTarget:
 * dBFS or LUFS value. normalizeStart, normalizeEnd: time bounds within source
 * media for normalization calculation. If normalizationStart=0 and
 * normalizationEnd=0, the full duration of the media will be used for the
 * calculation.
 */
@:native("CalculateNormalization")
public static function calculateNormalization(source: PcmSource, normalizeTo: Int, normalizeTarget: Float, normalizeStart: Float, normalizeEnd: Float): Float;
/**
 * Calculates loudness statistics of media via dry run render. Statistics will
 * be displayed to the user; call GetSetProjectInfo_String("RENDER_STATS") to
 * retrieve via API. Returns 1 if loudness was calculated successfully, -1 if
 * user canceled the dry run render.
 */
@:native("CalcMediaSrcLoudness")
public static function calcMediaSrcLoudness(mediaSource: PcmSource): Int;
/**
 * -1 = bypass all if not all bypassed,otherwise unbypass all
 */
@:native("BypassFxAllTracks")
public static function bypassFxAllTracks(bYpass: Int): Void;
/**
 * Validates the current state of the audio accessor -- must ONLY call this from
 * the main thread. Returns true if the state changed.
 */
@:native("AudioAccessorValidateState")
public static function audioAccessorValidateState(accessor: AudioAccessor): Bool;
/**
 * Force the accessor to reload its state from the underlying track or media
 * item take. See CreateTakeAudioAccessor, CreateTrackAudioAccessor,
 * DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("AudioAccessorUpdate")
public static function audioAccessorUpdate(accessor: AudioAccessor): Void;
/**
 * Returns true if the underlying samples (track or media item take) have
 * changed, but does not update the audio accessor, so the user can selectively
 * call AudioAccessorValidateState only when needed. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("AudioAccessorStateChanged")
public static function audioAccessorStateChanged(accessor: AudioAccessor): Bool;
/**
 * close all audio and MIDI devices, if open
 */
@:native("Audio_Quit")
public static function audioQuit(): Void;
/**
 * is audio running at all? threadsafe
 */
@:native("Audio_IsRunning")
public static function audioIsRunning(): Int;
/**
 * is in pre-buffer? threadsafe
 */
@:native("Audio_IsPreBuffer")
public static function audioIsPreBuffer(): Int;
/**
 * open all audio and MIDI devices, if not open
 */
@:native("Audio_Init")
public static function audioInit(): Void;
/**
 * arms a command (or disarms if 0 passed) in section sectionname (empty string
 * for main)
 */
@:native("ArmCommand")
public static function armCommand(cmd: Int, sectionName: String): Void;
/**
 * copies: in nudge duplicate mode, number of copies (otherwise ignored)
 */
@:native("ApplyNudge")
public static function applyNudge(project: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, nudgeFlag: Int, nudgeWHat: Int, nudgeUnits: Int, value: Float, reverse: Bool, copies: Int): Bool;
/**
 * Displays a message window if the API was successfully called.
 */
@:native("APITest")
public static function apiTest(): Void;
/**
 * Returns true if function_name exists in the REAPER API
 */
@:native("APIExists")
public static function apiExists(functionName: String): Bool;
/** No description available */
@:native("AnyTrackSolo")
public static function anyTrackSolo(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>): Bool;
/**
 * forceset=0,doupd=true,centermode=-1 for default
 */
@:native("adjustZoom")
public static function adjustZoom(amt: Float, forceSet: Int, doupd: Bool, centermode: Int): Void;
/**
 * Deprecated. Use SetTempoTimeSigMarker with ptidx=-1.
 */
@:native("AddTempoTimeSigMarker")
public static function addTempoTimeSigMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, timePos: Float, bpm: Float, timesigNum: Int, timesigDenom: Int, linearTempoCHange: Bool): Bool;
/**
 * creates a new take in an item
 */
@:native("AddTakeToMediaItem")
public static function addTakeToMediaItem(item: MediaItem): MediaItemTake;
/**
 * Add a ReaScript (return the new command ID, or 0 if failed) or remove a
 * ReaScript (return >0 on success). Use commit==true when adding/removing a
 * single script. When bulk adding/removing n scripts, you can optimize the n-1
 * first calls with commit==false and commit==true for the last call.
 */
@:native("AddRemoveReaScript")
public static function addRemoveReaScript(add: Bool, sectionId: Int, scriptFn: String, commit: Bool): Int;
/**
 * Returns the index of the created marker/region, or -1 on failure. Supply
 * wantidx>=0 if you want a particular index number, but you'll get a different
 * index number a region and wantidx is already in use. color should be 0
 * (default color), or ColorToNative(r,g,b)|0x1000000
 */
@:native("AddProjectMarker2")
public static function addProjectMarker2(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, isrgn: Bool, pos: Float, rgnend: Float, name: String, wantIdX: Int, color: Int): Int;
/**
 * Returns the index of the created marker/region, or -1 on failure. Supply
 * wantidx>=0 if you want a particular index number, but you'll get a different
 * index number a region and wantidx is already in use.
 */
@:native("AddProjectMarker")
public static function addProjectMarker(proj: haxe.extern.EitherType<haxe.extern.EitherType<Dynamic, Void>, Int>, isrgn: Bool, pos: Float, rgnend: Float, name: String, wantIdX: Int): Int;
/**
 * creates a new media item.
 */
@:native("AddMediaItemToTrack")
public static function addMediaItemToTrack(tr: MediaTrack): MediaItem;
}