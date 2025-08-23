package reaper;

import reaper.Types;

@:native("reaper")
extern class Reaper {
/**
 * creates a new media item.
 */
@:native("AddMediaItemToTrack")
public static function addMediaItemToTrack(tr: MediaTrack): MediaItem;
/**
 * Returns the index of the created marker/region, or -1 on failure. Supply
 * wantidx>=0 if you want a particular index number, but you'll get a different
 * index number a region and wantidx is already in use.
 */
@:native("AddProjectMarker")
public static function addProjectMarker(proj: ReaProject, isrgn: Bool, pos: Float, rgnend: Float, name: String, wantIdX: Int): Int;
/**
 * Returns the index of the created marker/region, or -1 on failure. Supply
 * wantidx>=0 if you want a particular index number, but you'll get a different
 * index number a region and wantidx is already in use. color should be 0
 * (default color), or ColorToNative(r,g,b)|0x1000000
 */
@:native("AddProjectMarker2")
public static function addProjectMarker2(proj: ReaProject, isrgn: Bool, pos: Float, rgnend: Float, name: String, wantIdX: Int, color: Int): Int;
/**
 * Add a ReaScript (return the new command ID, or 0 if failed) or remove a
 * ReaScript (return >0 on success). Use commit==true when adding/removing a
 * single script. When bulk adding/removing n scripts, you can optimize the n-1
 * first calls with commit==false and commit==true for the last call.
 */
@:native("AddRemoveReaScript")
public static function addRemoveReaScript(add: Bool, sectionId: Int, scriptFn: String, commit: Bool): Int;
/**
 * creates a new take in an item
 */
@:native("AddTakeToMediaItem")
public static function addTakeToMediaItem(item: MediaItem): MediaItemTake;
/**
 * Deprecated. Use SetTempoTimeSigMarker with ptidx=-1.
 */
@:native("AddTempoTimeSigMarker")
public static function addTempoTimeSigMarker(proj: ReaProject, timePos: Float, bpm: Float, timesigNum: Int, timesigDenom: Int, linearTempoCHange: Bool): Bool;
/**
 * forceset=0,doupd=true,centermode=-1 for default
 */
@:native("adjustZoom")
public static function adjustZoom(amt: Float, forceSet: Int, doupd: Bool, centermode: Int): Void;
/** No description available */
@:native("AnyTrackSolo")
public static function anyTrackSolo(proj: ReaProject): Bool;
/**
 * Returns true if function_name exists in the REAPER API
 */
@:native("APIExists")
public static function apiExists(functionName: String): Bool;
/**
 * Displays a message window if the API was successfully called.
 */
@:native("APITest")
public static function apiTest(): Void;
/**
 * nudgeflag: &1=set to value (otherwise nudge by value), &2=snap
nudgewhat:
 * 0=position, 1=left trim, 2=left edge, 3=right edge, 4=contents, 5=duplicate,
 * 6=edit cursor
nudgeunit: 0=ms, 1=seconds, 2=grid, 3=256th notes, ...,
 * 15=whole notes, 16=measures.beats (1.15 = 1 measure + 1.5 beats), 17=samples,
 * 18=frames, 19=pixels, 20=item lengths, 21=item selections
value: amount to
 * nudge by, or value to set to
reverse: in nudge mode, nudges left (otherwise
 * ignored)
copies: in nudge duplicate mode, number of copies (otherwise
 * ignored)
 */
@:native("ApplyNudge")
public static function applyNudge(project: ReaProject, nudgeFlag: Int, nudgeWHat: Int, nudgeUnits: Int, value: Float, reverse: Bool, copies: Int): Bool;
/**
 * arms a command (or disarms if 0 passed) in section sectionname (empty string
 * for main)
 */
@:native("ArmCommand")
public static function armCommand(cmd: Int, sectionName: String): Void;
/**
 * open all audio and MIDI devices, if not open
 */
@:native("Audio_Init")
public static function audioInit(): Void;
/**
 * is in pre-buffer? threadsafe
 */
@:native("Audio_IsPreBuffer")
public static function audioIsPreBuffer(): Int;
/**
 * is audio running at all? threadsafe
 */
@:native("Audio_IsRunning")
public static function audioIsRunning(): Int;
/**
 * close all audio and MIDI devices, if open
 */
@:native("Audio_Quit")
public static function audioQuit(): Void;
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
 * Force the accessor to reload its state from the underlying track or media
 * item take. See CreateTakeAudioAccessor, CreateTrackAudioAccessor,
 * DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("AudioAccessorUpdate")
public static function audioAccessorUpdate(accessor: AudioAccessor): Void;
/**
 * Validates the current state of the audio accessor -- must ONLY call this from
 * the main thread. Returns true if the state changed.
 */
@:native("AudioAccessorValidateState")
public static function audioAccessorValidateState(accessor: AudioAccessor): Bool;
/**
 * -1 = bypass all if not all bypassed,otherwise unbypass all
 */
@:native("BypassFxAllTracks")
public static function bypassFxAllTracks(bYpass: Int): Void;
/**
 * Calculates loudness statistics of media via dry run render. Statistics will
 * be displayed to the user; call GetSetProjectInfo_String("RENDER_STATS") to
 * retrieve via API. Returns 1 if loudness was calculated successfully, -1 if
 * user canceled the dry run render.
 */
@:native("CalcMediaSrcLoudness")
public static function calcMediaSrcLoudness(mediaSource: PcmSource): Int;
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
/** No description available */
@:native("ClearAllRecArmed")
public static function clearAllRecArmed(): Void;
/**
 * Clear the ReaScript console. See ShowConsoleMsg
 */
@:native("ClearConsole")
public static function clearConsole(): Void;
/**
 * resets the global peak caches
 */
@:native("ClearPeakCache")
public static function clearPeakCache(): Void;
/**
 * Extract RGB values from an OS dependent color. See ColorToNative.
 */
@:native("ColorFromNative")
public static function colorFromNative(col: Int): Int;
/**
 * Make an OS dependent color from RGB values (e.g. RGB() macro on Windows). r,g
 * and b are in [0..255]. See ColorFromNative.
 */
@:native("ColorToNative")
public static function colorToNative(r: Int, g: Int, b: Int): Int;
/**
 * Returns the number of shortcuts that exist for the given command ID.
see
 * GetActionShortcutDesc, DeleteActionShortcut, DoActionShortcutDialog.
 */
@:native("CountActionShortcuts")
public static function countActionShortcuts(section: KbdSectionInfo, cmdId: Int): Int;
/**
 * Returns the number of automation items on this envelope. See
 * GetSetAutomationItemInfo
 */
@:native("CountAutomationItems")
public static function countAutomationItems(env: TrackEnvelope): Int;
/**
 * Returns the number of points in the envelope. See CountEnvelopePointsEx.
 */
@:native("CountEnvelopePoints")
public static function countEnvelopePoints(envelope: TrackEnvelope): Int;
/**
 * Returns the number of points in the envelope.
autoitem_idx=-1 for the
 * underlying envelope, 0 for the first automation item on the envelope,
 * etc.
For automation items, pass autoitem_idx|0x10000000 to base ptidx on the
 * number of points in one full loop iteration,
even if the automation item is
 * trimmed so that not all points are visible.
Otherwise, ptidx will be based on
 * the number of visible points in the automation item, including all loop
 * iterations.
See GetEnvelopePointEx, SetEnvelopePointEx,
 * InsertEnvelopePointEx, DeleteEnvelopePointEx.
 */
@:native("CountEnvelopePointsEx")
public static function countEnvelopePointsEx(envelope: TrackEnvelope, autoitemIdX: Int): Int;
/**
 * count the number of items in the project (proj=0 for active project)
 */
@:native("CountMediaItems")
public static function countMediaItems(proj: ReaProject): Int;
/**
 * num_markersOut and num_regionsOut may be NULL.
 */
@:native("CountProjectMarkers")
public static function countProjectMarkers(proj: ReaProject): Int;
/**
 * Discouraged, because GetSelectedMediaItem can be inefficient if media items
 * are added, rearranged, or deleted in between calls. Instead see
 * CountMediaItems, GetMediaItem, IsMediaItemSelected.
 */
@:native("CountSelectedMediaItems")
public static function countSelectedMediaItems(proj: ReaProject): Int;
/**
 * Count the number of selected tracks in the project (proj=0 for active
 * project). This function ignores the master track, see CountSelectedTracks2.
 */
@:native("CountSelectedTracks")
public static function countSelectedTracks(proj: ReaProject): Int;
/**
 * Count the number of selected tracks in the project (proj=0 for active
 * project).
 */
@:native("CountSelectedTracks2")
public static function countSelectedTracks2(proj: ReaProject, wantMaster: Bool): Int;
/**
 * See GetTakeEnvelope
 */
@:native("CountTakeEnvelopes")
public static function countTakeEnvelopes(take: MediaItemTake): Int;
/**
 * count the number of takes in the item
 */
@:native("CountTakes")
public static function countTakes(item: MediaItem): Int;
/**
 * Count the number of FX parameter knobs displayed on the track control panel.
 */
@:native("CountTCPFXParms")
public static function countTcpfxParms(project: ReaProject, track: MediaTrack): Int;
/**
 * Count the number of tempo/time signature markers in the project. See
 * GetTempoTimeSigMarker, SetTempoTimeSigMarker, AddTempoTimeSigMarker.
 */
@:native("CountTempoTimeSigMarkers")
public static function countTempoTimeSigMarkers(proj: ReaProject): Int;
/**
 * see GetTrackEnvelope
 */
@:native("CountTrackEnvelopes")
public static function countTrackEnvelopes(track: MediaTrack): Int;
/**
 * count the number of items in the track
 */
@:native("CountTrackMediaItems")
public static function countTrackMediaItems(track: MediaTrack): Int;
/**
 * count the number of tracks in the project (proj=0 for active project)
 */
@:native("CountTracks")
public static function countTracks(proj: ReaProject): Int;
/**
 * Create a new MIDI media item, containing no MIDI events. Time is in seconds
 * unless qn is set.
 */
@:native("CreateNewMIDIItemInProj")
public static function createNewMidiItemInProj(track: MediaTrack, startTime: Float, endTime: Float, ?qnIn: Bool): MediaItem;
/**
 * Create an audio accessor object for this take. Must only call from the main
 * thread. See CreateTrackAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("CreateTakeAudioAccessor")
public static function createTakeAudioAccessor(take: MediaItemTake): AudioAccessor;
/**
 * Create an audio accessor object for this track. Must only call from the main
 * thread. See CreateTakeAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("CreateTrackAudioAccessor")
public static function createTrackAudioAccessor(track: MediaTrack): AudioAccessor;
/**
 * Create a send/receive (desttrInOptional!=NULL), or a hardware output
 * (desttrInOptional==NULL) with default properties, return >=0 on success (==
 * new send/receive index). See RemoveTrackSend, GetSetTrackSendInfo,
 * GetTrackSendInfo_Value, SetTrackSendInfo_Value.
 */
@:native("CreateTrackSend")
public static function createTrackSend(tr: MediaTrack, desttrIn: MediaTrack): Int;
/**
 * Run a command from the Crossfade Editor section of the actions list.
 */
@:native("CrossfadeEditor_OnCommand")
public static function crossfadeEditorOnCommand(command: Int): Void;
/**
 * Show or hide the Crossfade Editor window
 */
@:native("CrossfadeEditor_Show")
public static function crossfadeEditorShow(sHoW: Bool): Void;
/**
 * call this to force flushing of the undo states after using CSurf_On*Change()
 */
@:native("CSurf_FlushUndo")
public static function csurfFlushUndo(force: Bool): Void;
/** No description available */
@:native("CSurf_GetTouchState")
public static function csurfGetTouchState(trackId: MediaTrack, isPan: Int): Bool;
/** No description available */
@:native("CSurf_GoEnd")
public static function csurfGoEnd(): Void;
/** No description available */
@:native("CSurf_GoStart")
public static function csurfGoStart(): Void;
/** No description available */
@:native("CSurf_NumTracks")
public static function csurfNumTracks(mcpVieW: Bool): Int;
/** No description available */
@:native("CSurf_OnArrow")
public static function csurfOnArrow(wHicHDir: Int, wantzoom: Bool): Void;
/** No description available */
@:native("CSurf_OnFwd")
public static function csurfOnFwd(seekPlaY: Int): Void;
/** No description available */
@:native("CSurf_OnFXChange")
public static function csurfOnFxChange(trackId: MediaTrack, en: Int): Bool;
/** No description available */
@:native("CSurf_OnInputMonitorChange")
public static function csurfOnInputMonitorChange(trackId: MediaTrack, monitor: Int): Int;
/** No description available */
@:native("CSurf_OnInputMonitorChangeEx")
public static function csurfOnInputMonitorChangeEx(trackId: MediaTrack, monitor: Int, alloWGang: Bool): Int;
/** No description available */
@:native("CSurf_OnMuteChange")
public static function csurfOnMuteChange(trackId: MediaTrack, mute: Int): Bool;
/** No description available */
@:native("CSurf_OnMuteChangeEx")
public static function csurfOnMuteChangeEx(trackId: MediaTrack, mute: Int, alloWGang: Bool): Bool;
/** No description available */
@:native("CSurf_OnPanChange")
public static function csurfOnPanChange(trackId: MediaTrack, pan: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnPanChangeEx")
public static function csurfOnPanChangeEx(trackId: MediaTrack, pan: Float, relative: Bool, alloWGang: Bool): Float;
/** No description available */
@:native("CSurf_OnPause")
public static function csurfOnPause(): Void;
/** No description available */
@:native("CSurf_OnPlay")
public static function csurfOnPlay(): Void;
/** No description available */
@:native("CSurf_OnPlayRateChange")
public static function csurfOnPlayRateChange(plaYRate: Float): Void;
/** No description available */
@:native("CSurf_OnRecArmChange")
public static function csurfOnRecArmChange(trackId: MediaTrack, recArm: Int): Bool;
/** No description available */
@:native("CSurf_OnRecArmChangeEx")
public static function csurfOnRecArmChangeEx(trackId: MediaTrack, recArm: Int, alloWGang: Bool): Bool;
/** No description available */
@:native("CSurf_OnRecord")
public static function csurfOnRecord(): Void;
/** No description available */
@:native("CSurf_OnRecvPanChange")
public static function csurfOnRecvPanChange(trackId: MediaTrack, recvIndeX: Int, pan: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnRecvVolumeChange")
public static function csurfOnRecvVolumeChange(trackId: MediaTrack, recvIndeX: Int, volume: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnRew")
public static function csurfOnRew(seekPlaY: Int): Void;
/** No description available */
@:native("CSurf_OnRewFwd")
public static function csurfOnRewFwd(seekPlaY: Int, dir: Int): Void;
/** No description available */
@:native("CSurf_OnScroll")
public static function csurfOnScroll(xDir: Int, yDir: Int): Void;
/** No description available */
@:native("CSurf_OnSelectedChange")
public static function csurfOnSelectedChange(trackId: MediaTrack, selected: Int): Bool;
/** No description available */
@:native("CSurf_OnSendPanChange")
public static function csurfOnSendPanChange(trackId: MediaTrack, sendIndeX: Int, pan: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnSendVolumeChange")
public static function csurfOnSendVolumeChange(trackId: MediaTrack, sendIndeX: Int, volume: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnSoloChange")
public static function csurfOnSoloChange(trackId: MediaTrack, solo: Int): Bool;
/** No description available */
@:native("CSurf_OnSoloChangeEx")
public static function csurfOnSoloChangeEx(trackId: MediaTrack, solo: Int, alloWGang: Bool): Bool;
/** No description available */
@:native("CSurf_OnStop")
public static function csurfOnStop(): Void;
/** No description available */
@:native("CSurf_OnTempoChange")
public static function csurfOnTempoChange(bpm: Float): Void;
/** No description available */
@:native("CSurf_OnTrackSelection")
public static function csurfOnTrackSelection(trackId: MediaTrack): Void;
/** No description available */
@:native("CSurf_OnVolumeChange")
public static function csurfOnVolumeChange(trackId: MediaTrack, volume: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnVolumeChangeEx")
public static function csurfOnVolumeChangeEx(trackId: MediaTrack, volume: Float, relative: Bool, alloWGang: Bool): Float;
/** No description available */
@:native("CSurf_OnWidthChange")
public static function csurfOnWidthChange(trackId: MediaTrack, wIdtH: Float, relative: Bool): Float;
/** No description available */
@:native("CSurf_OnWidthChangeEx")
public static function csurfOnWidthChangeEx(trackId: MediaTrack, wIdtH: Float, relative: Bool, alloWGang: Bool): Float;
/** No description available */
@:native("CSurf_OnZoom")
public static function csurfOnZoom(xDir: Int, yDir: Int): Void;
/** No description available */
@:native("CSurf_ResetAllCachedVolPanStates")
public static function csurfResetAllCachedVolPanStates(): Void;
/** No description available */
@:native("CSurf_ScrubAmt")
public static function csurfScrubAmt(amt: Float): Void;
/** No description available */
@:native("CSurf_SetAutoMode")
public static function csurfSetAutoMode(mode: Int, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetPlayState")
public static function csurfSetPlayState(plaY: Bool, pause: Bool, rec: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetRepeatState")
public static function csurfSetRepeatState(rep: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceMute")
public static function csurfSetSurfaceMute(trackId: MediaTrack, mute: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfacePan")
public static function csurfSetSurfacePan(trackId: MediaTrack, pan: Float, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceRecArm")
public static function csurfSetSurfaceRecArm(trackId: MediaTrack, recArm: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceSelected")
public static function csurfSetSurfaceSelected(trackId: MediaTrack, selected: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceSolo")
public static function csurfSetSurfaceSolo(trackId: MediaTrack, solo: Bool, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetSurfaceVolume")
public static function csurfSetSurfaceVolume(trackId: MediaTrack, volume: Float, ignoresurf: IreaperControlSurface): Void;
/** No description available */
@:native("CSurf_SetTrackListChange")
public static function csurfSetTrackListChange(): Void;
/** No description available */
@:native("CSurf_TrackFromID")
public static function csurfTrackFromId(idX: Int, mcpVieW: Bool): MediaTrack;
/** No description available */
@:native("CSurf_TrackToID")
public static function csurfTrackToId(track: MediaTrack, mcpVieW: Bool): Int;
/** No description available */
@:native("DB2SLIDER")
public static function db2Slider(x: Float): Float;
/**
 * Delete the specific shortcut for the given command ID.
See
 * CountActionShortcuts, GetActionShortcutDesc, DoActionShortcutDialog.
 */
@:native("DeleteActionShortcut")
public static function deleteActionShortcut(section: KbdSectionInfo, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * Delete an envelope point. If setting multiple points at once, set
 * noSort=true, and call Envelope_SortPoints when done.
autoitem_idx=-1 for the
 * underlying envelope, 0 for the first automation item on the envelope,
 * etc.
For automation items, pass autoitem_idx|0x10000000 to base ptidx on the
 * number of points in one full loop iteration,
even if the automation item is
 * trimmed so that not all points are visible.
Otherwise, ptidx will be based on
 * the number of visible points in the automation item, including all loop
 * iterations.
See CountEnvelopePointsEx, GetEnvelopePointEx,
 * SetEnvelopePointEx, InsertEnvelopePointEx.
 */
@:native("DeleteEnvelopePointEx")
public static function deleteEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, ptIdX: Int): Bool;
/**
 * Delete a range of envelope points. See DeleteEnvelopePointRangeEx,
 * DeleteEnvelopePointEx.
 */
@:native("DeleteEnvelopePointRange")
public static function deleteEnvelopePointRange(envelope: TrackEnvelope, timeStart: Float, timeEnd: Float): Bool;
/**
 * Delete a range of envelope points. autoitem_idx=-1 for the underlying
 * envelope, 0 for the first automation item on the envelope, etc.
 */
@:native("DeleteEnvelopePointRangeEx")
public static function deleteEnvelopePointRangeEx(envelope: TrackEnvelope, autoitemIdX: Int, timeStart: Float, timeEnd: Float): Bool;
/**
 * Delete the extended state value for a specific section and key. persist=true
 * means the value should remain deleted the next time REAPER is opened. See
 * SetExtState, GetExtState, HasExtState.
 */
@:native("DeleteExtState")
public static function deleteExtState(section: String, keY: String, persist: Bool): Void;
/**
 * Delete a marker.  proj==NULL for the active project.
 */
@:native("DeleteProjectMarker")
public static function deleteProjectMarker(proj: ReaProject, markrgnindeXnumber: Int, isrgn: Bool): Bool;
/**
 * Differs from DeleteProjectMarker only in that markrgnidx is 0 for the first
 * marker/region, 1 for the next, etc (see EnumProjectMarkers3), rather than
 * representing the displayed marker/region ID number (see SetProjectMarker4).
 */
@:native("DeleteProjectMarkerByIndex")
public static function deleteProjectMarkerByIndex(proj: ReaProject, markrgnIdX: Int): Bool;
/**
 * Delete a take marker. Note that idx will change for all following take
 * markers. See GetNumTakeMarkers, GetTakeMarker, SetTakeMarker
 */
@:native("DeleteTakeMarker")
public static function deleteTakeMarker(take: MediaItemTake, idX: Int): Bool;
/**
 * Deletes one or more stretch markers. Returns number of stretch markers
 * deleted.
 */
@:native("DeleteTakeStretchMarkers")
public static function deleteTakeStretchMarkers(take: MediaItemTake, idX: Int, ?countIn: Int): Int;
/**
 * Delete a tempo/time signature marker.
 */
@:native("DeleteTempoTimeSigMarker")
public static function deleteTempoTimeSigMarker(project: ReaProject, markerindeX: Int): Bool;
/**
 * deletes a track
 */
@:native("DeleteTrack")
public static function deleteTrack(tr: MediaTrack): Void;
/** No description available */
@:native("DeleteTrackMediaItem")
public static function deleteTrackMediaItem(tr: MediaTrack, it: MediaItem): Bool;
/**
 * Destroy an audio accessor. Must only call from the main thread. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, AudioAccessorStateChanged,
 * GetAudioAccessorStartTime, GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("DestroyAudioAccessor")
public static function destroyAudioAccessor(accessor: AudioAccessor): Void;
/**
 * Open the action shortcut dialog to edit or add a shortcut for the given
 * command ID. If (shortcutidx >= 0 && shortcutidx < CountActionShortcuts()),
 * that specific shortcut will be replaced, otherwise a new shortcut will be
 * added.
See CountActionShortcuts, GetActionShortcutDesc, DeleteActionShortcut.
 */
@:native("DoActionShortcutDialog")
public static function doActionShortcutDialog(hWnd: Hwnd, section: KbdSectionInfo, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * updates preference for docker window ident_str to be in dock whichDock on
 * next open
 */
@:native("Dock_UpdateDockID")
public static function dockUpdateDockId(identStr: String, wHicHDock: Int): Void;
/**
 * -1=not found, 0=bottom, 1=left, 2=top, 3=right, 4=floating
 */
@:native("DockGetPosition")
public static function dockGetPosition(wHicHDock: Int): Int;
/**
 * returns dock index that contains hwnd, or -1
 */
@:native("DockIsChildOfDock")
public static function dockIsChildOfDock(hWnd: Hwnd): Int;
/** No description available */
@:native("DockWindowActivate")
public static function dockWindowActivate(hWnd: Hwnd): Void;
/** No description available */
@:native("DockWindowAdd")
public static function dockWindowAdd(hWnd: Hwnd, name: String, pos: Int, alloWSHoW: Bool): Void;
/** No description available */
@:native("DockWindowAddEx")
public static function dockWindowAddEx(hWnd: Hwnd, name: String, identstr: String, alloWSHoW: Bool): Void;
/** No description available */
@:native("DockWindowRefresh")
public static function dockWindowRefresh(): Void;
/** No description available */
@:native("DockWindowRefreshForHWND")
public static function dockWindowRefreshForHwnd(hWnd: Hwnd): Void;
/** No description available */
@:native("DockWindowRemove")
public static function dockWindowRemove(hWnd: Hwnd): Void;
/**
 * Open the tempo/time signature marker editor dialog.
 */
@:native("EditTempoTimeSigMarker")
public static function editTempoTimeSigMarker(project: ReaProject, markerindeX: Int): Bool;
/**
 * call with a saved window rect for your window and it'll correct any
 * positioning info.
 */
@:native("EnsureNotCompletelyOffscreen")
public static function ensureNotCompletelyOffscreen(integerrLeft: Dynamic, integerrTop: Dynamic, integerrRigHt: Dynamic, integerrBot: Dynamic): IntegerrLeft;
/**
 * List the files in the "path" directory. Returns NULL/nil when all files have
 * been listed. Use fileindex = -1 to force re-read of directory (invalidate
 * cache). See EnumerateSubdirectories
 */
@:native("EnumerateFiles")
public static function enumerateFiles(patH: String, fileindeX: Int): String;
/**
 * List the subdirectories in the "path" directory. Use subdirindex = -1 to
 * force re-read of directory (invalidate cache). Returns NULL/nil when all
 * subdirectories have been listed. See EnumerateFiles
 */
@:native("EnumerateSubdirectories")
public static function enumerateSubdirectories(patH: String, subDirindeX: Int): String;
/**
 * Enumerates installed FX. Returns true if successful, sets nameOut and
 * identOut to name and ident of FX at index. In REAPER 7.42+, use index=-1 to
 * re-read JSFX info.
 */
@:native("EnumInstalledFX")
public static function enumInstalledFx(indeX: Int): Bool;
/**
 * Start querying modes at 0, returns FALSE when no more modes possible, sets
 * strOut to NULL if a mode is currently unsupported
 */
@:native("EnumPitchShiftModes")
public static function enumPitchShiftModes(mode: Int): Bool;
/**
 * Returns submode name, or NULL
 */
@:native("EnumPitchShiftSubModes")
public static function enumPitchShiftSubModes(mode: Int, submode: Int): String;
/** No description available */
@:native("EnumProjectMarkers")
public static function enumProjectMarkers(idX: Int): Int;
/** No description available */
@:native("EnumProjectMarkers2")
public static function enumProjectMarkers2(proj: ReaProject, idX: Int): Int;
/** No description available */
@:native("EnumProjectMarkers3")
public static function enumProjectMarkers3(proj: ReaProject, idX: Int): Int;
/**
 * idx=-1 for current project,projfn can be NULL if not interested in filename.
 * use idx 0x40000000 for currently rendering project, if any.
 */
@:native("EnumProjects")
public static function enumProjects(idX: Int): ReaProject;
/**
 * Enumerate the data stored with the project for a specific extname. Returns
 * false when there is no more data. See SetProjExtState, GetProjExtState.
 */
@:native("EnumProjExtState")
public static function enumProjExtState(proj: ReaProject, eXtName: String, idX: Int): Bool;
/**
 * Enumerate which tracks will be rendered within this region when using the
 * region render matrix. When called with rendertrack==0, the function returns
 * the first track that will be rendered (which may be the master track);
 * rendertrack==1 will return the next track rendered, and so on. The function
 * returns NULL when there are no more tracks that will be rendered within this
 * region.
 */
@:native("EnumRegionRenderMatrix")
public static function enumRegionRenderMatrix(proj: ReaProject, regionindeX: Int, rendertrack: Int): MediaTrack;
/**
 * returns false if there are no plugins on the track that support MIDI
 * programs,or if all programs have been enumerated
 */
@:native("EnumTrackMIDIProgramNames")
public static function enumTrackMidiProgramNames(track: Int, programNumber: Int, programName: String): Bool;
/**
 * returns false if there are no plugins on the track that support MIDI
 * programs,or if all programs have been enumerated
 */
@:native("EnumTrackMIDIProgramNamesEx")
public static function enumTrackMidiProgramNamesEx(proj: ReaProject, track: MediaTrack, programNumber: Int, programName: String): Bool;
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
 * Formats the value of an envelope to a user-readable form
 */
@:native("Envelope_FormatValue")
public static function envelopeFormatValue(env: TrackEnvelope, value: Float): String;
/**
 * If take envelope, gets the take from the envelope. If FX, indexOut set to FX
 * index, index2Out set to parameter index, otherwise -1.
 */
@:native("Envelope_GetParentTake")
public static function envelopeGetParentTake(env: TrackEnvelope): MediaItemTake;
/**
 * If track envelope, gets the track from the envelope. If FX, indexOut set to
 * FX index, index2Out set to parameter index, otherwise -1.
 */
@:native("Envelope_GetParentTrack")
public static function envelopeGetParentTrack(env: TrackEnvelope): MediaTrack;
/**
 * Sort envelope points by time. See SetEnvelopePoint, InsertEnvelopePoint.
 */
@:native("Envelope_SortPoints")
public static function envelopeSortPoints(envelope: TrackEnvelope): Bool;
/**
 * Sort envelope points by time. autoitem_idx=-1 for the underlying envelope, 0
 * for the first automation item on the envelope, etc. See SetEnvelopePoint,
 * InsertEnvelopePoint.
 */
@:native("Envelope_SortPointsEx")
public static function envelopeSortPointsEx(envelope: TrackEnvelope, autoitemIdX: Int): Bool;
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
 * returns true if path points to a valid, readable file
 */
@:native("file_exists")
public static function fileExists(patH: String): Bool;
/**
 * Find the tempo/time signature marker that falls at or before this time
 * position (the marker that is in effect as of this time position).
 */
@:native("FindTempoTimeSigMarker")
public static function findTempoTimeSigMarker(project: ReaProject, time: Float): Int;
/**
 * Format tpos (which is time in seconds) as hh:mm:ss.sss. See
 * format_timestr_pos, format_timestr_len.
 */
@:native("format_timestr")
public static function formatTimestr(tPos: Float, buf: String): String;
/**
 * time formatting mode overrides: -1=proj default.
0=time
1=measures.beats +
 * time
2=measures.beats
3=seconds
4=samples
5=h:m:s:f
offset is start of where
 * the length will be calculated from
 */
@:native("format_timestr_len")
public static function formatTimestrLen(tPos: Float, buf: String, offSet: Float, modeoverrIde: Int): String;
/**
 * time formatting mode overrides: -1=proj default.
0=time
1=measures.beats +
 * time
2=measures.beats
3=seconds
4=samples
5=h:m:s:f
 */
@:native("format_timestr_pos")
public static function formatTimestrPos(tPos: Float, buf: String, modeoverrIde: Int): String;
/** No description available */
@:native("genGuid")
public static function genGuid(gGuId: String): String;
/**
 * gets ini configuration variable value as string
 */
@:native("get_config_var_string")
public static function getConfigVarString(name: String): Bool;
/**
 * Get reaper.ini full filename.
 */
@:native("get_ini_file")
public static function getIniFile(): String;
/**
 * Get the text description of a specific shortcut for the given command ID.
See
 * CountActionShortcuts,DeleteActionShortcut,DoActionShortcutDialog.
 */
@:native("GetActionShortcutDesc")
public static function getActionShortcutDesc(section: KbdSectionInfo, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * get the active take in this item
 */
@:native("GetActiveTake")
public static function getActiveTake(item: MediaItem): MediaItemTake;
/**
 * returns the bitwise OR of all project play states (1=playing, 2=pause,
 * 4=recording)
 */
@:native("GetAllProjectPlayStates")
public static function getAllProjectPlayStates(ignoreProject: ReaProject): Int;
/**
 * Returns app version which may include an OS/arch signifier, such as: "6.17"
 * (windows 32-bit), "6.17/x64" (windows 64-bit), "6.17/OSX64" (macOS 64-bit
 * Intel), "6.17/OSX" (macOS 32-bit), "6.17/macOS-arm64", "6.17/linux-x86_64",
 * "6.17/linux-i686", "6.17/linux-aarch64", "6.17/linux-armv7l", etc
 */
@:native("GetAppVersion")
public static function getAppVersion(): String;
/**
 * gets the currently armed command and section name (returns 0 if nothing
 * armed). section name is empty-string for main section.
 */
@:native("GetArmedCommand")
public static function getArmedCommand(): Int;
/**
 * Get the end time of the audio that can be returned from this accessor. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorSamples.
 */
@:native("GetAudioAccessorEndTime")
public static function getAudioAccessorEndTime(accessor: AudioAccessor): Float;
/**
 * Deprecated. See AudioAccessorStateChanged instead.
 */
@:native("GetAudioAccessorHash")
public static function getAudioAccessorHash(accessor: AudioAccessor, hashNeed128: String): String;
/**
 * Get a block of samples from the audio accessor. Samples are extracted
 * immediately pre-FX, and returned interleaved (first sample of first channel,
 * first sample of second channel...). Returns 0 if no audio, 1 if audio, -1 on
 * error. See CreateTakeAudioAccessor, CreateTrackAudioAccessor,
 * DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime,
 * GetAudioAccessorEndTime.
This function has special handling in Python, and
 * only returns two objects, the API function return value, and the sample
 * buffer. Example usage:
 */
@:native("GetAudioAccessorSamples")
public static function getAudioAccessorSamples(accessor: AudioAccessor, sampleRate: Int, numcHannels: Int, startTimeSec: Float, numsamplespercHannel: Int, samplebuffer: ReaperArray): Int;
/**
 * Get the start time of the audio that can be returned from this accessor. See
 * CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor,
 * AudioAccessorStateChanged, GetAudioAccessorEndTime, GetAudioAccessorSamples.
 */
@:native("GetAudioAccessorStartTime")
public static function getAudioAccessorStartTime(accessor: AudioAccessor): Float;
/**
 * get information about the currently open audio device. attribute can be MODE,
 * IDENT_IN, IDENT_OUT, BSIZE, SRATE, BPS. returns false if unknown attribute or
 * device not open.
 */
@:native("GetAudioDeviceInfo")
public static function getAudioDeviceInfo(attribute: String): Bool;
/**
 * gets the dock ID desired by ident_str, if any
 */
@:native("GetConfigWantsDock")
public static function getConfigWantsDock(identStr: String): Int;
/**
 * returns current project if in load/save (usually only used from
 * project_config_extension_t)
 */
@:native("GetCurrentProjectInLoadSave")
public static function getCurrentProjectInLoadSave(): ReaProject;
/**
 * return the current cursor context: 0 if track panels, 1 if items, 2 if
 * envelopes, otherwise unknown
 */
@:native("GetCursorContext")
public static function getCursorContext(): Int;
/**
 * 0 if track panels, 1 if items, 2 if envelopes, otherwise unknown (unlikely
 * when want_last_valid is true)
 */
@:native("GetCursorContext2")
public static function getCursorContext2(wantLastValId: Bool): Int;
/**
 * edit cursor position
 */
@:native("GetCursorPosition")
public static function getCursorPosition(): Float;
/**
 * edit cursor position
 */
@:native("GetCursorPositionEx")
public static function getCursorPositionEx(proj: ReaProject): Float;
/**
 * see GetDisplayedMediaItemColor2.
 */
@:native("GetDisplayedMediaItemColor")
public static function getDisplayedMediaItemColor(item: MediaItem): Int;
/**
 * Returns the custom take, item, or track color that is used (according to the
 * user preference) to color the media item. The returned color is OS
 * dependent|0x01000000 (i.e. ColorToNative(r,g,b)|0x01000000), so a return of
 * zero means "no color", not black.
 */
@:native("GetDisplayedMediaItemColor2")
public static function getDisplayedMediaItemColor2(item: MediaItem, take: MediaItemTake): Int;
/**
 * Gets an envelope numerical-value attribute:
I_TCPY : int : Y offset of
 * envelope relative to parent track (may be separate lane or overlap with track
 * contents)
I_TCPH : int : visible height of envelope
I_TCPY_USED : int : Y
 * offset of envelope relative to parent track, exclusive of padding
I_TCPH_USED
 * : int : visible height of envelope, exclusive of padding
P_TRACK : MediaTrack
 * * : parent track pointer (if any)
P_DESTTRACK : MediaTrack * : destination
 * track pointer, if on a send
P_ITEM : MediaItem * : parent item pointer (if
 * any)
P_TAKE : MediaItem_Take * : parent take pointer (if any)
I_SEND_IDX :
 * int : 1-based index of send in P_TRACK, or 0 if not a send
I_HWOUT_IDX : int
 * : 1-based index of hardware output in P_TRACK or 0 if not a hardware
 * output
I_RECV_IDX : int : 1-based index of receive in P_DESTTRACK or 0 if not
 * a send/receive
 */
@:native("GetEnvelopeInfo_Value")
public static function getEnvelopeInfoValue(env: TrackEnvelope, pArmName: String): Float;
/** No description available */
@:native("GetEnvelopeName")
public static function getEnvelopeName(env: TrackEnvelope): Bool;
/**
 * Get the attributes of an envelope point. See GetEnvelopePointEx.
 */
@:native("GetEnvelopePoint")
public static function getEnvelopePoint(envelope: TrackEnvelope, ptIdX: Int): Bool;
/**
 * Returns the envelope point at or immediately prior to the given time
 * position. See GetEnvelopePointByTimeEx.
 */
@:native("GetEnvelopePointByTime")
public static function getEnvelopePointByTime(envelope: TrackEnvelope, time: Float): Int;
/**
 * Returns the envelope point at or immediately prior to the given time
 * position.
autoitem_idx=-1 for the underlying envelope, 0 for the first
 * automation item on the envelope, etc.
For automation items, pass
 * autoitem_idx|0x10000000 to base ptidx on the number of points in one full
 * loop iteration,
even if the automation item is trimmed so that not all points
 * are visible.
Otherwise, ptidx will be based on the number of visible points
 * in the automation item, including all loop iterations.
See
 * GetEnvelopePointEx, SetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("GetEnvelopePointByTimeEx")
public static function getEnvelopePointByTimeEx(envelope: TrackEnvelope, autoitemIdX: Int, time: Float): Int;
/**
 * Get the attributes of an envelope point.
autoitem_idx=-1 for the underlying
 * envelope, 0 for the first automation item on the envelope, etc.
For
 * automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of
 * points in one full loop iteration,
even if the automation item is trimmed so
 * that not all points are visible.
Otherwise, ptidx will be based on the number
 * of visible points in the automation item, including all loop iterations.
See
 * CountEnvelopePointsEx, SetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("GetEnvelopePointEx")
public static function getEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, ptIdX: Int): Bool;
/**
 * Returns the envelope scaling mode: 0=no scaling, 1=fader scaling. All API
 * functions deal with raw envelope point values, to convert raw from/to scaled
 * values see ScaleFromEnvelopeMode, ScaleToEnvelopeMode.
 */
@:native("GetEnvelopeScalingMode")
public static function getEnvelopeScalingMode(env: TrackEnvelope): Int;
/**
 * Gets the RPPXML state of an envelope, returns true if successful. Undo flag
 * is a performance/caching hint.
 */
@:native("GetEnvelopeStateChunk")
public static function getEnvelopeStateChunk(env: TrackEnvelope, str: String, isundo: Bool): Bool;
/**
 * gets information on the UI state of an envelope: returns &1 if
 * automation/modulation is playing back, &2 if automation is being actively
 * written, &4 if the envelope recently had an effective automation mode change
 */
@:native("GetEnvelopeUIState")
public static function getEnvelopeUiState(env: TrackEnvelope): Int;
/**
 * returns path of REAPER.exe (not including EXE), i.e. C:\Program Files\REAPER
 */
@:native("GetExePath")
public static function getExePath(): String;
/**
 * Get the extended state value for a specific section and key. See SetExtState,
 * DeleteExtState, HasExtState.
 */
@:native("GetExtState")
public static function getExtState(section: String, keY: String): String;
/**
 * This function is deprecated (returns GetFocusedFX2()&3), see
 * GetTouchedOrFocusedFX.
 */
@:native("GetFocusedFX")
public static function getFocusedFx(): Int;
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
 * returns free disk space in megabytes, pathIdx 0 for normal, 1 for alternate.
 */
@:native("GetFreeDiskSpaceForRecordPath")
public static function getFreeDiskSpaceForRecordPath(proj: ReaProject, patHIdX: Int): Int;
/**
 * Returns the FX parameter envelope. If the envelope does not exist and
 * create=true, the envelope will be created. If the envelope already exists and
 * is bypassed and create=true, then the envelope will be unbypassed.
 */
@:native("GetFXEnvelope")
public static function getFxEnvelope(track: MediaTrack, fXindeX: Int, parameterindeX: Int, create: Bool): TrackEnvelope;
/**
 * return -1=no override, 0=trim/read, 1=read, 2=touch, 3=write, 4=latch,
 * 5=bypass
 */
@:native("GetGlobalAutomationOverride")
public static function getGlobalAutomationOverride(): Int;
/**
 * returns pixels/second
 */
@:native("GetHZoomLevel")
public static function getHzoomLevel(): Float;
/**
 * returns approximate input level if available, 0-511 mono inputs, |1024 for
 * stereo pairs, 4096+devidx*32 for MIDI devices
 */
@:native("GetInputActivityLevel")
public static function getInputActivityLevel(inputId: Int): Float;
/** No description available */
@:native("GetInputChannelName")
public static function getInputChannelName(cHannelIndeX: Int): String;
/**
 * Gets the audio device input/output latency in samples
 */
@:native("GetInputOutputLatency")
public static function getInputOutputLatency(): Int;
/**
 * returns time of relevant edit, set which_item to the pcm_source (if
 * applicable), flags (if specified) will be set to 1 for edge resizing, 2 for
 * fade change, 4 for item move, 8 for item slip edit (edit cursor time or start
 * of item)
 */
@:native("GetItemEditingTime2")
public static function getItemEditingTime2(): Float;
/**
 * Returns the first item at the screen coordinates specified. If allow_locked
 * is false, locked items are ignored. If takeOutOptional specified, returns the
 * take hit. See GetThingFromPoint.
 */
@:native("GetItemFromPoint")
public static function getItemFromPoint(screenX: Int, screenY: Int, alloWLocked: Bool): MediaItem;
/** No description available */
@:native("GetItemProjectContext")
public static function getItemProjectContext(item: MediaItem): ReaProject;
/**
 * Gets the RPPXML state of an item, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("GetItemStateChunk")
public static function getItemStateChunk(item: MediaItem, str: String, isundo: Bool): Bool;
/** No description available */
@:native("GetLastColorThemeFile")
public static function getLastColorThemeFile(): String;
/**
 * Get the last project marker before time, and/or the project region that
 * includes time. markeridx and regionidx are returned not necessarily as the
 * displayed marker/region index, but as the index that can be passed to
 * EnumProjectMarkers. Either or both of markeridx and regionidx may be NULL.
 * See EnumProjectMarkers.
 */
@:native("GetLastMarkerAndCurRegion")
public static function getLastMarkerAndCurRegion(proj: ReaProject, time: Float): Int;
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
/** No description available */
@:native("GetLastTouchedTrack")
public static function getLastTouchedTrack(): MediaTrack;
/** No description available */
@:native("GetMainHwnd")
public static function getMainHwnd(): Hwnd;
/**
 * &1=master mute,&2=master solo. This is deprecated as you can just query the
 * master track as well.
 */
@:native("GetMasterMuteSoloFlags")
public static function getMasterMuteSoloFlags(): Int;
/** No description available */
@:native("GetMasterTrack")
public static function getMasterTrack(proj: ReaProject): MediaTrack;
/**
 * returns &1 if the master track is visible in the TCP, &2 if NOT visible in
 * the mixer. See SetMasterTrackVisibility.
 */
@:native("GetMasterTrackVisibility")
public static function getMasterTrackVisibility(): Int;
/**
 * returns max dev for midi inputs/outputs
 */
@:native("GetMaxMidiInputs")
public static function getMaxMidiInputs(): Int;
/** No description available */
@:native("GetMaxMidiOutputs")
public static function getMaxMidiOutputs(): Int;
/**
 * Get text-based metadata from a media file for a given identifier. Call with
 * identifier="" to list all identifiers contained in the file, separated by
 * newlines. May return "[Binary data]" for metadata that REAPER doesn't handle.
 */
@:native("GetMediaFileMetadata")
public static function getMediaFileMetadata(mediaSource: PcmSource, identifier: String): Int;
/**
 * get an item from a project by item count (zero-based) (proj=0 for active
 * project)
 */
@:native("GetMediaItem")
public static function getMediaItem(proj: ReaProject, itemIdX: Int): MediaItem;
/**
 * Get parent track of media item
 */
@:native("GetMediaItem_Track")
public static function getMediaItemTrack(item: MediaItem): MediaTrack;
/**
 * Get media item numerical-value attributes.
B_MUTE : bool * : muted (item solo
 * overrides). setting this value will clear C_MUTE_SOLO.
B_MUTE_ACTUAL : bool *
 * : muted (ignores solo). setting this value will not affect
 * C_MUTE_SOLO.
C_LANEPLAYS : char * : on fixed lane tracks, 0=this item lane
 * does not play, 1=this item lane plays exclusively, 2=this item lane plays and
 * other lanes also play, -1=this item is on a non-visible, non-playing lane on
 * a formerly fixed-lane track (read-only)
C_MUTE_SOLO : char * : solo override
 * (-1=soloed, 0=no override, 1=unsoloed). note that this API does not
 * automatically unsolo other items when soloing (nor clear the unsolos when
 * clearing the last soloed item), it must be done by the caller via action or
 * via this API.
B_LOOPSRC : bool * : loop source
B_ALLTAKESPLAY : bool * : all
 * takes play
B_UISEL : bool * : selected in arrange view
C_BEATATTACHMODE :
 * char * : item timebase, -1=track or project default, 1=beats (position,
 * length, rate), 2=beats (position only). for auto-stretch timebase:
 * C_BEATATTACHMODE=1, C_AUTOSTRETCH=1
C_AUTOSTRETCH: : char * : auto-stretch at
 * project tempo changes, 1=enabled, requires C_BEATATTACHMODE=1
C_LOCK : char *
 * : locked, &1=locked
D_VOL : double * : item volume,  0=-inf, 0.5=-6dB,
 * 1=+0dB, 2=+6dB, etc
D_POSITION : double * : item position in seconds
D_LENGTH
 * : double * : item length in seconds
D_SNAPOFFSET : double * : item snap
 * offset in seconds
D_FADEINLEN : double * : item manual fadein length in
 * seconds
D_FADEOUTLEN : double * : item manual fadeout length in
 * seconds
D_FADEINDIR : double * : item fadein curvature, -1..1
D_FADEOUTDIR :
 * double * : item fadeout curvature, -1..1
D_FADEINLEN_AUTO : double * : item
 * auto-fadein length in seconds, -1=no auto-fadein
D_FADEOUTLEN_AUTO : double *
 * : item auto-fadeout length in seconds, -1=no auto-fadeout
C_FADEINSHAPE : int
 * * : fadein shape, 0..6, 0=linear
C_FADEOUTSHAPE : int * : fadeout shape,
 * 0..6, 0=linear
I_GROUPID : int * : group ID, 0=no group
I_LASTY : int * :
 * Y-position (relative to top of track) in pixels (read-only)
I_LASTH : int * :
 * height in pixels (read-only)
I_CUSTOMCOLOR : int * : custom color, OS
 * dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do
 * not |0x1000000, then it will not be used, but will store the color
I_CURTAKE
 * : int * : active take number
IP_ITEMNUMBER : int : item number on this track
 * (read-only, returns the item number directly)
F_FREEMODE_Y : float * : free
 * item positioning or fixed lane Y-position. 0=top of track, 1.0=bottom of
 * track
F_FREEMODE_H : float * : free item positioning or fixed lane height.
 * 0.5=half the track height, 1.0=full track height
I_FIXEDLANE : int * : fixed
 * lane of item (fine to call with setNewValue, but returned value is
 * read-only)
B_FIXEDLANE_HIDDEN : bool * : true if displaying only one fixed
 * lane and this item is in a different lane (read-only)
P_TRACK : MediaTrack *
 * : (read-only)
 */
@:native("GetMediaItemInfo_Value")
public static function getMediaItemInfoValue(item: MediaItem, pArmName: String): Float;
/** No description available */
@:native("GetMediaItemNumTakes")
public static function getMediaItemNumTakes(item: MediaItem): Int;
/** No description available */
@:native("GetMediaItemTake")
public static function getMediaItemTake(item: MediaItem, tk: Int): MediaItemTake;
/**
 * Get parent item of media item take
 */
@:native("GetMediaItemTake_Item")
public static function getMediaItemTakeItem(take: MediaItemTake): MediaItem;
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
 * Get media source of media item take
 */
@:native("GetMediaItemTake_Source")
public static function getMediaItemTakeSource(take: MediaItemTake): PcmSource;
/**
 * Get parent track of media item take
 */
@:native("GetMediaItemTake_Track")
public static function getMediaItemTakeTrack(take: MediaItemTake): MediaTrack;
/** No description available */
@:native("GetMediaItemTakeByGUID")
public static function getMediaItemTakeByGuid(project: ReaProject, guIdGuId: String): MediaItemTake;
/**
 * Get media item take numerical-value attributes.
D_STARTOFFS : double * :
 * start offset in source media, in seconds
D_VOL : double * : take volume,
 * 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc, negative if take polarity is
 * flipped
D_PAN : double * : take pan, -1..1
D_PANLAW : double * : take pan
 * law, -1=default, 0.5=-6dB, 1.0=+0dB, etc
D_PLAYRATE : double * : take
 * playback rate, 0.5=half speed, 1=normal, 2=double speed, etc
D_PITCH : double
 * * : take pitch adjustment in semitones, -12=one octave down, 0=normal,
 * +12=one octave up, etc
B_PPITCH : bool * : preserve pitch when changing
 * playback rate
I_LASTY : int * : Y-position (relative to top of track) in
 * pixels (read-only)
I_LASTH : int * : height in pixels (read-only)
I_CHANMODE
 * : int * : channel mode, 0=normal, 1=reverse stereo, 2=downmix, 3=left,
 * 4=right
I_PITCHMODE : int * : pitch shifter mode, -1=project default,
 * otherwise high 2 bytes=shifter, low 2 bytes=parameter
I_STRETCHFLAGS : int *
 * : stretch marker flags (&7 mask for mode override: 0=default, 1=balanced,
 * 2/3/6=tonal, 4=transient, 5=no pre-echo)
F_STRETCHFADESIZE : float * :
 * stretch marker fade size in seconds (0.0025 default)
I_RECPASSID : int * :
 * record pass ID
I_TAKEFX_NCH : int * : number of internal audio channels for
 * per-take FX to use (OK to call with setNewValue, but the returned value is
 * read-only)
I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000
 * (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will
 * not be used, but will store the color
IP_SPECEDIT:CNT : int : spectral edit
 * count (read-only)
IP_SPECEDIT:DELETE:x : int : read or write this key to
 * remove the spectral edit specified
IP_SPECEDIT:ADD : int : read or write this
 * key to add a new spectral edit (returns index)
IP_SPECEDIT:SORT : int : read
 * or write this key to re-sort spectral edits (be sure to do this following a
 * position change or insert of new edit)
I_SPECEDIT:FFT_SIZE : int * : FFT size
 * used by spectral edits for this take
D_SPECEDIT:x:POSITION : double * :
 * position of spectral edit start (changing this requires a resort of spectral
 * edits)
D_SPECEDIT:x:LENGTH : double * : length of spectral
 * edit
F_SPECEDIT:x:GAIN : float * : gain of spectral edit
F_SPECEDIT:x:FADE_IN
 * : float * : fade-in size 0..1
F_SPECEDIT:x:FADE_OUT : float * : fade-out size
 * 0..1
F_SPECEDIT:x:FADE_LOW : float * : fade-lf size 0..1
F_SPECEDIT:x:FADE_HI
 * : float * : fade-hf size 0..1
I_SPECEDIT:x:CHAN : int * : channel index, -1
 * for omni
I_SPECEDIT:x:FLAGS : int * : flags, &1=bypassed,
 * &2=solo
F_SPECEDIT:x:GATE_THRESH : float * : gate
 * threshold
F_SPECEDIT:x:GATE_FLOOR : float * : gate
 * floor
F_SPECEDIT:x:COMP_THRESH : float * : comp
 * threshold
F_SPECEDIT:x:COMP_RATIO : float * : comp
 * ratio
B_SPECEDIT:x:SELECTED : bool * : selection
 * state
I_SPECEDIT:x:TOPFREQ_CNT : int * : (read-only) number of top
 * frequency-points
I_SPECEDIT:x:TOPFREQ_ADD:pos:val : int * : reading or
 * writing will insert top frequency-point with position/value pair, returns
 * index
I_SPECEDIT:x:TOPFREQ_DEL:y : int * : reading or writing will delete top
 * frequency-point y. there will always be at least one
 * point.
F_SPECEDIT:x:TOPFREQ_POS:y : float * : (read-only) get position of top
 * frequency-point y
F_SPECEDIT:x:TOPFREQ_FREQ:y : float * : (read-only) get
 * frequency of top frequency-point y
I_SPECEDIT:x:BOTFREQ_CNT : int * : number
 * of bottom frequency-points
I_SPECEDIT:x:BOTFREQ_ADD:pos:val : int * : reading
 * or writing will insert bottom frequency-point with position/value pair,
 * returns index
I_SPECEDIT:x:BOTFREQ_DEL:y : int * : reading or writing will
 * delete bottom frequency-point y. there will always be at least one
 * point.
F_SPECEDIT:x:BOTFREQ_POS:y : float * : (read-only) get position of
 * bottom frequency-point y
F_SPECEDIT:x:BOTFREQ_FREQ:y : float * : (read-only)
 * get frequency of bottom frequency-point y
IP_TAKENUMBER : int : take number
 * (read-only, returns the take number directly)
P_TRACK : pointer to MediaTrack
 * (read-only)
P_ITEM : pointer to MediaItem (read-only)
P_SOURCE : PCM_source
 * *. Note that if setting this, you should first retrieve the old source, set
 * the new, THEN delete the old.
 */
@:native("GetMediaItemTakeInfo_Value")
public static function getMediaItemTakeInfoValue(take: MediaItemTake, pArmName: String): Float;
/** No description available */
@:native("GetMediaItemTrack")
public static function getMediaItemTrack(item: MediaItem): MediaTrack;
/**
 * Copies the media source filename to filenamebuf. Note that in-project MIDI
 * media sources have no associated filename. See GetMediaSourceParent.
 */
@:native("GetMediaSourceFileName")
public static function getMediaSourceFileName(source: PcmSource): String;
/**
 * Returns the length of the source media. If the media source is beat-based,
 * the length will be in quarter notes, otherwise it will be in seconds.
 */
@:native("GetMediaSourceLength")
public static function getMediaSourceLength(source: PcmSource): Float;
/**
 * Returns the number of channels in the source media.
 */
@:native("GetMediaSourceNumChannels")
public static function getMediaSourceNumChannels(source: PcmSource): Int;
/**
 * Returns the parent source, or NULL if src is the root source. This can be
 * used to retrieve the parent properties of sections or reversed sources for
 * example.
 */
@:native("GetMediaSourceParent")
public static function getMediaSourceParent(src: PcmSource): PcmSource;
/**
 * Returns the sample rate. MIDI source media will return zero.
 */
@:native("GetMediaSourceSampleRate")
public static function getMediaSourceSampleRate(source: PcmSource): Int;
/**
 * copies the media source type ("WAV", "MIDI", etc) to typebuf
 */
@:native("GetMediaSourceType")
public static function getMediaSourceType(source: PcmSource): String;
/**
 * Get track numerical-value attributes.
B_MUTE : bool * : muted
B_PHASE : bool
 * * : track phase inverted
B_RECMON_IN_EFFECT : bool * : record monitoring in
 * effect (current audio-thread playback state, read-only)
IP_TRACKNUMBER : int
 * : track number 1-based, 0=not found, -1=master track (read-only, returns the
 * int directly)
I_SOLO : int * : soloed, 0=not soloed, 1=soloed, 2=soloed in
 * place, 5=safe soloed, 6=safe soloed in place
B_SOLO_DEFEAT : bool * : when
 * set, if anything else is soloed and this track is not muted, this track acts
 * soloed
I_FXEN : int * : fx enabled, 0=bypassed, !0=fx active
I_RECARM : int *
 * : record armed, 0=not record armed, 1=record armed
I_RECINPUT : int * :
 * record input, <0=no input. if 4096 set, input is MIDI and low 5 bits
 * represent channel (0=all, 1-16=only chan), next 6 bits represent physical
 * input (63=all, 62=VKB). If 4096 is not set, low 10 bits (0..1023) are input
 * start channel (ReaRoute/Loopback start at 512). If 2048 is set, input is
 * multichannel input (using track channel count), or if 1024 is set, input is
 * stereo input, otherwise input is mono.
I_RECMODE : int * : record mode,
 * 0=input, 1=stereo out, 2=none, 3=stereo out w/latency compensation, 4=midi
 * output, 5=mono out, 6=mono out w/ latency compensation, 7=midi overdub,
 * 8=midi replace
I_RECMODE_FLAGS : int * : record mode flags, &3=output
 * recording mode (0=post fader, 1=pre-fx, 2=post-fx/pre-fader)
I_RECMON : int *
 * : record monitoring, 0=off, 1=normal, 2=not when playing (tape
 * style)
I_RECMONITEMS : int * : monitor items while recording, 0=off,
 * 1=on
B_AUTO_RECARM : bool * : automatically set record arm when selected
 * (does not immediately affect recarm state, script should set directly if
 * desired)
I_VUMODE : int * : track vu mode, &1:disabled, &30==0:stereo peaks,
 * &30==2:multichannel peaks, &30==4:stereo RMS, &30==8:combined RMS,
 * &30==12:LUFS-M, &30==16:LUFS-S (readout=max), &30==20:LUFS-S
 * (readout=current), &32:LUFS calculation on channels 1+2 only
I_AUTOMODE : int
 * * : track automation mode, 0=trim/off, 1=read, 2=touch, 3=write,
 * 4=latch
I_NCHAN : int * : number of track channels, 2-128, even numbers
 * only
I_SELECTED : int * : track selected, 0=unselected, 1=selected
I_WNDH :
 * int * : current TCP window height in pixels including envelopes
 * (read-only)
I_TCPH : int * : current TCP window height in pixels not
 * including envelopes (read-only)
I_TCPY : int * : current TCP window
 * Y-position in pixels relative to top of arrange view (read-only)
I_MCPX : int
 * * : current MCP X-position in pixels relative to mixer container
 * (read-only)
I_MCPY : int * : current MCP Y-position in pixels relative to
 * mixer container (read-only)
I_MCPW : int * : current MCP width in pixels
 * (read-only)
I_MCPH : int * : current MCP height in pixels
 * (read-only)
I_FOLDERDEPTH : int * : folder depth change, 0=normal, 1=track is
 * a folder parent, -1=track is the last in the innermost folder, -2=track is
 * the last in the innermost and next-innermost folders, etc
I_FOLDERCOMPACT :
 * int * : folder collapsed state (only valid on folders), 0=normal,
 * 1=collapsed, 2=fully collapsed
I_MIDIHWOUT : int * : track midi hardware
 * output index, <0=disabled, low 5 bits are which channels (0=all, 1-16), next
 * 5 bits are output device index (0-31)
I_MIDI_INPUT_CHANMAP : int * : -1 maps
 * to source channel, otherwise 1-16 to map to MIDI channel
I_MIDI_CTL_CHAN :
 * int * : -1 no link, 0-15 link to MIDI volume/pan on channel, 16 link to MIDI
 * volume/pan on all channels
I_MIDI_TRACKSEL_FLAG : int * : MIDI editor track
 * list options: &1=expand media items, &2=exclude from list,
 * &4=auto-pruned
I_PERFFLAGS : int * : track performance flags, &1=no media
 * buffering, &2=no anticipative FX
I_CUSTOMCOLOR : int * : custom color, OS
 * dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do
 * not |0x1000000, then it will not be used, but will store the
 * color
I_HEIGHTOVERRIDE : int * : custom height override for TCP window, 0 for
 * none, otherwise size in pixels
I_SPACER : int * : 1=TCP track spacer above
 * this trackB_HEIGHTLOCK : bool * : track height lock (must set
 * I_HEIGHTOVERRIDE before locking)
D_VOL : double * : trim volume of track,
 * 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
D_PAN : double * : trim pan of track,
 * -1..1
D_WIDTH : double * : width of track, -1..1
D_DUALPANL : double * :
 * dualpan position 1, -1..1, only if I_PANMODE==6
D_DUALPANR : double * :
 * dualpan position 2, -1..1, only if I_PANMODE==6
I_PANMODE : int * : pan mode,
 * 0=classic 3.x, 3=new balance, 5=stereo pan, 6=dual pan
D_PANLAW : double * :
 * pan law of track, <0=project default, 0.5=-6dB, 0.707..=-3dB, 1=+0dB,
 * 1.414..=-3dB with gain compensation, 2=-6dB with gain compensation,
 * etc
I_PANLAW_FLAGS : int * : pan law flags, 0=sine taper, 1=hybrid taper with
 * deprecated behavior when gain compensation enabled, 2=linear taper, 3=hybrid
 * taper
P_ENV:<envchunkname or P_ENV:{GUID... : TrackEnvelope * : (read-only)
 * chunkname can be <VOLENV, <PANENV, etc; GUID is the stringified envelope
 * GUID.
B_SHOWINMIXER : bool * : track control panel visible in mixer (do not
 * use on master track)
B_SHOWINTCP : bool * : track control panel visible in
 * arrange view (do not use on master track)
B_MAINSEND : bool * : track sends
 * audio to parent
C_MAINSEND_OFFS : char * : channel offset of track send to
 * parent
C_MAINSEND_NCH : char * : channel count of track send to parent (0=use
 * all child track channels, 1=use one channel only)
I_FREEZECOUNT : int * :
 * (read-only) freeze state count
I_FREEMODE : int * : 1=track free item
 * positioning enabled, 2=track fixed lanes enabled (call UpdateTimeline() after
 * changing)
I_NUMFIXEDLANES : int * : number of track fixed lanes (fine to call
 * with setNewValue, but returned value is read-only)
C_LANESCOLLAPSED : char *
 * : fixed lane collapse state (1=lanes collapsed, 2=track displays as
 * non-fixed-lanes but hidden lanes exist)
C_LANESETTINGS : char * : fixed lane
 * settings (&1=auto-remove empty lanes at bottom, &2=do not auto-comp new
 * recording, &4=newly recorded lanes play exclusively (else add lanes in
 * layers), &8=big lanes (else small lanes), &16=add new recording at bottom
 * (else record into first available lane), &32=hide lane buttons
C_LANEPLAYS:N
 * : char * :  on fixed lane tracks, 0=lane N does not play, 1=lane N plays
 * exclusively, 2=lane N plays and other lanes also play (fine to call with
 * setNewValue, but returned value is read-only)
C_ALLLANESPLAY : char * : on
 * fixed lane tracks, 0=no lanes play, 1=all lanes play, 2=some lanes play (fine
 * to call with setNewValue 0 or 1, but returned value is
 * read-only)
C_BEATATTACHMODE : char * : track timebase, -1=project default,
 * 0=time, 1=beats (position, length, rate), 2=beats (position
 * only)
F_MCP_FXSEND_SCALE : float * : scale of fx+send area in MCP (0=minimum
 * allowed, 1=maximum allowed)
F_MCP_FXPARM_SCALE : float * : scale of fx
 * parameter area in MCP (0=minimum allowed, 1=maximum
 * allowed)
F_MCP_SENDRGN_SCALE : float * : scale of send area as proportion of
 * the fx+send total area (0=minimum allowed, 1=maximum
 * allowed)
F_TCP_FXPARM_SCALE : float * : scale of TCP parameter area when TCP
 * FX are embedded (0=min allowed, default, 1=max allowed)
I_PLAY_OFFSET_FLAG :
 * int * : track media playback offset state, &1=bypassed, &2=offset value is
 * measured in samples (otherwise measured in seconds)
D_PLAY_OFFSET : double *
 * : track media playback offset, units depend on I_PLAY_OFFSET_FLAG
P_PARTRACK
 * : MediaTrack * : parent track (read-only)
P_PROJECT : ReaProject * : parent
 * project (read-only)
 */
@:native("GetMediaTrackInfo_Value")
public static function getMediaTrackInfoValue(tr: MediaTrack, pArmName: String): Float;
/**
 * returns true if device present
 */
@:native("GetMIDIInputName")
public static function getMidiInputName(dev: Int, nameout: String): Bool;
/**
 * returns true if device present
 */
@:native("GetMIDIOutputName")
public static function getMidiOutputName(dev: Int, nameout: String): Bool;
/**
 * Get the leftmost track visible in the mixer
 */
@:native("GetMixerScroll")
public static function getMixerScroll(): MediaTrack;
/**
 * Get the current mouse modifier assignment for a specific modifier key
 * assignment, in a specific context.
action will be filled in with the command
 * ID number for a built-in mouse modifier
or built-in REAPER command ID, or the
 * custom action ID string.
Note: the action string may have a space and 'c' or
 * 'm' appended to it to specify command ID vs mouse modifier ID.
See
 * SetMouseModifier for more information.
 */
@:native("GetMouseModifier")
public static function getMouseModifier(conteXt: String, modifierFlag: Int): String;
/**
 * get mouse position in screen coordinates
 */
@:native("GetMousePosition")
public static function getMousePosition(): Int;
/**
 * Return number of normal audio hardware inputs available
 */
@:native("GetNumAudioInputs")
public static function getNumAudioInputs(): Int;
/**
 * Return number of normal audio hardware outputs available
 */
@:native("GetNumAudioOutputs")
public static function getNumAudioOutputs(): Int;
/**
 * returns max number of real midi hardware inputs
 */
@:native("GetNumMIDIInputs")
public static function getNumMidiInputs(): Int;
/**
 * returns max number of real midi hardware outputs
 */
@:native("GetNumMIDIOutputs")
public static function getNumMidiOutputs(): Int;
/**
 * Returns number of take markers. See GetTakeMarker, SetTakeMarker,
 * DeleteTakeMarker
 */
@:native("GetNumTakeMarkers")
public static function getNumTakeMarkers(take: MediaItemTake): Int;
/**
 * Returns number of tracks in current project, see CountTracks()
 */
@:native("GetNumTracks")
public static function getNumTracks(): Int;
/**
 * Returns "Win32", "Win64", "OSX32", "OSX64", "macOS-arm64", or "Other".
 */
@:native("GetOS")
public static function getOs(): String;
/** No description available */
@:native("GetOutputChannelName")
public static function getOutputChannelName(cHannelIndeX: Int): String;
/**
 * returns output latency in seconds
 */
@:native("GetOutputLatency")
public static function getOutputLatency(): Float;
/** No description available */
@:native("GetParentTrack")
public static function getParentTrack(track: MediaTrack): MediaTrack;
/**
 * get the peak file name for a given file (can be either filename.reapeaks,or a
 * hashed filename in another path)
 */
@:native("GetPeakFileName")
public static function getPeakFileName(fn: String): String;
/**
 * get the peak file name for a given file (can be either filename.reapeaks,or a
 * hashed filename in another path)
 */
@:native("GetPeakFileNameEx")
public static function getPeakFileNameEx(fn: String, buf: String, forWrite: Bool): String;
/**
 * Like GetPeakFileNameEx, but you can specify peaksfileextension such as
 * ".reapeaks"
 */
@:native("GetPeakFileNameEx2")
public static function getPeakFileNameEx2(fn: String, buf: String, forWrite: Bool, peaksfileeXtension: String): String;
/**
 * returns latency-compensated actual-what-you-hear position
 */
@:native("GetPlayPosition")
public static function getPlayPosition(): Float;
/**
 * returns position of next audio block being processed
 */
@:native("GetPlayPosition2")
public static function getPlayPosition2(): Float;
/**
 * returns position of next audio block being processed
 */
@:native("GetPlayPosition2Ex")
public static function getPlayPosition2Ex(proj: ReaProject): Float;
/**
 * returns latency-compensated actual-what-you-hear position
 */
@:native("GetPlayPositionEx")
public static function getPlayPositionEx(proj: ReaProject): Float;
/**
 * &1=playing, &2=paused, &4=is recording
 */
@:native("GetPlayState")
public static function getPlayState(): Int;
/**
 * &1=playing, &2=paused, &4=is recording
 */
@:native("GetPlayStateEx")
public static function getPlayStateEx(proj: ReaProject): Int;
/**
 * returns length of project (maximum of end of media item, markers, end of
 * regions, tempo map
 */
@:native("GetProjectLength")
public static function getProjectLength(proj: ReaProject): Float;
/** No description available */
@:native("GetProjectName")
public static function getProjectName(proj: ReaProject): String;
/**
 * Get the project recording path.
 */
@:native("GetProjectPath")
public static function getProjectPath(): String;
/**
 * Get the project recording path.
 */
@:native("GetProjectPathEx")
public static function getProjectPathEx(proj: ReaProject): String;
/**
 * returns an integer that changes when the project state changes
 */
@:native("GetProjectStateChangeCount")
public static function getProjectStateChangeCount(proj: ReaProject): Int;
/**
 * Gets project time offset in seconds (project settings - project start time).
 * If rndframe is true, the offset is rounded to a multiple of the project frame
 * size.
 */
@:native("GetProjectTimeOffset")
public static function getProjectTimeOffset(proj: ReaProject, rndframe: Bool): Float;
/**
 * deprecated
 */
@:native("GetProjectTimeSignature")
public static function getProjectTimeSignature(): Float;
/**
 * Gets basic time signature (beats per minute, numerator of time signature in
 * bpi)
this does not reflect tempo envelopes but is purely what is set in the
 * project settings.
 */
@:native("GetProjectTimeSignature2")
public static function getProjectTimeSignature2(proj: ReaProject): Float;
/**
 * Get the value previously associated with this extname and key, the last time
 * the project was saved. See SetProjExtState, EnumProjExtState.
 */
@:native("GetProjExtState")
public static function getProjExtState(proj: ReaProject, eXtName: String, keY: String): Int;
/**
 * returns path where ini files are stored, other things are in subdirectories.
 */
@:native("GetResourcePath")
public static function getResourcePath(): String;
/**
 * get the currently selected envelope, returns NULL/nil if no envelope is
 * selected
 */
@:native("GetSelectedEnvelope")
public static function getSelectedEnvelope(proj: ReaProject): TrackEnvelope;
/**
 * Discouraged, because GetSelectedMediaItem can be inefficient if media items
 * are added, rearranged, or deleted in between calls. Instead see
 * CountMediaItems, GetMediaItem, IsMediaItemSelected.
 */
@:native("GetSelectedMediaItem")
public static function getSelectedMediaItem(proj: ReaProject, selitem: Int): MediaItem;
/**
 * Get a selected track from a project (proj=0 for active project) by selected
 * track count (zero-based). This function ignores the master track, see
 * GetSelectedTrack2.
 */
@:native("GetSelectedTrack")
public static function getSelectedTrack(proj: ReaProject, seltrackIdX: Int): MediaTrack;
/**
 * Get a selected track from a project (proj=0 for active project) by selected
 * track count (zero-based).
 */
@:native("GetSelectedTrack2")
public static function getSelectedTrack2(proj: ReaProject, seltrackIdX: Int, wantMaster: Bool): MediaTrack;
/**
 * get the currently selected track envelope, returns NULL/nil if no envelope is
 * selected
 */
@:native("GetSelectedTrackEnvelope")
public static function getSelectedTrackEnvelope(proj: ReaProject): TrackEnvelope;
/**
 * Gets or sets the arrange view start/end time for screen coordinates. use
 * screen_x_start=screen_x_end=0 to use the full arrange view's start/end time
 */
@:native("GetSet_ArrangeView2")
public static function getSetArrangeView2(proj: ReaProject, isSet: Bool, screenXStart: Int, screenXEnd: Int, startTime: Float, endTime: Float): Float;
/** No description available */
@:native("GetSet_LoopTimeRange")
public static function getSetLoopTimeRange(isSet: Bool, isLoop: Bool, start: Float, end: Float, alloWautoseek: Bool): Float;
/** No description available */
@:native("GetSet_LoopTimeRange2")
public static function getSetLoopTimeRange2(proj: ReaProject, isSet: Bool, isLoop: Bool, start: Float, end: Float, alloWautoseek: Bool): Float;
/**
 * Get or set automation item information. autoitem_idx=0 for the first
 * automation item on an envelope, 1 for the second item, etc. desc can be any
 * of the following:
D_POOL_ID : double * : automation item pool ID (as an
 * integer); edits are propagated to all other automation items that share a
 * pool ID
D_POSITION : double * : automation item timeline position in
 * seconds
D_LENGTH : double * : automation item length in seconds
D_STARTOFFS :
 * double * : automation item start offset in seconds
D_PLAYRATE : double * :
 * automation item playback rate
D_BASELINE : double * : automation item
 * baseline value in the range [0,1]
D_AMPLITUDE : double * : automation item
 * amplitude in the range [-1,1]
D_LOOPSRC : double * : nonzero if the
 * automation item contents are looped
D_UISEL : double * : nonzero if the
 * automation item is selected in the arrange view
D_POOL_QNLEN : double * :
 * automation item pooled source length in quarter notes (setting will affect
 * all pooled instances)
 */
@:native("GetSetAutomationItemInfo")
public static function getSetAutomationItemInfo(env: TrackEnvelope, autoitemIdX: Int, desc: String, value: Float, isSet: Bool): Float;
/**
 * Get or set automation item information. autoitem_idx=0 for the first
 * automation item on an envelope, 1 for the second item, etc. returns true on
 * success. desc can be any of the following:
P_POOL_NAME : char * : name of the
 * underlying automation item pool
P_POOL_EXT:xyz : char * : extension-specific
 * persistent data
 */
@:native("GetSetAutomationItemInfo_String")
public static function getSetAutomationItemInfoString(env: TrackEnvelope, autoitemIdX: Int, desc: String, valuestrNeedBig: String, isSet: Bool): Bool;
/**
 * Gets/sets an attribute string:
ACTIVE : active state (bool as a string "0" or
 * "1")
ARM : armed state (bool...)
VISIBLE : visible state (bool...)
SHOWLANE :
 * show envelope in separate lane (bool...)
GUID : (read-only) GUID as a string
 * {xyz-....}
P_EXT:xyz : extension-specific persistent data
Note that when
 * writing some of these attributes you will need to manually update the arrange
 * and/or track panels, see TrackList_AdjustWindows
 */
@:native("GetSetEnvelopeInfo_String")
public static function getSetEnvelopeInfoString(env: TrackEnvelope, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * deprecated -- see SetEnvelopeStateChunk, GetEnvelopeStateChunk
 */
@:native("GetSetEnvelopeState")
public static function getSetEnvelopeState(env: TrackEnvelope, str: String): Bool;
/**
 * deprecated -- see SetEnvelopeStateChunk, GetEnvelopeStateChunk
 */
@:native("GetSetEnvelopeState2")
public static function getSetEnvelopeState2(env: TrackEnvelope, str: String, isundo: Bool): Bool;
/**
 * deprecated -- see SetItemStateChunk, GetItemStateChunk
 */
@:native("GetSetItemState")
public static function getSetItemState(item: MediaItem, str: String): Bool;
/**
 * deprecated -- see SetItemStateChunk, GetItemStateChunk
 */
@:native("GetSetItemState2")
public static function getSetItemState2(item: MediaItem, str: String, isundo: Bool): Bool;
/**
 * Gets/sets an item attribute string:
P_NOTES : char * : item note text (do not
 * write to returned pointer, use setNewValue to update)
P_EXT:xyz : char * :
 * extension-specific persistent data
GUID : GUID * : 16-byte GUID, can query or
 * update. If using a _String() function, GUID is a string {xyz-...}.
 */
@:native("GetSetMediaItemInfo_String")
public static function getSetMediaItemInfoString(item: MediaItem, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * Gets/sets a take attribute string:
P_NAME : char * : take name
P_EXT:xyz :
 * char * : extension-specific persistent data
GUID : GUID * : 16-byte GUID, can
 * query or update. If using a _String() function, GUID is a string {xyz-...}.
 */
@:native("GetSetMediaItemTakeInfo_String")
public static function getSetMediaItemTakeInfoString(tk: MediaItemTake, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * Get or set track string attributes.
P_NAME : char * : track name (on master
 * returns NULL)
P_ICON : const char * : track icon (full filename, or relative
 * to resource_path/data/track_icons)
P_LANENAME:n : char * : lane name (returns
 * NULL for non-fixed-lane-tracks)
P_MCP_LAYOUT : const char * : layout
 * name
P_RAZOREDITS : const char * : list of razor edit areas, as
 * space-separated triples of start time, end time, and envelope GUID string.
 
 * Example: "0.0 1.0 \"\" 0.0 1.0 "{xyz-...}"
P_RAZOREDITS_EXT : const char * :
 * list of razor edit areas, as comma-separated sets of space-separated tuples
 * of start time, end time, optional: envelope GUID string, fixed/fipm top
 * y-position, fixed/fipm bottom y-position.
  Example: "0.0 1.0,0.0 1.0
 * "{xyz-...}",1.0 2.0 "" 0.25 0.75"
P_TCP_LAYOUT : const char * : layout
 * name
P_EXT:xyz : char * : extension-specific persistent
 * data
P_UI_RECT:tcp.mute : char * : read-only, allows querying screen position
 * + size of track WALTER elements (tcp.size queries screen position and size of
 * entire TCP, etc).
GUID : GUID * : 16-byte GUID, can query or update. If using
 * a _String() function, GUID is a string {xyz-...}.
 */
@:native("GetSetMediaTrackInfo_String")
public static function getSetMediaTrackInfoString(tr: MediaTrack, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * deprecated, see GetSetProjectInfo_String with desc="PROJECT_AUTHOR"
 */
@:native("GetSetProjectAuthor")
public static function getSetProjectAuthor(proj: ReaProject, set: Bool, autHor: String): String;
/**
 * Get or set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half
 * note triplet, etc. swingmode can be 1 for swing enabled, swingamt is -1..1.
 * swingmode can be 3 for measure-grid. Returns grid configuration flags
 */
@:native("GetSetProjectGrid")
public static function getSetProjectGrid(project: ReaProject, set: Bool, ?division: Float, ?sWingmode: Int, ?sWingamt: Float): Int;
/**
 * Get or set project information.
RENDER_SETTINGS : (&(1|2)==0)=master mix,
 * &1=stems+master mix, &2=stems only, &4=multichannel tracks to multichannel
 * files, &8=use render matrix, &16=tracks with only mono media to mono files,
 * &32=selected media items, &64=selected media items via master, &128=selected
 * tracks via master, &256=embed transients if format supports, &512=embed
 * metadata if format supports, &1024=embed take markers if format supports,
 * &2048=2nd pass render, &4096=render razor edits, &8192=pre-fader stems (not
 * if via master), &16384=only stem channels sent to parent, &32768=preserve
 * source metadata if possible, &(1<<16)=preserve source start offset if
 * possible, &(2<<16)=preserve source media sample rate if possible, &(4<<16)=if
 * rendering selected items or razor edits, render as a single file,
 * &(8<<16)=parallel render via master, &(16<<16)=delay render start to allow FX
 * to initialize and load samples
RENDER_BOUNDSFLAG : 0=custom time bounds,
 * 1=entire project, 2=time selection, 3=all project regions, 4=selected media
 * items, 5=selected project regions, 6=all project markers, 7=selected project
 * markers
RENDER_CHANNELS : number of channels in rendered file
RENDER_SRATE :
 * sample rate of rendered file (or 0 for project sample rate)
RENDER_STARTPOS :
 * render start time when RENDER_BOUNDSFLAG=0
RENDER_ENDPOS : render end time
 * when RENDER_BOUNDSFLAG=0
RENDER_TAILFLAG : apply render tail setting when
 * rendering: &1=custom time bounds, &2=entire project, &4=time selection,
 * &8=all project markers/regions, &16=selected media items, &32=selected
 * project markers/regions
RENDER_TAILMS : tail length in ms to render (only
 * used if RENDER_BOUNDSFLAG and RENDER_TAILFLAG are set)
RENDER_ADDTOPROJ :
 * &1=add rendered files to project, &2=do not render files that are likely
 * silent
RENDER_DITHER : &1=dither, &2=noise shaping, &4=dither stems, &8=noise
 * shaping on stems, &16=disable all
RENDER_NORMALIZE: &1=enable normalization,
 * (&14==0)=LUFS-I, (&14==2)=RMS, (&14==4)=peak, (&14==6)=true peak,
 * (&14==8)=LUFS-M max, (&14==10)=LUFS-S max, &16=adjust mono media -3dB,
 * &(16|(8<<16))=adjust mono media +3dB, (&(32|4096|(16<<16))==32)=normalize as
 * if files play together, (&(32|4096|(16<<16))==4096)=normalize to loudest
 * file, (&(32|4096|(16<<16))==(32|4096))=normalize as if files play together
 * (common gain), (&(32|4096|(16<<16))==(16<<16))=normalize to master mix,
 * &64=enable brickwall limit, &128=brickwall limit true peak,
 * (&(256|2048)==256)=only normalize files that are too loud,
 * (&(256|2048)==2048)=only normalize files that are too quiet, &512=apply
 * fade-in, &1024=apply fade-out, &16384=trim starting silence, &32768=trim
 * ending silence, &(1<<16)=pad start with silence, &(2<<16)=pad end with
 * silence, &(4<<16)=disable all render postprocessing,
 * (&((32<<16)|(64<<16))==(32<<16))=limit as if files play together,
 * (&((32<<16)|(64<<16))==(64<<16))=limit to master mix
RENDER_NORMALIZE_TARGET:
 * render normalization target (0.5 means -6.02dB, requires
 * RENDER_NORMALIZE&1)
RENDER_BRICKWALL: render brickwall limit (0.5 means
 * -6.02dB, requires RENDER_NORMALIZE&64)
RENDER_FADEIN: render fade-in (0.001
 * means 1 ms, requires RENDER_NORMALIZE&512)
RENDER_FADEOUT: render fade-out
 * (0.001 means 1 ms, requires RENDER_NORMALIZE&1024)
RENDER_FADEINSHAPE: render
 * fade-in shape
RENDER_FADEOUTSHAPE: render fade-out shape
RENDER_PADSTART: pad
 * render start with silence (0.001 means 1ms, requires
 * RENDER_NORMALIZE&(1<<16))
RENDER_PADEND: pad render end with silence (0.001
 * means 1ms, requires RENDER_NORMALIZE&(2<<16))
RENDER_TRIMSTART: trim render
 * start threshold (0.5 means -6.02dB, requires
 * RENDER_NORMALIZE&16384)
RENDER_TRIMEND: trim render end threshold (0.5 means
 * -6.02dB, requires RENDER_NORMALIZE&32768)
RENDER_DELAY: seconds to delay
 * start of render to allow FX to initialize and load samples (requires
 * RENDER_SETTINGS&(16<<16))
PROJECT_SRATE : sample rate (ignored unless
 * PROJECT_SRATE_USE set)
PROJECT_SRATE_USE : set to 1 if project sample rate is
 * used
 */
@:native("GetSetProjectInfo")
public static function getSetProjectInfo(project: ReaProject, desc: String, value: Float, isSet: Bool): Float;
/**
 * Get or set project information.
PROJECT_NAME : project file name (read-only,
 * is_set will be ignored)
PROJECT_TITLE : title field from Project
 * Settings/Notes dialog
PROJECT_AUTHOR : author field from Project
 * Settings/Notes dialog
TRACK_GROUP_NAME:X : track group name, X should be
 * 1..64
MARKER_GUID:X : get the GUID (unique ID) of the marker or region with
 * index X, where X is the index passed to EnumProjectMarkers, not necessarily
 * the displayed number (read-only)
MARKER_INDEX_FROM_GUID:{GUID} : get the GUID
 * index of the marker or region with GUID {GUID} (read-only)
OPENCOPY_CFGIDX :
 * integer for the configuration of format to use when creating copies/applying
 * FX. 0=wave (auto-depth), 1=APPLYFX_FORMAT, 2=RECORD_FORMAT
RECORD_PATH :
 * recording directory -- may be blank or a relative path, to get the effective
 * path see GetProjectPathEx()
RECORD_PATH_SECONDARY : secondary recording
 * directory
RECORD_FORMAT : base64-encoded sink configuration (see project
 * files, etc). Callers can also pass a simple 4-byte string
 * (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that
 * sink type.
APPLYFX_FORMAT : base64-encoded sink configuration (see project
 * files, etc). Used only if RECFMT_OPENCOPY is set to 1. Callers can also pass
 * a simple 4-byte string (non-base64-encoded), e.g. "evaw" or "l3pm", to use
 * default settings for that sink type.
RECTAG : project recording tag wildcard
 * ($rectag). Can be used in Preferences/Audio/Recording to auto-name recorded
 * files.
RENDER_FILE : render directory
RENDER_PATTERN : render file name (may
 * contain wildcards)
RENDER_METADATA : get or set the metadata saved with the
 * project (not metadata embedded in project media). Example, ID3 album name
 * metadata: valuestr="ID3:TALB" to get, valuestr="ID3:TALB|my album name" to
 * set. Call with valuestr="" and is_set=false to get a semicolon-separated list
 * of defined project metadata identifiers.
RENDER_TARGETS : semicolon separated
 * list of files that would be written if the project is rendered using the most
 * recent render settings
RENDER_STATS : (read-only) semicolon separated list of
 * statistics for the most recently rendered files. call with valuestr="XXX" to
 * run an action (for example, "42437"=dry run render selected items) before
 * returning statistics.
RENDER_FORMAT : base64-encoded sink configuration (see
 * project files, etc). Callers can also pass a simple 4-byte string
 * (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that
 * sink type.
RENDER_FORMAT2 : base64-encoded secondary sink configuration.
 * Callers can also pass a simple 4-byte string (non-base64-encoded), e.g.
 * "evaw" or "l3pm", to use default settings for that sink type, or "" to
 * disable secondary render.
    Formats available on this machine:
 */
@:native("GetSetProjectInfo_String")
public static function getSetProjectInfoString(project: ReaProject, desc: String, valuestrNeedBig: String, isSet: Bool): Bool;
/**
 * gets or sets project notes, notesNeedBig_sz is ignored when setting
 */
@:native("GetSetProjectNotes")
public static function getSetProjectNotes(proj: ReaProject, set: Bool, notes: String): String;
/**
 * -1 == query,0=clear,1=set,>1=toggle . returns new value
 */
@:native("GetSetRepeat")
public static function getSetRepeat(val: Int): Int;
/**
 * -1 == query,0=clear,1=set,>1=toggle . returns new value
 */
@:native("GetSetRepeatEx")
public static function getSetRepeatEx(proj: ReaProject, val: Int): Int;
/**
 * Gets or sets the attribute flag of a tempo/time signature marker. flag
 * &1=sets time signature and starts new measure, &2=does not set tempo,
 * &4=allow previous partial measure if starting new measure, &8=set new
 * metronome pattern if starting new measure, &16=reset ruler grid if starting
 * new measure
 */
@:native("GetSetTempoTimeSigMarkerFlag")
public static function getSetTempoTimeSigMarkerFlag(project: ReaProject, pointIndeX: Int, flag: Int, isSet: Bool): Int;
/**
 * Gets or modifies the group membership for a track. Returns group state prior
 * to call (each bit represents one of the 32 group numbers). if setmask has
 * bits set, those bits in setvalue will be applied to group. Group can be one
 * of:
MEDIA_EDIT_LEAD
MEDIA_EDIT_FOLLOW
VOLUME_LEAD
VOLUME_FOLLOW
VOLUME_VCA_LEAD
VOLUME_VCA_FOLLOW
PAN_LEAD
PAN_FOLLOW
WIDTH_LEAD
WIDTH_FOLLOW
MUTE_LEAD
MUTE_FOLLOW
SOLO_LEAD
SOLO_FOLLOW
RECARM_LEAD
RECARM_FOLLOW
POLARITY_LEAD
POLARITY_FOLLOW
AUTOMODE_LEAD
AUTOMODE_FOLLOW
VOLUME_REVERSE
PAN_REVERSE
WIDTH_REVERSE
NO_LEAD_WHEN_FOLLOW
VOLUME_VCA_FOLLOW_ISPREFX
Note:
 * REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and
 * _FOLLOW, which is deprecated but still supported (scripts that must support
 * v6.11 and earlier can use the deprecated strings).
 */
@:native("GetSetTrackGroupMembership")
public static function getSetTrackGroupMembership(tr: MediaTrack, groupName: String, setmask: Int, setvalue: Int): Int;
/**
 * Gets or modifies 32 bits (at offset, where 0 is the low 32 bits of the
 * grouping) of the group membership for a track. Returns group state prior to
 * call. if setmask has bits set, those bits in setvalue will be applied to
 * group. Group can be one
 * of:
MEDIA_EDIT_LEAD
MEDIA_EDIT_FOLLOW
VOLUME_LEAD
VOLUME_FOLLOW
VOLUME_VCA_LEAD
VOLUME_VCA_FOLLOW
PAN_LEAD
PAN_FOLLOW
WIDTH_LEAD
WIDTH_FOLLOW
MUTE_LEAD
MUTE_FOLLOW
SOLO_LEAD
SOLO_FOLLOW
RECARM_LEAD
RECARM_FOLLOW
POLARITY_LEAD
POLARITY_FOLLOW
AUTOMODE_LEAD
AUTOMODE_FOLLOW
VOLUME_REVERSE
PAN_REVERSE
WIDTH_REVERSE
NO_LEAD_WHEN_FOLLOW
VOLUME_VCA_FOLLOW_ISPREFX
Note:
 * REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and
 * _FOLLOW, which is deprecated but still supported (scripts that must support
 * v6.11 and earlier can use the deprecated strings).
 */
@:native("GetSetTrackGroupMembershipEx")
public static function getSetTrackGroupMembershipEx(tr: MediaTrack, groupName: String, offSet: Int, setmask: Int, setvalue: Int): Int;
/**
 * Gets or modifies the group membership for a track. Returns group state prior
 * to call (each bit represents one of the high 32 group numbers). if setmask
 * has bits set, those bits in setvalue will be applied to group. Group can be
 * one
 * of:
MEDIA_EDIT_LEAD
MEDIA_EDIT_FOLLOW
VOLUME_LEAD
VOLUME_FOLLOW
VOLUME_VCA_LEAD
VOLUME_VCA_FOLLOW
PAN_LEAD
PAN_FOLLOW
WIDTH_LEAD
WIDTH_FOLLOW
MUTE_LEAD
MUTE_FOLLOW
SOLO_LEAD
SOLO_FOLLOW
RECARM_LEAD
RECARM_FOLLOW
POLARITY_LEAD
POLARITY_FOLLOW
AUTOMODE_LEAD
AUTOMODE_FOLLOW
VOLUME_REVERSE
PAN_REVERSE
WIDTH_REVERSE
NO_LEAD_WHEN_FOLLOW
VOLUME_VCA_FOLLOW_ISPREFX
Note:
 * REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and
 * _FOLLOW, which is deprecated but still supported (scripts that must support
 * v6.11 and earlier can use the deprecated strings).
 */
@:native("GetSetTrackGroupMembershipHigh")
public static function getSetTrackGroupMembershipHigh(tr: MediaTrack, groupName: String, setmask: Int, setvalue: Int): Int;
/**
 * Gets/sets a send attribute string:
P_EXT:xyz : char * : extension-specific
 * persistent data
 */
@:native("GetSetTrackSendInfo_String")
public static function getSetTrackSendInfoString(tr: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String, stringNeedBig: String, setNeWValue: Bool): Bool;
/**
 * deprecated -- see SetTrackStateChunk, GetTrackStateChunk
 */
@:native("GetSetTrackState")
public static function getSetTrackState(track: MediaTrack, str: String): Bool;
/**
 * deprecated -- see SetTrackStateChunk, GetTrackStateChunk
 */
@:native("GetSetTrackState2")
public static function getSetTrackState2(track: MediaTrack, str: String, isundo: Bool): Bool;
/** No description available */
@:native("GetSubProjectFromSource")
public static function getSubProjectFromSource(src: PcmSource): ReaProject;
/**
 * get a take from an item by take count (zero-based)
 */
@:native("GetTake")
public static function getTake(item: MediaItem, takeIdX: Int): MediaItemTake;
/** No description available */
@:native("GetTakeEnvelope")
public static function getTakeEnvelope(take: MediaItemTake, envIdX: Int): TrackEnvelope;
/** No description available */
@:native("GetTakeEnvelopeByName")
public static function getTakeEnvelopeByName(take: MediaItemTake, envName: String): TrackEnvelope;
/**
 * Get information about a take marker. Returns the position in media item
 * source time, or -1 if the take marker does not exist. See GetNumTakeMarkers,
 * SetTakeMarker, DeleteTakeMarker
 */
@:native("GetTakeMarker")
public static function getTakeMarker(take: MediaItemTake, idX: Int): Float;
/**
 * returns NULL if the take is not valid
 */
@:native("GetTakeName")
public static function getTakeName(take: MediaItemTake): String;
/**
 * Returns number of stretch markers in take
 */
@:native("GetTakeNumStretchMarkers")
public static function getTakeNumStretchMarkers(take: MediaItemTake): Int;
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
 * See SetTakeStretchMarkerSlope
 */
@:native("GetTakeStretchMarkerSlope")
public static function getTakeStretchMarkerSlope(take: MediaItemTake, idX: Int): Float;
/**
 * Get information about a specific FX parameter knob (see CountTCPFXParms).
 */
@:native("GetTCPFXParm")
public static function getTcpfxParm(project: ReaProject, track: MediaTrack, indeX: Int): Bool;
/**
 * finds the playrate and target length to insert this item stretched to a round
 * power-of-2 number of bars, between 1/8 and 256
 */
@:native("GetTempoMatchPlayRate")
public static function getTempoMatchPlayRate(source: PcmSource, srcscale: Float, position: Float, mult: Float): Bool;
/**
 * Get information about a tempo/time signature marker. See
 * CountTempoTimeSigMarkers, SetTempoTimeSigMarker, AddTempoTimeSigMarker.
 */
@:native("GetTempoTimeSigMarker")
public static function getTempoTimeSigMarker(proj: ReaProject, ptIdX: Int): Bool;
/**
 * Returns the theme color specified, or -1 on failure. If the low bit of flags
 * is set, the color as originally specified by the theme (before any
 * transformations) is returned, otherwise the current (possibly transformed and
 * modified) color is returned. See SetThemeColor for a list of valid ini_key.
 */
@:native("GetThemeColor")
public static function getThemeColor(iniKeY: String, flags: Int): Int;
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
 * See GetToggleCommandStateEx.
 */
@:native("GetToggleCommandState")
public static function getToggleCommandState(commandId: Int): Int;
/**
 * For the main action context, the MIDI editor, or the media explorer, returns
 * the toggle state of the action. 0=off, 1=on, -1=NA because the action does
 * not have on/off states. For the MIDI editor, the action state for the most
 * recently focused window will be returned.
 */
@:native("GetToggleCommandStateEx")
public static function getToggleCommandStateEx(sectionId: Int, commandId: Int): Int;
/**
 * gets a tooltip window,in case you want to ask it for font information. Can
 * return NULL.
 */
@:native("GetTooltipWindow")
public static function getTooltipWindow(): Hwnd;
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
 * get a track from a project by track count (zero-based) (proj=0 for active
 * project)
 */
@:native("GetTrack")
public static function getTrack(proj: ReaProject, trackIdX: Int): MediaTrack;
/**
 * return the track mode, regardless of global override
 */
@:native("GetTrackAutomationMode")
public static function getTrackAutomationMode(tr: MediaTrack): Int;
/**
 * Returns the track custom color as OS dependent color|0x1000000 (i.e.
 * ColorToNative(r,g,b)|0x1000000). Black is returned as 0x1000000, no color
 * setting is returned as 0.
 */
@:native("GetTrackColor")
public static function getTrackColor(track: MediaTrack): Int;
/** No description available */
@:native("GetTrackDepth")
public static function getTrackDepth(track: MediaTrack): Int;
/** No description available */
@:native("GetTrackEnvelope")
public static function getTrackEnvelope(track: MediaTrack, envIdX: Int): TrackEnvelope;
/**
 * Gets a built-in track envelope by configuration chunk name, like "<VOLENV",
 * or GUID string, like "{B577250D-146F-B544-9B34-F24FBE488F1F}".
 */
@:native("GetTrackEnvelopeByChunkName")
public static function getTrackEnvelopeByChunkName(tr: MediaTrack, cfgcHunkNameOrGuId: String): TrackEnvelope;
/** No description available */
@:native("GetTrackEnvelopeByName")
public static function getTrackEnvelopeByName(track: MediaTrack, envName: String): TrackEnvelope;
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
@:native("GetTrackGUID")
public static function getTrackGuid(tr: MediaTrack): String;
/** No description available */
@:native("GetTrackMediaItem")
public static function getTrackMediaItem(tr: MediaTrack, itemIdX: Int): MediaItem;
/**
 * Get all MIDI lyrics on the track. Lyrics will be returned as one string with
 * tabs between each word. flag&1: double tabs at the end of each measure and
 * triple tabs when skipping measures, flag&2: each lyric is preceded by its
 * beat position in the project (example with flag=2: "1.1.2\tLyric for measure
 * 1 beat 2\t2.1.1\tLyric for measure 2 beat 1	"). See SetTrackMIDILyrics
 */
@:native("GetTrackMIDILyrics")
public static function getTrackMidiLyrics(track: MediaTrack, flag: Int): Bool;
/**
 * see GetTrackMIDINoteNameEx
 */
@:native("GetTrackMIDINoteName")
public static function getTrackMidiNoteName(track: Int, pitcH: Int, cHan: Int): String;
/**
 * Get note/CC name. pitch 128 for CC0 name, 129 for CC1 name, etc. See
 * SetTrackMIDINoteNameEx
 */
@:native("GetTrackMIDINoteNameEx")
public static function getTrackMidiNoteNameEx(proj: ReaProject, track: MediaTrack, pitcH: Int, cHan: Int): String;
/** No description available */
@:native("GetTrackMIDINoteRange")
public static function getTrackMidiNoteRange(proj: ReaProject, track: MediaTrack): Int;
/**
 * Returns "MASTER" for master track, "Track N" if track has no name.
 */
@:native("GetTrackName")
public static function getTrackName(track: MediaTrack): Bool;
/** No description available */
@:native("GetTrackNumMediaItems")
public static function getTrackNumMediaItems(tr: MediaTrack): Int;
/**
 * returns number of sends/receives/hardware outputs - category is <0 for
 * receives, 0=sends, >0 for hardware outputs
 */
@:native("GetTrackNumSends")
public static function getTrackNumSends(tr: MediaTrack, categorY: Int): Int;
/**
 * See GetTrackSendName.
 */
@:native("GetTrackReceiveName")
public static function getTrackReceiveName(track: MediaTrack, recvIndeX: Int): Bool;
/**
 * See GetTrackSendUIMute.
 */
@:native("GetTrackReceiveUIMute")
public static function getTrackReceiveUiMute(track: MediaTrack, recvIndeX: Int): Bool;
/**
 * See GetTrackSendUIVolPan.
 */
@:native("GetTrackReceiveUIVolPan")
public static function getTrackReceiveUiVolPan(track: MediaTrack, recvIndeX: Int): Bool;
/**
 * Get send/receive/hardware output numerical-value attributes.
category is <0
 * for receives, 0=sends, >0 for hardware outputs
parameter names:
B_MUTE : bool
 * *
B_PHASE : bool * : true to flip phase
B_MONO : bool *
D_VOL : double * :
 * 1.0 = +0dB etc
D_PAN : double * : -1..+1
D_PANLAW : double * : 1.0=+0.0db,
 * 0.5=-6dB, -1.0 = projdef etc
I_SENDMODE : int * : 0=post-fader, 1=pre-fx,
 * 2=post-fx (deprecated), 3=post-fx
I_AUTOMODE : int * : automation mode
 * (-1=use track automode, 0=trim/off, 1=read, 2=touch, 3=write,
 * 4=latch)
I_SRCCHAN : int * : -1 for no audio send. Low 10 bits specify
 * channel offset, and higher bits specify channel count. (srcchan>>10) == 0 for
 * stereo, 1 for mono, 2 for 4 channel, 3 for 6 channel, etc.
I_DSTCHAN : int *
 * : low 10 bits are destination index, &1024 set to mix to mono.
I_MIDIFLAGS :
 * int * : low 5 bits=source channel 0=all, 1-16, 31=MIDI send disabled, next 5
 * bits=dest channel, 0=orig, 1-16=chan. &1024 for faders-send MIDI vol/pan.
 * (>>14)&255 = src bus (0 for all, 1 for normal, 2+). (>>22)&255=destination
 * bus (0 for all, 1 for normal, 2+)
P_DESTTRACK : MediaTrack * : destination
 * track, only applies for sends/recvs (read-only)
P_SRCTRACK : MediaTrack * :
 * source track, only applies for sends/recvs (read-only)
P_ENV:<envchunkname :
 * TrackEnvelope * : call with :<VOLENV, :<PANENV, etc appended (read-only)
See
 * CreateTrackSend, RemoveTrackSend, GetTrackNumSends.
 */
@:native("GetTrackSendInfo_Value")
public static function getTrackSendInfoValue(tr: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String): Float;
/**
 * send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See
 * GetTrackReceiveName.
 */
@:native("GetTrackSendName")
public static function getTrackSendName(track: MediaTrack, sendIndeX: Int): Bool;
/**
 * send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See
 * GetTrackReceiveUIMute.
 */
@:native("GetTrackSendUIMute")
public static function getTrackSendUiMute(track: MediaTrack, sendIndeX: Int): Bool;
/**
 * send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See
 * GetTrackReceiveUIVolPan.
 */
@:native("GetTrackSendUIVolPan")
public static function getTrackSendUiVolPan(track: MediaTrack, sendIndeX: Int): Bool;
/**
 * Gets track state, returns track name.
flags will be set
 * to:
&1=folder
&2=selected
&4=has fx enabled
&8=muted
&16=soloed
&32=SIP'd
 * (with &16)
&64=rec armed
&128=rec monitoring on
&256=rec monitoring
 * auto
&512=hide from TCP
&1024=hide from MCP
 */
@:native("GetTrackState")
public static function getTrackState(track: MediaTrack): String;
/**
 * Gets the RPPXML state of a track, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("GetTrackStateChunk")
public static function getTrackStateChunk(track: MediaTrack, str: String, isundo: Bool): Bool;
/** No description available */
@:native("GetTrackUIMute")
public static function getTrackUiMute(track: MediaTrack): Bool;
/** No description available */
@:native("GetTrackUIPan")
public static function getTrackUiPan(track: MediaTrack): Bool;
/** No description available */
@:native("GetTrackUIVolPan")
public static function getTrackUiVolPan(track: MediaTrack): Bool;
/**
 * retrieves the last timestamps of audio xrun (yellow-flash, if available),
 * media xrun (red-flash), and the current time stamp (all milliseconds)
 */
@:native("GetUnderrunTime")
public static function getUnderrunTime(): Int;
/**
 * returns true if the user selected a valid file, false if the user canceled
 * the dialog
 */
@:native("GetUserFileNameForRead")
public static function getUserFileNameForRead(fileNameNeed4096: String, title: String, defeXt: String): Bool;
/**
 * Get values from the user.
If a caption begins with *, for example
 * "*password", the edit field will not display the input text.
Maximum fields
 * is 16. Values are returned as a comma-separated string. Returns false if the
 * user canceled the dialog. You can supply special extra information via
 * additional caption fields: extrawidth=XXX to increase text field width,
 * separator=X to use a different separator for returned fields.
 */
@:native("GetUserInputs")
public static function getUserInputs(title: String, numInputs: Int, captionsCsv: String, retvalsCsv: String): Bool;
/**
 * Go to marker. If use_timeline_order==true, marker_index 1 refers to the first
 * marker on the timeline.  If use_timeline_order==false, marker_index 1 refers
 * to the first marker with the user-editable index of 1.
 */
@:native("GoToMarker")
public static function goToMarker(proj: ReaProject, markerIndeX: Int, uSeTimeLineOrder: Bool): Void;
/**
 * Seek to region after current region finishes playing (smooth seek). If
 * use_timeline_order==true, region_index 1 refers to the first region on the
 * timeline.  If use_timeline_order==false, region_index 1 refers to the first
 * region with the user-editable index of 1.
 */
@:native("GoToRegion")
public static function goToRegion(proj: ReaProject, regionIndeX: Int, uSeTimeLineOrder: Bool): Void;
/**
 * Runs the system color chooser dialog.  Returns 0 if the user cancels the
 * dialog.
 */
@:native("GR_SelectColor")
public static function grSelectColor(hWnd: Hwnd): Int;
/**
 * this is just like win32 GetSysColor() but can have overrides.
 */
@:native("GSC_mainwnd")
public static function gscMainwnd(t: Int): Int;
/**
 * dest should be at least 64 chars long to be safe
 */
@:native("guidToString")
public static function guidToString(gGuId: String, destNeed64: String): String;
/**
 * Returns true if there exists an extended state value for a specific section
 * and key. See SetExtState, GetExtState, DeleteExtState.
 */
@:native("HasExtState")
public static function hasExtState(section: String, keY: String): Bool;
/**
 * returns name of track plugin that is supplying MIDI programs,or NULL if there
 * is none
 */
@:native("HasTrackMIDIPrograms")
public static function hasTrackMidiPrograms(track: Int): String;
/**
 * returns name of track plugin that is supplying MIDI programs,or NULL if there
 * is none
 */
@:native("HasTrackMIDIProgramsEx")
public static function hasTrackMidiProgramsEx(proj: ReaProject, track: MediaTrack): String;
/** No description available */
@:native("Help_Set")
public static function helpSet(helpstring: String, isTemporarYHelp: Bool): Void;
/** No description available */
@:native("image_resolve_fn")
public static function imageResolveFn(_in: String, out: String): String;
/**
 * Insert a new automation item. pool_id < 0 collects existing envelope points
 * into the automation item; if pool_id is >= 0 the automation item will be a
 * new instance of that pool (which will be created as an empty instance if it
 * does not exist). Returns the index of the item, suitable for passing to other
 * automation item API functions. See GetSetAutomationItemInfo.
 */
@:native("InsertAutomationItem")
public static function insertAutomationItem(env: TrackEnvelope, poolId: Int, position: Float, lengtH: Float): Int;
/**
 * Insert an envelope point. If setting multiple points at once, set
 * noSort=true, and call Envelope_SortPoints when done. See
 * InsertEnvelopePointEx.
 */
@:native("InsertEnvelopePoint")
public static function insertEnvelopePoint(envelope: TrackEnvelope, time: Float, value: Float, sHape: Int, tension: Float, selected: Bool, ?noSortIn: Bool): Bool;
/**
 * Insert an envelope point. If setting multiple points at once, set
 * noSort=true, and call Envelope_SortPoints when done.
autoitem_idx=-1 for the
 * underlying envelope, 0 for the first automation item on the envelope,
 * etc.
For automation items, pass autoitem_idx|0x10000000 to base ptidx on the
 * number of points in one full loop iteration,
even if the automation item is
 * trimmed so that not all points are visible.
Otherwise, ptidx will be based on
 * the number of visible points in the automation item, including all loop
 * iterations.
See CountEnvelopePointsEx, GetEnvelopePointEx,
 * SetEnvelopePointEx, DeleteEnvelopePointEx.
 */
@:native("InsertEnvelopePointEx")
public static function insertEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, time: Float, value: Float, sHape: Int, tension: Float, selected: Bool, ?noSortIn: Bool): Bool;
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
 * See InsertMedia.
 */
@:native("InsertMediaSection")
public static function insertMediaSection(file: String, mode: Int, startpct: Float, endpct: Float, pitcHsHift: Float): Int;
/**
 * inserts a track at idx,of course this will be clamped to 0..GetNumTracks().
 * wantDefaults=TRUE for default envelopes/FX,otherwise no enabled fx/env.
 * Superseded, see InsertTrackInProject
 */
@:native("InsertTrackAtIndex")
public static function insertTrackAtIndex(idX: Int, wantDefaults: Bool): Void;
/**
 * inserts a track in project proj at idx, this will be clamped to
 * 0..CountTracks(proj). flags&1 for default envelopes/FX, otherwise no enabled
 * fx/envelopes will be added.
 */
@:native("InsertTrackInProject")
public static function insertTrackInProject(proj: ReaProject, idX: Int, flags: Int): Void;
/**
 * Tests a file extension (i.e. "wav" or "mid") to see if it's a media
 * extension.
If wantOthers is set, then "RPP", "TXT" and other project-type
 * formats will also pass.
 */
@:native("IsMediaExtension")
public static function isMediaExtension(eXt: String, wantOtHers: Bool): Bool;
/** No description available */
@:native("IsMediaItemSelected")
public static function isMediaItemSelected(item: MediaItem): Bool;
/**
 * Is the project dirty (needing save)? Always returns 0 if 'undo/prompt to
 * save' is disabled in preferences.
 */
@:native("IsProjectDirty")
public static function isProjectDirty(proj: ReaProject): Int;
/** No description available */
@:native("IsTrackSelected")
public static function isTrackSelected(track: MediaTrack): Bool;
/**
 * If mixer==true, returns true if the track is visible in the mixer.  If
 * mixer==false, returns true if the track is visible in the track control
 * panel.
 */
@:native("IsTrackVisible")
public static function isTrackVisible(track: MediaTrack, miXer: Bool): Bool;
/**
 * creates a joystick device
 */
@:native("joystick_create")
public static function joystickCreate(guIdGuId: String): JoystickDevice;
/**
 * destroys a joystick device
 */
@:native("joystick_destroy")
public static function joystickDestroy(device: JoystickDevice): Void;
/**
 * enumerates installed devices, returns GUID as a string
 */
@:native("joystick_enum")
public static function joystickEnum(indeX: Int): String;
/**
 * returns axis value (-1..1)
 */
@:native("joystick_getaxis")
public static function joystickGetaxis(dev: JoystickDevice, aXis: Int): Float;
/**
 * returns button pressed mask, 1=first button, 2=second...
 */
@:native("joystick_getbuttonmask")
public static function joystickGetbuttonmask(dev: JoystickDevice): Int;
/**
 * returns button count
 */
@:native("joystick_getinfo")
public static function joystickGetinfo(dev: JoystickDevice): Int;
/**
 * returns POV value (usually 0..655.35, or 655.35 on error)
 */
@:native("joystick_getpov")
public static function joystickGetpov(dev: JoystickDevice, pov: Int): Float;
/**
 * Updates joystick state from hardware, returns true if successful
 * (joystick_get* will not be valid until joystick_update() is called
 * successfully)
 */
@:native("joystick_update")
public static function joystickUpdate(dev: JoystickDevice): Bool;
/** No description available */
@:native("kbd_enumerateActions")
public static function kbdEnumerateActions(section: KbdSectionInfo, idX: Int): Int;
/** No description available */
@:native("kbd_getTextFromCmd")
public static function kbdGetTextFromCmd(cmd: Int, section: KbdSectionInfo): String;
/**
 * Returns false if the line is entirely offscreen.
 */
@:native("LICE_ClipLine")
public static function liceClipLine(pX1: Int, pY1: Int, pX2: Int, pY2: Int, xLo: Int, yLo: Int, xHi: Int, yHi: Int): Bool;
/**
 * Returns a localized version of src_string, in section section. flags can have
 * 1 set to only localize if sprintf-style formatting matches the original.
 */
@:native("LocalizeString")
public static function localizeString(srcString: String, section: String, flags: Int): String;
/**
 * Move the loop selection left or right. Returns true if snap is enabled.
 */
@:native("Loop_OnArrow")
public static function loopOnArrow(project: ReaProject, direction: Int): Bool;
/**
 * See Main_OnCommandEx.
 */
@:native("Main_OnCommand")
public static function mainOnCommand(command: Int, flag: Int): Void;
/**
 * Performs an action belonging to the main action section. To perform
 * non-native actions (ReaScripts, custom or extension plugins' actions) safely,
 * see NamedCommandLookup().
 */
@:native("Main_OnCommandEx")
public static function mainOnCommandEx(command: Int, flag: Int, proj: ReaProject): Void;
/**
 * opens a project. will prompt the user to save unless name is prefixed with
 * 'noprompt:'. If name is prefixed with 'template:', project file will be
 * loaded as a template.
If passed a .RTrackTemplate file, adds the template to
 * the existing project.
 */
@:native("Main_openProject")
public static function mainOpenProject(name: String): Void;
/**
 * Save the project.
 */
@:native("Main_SaveProject")
public static function mainSaveProject(proj: ReaProject, forceSaveAsIn: Bool): Void;
/**
 * Save the project. options: &1=save selected tracks as track template,
 * &2=include media with track template, &4=include envelopes with track
 * template, &8=if not saving template, set as the new project filename for this
 * ReaProject. See Main_openProject, Main_SaveProject.
 */
@:native("Main_SaveProjectEx")
public static function mainSaveProjectEx(proj: ReaProject, fileName: String, options: Int): Void;
/** No description available */
@:native("Main_UpdateLoopInfo")
public static function mainUpdateLoopInfo(ignoremask: Int): Void;
/**
 * Marks project as dirty (needing save) if 'undo/prompt to save' is enabled in
 * preferences.
 */
@:native("MarkProjectDirty")
public static function markProjectDirty(proj: ReaProject): Void;
/**
 * If track is supplied, item is ignored
 */
@:native("MarkTrackItemsDirty")
public static function markTrackItemsDirty(track: MediaTrack, item: MediaItem): Void;
/** No description available */
@:native("Master_GetPlayRate")
public static function masterGetPlayRate(project: ReaProject): Float;
/** No description available */
@:native("Master_GetPlayRateAtTime")
public static function masterGetPlayRateAtTime(timeS: Float, proj: ReaProject): Float;
/** No description available */
@:native("Master_GetTempo")
public static function masterGetTempo(): Float;
/**
 * Convert play rate to/from a value between 0 and 1, representing the position
 * on the project playrate slider.
 */
@:native("Master_NormalizePlayRate")
public static function masterNormalizePlayRate(plaYRate: Float, isnormalized: Bool): Float;
/**
 * Convert the tempo to/from a value between 0 and 1, representing bpm in the
 * range of 40-296 bpm.
 */
@:native("Master_NormalizeTempo")
public static function masterNormalizeTempo(bpm: Float, isnormalized: Bool): Float;
/**
 * type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL :
 * ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO
 */
@:native("MB")
public static function mb(msg: String, title: String, tYpe: Int): Int;
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
 * Returns 1 if the track holds the item, 2 if the track is a folder containing
 * the track that holds the item, etc.
 */
@:native("MediaItemDescendsFromTrack")
public static function mediaItemDescendsFromTrack(item: MediaItem, track: MediaTrack): Int;
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
 * Count the number of notes, CC events, and text/sysex events in a given MIDI
 * item.
 */
@:native("MIDI_CountEvts")
public static function midiCountEvts(take: MediaItemTake): Int;
/**
 * Delete a MIDI CC event.
 */
@:native("MIDI_DeleteCC")
public static function midiDeleteCc(take: MediaItemTake, ccIdX: Int): Bool;
/**
 * Delete a MIDI event.
 */
@:native("MIDI_DeleteEvt")
public static function midiDeleteEvt(take: MediaItemTake, evtIdX: Int): Bool;
/**
 * Delete a MIDI note.
 */
@:native("MIDI_DeleteNote")
public static function midiDeleteNote(take: MediaItemTake, noteIdX: Int): Bool;
/**
 * Delete a MIDI text or sysex event.
 */
@:native("MIDI_DeleteTextSysexEvt")
public static function midiDeleteTextSysexEvt(take: MediaItemTake, teXtsYXevtIdX: Int): Bool;
/**
 * Disable sorting for all MIDI insert, delete, get and set functions, until
 * MIDI_Sort is called.
 */
@:native("MIDI_DisableSort")
public static function midiDisableSort(take: MediaItemTake): Void;
/**
 * Returns the index of the next selected MIDI CC event after ccidx (-1 if there
 * are no more selected events).
 */
@:native("MIDI_EnumSelCC")
public static function midiEnumSelCc(take: MediaItemTake, ccIdX: Int): Int;
/**
 * Returns the index of the next selected MIDI event after evtidx (-1 if there
 * are no more selected events).
 */
@:native("MIDI_EnumSelEvts")
public static function midiEnumSelEvts(take: MediaItemTake, evtIdX: Int): Int;
/**
 * Returns the index of the next selected MIDI note after noteidx (-1 if there
 * are no more selected events).
 */
@:native("MIDI_EnumSelNotes")
public static function midiEnumSelNotes(take: MediaItemTake, noteIdX: Int): Int;
/**
 * Returns the index of the next selected MIDI text/sysex event after textsyxidx
 * (-1 if there are no more selected events).
 */
@:native("MIDI_EnumSelTextSysexEvts")
public static function midiEnumSelTextSysexEvts(take: MediaItemTake, teXtsYXIdX: Int): Int;
/**
 * Get all MIDI data. MIDI buffer is returned as a list of { int offset, char
 * flag, int msglen, unsigned char msg[] }.
offset: MIDI ticks from previous
 * event
flag: &1=selected &2=muted
flag high 4 bits for CC shape: &16=linear,
 * &32=slow start/end, &16|32=fast start, &64=fast end, &64|16=bezier
msg: the
 * MIDI message.
A meta-event of type 0xF followed by 'CCBZ ' and 5 more bytes
 * represents bezier curve data for the previous MIDI event: 1 byte for the
 * bezier type (usually 0) and 4 bytes for the bezier tension as a float.
For
 * tick intervals longer than a 32 bit word can represent, zero-length meta
 * events may be placed between valid events.
See MIDI_SetAllEvts.
 */
@:native("MIDI_GetAllEvts")
public static function midiGetAllEvts(take: MediaItemTake): Bool;
/**
 * Get MIDI CC event properties.
 */
@:native("MIDI_GetCC")
public static function midiGetCc(take: MediaItemTake, ccIdX: Int): Bool;
/**
 * Get CC shape and bezier tension. See MIDI_GetCC, MIDI_SetCCShape
 */
@:native("MIDI_GetCCShape")
public static function midiGetCcShape(take: MediaItemTake, ccIdX: Int): Bool;
/**
 * Get MIDI event properties.
 */
@:native("MIDI_GetEvt")
public static function midiGetEvt(take: MediaItemTake, evtIdX: Int): Bool;
/**
 * Returns the most recent MIDI editor grid size for this MIDI take, in QN.
 * Swing is between 0 and 1. Note length is 0 if it follows the grid size.
 */
@:native("MIDI_GetGrid")
public static function midiGetGrid(take: MediaItemTake): Float;
/**
 * Get a string that only changes when the MIDI data changes. If
 * notesonly==true, then the string changes only when the MIDI notes change. See
 * MIDI_GetTrackHash
 */
@:native("MIDI_GetHash")
public static function midiGetHash(take: MediaItemTake, notesonlY: Bool): Bool;
/**
 * Get MIDI note properties.
 */
@:native("MIDI_GetNote")
public static function midiGetNote(take: MediaItemTake, noteIdX: Int): Bool;
/**
 * Returns the MIDI tick (ppq) position corresponding to the end of the measure.
 */
@:native("MIDI_GetPPQPos_EndOfMeasure")
public static function midiGetPpqPosEndOfMeasure(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to the start of the
 * measure.
 */
@:native("MIDI_GetPPQPos_StartOfMeasure")
public static function midiGetPpqPosStartOfMeasure(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to a specific project time
 * in quarter notes.
 */
@:native("MIDI_GetPPQPosFromProjQN")
public static function midiGetPpqPosFromProjQn(take: MediaItemTake, projqn: Float): Float;
/**
 * Returns the MIDI tick (ppq) position corresponding to a specific project time
 * in seconds.
 */
@:native("MIDI_GetPPQPosFromProjTime")
public static function midiGetPpqPosFromProjTime(take: MediaItemTake, projTime: Float): Float;
/**
 * Returns the project time in quarter notes corresponding to a specific MIDI
 * tick (ppq) position.
 */
@:native("MIDI_GetProjQNFromPPQPos")
public static function midiGetProjQnFromPpqPos(take: MediaItemTake, ppqPos: Float): Float;
/**
 * Returns the project time in seconds corresponding to a specific MIDI tick
 * (ppq) position.
 */
@:native("MIDI_GetProjTimeFromPPQPos")
public static function midiGetProjTimeFromPpqPos(take: MediaItemTake, ppqPos: Float): Float;
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
 * Get the active scale in the media source, if any. root 0=C, 1=C#, etc. scale
 * &0x1=root, &0x2=minor 2nd, &0x4=major 2nd, &0x8=minor 3rd, &0xF=fourth, etc.
 */
@:native("MIDI_GetScale")
public static function midiGetScale(take: MediaItemTake): Bool;
/**
 * Get MIDI meta-event properties. Allowable types are -1:sysex (msg should not
 * include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation
 * event. For all other meta-messages, type is returned as -2 and msg returned
 * as all zeroes. See MIDI_GetEvt.
 */
@:native("MIDI_GetTextSysexEvt")
public static function midiGetTextSysexEvt(take: MediaItemTake, teXtsYXevtIdX: Int, ?selected: Bool, ?muted: Bool, ?ppqPos: Float, ?tYpe: Int, ?msg: String): Bool;
/**
 * Get a string that only changes when the MIDI data changes. If
 * notesonly==true, then the string changes only when the MIDI notes change. See
 * MIDI_GetHash
 */
@:native("MIDI_GetTrackHash")
public static function midiGetTrackHash(track: MediaTrack, notesonlY: Bool): Bool;
/**
 * Opens MIDI devices as configured in preferences. force_reinit_input and
 * force_reinit_output force a particular device index to close/re-open (pass -1
 * to not force any devices to reopen).
 */
@:native("midi_init")
public static function midiInit(forceReinitInput: Int, forceReinitOutput: Int): Void;
/**
 * Insert a new MIDI CC event.
 */
@:native("MIDI_InsertCC")
public static function midiInsertCc(take: MediaItemTake, selected: Bool, muted: Bool, ppqPos: Float, cHanmsg: Int, cHan: Int, msg2: Int, msg3: Int): Bool;
/**
 * Insert a new MIDI event.
 */
@:native("MIDI_InsertEvt")
public static function midiInsertEvt(take: MediaItemTake, selected: Bool, muted: Bool, ppqPos: Float, bYtestr: String): Bool;
/**
 * Insert a new MIDI note. Set noSort if inserting multiple events, then call
 * MIDI_Sort when done.
 */
@:native("MIDI_InsertNote")
public static function midiInsertNote(take: MediaItemTake, selected: Bool, muted: Bool, startppqPos: Float, endppqPos: Float, cHan: Int, pitcH: Int, vel: Int, ?noSortIn: Bool): Bool;
/**
 * Insert a new MIDI text or sysex event. Allowable types are -1:sysex (msg
 * should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER
 * notation event.
 */
@:native("MIDI_InsertTextSysexEvt")
public static function midiInsertTextSysexEvt(take: MediaItemTake, selected: Bool, muted: Bool, ppqPos: Float, tYpe: Int, bYtestr: String): Bool;
/**
 * Synchronously updates any open MIDI editors for MIDI take
 */
@:native("MIDI_RefreshEditors")
public static function midiRefreshEditors(tk: MediaItemTake): Void;
/**
 * Reset (close and re-open) all MIDI devices
 */
@:native("midi_reinit")
public static function midiReinit(): Void;
/**
 * Select or deselect all MIDI content.
 */
@:native("MIDI_SelectAll")
public static function midiSelectAll(take: MediaItemTake, select: Bool): Void;
/**
 * Set all MIDI data. MIDI buffer is passed in as a list of { int offset, char
 * flag, int msglen, unsigned char msg[] }.
offset: MIDI ticks from previous
 * event
flag: &1=selected &2=muted
flag high 4 bits for CC shape: &16=linear,
 * &32=slow start/end, &16|32=fast start, &64=fast end, &64|16=bezier
msg: the
 * MIDI message.
A meta-event of type 0xF followed by 'CCBZ ' and 5 more bytes
 * represents bezier curve data for the previous MIDI event: 1 byte for the
 * bezier type (usually 0) and 4 bytes for the bezier tension as a float.
For
 * tick intervals longer than a 32 bit word can represent, zero-length meta
 * events may be placed between valid events.
See MIDI_GetAllEvts.
 */
@:native("MIDI_SetAllEvts")
public static function midiSetAllEvts(take: MediaItemTake, buf: String): Bool;
/**
 * Set MIDI CC event properties. Properties passed as NULL will not be set. set
 * noSort if setting multiple events, then call MIDI_Sort when done.
 */
@:native("MIDI_SetCC")
public static function midiSetCc(take: MediaItemTake, ccIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?ppqPosIn: Float, ?cHanmsgIn: Int, ?cHanIn: Int, ?msg2In: Int, ?msg3In: Int, ?noSortIn: Bool): Bool;
/**
 * Set CC shape and bezier tension. set noSort if setting multiple events, then
 * call MIDI_Sort when done. See MIDI_SetCC, MIDI_GetCCShape
 */
@:native("MIDI_SetCCShape")
public static function midiSetCcShape(take: MediaItemTake, ccIdX: Int, sHape: Int, beztension: Float, ?noSortIn: Bool): Bool;
/**
 * Set MIDI event properties. Properties passed as NULL will not be set.  set
 * noSort if setting multiple events, then call MIDI_Sort when done.
 */
@:native("MIDI_SetEvt")
public static function midiSetEvt(take: MediaItemTake, evtIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?ppqPosIn: Float, ?msg: String, ?noSortIn: Bool): Bool;
/**
 * Set the start/end positions of a media item that contains a MIDI take.
 */
@:native("MIDI_SetItemExtents")
public static function midiSetItemExtents(item: MediaItem, startQn: Float, endQn: Float): Bool;
/**
 * Set MIDI note properties. Properties passed as NULL (or negative values) will
 * not be set. Set noSort if setting multiple events, then call MIDI_Sort when
 * done. Setting multiple note start positions at once is done more safely by
 * deleting and re-inserting the notes.
 */
@:native("MIDI_SetNote")
public static function midiSetNote(take: MediaItemTake, noteIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?startppqPosIn: Float, ?endppqPosIn: Float, ?cHanIn: Int, ?pitcHIn: Int, ?velIn: Int, ?noSortIn: Bool): Bool;
/**
 * Set MIDI text or sysex event properties. Properties passed as NULL will not
 * be set. Allowable types are -1:sysex (msg should not include bounding
 * F0..F7), 1-14:MIDI text event types, 15=REAPER notation event. set noSort if
 * setting multiple events, then call MIDI_Sort when done.
 */
@:native("MIDI_SetTextSysexEvt")
public static function midiSetTextSysexEvt(take: MediaItemTake, teXtsYXevtIdX: Int, ?selectedIn: Bool, ?mutedIn: Bool, ?ppqPosIn: Float, ?tYpeIn: Int, ?msg: String, ?noSortIn: Bool): Bool;
/**
 * Sort MIDI events after multiple calls to MIDI_SetNote, MIDI_SetCC, etc.
 */
@:native("MIDI_Sort")
public static function midiSort(take: MediaItemTake): Void;
/**
 * list the takes that are currently being edited in this MIDI editor, starting
 * with the active take. See MIDIEditor_GetTake
 */
@:native("MIDIEditor_EnumTakes")
public static function midiEditorEnumTakes(mIdieditor: Hwnd, takeindeX: Int, editableOnlY: Bool): MediaItemTake;
/**
 * get a pointer to the focused MIDI editor window
see MIDIEditor_GetMode,
 * MIDIEditor_OnCommand
 */
@:native("MIDIEditor_GetActive")
public static function midiEditorGetActive(): Hwnd;
/**
 * get the mode of a MIDI editor (0=piano roll, 1=event list, -1=invalid
 * editor)
see MIDIEditor_GetActive, MIDIEditor_OnCommand
 */
@:native("MIDIEditor_GetMode")
public static function midiEditorGetMode(mIdieditor: Hwnd): Int;
/**
 * Get settings from a MIDI editor. setting_desc can be:
snap_enabled: returns 0
 * or 1
active_note_row: returns 0-127
last_clicked_cc_lane: returns 0-127=CC,
 * 0x100|(0-31)=14-bit CC, 0x200=velocity, 0x201=pitch, 0x202=program,
 * 0x203=channel pressure, 0x204=bank/program select, 0x205=text, 0x206=sysex,
 * 0x207=off velocity, 0x208=notation events, 0x209=aftertouch, 0x210=media item
 * lane
default_note_vel: returns 0-127
default_note_chan: returns
 * 0-15
default_note_len: returns default length in MIDI ticks
scale_enabled:
 * returns 0-1
scale_root: returns 0-12 (0=C)
list_cnt: if viewing list view,
 * returns event count
if setting_desc is unsupported, the function returns
 * -1.
See MIDIEditor_SetSetting_int, MIDIEditor_GetActive,
 * MIDIEditor_GetSetting_str
 */
@:native("MIDIEditor_GetSetting_int")
public static function midiEditorGetSettingInt(mIdieditor: Hwnd, settingDesc: String): Int;
/**
 * Get settings from a MIDI editor. setting_desc can be:
last_clicked_cc_lane:
 * returns text description ("velocity", "pitch", etc)
scale: returns the scale
 * record, for example "102034050607" for a major scale
list_X: if viewing list
 * view, returns string describing event at row X (0-based). String will have a
 * list of key=value pairs, e.g. 'pos=4.0 len=4.0 offvel=127 msg=90317F'.
 * pos/len times are in QN, len/offvel may not be present if event is not a
 * note. other keys which may be present include pos_pq/len_pq, sel, mute,
 * ccval14, ccshape, ccbeztension.
if setting_desc is unsupported, the function
 * returns false.
See MIDIEditor_GetActive, MIDIEditor_GetSetting_int
 */
@:native("MIDIEditor_GetSetting_str")
public static function midiEditorGetSettingStr(mIdieditor: Hwnd, settingDesc: String): Bool;
/**
 * get the take that is currently being edited in this MIDI editor. see
 * MIDIEditor_EnumTakes
 */
@:native("MIDIEditor_GetTake")
public static function midiEditorGetTake(mIdieditor: Hwnd): MediaItemTake;
/**
 * Send an action command to the last focused MIDI editor. Returns false if
 * there is no MIDI editor open, or if the view mode (piano roll or event list)
 * does not match the input.
see MIDIEditor_OnCommand
 */
@:native("MIDIEditor_LastFocused_OnCommand")
public static function midiEditorLastFocusedOnCommand(commandId: Int, isListvieWcommand: Bool): Bool;
/**
 * Send an action command to a MIDI editor. Returns false if the supplied MIDI
 * editor pointer is not valid (not an open MIDI editor).
see
 * MIDIEditor_GetActive, MIDIEditor_LastFocused_OnCommand
 */
@:native("MIDIEditor_OnCommand")
public static function midiEditorOnCommand(mIdieditor: Hwnd, commandId: Int): Bool;
/**
 * Set settings for a MIDI editor. setting_desc can be:
active_note_row:
 * 0-127
See MIDIEditor_GetSetting_int
 */
@:native("MIDIEditor_SetSetting_int")
public static function midiEditorSetSettingInt(mIdieditor: Hwnd, settingDesc: String, setting: Int): Bool;
/**
 * Get or set MIDI editor settings for this track. pitchwheelrange: semitones up
 * or down. flags &1: snap pitch lane edits to semitones if pitchwheel range is
 * defined.
 */
@:native("MIDIEditorFlagsForTrack")
public static function midiEditorFlagsForTrack(track: MediaTrack, pitcHWHeelrange: Int, flags: Int, isSet: Bool): Int;
/** No description available */
@:native("mkpanstr")
public static function mkpanstr(strNeed64: String, pan: Float): String;
/** No description available */
@:native("mkvolpanstr")
public static function mkvolpanstr(strNeed64: String, vol: Float, pan: Float): String;
/** No description available */
@:native("mkvolstr")
public static function mkvolstr(strNeed64: String, vol: Float): String;
/** No description available */
@:native("MoveEditCursor")
public static function moveEditCursor(adjamt: Float, dosel: Bool): Void;
/**
 * returns TRUE if move succeeded
 */
@:native("MoveMediaItemToTrack")
public static function moveMediaItemToTrack(item: MediaItem, desttr: MediaTrack): Bool;
/** No description available */
@:native("MuteAllTracks")
public static function muteAllTracks(mute: Bool): Void;
/** No description available */
@:native("my_getViewport")
public static function myGetViewport(integerrLeft: Dynamic, integerrTop: Dynamic, integerrRigHt: Dynamic, integerrBot: Dynamic, srLeft: Int, srTop: Int, srRigHt: Int, srBot: Int, wantWorkArea: Bool): Void;
/**
 * Get the command ID number for named command that was registered by an
 * extension such as "_SWS_ABOUT" or "_113088d11ae641c193a2b7ede3041ad5" for a
 * ReaScript or a custom action.
 */
@:native("NamedCommandLookup")
public static function namedCommandLookup(commandName: String): Int;
/**
 * direct way to simulate pause button hit
 */
@:native("OnPauseButton")
public static function onPauseButton(): Void;
/**
 * direct way to simulate pause button hit
 */
@:native("OnPauseButtonEx")
public static function onPauseButtonEx(proj: ReaProject): Void;
/**
 * direct way to simulate play button hit
 */
@:native("OnPlayButton")
public static function onPlayButton(): Void;
/**
 * direct way to simulate play button hit
 */
@:native("OnPlayButtonEx")
public static function onPlayButtonEx(proj: ReaProject): Void;
/**
 * direct way to simulate stop button hit
 */
@:native("OnStopButton")
public static function onStopButton(): Void;
/**
 * direct way to simulate stop button hit
 */
@:native("OnStopButtonEx")
public static function onStopButtonEx(proj: ReaProject): Void;
/** No description available */
@:native("OpenColorThemeFile")
public static function openColorThemeFile(fn: String): Bool;
/**
 * Opens mediafn in the Media Explorer, play=true will play the file immediately
 * (or toggle playback if mediafn was already open), =false will just select it.
 */
@:native("OpenMediaExplorer")
public static function openMediaExplorer(mediaFn: String, plaY: Bool): Hwnd;
/**
 * Send an OSC message directly to REAPER. The value argument may be NULL. The
 * message will be matched against the default OSC patterns.
 */
@:native("OscLocalMessageToHost")
public static function oscLocalMessageToHost(message: String, ?valueIn: Float): Void;
/**
 * Parse hh:mm:ss.sss time string, return time in seconds (or 0.0 on error). See
 * parse_timestr_pos, parse_timestr_len.
 */
@:native("parse_timestr")
public static function parseTimestr(buf: String): Float;
/**
 * time formatting mode overrides: -1=proj default.
0=time
1=measures.beats +
 * time
2=measures.beats
3=seconds
4=samples
5=h:m:s:f
 */
@:native("parse_timestr_len")
public static function parseTimestrLen(buf: String, offSet: Float, modeoverrIde: Int): Float;
/**
 * Parse time string, time formatting mode overrides: -1=proj
 * default.
0=time
1=measures.beats +
 * time
2=measures.beats
3=seconds
4=samples
5=h:m:s:f
 */
@:native("parse_timestr_pos")
public static function parseTimestrPos(buf: String, modeoverrIde: Int): Float;
/** No description available */
@:native("parsepanstr")
public static function parsepanstr(str: String): Float;
/** No description available */
@:native("PCM_Sink_Enum")
public static function pcmSinkEnum(idX: Int): Int;
/** No description available */
@:native("PCM_Sink_GetExtension")
public static function pcmSinkGetExtension(data: String): String;
/** No description available */
@:native("PCM_Sink_ShowConfig")
public static function pcmSinkShowConfig(cfg: String, hWndParent: Hwnd): Hwnd;
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
/**
 * See PCM_Source_CreateFromFileEx.
 */
@:native("PCM_Source_CreateFromFile")
public static function pcmSourceCreateFromFile(fileName: String): PcmSource;
/**
 * Create a PCM_source from filename, and override pref of MIDI files being
 * imported as in-project MIDI events.
 */
@:native("PCM_Source_CreateFromFileEx")
public static function pcmSourceCreateFromFileEx(fileName: String, forcenoMIdiImp: Bool): PcmSource;
/**
 * Create a PCM_source from a "type" (use this if you're going to load its state
 * via LoadState/ProjectStateContext).
Valid types include "WAVE", "MIDI", or
 * whatever plug-ins define as well.
 */
@:native("PCM_Source_CreateFromType")
public static function pcmSourceCreateFromType(sourcetYpe: String): PcmSource;
/**
 * Deletes a PCM_source -- be sure that you remove any project reference before
 * deleting a source
 */
@:native("PCM_Source_Destroy")
public static function pcmSourceDestroy(src: PcmSource): Void;
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
 * If a section/reverse block, retrieves offset/len/reverse. return true if
 * success
 */
@:native("PCM_Source_GetSectionInfo")
public static function pcmSourceGetSectionInfo(src: PcmSource): Bool;
/** No description available */
@:native("PluginWantsAlwaysRunFx")
public static function pluginWantsAlwaysRunFx(amt: Int): Void;
/**
 * adds prevent_count to the UI refresh prevention state; always add then remove
 * the same amount, or major disfunction will occur
 */
@:native("PreventUIRefresh")
public static function preventUiRefresh(preventCount: Int): Void;
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
 * Causes REAPER to display the error message after the current ReaScript
 * finishes. If called within a Lua context and errmsg has a ! prefix, script
 * execution will be terminated.
 */
@:native("ReaScriptError")
public static function reaScriptError(errmsg: String): Void;
/**
 * returns positive value on success, 0 on failure.
 */
@:native("RecursiveCreateDirectory")
public static function recursiveCreateDirectory(patH: String, ignored: Int): Int;
/**
 * garbage-collects extra open files and closes them. if flags has 1 set, this
 * is done incrementally (call this from a regular timer, if desired). if flags
 * has 2 set, files are aggressively closed (they may need to be re-opened very
 * soon). returns number of files closed by this call.
 */
@:native("reduce_open_files")
public static function reduceOpenFiles(flags: Int): Int;
/**
 * See RefreshToolbar2.
 */
@:native("RefreshToolbar")
public static function refreshToolbar(commandId: Int): Void;
/**
 * Refresh the toolbar button states of a toggle action.
 */
@:native("RefreshToolbar2")
public static function refreshToolbar2(sectionId: Int, commandId: Int): Void;
/**
 * Makes a filename "in" relative to the current project, if any.
 */
@:native("relative_fn")
public static function relativeFn(_in: String, out: String): String;
/**
 * Remove a send/receive/hardware output, return true on success. category is <0
 * for receives, 0=sends, >0 for hardware outputs. See CreateTrackSend,
 * GetSetTrackSendInfo, GetTrackSendInfo_Value, SetTrackSendInfo_Value,
 * GetTrackNumSends.
 */
@:native("RemoveTrackSend")
public static function removeTrackSend(tr: MediaTrack, categorY: Int, sendIdX: Int): Bool;
/**
 * Not available while playing back.
 */
@:native("RenderFileSection")
public static function renderFileSection(sourceFileName: String, targetFileName: String, startPercent: Float, endPercent: Float, plaYRate: Float): Bool;
/**
 * Moves all selected tracks to immediately above track specified by index
 * beforeTrackIdx, returns false if no tracks were selected. makePrevFolder=0
 * for normal, 1 = as child of track preceding track specified by
 * beforeTrackIdx, 2 = if track preceding track specified by beforeTrackIdx is
 * last track in folder, extend folder
 */
@:native("ReorderSelectedTracks")
public static function reorderSelectedTracks(beforeTrackIdX: Int, makePrevFolder: Int): Bool;
/** No description available */
@:native("Resample_EnumModes")
public static function resampleEnumModes(mode: Int): String;
/**
 * See resolve_fn2.
 */
@:native("resolve_fn")
public static function resolveFn(_in: String, out: String): String;
/**
 * Resolves a filename "in" by using project settings etc. If no file found, out
 * will be a copy of in.
 */
@:native("resolve_fn2")
public static function resolveFn2(_in: String, out: String, ?cHeckSubDir: String): String;
/**
 * Resolve a wildcard string. Any wildcards that are valid in the Big Clock can
 * be resolved using this function. Pass in timePosition=-1 to use the current
 * project playback position.
 */
@:native("ResolveWildcards")
public static function resolveWildcards(project: ReaProject, timePosition: Float, wildcards: String, resolvedString: String): String;
/**
 * Get the named command for the given command ID. The returned string will not
 * start with '_' (e.g. it will return "SWS_ABOUT"), it will be NULL if
 * command_id is a native action.
 */
@:native("ReverseNamedCommandLookup")
public static function reverseNamedCommandLookup(commandId: Int): String;
/**
 * See GetEnvelopeScalingMode.
 */
@:native("ScaleFromEnvelopeMode")
public static function scaleFromEnvelopeMode(scalingMode: Int, val: Float): Float;
/**
 * See GetEnvelopeScalingMode.
 */
@:native("ScaleToEnvelopeMode")
public static function scaleToEnvelopeMode(scalingMode: Int, val: Float): Float;
/** No description available */
@:native("SectionFromUniqueID")
public static function sectionFromUniqueId(uniqueId: Int): KbdSectionInfo;
/** No description available */
@:native("SelectAllMediaItems")
public static function selectAllMediaItems(proj: ReaProject, selected: Bool): Void;
/** No description available */
@:native("SelectProjectInstance")
public static function selectProjectInstance(proj: ReaProject): Void;
/**
 * Sends a MIDI message to output device specified by output. Message is sent in
 * immediate mode. Lua example of how to pack the message string:
sysex = {
 * 0xF0, 0x00, 0xF7 }
msg = ""
for i=1, #sysex do msg = msg ..
 * string.char(sysex[i]) end
 */
@:native("SendMIDIMessageToHardware")
public static function sendMidiMessageToHardware(output: Int, msg: String): Void;
/**
 * set this take active in this media item
 */
@:native("SetActiveTake")
public static function setActiveTake(take: MediaItemTake): Void;
/**
 * sets all or selected tracks to mode.
 */
@:native("SetAutomationMode")
public static function setAutomationMode(mode: Int, onlYSel: Bool): Void;
/**
 * set current BPM in project, set wantUndo=true to add undo point
 */
@:native("SetCurrentBPM")
public static function setCurrentBpm(proj: ReaProject, bpm: Float, wantUndo: Bool): Void;
/**
 * You must use this to change the focus programmatically. mode=0 to focus track
 * panels, 1 to focus the arrange window, 2 to focus the arrange window and
 * select env (or env==NULL to clear the current track/take envelope selection)
 */
@:native("SetCursorContext")
public static function setCursorContext(mode: Int, envIn: TrackEnvelope): Void;
/** No description available */
@:native("SetEditCurPos")
public static function setEditCurPos(time: Float, movevieW: Bool, seekPlaY: Bool): Void;
/** No description available */
@:native("SetEditCurPos2")
public static function setEditCurPos2(proj: ReaProject, time: Float, movevieW: Bool, seekPlaY: Bool): Void;
/**
 * Set attributes of an envelope point. Values that are not supplied will be
 * ignored. If setting multiple points at once, set noSort=true, and call
 * Envelope_SortPoints when done. See SetEnvelopePointEx.
 */
@:native("SetEnvelopePoint")
public static function setEnvelopePoint(envelope: TrackEnvelope, ptIdX: Int, ?timeIn: Float, ?valueIn: Float, ?sHapeIn: Int, ?tensionIn: Float, ?selectedIn: Bool, ?noSortIn: Bool): Bool;
/**
 * Set attributes of an envelope point. Values that are not supplied will be
 * ignored. If setting multiple points at once, set noSort=true, and call
 * Envelope_SortPoints when done.
autoitem_idx=-1 for the underlying envelope, 0
 * for the first automation item on the envelope, etc.
For automation items,
 * pass autoitem_idx|0x10000000 to base ptidx on the number of points in one
 * full loop iteration,
even if the automation item is trimmed so that not all
 * points are visible.
Otherwise, ptidx will be based on the number of visible
 * points in the automation item, including all loop iterations.
See
 * CountEnvelopePointsEx, GetEnvelopePointEx, InsertEnvelopePointEx,
 * DeleteEnvelopePointEx.
 */
@:native("SetEnvelopePointEx")
public static function setEnvelopePointEx(envelope: TrackEnvelope, autoitemIdX: Int, ptIdX: Int, ?timeIn: Float, ?valueIn: Float, ?sHapeIn: Int, ?tensionIn: Float, ?selectedIn: Bool, ?noSortIn: Bool): Bool;
/**
 * Sets the RPPXML state of an envelope, returns true if successful. Undo flag
 * is a performance/caching hint.
 */
@:native("SetEnvelopeStateChunk")
public static function setEnvelopeStateChunk(env: TrackEnvelope, str: String, isundo: Bool): Bool;
/**
 * Set the extended state value for a specific section and key. persist=true
 * means the value should be stored and reloaded the next time REAPER is opened.
 * Note that with persist=true set, the value will be encoded as a text line in
 * an .ini file and may behaved in unexpected ways if it contains any newlines:
 * do not pass a string with newlines to this function. To save arbitrary data
 * persistently, use base64 encoding or similar. See GetExtState,
 * DeleteExtState, HasExtState.
 */
@:native("SetExtState")
public static function setExtState(section: String, keY: String, value: String, persist: Bool): Void;
/**
 * mode: see GetGlobalAutomationOverride
 */
@:native("SetGlobalAutomationOverride")
public static function setGlobalAutomationOverride(mode: Int): Void;
/**
 * Sets the RPPXML state of an item, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("SetItemStateChunk")
public static function setItemStateChunk(item: MediaItem, str: String, isundo: Bool): Bool;
/**
 * set &1 to show the master track in the TCP, &2 to HIDE in the mixer. Returns
 * the previous visibility state. See GetMasterTrackVisibility.
 */
@:native("SetMasterTrackVisibility")
public static function setMasterTrackVisibility(flag: Int): Int;
/**
 * Set media item numerical-value attributes.
B_MUTE : bool * : muted (item solo
 * overrides). setting this value will clear C_MUTE_SOLO.
B_MUTE_ACTUAL : bool *
 * : muted (ignores solo). setting this value will not affect
 * C_MUTE_SOLO.
C_LANEPLAYS : char * : on fixed lane tracks, 0=this item lane
 * does not play, 1=this item lane plays exclusively, 2=this item lane plays and
 * other lanes also play, -1=this item is on a non-visible, non-playing lane on
 * a formerly fixed-lane track (read-only)
C_MUTE_SOLO : char * : solo override
 * (-1=soloed, 0=no override, 1=unsoloed). note that this API does not
 * automatically unsolo other items when soloing (nor clear the unsolos when
 * clearing the last soloed item), it must be done by the caller via action or
 * via this API.
B_LOOPSRC : bool * : loop source
B_ALLTAKESPLAY : bool * : all
 * takes play
B_UISEL : bool * : selected in arrange view
C_BEATATTACHMODE :
 * char * : item timebase, -1=track or project default, 1=beats (position,
 * length, rate), 2=beats (position only). for auto-stretch timebase:
 * C_BEATATTACHMODE=1, C_AUTOSTRETCH=1
C_AUTOSTRETCH: : char * : auto-stretch at
 * project tempo changes, 1=enabled, requires C_BEATATTACHMODE=1
C_LOCK : char *
 * : locked, &1=locked
D_VOL : double * : item volume,  0=-inf, 0.5=-6dB,
 * 1=+0dB, 2=+6dB, etc
D_POSITION : double * : item position in seconds
D_LENGTH
 * : double * : item length in seconds
D_SNAPOFFSET : double * : item snap
 * offset in seconds
D_FADEINLEN : double * : item manual fadein length in
 * seconds
D_FADEOUTLEN : double * : item manual fadeout length in
 * seconds
D_FADEINDIR : double * : item fadein curvature, -1..1
D_FADEOUTDIR :
 * double * : item fadeout curvature, -1..1
D_FADEINLEN_AUTO : double * : item
 * auto-fadein length in seconds, -1=no auto-fadein
D_FADEOUTLEN_AUTO : double *
 * : item auto-fadeout length in seconds, -1=no auto-fadeout
C_FADEINSHAPE : int
 * * : fadein shape, 0..6, 0=linear
C_FADEOUTSHAPE : int * : fadeout shape,
 * 0..6, 0=linear
I_GROUPID : int * : group ID, 0=no group
I_LASTY : int * :
 * Y-position (relative to top of track) in pixels (read-only)
I_LASTH : int * :
 * height in pixels (read-only)
I_CUSTOMCOLOR : int * : custom color, OS
 * dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do
 * not |0x1000000, then it will not be used, but will store the color
I_CURTAKE
 * : int * : active take number
IP_ITEMNUMBER : int : item number on this track
 * (read-only, returns the item number directly)
F_FREEMODE_Y : float * : free
 * item positioning or fixed lane Y-position. 0=top of track, 1.0=bottom of
 * track
F_FREEMODE_H : float * : free item positioning or fixed lane height.
 * 0.5=half the track height, 1.0=full track height
I_FIXEDLANE : int * : fixed
 * lane of item (fine to call with setNewValue, but returned value is
 * read-only)
B_FIXEDLANE_HIDDEN : bool * : true if displaying only one fixed
 * lane and this item is in a different lane (read-only)
 */
@:native("SetMediaItemInfo_Value")
public static function setMediaItemInfoValue(item: MediaItem, pArmName: String, neWvalue: Float): Bool;
/**
 * Redraws the screen only if refreshUI == true.
See UpdateArrange().
 */
@:native("SetMediaItemLength")
public static function setMediaItemLength(item: MediaItem, lengtH: Float, refresHUi: Bool): Bool;
/**
 * Redraws the screen only if refreshUI == true.
See UpdateArrange().
 */
@:native("SetMediaItemPosition")
public static function setMediaItemPosition(item: MediaItem, position: Float, refresHUi: Bool): Bool;
/** No description available */
@:native("SetMediaItemSelected")
public static function setMediaItemSelected(item: MediaItem, selected: Bool): Void;
/**
 * Set media source of media item take. The old source will not be destroyed, it
 * is the caller's responsibility to retrieve it and destroy it after. If source
 * already exists in any project, it will be duplicated before being set. C/C++
 * code should not use this and instead use GetSetMediaItemTakeInfo() with
 * P_SOURCE to manage ownership directly.
 */
@:native("SetMediaItemTake_Source")
public static function setMediaItemTakeSource(take: MediaItemTake, source: PcmSource): Bool;
/**
 * Set media item take numerical-value attributes.
D_STARTOFFS : double * :
 * start offset in source media, in seconds
D_VOL : double * : take volume,
 * 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc, negative if take polarity is
 * flipped
D_PAN : double * : take pan, -1..1
D_PANLAW : double * : take pan
 * law, -1=default, 0.5=-6dB, 1.0=+0dB, etc
D_PLAYRATE : double * : take
 * playback rate, 0.5=half speed, 1=normal, 2=double speed, etc
D_PITCH : double
 * * : take pitch adjustment in semitones, -12=one octave down, 0=normal,
 * +12=one octave up, etc
B_PPITCH : bool * : preserve pitch when changing
 * playback rate
I_LASTY : int * : Y-position (relative to top of track) in
 * pixels (read-only)
I_LASTH : int * : height in pixels (read-only)
I_CHANMODE
 * : int * : channel mode, 0=normal, 1=reverse stereo, 2=downmix, 3=left,
 * 4=right
I_PITCHMODE : int * : pitch shifter mode, -1=project default,
 * otherwise high 2 bytes=shifter, low 2 bytes=parameter
I_STRETCHFLAGS : int *
 * : stretch marker flags (&7 mask for mode override: 0=default, 1=balanced,
 * 2/3/6=tonal, 4=transient, 5=no pre-echo)
F_STRETCHFADESIZE : float * :
 * stretch marker fade size in seconds (0.0025 default)
I_RECPASSID : int * :
 * record pass ID
I_TAKEFX_NCH : int * : number of internal audio channels for
 * per-take FX to use (OK to call with setNewValue, but the returned value is
 * read-only)
I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000
 * (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will
 * not be used, but will store the color
IP_SPECEDIT:CNT : int : spectral edit
 * count (read-only)
IP_SPECEDIT:DELETE:x : int : read or write this key to
 * remove the spectral edit specified
IP_SPECEDIT:ADD : int : read or write this
 * key to add a new spectral edit (returns index)
IP_SPECEDIT:SORT : int : read
 * or write this key to re-sort spectral edits (be sure to do this following a
 * position change or insert of new edit)
I_SPECEDIT:FFT_SIZE : int * : FFT size
 * used by spectral edits for this take
D_SPECEDIT:x:POSITION : double * :
 * position of spectral edit start (changing this requires a resort of spectral
 * edits)
D_SPECEDIT:x:LENGTH : double * : length of spectral
 * edit
F_SPECEDIT:x:GAIN : float * : gain of spectral edit
F_SPECEDIT:x:FADE_IN
 * : float * : fade-in size 0..1
F_SPECEDIT:x:FADE_OUT : float * : fade-out size
 * 0..1
F_SPECEDIT:x:FADE_LOW : float * : fade-lf size 0..1
F_SPECEDIT:x:FADE_HI
 * : float * : fade-hf size 0..1
I_SPECEDIT:x:CHAN : int * : channel index, -1
 * for omni
I_SPECEDIT:x:FLAGS : int * : flags, &1=bypassed,
 * &2=solo
F_SPECEDIT:x:GATE_THRESH : float * : gate
 * threshold
F_SPECEDIT:x:GATE_FLOOR : float * : gate
 * floor
F_SPECEDIT:x:COMP_THRESH : float * : comp
 * threshold
F_SPECEDIT:x:COMP_RATIO : float * : comp
 * ratio
B_SPECEDIT:x:SELECTED : bool * : selection
 * state
I_SPECEDIT:x:TOPFREQ_CNT : int * : (read-only) number of top
 * frequency-points
I_SPECEDIT:x:TOPFREQ_ADD:pos:val : int * : reading or
 * writing will insert top frequency-point with position/value pair, returns
 * index
I_SPECEDIT:x:TOPFREQ_DEL:y : int * : reading or writing will delete top
 * frequency-point y. there will always be at least one
 * point.
F_SPECEDIT:x:TOPFREQ_POS:y : float * : (read-only) get position of top
 * frequency-point y
F_SPECEDIT:x:TOPFREQ_FREQ:y : float * : (read-only) get
 * frequency of top frequency-point y
I_SPECEDIT:x:BOTFREQ_CNT : int * : number
 * of bottom frequency-points
I_SPECEDIT:x:BOTFREQ_ADD:pos:val : int * : reading
 * or writing will insert bottom frequency-point with position/value pair,
 * returns index
I_SPECEDIT:x:BOTFREQ_DEL:y : int * : reading or writing will
 * delete bottom frequency-point y. there will always be at least one
 * point.
F_SPECEDIT:x:BOTFREQ_POS:y : float * : (read-only) get position of
 * bottom frequency-point y
F_SPECEDIT:x:BOTFREQ_FREQ:y : float * : (read-only)
 * get frequency of bottom frequency-point y
IP_TAKENUMBER : int : take number
 * (read-only, returns the take number directly)
 */
@:native("SetMediaItemTakeInfo_Value")
public static function setMediaItemTakeInfoValue(take: MediaItemTake, pArmName: String, neWvalue: Float): Bool;
/**
 * Set track numerical-value attributes.
B_MUTE : bool * : muted
B_PHASE : bool
 * * : track phase inverted
B_RECMON_IN_EFFECT : bool * : record monitoring in
 * effect (current audio-thread playback state, read-only)
IP_TRACKNUMBER : int
 * : track number 1-based, 0=not found, -1=master track (read-only, returns the
 * int directly)
I_SOLO : int * : soloed, 0=not soloed, 1=soloed, 2=soloed in
 * place, 5=safe soloed, 6=safe soloed in place
B_SOLO_DEFEAT : bool * : when
 * set, if anything else is soloed and this track is not muted, this track acts
 * soloed
I_FXEN : int * : fx enabled, 0=bypassed, !0=fx active
I_RECARM : int *
 * : record armed, 0=not record armed, 1=record armed
I_RECINPUT : int * :
 * record input, <0=no input. if 4096 set, input is MIDI and low 5 bits
 * represent channel (0=all, 1-16=only chan), next 6 bits represent physical
 * input (63=all, 62=VKB). If 4096 is not set, low 10 bits (0..1023) are input
 * start channel (ReaRoute/Loopback start at 512). If 2048 is set, input is
 * multichannel input (using track channel count), or if 1024 is set, input is
 * stereo input, otherwise input is mono.
I_RECMODE : int * : record mode,
 * 0=input, 1=stereo out, 2=none, 3=stereo out w/latency compensation, 4=midi
 * output, 5=mono out, 6=mono out w/ latency compensation, 7=midi overdub,
 * 8=midi replace
I_RECMODE_FLAGS : int * : record mode flags, &3=output
 * recording mode (0=post fader, 1=pre-fx, 2=post-fx/pre-fader)
I_RECMON : int *
 * : record monitoring, 0=off, 1=normal, 2=not when playing (tape
 * style)
I_RECMONITEMS : int * : monitor items while recording, 0=off,
 * 1=on
B_AUTO_RECARM : bool * : automatically set record arm when selected
 * (does not immediately affect recarm state, script should set directly if
 * desired)
I_VUMODE : int * : track vu mode, &1:disabled, &30==0:stereo peaks,
 * &30==2:multichannel peaks, &30==4:stereo RMS, &30==8:combined RMS,
 * &30==12:LUFS-M, &30==16:LUFS-S (readout=max), &30==20:LUFS-S
 * (readout=current), &32:LUFS calculation on channels 1+2 only
I_AUTOMODE : int
 * * : track automation mode, 0=trim/off, 1=read, 2=touch, 3=write,
 * 4=latch
I_NCHAN : int * : number of track channels, 2-128, even numbers
 * only
I_SELECTED : int * : track selected, 0=unselected, 1=selected
I_WNDH :
 * int * : current TCP window height in pixels including envelopes
 * (read-only)
I_TCPH : int * : current TCP window height in pixels not
 * including envelopes (read-only)
I_TCPY : int * : current TCP window
 * Y-position in pixels relative to top of arrange view (read-only)
I_MCPX : int
 * * : current MCP X-position in pixels relative to mixer container
 * (read-only)
I_MCPY : int * : current MCP Y-position in pixels relative to
 * mixer container (read-only)
I_MCPW : int * : current MCP width in pixels
 * (read-only)
I_MCPH : int * : current MCP height in pixels
 * (read-only)
I_FOLDERDEPTH : int * : folder depth change, 0=normal, 1=track is
 * a folder parent, -1=track is the last in the innermost folder, -2=track is
 * the last in the innermost and next-innermost folders, etc
I_FOLDERCOMPACT :
 * int * : folder collapsed state (only valid on folders), 0=normal,
 * 1=collapsed, 2=fully collapsed
I_MIDIHWOUT : int * : track midi hardware
 * output index, <0=disabled, low 5 bits are which channels (0=all, 1-16), next
 * 5 bits are output device index (0-31)
I_MIDI_INPUT_CHANMAP : int * : -1 maps
 * to source channel, otherwise 1-16 to map to MIDI channel
I_MIDI_CTL_CHAN :
 * int * : -1 no link, 0-15 link to MIDI volume/pan on channel, 16 link to MIDI
 * volume/pan on all channels
I_MIDI_TRACKSEL_FLAG : int * : MIDI editor track
 * list options: &1=expand media items, &2=exclude from list,
 * &4=auto-pruned
I_PERFFLAGS : int * : track performance flags, &1=no media
 * buffering, &2=no anticipative FX
I_CUSTOMCOLOR : int * : custom color, OS
 * dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do
 * not |0x1000000, then it will not be used, but will store the
 * color
I_HEIGHTOVERRIDE : int * : custom height override for TCP window, 0 for
 * none, otherwise size in pixels
I_SPACER : int * : 1=TCP track spacer above
 * this trackB_HEIGHTLOCK : bool * : track height lock (must set
 * I_HEIGHTOVERRIDE before locking)
D_VOL : double * : trim volume of track,
 * 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
D_PAN : double * : trim pan of track,
 * -1..1
D_WIDTH : double * : width of track, -1..1
D_DUALPANL : double * :
 * dualpan position 1, -1..1, only if I_PANMODE==6
D_DUALPANR : double * :
 * dualpan position 2, -1..1, only if I_PANMODE==6
I_PANMODE : int * : pan mode,
 * 0=classic 3.x, 3=new balance, 5=stereo pan, 6=dual pan
D_PANLAW : double * :
 * pan law of track, <0=project default, 0.5=-6dB, 0.707..=-3dB, 1=+0dB,
 * 1.414..=-3dB with gain compensation, 2=-6dB with gain compensation,
 * etc
I_PANLAW_FLAGS : int * : pan law flags, 0=sine taper, 1=hybrid taper with
 * deprecated behavior when gain compensation enabled, 2=linear taper, 3=hybrid
 * taper
P_ENV:<envchunkname or P_ENV:{GUID... : TrackEnvelope * : (read-only)
 * chunkname can be <VOLENV, <PANENV, etc; GUID is the stringified envelope
 * GUID.
B_SHOWINMIXER : bool * : track control panel visible in mixer (do not
 * use on master track)
B_SHOWINTCP : bool * : track control panel visible in
 * arrange view (do not use on master track)
B_MAINSEND : bool * : track sends
 * audio to parent
C_MAINSEND_OFFS : char * : channel offset of track send to
 * parent
C_MAINSEND_NCH : char * : channel count of track send to parent (0=use
 * all child track channels, 1=use one channel only)
I_FREEZECOUNT : int * :
 * (read-only) freeze state count
I_FREEMODE : int * : 1=track free item
 * positioning enabled, 2=track fixed lanes enabled (call UpdateTimeline() after
 * changing)
I_NUMFIXEDLANES : int * : number of track fixed lanes (fine to call
 * with setNewValue, but returned value is read-only)
C_LANESCOLLAPSED : char *
 * : fixed lane collapse state (1=lanes collapsed, 2=track displays as
 * non-fixed-lanes but hidden lanes exist)
C_LANESETTINGS : char * : fixed lane
 * settings (&1=auto-remove empty lanes at bottom, &2=do not auto-comp new
 * recording, &4=newly recorded lanes play exclusively (else add lanes in
 * layers), &8=big lanes (else small lanes), &16=add new recording at bottom
 * (else record into first available lane), &32=hide lane buttons
C_LANEPLAYS:N
 * : char * :  on fixed lane tracks, 0=lane N does not play, 1=lane N plays
 * exclusively, 2=lane N plays and other lanes also play (fine to call with
 * setNewValue, but returned value is read-only)
C_ALLLANESPLAY : char * : on
 * fixed lane tracks, 0=no lanes play, 1=all lanes play, 2=some lanes play (fine
 * to call with setNewValue 0 or 1, but returned value is
 * read-only)
C_BEATATTACHMODE : char * : track timebase, -1=project default,
 * 0=time, 1=beats (position, length, rate), 2=beats (position
 * only)
F_MCP_FXSEND_SCALE : float * : scale of fx+send area in MCP (0=minimum
 * allowed, 1=maximum allowed)
F_MCP_FXPARM_SCALE : float * : scale of fx
 * parameter area in MCP (0=minimum allowed, 1=maximum
 * allowed)
F_MCP_SENDRGN_SCALE : float * : scale of send area as proportion of
 * the fx+send total area (0=minimum allowed, 1=maximum
 * allowed)
F_TCP_FXPARM_SCALE : float * : scale of TCP parameter area when TCP
 * FX are embedded (0=min allowed, default, 1=max allowed)
I_PLAY_OFFSET_FLAG :
 * int * : track media playback offset state, &1=bypassed, &2=offset value is
 * measured in samples (otherwise measured in seconds)
D_PLAY_OFFSET : double *
 * : track media playback offset, units depend on I_PLAY_OFFSET_FLAG
 */
@:native("SetMediaTrackInfo_Value")
public static function setMediaTrackInfoValue(tr: MediaTrack, pArmName: String, neWvalue: Float): Bool;
/**
 * Set the MIDI editor grid division. 0.25=quarter note, 1.0/3.0=half note
 * tripet, etc. Sets the swing enabled/strength from the arrange settings.
 */
@:native("SetMIDIEditorGrid")
public static function setMidiEditorGrid(project: ReaProject, division: Float): Void;
/**
 * Scroll the mixer so that leftmosttrack is the leftmost visible track. Returns
 * the leftmost track after scrolling, which may be different from the passed-in
 * track if there are not enough tracks to its right.
 */
@:native("SetMixerScroll")
public static function setMixerScroll(leftmosttrack: MediaTrack): MediaTrack;
/**
 * Set the mouse modifier assignment for a specific modifier key assignment, in
 * a specific context.
Context is a string like "MM_CTX_ITEM" (see
 * reaper-mouse.ini) or "Media item left drag" (unlocalized).
Modifier flag is a
 * number from 0 to 15: add 1 for shift, 2 for control, 4 for alt, 8 for
 * win.
(macOS: add 1 for shift, 2 for command, 4 for opt, 8 for control.)
For
 * left-click and double-click contexts, the action can be any built-in command
 * ID number
or any custom action ID string. Find built-in command IDs in the
 * REAPER actions window
(enable "show command IDs" in the context menu), and
 * find custom action ID strings in reaper-kb.ini.
The action string may be a
 * mouse modifier ID (see reaper-mouse.ini) with " m" appended to it,
or (for
 * click/double-click contexts) a command ID with " c" appended to it,
or the
 * text that appears in the mouse modifiers preferences dialog, like "Move item"
 * (unlocalized).
For example, SetMouseModifier("MM_CTX_ITEM", 0, "1 m") and
 * SetMouseModifier("Media item left drag", 0, "Move item") are
 * equivalent.
SetMouseModifier(context, modifier_flag, -1) will reset that
 * mouse modifier to default.
SetMouseModifier(context, -1, -1) will reset the
 * entire context to default.
SetMouseModifier(-1, -1, -1) will reset all
 * contexts to default.
See GetMouseModifier.
 */
@:native("SetMouseModifier")
public static function setMouseModifier(conteXt: String, modifierFlag: Int, action: String): Void;
/**
 * Set exactly one track selected, deselect all others
 */
@:native("SetOnlyTrackSelected")
public static function setOnlyTrackSelected(track: MediaTrack): Void;
/**
 * Set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half note
 * triplet, etc.
 */
@:native("SetProjectGrid")
public static function setProjectGrid(project: ReaProject, division: Float): Void;
/**
 * Note: this function can't clear a marker's name (an empty string will leave
 * the name unchanged), see SetProjectMarker4.
 */
@:native("SetProjectMarker")
public static function setProjectMarker(markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String): Bool;
/**
 * Note: this function can't clear a marker's name (an empty string will leave
 * the name unchanged), see SetProjectMarker4.
 */
@:native("SetProjectMarker2")
public static function setProjectMarker2(proj: ReaProject, markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String): Bool;
/**
 * Note: this function can't clear a marker's name (an empty string will leave
 * the name unchanged), see SetProjectMarker4.
 */
@:native("SetProjectMarker3")
public static function setProjectMarker3(proj: ReaProject, markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String, color: Int): Bool;
/**
 * color should be 0 to not change, or ColorToNative(r,g,b)|0x1000000, flags&1
 * to clear name
 */
@:native("SetProjectMarker4")
public static function setProjectMarker4(proj: ReaProject, markrgnindeXnumber: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String, color: Int, flags: Int): Bool;
/**
 * See SetProjectMarkerByIndex2.
 */
@:native("SetProjectMarkerByIndex")
public static function setProjectMarkerByIndex(proj: ReaProject, markrgnIdX: Int, isrgn: Bool, pos: Float, rgnend: Float, idnumber: Int, name: String, color: Int): Bool;
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
public static function setProjectMarkerByIndex2(proj: ReaProject, markrgnIdX: Int, isrgn: Bool, pos: Float, rgnend: Float, idnumber: Int, name: String, color: Int, flags: Int): Bool;
/**
 * Save a key/value pair for a specific extension, to be restored the next time
 * this specific project is loaded. Typically extname will be the name of a
 * reascript or extension section. If key is NULL or "", all extended data for
 * that extname will be deleted.  If val is NULL or "", the data previously
 * associated with that key will be deleted. Returns the size of the state for
 * this extname. See GetProjExtState, EnumProjExtState.
 */
@:native("SetProjExtState")
public static function setProjExtState(proj: ReaProject, eXtName: String, keY: String, value: String): Int;
/**
 * Add (flag > 0) or remove (flag < 0) a track from this region when using the
 * region render matrix. If adding, flag==2 means force mono, flag==4 means
 * force stereo, flag==N means force N/2 channels.
 */
@:native("SetRegionRenderMatrix")
public static function setRegionRenderMatrix(proj: ReaProject, regionindeX: Int, track: MediaTrack, flag: Int): Void;
/**
 * Inserts or updates a take marker. If idx<0, a take marker will be added,
 * otherwise an existing take marker will be updated. Returns the index of the
 * new or updated take marker (which may change if srcPos is updated). See
 * GetNumTakeMarkers, GetTakeMarker, DeleteTakeMarker
 */
@:native("SetTakeMarker")
public static function setTakeMarker(take: MediaItemTake, idX: Int, nameIn: String, ?srcPosIn: Float, ?colorIn: Int): Int;
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
 * See GetTakeStretchMarkerSlope
 */
@:native("SetTakeStretchMarkerSlope")
public static function setTakeStretchMarkerSlope(take: MediaItemTake, idX: Int, slope: Float): Bool;
/**
 * Set parameters of a tempo/time signature marker. Provide either timepos (with
 * measurepos=-1, beatpos=-1), or measurepos and beatpos (with timepos=-1). If
 * timesig_num and timesig_denom are zero, the previous time signature will be
 * used. ptidx=-1 will insert a new tempo/time signature marker. See
 * CountTempoTimeSigMarkers, GetTempoTimeSigMarker, AddTempoTimeSigMarker.
 */
@:native("SetTempoTimeSigMarker")
public static function setTempoTimeSigMarker(proj: ReaProject, ptIdX: Int, timePos: Float, measurePos: Int, beatPos: Float, bpm: Float, timesigNum: Int, timesigDenom: Int, linearTempo: Bool): Bool;
/**
 * Temporarily updates the theme color to the color specified (or the theme
 * default color if -1 is specified). Returns -1 on failure, otherwise returns
 * the color (or transformed-color). Note that the UI is not updated by this,
 * the caller should call UpdateArrange() etc as necessary. If the low bit of
 * flags is set, any color transformations are bypassed. To read a value see
 * GetThemeColor.
Currently valid ini_keys:
 */
@:native("SetThemeColor")
public static function setThemeColor(iniKeY: String, color: Int, flags: Int): Int;
/**
 * Updates the toggle state of an action, returns true if succeeded. Only
 * ReaScripts can have their toggle states changed programmatically. See
 * RefreshToolbar2.
 */
@:native("SetToggleCommandState")
public static function setToggleCommandState(sectionId: Int, commandId: Int, state: Int): Bool;
/** No description available */
@:native("SetTrackAutomationMode")
public static function setTrackAutomationMode(tr: MediaTrack, mode: Int): Void;
/**
 * Set the custom track color, color is OS dependent (i.e. ColorToNative(r,g,b).
 * To unset the track color, see SetMediaTrackInfo_Value I_CUSTOMCOLOR
 */
@:native("SetTrackColor")
public static function setTrackColor(track: MediaTrack, color: Int): Void;
/**
 * Set all MIDI lyrics on the track. Lyrics will be stuffed into any MIDI items
 * found in range. Flag is unused at present. str is passed in as beat position,
 * tab, text, tab (example with flag=2: "1.1.2\tLyric for measure 1 beat
 * 2\t2.1.1\tLyric for measure 2 beat 1	"). See GetTrackMIDILyrics
 */
@:native("SetTrackMIDILyrics")
public static function setTrackMidiLyrics(track: MediaTrack, flag: Int, str: String): Bool;
/**
 * channel < 0 assigns these note names to all channels.
 */
@:native("SetTrackMIDINoteName")
public static function setTrackMidiNoteName(track: Int, pitcH: Int, cHan: Int, name: String): Bool;
/**
 * channel < 0 assigns note name to all channels. pitch 128 assigns name for
 * CC0, pitch 129 for CC1, etc.
 */
@:native("SetTrackMIDINoteNameEx")
public static function setTrackMidiNoteNameEx(proj: ReaProject, track: MediaTrack, pitcH: Int, cHan: Int, name: String): Bool;
/** No description available */
@:native("SetTrackSelected")
public static function setTrackSelected(track: MediaTrack, selected: Bool): Void;
/**
 * Set send/receive/hardware output numerical-value attributes, return true on
 * success.
category is <0 for receives, 0=sends, >0 for hardware
 * outputs
parameter names:
B_MUTE : bool *
B_PHASE : bool * : true to flip
 * phase
B_MONO : bool *
D_VOL : double * : 1.0 = +0dB etc
D_PAN : double * :
 * -1..+1
D_PANLAW : double * : 1.0=+0.0db, 0.5=-6dB, -1.0 = projdef
 * etc
I_SENDMODE : int * : 0=post-fader, 1=pre-fx, 2=post-fx (deprecated),
 * 3=post-fx
I_AUTOMODE : int * : automation mode (-1=use track automode,
 * 0=trim/off, 1=read, 2=touch, 3=write, 4=latch)
I_SRCCHAN : int * : -1 for no
 * audio send. Low 10 bits specify channel offset, and higher bits specify
 * channel count. (srcchan>>10) == 0 for stereo, 1 for mono, 2 for 4 channel, 3
 * for 6 channel, etc.
I_DSTCHAN : int * : low 10 bits are destination index,
 * &1024 set to mix to mono.
I_MIDIFLAGS : int * : low 5 bits=source channel
 * 0=all, 1-16, 31=MIDI send disabled, next 5 bits=dest channel, 0=orig,
 * 1-16=chan. &1024 for faders-send MIDI vol/pan. (>>14)&255 = src bus (0 for
 * all, 1 for normal, 2+). (>>22)&255=destination bus (0 for all, 1 for normal,
 * 2+)
See CreateTrackSend, RemoveTrackSend, GetTrackNumSends.
 */
@:native("SetTrackSendInfo_Value")
public static function setTrackSendInfoValue(tr: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String, neWvalue: Float): Bool;
/**
 * send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
 * isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal
 * tweak.
 */
@:native("SetTrackSendUIPan")
public static function setTrackSendUiPan(track: MediaTrack, sendIdX: Int, pan: Float, isend: Int): Bool;
/**
 * send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
 * isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal
 * tweak.
 */
@:native("SetTrackSendUIVol")
public static function setTrackSendUiVol(track: MediaTrack, sendIdX: Int, vol: Float, isend: Int): Bool;
/**
 * Sets the RPPXML state of a track, returns true if successful. Undo flag is a
 * performance/caching hint.
 */
@:native("SetTrackStateChunk")
public static function setTrackStateChunk(track: MediaTrack, str: String, isundo: Bool): Bool;
/**
 * monitor: 0=no monitoring, 1=monitoring, 2=auto-monitoring. returns new value
 * or -1 if error. igngroupflags: &1 to prevent track grouping, &2 to prevent
 * selection ganging
 */
@:native("SetTrackUIInputMonitor")
public static function setTrackUiInputMonitor(track: MediaTrack, monitor: Int, igngroupFlags: Int): Int;
/**
 * mute: <0 toggles, >0 sets mute, 0=unsets mute. returns new value or -1 if
 * error. igngroupflags: &1 to prevent track grouping, &2 to prevent selection
 * ganging
 */
@:native("SetTrackUIMute")
public static function setTrackUiMute(track: MediaTrack, mute: Int, igngroupFlags: Int): Int;
/**
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUIPan")
public static function setTrackUiPan(track: MediaTrack, pan: Float, relative: Bool, done: Bool, igngroupFlags: Int): Float;
/**
 * polarity (AKA phase): <0 toggles, 0=normal, >0=inverted. returns new value or
 * -1 if error.igngroupflags: &1 to prevent track grouping, &2 to prevent
 * selection ganging
 */
@:native("SetTrackUIPolarity")
public static function setTrackUiPolarity(track: MediaTrack, polaritY: Int, igngroupFlags: Int): Int;
/**
 * recarm: <0 toggles, >0 sets recarm, 0=unsets recarm. returns new value or -1
 * if error. igngroupflags: &1 to prevent track grouping, &2 to prevent
 * selection ganging
 */
@:native("SetTrackUIRecArm")
public static function setTrackUiRecArm(track: MediaTrack, recArm: Int, igngroupFlags: Int): Int;
/**
 * solo: <0 toggles, 1 sets solo (default mode), 0=unsets solo, 2 sets solo
 * (non-SIP), 4 sets solo (SIP). returns new value or -1 if error.
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUISolo")
public static function setTrackUiSolo(track: MediaTrack, solo: Int, igngroupFlags: Int): Int;
/**
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUIVolume")
public static function setTrackUiVolume(track: MediaTrack, volume: Float, relative: Bool, done: Bool, igngroupFlags: Int): Float;
/**
 * igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
 */
@:native("SetTrackUIWidth")
public static function setTrackUiWidth(track: MediaTrack, wIdtH: Float, relative: Bool, done: Bool, igngroupFlags: Int): Float;
/** No description available */
@:native("ShowActionList")
public static function showActionList(section: KbdSectionInfo, callerWnd: Hwnd): Void;
/**
 * Show a message to the user (also useful for debugging). Send "\n" for
 * newline, "" to clear the console. Prefix string with "!SHOW:" and text will
 * be added to console without opening the window. See ClearConsole
 */
@:native("ShowConsoleMsg")
public static function showConsoleMsg(msg: String): Void;
/**
 * type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL :
 * ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO
 */
@:native("ShowMessageBox")
public static function showMessageBox(msg: String, title: String, tYpe: Int): Int;
/**
 * shows a context menu, valid names include: track_input, track_panel,
 * track_area, track_routing, item, ruler, envelope, envelope_point,
 * envelope_item. ctxOptional can be a track pointer for track_*, item pointer
 * for item* (but is optional). for envelope_point, ctx2Optional has point
 * index, ctx3Optional has item index (0=main envelope, 1=first AI). for
 * envelope_item, ctx2Optional has AI index (1=first AI)
 */
@:native("ShowPopupMenu")
public static function showPopupMenu(name: String, x: Int, y: Int, hWndParent: Hwnd, ctX: Identifier, ctX2: Int, ctX3: Int): Void;
/** No description available */
@:native("SLIDER2DB")
public static function slider2Db(y: Float): Float;
/** No description available */
@:native("SnapToGrid")
public static function snapToGrid(project: ReaProject, timePos: Float): Float;
/**
 * solo=2 for SIP
 */
@:native("SoloAllTracks")
public static function soloAllTracks(solo: Int): Void;
/**
 * gets the splash window, in case you want to display a message over it.
 * Returns NULL when the splash window is not displayed.
 */
@:native("Splash_GetWnd")
public static function splashGetWnd(): Hwnd;
/**
 * the original item becomes the left-hand split, the function returns the
 * right-hand split (or NULL if the split failed)
 */
@:native("SplitMediaItem")
public static function splitMediaItem(item: MediaItem, position: Float): MediaItem;
/** No description available */
@:native("stringToGuid")
public static function stringToGuid(str: String, gGuId: String): String;
/**
 * Stuffs a 3 byte MIDI message into either the Virtual MIDI Keyboard queue, or
 * the MIDI-as-control input queue, or sends to a MIDI hardware output. mode=0
 * for VKB, 1 for control (actions map etc), 2 for VKB-on-current-channel; 16
 * for external MIDI device 0, 17 for external MIDI device 1, etc; see
 * GetNumMIDIOutputs, GetMIDIOutputName.
 */
@:native("StuffMIDIMessage")
public static function stuffMidiMessage(mode: Int, msg1: Int, msg2: Int, msg3: Int): Void;
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
 * returns index of effect visible in chain, or -1 for chain hidden, or -2 for
 * chain visible but no effect selected
 */
@:native("TakeFX_GetChainVisible")
public static function takeFxGetChainVisible(take: MediaItemTake): Int;
/** No description available */
@:native("TakeFX_GetCount")
public static function takeFxGetCount(take: MediaItemTake): Int;
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
@:native("TakeFX_GetFXName")
public static function takeFxGetFxName(take: MediaItemTake, fX: Int): Bool;
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
@:native("TakeFX_GetParamEx")
public static function takeFxGetParamEx(take: MediaItemTake, fX: Int, param: Int): Float;
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
 * Returns true if the active take contains MIDI.
 */
@:native("TakeIsMIDI")
public static function takeIsMidi(take: MediaItemTake): Bool;
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
 * returns theme layout parameter. return value is cfg-name, or nil/empty if out
 * of range.
 */
@:native("ThemeLayout_GetParameter")
public static function themeLayoutGetParameter(wp: Int): String;
/**
 * Refreshes all layouts
 */
@:native("ThemeLayout_RefreshAll")
public static function themeLayoutRefreshAll(): Void;
/**
 * Sets theme layout override for a particular section -- section can be
 * 'global' or 'mcp' etc. If setting global layout, prefix a ! to the layout
 * string to clear any per-layout overrides. Returns false if failed.
 */
@:native("ThemeLayout_SetLayout")
public static function themeLayoutSetLayout(section: String, laYout: String): Bool;
/**
 * sets theme layout parameter to value. persist=true in order to have change
 * loaded on next theme load. note that the caller should update layouts via ???
 * to make changes visible.
 */
@:native("ThemeLayout_SetParameter")
public static function themeLayoutSetParameter(wp: Int, value: Int, persist: Bool): Bool;
/**
 * Gets a precise system timestamp in seconds
 */
@:native("time_precise")
public static function timePrecise(): Float;
/**
 * convert a beat position (or optionally a beats+measures if measures is
 * non-NULL) to time.
 */
@:native("TimeMap2_beatsToTime")
public static function timeMap2BeatsToTime(proj: ReaProject, tPos: Float, ?measuresIn: Int): Float;
/**
 * get the effective BPM at the time (seconds) position (i.e. 2x in /8
 * signatures)
 */
@:native("TimeMap2_GetDividedBpmAtTime")
public static function timeMap2GetDividedBpmAtTime(proj: ReaProject, time: Float): Float;
/**
 * when does the next time map (tempo or time sig) change occur
 */
@:native("TimeMap2_GetNextChangeTime")
public static function timeMap2GetNextChangeTime(proj: ReaProject, time: Float): Float;
/**
 * converts project QN position to time.
 */
@:native("TimeMap2_QNToTime")
public static function timeMap2QnToTime(proj: ReaProject, qn: Float): Float;
/**
 * convert a time into beats.
if measures is non-NULL, measures will be set to
 * the measure count, return value will be beats since measure.
if cml is
 * non-NULL, will be set to current measure length in beats (i.e. time signature
 * numerator)
if fullbeats is non-NULL, and measures is non-NULL, fullbeats will
 * get the full beat count (same value returned if measures is NULL).
if cdenom
 * is non-NULL, will be set to the current time signature denominator.
 */
@:native("TimeMap2_timeToBeats")
public static function timeMap2TimeToBeats(proj: ReaProject, tPos: Float): Float;
/**
 * converts project time position to QN position.
 */
@:native("TimeMap2_timeToQN")
public static function timeMap2TimeToQn(proj: ReaProject, tPos: Float): Float;
/**
 * Gets project framerate, and optionally whether it is drop-frame timecode
 */
@:native("TimeMap_curFrameRate")
public static function timeMapCurFrameRate(proj: ReaProject): Float;
/**
 * get the effective BPM at the time (seconds) position (i.e. 2x in /8
 * signatures)
 */
@:native("TimeMap_GetDividedBpmAtTime")
public static function timeMapGetDividedBpmAtTime(time: Float): Float;
/**
 * Get the QN position and time signature information for the start of a
 * measure. Return the time in seconds of the measure start.
 */
@:native("TimeMap_GetMeasureInfo")
public static function timeMapGetMeasureInfo(proj: ReaProject, measure: Int): Float;
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
public static function timeMapGetMetronomePattern(proj: ReaProject, time: Float, pattern: String): Int;
/**
 * get the effective time signature and tempo
 */
@:native("TimeMap_GetTimeSigAtTime")
public static function timeMapGetTimeSigAtTime(proj: ReaProject, time: Float): Int;
/**
 * Find which measure the given QN position falls in.
 */
@:native("TimeMap_QNToMeasures")
public static function timeMapQnToMeasures(proj: ReaProject, qn: Float): Int;
/**
 * converts project QN position to time.
 */
@:native("TimeMap_QNToTime")
public static function timeMapQnToTime(qn: Float): Float;
/**
 * Converts project quarter note count (QN) to time. QN is counted from the
 * start of the project, regardless of any partial measures. See
 * TimeMap2_QNToTime
 */
@:native("TimeMap_QNToTime_abs")
public static function timeMapQnToTimeAbs(proj: ReaProject, qn: Float): Float;
/**
 * converts project QN position to time.
 */
@:native("TimeMap_timeToQN")
public static function timeMapTimeToQn(tPos: Float): Float;
/**
 * Converts project time position to quarter note count (QN). QN is counted from
 * the start of the project, regardless of any partial measures. See
 * TimeMap2_timeToQN
 */
@:native("TimeMap_timeToQN_abs")
public static function timeMapTimeToQnAbs(proj: ReaProject, tPos: Float): Float;
/**
 * send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
 */
@:native("ToggleTrackSendUIMute")
public static function toggleTrackSendUiMute(track: MediaTrack, sendIdX: Int): Bool;
/**
 * Returns meter hold state, in dB*0.01 (0 = +0dB, -0.01 = -1dB, 0.02 = +2dB,
 * etc). If clear is set, clears the meter hold. If channel==1024 or
 * channel==1025, returns loudness values if this is the master track or this
 * track's VU meters are set to display loudness.
 */
@:native("Track_GetPeakHoldDB")
public static function trackGetPeakHoldDb(track: MediaTrack, cHannel: Int, clear: Bool): Float;
/**
 * Returns peak meter value (1.0=+0dB, 0.0=-inf) for channel. If channel==1024
 * or channel==1025, returns loudness values if this is the master track or this
 * track's VU meters are set to display loudness.
 */
@:native("Track_GetPeakInfo")
public static function trackGetPeakInfo(track: MediaTrack, cHannel: Int): Float;
/**
 * displays tooltip at location, or removes if empty string
 */
@:native("TrackCtl_SetToolTip")
public static function trackCtlSetToolTip(fmt: String, xPos: Int, yPos: Int, topmost: Bool): Void;
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
 * Get the index of the first track FX insert that matches fxname. If the FX is
 * not in the chain and instantiate is true, it will be inserted. See
 * TrackFX_GetInstrument, TrackFX_GetEQ. Deprecated in favor of
 * TrackFX_AddByName.
 */
@:native("TrackFX_GetByName")
public static function trackFxGetByName(track: MediaTrack, fXName: String, instantiate: Bool): Int;
/**
 * returns index of effect visible in chain, or -1 for chain hidden, or -2 for
 * chain visible but no effect selected
 */
@:native("TrackFX_GetChainVisible")
public static function trackFxGetChainVisible(track: MediaTrack): Int;
/** No description available */
@:native("TrackFX_GetCount")
public static function trackFxGetCount(track: MediaTrack): Int;
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
/**
 * Get the index of ReaEQ in the track FX chain. If ReaEQ is not in the chain
 * and instantiate is true, it will be inserted. See TrackFX_GetInstrument,
 * TrackFX_GetByName.
 */
@:native("TrackFX_GetEQ")
public static function trackFxGetEq(track: MediaTrack, instantiate: Bool): Int;
/**
 * Returns true if the EQ band is enabled.
Returns false if the band is
 * disabled, or if track/fxidx is not ReaEQ.
Bandtype: -1=master gain, 0=hipass,
 * 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass, 6=bandpass, 7=parallel
 * bandpass.
Bandidx (ignored for master gain): 0=target first band matching
 * bandtype, 1=target 2nd band matching bandtype, etc.
See TrackFX_GetEQ,
 * TrackFX_GetEQParam, TrackFX_SetEQParam, TrackFX_SetEQBandEnabled. FX indices
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
@:native("TrackFX_GetEQBandEnabled")
public static function trackFxGetEqBandEnabled(track: MediaTrack, fXIdX: Int, bandtYpe: Int, bandIdX: Int): Bool;
/**
 * Returns false if track/fxidx is not ReaEQ.
Bandtype: -1=master gain,
 * 0=hipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass, 6=bandpass,
 * 7=parallel bandpass.
Bandidx (ignored for master gain): 0=target first band
 * matching bandtype, 1=target 2nd band matching bandtype, etc.
Paramtype
 * (ignored for master gain): 0=freq, 1=gain, 2=Q.
See TrackFX_GetEQ,
 * TrackFX_SetEQParam, TrackFX_GetEQBandEnabled, TrackFX_SetEQBandEnabled. FX
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
@:native("TrackFX_GetEQParam")
public static function trackFxGetEqParam(track: MediaTrack, fXIdX: Int, paramIdX: Int): Bool;
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
@:native("TrackFX_GetFXName")
public static function trackFxGetFxName(track: MediaTrack, fX: Int): Bool;
/**
 * Get the index of the first track FX insert that is a virtual instrument, or
 * -1 if none. See TrackFX_GetEQ, TrackFX_GetByName.
 */
@:native("TrackFX_GetInstrument")
public static function trackFxGetInstrument(track: MediaTrack): Int;
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
 * gets plug-in specific named configuration value (returns true on success).
 * 
Supported values for read:
pdc : PDC latency
in_pin_X : name of input pin
 * X
out_pin_X : name of output pin X
fx_type : type string
fx_ident :
 * type-specific identifier
fx_name : name of FX (also supported as
 * original_name)
GainReduction_dB : [ReaComp + other supported
 * compressors]
is_instrument : 1 if instrument, 0 if not
 * (v7.40+)
parent_container : FX ID of parent container, if any
 * (v7.06+)
container_count : [Container] number of FX in
 * container
container_item.X : FX ID of item in container (first item is
 * container_item.0) (v7.06+)
param.X.container_map.hint_id : unique ID of
 * mapping (preserved if mapping order changes)
param.X.container_map.delete :
 * read this value in order to remove the mapping for this
 * parameter
container_map.add : read from this value to add a new container
 * parameter mapping -- will return new parameter index (accessed via
 * param.X.container_map.*)
container_map.add.FXID.PARMIDX : read from this
 * value to add/get container parameter mapping for FXID/PARMIDX -- will return
 * the parameter index (accessed via param.X.container_map.*). FXID can be a
 * full address (must be a child of the container) or a 0-based sub-index
 * (v7.06+).
container_map.get.FXID.PARMIDX : read from this value to get
 * container parameter mapping for FXID/PARMIDX -- will return the parameter
 * index (accessed via param.X.container_map.*). FXID can be a full address
 * (must be a child of the container) or a 0-based sub-index
 * (v7.06+).
chain_pdc_actual : returns the actual chain latency in samples,
 * only valid after playback has commenced, may be rounded up to block
 * size.
chain_pdc_reporting : returns the reported chain latency, always valid,
 * not rounded to block size.
Supported values for
 * read/write:
vst_chunk[_program] : base64-encoded VST-specific
 * chunk.
clap_chunk : base64-encoded CLAP-specific
 * chunk.
param.X.lfo.[active,dir,phase,speed,strength,temposync,free,shape] :
 * parameter moduation LFO
 * state
param.X.acs.[active,dir,strength,attack,release,dblo,dbhi,chan,stereo,x2,y2]
 * : parameter modulation ACS
 * state
param.X.plink.[active,scale,offset,effect,param,midi_bus,midi_chan,midi_msg,midi_msg2]
 * : parameter link/MIDI link: set effect=-100 to support
 * midi_*
param.X.mod.[active,baseline,visible] : parameter module global
 * settings
param.X.learn.[midi1,midi2,osc] : first two bytes of MIDI message,
 * or OSC string if set
param.X.learn.mode : absolution/relative mode flag (0:
 * Absolute, 1: 127=-1,1=+1, 2: 63=-1, 65=+1, 3: 65=-1, 1=+1, 4: toggle if
 * nonzero)
param.X.learn.flags : &1=selected track only, &2=soft takeover,
 * &4=focused FX only, &8=LFO retrigger, &16=visible FX
 * only
param.X.container_map.fx_index : index of FX contained in
 * container
param.X.container_map.fx_parm : parameter index of parameter of FX
 * contained in container
param.X.container_map.aliased_name : name of parameter
 * (if user-renamed, otherwise fails)
BANDTYPEx, BANDENABLEDx : band
 * configuration [ReaEQ]
THRESHOLD, CEILING, TRUEPEAK : [ReaLimit]
NUMCHANNELS,
 * NUMSPEAKERS, RESETCHANNELS : [ReaSurroundPan]
ITEMx : [ReaVerb] state
 * configuration line, when writing should be followed by a write of DONE
FILE,
 * FILEx, -FILEx, +FILEx, -FILE* : [RS5k] file list, -/+ prefixes are
 * write-only, when writing any, should be followed by a write of DONE
MODE,
 * RSMODE : [RS5k] general mode, resample mode
VIDEO_CODE : [video processor]
 * code
force_auto_bypass : 0 or 1 - force auto-bypass plug-in on
 * silence
parallel : 0, 1 or 2 - 1=process plug-in in parallel with previous,
 * 2=process plug-in parallel and merge MIDI
instance_oversample_shift :
 * instance oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When
 * setting requires playback stop/start to take effect
chain_oversample_shift :
 * chain oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When setting
 * requires playback stop/start to take effect
chain_pdc_mode : chain PDC mode
 * (0=classic, 1=new-default, 2=ignore PDC, 3=hwcomp-master)
chain_sel :
 * selected/visible FX in chain
renamed_name : renamed FX instance name (empty
 * string = not renamed)
container_nch : number of internal channels for
 * container
container_nch_in : number of input pins for
 * container
container_nch_out : number of output pints for
 * container
container_nch_feedback : number of internal feedback channels
 * enabled in container
channel_config : reading returns 3 values: requested
 * channel count (0 = VST3 auto), channel mode (0=multichannel, 1=multi-mono,
 * 2=multi-stereo), and supported flags (&1=multichannel is supported,
 * &2=automatic channel count is supported, &4=multi-mono is supported,
 * &8=multi-stereo is supported). writing accepts 1 or more values, channel
 * count, and channel mode if specified. VST3 bus sizes are only advisory,
 * plug-ins may not use the value. Not supported for containers, containers
 * should use container_nch etc.
focused : reading returns 1 if focused. Writing
 * a positive value to this sets the FX UI as "last focused."
last_touched :
 * reading returns two integers, one indicates whether FX is the last-touched
 * FX, the second indicates which parameter was last touched. Writing a negative
 * value ensures this plug-in is not set as last touched, otherwise the FX is
 * set "last touched," and last touched parameter index is set to the value in
 * the string (if valid).
 FX indices for tracks can have 0x1000000 added to
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
@:native("TrackFX_GetNamedConfigParm")
public static function trackFxGetNamedConfigParm(track: MediaTrack, fX: Int, pArmName: String): Bool;
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
@:native("TrackFX_GetParamEx")
public static function trackFxGetParamEx(track: MediaTrack, fX: Int, param: Int): Float;
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
 * returns index of effect visible in record input chain, or -1 for chain
 * hidden, or -2 for chain visible but no effect selected
 */
@:native("TrackFX_GetRecChainVisible")
public static function trackFxGetRecChainVisible(track: MediaTrack): Int;
/**
 * returns count of record input FX. To access record input FX, use a FX indices
 * [0x1000000..0x1000000+n). On the master track, this accesses monitoring FX
 * rather than record input FX.
 */
@:native("TrackFX_GetRecCount")
public static function trackFxGetRecCount(track: MediaTrack): Int;
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
 * Enable or disable a ReaEQ band.
Returns false if track/fxidx is not
 * ReaEQ.
Bandtype: -1=master gain, 0=hipass, 1=loshelf, 2=band, 3=notch,
 * 4=hishelf, 5=lopass, 6=bandpass, 7=parallel bandpass.
Bandidx (ignored for
 * master gain): 0=target first band matching bandtype, 1=target 2nd band
 * matching bandtype, etc.
See TrackFX_GetEQ, TrackFX_GetEQParam,
 * TrackFX_SetEQParam, TrackFX_GetEQBandEnabled. FX indices for tracks can have
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
@:native("TrackFX_SetEQBandEnabled")
public static function trackFxSetEqBandEnabled(track: MediaTrack, fXIdX: Int, bandtYpe: Int, bandIdX: Int, enable: Bool): Bool;
/**
 * Returns false if track/fxidx is not ReaEQ. Targets a band matching
 * bandtype.
Bandtype: -1=master gain, 0=hipass, 1=loshelf, 2=band, 3=notch,
 * 4=hishelf, 5=lopass, 6=bandpass, 7=parallel bandpass.
Bandidx (ignored for
 * master gain): 0=target first band matching bandtype, 1=target 2nd band
 * matching bandtype, etc.
Paramtype (ignored for master gain): 0=freq, 1=gain,
 * 2=Q.
See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_GetEQBandEnabled,
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
 * sets plug-in specific named configuration value (returns true on
 * success).
Support values for write:
vst_chunk[_program] : base64-encoded
 * VST-specific chunk.
clap_chunk : base64-encoded CLAP-specific
 * chunk.
param.X.lfo.[active,dir,phase,speed,strength,temposync,free,shape] :
 * parameter moduation LFO
 * state
param.X.acs.[active,dir,strength,attack,release,dblo,dbhi,chan,stereo,x2,y2]
 * : parameter modulation ACS
 * state
param.X.plink.[active,scale,offset,effect,param,midi_bus,midi_chan,midi_msg,midi_msg2]
 * : parameter link/MIDI link: set effect=-100 to support
 * midi_*
param.X.mod.[active,baseline,visible] : parameter module global
 * settings
param.X.learn.[midi1,midi2,osc] : first two bytes of MIDI message,
 * or OSC string if set
param.X.learn.mode : absolution/relative mode flag (0:
 * Absolute, 1: 127=-1,1=+1, 2: 63=-1, 65=+1, 3: 65=-1, 1=+1, 4: toggle if
 * nonzero)
param.X.learn.flags : &1=selected track only, &2=soft takeover,
 * &4=focused FX only, &8=LFO retrigger, &16=visible FX
 * only
param.X.container_map.fx_index : index of FX contained in
 * container
param.X.container_map.fx_parm : parameter index of parameter of FX
 * contained in container
param.X.container_map.aliased_name : name of parameter
 * (if user-renamed, otherwise fails)
BANDTYPEx, BANDENABLEDx : band
 * configuration [ReaEQ]
THRESHOLD, CEILING, TRUEPEAK : [ReaLimit]
NUMCHANNELS,
 * NUMSPEAKERS, RESETCHANNELS : [ReaSurroundPan]
ITEMx : [ReaVerb] state
 * configuration line, when writing should be followed by a write of DONE
FILE,
 * FILEx, -FILEx, +FILEx, -FILE* : [RS5k] file list, -/+ prefixes are
 * write-only, when writing any, should be followed by a write of DONE
MODE,
 * RSMODE : [RS5k] general mode, resample mode
VIDEO_CODE : [video processor]
 * code
force_auto_bypass : 0 or 1 - force auto-bypass plug-in on
 * silence
parallel : 0, 1 or 2 - 1=process plug-in in parallel with previous,
 * 2=process plug-in parallel and merge MIDI
instance_oversample_shift :
 * instance oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When
 * setting requires playback stop/start to take effect
chain_oversample_shift :
 * chain oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When setting
 * requires playback stop/start to take effect
chain_pdc_mode : chain PDC mode
 * (0=classic, 1=new-default, 2=ignore PDC, 3=hwcomp-master)
chain_sel :
 * selected/visible FX in chain
renamed_name : renamed FX instance name (empty
 * string = not renamed)
container_nch : number of internal channels for
 * container
container_nch_in : number of input pins for
 * container
container_nch_out : number of output pints for
 * container
container_nch_feedback : number of internal feedback channels
 * enabled in container
channel_config : reading returns 3 values: requested
 * channel count (0 = VST3 auto), channel mode (0=multichannel, 1=multi-mono,
 * 2=multi-stereo), and supported flags (&1=multichannel is supported,
 * &2=automatic channel count is supported, &4=multi-mono is supported,
 * &8=multi-stereo is supported). writing accepts 1 or more values, channel
 * count, and channel mode if specified. VST3 bus sizes are only advisory,
 * plug-ins may not use the value. Not supported for containers, containers
 * should use container_nch etc.
focused : reading returns 1 if focused. Writing
 * a positive value to this sets the FX UI as "last focused."
last_touched :
 * reading returns two integers, one indicates whether FX is the last-touched
 * FX, the second indicates which parameter was last touched. Writing a negative
 * value ensures this plug-in is not set as last touched, otherwise the FX is
 * set "last touched," and last touched parameter index is set to the value in
 * the string (if valid).
 FX indices for tracks can have 0x1000000 added to
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
@:native("TrackFX_SetNamedConfigParm")
public static function trackFxSetNamedConfigParm(track: MediaTrack, fX: Int, pArmName: String, value: String): Bool;
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
/** No description available */
@:native("TrackList_AdjustWindows")
public static function trackListAdjustWindows(isMinor: Bool): Void;
/** No description available */
@:native("TrackList_UpdateAllExternalSurfaces")
public static function trackListUpdateAllExternalSurfaces(): Void;
/**
 * call to start a new block
 */
@:native("Undo_BeginBlock")
public static function undoBeginBlock(): Void;
/**
 * call to start a new block
 */
@:native("Undo_BeginBlock2")
public static function undoBeginBlock2(proj: ReaProject): Void;
/**
 * returns string of next action,if able,NULL if not
 */
@:native("Undo_CanRedo2")
public static function undoCanRedo2(proj: ReaProject): String;
/**
 * returns string of last action,if able,NULL if not
 */
@:native("Undo_CanUndo2")
public static function undoCanUndo2(proj: ReaProject): String;
/**
 * nonzero if success
 */
@:native("Undo_DoRedo2")
public static function undoDoRedo2(proj: ReaProject): Int;
/**
 * nonzero if success
 */
@:native("Undo_DoUndo2")
public static function undoDoUndo2(proj: ReaProject): Int;
/**
 * call to end the block,with extra flags if any,and a description
 */
@:native("Undo_EndBlock")
public static function undoEndBlock(descCHange: String, eXtraFlags: Int): Void;
/**
 * call to end the block,with extra flags if any,and a description
 */
@:native("Undo_EndBlock2")
public static function undoEndBlock2(proj: ReaProject, descCHange: String, eXtraFlags: Int): Void;
/**
 * limited state change to items
 */
@:native("Undo_OnStateChange")
public static function undoOnStateChange(descCHange: String): Void;
/**
 * limited state change to items
 */
@:native("Undo_OnStateChange2")
public static function undoOnStateChange2(proj: ReaProject, descCHange: String): Void;
/** No description available */
@:native("Undo_OnStateChange_Item")
public static function undoOnStateChangeItem(proj: ReaProject, name: String, item: MediaItem): Void;
/**
 * trackparm=-1 by default,or if updating one fx chain,you can specify track
 * index
 */
@:native("Undo_OnStateChangeEx")
public static function undoOnStateChangeEx(descCHange: String, wHicHStates: Int, trackpArm: Int): Void;
/**
 * trackparm=-1 by default,or if updating one fx chain,you can specify track
 * index
 */
@:native("Undo_OnStateChangeEx2")
public static function undoOnStateChangeEx2(proj: ReaProject, descCHange: String, wHicHStates: Int, trackpArm: Int): Void;
/**
 * Redraw the arrange view
 */
@:native("UpdateArrange")
public static function updateArrange(): Void;
/** No description available */
@:native("UpdateItemInProject")
public static function updateItemInProject(item: MediaItem): Void;
/**
 * Recalculate lane arrangement for fixed lane tracks, including auto-removing
 * empty lanes at the bottom of the track
 */
@:native("UpdateItemLanes")
public static function updateItemLanes(proj: ReaProject): Bool;
/**
 * Redraw the arrange view and ruler
 */
@:native("UpdateTimeline")
public static function updateTimeline(): Void;
/**
 * see ValidatePtr2
 */
@:native("ValidatePtr")
public static function validatePtr(pointer: Identifier, ctYpeName: String): Bool;
/**
 * Return true if the pointer is a valid object of the right type in proj (proj
 * is ignored if pointer is itself a project). Supported types are: ReaProject*,
 * MediaTrack*, MediaItem*, MediaItem_Take*, TrackEnvelope* and PCM_source*.
 */
@:native("ValidatePtr2")
public static function validatePtr2(proj: ReaProject, pointer: Identifier, ctYpeName: String): Bool;
/**
 * Opens the prefs to a page, use pageByName if page is 0.
 */
@:native("ViewPrefs")
public static function viewPrefs(page: Int, pageBYName: String): Void;
/**
 * [BR] Allocate envelope object from track or take envelope pointer. Always
 * call BR_EnvFree when done to release the object and commit changes if
 * needed.
 takeEnvelopesUseProjectTime: take envelope points' positions are
 * counted from take position, not project start time. If you want to work with
 * project time instead, pass this as true.
For further manipulation see
 * BR_EnvCountPoints, BR_EnvDeletePoint, BR_EnvFind, BR_EnvFindNext,
 * BR_EnvFindPrevious, BR_EnvGetParentTake, BR_EnvGetParentTrack,
 * BR_EnvGetPoint, BR_EnvGetProperties, BR_EnvSetPoint, BR_EnvSetProperties,
 * BR_EnvValueAtPos.
 */
@:native("BR_EnvAlloc")
public static function brEnvAlloc(envelope: TrackEnvelope, takeEnvelopesUseProjectTime: Bool): BrEnvelope;
/**
 * [BR] Count envelope points in the envelope object allocated with BR_EnvAlloc.
 */
@:native("BR_EnvCountPoints")
public static function brEnvCountPoints(envelope: BrEnvelope): Int;
/**
 * [BR] Delete envelope point by index (zero-based) in the envelope object
 * allocated with BR_EnvAlloc. Returns true on success.
 */
@:native("BR_EnvDeletePoint")
public static function brEnvDeletePoint(envelope: BrEnvelope, id: Int): Bool;
/**
 * [BR] Find envelope point at time position in the envelope object allocated
 * with BR_EnvAlloc. Pass delta > 0 to search surrounding range - in that case
 * the closest point to position within delta will be searched for. Returns
 * envelope point id (zero-based) on success or -1 on failure.
 */
@:native("BR_EnvFind")
public static function brEnvFind(envelope: BrEnvelope, position: Float, delta: Float): Int;
/**
 * [BR] Find next envelope point after time position in the envelope object
 * allocated with BR_EnvAlloc. Returns envelope point id (zero-based) on success
 * or -1 on failure.
 */
@:native("BR_EnvFindNext")
public static function brEnvFindNext(envelope: BrEnvelope, position: Float): Int;
/**
 * [BR] Find previous envelope point before time position in the envelope object
 * allocated with BR_EnvAlloc. Returns envelope point id (zero-based) on success
 * or -1 on failure.
 */
@:native("BR_EnvFindPrevious")
public static function brEnvFindPrevious(envelope: BrEnvelope, position: Float): Int;
/**
 * [BR] Free envelope object allocated with BR_EnvAlloc and commit changes if
 * needed. Returns true if changes were committed successfully. Note that when
 * envelope object wasn't modified nothing will get committed even if commit =
 * true - in that case function returns false.
 */
@:native("BR_EnvFree")
public static function brEnvFree(envelope: BrEnvelope, commit: Bool): Bool;
/**
 * [BR] If envelope object allocated with BR_EnvAlloc is take envelope, returns
 * parent media item take, otherwise NULL.
 */
@:native("BR_EnvGetParentTake")
public static function brEnvGetParentTake(envelope: BrEnvelope): MediaItemTake;
/**
 * [BR] Get parent track of envelope object allocated with BR_EnvAlloc. If take
 * envelope, returns NULL.
 */
@:native("BR_EnvGetParentTrack")
public static function brEnvGetParentTrack(envelope: BrEnvelope): MediaTrack;
/**
 * [BR] Get envelope point by id (zero-based) from the envelope object allocated
 * with BR_EnvAlloc. Returns true on success.
 */
@:native("BR_EnvGetPoint")
public static function brEnvGetPoint(envelope: BrEnvelope, id: Int): Bool;
/**
 * [BR] Get envelope properties for the envelope object allocated with
 * BR_EnvAlloc.
active: true if envelope is active
visible: true if envelope is
 * visible
armed: true if envelope is armed
inLane: true if envelope has it's
 * own envelope lane
laneHeight: envelope lane override height. 0 for none,
 * otherwise size in pixels
defaultShape: default point shape: 0->Linear,
 * 1->Square, 2->Slow start/end, 3->Fast start, 4->Fast end, 5->Bezier
minValue:
 * minimum envelope value
maxValue: maximum envelope value
type: envelope type:
 * 0->Volume, 1->Volume (Pre-FX), 2->Pan, 3->Pan (Pre-FX), 4->Width, 5->Width
 * (Pre-FX), 6->Mute, 7->Pitch, 8->Playrate, 9->Tempo map,
 * 10->Parameter
faderScaling: true if envelope uses fader
 * scaling
automationItemsOptions: -1->project default, &1=0->don't attach to
 * underl. env., &1->attach to underl. env. on right side,  &2->attach to
 * underl. env. on both sides, &4: bypass underl. env.
 */
@:native("BR_EnvGetProperties")
public static function brEnvGetProperties(envelope: BrEnvelope): Bool;
/**
 * [BR] Set envelope point by id (zero-based) in the envelope object allocated
 * with BR_EnvAlloc. To create point instead, pass id = -1. Note that if new
 * point is inserted or existing point's time position is changed, points won't
 * automatically get sorted. To do that, see BR_EnvSortPoints.
Returns true on
 * success.
 */
@:native("BR_EnvSetPoint")
public static function brEnvSetPoint(envelope: BrEnvelope, id: Int, position: Float, value: Float, sHape: Int, selected: Bool, bezier: Float): Bool;
/**
 * [BR] Set envelope properties for the envelope object allocated with
 * BR_EnvAlloc. For parameter description see BR_EnvGetProperties.
Setting
 * automationItemsOptions requires REAPER 5.979+.
 */
@:native("BR_EnvSetProperties")
public static function brEnvSetProperties(envelope: BrEnvelope, active: Bool, visible: Bool, armed: Bool, inLane: Bool, laneHeigHt: Int, defaultSHape: Int, faderScaling: Bool, ?automationItemsOptionsIn: Int): Void;
/**
 * [BR] Sort envelope points by position. The only reason to call this is if
 * sorted points are explicitly needed after editing them with BR_EnvSetPoint.
 * Note that you do not have to call this before doing BR_EnvFree since it does
 * handle unsorted points too.
 */
@:native("BR_EnvSortPoints")
public static function brEnvSortPoints(envelope: BrEnvelope): Void;
/**
 * [BR] Get envelope value at time position for the envelope object allocated
 * with BR_EnvAlloc.
 */
@:native("BR_EnvValueAtPos")
public static function brEnvValueAtPos(envelope: BrEnvelope, position: Float): Float;
/**
 * [BR] Deprecated, see GetSet_ArrangeView2 (REAPER v5.12pre4+) -- Get start and
 * end time position of arrange view. To set arrange view instead, see
 * BR_SetArrangeView.
 */
@:native("BR_GetArrangeView")
public static function brGetArrangeView(proj: ReaProject): Float;
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
 * [BR] Get current theme information. themePathOut is set to full theme path
 * and themeNameOut is set to theme name excluding any path info and extension
 */
@:native("BR_GetCurrentTheme")
public static function brGetCurrentTheme(): String;
/**
 * [BR] Get media item from GUID string. Note that the GUID must be enclosed in
 * braces {}. To get item's GUID as a string, see BR_GetMediaItemGUID.
 */
@:native("BR_GetMediaItemByGUID")
public static function brGetMediaItemByGuid(proj: ReaProject, guIdStringIn: String): MediaItem;
/**
 * [BR] Get media item GUID as a string (guidStringOut_sz should be at least
 * 64). To get media item back from GUID string, see BR_GetMediaItemByGUID.
 */
@:native("BR_GetMediaItemGUID")
public static function brGetMediaItemGuid(item: MediaItem): String;
/**
 * [BR] Get currently loaded image resource and its flags for a given item.
 * Returns false if there is no image resource set. To set image resource, see
 * BR_SetMediaItemImageResource.
 */
@:native("BR_GetMediaItemImageResource")
public static function brGetMediaItemImageResource(item: MediaItem): Bool;
/**
 * [BR] Get media item take GUID as a string (guidStringOut_sz should be at
 * least 64). To get take from GUID string, see SNM_GetMediaItemTakeByGUID.
 */
@:native("BR_GetMediaItemTakeGUID")
public static function brGetMediaItemTakeGuid(take: MediaItemTake): String;
/**
 * [BR] Get take media source properties as they appear in . Returns false if
 * take can't have them (MIDI items etc.).
To set source properties, see
 * BR_SetMediaSourceProperties.
 */
@:native("BR_GetMediaSourceProperties")
public static function brGetMediaSourceProperties(take: MediaItemTake): Bool;
/**
 * [BR] Get media track from GUID string. Note that the GUID must be enclosed in
 * braces {}. To get track's GUID as a string, see GetSetMediaTrackInfo_String.
 */
@:native("BR_GetMediaTrackByGUID")
public static function brGetMediaTrackByGuid(proj: ReaProject, guIdStringIn: String): MediaTrack;
/**
 * [BR] Get media track freeze count (if track isn't frozen at all, returns 0).
 */
@:native("BR_GetMediaTrackFreezeCount")
public static function brGetMediaTrackFreezeCount(track: MediaTrack): Int;
/**
 * [BR] Deprecated, see GetSetMediaTrackInfo_String (v5.95+). Get media track
 * GUID as a string (guidStringOut_sz should be at least 64). To get media track
 * back from GUID string, see BR_GetMediaTrackByGUID.
 */
@:native("BR_GetMediaTrackGUID")
public static function brGetMediaTrackGuid(track: MediaTrack): String;
/**
 * [BR] Deprecated, see GetSetMediaTrackInfo (REAPER v5.02+). Get media track
 * layouts for MCP and TCP. Empty string ("") means that layout is set to the
 * default layout. To set media track layouts, see BR_SetMediaTrackLayouts.
 */
@:native("BR_GetMediaTrackLayouts")
public static function brGetMediaTrackLayouts(track: MediaTrack): String;
/**
 * [BR] Get track envelope for send/receive/hardware output.
category is <0 for
 * receives, 0=sends, >0 for hardware outputs
sendidx is zero-based (see
 * GetTrackNumSends to count track sends/receives/hardware outputs)
envelopeType
 * determines which envelope is returned (0=volume, 1=pan, 2=mute)
Note: To get
 * or set other send attributes, see BR_GetSetTrackSendInfo and
 * BR_GetMediaTrackSendInfo_Track.
 */
@:native("BR_GetMediaTrackSendInfo_Envelope")
public static function brGetMediaTrackSendInfoEnvelope(track: MediaTrack, categorY: Int, sendIdX: Int, envelopeTYpe: Int): TrackEnvelope;
/**
 * [BR] Get source or destination media track for send/receive.
category is <0
 * for receives, 0=sends
sendidx is zero-based (see GetTrackNumSends to count
 * track sends/receives)
trackType determines which track is returned (0=source
 * track, 1=destination track)
Note: To get or set other send attributes, see
 * BR_GetSetTrackSendInfo and BR_GetMediaTrackSendInfo_Envelope.
 */
@:native("BR_GetMediaTrackSendInfo_Track")
public static function brGetMediaTrackSendInfoTrack(track: MediaTrack, categorY: Int, sendIdX: Int, trackTYpe: Int): MediaTrack;
/**
 * [BR] Get MIDI take source length in PPQ. In case the take isn't MIDI, return
 * value will be -1.
 */
@:native("BR_GetMidiSourceLenPPQ")
public static function brGetMidiSourceLenPpq(take: MediaItemTake): Float;
/**
 * [BR] Get MIDI take pool GUID as a string (guidStringOut_sz should be at least
 * 64). Returns true if take is pooled.
 */
@:native("BR_GetMidiTakePoolGUID")
public static function brGetMidiTakePoolGuid(take: MediaItemTake): Bool;
/**
 * [BR] Get "ignore project tempo" information for MIDI take. Returns true if
 * take can ignore project tempo (no matter if it's actually ignored), otherwise
 * false.
 */
@:native("BR_GetMidiTakeTempoInfo")
public static function brGetMidiTakeTempoInfo(take: MediaItemTake): Bool;
/**
 * [BR] Get mouse cursor context. Each parameter returns information in a form
 * of string as specified in the table below.
To get more info on stuff that was
 * found under mouse cursor see BR_GetMouseCursorContext_Envelope,
 * BR_GetMouseCursorContext_Item, BR_GetMouseCursorContext_MIDI,
 * BR_GetMouseCursorContext_Position, BR_GetMouseCursorContext_Take,
 * BR_GetMouseCursorContext_Track
 */
@:native("BR_GetMouseCursorContext")
public static function brGetMouseCursorContext(): String;
/**
 * [BR] Returns envelope that was captured with the last call to
 * BR_GetMouseCursorContext. In case the envelope belongs to take, takeEnvelope
 * will be true.
 */
@:native("BR_GetMouseCursorContext_Envelope")
public static function brGetMouseCursorContextEnvelope(): TrackEnvelope;
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
 * [BR] Returns midi editor under mouse cursor that was captured with the last
 * call to BR_GetMouseCursorContext.
inlineEditor: if mouse was captured in
 * inline MIDI editor, this will be true (consequentially, returned MIDI editor
 * will be NULL)
noteRow: note row or piano key under mouse cursor
 * (0-127)
ccLane: CC lane under mouse cursor (CC0-127=CC, 0x100|(0-31)=14-bit
 * CC, 0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure,
 * 0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207=off velocity,
 * 0x208=notation events)
ccLaneVal: value in CC lane under mouse cursor (0-127
 * or 0-16383)
ccLaneId: lane position, counting from the top (0 based)
Note:
 * due to API limitations, if mouse is over inline MIDI editor with some note
 * rows hidden, noteRow will be -1
 */
@:native("BR_GetMouseCursorContext_MIDI")
public static function brGetMouseCursorContextMidi(): Identifier;
/**
 * [BR] Returns project time position in arrange/ruler/midi editor that was
 * captured with the last call to BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_Position")
public static function brGetMouseCursorContextPosition(): Float;
/**
 * [BR] Returns id of a stretch marker under mouse cursor that was captured with
 * the last call to BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_StretchMarker")
public static function brGetMouseCursorContextStretchMarker(): Int;
/**
 * [BR] Returns take under mouse cursor that was captured with the last call to
 * BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_Take")
public static function brGetMouseCursorContextTake(): MediaItemTake;
/**
 * [BR] Returns track under mouse cursor that was captured with the last call to
 * BR_GetMouseCursorContext.
 */
@:native("BR_GetMouseCursorContext_Track")
public static function brGetMouseCursorContextTrack(): MediaTrack;
/**
 * [BR] Get next grid division after the time position. For more grid divisions
 * function, see BR_GetClosestGridDivision and BR_GetPrevGridDivision.
 */
@:native("BR_GetNextGridDivision")
public static function brGetNextGridDivision(position: Float): Float;
/**
 * [BR] Get previous grid division before the time position. For more grid
 * division functions, see BR_GetClosestGridDivision and BR_GetNextGridDivision.
 */
@:native("BR_GetPrevGridDivision")
public static function brGetPrevGridDivision(position: Float): Float;
/**
 * [BR] Get or set send attributes.
category is <0 for receives, 0=sends, >0 for
 * hardware outputs
sendidx is zero-based (see GetTrackNumSends to count track
 * sends/receives/hardware outputs)
To set attribute, pass setNewValue as
 * true
List of possible parameters:
B_MUTE : send mute state (1.0 if muted,
 * otherwise 0.0)
B_PHASE : send phase state (1.0 if phase is inverted,
 * otherwise 0.0)
B_MONO : send mono state (1.0 if send is set to mono,
 * otherwise 0.0)
D_VOL : send volume (1.0=+0dB etc...)
D_PAN : send pan
 * (-1.0=100%L, 0=center, 1.0=100%R)
D_PANLAW : send pan law (1.0=+0.0db,
 * 0.5=-6dB, -1.0=project default etc...)
I_SENDMODE : send mode (0=post-fader,
 * 1=pre-fx, 2=post-fx(deprecated), 3=post-fx)
I_SRCCHAN : audio source starting
 * channel index or -1 if audio send is disabled (&1024=mono...note that in that
 * case, when reading index, you should do (index XOR 1024) to get starting
 * channel index)
I_DSTCHAN : audio destination starting channel index
 * (&1024=mono (and in case of hardware output &512=rearoute)...note that in
 * that case, when reading index, you should do (index XOR (1024 OR 512)) to get
 * starting channel index)
I_MIDI_SRCCHAN : source MIDI channel, -1 if MIDI send
 * is disabled (0=all, 1-16)
I_MIDI_DSTCHAN : destination MIDI channel, -1 if
 * MIDI send is disabled (0=original, 1-16)
I_MIDI_SRCBUS : source MIDI bus, -1
 * if MIDI send is disabled (0=all, otherwise bus index)
I_MIDI_DSTBUS : receive
 * MIDI bus, -1 if MIDI send is disabled (0=all, otherwise bus
 * index)
I_MIDI_LINK_VOLPAN : link volume/pan controls to MIDI
Note: To get or
 * set other send attributes, see BR_GetMediaTrackSendInfo_Envelope and
 * BR_GetMediaTrackSendInfo_Track.
 */
@:native("BR_GetSetTrackSendInfo")
public static function brGetSetTrackSendInfo(track: MediaTrack, categorY: Int, sendIdX: Int, pArmName: String, setNeWValue: Bool, neWValue: Float): Float;
/**
 * [BR] Returns FX count for supplied take
 */
@:native("BR_GetTakeFXCount")
public static function brGetTakeFxCount(take: MediaItemTake): Int;
/**
 * [SWS] Check if take has MIDI inline editor open and returns true or false.
 */
@:native("BR_IsMidiOpenInInlineEditor")
public static function brIsMidiOpenInInlineEditor(take: MediaItemTake): Bool;
/**
 * [BR] Check if take is MIDI take, in case MIDI take is in-project MIDI source
 * data, inProjectMidiOut will be true, otherwise false.
 */
@:native("BR_IsTakeMidi")
public static function brIsTakeMidi(take: MediaItemTake): Bool;
/**
 * [BR] Get media item under mouse cursor. Position is mouse cursor position in
 * arrange.
 */
@:native("BR_ItemAtMouseCursor")
public static function brItemAtMouseCursor(): MediaItem;
/**
 * [BR] Remove CC lane in midi editor. Top visible CC lane is laneId 0. Returns
 * true on success
 */
@:native("BR_MIDI_CCLaneRemove")
public static function brMidiCcLaneRemove(mIdiEditor: Identifier, laneId: Int): Bool;
/**
 * [BR] Replace CC lane in midi editor. Top visible CC lane is laneId 0. Returns
 * true on success.
Valid CC lanes: CC0-127=CC, 0x100|(0-31)=14-bit CC,
 * 0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure,
 * 0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207
 */
@:native("BR_MIDI_CCLaneReplace")
public static function brMidiCcLaneReplace(mIdiEditor: Identifier, laneId: Int, neWCc: Int): Bool;
/**
 * [BR] Get position at mouse cursor. To check ruler along with arrange, pass
 * checkRuler=true. Returns -1 if cursor is not over arrange/ruler.
 */
@:native("BR_PositionAtMouseCursor")
public static function brPositionAtMouseCursor(cHeckRuler: Bool): Float;
/**
 * [BR] Deprecated, see GetSet_ArrangeView2 (REAPER v5.12pre4+) -- Set start and
 * end time position of arrange view. To get arrange view instead, see
 * BR_GetArrangeView.
 */
@:native("BR_SetArrangeView")
public static function brSetArrangeView(proj: ReaProject, startTime: Float, endTime: Float): Void;
/**
 * [BR] Set item start and end edges' position - returns true in case of any
 * changes
 */
@:native("BR_SetItemEdges")
public static function brSetItemEdges(item: MediaItem, startTime: Float, endTime: Float): Bool;
/**
 * [BR] Set image resource and its flags for a given item. To clear current
 * image resource, pass imageIn as "".
imageFlags: &1=0: don't display image,
 * &1: center / tile, &3: stretch, &5: full height (REAPER 5.974+).
Can also be
 * used to display existing text in empty items unstretched (pass imageIn = "",
 * imageFlags = 0) or stretched (pass imageIn = "". imageFlags = 3).
To get
 * image resource, see BR_GetMediaItemImageResource.
 */
@:native("BR_SetMediaItemImageResource")
public static function brSetMediaItemImageResource(item: MediaItem, imageIn: String, imageFlags: Int): Void;
/**
 * [BR] Set take media source properties. Returns false if take can't have them
 * (MIDI items etc.). Section parameters have to be valid only when passing
 * section=true.
To get source properties, see BR_GetMediaSourceProperties.
 */
@:native("BR_SetMediaSourceProperties")
public static function brSetMediaSourceProperties(take: MediaItemTake, section: Bool, start: Float, lengtH: Float, fade: Float, reverse: Bool): Bool;
/**
 * [BR] Deprecated, see GetSetMediaTrackInfo (REAPER v5.02+). Set media track
 * layouts for MCP and TCP. To set default layout, pass empty string ("") as
 * layout name. In case layouts were successfully set, returns true (if layouts
 * are already set to supplied layout names, it will return false since no
 * changes were made).
To get media track layouts, see BR_GetMediaTrackLayouts.
 */
@:native("BR_SetMediaTrackLayouts")
public static function brSetMediaTrackLayouts(track: MediaTrack, mcPLaYoutNameIn: String, tcPLaYoutNameIn: String): Bool;
/**
 * [BR] Set "ignore project tempo" information for MIDI take. Returns true in
 * case the take was successfully updated.
 */
@:native("BR_SetMidiTakeTempoInfo")
public static function brSetMidiTakeTempoInfo(take: MediaItemTake, ignoreProjTempo: Bool, bpm: Float, num: Int, den: Int): Bool;
/**
 * [BR] Set new take source from file. To import MIDI file as in-project source
 * data pass inProjectData=true. Returns false if failed.
Any take source
 * properties from the previous source will be lost - to preserve them, see
 * BR_SetTakeSourceFromFile2.
Note: To set source from existing take, see
 * SNM_GetSetSourceState2.
 */
@:native("BR_SetTakeSourceFromFile")
public static function brSetTakeSourceFromFile(take: MediaItemTake, fileNameIn: String, inProjectData: Bool): Bool;
/**
 * [BR] Differs from BR_SetTakeSourceFromFile only that it can also preserve
 * existing take media source properties.
 */
@:native("BR_SetTakeSourceFromFile2")
public static function brSetTakeSourceFromFile2(take: MediaItemTake, fileNameIn: String, inProjectData: Bool, keepSourceProperties: Bool): Bool;
/**
 * [BR] Get take under mouse cursor. Position is mouse cursor position in
 * arrange.
 */
@:native("BR_TakeAtMouseCursor")
public static function brTakeAtMouseCursor(): MediaItemTake;
/**
 * [BR] Get track under mouse cursor.
Context signifies where the track was
 * found: 0 = TCP, 1 = MCP, 2 = Arrange.
Position will hold mouse cursor
 * position in arrange if applicable.
 */
@:native("BR_TrackAtMouseCursor")
public static function brTrackAtMouseCursor(): MediaTrack;
/**
 * [BR] Deprecated, see TrackFX_GetNamedConfigParm/'fx_ident' (v6.37+). Get the
 * exact name (like effect.dll, effect.vst3, etc...) of an FX.
 */
@:native("BR_TrackFX_GetFXModuleName")
public static function brTrackFxGetFxModuleName(track: MediaTrack, fX: Int): Bool;
/**
 * [BR] Equivalent to win32 API ComboBox_FindString().
 */
@:native("BR_Win32_CB_FindString")
public static function brWin32CbFindString(comboBoXHWnd: Identifier, startId: Int, string: String): Int;
/**
 * [BR] Equivalent to win32 API ComboBox_FindStringExact().
 */
@:native("BR_Win32_CB_FindStringExact")
public static function brWin32CbFindStringExact(comboBoXHWnd: Identifier, startId: Int, string: String): Int;
/**
 * [BR] Equivalent to win32 API ClientToScreen().
 */
@:native("BR_Win32_ClientToScreen")
public static function brWin32ClientToScreen(hWnd: Identifier, xIn: Int, yIn: Int): Int;
/**
 * [BR] Equivalent to win32 API FindWindowEx(). Since ReaScript doesn't allow
 * passing NULL (None in Python, nil in Lua etc...) parameters, to search by
 * supplied class or name set searchClass and searchName accordingly. HWND
 * parameters should be passed as either "0" to signify NULL or as string
 * obtained from BR_Win32_HwndToString.
 */
@:native("BR_Win32_FindWindowEx")
public static function brWin32FindWindowEx(hWndParent: String, hWndChildAfter: String, className: String, windowName: String, searcHClass: Bool, searcHName: Bool): Identifier;
/**
 * [BR] Equivalent to win32 API GET_X_LPARAM().
 */
@:native("BR_Win32_GET_X_LPARAM")
public static function brWin32GetXLparam(lParam: Int): Int;
/**
 * [BR] Equivalent to win32 API GET_Y_LPARAM().
 */
@:native("BR_Win32_GET_Y_LPARAM")
public static function brWin32GetYLparam(lParam: Int): Int;
/**
 * [BR] Returns various constants needed for BR_Win32 functions.
Supported
 * constants are:
CB_ERR, CB_GETCOUNT, CB_GETCURSEL,
 * CB_SETCURSEL
EM_SETSEL
GW_CHILD, GW_HWNDFIRST, GW_HWNDLAST, GW_HWNDNEXT,
 * GW_HWNDPREV, GW_OWNER
GWL_STYLE
SW_HIDE, SW_MAXIMIZE, SW_SHOW,
 * SW_SHOWMINIMIZED, SW_SHOWNA, SW_SHOWNOACTIVATE,
 * SW_SHOWNORMAL
SWP_FRAMECHANGED, SWP_FRAMECHANGED, SWP_NOMOVE,
 * SWP_NOOWNERZORDER, SWP_NOSIZE, SWP_NOZORDER
VK_DOWN, VK_UP
WM_CLOSE,
 * WM_KEYDOWN
WS_MAXIMIZE, WS_OVERLAPPEDWINDOW
 */
@:native("BR_Win32_GetConstant")
public static function brWin32GetConstant(constantName: String): Int;
/**
 * [BR] Equivalent to win32 API GetCursorPos().
 */
@:native("BR_Win32_GetCursorPos")
public static function brWin32GetCursorPos(): Bool;
/**
 * [BR] Equivalent to win32 API GetFocus().
 */
@:native("BR_Win32_GetFocus")
public static function brWin32GetFocus(): Identifier;
/**
 * [BR] Equivalent to win32 API GetForegroundWindow().
 */
@:native("BR_Win32_GetForegroundWindow")
public static function brWin32GetForegroundWindow(): Identifier;
/**
 * [BR] Alternative to GetMainHwnd. REAPER seems to have problems with
 * extensions using HWND type for exported functions so all BR_Win32 functions
 * use void* instead of HWND type
 */
@:native("BR_Win32_GetMainHwnd")
public static function brWin32GetMainHwnd(): Identifier;
/**
 * [BR] Get mixer window HWND. isDockedOut will be set to true if mixer is
 * docked
 */
@:native("BR_Win32_GetMixerHwnd")
public static function brWin32GetMixerHwnd(): Identifier;
/**
 * [BR] Get coordinates for screen which is nearest to supplied coordinates.
 * Pass workingAreaOnly as true to get screen coordinates excluding taskbar (or
 * menu bar on OSX).
 */
@:native("BR_Win32_GetMonitorRectFromRect")
public static function brWin32GetMonitorRectFromRect(workingAreaOnlY: Bool, leftIn: Int, topIn: Int, rigHtIn: Int, bottomIn: Int): Int;
/**
 * [BR] Equivalent to win32 API GetParent().
 */
@:native("BR_Win32_GetParent")
public static function brWin32GetParent(hWnd: Identifier): Identifier;
/**
 * [BR] Equivalent to win32 API GetPrivateProfileString(). For example, you can
 * use this to get values from REAPER.ini.
 */
@:native("BR_Win32_GetPrivateProfileString")
public static function brWin32GetPrivateProfileString(sectionName: String, keYName: String, defaultString: String, filePatH: String): Int;
/**
 * [BR] Equivalent to win32 API GetWindow().
 */
@:native("BR_Win32_GetWindow")
public static function brWin32GetWindow(hWnd: Identifier, cmd: Int): Identifier;
/**
 * [BR] Equivalent to win32 API GetWindowLong().
 */
@:native("BR_Win32_GetWindowLong")
public static function brWin32GetWindowLong(hWnd: Identifier, indeX: Int): Int;
/**
 * [BR] Equivalent to win32 API GetWindowRect().
 */
@:native("BR_Win32_GetWindowRect")
public static function brWin32GetWindowRect(hWnd: Identifier): Bool;
/**
 * [BR] Equivalent to win32 API GetWindowText().
 */
@:native("BR_Win32_GetWindowText")
public static function brWin32GetWindowText(hWnd: Identifier): Int;
/**
 * [BR] Equivalent to win32 API HIBYTE().
 */
@:native("BR_Win32_HIBYTE")
public static function brWin32Hibyte(value: Int): Int;
/**
 * [BR] Equivalent to win32 API HIWORD().
 */
@:native("BR_Win32_HIWORD")
public static function brWin32Hiword(value: Int): Int;
/**
 * [BR] Convert HWND to string. To convert string back to HWND, see
 * BR_Win32_StringToHwnd.
 */
@:native("BR_Win32_HwndToString")
public static function brWin32HwndToString(hWnd: Identifier): String;
/**
 * [BR] Equivalent to win32 API IsWindow().
 */
@:native("BR_Win32_IsWindow")
public static function brWin32IsWindow(hWnd: Identifier): Bool;
/**
 * [BR] Equivalent to win32 API IsWindowVisible().
 */
@:native("BR_Win32_IsWindowVisible")
public static function brWin32IsWindowVisible(hWnd: Identifier): Bool;
/**
 * [BR] Equivalent to win32 API LOBYTE().
 */
@:native("BR_Win32_LOBYTE")
public static function brWin32Lobyte(value: Int): Int;
/**
 * [BR] Equivalent to win32 API LOWORD().
 */
@:native("BR_Win32_LOWORD")
public static function brWin32Loword(value: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKELONG().
 */
@:native("BR_Win32_MAKELONG")
public static function brWin32Makelong(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKELPARAM().
 */
@:native("BR_Win32_MAKELPARAM")
public static function brWin32Makelparam(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKELRESULT().
 */
@:native("BR_Win32_MAKELRESULT")
public static function brWin32Makelresult(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKEWORD().
 */
@:native("BR_Win32_MAKEWORD")
public static function brWin32Makeword(loW: Int, higH: Int): Int;
/**
 * [BR] Equivalent to win32 API MAKEWPARAM().
 */
@:native("BR_Win32_MAKEWPARAM")
public static function brWin32Makewparam(loW: Int, higH: Int): Int;
/**
 * [BR] Alternative to MIDIEditor_GetActive. REAPER seems to have problems with
 * extensions using HWND type for exported functions so all BR_Win32 functions
 * use void* instead of HWND type.
 */
@:native("BR_Win32_MIDIEditor_GetActive")
public static function brWin32MidiEditorGetActive(): Identifier;
/**
 * [BR] Equivalent to win32 API ClientToScreen().
 */
@:native("BR_Win32_ScreenToClient")
public static function brWin32ScreenToClient(hWnd: Identifier, xIn: Int, yIn: Int): Int;
/**
 * [BR] Equivalent to win32 API SendMessage().
 */
@:native("BR_Win32_SendMessage")
public static function brWin32SendMessage(hWnd: Identifier, msg: Int, lParam: Int, wParam: Int): Int;
/**
 * [BR] Equivalent to win32 API SetFocus().
 */
@:native("BR_Win32_SetFocus")
public static function brWin32SetFocus(hWnd: Identifier): Identifier;
/**
 * [BR] Equivalent to win32 API SetForegroundWindow().
 */
@:native("BR_Win32_SetForegroundWindow")
public static function brWin32SetForegroundWindow(hWnd: Identifier): Int;
/**
 * [BR] Equivalent to win32 API SetWindowLong().
 */
@:native("BR_Win32_SetWindowLong")
public static function brWin32SetWindowLong(hWnd: Identifier, indeX: Int, neWLong: Int): Int;
/**
 * [BR] Equivalent to win32 API SetWindowPos().
hwndInsertAfter may be a string:
 * "HWND_BOTTOM", "HWND_NOTOPMOST", "HWND_TOP", "HWND_TOPMOST" or a string
 * obtained with BR_Win32_HwndToString.
 */
@:native("BR_Win32_SetWindowPos")
public static function brWin32SetWindowPos(hWnd: Identifier, hWndInsertAfter: String, x: Int, y: Int, wIdtH: Int, heigHt: Int, flags: Int): Bool;
/**
 * [BR] Equivalent to win32 API ShellExecute() with HWND set to main window
 */
@:native("BR_Win32_ShellExecute")
public static function brWin32ShellExecute(operation: String, file: String, parameters: String, directorY: String, sHoWFlags: Int): Int;
/**
 * [BR] Equivalent to win32 API ShowWindow().
 */
@:native("BR_Win32_ShowWindow")
public static function brWin32ShowWindow(hWnd: Identifier, cmdSHoW: Int): Bool;
/**
 * [BR] Convert string to HWND. To convert HWND back to string, see
 * BR_Win32_HwndToString.
 */
@:native("BR_Win32_StringToHwnd")
public static function brWin32StringToHwnd(string: String): Identifier;
/**
 * [BR] Equivalent to win32 API WindowFromPoint().
 */
@:native("BR_Win32_WindowFromPoint")
public static function brWin32WindowFromPoint(x: Int, y: Int): Identifier;
/**
 * [BR] Equivalent to win32 API WritePrivateProfileString(). For example, you
 * can use this to write to REAPER.ini. You can pass an empty string as value to
 * delete a key.
 */
@:native("BR_Win32_WritePrivateProfileString")
public static function brWin32WritePrivateProfileString(sectionName: String, keYName: String, value: String, filePatH: String): Bool;
/**
 * Create a new preview object. Does not take ownership of the source (don't
 * forget to destroy it unless it came from a take!). See CF_Preview_Play and
 * the others CF_Preview_* functions.
The preview object is automatically
 * destroyed at the end of a defer cycle if at least one of these conditions are
 * met:
- playback finished
- playback was not started using CF_Preview_Play
-
 * the output track no longer exists
 */
@:native("CF_CreatePreview")
public static function cfCreatePreview(source: PcmSource): CfPreview;
/**
 * Enumerate the source's media cues. Returns the next index or 0 when finished.
 */
@:native("CF_EnumMediaSourceCues")
public static function cfEnumMediaSourceCues(src: PcmSource, indeX: Int): Int;
/**
 * Return the index of the next selected effect in the given FX chain. Start
 * index should be -1. Returns -1 if there are no more selected effects.
 */
@:native("CF_EnumSelectedFX")
public static function cfEnumSelectedFx(hWnd: FxChain, indeX: Int): Int;
/**
 * Deprecated, see kbd_enumerateActions (v6.71+). Wrapper for the unexposed
 * kbd_enumerateActions API function.
Main=0, Main (alt recording)=100, MIDI
 * Editor=32060, MIDI Event List Editor=32061, MIDI Inline Editor=32062, Media
 * Explorer=32063
 */
@:native("CF_EnumerateActions")
public static function cfEnumerateActions(section: Int, indeX: Int): Int;
/**
 * Export the source to the given file (MIDI only).
 */
@:native("CF_ExportMediaSource")
public static function cfExportMediaSource(src: PcmSource, fn: String): Bool;
/**
 * Read the contents of the system clipboard.
 */
@:native("CF_GetClipboard")
public static function cfGetClipboard(): String;
/**
 * [DEPRECATED: Use CF_GetClipboard] Read the contents of the system clipboard.
 * See SNM_CreateFastString and SNM_DeleteFastString.
 */
@:native("CF_GetClipboardBig")
public static function cfGetClipboardBig(output: WdlFastString): String;
/**
 * Deprecated, see kbd_getTextFromCmd (v6.71+). Wrapper for the unexposed
 * kbd_getTextFromCmd API function. See CF_EnumerateActions for common section
 * IDs.
 */
@:native("CF_GetCommandText")
public static function cfGetCommandText(section: Int, command: Int): String;
/**
 * Get one of 16 SWS custom colors (0xBBGGRR on Windows, 0xRRGGBB everyhwere
 * else). Index is zero-based.
 */
@:native("CF_GetCustomColor")
public static function cfGetCustomColor(indeX: Int): Int;
/**
 * Return a handle to the currently focused FX chain window.
 */
@:native("CF_GetFocusedFXChain")
public static function cfGetFocusedFxChain(): FxChain;
/**
 * Returns the bit depth if available (0 otherwise).
 */
@:native("CF_GetMediaSourceBitDepth")
public static function cfGetMediaSourceBitDepth(src: PcmSource): Int;
/**
 * Returns the bit rate for WAVE (wav, aif) and streaming/variable formats (mp3,
 * ogg, opus). REAPER v6.19 or later is required for non-WAVE formats.
 */
@:native("CF_GetMediaSourceBitRate")
public static function cfGetMediaSourceBitRate(src: PcmSource): Float;
/**
 * Get the value of the given metadata field (eg. DESC, ORIG, ORIGREF, DATE,
 * TIME, UMI, CODINGHISTORY for BWF).
 */
@:native("CF_GetMediaSourceMetadata")
public static function cfGetMediaSourceMetadata(src: PcmSource, name: String, out: String): Bool;
/**
 * Returns the online/offline status of the given source.
 */
@:native("CF_GetMediaSourceOnline")
public static function cfGetMediaSourceOnline(src: PcmSource): Bool;
/**
 * Get the project associated with this source (BWF, subproject...).
 */
@:native("CF_GetMediaSourceRPP")
public static function cfGetMediaSourceRpp(src: PcmSource): Bool;
/**
 * Return the current SWS version number.
 */
@:native("CF_GetSWSVersion")
public static function cfGetSwsVersion(): String;
/**
 * Return a handle to the given take FX chain window. HACK: This temporarily
 * renames the take in order to disambiguate the take FX chain window from
 * similarily named takes.
 */
@:native("CF_GetTakeFXChain")
public static function cfGetTakeFxChain(take: MediaItemTake): FxChain;
/**
 * Return a handle to the given track FX chain window.
 */
@:native("CF_GetTrackFXChain")
public static function cfGetTrackFxChain(track: MediaTrack): FxChain;
/**
 * Return a handle to the given track FX chain window. Set wantInputChain to get
 * the track's input/monitoring FX chain.
 */
@:native("CF_GetTrackFXChainEx")
public static function cfGetTrackFxChainEx(project: ReaProject, track: MediaTrack, wantInputCHain: Bool): FxChain;
/**
 * Select the given file in explorer/finder.
 */
@:native("CF_LocateInExplorer")
public static function cfLocateInExplorer(file: String): Bool;
/**
 * Apply Unicode normalization to the provided UTF-8 string.
Mode values:
- Bit
 * 0 (composition mode):
  * 0 = decomposition only
  * 1 = decomposition +
 * canonical composition
- Bit 1 (decomposition mode):
  * 0 = canonical
 * decomposition
  * 1 = compatibility decomposition
Warning: this function is
 * no-op on Windows XP (the input string is returned as-is).
 */
@:native("CF_NormalizeUTF8")
public static function cfNormalizeUtf8(input: String, mode: Int): String;
/**
 * Give a section source created using PCM_Source_CreateFromType("SECTION").
 * Offset and length are ignored if 0. Negative length to subtract from the
 * total length of the source.
 */
@:native("CF_PCM_Source_SetSectionInfo")
public static function cfPcmSourceSetSectionInfo(section: PcmSource, source: PcmSource, offSet: Float, lengtH: Float, reverse: Bool, ?fadeIn: Float): Bool;
/** No description available */
@:native("CF_Preview_GetOutputTrack")
public static function cfPreviewGetOutputTrack(previeW: CfPreview): MediaTrack;
/**
 * Return the maximum sample value played since the last read. Refresh speed
 * depends on buffer size.
 */
@:native("CF_Preview_GetPeak")
public static function cfPreviewGetPeak(previeW: CfPreview, cHannel: Int): Bool;
/**
 * Supported attributes:
B_LOOP         seek to the beginning when reaching the
 * end of the source
B_PPITCH       preserve pitch when changing playback
 * rate
D_FADEINLEN    length in seconds of playback fade in
D_FADEOUTLEN  
 * length in seconds of playback fade out
D_LENGTH       (read only) length of
 * the source * playback rate
D_MEASUREALIGN >0 = wait until the next bar before
 * starting playback (note: this causes playback to silently continue when
 * project is paused and previewing through a track)
D_PAN          playback
 * pan
D_PITCH        pitch adjustment in semitones
D_PLAYRATE     playback rate
 * (0.01..100)
D_POSITION     current playback position
D_VOLUME       playback
 * volume
I_OUTCHAN      first hardware output channel (&1024=mono, reads -1
 * when playing through a track, see CF_Preview_SetOutputTrack)
I_PITCHMODE   
 * highest 16 bits=pitch shift mode (see EnumPitchShiftModes), lower 16
 * bits=pitch shift submode (see EnumPitchShiftSubModes)
 */
@:native("CF_Preview_GetValue")
public static function cfPreviewGetValue(previeW: CfPreview, name: String): Bool;
/**
 * Start playback of the configured preview object.
 */
@:native("CF_Preview_Play")
public static function cfPreviewPlay(previeW: CfPreview): Bool;
/** No description available */
@:native("CF_Preview_SetOutputTrack")
public static function cfPreviewSetOutputTrack(previeW: CfPreview, project: ReaProject, track: MediaTrack): Bool;
/**
 * See CF_Preview_GetValue.
 */
@:native("CF_Preview_SetValue")
public static function cfPreviewSetValue(previeW: CfPreview, name: String, neWValue: Float): Bool;
/**
 * Stop and destroy a preview object.
 */
@:native("CF_Preview_Stop")
public static function cfPreviewStop(previeW: CfPreview): Bool;
/**
 * Stop and destroy all currently active preview objects.
 */
@:native("CF_Preview_StopAll")
public static function cfPreviewStopAll(): Void;
/**
 * Set which take effect is active in the take's FX chain. The FX chain window
 * does not have to be open.
 */
@:native("CF_SelectTakeFX")
public static function cfSelectTakeFx(take: MediaItemTake, indeX: Int): Bool;
/**
 * Set which track effect is active in the track's FX chain. The FX chain window
 * does not have to be open.
 */
@:native("CF_SelectTrackFX")
public static function cfSelectTrackFx(track: MediaTrack, indeX: Int): Bool;
/**
 * Run in the specified window the action command ID associated with the
 * shortcut key in the given section. See CF_EnumerateActions for common section
 * IDs.
	Keys are Windows virtual key codes. &0x8000 for an extended key (eg.
 * Numpad Enter = VK_RETURN & 0x8000).
	Modifier values: nil = read from
 * keyboard, 0 = no modifier, &4 = Control (Cmd on macOS), &8 = Shift, &16 =
 * Alt, &32 = Super
 */
@:native("CF_SendActionShortcut")
public static function cfSendActionShortcut(hWnd: Identifier, section: Int, keY: Int, ?modifiersIn: Int): Bool;
/**
 * Write the given string into the system clipboard.
 */
@:native("CF_SetClipboard")
public static function cfSetClipboard(str: String): Void;
/**
 * Set one of 16 SWS custom colors (0xBBGGRR on Windows, 0xRRGGBB everyhwere
 * else). Index is zero-based.
 */
@:native("CF_SetCustomColor")
public static function cfSetCustomColor(indeX: Int, color: Int): Void;
/**
 * Set the online/offline status of the given source (closes files when
 * set=false).
 */
@:native("CF_SetMediaSourceOnline")
public static function cfSetMediaSourceOnline(src: PcmSource, set: Bool): Void;
/**
 * Open the given file or URL in the default application. See also
 * CF_LocateInExplorer.
 */
@:native("CF_ShellExecute")
public static function cfShellExecute(file: String): Bool;
/**
 * [FNG] Add MIDI note to MIDI take
 */
@:native("FNG_AddMidiNote")
public static function fngAddMidiNote(mIdiTake: RprMidiTake): RprMidiNote;
/**
 * [FNG] Allocate a RprMidiTake from a take pointer. Returns a NULL pointer if
 * the take is not an in-project MIDI take
 */
@:native("FNG_AllocMidiTake")
public static function fngAllocMidiTake(take: MediaItemTake): RprMidiTake;
/**
 * [FNG] Count of how many MIDI notes are in the MIDI take
 */
@:native("FNG_CountMidiNotes")
public static function fngCountMidiNotes(mIdiTake: RprMidiTake): Int;
/**
 * [FNG] Commit changes to MIDI take and free allocated memory
 */
@:native("FNG_FreeMidiTake")
public static function fngFreeMidiTake(mIdiTake: RprMidiTake): Void;
/**
 * [FNG] Get a MIDI note from a MIDI take at specified index
 */
@:native("FNG_GetMidiNote")
public static function fngGetMidiNote(mIdiTake: RprMidiTake, indeX: Int): RprMidiNote;
/**
 * [FNG] Get MIDI note property
 */
@:native("FNG_GetMidiNoteIntProperty")
public static function fngGetMidiNoteIntProperty(mIdiNote: RprMidiNote, propertY: String): Int;
/**
 * [FNG] Set MIDI note property
 */
@:native("FNG_SetMidiNoteIntProperty")
public static function fngSetMidiNoteIntProperty(mIdiNote: RprMidiNote, propertY: String, value: Int): Void;
/** No description available */
@:native("JB_GetSWSExtraProjectNotes")
public static function jbGetSwsExtraProjectNotes(project: ReaProject): String;
/** No description available */
@:native("JB_SetSWSExtraProjectNotes")
public static function jbSetSwsExtraProjectNotes(project: ReaProject, str: String): Void;
/**
 * Section:
0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 =
 * MIDI Event List Editor, 32062 = MIDI Inline Editor, 32063 = Media Explorer.
 */
@:native("JS_Actions_CountShortcuts")
public static function jsActionsCountShortcuts(section: Int, cmdId: Int): Int;
/**
 * Section:
0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 =
 * MIDI Event List Editor, 32062 = MIDI Inline Editor, 32063 = Media Explorer.
 */
@:native("JS_Actions_DeleteShortcut")
public static function jsActionsDeleteShortcut(section: Int, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * Section:
0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 =
 * MIDI Event List Editor, 32062 = MIDI Inline Editor, 32063 = Media
 * Explorer.
If the shortcut index is higher than the current number of
 * shortcuts, it will add a new shortcut.
 */
@:native("JS_Actions_DoShortcutDialog")
public static function jsActionsDoShortcutDialog(section: Int, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * Section:
0 = Main, 100 = Main (alt recording), 32060 = MIDI Editor, 32061 =
 * MIDI Event List Editor, 32062 = MIDI Inline Editor, 32063 = Media Explorer.
 */
@:native("JS_Actions_GetShortcutDesc")
public static function jsActionsGetShortcutDesc(section: Int, cmdId: Int, sHortcutIdX: Int): Bool;
/**
 * Returns the unsigned byte at address[offset]. Offset is added as steps of 1
 * byte each.
 */
@:native("JS_Byte")
public static function jsByte(pointer: Identifier, offSet: Int): Int;
/**
 * Composites a LICE bitmap with a REAPER window.  Each time that the window is
 * re-drawn, the bitmap will be blitted over the window's client area (with
 * per-pixel alpha blending).
 * If dstw or dsth is -1, the bitmap will be
 * stretched to fill the width or height of the window, respectively.
 *
 * autoUpdate is an optional parameter that is false by default. If true,
 * JS_Composite will automatically invalidate and re-draw the part of the window
 * that covers the current position of the bitmap, and if the bitmap is being
 * moved, also the previous position. (If only one or a handful of bitmaps are
 * being moved across the screen, autoUpdate should result in smoother animation
 * on WindowsOS; if numerous bitmaps are spread over the entire window, it may
 * be faster to disable autoUpdate and instead call JS_Window_InvalidateRect
 * explicitly once all bitmaps have been moved.)
 * InvalidateRect should also
 * be called whenever the contents of the bitmap contents have been changed, but
 * not the position, to trigger a window update.
 * On WindowsOS, the key to
 * reducing flickering is to slow down the frequency at which the window is
 * re-drawn. InvalidateRect should only be called when absolutely necessary,
 * preferably not more than 20 times per second.  (Also refer to the
 * JS_Composite_Delay function.)
 * On WindowsOS, flickering can further be
 * reduced by keeping the invalidated area as small as possible, covering only
 * the bitmaps that have been edited or moved.  However, if numerous bitmaps are
 * spread over the entire window, it may be faster to simply invalidate the
 * entire client area. 
 * This function should not be applied directly to
 * top-level windows, but rather to child windows.
 * Some classes of UI
 * elements, particularly buttons, do not take kindly to being composited, and
 * may crash REAPER.
 * On WindowsOS, GDI blitting does not perform alpha
 * multiplication of the source bitmap. For proper color rendering, a separate
 * pre-multiplication step is therefore required, using either LICE_Blit or
 * LICE_ProcessRect.
Returns:
1 if successful, otherwise -1 = windowHWND is not
 * a window, -3 = Could not obtain the original window process, -4 = sysBitmap
 * is not a LICE bitmap, -5 = sysBitmap is not a system bitmap, -6 = Could not
 * obtain the window HDC, -7 = Error when subclassing to new window process.
 */
@:native("JS_Composite")
public static function jsComposite(windowHwnd: Identifier, dstX: Int, dstY: Int, dstW: Int, dstH: Int, sYsBitmap: Identifier, srcX: Int, srcY: Int, srcW: Int, srcH: Int, autoUpdate: Unsupported): Int;
/**
 * On WindowsOS, flickering of composited images can be improved considerably by
 * slowing the refresh rate of the window.  The optimal refresh rate may depend
 * on the number of composited bitmaps.
minTime is the minimum refresh delay, in
 * seconds, when only one bitmap is composited onto the window.  The delay time
 * will increase linearly with the number of bitmaps, up to a maximum of maxTime
 * when numBitmapsWhenMax is reached.
If both minTime and maxTime are 0, all
 * delay settings for the window are cleared.
Returns:
 * retval = 1 if
 * successful, 0 if arguments are invalid (i.e. if maxTime < minTime, or
 * maxBitmaps < 1).
 * If delay times have not previously been set for this
 * window, prev time values are 0.
 */
@:native("JS_Composite_Delay")
public static function jsCompositeDelay(windowHwnd: Identifier, minTime: Float, maXTime: Float, numBitmapsWHenMaX: Int): Int;
/**
 * Returns all bitmaps composited to the given window.
The list is formatted as
 * a comma-separated string of hexadecimal values, each representing a
 * LICE_IBitmap* pointer.
retval is the number of linked bitmaps found, or
 * negative if an error occured.
 */
@:native("JS_Composite_ListBitmaps")
public static function jsCompositeListBitmaps(windowHwnd: Identifier): Int;
/**
 * Unlinks the window and bitmap.
 * autoUpdate is an optional parameter. If
 * unlinking a single bitmap and autoUpdate is true, the function will
 * automatically re-draw the window to remove the blitted image.
If no bitmap is
 * specified, all bitmaps composited to the window will be unlinked -- even
 * those by other scripts.
 */
@:native("JS_Composite_Unlink")
public static function jsCompositeUnlink(windowHwnd: Identifier, bitmap: Identifier, autoUpdate: Unsupported): Void;
/**
 * retval is 1 if a file was selected, 0 if the user cancelled the dialog, and
 * -1 if an error occurred.
 */
@:native("JS_Dialog_BrowseForFolder")
public static function jsDialogBrowseForFolder(caption: String, initialFolder: String): Int;
/**
 * If allowMultiple is true, multiple files may be selected. The returned string
 * is \0-separated, with the first substring containing the folder path and
 * subsequent substrings containing the file names.
 * On macOS, the first
 * substring may be empty, and each file name will then contain its entire
 * path.
 * This function only allows selection of existing files, and does not
 * allow creation of new files.
extensionList is a string containing pairs of
 * \0-terminated substrings. The last substring must be terminated by two \0
 * characters. Each pair defines one filter pattern:
 * The first substring in
 * each pair describes the filter in user-readable form (for example, "Lua
 * script files (*.lua)") and will be displayed in the dialog box.
 * The second
 * substring specifies the filter that the operating system must use to search
 * for the files (for example, "*.txt"; the wildcard should not be omitted). To
 * specify multiple extensions for a single display string, use a semicolon to
 * separate the patterns (for example, "*.lua;*.eel").
An example of an
 * extensionList string:
"ReaScript files\0*.lua;*.eel\0Lua files
 * (.lua)\0*.lua\0EEL files (.eel)\0*.eel\0\0".
On macOS, file dialogs do not
 * accept empty extensionLists, nor wildcard extensions (such as "All
 * files\0*.*\0\0"), so each acceptable extension must be listed explicitly. On
 * Linux and Windows, wildcard extensions are acceptable, and if the
 * extensionList string is empty, the dialog will display a default "All files
 * (*.*)" filter.
retval is 1 if one or more files were selected, 0 if the user
 * cancelled the dialog, or negative if an error occurred.
Displaying
 * \0-separated strings:
 * REAPER's IDE and ShowConsoleMsg only display strings
 * up to the first \0 byte. If multiple files were selected, only the first
 * substring containing the path will be displayed. This is not a problem for
 * Lua or EEL, which can access the full string beyond the first \0 byte as
 * usual.
 */
@:native("JS_Dialog_BrowseForOpenFiles")
public static function jsDialogBrowseForOpenFiles(windowTitle: String, initialFolder: String, initialFile: String, eXtensionList: String, alloWMultiple: Bool): Int;
/**
 * retval is 1 if a file was selected, 0 if the user cancelled the dialog, or
 * negative if an error occurred.
extensionList is as described for
 * JS_Dialog_BrowseForOpenFiles.
 */
@:native("JS_Dialog_BrowseForSaveFile")
public static function jsDialogBrowseForSaveFile(windowTitle: String, initialFolder: String, initialFile: String, eXtensionList: String): Int;
/**
 * Returns the 8-byte floating point value at address[offset]. Offset is added
 * as steps of 8 bytes each.
 */
@:native("JS_Double")
public static function jsDouble(pointer: Identifier, offSet: Int): Float;
/**
 * Returns information about a file.
cTime is not implemented on all systems. If
 * it does return a time, the value may differ depending on the OS: on
 * WindowsOS, it may refer to the time that the file was either created or
 * copied, whereas on Linux and macOS, it may refer to the time of last status
 * change.
retval is 0 if successful, negative if not.
 */
@:native("JS_File_Stat")
public static function jsFileStat(filePatH: String): Int;
/**
 * Blits between two device contexts, which may include LICE "system
 * bitmaps".
mode: Optional parameter. "SRCCOPY" by default, or specify "ALPHA"
 * to enable per-pixel alpha blending.
WARNING: On WindowsOS, GDI_Blit does not
 * perform alpha multiplication of the source bitmap. For proper color
 * rendering, a separate pre-multiplication step is therefore required, using
 * either LICE_Blit or LICE_ProcessRect.
 */
@:native("JS_GDI_Blit")
public static function jsGdiBlit(destHdc: Identifier, dstX: Int, dstY: Int, sourceHdc: Identifier, srcX: Int, srXY: Int, wIdtH: Int, heigHt: Int, ?mode: String): Void;
/** No description available */
@:native("JS_GDI_CreateFillBrush")
public static function jsGdiCreateFillBrush(color: Int): Identifier;
/**
 * Parameters:
 * weight: 0 - 1000, with 0 = auto, 400 = normal and 700 = bold.

 * * angle: the angle, in tenths of degrees, between the text and the x-axis of
 * the device.
 * fontName: If empty string "", uses first font that matches the
 * other specified attributes.
Note: Text color must be set separately.
 */
@:native("JS_GDI_CreateFont")
public static function jsGdiCreateFont(heigHt: Int, weigHt: Int, angle: Int, italic: Bool, underLine: Bool, strike: Bool, fontName: String): Identifier;
/** No description available */
@:native("JS_GDI_CreatePen")
public static function jsGdiCreatePen(wIdtH: Int, color: Int): Identifier;
/** No description available */
@:native("JS_GDI_DeleteObject")
public static function jsGdiDeleteObject(gdiObject: Identifier): Void;
/**
 * Parameters:
 * align: Combination of: "TOP", "VCENTER", "LEFT", "HCENTER",
 * "RIGHT", "BOTTOM", "WORDBREAK", "SINGLELINE", "NOCLIP", "CALCRECT",
 * "NOPREFIX" or "ELLIPSIS"
 */
@:native("JS_GDI_DrawText")
public static function jsGdiDrawText(deviceHdc: Identifier, teXt: String, len: Int, left: Int, top: Int, rigHt: Int, bottom: Int, align: String): Int;
/** No description available */
@:native("JS_GDI_FillEllipse")
public static function jsGdiFillEllipse(deviceHdc: Identifier, left: Int, top: Int, rigHt: Int, bottom: Int): Void;
/**
 * packedX and packedY are strings of points, each packed as "<i4".
 */
@:native("JS_GDI_FillPolygon")
public static function jsGdiFillPolygon(deviceHdc: Identifier, packedX: String, packedY: String, numPoints: Int): Void;
/** No description available */
@:native("JS_GDI_FillRect")
public static function jsGdiFillRect(deviceHdc: Identifier, left: Int, top: Int, rigHt: Int, bottom: Int): Void;
/** No description available */
@:native("JS_GDI_FillRoundRect")
public static function jsGdiFillRoundRect(deviceHdc: Identifier, left: Int, top: Int, rigHt: Int, bottom: Int, xrnd: Int, yrnd: Int): Void;
/**
 * Returns the device context for the client area of the specified window.
 */
@:native("JS_GDI_GetClientDC")
public static function jsGdiGetClientDc(windowHwnd: Identifier): Identifier;
/**
 * Returns a device context for the entire screen.
WARNING: Only available on
 * Windows, not Linux or macOS.
 */
@:native("JS_GDI_GetScreenDC")
public static function jsGdiGetScreenDc(): Identifier;
/** No description available */
@:native("JS_GDI_GetSysColor")
public static function jsGdiGetSysColor(guiElement: String): Int;
/** No description available */
@:native("JS_GDI_GetTextColor")
public static function jsGdiGetTextColor(deviceHdc: Identifier): Int;
/**
 * Returns the device context for the entire window, including title bar and
 * frame.
 */
@:native("JS_GDI_GetWindowDC")
public static function jsGdiGetWindowDc(windowHwnd: Identifier): Identifier;
/** No description available */
@:native("JS_GDI_Line")
public static function jsGdiLine(deviceHdc: Identifier, x1: Int, y1: Int, x2: Int, y2: Int): Void;
/**
 * packedX and packedY are strings of points, each packed as "<i4".
 */
@:native("JS_GDI_Polyline")
public static function jsGdiPolyline(deviceHdc: Identifier, packedX: String, packedY: String, numPoints: Int): Void;
/**
 * To release a window HDC, both arguments must be supplied: the HWND as well as
 * the HDC.  To release a screen DC, only the HDC needs to be supplied.  
For
 * compatibility with previous versions, the HWND and HDC can be supplied in any
 * order.
NOTE: Any GDI HDC should be released immediately after drawing, and
 * deferred scripts should get and release new DCs in each cycle.
 */
@:native("JS_GDI_ReleaseDC")
public static function jsGdiReleaseDc(deviceHdc: Identifier, windowHwnd: Identifier): Int;
/**
 * Activates a font, pen, or fill brush for subsequent drawing in the specified
 * device context.
 */
@:native("JS_GDI_SelectObject")
public static function jsGdiSelectObject(deviceHdc: Identifier, gdiObject: Identifier): Identifier;
/** No description available */
@:native("JS_GDI_SetPixel")
public static function jsGdiSetPixel(deviceHdc: Identifier, x: Int, y: Int, color: Int): Void;
/** No description available */
@:native("JS_GDI_SetTextBkColor")
public static function jsGdiSetTextBkColor(deviceHdc: Identifier, color: Int): Void;
/** No description available */
@:native("JS_GDI_SetTextBkMode")
public static function jsGdiSetTextBkMode(deviceHdc: Identifier, mode: Int): Void;
/** No description available */
@:native("JS_GDI_SetTextColor")
public static function jsGdiSetTextColor(deviceHdc: Identifier, color: Int): Void;
/**
 * Blits between two device contexts, which may include LICE "system
 * bitmaps".
modeOptional: "SRCCOPY" by default, or specify "ALPHA" to enable
 * per-pixel alpha blending.
WARNING: On WindowsOS, GDI_Blit does not perform
 * alpha multiplication of the source bitmap. For proper color rendering, a
 * separate pre-multiplication step is therefore required, using either
 * LICE_Blit or LICE_ProcessRect.
 */
@:native("JS_GDI_StretchBlit")
public static function jsGdiStretchBlit(destHdc: Identifier, dstX: Int, dstY: Int, dstW: Int, dstH: Int, sourceHdc: Identifier, srcX: Int, srXY: Int, srcW: Int, srcH: Int, ?mode: String): Void;
/** No description available */
@:native("JS_Header_GetItemCount")
public static function jsHeaderGetItemCount(headerHWnd: Identifier): Int;
/**
 * Returns the 4-byte signed integer at address[offset]. Offset is added as
 * steps of 4 bytes each.
 */
@:native("JS_Int")
public static function jsInt(pointer: Identifier, offSet: Int): Int;
/**
 * Hue is rolled over, saturation and value are clamped, all 0..1. (Alpha
 * remains unchanged.)
 */
@:native("JS_LICE_AlterBitmapHSV")
public static function jsLiceAlterBitmapHsv(bitmap: Identifier, hue: Float, saturation: Float, value: Float): Void;
/**
 * Hue is rolled over, saturation and value are clamped, all 0..1. (Alpha
 * remains unchanged.)
 */
@:native("JS_LICE_AlterRectHSV")
public static function jsLiceAlterRectHsv(bitmap: Identifier, x: Int, y: Int, w: Int, h: Int, hue: Float, saturation: Float, value: Float): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Arc")
public static function jsLiceArc(bitmap: Identifier, cX: Float, cY: Float, r: Float, minAngle: Float, maXAngle: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/** No description available */
@:native("JS_LICE_ArrayAllBitmaps")
public static function jsLiceArrayAllBitmaps(reaperarraY: Identifier): Int;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable
 * per-pixel alpha blending.
LICE color format: 0xAARRGGBB (AA is only used in
 * ALPHA mode).
 */
@:native("JS_LICE_Bezier")
public static function jsLiceBezier(bitmap: Identifier, xstart: Float, ystart: Float, xctl1: Float, yctl1: Float, xctl2: Float, yctl2: Float, xend: Float, yend: Float, tol: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/**
 * Standard LICE modes: "COPY" (default if empty string), "MASK", "ADD",
 * "DODGE", "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with
 * "ALPHA" to enable per-pixel alpha blending.
In addition to the standard LICE
 * modes, LICE_Blit also offers:
 * "CHANCOPY_XTOY", with X and Y any of the
 * four channels, A, R, G or B. (CHANCOPY_ATOA is similar to MASK mode.)
 *
 * "BLUR"
 * "ALPHAMUL", which overwrites the destination with a per-pixel
 * alpha-multiplied copy of the source. (Similar to first clearing the
 * destination with 0x00000000 and then blitting with "COPY,ALPHA".)
 */
@:native("JS_LICE_Blit")
public static function jsLiceBlit(destBitmap: Identifier, dstX: Int, dstY: Int, sourceBitmap: Identifier, srcX: Int, srcY: Int, wIdtH: Int, heigHt: Int, alpHa: Float, mode: String): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Circle")
public static function jsLiceCircle(bitmap: Identifier, cX: Float, cY: Float, r: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/** No description available */
@:native("JS_LICE_Clear")
public static function jsLiceClear(bitmap: Identifier, color: Int): Void;
/** No description available */
@:native("JS_LICE_CreateBitmap")
public static function jsLiceCreateBitmap(isSYsBitmap: Bool, wIdtH: Int, heigHt: Int): Identifier;
/** No description available */
@:native("JS_LICE_CreateFont")
public static function jsLiceCreateFont(): Identifier;
/**
 * Deletes the bitmap, and also unlinks bitmap from any composited window.
 */
@:native("JS_LICE_DestroyBitmap")
public static function jsLiceDestroyBitmap(bitmap: Identifier): Void;
/** No description available */
@:native("JS_LICE_DestroyFont")
public static function jsLiceDestroyFont(liceFont: Identifier): Void;
/** No description available */
@:native("JS_LICE_DrawChar")
public static function jsLiceDrawChar(bitmap: Identifier, x: Int, y: Int, c: Int, color: Int, alpHa: Float, mode: Int): Void;
/** No description available */
@:native("JS_LICE_DrawText")
public static function jsLiceDrawText(bitmap: Identifier, liceFont: Identifier, teXt: String, teXtLen: Int, x1: Int, y1: Int, x2: Int, y2: Int): Int;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillCircle")
public static function jsLiceFillCircle(bitmap: Identifier, cX: Float, cY: Float, r: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/**
 * packedX and packedY are two strings of coordinates, each packed as
 * "<i4".
LICE modes : "COPY" (default if empty string), "MASK", "ADD", "DODGE",
 * "MUL", "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to
 * enable per-pixel alpha blending.
LICE color format: 0xAARRGGBB (AA is only
 * used in ALPHA mode).
 */
@:native("JS_LICE_FillPolygon")
public static function jsLiceFillPolygon(bitmap: Identifier, packedX: String, packedY: String, numPoints: Int, color: Int, alpHa: Float, mode: String): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillRect")
public static function jsLiceFillRect(bitmap: Identifier, x: Int, y: Int, w: Int, h: Int, color: Int, alpHa: Float, mode: String): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_FillTriangle")
public static function jsLiceFillTriangle(bitmap: Identifier, x1: Int, y1: Int, x2: Int, y2: Int, x3: Int, y3: Int, color: Int, alpHa: Float, mode: String): Void;
/** No description available */
@:native("JS_LICE_GetDC")
public static function jsLiceGetDc(bitmap: Identifier): Identifier;
/** No description available */
@:native("JS_LICE_GetHeight")
public static function jsLiceGetHeight(bitmap: Identifier): Int;
/**
 * Returns the color of the specified pixel.
 */
@:native("JS_LICE_GetPixel")
public static function jsLiceGetPixel(bitmap: Identifier, x: Int, y: Int): Float;
/** No description available */
@:native("JS_LICE_GetWidth")
public static function jsLiceGetWidth(bitmap: Identifier): Int;
/** No description available */
@:native("JS_LICE_GradRect")
public static function jsLiceGradRect(bitmap: Identifier, dstX: Int, dstY: Int, dstW: Int, dstH: Int, ir: Float, ig: Float, ib: Float, ia: Float, drdX: Float, dgdX: Float, dbdX: Float, dadX: Float, drdY: Float, dgdY: Float, dbdY: Float, dadY: Float, mode: String): Void;
/** No description available */
@:native("JS_LICE_IsFlipped")
public static function jsLiceIsFlipped(bitmap: Identifier): Bool;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_Line")
public static function jsLiceLine(bitmap: Identifier, x1: Float, y1: Float, x2: Float, y2: Float, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/** No description available */
@:native("JS_LICE_ListAllBitmaps")
public static function jsLiceListAllBitmaps(): Int;
/**
 * Returns a system LICE bitmap containing the JPEG.
 */
@:native("JS_LICE_LoadJPG")
public static function jsLiceLoadJpg(fileName: String): Identifier;
/**
 * Returns a system LICE bitmap containing the JPEG.
 */
@:native("JS_LICE_LoadJPGFromMemory")
public static function jsLiceLoadJpgFromMemory(buffer: String, bufsize: Int): Identifier;
/**
 * Returns a system LICE bitmap containing the PNG.
 */
@:native("JS_LICE_LoadPNG")
public static function jsLiceLoadPng(fileName: String): Identifier;
/**
 * Returns a system LICE bitmap containing the PNG.
 */
@:native("JS_LICE_LoadPNGFromMemory")
public static function jsLiceLoadPngFromMemory(buffer: String, bufsize: Int): Identifier;
/** No description available */
@:native("JS_LICE_MeasureText")
public static function jsLiceMeasureText(teXt: String): Int;
/**
 * Applies bitwise operations to each pixel in the target rectangle.
operand: a
 * color in 0xAARRGGBB format.
modes:
 * "XOR", "OR" or "AND".
 * "SET_XYZ",
 * with XYZ any combination of A, R, G, and B: copies the specified channels
 * from operand to the bitmap. (Useful for setting the alpha values of a
 * bitmap.)
 * "ALPHAMUL": Performs alpha pre-multiplication on each pixel in
 * the rect. operand is ignored in this mode. (On WindowsOS, GDI_Blit does not
 * perform alpha multiplication on the fly, and a separate alpha
 * pre-multiplication step is therefore required.)
NOTE:
LICE_Blit and
 * LICE_ScaledBlit are also useful for processing bitmap colors. For example, to
 * multiply all channel values by 1.5:
reaper.JS_LICE_Blit(bitmap, x, y, bitmap,
 * x, y, w, h, 0.5, "ADD").
 */
@:native("JS_LICE_ProcessRect")
public static function jsLiceProcessRect(bitmap: Identifier, x: Int, y: Int, w: Int, h: Int, mode: String, operand: Float): Bool;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_PutPixel")
public static function jsLicePutPixel(bitmap: Identifier, x: Int, y: Int, color: Float, alpHa: Float, mode: String): Void;
/** No description available */
@:native("JS_LICE_Resize")
public static function jsLiceResize(bitmap: Identifier, wIdtH: Int, heigHt: Int): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable
 * per-pixel alpha blending.
 */
@:native("JS_LICE_RotatedBlit")
public static function jsLiceRotatedBlit(destBitmap: Identifier, dstX: Int, dstY: Int, dstW: Int, dstH: Int, sourceBitmap: Identifier, srcX: Float, srcY: Float, srcW: Float, srcH: Float, angle: Float, rotXcent: Float, rotYcent: Float, cliptoSourcerect: Bool, alpHa: Float, mode: String): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA".
LICE color
 * format: 0xAARRGGBB (AA is only used in ALPHA mode).
 */
@:native("JS_LICE_RoundRect")
public static function jsLiceRoundRect(bitmap: Identifier, x: Float, y: Float, w: Float, h: Float, cornerradius: Int, color: Int, alpHa: Float, mode: String, antialias: Bool): Void;
/**
 * LICE modes: "COPY" (default if empty string), "MASK", "ADD", "DODGE", "MUL",
 * "OVERLAY" or "HSVADJ", any of which may be combined with "ALPHA" to enable
 * per-pixel alpha blending.
 */
@:native("JS_LICE_ScaledBlit")
public static function jsLiceScaledBlit(destBitmap: Identifier, dstX: Int, dstY: Int, dstW: Int, dstH: Int, srcBitmap: Identifier, srcX: Float, srcY: Float, srcW: Float, srcH: Float, alpHa: Float, mode: String): Void;
/**
 * Sets all pixels that match the given color's RGB values to fully transparent,
 * and all other pixels to fully opaque.  (All pixels' RGB values remain
 * unchanged.)
 */
@:native("JS_LICE_SetAlphaFromColorMask")
public static function jsLiceSetAlphaFromColorMask(bitmap: Identifier, colorRgb: Int): Void;
/**
 * Sets the color of the font background.
 */
@:native("JS_LICE_SetFontBkColor")
public static function jsLiceSetFontBkColor(liceFont: Identifier, color: Int): Void;
/** No description available */
@:native("JS_LICE_SetFontColor")
public static function jsLiceSetFontColor(liceFont: Identifier, color: Int): Void;
/**
 * Sets the color of font FX such as shadow.
 */
@:native("JS_LICE_SetFontFXColor")
public static function jsLiceSetFontFxColor(liceFont: Identifier, color: Int): Void;
/**
 * Converts a GDI font into a LICE font.
The font can be modified by the
 * following flags, in a comma-separated list:
"VERTICAL", "BOTTOMUP", "NATIVE",
 * "BLUR", "INVERT", "MONO", "SHADOW" or "OUTLINE".
 */
@:native("JS_LICE_SetFontFromGDI")
public static function jsLiceSetFontFromGdi(liceFont: Identifier, gdiFont: Identifier, moreFormats: String): Void;
/**
 * Parameters:
 * quality is an integer in the range 1..100.
 * forceBaseline is
 * an optional boolean parameter that ensures compatibility with all JPEG
 * viewers by preventing too low quality, "cubist" settings.
 */
@:native("JS_LICE_WriteJPG")
public static function jsLiceWriteJpg(fileName: String, bitmap: Identifier, qualitY: Int, forceBaseLine: Unsupported): Bool;
/** No description available */
@:native("JS_LICE_WritePNG")
public static function jsLiceWritePng(fileName: String, bitmap: Identifier, wantAlpHa: Bool): Bool;
/** No description available */
@:native("JS_ListView_EnsureVisible")
public static function jsListViewEnsureVisible(listvieWHWnd: Identifier, indeX: Int, partialOk: Bool): Void;
/**
 * Returns the index of the next selected list item with index greater that the
 * specified number. Returns -1 if no selected items left.
 */
@:native("JS_ListView_EnumSelItems")
public static function jsListViewEnumSelItems(listvieWHWnd: Identifier, indeX: Int): Int;
/**
 * Returns the index and text of the focused item, if any.
 */
@:native("JS_ListView_GetFocusedItem")
public static function jsListViewGetFocusedItem(listvieWHWnd: Identifier): Int;
/** No description available */
@:native("JS_ListView_GetHeader")
public static function jsListViewGetHeader(listvieWHWnd: Identifier): Identifier;
/**
 * Returns the text and state of specified item.
 */
@:native("JS_ListView_GetItem")
public static function jsListViewGetItem(listvieWHWnd: Identifier, indeX: Int, subItem: Int): String;
/** No description available */
@:native("JS_ListView_GetItemCount")
public static function jsListViewGetItemCount(listvieWHWnd: Identifier): Int;
/**
 * Returns client coordinates of the item.
 */
@:native("JS_ListView_GetItemRect")
public static function jsListViewGetItemRect(listvieWHWnd: Identifier, indeX: Int): Bool;
/**
 * State is a bitmask:
1 = focused, 2 = selected. On Windows only, cut-and-paste
 * marked = 4, drag-and-drop highlighted = 8.
Warning: this function uses the
 * Win32 bitmask values, which differ from the values used by WDL/swell.
 */
@:native("JS_ListView_GetItemState")
public static function jsListViewGetItemState(listvieWHWnd: Identifier, indeX: Int): Int;
/** No description available */
@:native("JS_ListView_GetItemText")
public static function jsListViewGetItemText(listvieWHWnd: Identifier, indeX: Int, subItem: Int): String;
/** No description available */
@:native("JS_ListView_GetSelectedCount")
public static function jsListViewGetSelectedCount(listvieWHWnd: Identifier): Int;
/** No description available */
@:native("JS_ListView_GetTopIndex")
public static function jsListViewGetTopIndex(listvieWHWnd: Identifier): Int;
/** No description available */
@:native("JS_ListView_HitTest")
public static function jsListViewHitTest(listvieWHWnd: Identifier, clientX: Int, clientY: Int): Int;
/**
 * Returns the indices of all selected items as a comma-separated list.
 *
 * retval: Number of selected items found; negative or zero if an error occured.
 */
@:native("JS_ListView_ListAllSelItems")
public static function jsListViewListAllSelItems(listvieWHWnd: Identifier): Int;
/**
 * The mask parameter specifies the state bits that must be set, and the state
 * parameter specifies the new values for those bits.
1 = focused, 2 = selected.
 * On Windows only, cut-and-paste marked = 4, drag-and-drop highlighted =
 * 8.
Warning: this function uses the Win32 bitmask values, which differ from
 * the values used by WDL/swell.
 */
@:native("JS_ListView_SetItemState")
public static function jsListViewSetItemState(listvieWHWnd: Identifier, indeX: Int, state: Int, mask: Int): Void;
/**
 * Currently, this fuction only accepts ASCII text.
 */
@:native("JS_ListView_SetItemText")
public static function jsListViewSetItemText(listvieWHWnd: Identifier, indeX: Int, subItem: Int, teXt: String): Void;
/**
 * Returns the translation of the given US English text, according to the
 * currently loaded Language Pack.
Parameters:
 * LangPackSection: Language
 * Packs are divided into sections such as "common" or "DLG_102".
 * In Lua, by
 * default, text of up to 1024 chars can be returned. To increase (or reduce)
 * the default buffer size, a string and size can be included as optional 3rd
 * and 4th arguments.
Example: reaper.JS_Localize("Actions", "common", "", 20)
 */
@:native("JS_Localize")
public static function jsLocalize(usEnglisH: String, langPackSection: String): String;
/**
 * Finds all open MIDI windows (whether docked or not).
 * retval: The number of
 * MIDI editor windows found; negative if an error occurred.
 * The address of
 * each MIDI editor window is stored in the provided reaper.array. Each address
 * can be converted to a REAPER object (HWND) by the function
 * JS_Window_HandleFromAddress.
 */
@:native("JS_MIDIEditor_ArrayAll")
public static function jsMidiEditorArrayAll(reaperarraY: Identifier): Int;
/**
 * Finds all open MIDI windows (whether docked or not).
 * retval: The number of
 * MIDI editor windows found; negative if an error occurred.
 * list:
 * Comma-separated string of hexadecimal values. Each value is an address that
 * can be converted to a HWND by the function Window_HandleFromAddress.
 */
@:native("JS_MIDIEditor_ListAll")
public static function jsMidiEditorListAll(): Int;
/**
 * Allocates memory for general use by functions that require memory buffers.
 */
@:native("JS_Mem_Alloc")
public static function jsMemAlloc(sizeBYtes: Int): Identifier;
/**
 * Frees memory that was previously allocated by JS_Mem_Alloc.
 */
@:native("JS_Mem_Free")
public static function jsMemFree(mallocPointer: Identifier): Bool;
/**
 * Copies a packed string into a memory buffer.
 */
@:native("JS_Mem_FromString")
public static function jsMemFromString(mallocPointer: Identifier, offSet: Int, packedString: String, stringLengtH: Int): Bool;
/**
 * On Windows, retrieves a handle to the current mouse cursor.
On Linux and
 * macOS, retrieves a handle to the last cursor set by REAPER or its extensions
 * via SWELL.
 */
@:native("JS_Mouse_GetCursor")
public static function jsMouseGetCursor(): Identifier;
/**
 * Retrieves the states of mouse buttons and modifiers keys.
Parameters:
 *
 * flags, state: The parameter and the return value both use the same format as
 * gfx.mouse_cap. For example, to get the states of the left mouse button and
 * the ctrl key, use flags = 0b00000101.
 */
@:native("JS_Mouse_GetState")
public static function jsMouseGetState(flags: Int): Int;
/**
 * Loads a cursor by number.
cursorNumber: Same as used for gfx.setcursor, and
 * includes some of Windows' predefined cursors (with numbers > 32000; refer to
 * documentation for the Win32 C++ function LoadCursor), and REAPER's own
 * cursors (with numbers < 2000).
If successful, returns a handle to the cursor,
 * which can be used in JS_Mouse_SetCursor.
 */
@:native("JS_Mouse_LoadCursor")
public static function jsMouseLoadCursor(cursorNumber: Int): Identifier;
/**
 * Loads a cursor from a .cur file.
forceNewLoad is an optional boolean
 * parameter:
 * If omitted or false, and if the cursor file has already been
 * loaded previously during the REAPER session by any script, the file will not
 * be re-loaded, and the existing handle will be returned.
 * If true, the file
 * will be re-loaded and a new handle will be returned.
 * WARNING: Each time
 * that a cursor file is re-loaded, the number of GDI objects increases for the
 * entire duration of the REAPER session.
If successful, returns a handle to the
 * cursor, which can be used in JS_Mouse_SetCursor.
 */
@:native("JS_Mouse_LoadCursorFromFile")
public static function jsMouseLoadCursorFromFile(patHAndFileName: String, forceNeWLoad: Unsupported): Identifier;
/**
 * Sets the mouse cursor.  (Only lasts while script is running, and for a single
 * "defer" cycle.)
 */
@:native("JS_Mouse_SetCursor")
public static function jsMouseSetCursor(cursorHandle: Identifier): Void;
/**
 * Moves the mouse cursor to the specified screen coordinates.
NOTES:
 * On
 * Windows and Linux, screen coordinates are relative to *upper* left corner of
 * the primary display, and the positive Y-axis points downward.
 * On macOS,
 * screen coordinates are relative to the *bottom* left corner of the primary
 * display, and the positive Y-axis points upward.
 */
@:native("JS_Mouse_SetPosition")
public static function jsMouseSetPosition(x: Int, y: Int): Bool;
/**
 * Returns the version of the js_ReaScriptAPI extension.
 */
@:native("JS_ReaScriptAPI_Version")
public static function jsReaScriptApiVersion(): Float;
/**
 * Returns the memory contents starting at address[offset] as a packed string.
 * Offset is added as steps of 1 byte (char) each.
 */
@:native("JS_String")
public static function jsString(pointer: Identifier, offSet: Int, lengtHCHars: Int): Bool;
/**
 * Returns a 255-byte array that specifies which virtual keys, from 0x01 to
 * 0xFF, have sent KEYDOWN messages since cutoffTime.
Notes:
 * Mouse buttons
 * and modifier keys are not (currently) reliably detected, and
 * JS_Mouse_GetState can be used instead.
 * Auto-repeated KEYDOWN messages are
 * ignored.
 */
@:native("JS_VKeys_GetDown")
public static function jsVKeysGetDown(cutoffTime: Float): String;
/**
 * Retrieves the current states (0 or 1) of all virtual keys, from 0x01 to 0xFF,
 * in a 255-byte array.
cutoffTime: A key is only regarded as down if it sent a
 * KEYDOWN message after the cut-off time, not followed by KEYUP. (This is
 * useful for excluding old KEYDOWN messages that weren't properly followed by
 * KEYUP.) 
If cutoffTime is positive, is it interpreted as absolute time in
 * similar format as time_precise().
If cutoffTime is negative, it is relative
 * to the current time.
Notes:
 * Mouse buttons and modifier keys are not
 * (currently) reliably detected, and JS_Mouse_GetState can be used instead.
 *
 * Auto-repeated KEYDOWN messages are ignored.
 */
@:native("JS_VKeys_GetState")
public static function jsVKeysGetState(cutoffTime: Float): String;
/**
 * Return a 255-byte array that specifies which virtual keys, from 0x01 to 0xFF,
 * have sent KEYUP messages since cutoffTime.
Note: Mouse buttons and modifier
 * keys are not (currently) reliably detected, and JS_Mouse_GetState can be used
 * instead.
 */
@:native("JS_VKeys_GetUp")
public static function jsVKeysGetUp(cutoffTime: Float): String;
/**
 * Intercepting (blocking) virtual keys work similar to the native function
 * PreventUIRefresh:  Each key has a (non-negative) intercept state, and the key
 * is passed through as usual if the state equals 0, or blocked if the state is
 * greater than 0.
keyCode: The virtual key code of the key, or -1 to change the
 * state of all keys.
intercept: A script can increase the intercept state by
 * passing +1, or lower the state by passing -1.  Multiple scripts can block the
 * same key, and the intercept state may reach up to 255. If zero is passed, the
 * intercept state is not changed, but the current state is returned.
Returns:
 * If keyCode refers to a single key, the intercept state of that key is
 * returned.  If keyCode = -1, the state of the key that is most strongly
 * blocked (highest intercept state) is returned.
 */
@:native("JS_VKeys_Intercept")
public static function jsVKeysIntercept(keYCode: Int, intercept: Int): Int;
/**
 * Begins intercepting a window message type to specified window.
Parameters:
 *
 * message: a single message type to be intercepted, either in WM_ or
 * hexadecimal format. For example "WM_SETCURSOR" or "0x0020".
 * passThrough:
 * Whether message should be blocked (false) or passed through (true) to the
 * window.
    For more information on message codes, refer to the Win32 C++ API
 * documentation.
    All WM_ and CB_ message types listed in swell-types.h
 * should be valid cross-platform, and the function can recognize all of these
 * by name. Other messages can be specified by their hex code.
Returns:
 * 1:
 * Success.
 * 0: The message type is already being intercepted by another
 * script.
 * -2: message string could not be parsed.
 * -3: Failure getting
 * original window process / window not valid.
 * -6: Could not obtain the
 * window client HDC.
Notes:
 * Intercepted messages can be polled using
 * JS_WindowMessage_Peek.
 * Intercepted messages can be edited, if necessary,
 * and then forwarded to their original destination using JS_WindowMessage_Post
 * or JS_WindowMessage_Send.
 * To check whether a message type is being blocked
 * or passed through, Peek the message type, or retrieve the entire List of
 * intercepts.
 * Mouse events are typically received by the child window under
 * the mouse, not the parent window.
Keyboard events are usually *not* received
 * by any individual window. To intercept keyboard events, use the VKey
 * functions.
 */
@:native("JS_WindowMessage_Intercept")
public static function jsWindowMessageIntercept(windowHwnd: Identifier, message: String, passTHrougH: Bool): Int;
/**
 * Begins intercepting window messages to specified window.
Parameters:
 *
 * messages: comma-separated string of message types to be intercepted (either
 * in WM_ or hexadecimal format), each with a "block" or "passthrough" modifier
 * to specify whether the message should be blocked or passed through to the
 * window. For example "WM_SETCURSOR:block, 0x0201:passthrough".
    For more
 * information on message codes, refer to the Win32 C++ API documentation.
   
 * All WM_ and CB_ message types listed in swell-types.h should be valid
 * cross-platform, and the function can recognize all of these by name. Other
 * messages can be specified by their hex code.
Returns:
 * 1: Success.
 * 0:
 * The message type is already being intercepted by another script.
 * -1:
 * windowHWND is not a valid window.
 * -2: message string could not be parsed.

 * * -3: Failure getting original window process.
 * -6: COuld not obtain the
 * window client HDC.
Notes:
 * Intercepted messages can be polled using
 * JS_WindowMessage_Peek.
 * Intercepted messages can be edited, if necessary,
 * and then forwarded to their original destination using JS_WindowMessage_Post
 * or JS_WindowMessage_Send.
 * To check whether a message type is being blocked
 * or passed through, Peek the message type, or retrieve the entire List of
 * intercepts.
 */
@:native("JS_WindowMessage_InterceptList")
public static function jsWindowMessageInterceptList(windowHwnd: Identifier, messages: String): Int;
/**
 * Returns a string with a list of all message types currently being intercepted
 * for the specified window.
 */
@:native("JS_WindowMessage_ListIntercepts")
public static function jsWindowMessageListIntercepts(windowHwnd: Identifier): Bool;
/**
 * Changes the passthrough setting of a message type that is already being
 * intercepted.
Returns 1 if successful, 0 if the message type is not yet being
 * intercepted, or -2 if the argument could not be parsed.
 */
@:native("JS_WindowMessage_PassThrough")
public static function jsWindowMessagePassThrough(windowHwnd: Identifier, message: String, passTHrougH: Bool): Int;
/**
 * Polls the state of an intercepted message.
Parameters:
 * message: String
 * containing a single message name, such as "WM_SETCURSOR", or in hexadecimal
 * format, "0x0020".
 (For a list of WM_ and CB_ message types that are valid
 * cross-platform, refer to swell-types.h. Only these will be recognized by WM_
 * or CB_ name.)
Returns:
 * A retval of false indicates that the message type
 * is not being intercepted in the specified window.
 * All messages are
 * timestamped. A time of 0 indicates that no message if this type has been
 * intercepted yet.
 * For more information about wParam and lParam for
 * different message types, refer to Win32 C++ documentation.
 * For example, in
 * the case of mousewheel, returns mousewheel delta, modifier keys, x position
 * and y position.
 * wParamHigh, lParamLow and lParamHigh are signed, whereas
 * wParamLow is unsigned.
 */
@:native("JS_WindowMessage_Peek")
public static function jsWindowMessagePeek(windowHwnd: Identifier, message: String): Bool;
/**
 * If the specified window and message type are not currently being intercepted
 * by a script, this function will post the message in the message queue of the
 * specified window, and return without waiting.
If the window and message type
 * are currently being intercepted, the message will be sent directly to the
 * original window process, similar to WindowMessage_Send, thereby skipping any
 * intercepts.
Parameters:
 * message: String containing a single message name,
 * such as "WM_SETCURSOR", or in hexadecimal format, "0x0020".
 (For a list of
 * WM_ and CB_ message types that are valid cross-platform, refer to
 * swell-types.h. Only these will be recognized by WM_ or CB_ name.)
 * wParam,
 * wParamHigh, lParam and lParamHigh: Low and high 16-bit WORDs of the WPARAM
 * and LPARAM parameters.
(Most window messages encode separate information into
 * the two WORDs. However, for those rare cases in which the entire WPARAM and
 * LPARAM must be used to post a large pointer, the script can store this
 * address in wParam or lParam, and keep wParamHigh and lParamHigh
 * zero.)
Notes:
 * For more information about parameter values, refer to
 * documentation for the Win32 C++ function PostMessage.
 * Messages should only
 * be sent to windows that were created from the main thread.
 * Useful for
 * simulating mouse clicks and calling mouse modifier actions from scripts.
 */
@:native("JS_WindowMessage_Post")
public static function jsWindowMessagePost(windowHwnd: Identifier, message: String, wParam: Float, wParamHigHWord: Int, lParam: Float, lParamHigHWord: Int): Bool;
/**
 * Release intercepts of specified message types.
Parameters:
 * messages:
 * "WM_SETCURSOR,WM_MOUSEHWHEEL" or "0x0020,0x020E", for example.
 */
@:native("JS_WindowMessage_Release")
public static function jsWindowMessageRelease(windowHwnd: Identifier, messages: String): Int;
/**
 * Release script intercepts of window messages for all windows.
 */
@:native("JS_WindowMessage_ReleaseAll")
public static function jsWindowMessageReleaseAll(): Void;
/**
 * Release script intercepts of window messages for specified window.
 */
@:native("JS_WindowMessage_ReleaseWindow")
public static function jsWindowMessageReleaseWindow(windowHwnd: Identifier): Void;
/**
 * Sends a message to the specified window by calling the window process
 * directly, and only returns after the message has been processed. Any
 * intercepts of the message by scripts will be skipped, and the message can
 * therefore not be blocked.
Parameters:
 * message: String containing a single
 * message name, such as "WM_SETCURSOR", or in hexadecimal format, "0x0020".

 * (For a list of WM_ and CB_ message types that are valid cross-platform, refer
 * to swell-types.h. Only these will be recognized by WM_ or CB_ name.)
 *
 * wParam, wParamHigh, lParam and lParamHigh: Low and high 16-bit WORDs of the
 * WPARAM and LPARAM parameters.
(Most window messages encode separate
 * information into the two WORDs. However, for those rare cases in which the
 * entire WPARAM and LPARAM must be used to post a large pointer, the script can
 * store this address in wParam or lParam, and keep wParamHigh and lParamHigh
 * zero.)
Notes:
 * For more information about parameter and return values,
 * refer to documentation for the Win32 C++ function SendMessage.
 * Messages
 * should only be sent to windows that were created from the main thread.
 *
 * Useful for simulating mouse clicks and calling mouse modifier actions from
 * scripts.
 */
@:native("JS_WindowMessage_Send")
public static function jsWindowMessageSend(windowHwnd: Identifier, message: String, wParam: Float, wParamHigHWord: Int, lParam: Float, lParamHigHWord: Int): Int;
/** No description available */
@:native("JS_Window_AddressFromHandle")
public static function jsWindowAddressFromHandle(handle: Identifier): Float;
/**
 * Finds all child windows of the specified parent.
Returns:
 * retval: The
 * number of windows found; negative if an error occurred.
 * The addresses are
 * stored in the provided reaper.array, and can be converted to REAPER objects
 * (HWNDs) by the function JS_Window_HandleFromAddress.
 */
@:native("JS_Window_ArrayAllChild")
public static function jsWindowArrayAllChild(parentHWnd: Identifier, reaperarraY: Identifier): Int;
/**
 * Finds all top-level windows.
Returns:
 * retval: The number of windows found;
 * negative if an error occurred.
 * The addresses are stored in the provided
 * reaper.array, and can be converted to REAPER objects (HWNDs) by the function
 * JS_Window_HandleFromAddress.
 */
@:native("JS_Window_ArrayAllTop")
public static function jsWindowArrayAllTop(reaperarraY: Identifier): Int;
/**
 * Finds all windows, whether top-level or child, whose titles match the
 * specified string.
Returns:
 * retval: The number of windows found; negative
 * if an error occurred.
 * The addresses are stored in the provided
 * reaper.array, and can be converted to REAPER objects (HWNDs) by the function
 * JS_Window_HandleFromAddress.
Parameters:
 * exact: Match entire title
 * exactly, or match substring of title.
 */
@:native("JS_Window_ArrayFind")
public static function jsWindowArrayFind(title: String, eXact: Bool, reaperarraY: Identifier): Int;
/** No description available */
@:native("JS_Window_AttachResizeGrip")
public static function jsWindowAttachResizeGrip(windowHwnd: Identifier): Void;
/**
 * Attaches a "pin on top" button to the window frame. The button should
 * remember its state when closing and re-opening the window.
WARNING: This
 * function does not yet work on Linux.
 */
@:native("JS_Window_AttachTopmostPin")
public static function jsWindowAttachTopmostPin(windowHwnd: Identifier): Void;
/**
 * Converts the client-area coordinates of a specified point to screen
 * coordinates.
NOTES:
 * On Windows and Linux, screen coordinates are relative
 * to *upper* left corner of the primary display, and the positive Y-axis points
 * downward.
 * On macOS, screen coordinates are relative to the *bottom* left
 * corner of the primary display, and the positive Y-axis points upward.
 * On
 * all platforms, client coordinates are relative to the upper left corner of
 * the client area.
 */
@:native("JS_Window_ClientToScreen")
public static function jsWindowClientToScreen(windowHwnd: Identifier, x: Int, y: Int): Int;
/**
 * Creates a modeless window with WS_OVERLAPPEDWINDOW style and only rudimentary
 * features. Scripts can paint into the window using GDI or LICE/Composite
 * functions (and JS_Window_InvalidateRect to trigger re-painting).
style: An
 * optional parameter that overrides the default style. The string may include
 * any combination of standard window styles, such as "POPUP" for a frameless
 * window, or "CAPTION,SIZEBOX,SYSMENU" for a standard framed window.
On Linux
 * and macOS, "MAXIMIZE" has not yet been implemented, and the remaining styles
 * may appear slightly different from their WindowsOS counterparts.
className:
 * On Windows, only standard ANSI characters are supported.
ownerHWND: Optional
 * parameter, only available on WindowsOS.  Usually either the REAPER main
 * window or another script window, and useful for ensuring that the created
 * window automatically closes when the owner is closed.
NOTE: On Linux and
 * macOS, the window contents are only updated *between* defer cycles, so the
 * window cannot be animated by for/while loops within a single defer cycle.
 */
@:native("JS_Window_Create")
public static function jsWindowCreate(title: String, className: String, x: Int, y: Int, w: Int, h: Int, ?stYle: String, oWnerHWnd: Identifier): Identifier;
/**
 * Destroys the specified window.
 */
@:native("JS_Window_Destroy")
public static function jsWindowDestroy(windowHwnd: Identifier): Void;
/**
 * Enables or disables mouse and keyboard input to the specified window or
 * control.
 */
@:native("JS_Window_Enable")
public static function jsWindowEnable(windowHwnd: Identifier, enable: Bool): Void;
/**
 * On macOS, returns the Metal graphics setting:
2 = Metal enabled and support
 * GetDC()/ReleaseDC() for drawing (more overhead).
1 = Metal enabled.
0 = N/A
 * (Windows and Linux).
-1 = non-metal async layered mode.
-2 = non-metal
 * non-async layered mode.
WARNING: If using mode -1, any BitBlt()/StretchBlt()
 * MUST have the source bitmap persist. If it is resized after Blit it could
 * cause crashes.
 */
@:native("JS_Window_EnableMetal")
public static function jsWindowEnableMetal(windowHwnd: Identifier): Int;
/**
 * Returns a HWND to a window whose title matches the specified string.
 *
 * Unlike the Win32 function FindWindow, this function searches top-level as
 * well as child windows, so that the target window can be found irrespective of
 * docked state.
 * In addition, the function can optionally match substrings of
 * the title.
 * Matching is not case sensitive.
Parameters:
 * exact: Match
 * entire title, or match substring of title.
 */
@:native("JS_Window_Find")
public static function jsWindowFind(title: String, eXact: Bool): Identifier;
/**
 * Returns a HWND to a child window whose title matches the specified
 * string.
Parameters:
 * exact: Match entire title length, or match substring
 * of title. In both cases, matching is not case sensitive.
 */
@:native("JS_Window_FindChild")
public static function jsWindowFindChild(parentHWnd: Identifier, title: String, eXact: Bool): Identifier;
/**
 * Similar to the C++ WIN32 function GetDlgItem, this function finds child
 * windows by ID.
(The ID of a window may be retrieved by JS_Window_GetLongPtr.)
 */
@:native("JS_Window_FindChildByID")
public static function jsWindowFindChildById(parentHWnd: Identifier, id: Int): Identifier;
/**
 * Returns a handle to a child window whose class and title match the specified
 * strings.
Parameters: * childWindow: The function searches child windows,
 * beginning with the window *after* the specified child window. If childHWND is
 * equal to parentHWND, the search begins with the first child window of
 * parentHWND.
 * title: An empty string, "", will match all windows. (Search is
 * not case sensitive.)
 */
@:native("JS_Window_FindEx")
public static function jsWindowFindEx(parentHWnd: Identifier, cHildHWnd: Identifier, className: String, title: String): Identifier;
/**
 * Returns a HWND to a top-level window whose title matches the specified
 * string.
Parameters:
 * exact: Match entire title length, or match substring
 * of title. In both cases, matching is not case sensitive.
 */
@:native("JS_Window_FindTop")
public static function jsWindowFindTop(title: String, eXact: Bool): Identifier;
/**
 * Retrieves a HWND to the window that contains the specified point.
NOTES:
 *
 * On Windows and Linux, screen coordinates are relative to *upper* left corner
 * of the primary display, and the positive Y-axis points downward.
 * On macOS,
 * screen coordinates are relative to the *bottom* left corner of the primary
 * display, and the positive Y-axis points upward.
 */
@:native("JS_Window_FromPoint")
public static function jsWindowFromPoint(x: Int, y: Int): Identifier;
/**
 * WARNING: May not be fully implemented on macOS and Linux.
 */
@:native("JS_Window_GetClassName")
public static function jsWindowGetClassName(windowHwnd: Identifier): String;
/**
 * Retrieves the screen coordinates of the client area rectangle of the
 * specified window.
NOTES:
 * Unlike the C++ function GetClientRect, this
 * function returns the screen coordinates, not the width and height. To get the
 * client size, use GetClientSize.
 * The pixel at (right, bottom) lies
 * immediately outside the rectangle.
 * On Windows and Linux, screen
 * coordinates are relative to *upper* left corner of the primary display, and
 * the positive Y-axis points downward.
 * On macOS, screen coordinates are
 * relative to the *bottom* left corner of the primary display, and the positive
 * Y-axis points upward.
 */
@:native("JS_Window_GetClientRect")
public static function jsWindowGetClientRect(windowHwnd: Identifier): Bool;
/** No description available */
@:native("JS_Window_GetClientSize")
public static function jsWindowGetClientSize(windowHwnd: Identifier): Bool;
/**
 * Retrieves a HWND to the window that has the keyboard focus, if the window is
 * attached to the calling thread's message queue.
 */
@:native("JS_Window_GetFocus")
public static function jsWindowGetFocus(): Identifier;
/**
 * Retrieves a HWND to the top-level foreground window (the window with which
 * the user is currently working).
 */
@:native("JS_Window_GetForeground")
public static function jsWindowGetForeground(): Identifier;
/**
 * Similar to JS_Window_GetLongPtr, but returns the information as a number
 * instead of a pointer. 
In the case of "DLGPROC" and "WNDPROC", the return
 * values can be converted to pointers by JS_Window_HandleFromAddress.
If the
 * function fails, the return value is 0.
 */
@:native("JS_Window_GetLong")
public static function jsWindowGetLong(windowHwnd: Identifier, info: String): Float;
/**
 * Returns information about the specified window.
info: "USERDATA", "WNDPROC",
 * "DLGPROC", "ID", "EXSTYLE" or "STYLE".
For documentation about the types of
 * information returned, refer to the Win32 function GetWindowLongPtr.
The
 * values returned by "DLGPROC" and "WNDPROC" are typically used as-is, as
 * pointers, whereas the others should first be converted to integers.
If the
 * function fails, a null pointer is returned.
 */
@:native("JS_Window_GetLongPtr")
public static function jsWindowGetLongPtr(windowHwnd: Identifier, info: String): Identifier;
/**
 * Retrieves a HWND to the specified window's parent or owner.
Returns NULL if
 * the window is unowned or if the function otherwise fails.
 */
@:native("JS_Window_GetParent")
public static function jsWindowGetParent(windowHwnd: Identifier): Identifier;
/**
 * Retrieves the screen coordinates of the bounding rectangle of the specified
 * window.
NOTES:
 * On Windows and Linux, coordinates are relative to *upper*
 * left corner of the primary display, and the positive Y-axis points downward.

 * * On macOS, coordinates are relative to the *bottom* left corner of the
 * primary display, and the positive Y-axis points upward.
 * The pixel at
 * (right, bottom) lies immediately outside the rectangle.
 */
@:native("JS_Window_GetRect")
public static function jsWindowGetRect(windowHwnd: Identifier): Bool;
/**
 * Retrieves a handle to a window that has the specified relationship (Z-Order
 * or owner) to the specified window.
relation: "LAST", "NEXT", "PREV", "OWNER"
 * or "CHILD".
(Refer to documentation for Win32 C++ function GetWindow.)
 */
@:native("JS_Window_GetRelated")
public static function jsWindowGetRelated(windowHwnd: Identifier, relation: String): Identifier;
/**
 * Retrieves the scroll information of a window.
Parameters:
 * windowHWND: The
 * window that contains the scrollbar. This is usually a child window, not a
 * top-level, framed window.
 * scrollbar: "v" (or "SB_VERT", or "VERT") for
 * vertical scroll, "h" (or "SB_HORZ" or "HORZ") for horizontal.
Returns:
 *
 * Leftmost or topmost visible pixel position, as well as the visible page size,
 * the range minimum and maximum, and scroll box tracking position.
 */
@:native("JS_Window_GetScrollInfo")
public static function jsWindowGetScrollInfo(windowHwnd: Identifier, scrollbar: String): Bool;
/**
 * Returns the title (if any) of the specified window.
 */
@:native("JS_Window_GetTitle")
public static function jsWindowGetTitle(windowHwnd: Identifier): String;
/**
 * Retrieves the dimensions of the display monitor that has the largest area of
 * intersection with the specified rectangle.
If the monitor is not the primary
 * display, some of the rectangle's coordinates may be negative.
wantWork:
 * Returns the work area of the display, which excludes the system taskbar or
 * application desktop toolbars.
 */
@:native("JS_Window_GetViewportFromRect")
public static function jsWindowGetViewportFromRect(x1: Int, y1: Int, x2: Int, y2: Int, wantWork: Bool): Int;
/**
 * Converts an address to a handle (such as a HWND) that can be utilized by
 * REAPER and other API functions.
 */
@:native("JS_Window_HandleFromAddress")
public static function jsWindowHandleFromAddress(address: Float): Identifier;
/**
 * Similar to the Win32 function InvalidateRect.
 */
@:native("JS_Window_InvalidateRect")
public static function jsWindowInvalidateRect(windowHwnd: Identifier, left: Int, top: Int, rigHt: Int, bottom: Int, eraseBackground: Bool): Bool;
/**
 * Determines whether a window is a child window or descendant window of a
 * specified parent window.
 */
@:native("JS_Window_IsChild")
public static function jsWindowIsChild(parentHWnd: Identifier, cHildHWnd: Identifier): Bool;
/**
 * Determines the visibility state of the window.
 */
@:native("JS_Window_IsVisible")
public static function jsWindowIsVisible(windowHwnd: Identifier): Bool;
/**
 * Determines whether the specified window handle identifies an existing
 * window.
On macOS and Linux, only windows that were created by WDL/swell will
 * be identified (and only such windows should be acted on by scripts).
NOTE:
 * Since REAPER v5.974, windows can be checked using the native function
 * ValidatePtr(windowHWND, "HWND").
 */
@:native("JS_Window_IsWindow")
public static function jsWindowIsWindow(windowHwnd: Identifier): Bool;
/**
 * Finds all child windows of the specified parent.
Returns:
 * retval: The
 * number of windows found; negative if an error occurred.
 * list: A
 * comma-separated string of hexadecimal values.
Each value is an address that
 * can be converted to a HWND by the function Window_HandleFromAddress.
 */
@:native("JS_Window_ListAllChild")
public static function jsWindowListAllChild(parentHWnd: Identifier): Int;
/**
 * Finds all top-level windows.
Returns:
 * retval: The number of windows found;
 * negative if an error occurred.
 * list: A comma-separated string of
 * hexadecimal values. Each value is an address that can be converted to a HWND
 * by the function Window_HandleFromAddress.
 */
@:native("JS_Window_ListAllTop")
public static function jsWindowListAllTop(): Int;
/**
 * Finds all windows (whether top-level or child) whose titles match the
 * specified string.
Returns:
 * retval: The number of windows found; negative
 * if an error occurred.
 * list: A comma-separated string of hexadecimal
 * values. Each value is an address that can be converted to a HWND by the
 * function Window_HandleFromAddress.
Parameters:
 * exact: Match entire title
 * exactly, or match substring of title.
 */
@:native("JS_Window_ListFind")
public static function jsWindowListFind(title: String, eXact: Bool): Int;
/**
 * Deprecated - use GetViewportFromRect instead.
 */
@:native("JS_Window_MonitorFromRect")
public static function jsWindowMonitorFromRect(x1: Int, y1: Int, x2: Int, y2: Int, wantWork: Bool): Int;
/**
 * Changes the position of the specified window, keeping its size
 * constant.
NOTES:
 * For top-level windows, position is relative to the
 * primary display.
 * On Windows and Linux, position is calculated as the
 * coordinates of the upper left corner of the window, relative to upper left
 * corner of the primary display, and the positive Y-axis points downward.
 * On
 * macOS, position is calculated as the coordinates of the bottom left corner of
 * the window, relative to bottom left corner of the display, and the positive
 * Y-axis points upward.
 * For a child window, on all platforms, position is
 * relative to the upper-left corner of the parent window's client area.
 *
 * Equivalent to calling JS_Window_SetPosition with NOSIZE, NOZORDER, NOACTIVATE
 * and NOOWNERZORDER flags set.
 */
@:native("JS_Window_Move")
public static function jsWindowMove(windowHwnd: Identifier, left: Int, top: Int): Void;
/**
 * Sends a "WM_COMMAND" message to the specified window, which simulates a user
 * selecting a command in the window menu.
This function is similar to
 * Main_OnCommand and MIDIEditor_OnCommand, but can send commands to any window
 * that has a menu.
In the case of windows that are listed among the Action
 * list's contexts (such as the Media Explorer), the commandIDs of the actions
 * in the Actions list may be used.
 */
@:native("JS_Window_OnCommand")
public static function jsWindowOnCommand(windowHwnd: Identifier, commandId: Int): Bool;
/**
 * Changes the dimensions of the specified window, keeping the top left corner
 * position constant.
 * If resizing script GUIs, call gfx.update() after
 * resizing.
* Equivalent to calling JS_Window_SetPosition with NOMOVE,
 * NOZORDER, NOACTIVATE and NOOWNERZORDER flags set.
 */
@:native("JS_Window_Resize")
public static function jsWindowResize(windowHwnd: Identifier, wIdtH: Int, heigHt: Int): Void;
/**
 * Converts the screen coordinates of a specified point on the screen to
 * client-area coordinates.
NOTES:
 * On Windows and Linux, screen coordinates
 * are relative to *upper* left corner of the primary display, and the positive
 * Y-axis points downward.
 * On macOS, screen coordinates are relative to the
 * *bottom* left corner of the primary display, and the positive Y-axis points
 * upward.
 * On all platforms, client coordinates are relative to the upper
 * left corner of the client area.
 */
@:native("JS_Window_ScreenToClient")
public static function jsWindowScreenToClient(windowHwnd: Identifier, x: Int, y: Int): Int;
/**
 * Sets the keyboard focus to the specified window.
 */
@:native("JS_Window_SetFocus")
public static function jsWindowSetFocus(windowHwnd: Identifier): Void;
/**
 * Brings the specified window into the foreground, activates the window, and
 * directs keyboard input to it.
 */
@:native("JS_Window_SetForeground")
public static function jsWindowSetForeground(windowHwnd: Identifier): Void;
/**
 * Similar to the Win32 function SetWindowLongPtr. 
info: "USERDATA", "WNDPROC",
 * "DLGPROC", "ID", "EXSTYLE" or "STYLE", and only on WindowOS, "INSTANCE" and
 * "PARENT".
 */
@:native("JS_Window_SetLong")
public static function jsWindowSetLong(windowHwnd: Identifier, info: String, value: Float): Float;
/**
 * Sets the window opacity.
Parameters:
mode: either "ALPHA" or "COLOR". 
value:
 * If ALPHA, the specified value may range from zero to one, and will apply to
 * the entire window, frame included. 
If COLOR, value specifies a 0xRRGGBB
 * color, and all pixels of this color will be made transparent. (All mouse
 * clicks over transparent pixels will pass through, too).  WARNING:
COLOR mode
 * is only available in Windows, not Linux or macOS.
Transparency can only be
 * applied to top-level windows. If windowHWND refers to a child window, the
 * entire top-level window that contains windowHWND will be made transparent.
 */
@:native("JS_Window_SetOpacity")
public static function jsWindowSetOpacity(windowHwnd: Identifier, mode: String, value: Float): Bool;
/**
 * If successful, returns a handle to the previous parent window.
Only on
 * WindowsOS: If parentHWND is not specified, the desktop window becomes the new
 * parent window.
 */
@:native("JS_Window_SetParent")
public static function jsWindowSetParent(cHildHWnd: Identifier, parentHWnd: Identifier): Identifier;
/**
 * Interface to the Win32/swell function SetWindowPos, with which window
 * position, size, Z-order and visibility can be set, and new frame styles can
 * be applied.
ZOrder and flags are optional parameters. If no arguments are
 * supplied, the window will simply be moved and resized, as if the NOACTIVATE,
 * NOZORDER, NOOWNERZORDER flags were set.
 * ZOrder: "BOTTOM", "TOPMOST",
 * "NOTOPMOST", "TOP" or a window HWND converted to a string, for example by the
 * Lua function tostring.
 * flags: Any combination of the standard flags, of
 * which "NOMOVE", "NOSIZE", "NOZORDER", "NOACTIVATE", "SHOWWINDOW",
 * "FRAMECHANGED" and "NOCOPYBITS" should be valid cross-platform.
 */
@:native("JS_Window_SetPosition")
public static function jsWindowSetPosition(windowHwnd: Identifier, left: Int, top: Int, wIdtH: Int, heigHt: Int, ?zorder: String, ?flags: String): Bool;
/**
 * Parameters:
 * scrollbar: "v" (or "SB_VERT", or "VERT") for vertical scroll,
 * "h" (or "SB_HORZ" or "HORZ") for horizontal.
NOTE: API functions can scroll
 * REAPER's windows, but cannot zoom them.  Instead, use actions such as "View:
 * Zoom to one loop iteration".
 */
@:native("JS_Window_SetScrollPos")
public static function jsWindowSetScrollPos(windowHwnd: Identifier, scrollbar: String, position: Int): Bool;
/**
 * Sets and applies a window style.
style may include any combination of
 * standard window styles, such as "POPUP" for a frameless window, or
 * "CAPTION,SIZEBOX,SYSMENU" for a standard framed window.
On Linux and macOS,
 * "MAXIMIZE" has not yet been implmented, and the remaining styles may appear
 * slightly different from their WindowsOS counterparts.
 */
@:native("JS_Window_SetStyle")
public static function jsWindowSetStyle(windowHwnd: Identifier, stYle: String): Bool;
/**
 * Changes the title of the specified window. Returns true if successful.
 */
@:native("JS_Window_SetTitle")
public static function jsWindowSetTitle(windowHwnd: Identifier, title: String): Bool;
/**
 * Sets the window Z order.
 * Equivalent to calling JS_Window_SetPos with flags
 * NOMOVE | NOSIZE.
 * Not all the Z orders have been implemented in Linux
 * yet.
Parameters:
 * ZOrder: "BOTTOM", "TOPMOST", "NOTOPMOST", "TOP", or a
 * window HWND converted to a string, for example by the Lua function
 * tostring.
* InsertAfterHWND: For compatibility with older versions, this
 * parameter is still available, and is optional. If ZOrder is "INSERTAFTER",
 * insertAfterHWND must be a handle to the window behind which windowHWND will
 * be placed in the Z order, equivalent to setting ZOrder to this HWND;
 * otherwise, insertAfterHWND is ignored and can be left out (or it can simply
 * be set to the same value as windowHWND).
 */
@:native("JS_Window_SetZOrder")
public static function jsWindowSetZorder(windowHwnd: Identifier, zorder: String, insertAfterHWnd: Identifier): Bool;
/**
 * Sets the specified window's show state.
Parameters:
 * state: One of the
 * following options: "SHOW", "SHOWNA" (or "SHOWNOACTIVATE"), "SHOWMINIMIZED",
 * "HIDE", "NORMAL", "SHOWNORMAL", "SHOWMAXIMIZED", "SHOWDEFAULT" or "RESTORE".
 * On Linux and macOS, only the first four options are fully implemented.
 */
@:native("JS_Window_Show")
public static function jsWindowShow(windowHwnd: Identifier, state: String): Void;
/**
 * Similar to the Win32 function UpdateWindow.
 */
@:native("JS_Window_Update")
public static function jsWindowUpdate(windowHwnd: Identifier): Void;
/**
 * Closes the zip archive, using either the file name or the zip handle.
 * Finalizes entries and releases resources.
 */
@:native("JS_Zip_Close")
public static function jsZipClose(zipFile: String, zipHandle: Identifier): Int;
/** No description available */
@:native("JS_Zip_CountEntries")
public static function jsZipCountEntries(zipHandle: Identifier): Int;
/**
 * Deletes the specified entries from an existing Zip file.
entryNames is
 * zero-separated and double-zero-terminated.
Returns the number of deleted
 * entries on success, negative number (< 0) on error.
 */
@:native("JS_Zip_DeleteEntries")
public static function jsZipDeleteEntries(zipHandle: Identifier, entrYNames: String, entrYNamesStrLen: Int): Int;
/**
 * Closes a zip entry, flushes buffer and releases resources. In WRITE mode,
 * entries must be closed in order to apply and save changes.
Returns 0 on
 * success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_Close")
public static function jsZipEntryClose(zipHandle: Identifier): Int;
/**
 * Compresses the specified file into the zip archive's open entry.
Returns 0 on
 * success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_CompressFile")
public static function jsZipEntryCompressFile(zipHandle: Identifier, inputFile: String): Int;
/**
 * Compresses the specified memory buffer into the zip archive's open
 * entry.
Returns 0 on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_CompressMemory")
public static function jsZipEntryCompressMemory(zipHandle: Identifier, buf: String, bufSize: Int): Int;
/**
 * Extracts the zip archive's open entry.
Returns 0 on success, negative number
 * (< 0) on error.
 */
@:native("JS_Zip_Entry_ExtractToFile")
public static function jsZipEntryExtractToFile(zipHandle: Identifier, outputFile: String): Int;
/**
 * Extracts and returns the zip archive's open entry.
Returns the number of
 * bytes extracted on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Entry_ExtractToMemory")
public static function jsZipEntryExtractToMemory(zipHandle: Identifier): Int;
/**
 * Returns information about the zip archive's open entry.
 */
@:native("JS_Zip_Entry_Info")
public static function jsZipEntryInfo(zipHandle: Identifier): Int;
/**
 * Opens a new entry by index in the zip archive.
This function is only valid if
 * zip archive was opened in 'r' (readonly) mode.
Returns 0 on success, negative
 * number on error.
 */
@:native("JS_Zip_Entry_OpenByIndex")
public static function jsZipEntryOpenByIndex(zipHandle: Identifier, indeX: Int): Int;
/**
 * Opens an entry by name in the zip archive.
For zip archive opened in 'w' or
 * 'a' mode the function will append a new entry. In readonly mode the function
 * tries to locate an existing entry.
Returns 0 on success, negative number (<
 * 0) on error.
 */
@:native("JS_Zip_Entry_OpenByName")
public static function jsZipEntryOpenByName(zipHandle: Identifier, entrYName: String): Int;
/**
 * Returns a descriptive string for the given error code.
 */
@:native("JS_Zip_ErrorString")
public static function jsZipErrorString(errorNum: Int): String;
/**
 * Extracts an existing Zip file to the specified folder.
Returns the number of
 * extracted files on success, negative number (< 0) on error.
 */
@:native("JS_Zip_Extract")
public static function jsZipExtract(zipFile: String, outputFolder: String): Int;
/**
 * Returns the number of entries and a zero-separated and double-zero-terminated
 * string of entry names.
On error, returns a negative number (< 0).
 */
@:native("JS_Zip_ListAllEntries")
public static function jsZipListAllEntries(zipHandle: Identifier): Int;
/**
 * Opens a zip archive using the given mode, which can be either "READ" or
 * "WRITE" (or simply 'r' or 'w').
 * READ: Opens an existing archive for
 * reading/extracting.
 * WRITE: Opens an archive for writing/deleting. If the
 * file doesn't exist, an empty archive will created.
compressionLevel is only
 * relevant for WRITE mode, and ranges from 0 (fastest, no compression) to 9
 * (slowest, best compression), with a default of 6.
If successful, returns 0
 * and a handle to the Zip archive. If failed, returns a negative error code. If
 * the file is already open -- in the given mode -- the existing handle will be
 * returned.
NOTES:
 * The Zip API functions support Unicode file names and
 * entry names.
 * The original zip specification did not support Unicode. Some
 * applications still use this outdated specification by default, or try to use
 * the local code page. This may lead to incompatibility and incorrect retrieval
 * of file or entry names.
 */
@:native("JS_Zip_Open")
public static function jsZipOpen(zipFile: String, mode: String, compressionLevel: Int): Identifier;
/**
 * This function combines all other NF_Peak/RMS functions in a single one and
 * additionally returns peak RMS positions. Lua example code here. Note: It's
 * recommended to use this function with ReaScript/Lua as it provides
 * reaper.array objects. If using this function with other scripting languages,
 * you must provide arrays in the reaper.array format.
 */
@:native("NF_AnalyzeMediaItemPeakAndRMS")
public static function nfAnalyzeMediaItemPeakAndRms(item: MediaItem, windowSize: Float, reaperArraYPeaks: Identifier, reaperArraYPeakPositions: Identifier, reaperArraYRmSs: Identifier, reaperArraYRmSPositions: Identifier): Bool;
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
 * Same as NF_AnalyzeTakeLoudness but additionally returns shortTermMaxPos and
 * momentaryMaxPos (in absolute project time). Note: shortTermMaxPos and
 * momentaryMaxPos indicate the beginning of time , (3 sec. and 0.4 sec. resp.).
 */
@:native("NF_AnalyzeTakeLoudness2")
public static function nfAnalyzeTakeLoudness2(take: MediaItemTake, analYzeTruePeak: Bool): Bool;
/**
 * Does LUFS integrated analysis only. Faster than full loudness analysis
 * (NF_AnalyzeTakeLoudness) . Use this if only LUFS integrated is required. Take
 * vol. env. is taken into account. See: Signal flow
 */
@:native("NF_AnalyzeTakeLoudness_IntegratedOnly")
public static function nfAnalyzeTakeLoudnessIntegratedOnly(take: MediaItemTake): Bool;
/**
 * Returns true on success.
 */
@:native("NF_Base64_Decode")
public static function nfBase64Decode(base64Str: String): Bool;
/**
 * Input string may contain null bytes in REAPER 6.44 or newer. Note: Doesn't
 * allow padding in the middle (e.g. concatenated encoded strings), doesn't
 * allow newlines.
 */
@:native("NF_Base64_Encode")
public static function nfBase64Encode(str: String, usePadding: Bool): String;
/**
 * Returns true if global startup action was cleared successfully.
 */
@:native("NF_ClearGlobalStartupAction")
public static function nfClearGlobalStartupAction(): Bool;
/**
 * Returns true if project startup action was cleared successfully.
 */
@:native("NF_ClearProjectStartupAction")
public static function nfClearProjectStartupAction(): Bool;
/**
 * Returns true if project track selection action was cleared successfully.
 */
@:native("NF_ClearProjectTrackSelectionAction")
public static function nfClearProjectTrackSelectionAction(): Bool;
/**
 * Deletes a take from an item. takeIdx is zero-based. Returns true on success.
 */
@:native("NF_DeleteTakeFromItem")
public static function nfDeleteTakeFromItem(item: MediaItem, takeIdX: Int): Bool;
/**
 * Gets action description and command ID number (for native actions) or named
 * command IDs / identifier strings (for extension actions /ReaScripts) if
 * global startup action is set, otherwise empty string. Returns false on
 * failure.
 */
@:native("NF_GetGlobalStartupAction")
public static function nfGetGlobalStartupAction(): Bool;
/**
 * Returns the average overall (non-windowed) dB RMS level of active channels of
 * an audio item active take, post item gain, post take volume envelope,
 * post-fade, pre fader, pre item FX. 
 Returns -150.0 if MIDI take or empty
 * item.
 */
@:native("NF_GetMediaItemAverageRMS")
public static function nfGetMediaItemAverageRms(item: MediaItem): Float;
/**
 * Returns the greatest max. peak value in dBFS of all active channels of an
 * audio item active take, post item gain, post take volume envelope, post-fade,
 * pre fader, pre item FX. 
 Returns -150.0 if MIDI take or empty item.
 */
@:native("NF_GetMediaItemMaxPeak")
public static function nfGetMediaItemMaxPeak(item: MediaItem): Float;
/**
 * See NF_GetMediaItemMaxPeak, additionally returns maxPeakPos (relative to item
 * position).
 */
@:native("NF_GetMediaItemMaxPeakAndMaxPeakPos")
public static function nfGetMediaItemMaxPeakAndMaxPeakPos(item: MediaItem): Float;
/**
 * Returns the greatest overall (non-windowed) dB RMS peak level of all active
 * channels of an audio item active take, post item gain, post take volume
 * envelope, post-fade, pre fader, pre item FX. 
 Returns -150.0 if MIDI take or
 * empty item.
 */
@:native("NF_GetMediaItemPeakRMS_NonWindowed")
public static function nfGetMediaItemPeakRmsNonWindowed(item: MediaItem): Float;
/**
 * Returns the average dB RMS peak level of all active channels of an audio item
 * active take, post item gain, post take volume envelope, post-fade, pre fader,
 * pre item FX. 
 Obeys 'Window size for peak RMS' setting in 'SWS: Set RMS
 * analysis/normalize options' for calculation. Returns -150.0 if MIDI take or
 * empty item.
 */
@:native("NF_GetMediaItemPeakRMS_Windowed")
public static function nfGetMediaItemPeakRmsWindowed(item: MediaItem): Float;
/**
 * Gets action description and command ID number (for native actions) or named
 * command IDs / identifier strings (for extension actions /ReaScripts) if
 * project startup action is set, otherwise empty string. Returns false on
 * failure.
 */
@:native("NF_GetProjectStartupAction")
public static function nfGetProjectStartupAction(): Bool;
/**
 * Gets action description and command ID number (for native actions) or named
 * command IDs / identifier strings (for extension actions /ReaScripts) if
 * project track selection action is set, otherwise empty string. Returns false
 * on failure.
 */
@:native("NF_GetProjectTrackSelectionAction")
public static function nfGetProjectTrackSelectionAction(): Bool;
/**
 * Returns SWS/S&M marker/region subtitle. markerRegionIdx: Refers to index that
 * can be passed to EnumProjectMarkers (not displayed marker/region index).
 * Returns empty string if marker/region with specified index not found or
 * marker/region subtitle not set. Lua code example here.
 */
@:native("NF_GetSWSMarkerRegionSub")
public static function nfGetSwsMarkerRegionSub(markerRegionIdX: Int): String;
/** No description available */
@:native("NF_GetSWSTrackNotes")
public static function nfGetSwsTrackNotes(track: MediaTrack): String;
/**
 * Get SWS analysis/normalize options. See NF_SetSWS_RMSoptions.
 */
@:native("NF_GetSWS_RMSoptions")
public static function nfGetSwsRmSoptions(): Float;
/** No description available */
@:native("NF_GetThemeDefaultTCPHeights")
public static function nfGetThemeDefaultTcpHeights(): Int;
/**
 * Returns the bitrate of an audio file in kb/s if available (0 otherwise). For
 * supported filetypes see TagLib::AudioProperties::bitrate.
 */
@:native("NF_ReadAudioFileBitrate")
public static function nfReadAudioFileBitrate(fn: String): Int;
/**
 * 100 means scroll one page. Negative values scroll left.
 */
@:native("NF_ScrollHorizontallyByPercentage")
public static function nfScrollHorizontallyByPercentage(amount: Int): Void;
/**
 * Returns true if global startup action was set successfully (i.e. valid action
 * ID). Note: For SWS / S&M actions and macros / scripts, you must use
 * identifier strings (e.g. "_SWS_ABOUT", "_f506bc780a0ab34b8fdedb67ed5d3649"),
 * not command IDs (e.g. "47145").
Tip: to copy such identifiers, right-click
 * the action in the Actions window > Copy selected action cmdID / identifier
 * string.
NOnly works for actions / scripts from Main action section.
 */
@:native("NF_SetGlobalStartupAction")
public static function nfSetGlobalStartupAction(str: String): Bool;
/**
 * Returns true if project startup action was set successfully (i.e. valid
 * action ID). Note: For SWS / S&M actions and macros / scripts, you must use
 * identifier strings (e.g. "_SWS_ABOUT", "_f506bc780a0ab34b8fdedb67ed5d3649"),
 * not command IDs (e.g. "47145").
Tip: to copy such identifiers, right-click
 * the action in the Actions window > Copy selected action cmdID / identifier
 * string.
Only works for actions / scripts from Main action section. Project
 * must be saved after setting project startup action to be persistent.
 */
@:native("NF_SetProjectStartupAction")
public static function nfSetProjectStartupAction(str: String): Bool;
/**
 * Returns true if project track selection action was set successfully (i.e.
 * valid action ID). Note: For SWS / S&M actions and macros / scripts, you must
 * use identifier strings (e.g. "_SWS_ABOUT",
 * "_f506bc780a0ab34b8fdedb67ed5d3649"), not command IDs (e.g. "47145").
Tip: to
 * copy such identifiers, right-click the action in the Actions window > Copy
 * selected action cmdID / identifier string.
Only works for actions / scripts
 * from Main action section. Project must be saved after setting project track
 * selection action to be persistent.
 */
@:native("NF_SetProjectTrackSelectionAction")
public static function nfSetProjectTrackSelectionAction(str: String): Bool;
/**
 * Set SWS/S&M marker/region subtitle. markerRegionIdx: Refers to index that can
 * be passed to EnumProjectMarkers (not displayed marker/region index). Returns
 * true if subtitle is set successfully (i.e. marker/region with specified index
 * is present in project). Lua code example here.
 */
@:native("NF_SetSWSMarkerRegionSub")
public static function nfSetSwsMarkerRegionSub(markerRegionSub: String, markerRegionIdX: Int): Bool;
/** No description available */
@:native("NF_SetSWSTrackNotes")
public static function nfSetSwsTrackNotes(track: MediaTrack, str: String): Void;
/**
 * Set SWS analysis/normalize options (same as running action 'SWS: Set RMS
 * analysis/normalize options'). targetLevel: target RMS normalize level (dB),
 * windowSize: window size for peak RMS (sec.)
 */
@:native("NF_SetSWS_RMSoptions")
public static function nfSetSwsRmSoptions(targetLevel: Float, windowSize: Float): Bool;
/**
 * Deprecated, see TakeFX_GetNamedConfigParm/'fx_ident' (v6.37+). See
 * BR_TrackFX_GetFXModuleName. fx: counted consecutively across all takes
 * (zero-based).
 */
@:native("NF_TakeFX_GetFXModuleName")
public static function nfTakeFxGetFxModuleName(item: MediaItem, fX: Int): Bool;
/**
 * Redraw the Notes window (call if you've changed a subtitle via
 * NF_SetSWSMarkerRegionSub which is currently displayed in the Notes window and
 * you want to appear the new subtitle immediately.)
 */
@:native("NF_UpdateSWSMarkerRegionSubWindow")
public static function nfUpdateSwsMarkerRegionSubWindow(): Void;
/**
 * Equivalent to win32 API GetSystemMetrics(). Note: Only SM_C[XY]SCREEN,
 * SM_C[XY][HV]SCROLL and SM_CYMENU are currently supported on macOS and Linux
 * as of REAPER 6.68. Check the SWELL source code for up-to-date support
 * information (swell-wnd.mm, swell-wnd-generic.cpp).
 */
@:native("NF_Win32_GetSystemMetrics")
public static function nfWin32GetSystemMetrics(nIndeX: Int): Int;
/**
 * Show the about dialog of the given package entry.
The repository index is
 * downloaded asynchronously if the cached copy doesn't exist or is older than
 * one week.
 */
@:native("ReaPack_AboutInstalledPackage")
public static function reaPackAboutInstalledPackage(entrY: PackageEntry): Bool;
/**
 * Show the about dialog of the given repository. Returns true if the repository
 * exists in the user configuration.
The repository index is downloaded
 * asynchronously if the cached copy doesn't exist or is older than one week.
 */
@:native("ReaPack_AboutRepository")
public static function reaPackAboutRepository(repoName: String): Bool;
/**
 * Add or modify a repository. Set url to nullptr (or empty string in Lua) to
 * keep the existing URL. Call ReaPack_ProcessQueue(true) when done to process
 * the new list and update the GUI.
autoInstall: usually set to 2 (obey user
 * setting).
 */
@:native("ReaPack_AddSetRepository")
public static function reaPackAddSetRepository(name: String, url: String, enable: Bool, autoInstall: Int): Bool;
/**
 * Opens the package browser with the given filter string.
 */
@:native("ReaPack_BrowsePackages")
public static function reaPackBrowsePackages(filter: String): Void;
/**
 * Returns 0 if both versions are equal, a positive value if ver1 is higher than
 * ver2 and a negative value otherwise.
 */
@:native("ReaPack_CompareVersions")
public static function reaPackCompareVersions(ver1: String, ver2: String): Int;
/**
 * Enumerate the files owned by the given package. Returns false when there is
 * no more data.
sections: 0=not in action list, &1=main, &2=midi editor,
 * &4=midi inline editor
type: see ReaPack_GetEntryInfo.
 */
@:native("ReaPack_EnumOwnedFiles")
public static function reaPackEnumOwnedFiles(entrY: PackageEntry, indeX: Int): Bool;
/**
 * Free resources allocated for the given package entry.
 */
@:native("ReaPack_FreeEntry")
public static function reaPackFreeEntry(entrY: PackageEntry): Bool;
/**
 * Get the repository name, category, package name, package description, package
 * type, the currently installed version, author name, flags (&1=Pinned,
 * &2=BleedingEdge) and how many files are owned by the given package
 * entry.
type: 1=script, 2=extension, 3=effect, 4=data, 5=theme, 6=langpack,
 * 7=webinterface
 */
@:native("ReaPack_GetEntryInfo")
public static function reaPackGetEntryInfo(entrY: PackageEntry): Bool;
/**
 * Returns the package entry owning the given file.
Delete the returned object
 * from memory after use with ReaPack_FreeEntry.
 */
@:native("ReaPack_GetOwner")
public static function reaPackGetOwner(fn: String): PackageEntry;
/**
 * Get the infos of the given repository.
autoInstall: 0=manual, 1=when
 * sychronizing, 2=obey user setting
 */
@:native("ReaPack_GetRepositoryInfo")
public static function reaPackGetRepositoryInfo(name: String): Bool;
/**
 * Run pending operations and save the configuration file. If refreshUI is true
 * the browser and manager windows are guaranteed to be refreshed (otherwise it
 * depends on which operations are in the queue).
 */
@:native("ReaPack_ProcessQueue")
public static function reaPackProcessQueue(refresHUi: Bool): Void;
/**
 * [S&M] Deprecated, see CreateTrackSend (v5.15pre1+). Adds a receive. Returns
 * false if nothing updated.
type -1=Default type (user preferences),
 * 0=Post-Fader (Post-Pan), 1=Pre-FX, 2=deprecated, 3=Pre-Fader (Post-FX).
Note:
 * obeys default sends preferences, supports frozen tracks, etc..
 */
@:native("SNM_AddReceive")
public static function snmAddReceive(src: MediaTrack, dest: MediaTrack, tYpe: Int): Bool;
/**
 * [S&M] Add an FX parameter knob in the TCP. Returns false if nothing updated
 * (invalid parameters, knob already present, etc..)
 */
@:native("SNM_AddTCPFXParm")
public static function snmAddTcpfxParm(tr: MediaTrack, fXId: Int, prmId: Int): Bool;
/**
 * [S&M] Instantiates a new "fast string". You must delete this string, see
 * SNM_DeleteFastString.
 */
@:native("SNM_CreateFastString")
public static function snmCreateFastString(str: String): WdlFastString;
/**
 * [S&M] Deletes a "fast string" instance.
 */
@:native("SNM_DeleteFastString")
public static function snmDeleteFastString(str: WdlFastString): Void;
/**
 * [S&M] Returns a floating-point preference (look in project prefs first, then
 * in general prefs). Returns errvalue if failed (e.g. varname not found).
 */
@:native("SNM_GetDoubleConfigVar")
public static function snmGetDoubleConfigVar(varName: String, errvalue: Float): Float;
/**
 * [S&M] See SNM_GetDoubleConfigVar.
 */
@:native("SNM_GetDoubleConfigVarEx")
public static function snmGetDoubleConfigVarEx(proj: ReaProject, varName: String, errvalue: Float): Float;
/**
 * [S&M] Gets the "fast string" content.
 */
@:native("SNM_GetFastString")
public static function snmGetFastString(str: WdlFastString): String;
/**
 * [S&M] Gets the "fast string" length.
 */
@:native("SNM_GetFastStringLength")
public static function snmGetFastStringLength(str: WdlFastString): Int;
/**
 * [S&M] Returns an integer preference (look in project prefs first, then in
 * general prefs). Returns errvalue if failed (e.g. varname not found).
 */
@:native("SNM_GetIntConfigVar")
public static function snmGetIntConfigVar(varName: String, errvalue: Int): Int;
/**
 * [S&M] See SNM_GetIntConfigVar.
 */
@:native("SNM_GetIntConfigVarEx")
public static function snmGetIntConfigVarEx(proj: ReaProject, varName: String, errvalue: Int): Int;
/**
 * [S&M] Reads a 64-bit integer preference split in two 32-bit integers (look in
 * project prefs first, then in general prefs). Returns false if failed (e.g.
 * varname not found).
 */
@:native("SNM_GetLongConfigVar")
public static function snmGetLongConfigVar(varName: String): Bool;
/**
 * [S&M] See SNM_GetLongConfigVar.
 */
@:native("SNM_GetLongConfigVarEx")
public static function snmGetLongConfigVarEx(proj: ReaProject, varName: String): Bool;
/**
 * [S&M] Gets a take by GUID as string. The GUID must be enclosed in braces {}.
 * To get take GUID as string, see BR_GetMediaItemTakeGUID
 */
@:native("SNM_GetMediaItemTakeByGUID")
public static function snmGetMediaItemTakeByGuid(project: ReaProject, guId: String): MediaItemTake;
/**
 * [S&M] Gets a marker/region name. Returns true if marker/region found.
 */
@:native("SNM_GetProjectMarkerName")
public static function snmGetProjectMarkerName(proj: ReaProject, num: Int, isrgn: Bool, name: WdlFastString): Bool;
/**
 * [S&M] Gets or sets the state of a track, an item or an envelope. The state
 * chunk size is unlimited. Returns false if failed.
When getting a track state
 * (and when you are not interested in FX data), you can use
 * wantminimalstate=true to radically reduce the length of the state. Do not set
 * such minimal states back though, this is for read-only applications!
Note:
 * unlike the native GetSetObjectState, calling to FreeHeapPtr() is not
 * required.
 */
@:native("SNM_GetSetObjectState")
public static function snmGetSetObjectState(obj: Identifier, state: WdlFastString, setneWvalue: Bool, wantminimalState: Bool): Bool;
/**
 * [S&M] Gets or sets a take source state. Returns false if failed. Use
 * takeidx=-1 to get/alter the active take.
Note: this function does not use a
 * MediaItem_Take* param in order to manage empty takes (i.e. takes with
 * MediaItem_Take*==NULL), see SNM_GetSetSourceState2.
 */
@:native("SNM_GetSetSourceState")
public static function snmGetSetSourceState(item: MediaItem, takeIdX: Int, state: WdlFastString, setneWvalue: Bool): Bool;
/**
 * [S&M] Gets or sets a take source state. Returns false if failed.
Note: this
 * function cannot deal with empty takes, see SNM_GetSetSourceState.
 */
@:native("SNM_GetSetSourceState2")
public static function snmGetSetSourceState2(take: MediaItemTake, state: WdlFastString, setneWvalue: Bool): Bool;
/**
 * [S&M] Deprecated, see GetMediaSourceType. Gets the source type of a take.
 * Returns false if failed (e.g. take with empty source, etc..)
 */
@:native("SNM_GetSourceType")
public static function snmGetSourceType(take: MediaItemTake, tYpe: WdlFastString): Bool;
/**
 * [S&M] Deprecated, see TrackFX_{CopyToTrack,Delete} (v5.95+). Move or removes
 * a track FX. Returns true if tr has been updated.
fxId: fx index in chain or
 * -1 for the selected fx. what: 0 to remove, -1 to move fx up in chain, 1 to
 * move fx down in chain.
 */
@:native("SNM_MoveOrRemoveTrackFX")
public static function snmMoveOrRemoveTrackFx(tr: MediaTrack, fXId: Int, wHat: Int): Bool;
/**
 * [S&M] Reads a media file tag. Supported tags: "artist", "album", "genre",
 * "comment", "title", "track" (track number) or "year". Returns false if tag
 * was not found. See SNM_TagMediaFile.
 */
@:native("SNM_ReadMediaFileTag")
public static function snmReadMediaFileTag(fn: String, tag: String): Bool;
/**
 * [S&M] Deprecated, see RemoveTrackSend (v5.15pre1+). Removes a receive.
 * Returns false if nothing updated.
 */
@:native("SNM_RemoveReceive")
public static function snmRemoveReceive(tr: MediaTrack, rcvIdX: Int): Bool;
/**
 * [S&M] Removes all receives from srctr. Returns false if nothing updated.
 */
@:native("SNM_RemoveReceivesFrom")
public static function snmRemoveReceivesFrom(tr: MediaTrack, srctr: MediaTrack): Bool;
/**
 * [S&M] Select a bookmark of the Resources window. Returns the related bookmark
 * id (or -1 if failed).
 */
@:native("SNM_SelectResourceBookmark")
public static function snmSelectResourceBookmark(name: String): Int;
/**
 * [S&M] Sets a floating-point preference (look in project prefs first, then in
 * general prefs). Returns false if failed (e.g. varname not found or newvalue
 * out of range).
 */
@:native("SNM_SetDoubleConfigVar")
public static function snmSetDoubleConfigVar(varName: String, neWvalue: Float): Bool;
/**
 * [S&M] See SNM_SetDoubleConfigVar.
 */
@:native("SNM_SetDoubleConfigVarEx")
public static function snmSetDoubleConfigVarEx(proj: ReaProject, varName: String, neWvalue: Float): Bool;
/**
 * [S&M] Sets the "fast string" content. Returns str for facility.
 */
@:native("SNM_SetFastString")
public static function snmSetFastString(str: WdlFastString, neWstr: String): WdlFastString;
/**
 * [S&M] Sets an integer preference (look in project prefs first, then in
 * general prefs). Returns false if failed (e.g. varname not found or newvalue
 * out of range).
 */
@:native("SNM_SetIntConfigVar")
public static function snmSetIntConfigVar(varName: String, neWvalue: Int): Bool;
/**
 * [S&M] See SNM_SetIntConfigVar.
 */
@:native("SNM_SetIntConfigVarEx")
public static function snmSetIntConfigVarEx(proj: ReaProject, varName: String, neWvalue: Int): Bool;
/**
 * [S&M] Sets a 64-bit integer preference from two 32-bit integers (look in
 * project prefs first, then in general prefs). Returns false if failed (e.g.
 * varname not found).
 */
@:native("SNM_SetLongConfigVar")
public static function snmSetLongConfigVar(varName: String, neWHigHValue: Int, neWLoWValue: Int): Bool;
/**
 * [S&M] SNM_SetLongConfigVar.
 */
@:native("SNM_SetLongConfigVarEx")
public static function snmSetLongConfigVarEx(proj: ReaProject, varName: String, neWHigHValue: Int, neWLoWValue: Int): Bool;
/**
 * [S&M] Deprecated, see SetProjectMarker4 -- Same function as
 * SetProjectMarker3() except it can set empty names "".
 */
@:native("SNM_SetProjectMarker")
public static function snmSetProjectMarker(proj: ReaProject, num: Int, isrgn: Bool, pos: Float, rgnend: Float, name: String, color: Int): Bool;
/**
 * [S&M] Sets a string preference (general prefs only). Returns false if failed
 * (e.g. varname not found or value too long). See get_config_var_string.
 */
@:native("SNM_SetStringConfigVar")
public static function snmSetStringConfigVar(varName: String, neWvalue: String): Bool;
/**
 * [S&M] Tags a media file thanks to TagLib. Supported tags: "artist", "album",
 * "genre", "comment", "title", "track" (track number) or "year". Use an empty
 * tagval to clear a tag. When a file is opened in REAPER, turn it offline
 * before using this function. Returns false if nothing updated. See
 * SNM_ReadMediaFileTag.
 */
@:native("SNM_TagMediaFile")
public static function snmTagMediaFile(fn: String, tag: String, tagval: String): Bool;
/**
 * [S&M] Attach Resources slot actions to a given bookmark.
 */
@:native("SNM_TieResourceSlotActions")
public static function snmTieResourceSlotActions(bookmarkId: Int): Void;
/**
 * Focuses the active/open MIDI editor.
 */
@:native("SN_FocusMIDIEditor")
public static function snFocusMidiEditor(): Void;
/**
 * [ULT] Deprecated, see GetSetMediaItemInfo_String (v5.95+). Get item notes.
 */
@:native("ULT_GetMediaItemNote")
public static function ultGetMediaItemNote(item: MediaItem): String;
/**
 * [ULT] Deprecated, see GetSetMediaItemInfo_String (v5.95+). Set item notes.
 */
@:native("ULT_SetMediaItemNote")
public static function ultSetMediaItemNote(item: MediaItem, note: String): Void;
/**
 * Creates writer for 32 bit floating point WAV
 */
@:native("Xen_AudioWriter_Create")
public static function xenAudioWriterCreate(fileName: String, numcHans: Int, sampleRate: Int): AudioWriter;
/**
 * Destroys writer
 */
@:native("Xen_AudioWriter_Destroy")
public static function xenAudioWriterDestroy(writer: AudioWriter): Void;
/**
 * Write interleaved audio data to disk
 */
@:native("Xen_AudioWriter_Write")
public static function xenAudioWriterWrite(writer: AudioWriter, numframes: Int, data: Identifier, offSet: Int): Int;
/**
 * Get interleaved audio data from media source
 */
@:native("Xen_GetMediaSourceSamples")
public static function xenGetMediaSourceSamples(src: PcmSource, destbuf: Identifier, destbufoffSet: Int, numframes: Int, numcHans: Int, sampleRate: Float, sourcePosition: Float): Int;
/**
 * Start audio preview of a PCM_source. Returns id of a preview handle that can
 * be provided to Xen_StopSourcePreview.
If the given PCM_source does not belong
 * to an existing MediaItem/Take, it will be deleted by the preview system when
 * the preview is stopped.
 */
@:native("Xen_StartSourcePreview")
public static function xenStartSourcePreview(source: PcmSource, gain: Float, loop: Bool, ?outputcHanindeXIn: Int): Int;
/**
 * Stop audio preview. id -1 stops all.
View: 
[] [] [] [] []
 */
@:native("Xen_StopSourcePreview")
public static function xenStopSourcePreview(previeWId: Int): Int;
/**
 * Adds code to be executed when the script finishes or is ended by the user.
 * Typically used to clean up after the user terminates defer() or runloop()
 * code.
 */
@:native("atexit")
public static function atexit(_function: () -> Void): Void;
/**
 * Adds code to be called back by REAPER. Used to create persistent ReaScripts
 * that continue to run and respond to input, while the user does other tasks.
 * Identical to runloop().
Note that no undo point will be automatically created
 * when the script finishes, unless you create it explicitly.
 */
@:native("defer")
public static function defer(_function: () -> Void): Void;
/**
 * is_new_value,filename,sectionID,cmdID,mode,resolution,val,contextstr =
 * reaper.get_action_context()
Returns contextual information about the script,
 * typically MIDI/OSC input values.
val will be set to a relative or absolute
 * value depending on mode (=0: absolute mode, >0: relative
 * modes).
resolution=127 for 7-bit resolution, =16383 for 14-bit
 * resolution.
sectionID, and cmdID will be set to -1 if the script is not part
 * of the action list.
mode, resolution and val will be set to -1 if the script
 * was not triggered via MIDI/OSC.
contextstr may be empty or one of:(flags may
 * include V=virtkey, S=shift, A=alt/option, C=control/command, W=win/control)
 */
@:native("get_action_context")
public static function getActionContext(): Void;
/**
 * Causes gmem_read()/gmem_write() to read EEL2/JSFX/Video shared memory segment
 * named by parameter. Set to empty string to detach. 6.20+: returns previous
 * shared memory segment name.
 */
@:native("gmem_attach")
public static function gmemAttach(sHaredMemorYName: Dynamic): Void;
/**
 * Read (number) value from shared memory attached-to by gmem_attach(). index
 * can be [0..1<<25).
 */
@:native("gmem_read")
public static function gmemRead(indeX: Dynamic): Void;
/**
 * Write (number) value to shared memory attached-to by gmem_attach(). index can
 * be [0..1<<25).
 */
@:native("gmem_write")
public static function gmemWrite(indeX: Dynamic, value: Dynamic): Void;
/**
 * Adds code to be called back by REAPER. Used to create persistent ReaScripts
 * that continue to run and respond to input, while the user does other tasks.
 * Identical to defer().
Note that no undo point will be automatically created
 * when the script finishes, unless you create it explicitly.
 */
@:native("runloop")
public static function runloop(_function: () -> Void): Void;
/**
 * reaper.set_action_options(flag)
Sets action options for the script.
flag&1:
 * script will auto-terminate if re-launched while already running
flag&2: if
 * (flag&1) is set, script will re-launch after auto-terminating. otherwise,
 * re-launch is ignored.
flag&4: set script toggle state on
flag&8: set script
 * toggle state off
 */
@:native("set_action_options")
public static function setActionOptions(flag: Dynamic): Void;
}