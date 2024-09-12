---@diagnostic disable: missing-return

---@class AudioAccessor
---@class HWND
---@class IReaperControlSurface
---@class KbdSectionInfo
---@class MediaItem
---@class MediaItem_Take
---@class MediaTrack
---@class PCM_source
---@class ReaProject
---@class TrackEnvelope
---@class identifier
---@class joystick_device
---@class reaper.array
local _ = {}

---@diagnostic disable-next-line: lowercase-global
reaper = {
  --- ```
  --- MediaItem _ = reaper.AddMediaItemToTrack(MediaTrack tr)
  --- ```
  --- creates a new media item.
  ---@param tr MediaTrack
  ---@return MediaItem
  AddMediaItemToTrack = function(tr) end,

  --- ```
  --- integer _ = reaper.AddProjectMarker(ReaProject proj, boolean isrgn, number pos, number rgnend, string name, integer wantidx)
  --- ```
  --- Returns the index of the created marker/region, or -1 on failure. Supply wantidx>=0 if you want a particular index number, but you'll get a different index number a region and wantidx is already in use.
  ---@param proj ReaProject
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param name string
  ---@param wantidx integer
  ---@return integer
  AddProjectMarker = function(proj, isrgn, pos, rgnend, name, wantidx) end,

  --- ```
  --- integer _ = reaper.AddProjectMarker2(ReaProject proj, boolean isrgn, number pos, number rgnend, string name, integer wantidx, integer color)
  --- ```
  --- Returns the index of the created marker/region, or -1 on failure. Supply wantidx>=0 if you want a particular index number, but you'll get a different index number a region and wantidx is already in use. color should be 0 (default color), or ColorToNative(r,g,b)|0x1000000
  ---@param proj ReaProject
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param name string
  ---@param wantidx integer
  ---@param color integer
  ---@return integer
  AddProjectMarker2 = function(proj, isrgn, pos, rgnend, name, wantidx, color) end,

  --- ```
  --- integer _ = reaper.AddRemoveReaScript(boolean add, integer sectionID, string scriptfn, boolean commit)
  --- ```
  --- Add a ReaScript (return the new command ID, or 0 if failed) or remove a ReaScript (return >0 on success). Use commit==true when adding/removing a single script. When bulk adding/removing n scripts, you can optimize the n-1 first calls with commit==false and commit==true for the last call.
  ---@param add boolean
  ---@param sectionID integer
  ---@param scriptfn string
  ---@param commit boolean
  ---@return integer
  AddRemoveReaScript = function(add, sectionID, scriptfn, commit) end,

  --- ```
  --- MediaItem_Take _ = reaper.AddTakeToMediaItem(MediaItem item)
  --- ```
  --- creates a new take in an item
  ---@param item MediaItem
  ---@return MediaItem_Take
  AddTakeToMediaItem = function(item) end,

  --- ```
  --- boolean _ = reaper.AddTempoTimeSigMarker(ReaProject proj, number timepos, number bpm, integer timesig_num, integer timesig_denom, boolean lineartempochange)
  --- ```
  --- Deprecated. Use SetTempoTimeSigMarker with ptidx=-1.
  ---@param proj ReaProject
  ---@param timepos number
  ---@param bpm number
  ---@param timesig_num integer
  ---@param timesig_denom integer
  ---@param lineartempochange boolean
  ---@return boolean
  ---@deprecated
  AddTempoTimeSigMarker = function(proj, timepos, bpm, timesig_num, timesig_denom, lineartempochange) end,

  --- ```
  --- reaper.adjustZoom(number amt, integer forceset, boolean doupd, integer centermode)
  --- ```
  --- forceset=0,doupd=true,centermode=-1 for default
  ---@param amt number
  ---@param forceset integer
  ---@param doupd boolean
  ---@param centermode integer
  adjustZoom = function(amt, forceset, doupd, centermode) end,

  --- ```
  --- boolean _ = reaper.AnyTrackSolo(ReaProject proj)
  --- ```
  ---@param proj ReaProject
  ---@return boolean
  AnyTrackSolo = function(proj) end,

  --- ```
  --- boolean _ = reaper.APIExists(string function_name)
  --- ```
  --- Returns true if function_name exists in the REAPER API
  ---@param function_name string
  ---@return boolean
  APIExists = function(function_name) end,

  --- ```
  --- reaper.APITest()
  --- ```
  --- Displays a message window if the API was successfully called.
  APITest = function() end,

  --- ```
  --- boolean _ = reaper.ApplyNudge(ReaProject project, integer nudgeflag, integer nudgewhat, integer nudgeunits, number value, boolean reverse, integer copies)
  --- ```
  --- nudgeflag: &1=set to value (otherwise nudge by value), &2=snap
  ---
  --- nudgewhat: 0=position, 1=left trim, 2=left edge, 3=right edge, 4=contents, 5=duplicate, 6=edit cursor
  ---
  --- nudgeunit: 0=ms, 1=seconds, 2=grid, 3=256th notes, ..., 15=whole notes, 16=measures.beats (1.15 = 1 measure + 1.5 beats), 17=samples, 18=frames, 19=pixels, 20=item lengths, 21=item selections
  ---
  --- value: amount to nudge by, or value to set to
  ---
  --- reverse: in nudge mode, nudges left (otherwise ignored)
  ---
  --- copies: in nudge duplicate mode, number of copies (otherwise ignored)
  ---@param project ReaProject
  ---@param nudgeflag integer
  ---@param nudgewhat integer
  ---@param nudgeunits integer
  ---@param value number
  ---@param reverse boolean
  ---@param copies integer
  ---@return boolean
  ApplyNudge = function(project, nudgeflag, nudgewhat, nudgeunits, value, reverse, copies) end,

  --- ```
  --- reaper.ArmCommand(integer cmd, string sectionname)
  --- ```
  --- arms a command (or disarms if 0 passed) in section sectionname (empty string for main)
  ---@param cmd integer
  ---@param sectionname string
  ArmCommand = function(cmd, sectionname) end,

  --- ```
  --- reaper.Audio_Init()
  --- ```
  --- open all audio and MIDI devices, if not open
  Audio_Init = function() end,

  --- ```
  --- integer _ = reaper.Audio_IsPreBuffer()
  --- ```
  --- is in pre-buffer? threadsafe
  ---@return integer
  Audio_IsPreBuffer = function() end,

  --- ```
  --- integer _ = reaper.Audio_IsRunning()
  --- ```
  --- is audio running at all? threadsafe
  ---@return integer
  Audio_IsRunning = function() end,

  --- ```
  --- reaper.Audio_Quit()
  --- ```
  --- close all audio and MIDI devices, if open
  Audio_Quit = function() end,

  --- ```
  --- boolean _ = reaper.AudioAccessorStateChanged(AudioAccessor accessor)
  --- ```
  --- Returns true if the underlying samples (track or media item take) have changed, but does not update the audio accessor, so the user can selectively call AudioAccessorValidateState only when needed. See CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor, GetAudioAccessorEndTime, GetAudioAccessorSamples.
  ---@param accessor AudioAccessor
  ---@return boolean
  AudioAccessorStateChanged = function(accessor) end,

  --- ```
  --- reaper.AudioAccessorUpdate(AudioAccessor accessor)
  --- ```
  --- Force the accessor to reload its state from the underlying track or media item take. See CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime, GetAudioAccessorEndTime, GetAudioAccessorSamples.
  ---@param accessor AudioAccessor
  AudioAccessorUpdate = function(accessor) end,

  --- ```
  --- boolean _ = reaper.AudioAccessorValidateState(AudioAccessor accessor)
  --- ```
  --- Validates the current state of the audio accessor -- must ONLY call this from the main thread. Returns true if the state changed.
  ---@param accessor AudioAccessor
  ---@return boolean
  AudioAccessorValidateState = function(accessor) end,

  --- ```
  --- reaper.BypassFxAllTracks(integer bypass)
  --- ```
  --- -1 = bypass all if not all bypassed,otherwise unbypass all
  ---@param bypass integer
  BypassFxAllTracks = function(bypass) end,

  --- ```
  --- integer _ = reaper.CalcMediaSrcLoudness(PCM_source mediasource)
  --- ```
  --- Calculates loudness statistics of media via dry run render. Statistics will be displayed to the user; call GetSetProjectInfo_String("RENDER_STATS") to retrieve via API. Returns 1 if loudness was calculated successfully, -1 if user canceled the dry run render.
  ---@param mediasource PCM_source
  ---@return integer
  CalcMediaSrcLoudness = function(mediasource) end,

  --- ```
  --- number _ = reaper.CalculateNormalization(PCM_source source, integer normalizeTo, number normalizeTarget, number normalizeStart, number normalizeEnd)
  --- ```
  --- Calculate normalize adjustment for source media. normalizeTo: 0=LUFS-I, 1=RMS-I, 2=peak, 3=true peak, 4=LUFS-M max, 5=LUFS-S max. normalizeTarget: dBFS or LUFS value. normalizeStart, normalizeEnd: time bounds within source media for normalization calculation. If normalizationStart=0 and normalizationEnd=0, the full duration of the media will be used for the calculation.
  ---@param source PCM_source
  ---@param normalizeTo integer
  ---@param normalizeTarget number
  ---@param normalizeStart number
  ---@param normalizeEnd number
  ---@return number
  CalculateNormalization = function(source, normalizeTo, normalizeTarget, normalizeStart, normalizeEnd) end,

  --- ```
  --- reaper.ClearAllRecArmed()
  --- ```
  ClearAllRecArmed = function() end,

  --- ```
  --- reaper.ClearConsole()
  --- ```
  --- Clear the ReaScript console. See ShowConsoleMsg
  ClearConsole = function() end,

  --- ```
  --- reaper.ClearPeakCache()
  --- ```
  --- resets the global peak caches
  ClearPeakCache = function() end,

  --- ```
  --- integer r, integer g, integer b = reaper.ColorFromNative(integer col)
  --- ```
  --- Extract RGB values from an OS dependent color. See ColorToNative.
  ---@param col integer
  ---@return integer, integer, integer
  ColorFromNative = function(col) end,

  --- ```
  --- integer _ = reaper.ColorToNative(integer r, integer g, integer b)
  --- ```
  --- Make an OS dependent color from RGB values (e.g. RGB() macro on Windows). r,g and b are in [0..255]. See ColorFromNative.
  ---@param r integer
  ---@param g integer
  ---@param b integer
  ---@return integer
  ColorToNative = function(r, g, b) end,

  --- ```
  --- integer _ = reaper.CountActionShortcuts(KbdSectionInfo section, integer cmdID)
  --- ```
  --- Returns the number of shortcuts that exist for the given command ID.
  ---
  --- see GetActionShortcutDesc, DeleteActionShortcut, DoActionShortcutDialog.
  ---@param section KbdSectionInfo
  ---@param cmdID integer
  ---@return integer
  CountActionShortcuts = function(section, cmdID) end,

  --- ```
  --- integer _ = reaper.CountAutomationItems(TrackEnvelope env)
  --- ```
  --- Returns the number of automation items on this envelope. See GetSetAutomationItemInfo
  ---@param env TrackEnvelope
  ---@return integer
  CountAutomationItems = function(env) end,

  --- ```
  --- integer _ = reaper.CountEnvelopePoints(TrackEnvelope envelope)
  --- ```
  --- Returns the number of points in the envelope. See CountEnvelopePointsEx.
  ---@param envelope TrackEnvelope
  ---@return integer
  CountEnvelopePoints = function(envelope) end,

  --- ```
  --- integer _ = reaper.CountEnvelopePointsEx(TrackEnvelope envelope, integer autoitem_idx)
  --- ```
  --- Returns the number of points in the envelope.
  ---
  --- autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---
  --- For automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
  ---
  --- even if the automation item is trimmed so that not all points are visible.
  ---
  --- Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
  ---
  --- See GetEnvelopePointEx, SetEnvelopePointEx, InsertEnvelopePointEx, DeleteEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@return integer
  CountEnvelopePointsEx = function(envelope, autoitem_idx) end,

  --- ```
  --- integer _ = reaper.CountMediaItems(ReaProject proj)
  --- ```
  --- count the number of items in the project (proj=0 for active project)
  ---@param proj ReaProject
  ---@return integer
  CountMediaItems = function(proj) end,

  --- ```
  --- integer retval, integer num_markers, integer num_regions = reaper.CountProjectMarkers(ReaProject proj)
  --- ```
  --- num_markersOut and num_regionsOut may be NULL.
  ---@param proj ReaProject
  ---@return integer, integer, integer
  CountProjectMarkers = function(proj) end,

  --- ```
  --- integer _ = reaper.CountSelectedMediaItems(ReaProject proj)
  --- ```
  --- count the number of selected items in the project (proj=0 for active project)
  ---@param proj ReaProject
  ---@return integer
  CountSelectedMediaItems = function(proj) end,

  --- ```
  --- integer _ = reaper.CountSelectedTracks(ReaProject proj)
  --- ```
  --- Count the number of selected tracks in the project (proj=0 for active project). This function ignores the master track, see CountSelectedTracks2.
  ---@param proj ReaProject
  ---@return integer
  CountSelectedTracks = function(proj) end,

  --- ```
  --- integer _ = reaper.CountSelectedTracks2(ReaProject proj, boolean wantmaster)
  --- ```
  --- Count the number of selected tracks in the project (proj=0 for active project).
  ---@param proj ReaProject
  ---@param wantmaster boolean
  ---@return integer
  CountSelectedTracks2 = function(proj, wantmaster) end,

  --- ```
  --- integer _ = reaper.CountTakeEnvelopes(MediaItem_Take take)
  --- ```
  --- See GetTakeEnvelope
  ---@param take MediaItem_Take
  ---@return integer
  CountTakeEnvelopes = function(take) end,

  --- ```
  --- integer _ = reaper.CountTakes(MediaItem item)
  --- ```
  --- count the number of takes in the item
  ---@param item MediaItem
  ---@return integer
  CountTakes = function(item) end,

  --- ```
  --- integer _ = reaper.CountTCPFXParms(ReaProject project, MediaTrack track)
  --- ```
  --- Count the number of FX parameter knobs displayed on the track control panel.
  ---@param project ReaProject
  ---@param track MediaTrack
  ---@return integer
  CountTCPFXParms = function(project, track) end,

  --- ```
  --- integer _ = reaper.CountTempoTimeSigMarkers(ReaProject proj)
  --- ```
  --- Count the number of tempo/time signature markers in the project. See GetTempoTimeSigMarker, SetTempoTimeSigMarker, AddTempoTimeSigMarker.
  ---@param proj ReaProject
  ---@return integer
  CountTempoTimeSigMarkers = function(proj) end,

  --- ```
  --- integer _ = reaper.CountTrackEnvelopes(MediaTrack track)
  --- ```
  --- see GetTrackEnvelope
  ---@param track MediaTrack
  ---@return integer
  CountTrackEnvelopes = function(track) end,

  --- ```
  --- integer _ = reaper.CountTrackMediaItems(MediaTrack track)
  --- ```
  --- count the number of items in the track
  ---@param track MediaTrack
  ---@return integer
  CountTrackMediaItems = function(track) end,

  --- ```
  --- integer _ = reaper.CountTracks(ReaProject proj)
  --- ```
  --- count the number of tracks in the project (proj=0 for active project)
  ---@param proj ReaProject
  ---@return integer
  CountTracks = function(proj) end,

  --- ```
  --- MediaItem _ = reaper.CreateNewMIDIItemInProj(MediaTrack track, number starttime, number endtime, optional boolean qnIn)
  --- ```
  --- Create a new MIDI media item, containing no MIDI events. Time is in seconds unless qn is set.
  ---@param track MediaTrack
  ---@param starttime number
  ---@param endtime number
  ---@param qnIn? boolean
  ---@return MediaItem
  CreateNewMIDIItemInProj = function(track, starttime, endtime, qnIn) end,

  --- ```
  --- AudioAccessor _ = reaper.CreateTakeAudioAccessor(MediaItem_Take take)
  --- ```
  --- Create an audio accessor object for this take. Must only call from the main thread. See CreateTrackAudioAccessor, DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime, GetAudioAccessorEndTime, GetAudioAccessorSamples.
  ---@param take MediaItem_Take
  ---@return AudioAccessor
  CreateTakeAudioAccessor = function(take) end,

  --- ```
  --- AudioAccessor _ = reaper.CreateTrackAudioAccessor(MediaTrack track)
  --- ```
  --- Create an audio accessor object for this track. Must only call from the main thread. See CreateTakeAudioAccessor, DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime, GetAudioAccessorEndTime, GetAudioAccessorSamples.
  ---@param track MediaTrack
  ---@return AudioAccessor
  CreateTrackAudioAccessor = function(track) end,

  --- ```
  --- integer _ = reaper.CreateTrackSend(MediaTrack tr, MediaTrack desttrIn)
  --- ```
  --- Create a send/receive (desttrInOptional!=NULL), or a hardware output (desttrInOptional==NULL) with default properties, return >=0 on success (== new send/receive index). See RemoveTrackSend, GetSetTrackSendInfo, GetTrackSendInfo_Value, SetTrackSendInfo_Value.
  ---@param tr MediaTrack
  ---@param desttrIn MediaTrack
  ---@return integer
  CreateTrackSend = function(tr, desttrIn) end,

  --- ```
  --- reaper.CSurf_FlushUndo(boolean force)
  --- ```
  --- call this to force flushing of the undo states after using CSurf_On*Change()
  ---@param force boolean
  CSurf_FlushUndo = function(force) end,

  --- ```
  --- boolean _ = reaper.CSurf_GetTouchState(MediaTrack trackid, integer isPan)
  --- ```
  ---@param trackid MediaTrack
  ---@param isPan integer
  ---@return boolean
  CSurf_GetTouchState = function(trackid, isPan) end,

  --- ```
  --- reaper.CSurf_GoEnd()
  --- ```
  CSurf_GoEnd = function() end,

  --- ```
  --- reaper.CSurf_GoStart()
  --- ```
  CSurf_GoStart = function() end,

  --- ```
  --- integer _ = reaper.CSurf_NumTracks(boolean mcpView)
  --- ```
  ---@param mcpView boolean
  ---@return integer
  CSurf_NumTracks = function(mcpView) end,

  --- ```
  --- reaper.CSurf_OnArrow(integer whichdir, boolean wantzoom)
  --- ```
  ---@param whichdir integer
  ---@param wantzoom boolean
  CSurf_OnArrow = function(whichdir, wantzoom) end,

  --- ```
  --- reaper.CSurf_OnFwd(integer seekplay)
  --- ```
  ---@param seekplay integer
  CSurf_OnFwd = function(seekplay) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnFXChange(MediaTrack trackid, integer en)
  --- ```
  ---@param trackid MediaTrack
  ---@param en integer
  ---@return boolean
  CSurf_OnFXChange = function(trackid, en) end,

  --- ```
  --- integer _ = reaper.CSurf_OnInputMonitorChange(MediaTrack trackid, integer monitor)
  --- ```
  ---@param trackid MediaTrack
  ---@param monitor integer
  ---@return integer
  CSurf_OnInputMonitorChange = function(trackid, monitor) end,

  --- ```
  --- integer _ = reaper.CSurf_OnInputMonitorChangeEx(MediaTrack trackid, integer monitor, boolean allowgang)
  --- ```
  ---@param trackid MediaTrack
  ---@param monitor integer
  ---@param allowgang boolean
  ---@return integer
  CSurf_OnInputMonitorChangeEx = function(trackid, monitor, allowgang) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnMuteChange(MediaTrack trackid, integer mute)
  --- ```
  ---@param trackid MediaTrack
  ---@param mute integer
  ---@return boolean
  CSurf_OnMuteChange = function(trackid, mute) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnMuteChangeEx(MediaTrack trackid, integer mute, boolean allowgang)
  --- ```
  ---@param trackid MediaTrack
  ---@param mute integer
  ---@param allowgang boolean
  ---@return boolean
  CSurf_OnMuteChangeEx = function(trackid, mute, allowgang) end,

  --- ```
  --- number _ = reaper.CSurf_OnPanChange(MediaTrack trackid, number pan, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param pan number
  ---@param relative boolean
  ---@return number
  CSurf_OnPanChange = function(trackid, pan, relative) end,

  --- ```
  --- number _ = reaper.CSurf_OnPanChangeEx(MediaTrack trackid, number pan, boolean relative, boolean allowGang)
  --- ```
  ---@param trackid MediaTrack
  ---@param pan number
  ---@param relative boolean
  ---@param allowGang boolean
  ---@return number
  CSurf_OnPanChangeEx = function(trackid, pan, relative, allowGang) end,

  --- ```
  --- reaper.CSurf_OnPause()
  --- ```
  CSurf_OnPause = function() end,

  --- ```
  --- reaper.CSurf_OnPlay()
  --- ```
  CSurf_OnPlay = function() end,

  --- ```
  --- reaper.CSurf_OnPlayRateChange(number playrate)
  --- ```
  ---@param playrate number
  CSurf_OnPlayRateChange = function(playrate) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnRecArmChange(MediaTrack trackid, integer recarm)
  --- ```
  ---@param trackid MediaTrack
  ---@param recarm integer
  ---@return boolean
  CSurf_OnRecArmChange = function(trackid, recarm) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnRecArmChangeEx(MediaTrack trackid, integer recarm, boolean allowgang)
  --- ```
  ---@param trackid MediaTrack
  ---@param recarm integer
  ---@param allowgang boolean
  ---@return boolean
  CSurf_OnRecArmChangeEx = function(trackid, recarm, allowgang) end,

  --- ```
  --- reaper.CSurf_OnRecord()
  --- ```
  CSurf_OnRecord = function() end,

  --- ```
  --- number _ = reaper.CSurf_OnRecvPanChange(MediaTrack trackid, integer recv_index, number pan, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param recv_index integer
  ---@param pan number
  ---@param relative boolean
  ---@return number
  CSurf_OnRecvPanChange = function(trackid, recv_index, pan, relative) end,

  --- ```
  --- number _ = reaper.CSurf_OnRecvVolumeChange(MediaTrack trackid, integer recv_index, number volume, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param recv_index integer
  ---@param volume number
  ---@param relative boolean
  ---@return number
  CSurf_OnRecvVolumeChange = function(trackid, recv_index, volume, relative) end,

  --- ```
  --- reaper.CSurf_OnRew(integer seekplay)
  --- ```
  ---@param seekplay integer
  CSurf_OnRew = function(seekplay) end,

  --- ```
  --- reaper.CSurf_OnRewFwd(integer seekplay, integer dir)
  --- ```
  ---@param seekplay integer
  ---@param dir integer
  CSurf_OnRewFwd = function(seekplay, dir) end,

  --- ```
  --- reaper.CSurf_OnScroll(integer xdir, integer ydir)
  --- ```
  ---@param xdir integer
  ---@param ydir integer
  CSurf_OnScroll = function(xdir, ydir) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnSelectedChange(MediaTrack trackid, integer selected)
  --- ```
  ---@param trackid MediaTrack
  ---@param selected integer
  ---@return boolean
  CSurf_OnSelectedChange = function(trackid, selected) end,

  --- ```
  --- number _ = reaper.CSurf_OnSendPanChange(MediaTrack trackid, integer send_index, number pan, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param send_index integer
  ---@param pan number
  ---@param relative boolean
  ---@return number
  CSurf_OnSendPanChange = function(trackid, send_index, pan, relative) end,

  --- ```
  --- number _ = reaper.CSurf_OnSendVolumeChange(MediaTrack trackid, integer send_index, number volume, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param send_index integer
  ---@param volume number
  ---@param relative boolean
  ---@return number
  CSurf_OnSendVolumeChange = function(trackid, send_index, volume, relative) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnSoloChange(MediaTrack trackid, integer solo)
  --- ```
  ---@param trackid MediaTrack
  ---@param solo integer
  ---@return boolean
  CSurf_OnSoloChange = function(trackid, solo) end,

  --- ```
  --- boolean _ = reaper.CSurf_OnSoloChangeEx(MediaTrack trackid, integer solo, boolean allowgang)
  --- ```
  ---@param trackid MediaTrack
  ---@param solo integer
  ---@param allowgang boolean
  ---@return boolean
  CSurf_OnSoloChangeEx = function(trackid, solo, allowgang) end,

  --- ```
  --- reaper.CSurf_OnStop()
  --- ```
  CSurf_OnStop = function() end,

  --- ```
  --- reaper.CSurf_OnTempoChange(number bpm)
  --- ```
  ---@param bpm number
  CSurf_OnTempoChange = function(bpm) end,

  --- ```
  --- reaper.CSurf_OnTrackSelection(MediaTrack trackid)
  --- ```
  ---@param trackid MediaTrack
  CSurf_OnTrackSelection = function(trackid) end,

  --- ```
  --- number _ = reaper.CSurf_OnVolumeChange(MediaTrack trackid, number volume, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param volume number
  ---@param relative boolean
  ---@return number
  CSurf_OnVolumeChange = function(trackid, volume, relative) end,

  --- ```
  --- number _ = reaper.CSurf_OnVolumeChangeEx(MediaTrack trackid, number volume, boolean relative, boolean allowGang)
  --- ```
  ---@param trackid MediaTrack
  ---@param volume number
  ---@param relative boolean
  ---@param allowGang boolean
  ---@return number
  CSurf_OnVolumeChangeEx = function(trackid, volume, relative, allowGang) end,

  --- ```
  --- number _ = reaper.CSurf_OnWidthChange(MediaTrack trackid, number width, boolean relative)
  --- ```
  ---@param trackid MediaTrack
  ---@param width number
  ---@param relative boolean
  ---@return number
  CSurf_OnWidthChange = function(trackid, width, relative) end,

  --- ```
  --- number _ = reaper.CSurf_OnWidthChangeEx(MediaTrack trackid, number width, boolean relative, boolean allowGang)
  --- ```
  ---@param trackid MediaTrack
  ---@param width number
  ---@param relative boolean
  ---@param allowGang boolean
  ---@return number
  CSurf_OnWidthChangeEx = function(trackid, width, relative, allowGang) end,

  --- ```
  --- reaper.CSurf_OnZoom(integer xdir, integer ydir)
  --- ```
  ---@param xdir integer
  ---@param ydir integer
  CSurf_OnZoom = function(xdir, ydir) end,

  --- ```
  --- reaper.CSurf_ResetAllCachedVolPanStates()
  --- ```
  CSurf_ResetAllCachedVolPanStates = function() end,

  --- ```
  --- reaper.CSurf_ScrubAmt(number amt)
  --- ```
  ---@param amt number
  CSurf_ScrubAmt = function(amt) end,

  --- ```
  --- reaper.CSurf_SetAutoMode(integer mode, IReaperControlSurface ignoresurf)
  --- ```
  ---@param mode integer
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetAutoMode = function(mode, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetPlayState(boolean play, boolean pause, boolean rec, IReaperControlSurface ignoresurf)
  --- ```
  ---@param play boolean
  ---@param pause boolean
  ---@param rec boolean
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetPlayState = function(play, pause, rec, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetRepeatState(boolean rep, IReaperControlSurface ignoresurf)
  --- ```
  ---@param rep boolean
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetRepeatState = function(rep, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetSurfaceMute(MediaTrack trackid, boolean mute, IReaperControlSurface ignoresurf)
  --- ```
  ---@param trackid MediaTrack
  ---@param mute boolean
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetSurfaceMute = function(trackid, mute, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetSurfacePan(MediaTrack trackid, number pan, IReaperControlSurface ignoresurf)
  --- ```
  ---@param trackid MediaTrack
  ---@param pan number
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetSurfacePan = function(trackid, pan, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetSurfaceRecArm(MediaTrack trackid, boolean recarm, IReaperControlSurface ignoresurf)
  --- ```
  ---@param trackid MediaTrack
  ---@param recarm boolean
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetSurfaceRecArm = function(trackid, recarm, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetSurfaceSelected(MediaTrack trackid, boolean selected, IReaperControlSurface ignoresurf)
  --- ```
  ---@param trackid MediaTrack
  ---@param selected boolean
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetSurfaceSelected = function(trackid, selected, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetSurfaceSolo(MediaTrack trackid, boolean solo, IReaperControlSurface ignoresurf)
  --- ```
  ---@param trackid MediaTrack
  ---@param solo boolean
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetSurfaceSolo = function(trackid, solo, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetSurfaceVolume(MediaTrack trackid, number volume, IReaperControlSurface ignoresurf)
  --- ```
  ---@param trackid MediaTrack
  ---@param volume number
  ---@param ignoresurf IReaperControlSurface
  CSurf_SetSurfaceVolume = function(trackid, volume, ignoresurf) end,

  --- ```
  --- reaper.CSurf_SetTrackListChange()
  --- ```
  CSurf_SetTrackListChange = function() end,

  --- ```
  --- MediaTrack _ = reaper.CSurf_TrackFromID(integer idx, boolean mcpView)
  --- ```
  ---@param idx integer
  ---@param mcpView boolean
  ---@return MediaTrack
  CSurf_TrackFromID = function(idx, mcpView) end,

  --- ```
  --- integer _ = reaper.CSurf_TrackToID(MediaTrack track, boolean mcpView)
  --- ```
  ---@param track MediaTrack
  ---@param mcpView boolean
  ---@return integer
  CSurf_TrackToID = function(track, mcpView) end,

  --- ```
  --- number _ = reaper.DB2SLIDER(number x)
  --- ```
  ---@param x number
  ---@return number
  DB2SLIDER = function(x) end,

  --- ```
  --- boolean _ = reaper.DeleteActionShortcut(KbdSectionInfo section, integer cmdID, integer shortcutidx)
  --- ```
  --- Delete the specific shortcut for the given command ID.
  ---
  --- See CountActionShortcuts, GetActionShortcutDesc, DoActionShortcutDialog.
  ---@param section KbdSectionInfo
  ---@param cmdID integer
  ---@param shortcutidx integer
  ---@return boolean
  DeleteActionShortcut = function(section, cmdID, shortcutidx) end,

  --- ```
  --- boolean _ = reaper.DeleteEnvelopePointEx(TrackEnvelope envelope, integer autoitem_idx, integer ptidx)
  --- ```
  --- Delete an envelope point. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done.
  ---
  --- autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---
  --- For automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
  ---
  --- even if the automation item is trimmed so that not all points are visible.
  ---
  --- Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
  ---
  --- See CountEnvelopePointsEx, GetEnvelopePointEx, SetEnvelopePointEx, InsertEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@param ptidx integer
  ---@return boolean
  DeleteEnvelopePointEx = function(envelope, autoitem_idx, ptidx) end,

  --- ```
  --- boolean _ = reaper.DeleteEnvelopePointRange(TrackEnvelope envelope, number time_start, number time_end)
  --- ```
  --- Delete a range of envelope points. See DeleteEnvelopePointRangeEx, DeleteEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param time_start number
  ---@param time_end number
  ---@return boolean
  DeleteEnvelopePointRange = function(envelope, time_start, time_end) end,

  --- ```
  --- boolean _ = reaper.DeleteEnvelopePointRangeEx(TrackEnvelope envelope, integer autoitem_idx, number time_start, number time_end)
  --- ```
  --- Delete a range of envelope points. autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@param time_start number
  ---@param time_end number
  ---@return boolean
  DeleteEnvelopePointRangeEx = function(envelope, autoitem_idx, time_start, time_end) end,

  --- ```
  --- reaper.DeleteExtState(string section, string key, boolean persist)
  --- ```
  --- Delete the extended state value for a specific section and key. persist=true means the value should remain deleted the next time REAPER is opened. See SetExtState, GetExtState, HasExtState.
  ---@param section string
  ---@param key string
  ---@param persist boolean
  DeleteExtState = function(section, key, persist) end,

  --- ```
  --- boolean _ = reaper.DeleteProjectMarker(ReaProject proj, integer markrgnindexnumber, boolean isrgn)
  --- ```
  --- Delete a marker.  proj==NULL for the active project.
  ---@param proj ReaProject
  ---@param markrgnindexnumber integer
  ---@param isrgn boolean
  ---@return boolean
  DeleteProjectMarker = function(proj, markrgnindexnumber, isrgn) end,

  --- ```
  --- boolean _ = reaper.DeleteProjectMarkerByIndex(ReaProject proj, integer markrgnidx)
  --- ```
  --- Differs from DeleteProjectMarker only in that markrgnidx is 0 for the first marker/region, 1 for the next, etc (see EnumProjectMarkers3), rather than representing the displayed marker/region ID number (see SetProjectMarker4).
  ---@param proj ReaProject
  ---@param markrgnidx integer
  ---@return boolean
  DeleteProjectMarkerByIndex = function(proj, markrgnidx) end,

  --- ```
  --- boolean _ = reaper.DeleteTakeMarker(MediaItem_Take take, integer idx)
  --- ```
  --- Delete a take marker. Note that idx will change for all following take markers. See GetNumTakeMarkers, GetTakeMarker, SetTakeMarker
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@return boolean
  DeleteTakeMarker = function(take, idx) end,

  --- ```
  --- integer _ = reaper.DeleteTakeStretchMarkers(MediaItem_Take take, integer idx, optional integer countIn)
  --- ```
  --- Deletes one or more stretch markers. Returns number of stretch markers deleted.
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@param countIn? integer
  ---@return integer
  DeleteTakeStretchMarkers = function(take, idx, countIn) end,

  --- ```
  --- boolean _ = reaper.DeleteTempoTimeSigMarker(ReaProject project, integer markerindex)
  --- ```
  --- Delete a tempo/time signature marker.
  ---@param project ReaProject
  ---@param markerindex integer
  ---@return boolean
  DeleteTempoTimeSigMarker = function(project, markerindex) end,

  --- ```
  --- reaper.DeleteTrack(MediaTrack tr)
  --- ```
  --- deletes a track
  ---@param tr MediaTrack
  DeleteTrack = function(tr) end,

  --- ```
  --- boolean _ = reaper.DeleteTrackMediaItem(MediaTrack tr, MediaItem it)
  --- ```
  ---@param tr MediaTrack
  ---@param it MediaItem
  ---@return boolean
  DeleteTrackMediaItem = function(tr, it) end,

  --- ```
  --- reaper.DestroyAudioAccessor(AudioAccessor accessor)
  --- ```
  --- Destroy an audio accessor. Must only call from the main thread. See CreateTakeAudioAccessor, CreateTrackAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime, GetAudioAccessorEndTime, GetAudioAccessorSamples.
  ---@param accessor AudioAccessor
  DestroyAudioAccessor = function(accessor) end,

  --- ```
  --- boolean _ = reaper.DoActionShortcutDialog(HWND hwnd, KbdSectionInfo section, integer cmdID, integer shortcutidx)
  --- ```
  --- Open the action shortcut dialog to edit or add a shortcut for the given command ID. If (shortcutidx >= 0 && shortcutidx < CountActionShortcuts()), that specific shortcut will be replaced, otherwise a new shortcut will be added.
  ---
  --- See CountActionShortcuts, GetActionShortcutDesc, DeleteActionShortcut.
  ---@param hwnd HWND
  ---@param section KbdSectionInfo
  ---@param cmdID integer
  ---@param shortcutidx integer
  ---@return boolean
  DoActionShortcutDialog = function(hwnd, section, cmdID, shortcutidx) end,

  --- ```
  --- reaper.Dock_UpdateDockID(string ident_str, integer whichDock)
  --- ```
  --- updates preference for docker window ident_str to be in dock whichDock on next open
  ---@param ident_str string
  ---@param whichDock integer
  Dock_UpdateDockID = function(ident_str, whichDock) end,

  --- ```
  --- integer _ = reaper.DockGetPosition(integer whichDock)
  --- ```
  --- -1=not found, 0=bottom, 1=left, 2=top, 3=right, 4=floating
  ---@param whichDock integer
  ---@return integer
  DockGetPosition = function(whichDock) end,

  --- ```
  --- integer retval, boolean isFloatingDocker = reaper.DockIsChildOfDock(HWND hwnd)
  --- ```
  --- returns dock index that contains hwnd, or -1
  ---@param hwnd HWND
  ---@return integer, boolean
  DockIsChildOfDock = function(hwnd) end,

  --- ```
  --- reaper.DockWindowActivate(HWND hwnd)
  --- ```
  ---@param hwnd HWND
  DockWindowActivate = function(hwnd) end,

  --- ```
  --- reaper.DockWindowAdd(HWND hwnd, string name, integer pos, boolean allowShow)
  --- ```
  ---@param hwnd HWND
  ---@param name string
  ---@param pos integer
  ---@param allowShow boolean
  DockWindowAdd = function(hwnd, name, pos, allowShow) end,

  --- ```
  --- reaper.DockWindowAddEx(HWND hwnd, string name, string identstr, boolean allowShow)
  --- ```
  ---@param hwnd HWND
  ---@param name string
  ---@param identstr string
  ---@param allowShow boolean
  DockWindowAddEx = function(hwnd, name, identstr, allowShow) end,

  --- ```
  --- reaper.DockWindowRefresh()
  --- ```
  DockWindowRefresh = function() end,

  --- ```
  --- reaper.DockWindowRefreshForHWND(HWND hwnd)
  --- ```
  ---@param hwnd HWND
  DockWindowRefreshForHWND = function(hwnd) end,

  --- ```
  --- reaper.DockWindowRemove(HWND hwnd)
  --- ```
  ---@param hwnd HWND
  DockWindowRemove = function(hwnd) end,

  --- ```
  --- boolean _ = reaper.EditTempoTimeSigMarker(ReaProject project, integer markerindex)
  --- ```
  --- Open the tempo/time signature marker editor dialog.
  ---@param project ReaProject
  ---@param markerindex integer
  ---@return boolean
  EditTempoTimeSigMarker = function(project, markerindex) end,

  --- ```
  --- integer r_left, integer r_top, integer r_right, integer r_bot = reaper.EnsureNotCompletelyOffscreen(integer r_left, integer r_top, integer r_right, integer r_bot)
  --- ```
  --- call with a saved window rect for your window and it'll correct any positioning info.
  ---@param r_left integer
  ---@param r_top integer
  ---@param r_right integer
  ---@param r_bot integer
  ---@return integer, integer, integer, integer
  EnsureNotCompletelyOffscreen = function(r_left, r_top, r_right, r_bot) end,

  --- ```
  --- string _ = reaper.EnumerateFiles(string path, integer fileindex)
  --- ```
  --- List the files in the "path" directory. Returns NULL/nil when all files have been listed. Use fileindex = -1 to force re-read of directory (invalidate cache). See EnumerateSubdirectories
  ---@param path string
  ---@param fileindex integer
  ---@return string
  EnumerateFiles = function(path, fileindex) end,

  --- ```
  --- string _ = reaper.EnumerateSubdirectories(string path, integer subdirindex)
  --- ```
  --- List the subdirectories in the "path" directory. Use subdirindex = -1 to force re-read of directory (invalidate cache). Returns NULL/nil when all subdirectories have been listed. See EnumerateFiles
  ---@param path string
  ---@param subdirindex integer
  ---@return string
  EnumerateSubdirectories = function(path, subdirindex) end,

  --- ```
  --- boolean retval, string name, string ident = reaper.EnumInstalledFX(integer index)
  --- ```
  --- Enumerates installed FX. Returns true if successful, sets nameOut and identOut to name and ident of FX at index.
  ---@param index integer
  ---@return boolean, string, string
  EnumInstalledFX = function(index) end,

  --- ```
  --- boolean retval, string str = reaper.EnumPitchShiftModes(integer mode)
  --- ```
  --- Start querying modes at 0, returns FALSE when no more modes possible, sets strOut to NULL if a mode is currently unsupported
  ---@param mode integer
  ---@return boolean, string
  EnumPitchShiftModes = function(mode) end,

  --- ```
  --- string _ = reaper.EnumPitchShiftSubModes(integer mode, integer submode)
  --- ```
  --- Returns submode name, or NULL
  ---@param mode integer
  ---@param submode integer
  ---@return string
  EnumPitchShiftSubModes = function(mode, submode) end,

  --- ```
  --- integer retval, boolean isrgn, number pos, number rgnend, string name, integer markrgnindexnumber = reaper.EnumProjectMarkers(integer idx)
  --- ```
  ---@param idx integer
  ---@return integer, boolean, number, number, string, integer
  EnumProjectMarkers = function(idx) end,

  --- ```
  --- integer retval, boolean isrgn, number pos, number rgnend, string name, integer markrgnindexnumber = reaper.EnumProjectMarkers2(ReaProject proj, integer idx)
  --- ```
  ---@param proj ReaProject
  ---@param idx integer
  ---@return integer, boolean, number, number, string, integer
  EnumProjectMarkers2 = function(proj, idx) end,

  --- ```
  --- integer retval, boolean isrgn, number pos, number rgnend, string name, integer markrgnindexnumber, integer color = reaper.EnumProjectMarkers3(ReaProject proj, integer idx)
  --- ```
  ---@param proj ReaProject
  ---@param idx integer
  ---@return integer, boolean, number, number, string, integer, integer
  EnumProjectMarkers3 = function(proj, idx) end,

  --- ```
  --- ReaProject retval, optional string projfn = reaper.EnumProjects(integer idx)
  --- ```
  --- idx=-1 for current project,projfn can be NULL if not interested in filename. use idx 0x40000000 for currently rendering project, if any.
  ---@param idx integer
  ---@return ReaProject, string
  EnumProjects = function(idx) end,

  --- ```
  --- boolean retval, optional string key, optional string val = reaper.EnumProjExtState(ReaProject proj, string extname, integer idx)
  --- ```
  --- Enumerate the data stored with the project for a specific extname. Returns false when there is no more data. See SetProjExtState, GetProjExtState.
  ---@param proj ReaProject
  ---@param extname string
  ---@param idx integer
  ---@return boolean, string, string
  EnumProjExtState = function(proj, extname, idx) end,

  --- ```
  --- MediaTrack _ = reaper.EnumRegionRenderMatrix(ReaProject proj, integer regionindex, integer rendertrack)
  --- ```
  --- Enumerate which tracks will be rendered within this region when using the region render matrix. When called with rendertrack==0, the function returns the first track that will be rendered (which may be the master track); rendertrack==1 will return the next track rendered, and so on. The function returns NULL when there are no more tracks that will be rendered within this region.
  ---@param proj ReaProject
  ---@param regionindex integer
  ---@param rendertrack integer
  ---@return MediaTrack
  EnumRegionRenderMatrix = function(proj, regionindex, rendertrack) end,

  --- ```
  --- boolean retval, string programName = reaper.EnumTrackMIDIProgramNames(integer track, integer programNumber, string programName)
  --- ```
  --- returns false if there are no plugins on the track that support MIDI programs,or if all programs have been enumerated
  ---@param track integer
  ---@param programNumber integer
  ---@param programName string
  ---@return boolean, string
  EnumTrackMIDIProgramNames = function(track, programNumber, programName) end,

  --- ```
  --- boolean retval, string programName = reaper.EnumTrackMIDIProgramNamesEx(ReaProject proj, MediaTrack track, integer programNumber, string programName)
  --- ```
  --- returns false if there are no plugins on the track that support MIDI programs,or if all programs have been enumerated
  ---@param proj ReaProject
  ---@param track MediaTrack
  ---@param programNumber integer
  ---@param programName string
  ---@return boolean, string
  EnumTrackMIDIProgramNamesEx = function(proj, track, programNumber, programName) end,

  --- ```
  --- integer retval, number value, number dVdS, number ddVdS, number dddVdS = reaper.Envelope_Evaluate(TrackEnvelope envelope, number time, number samplerate, integer samplesRequested)
  --- ```
  --- Get the effective envelope value at a given time position. samplesRequested is how long the caller expects until the next call to Envelope_Evaluate (often, the buffer block size). The return value is how many samples beyond that time position that the returned values are valid. dVdS is the change in value per sample (first derivative), ddVdS is the second derivative, dddVdS is the third derivative. See GetEnvelopeScalingMode.
  ---@param envelope TrackEnvelope
  ---@param time number
  ---@param samplerate number
  ---@param samplesRequested integer
  ---@return integer, number, number, number, number
  Envelope_Evaluate = function(envelope, time, samplerate, samplesRequested) end,

  --- ```
  --- string buf = reaper.Envelope_FormatValue(TrackEnvelope env, number value)
  --- ```
  --- Formats the value of an envelope to a user-readable form
  ---@param env TrackEnvelope
  ---@param value number
  ---@return string
  Envelope_FormatValue = function(env, value) end,

  --- ```
  --- MediaItem_Take retval, integer index, integer index2 = reaper.Envelope_GetParentTake(TrackEnvelope env)
  --- ```
  --- If take envelope, gets the take from the envelope. If FX, indexOut set to FX index, index2Out set to parameter index, otherwise -1.
  ---@param env TrackEnvelope
  ---@return MediaItem_Take, integer, integer
  Envelope_GetParentTake = function(env) end,

  --- ```
  --- MediaTrack retval, integer index, integer index2 = reaper.Envelope_GetParentTrack(TrackEnvelope env)
  --- ```
  --- If track envelope, gets the track from the envelope. If FX, indexOut set to FX index, index2Out set to parameter index, otherwise -1.
  ---@param env TrackEnvelope
  ---@return MediaTrack, integer, integer
  Envelope_GetParentTrack = function(env) end,

  --- ```
  --- boolean _ = reaper.Envelope_SortPoints(TrackEnvelope envelope)
  --- ```
  --- Sort envelope points by time. See SetEnvelopePoint, InsertEnvelopePoint.
  ---@param envelope TrackEnvelope
  ---@return boolean
  Envelope_SortPoints = function(envelope) end,

  --- ```
  --- boolean _ = reaper.Envelope_SortPointsEx(TrackEnvelope envelope, integer autoitem_idx)
  --- ```
  --- Sort envelope points by time. autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc. See SetEnvelopePoint, InsertEnvelopePoint.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@return boolean
  Envelope_SortPointsEx = function(envelope, autoitem_idx) end,

  --- ```
  --- string _ = reaper.ExecProcess(string cmdline, integer timeoutmsec)
  --- ```
  --- Executes command line, returns NULL on total failure, otherwise the return value, a newline, and then the output of the command. If timeoutmsec is 0, command will be allowed to run indefinitely (recommended for large amounts of returned output). timeoutmsec is -1 for no wait/terminate, -2 for no wait and minimize
  ---@param cmdline string
  ---@param timeoutmsec integer
  ---@return string
  ExecProcess = function(cmdline, timeoutmsec) end,

  --- ```
  --- boolean _ = reaper.file_exists(string path)
  --- ```
  --- returns true if path points to a valid, readable file
  ---@param path string
  ---@return boolean
  file_exists = function(path) end,

  --- ```
  --- integer _ = reaper.FindTempoTimeSigMarker(ReaProject project, number time)
  --- ```
  --- Find the tempo/time signature marker that falls at or before this time position (the marker that is in effect as of this time position).
  ---@param project ReaProject
  ---@param time number
  ---@return integer
  FindTempoTimeSigMarker = function(project, time) end,

  --- ```
  --- string buf = reaper.format_timestr(number tpos, string buf)
  --- ```
  --- Format tpos (which is time in seconds) as hh:mm:ss.sss. See format_timestr_pos, format_timestr_len.
  ---@param tpos number
  ---@param buf string
  ---@return string
  format_timestr = function(tpos, buf) end,

  --- ```
  --- string buf = reaper.format_timestr_len(number tpos, string buf, number offset, integer modeoverride)
  --- ```
  --- time formatting mode overrides: -1=proj default.
  ---
  --- 0=time
  ---
  --- 1=measures.beats + time
  ---
  --- 2=measures.beats
  ---
  --- 3=seconds
  ---
  --- 4=samples
  ---
  --- 5=h:m:s:f
  ---
  --- offset is start of where the length will be calculated from
  ---@param tpos number
  ---@param buf string
  ---@param offset number
  ---@param modeoverride integer
  ---@return string
  format_timestr_len = function(tpos, buf, offset, modeoverride) end,

  --- ```
  --- string buf = reaper.format_timestr_pos(number tpos, string buf, integer modeoverride)
  --- ```
  --- time formatting mode overrides: -1=proj default.
  ---
  --- 0=time
  ---
  --- 1=measures.beats + time
  ---
  --- 2=measures.beats
  ---
  --- 3=seconds
  ---
  --- 4=samples
  ---
  --- 5=h:m:s:f
  ---@param tpos number
  ---@param buf string
  ---@param modeoverride integer
  ---@return string
  format_timestr_pos = function(tpos, buf, modeoverride) end,

  --- ```
  --- string gGUID = reaper.genGuid(string gGUID)
  --- ```
  ---@param gGUID string
  ---@return string
  genGuid = function(gGUID) end,

  --- ```
  --- boolean retval, string buf = reaper.get_config_var_string(string name)
  --- ```
  --- gets ini configuration variable value as string
  ---@param name string
  ---@return boolean, string
  get_config_var_string = function(name) end,

  --- ```
  --- string _ = reaper.get_ini_file()
  --- ```
  --- Get reaper.ini full filename.
  ---@return string
  get_ini_file = function() end,

  --- ```
  --- boolean retval, string desc = reaper.GetActionShortcutDesc(KbdSectionInfo section, integer cmdID, integer shortcutidx)
  --- ```
  --- Get the text description of a specific shortcut for the given command ID.
  ---
  --- See CountActionShortcuts,DeleteActionShortcut,DoActionShortcutDialog.
  ---@param section KbdSectionInfo
  ---@param cmdID integer
  ---@param shortcutidx integer
  ---@return boolean, string
  GetActionShortcutDesc = function(section, cmdID, shortcutidx) end,

  --- ```
  --- MediaItem_Take _ = reaper.GetActiveTake(MediaItem item)
  --- ```
  --- get the active take in this item
  ---@param item MediaItem
  ---@return MediaItem_Take
  GetActiveTake = function(item) end,

  --- ```
  --- integer _ = reaper.GetAllProjectPlayStates(ReaProject ignoreProject)
  --- ```
  --- returns the bitwise OR of all project play states (1=playing, 2=pause, 4=recording)
  ---@param ignoreProject ReaProject
  ---@return integer
  GetAllProjectPlayStates = function(ignoreProject) end,

  --- ```
  --- string _ = reaper.GetAppVersion()
  --- ```
  --- Returns app version which may include an OS/arch signifier, such as: "6.17" (windows 32-bit), "6.17/x64" (windows 64-bit), "6.17/OSX64" (macOS 64-bit Intel), "6.17/OSX" (macOS 32-bit), "6.17/macOS-arm64", "6.17/linux-x86_64", "6.17/linux-i686", "6.17/linux-aarch64", "6.17/linux-armv7l", etc
  ---@return string
  GetAppVersion = function() end,

  --- ```
  --- integer retval, string sec = reaper.GetArmedCommand()
  --- ```
  --- gets the currently armed command and section name (returns 0 if nothing armed). section name is empty-string for main section.
  ---@return integer, string
  GetArmedCommand = function() end,

  --- ```
  --- number _ = reaper.GetAudioAccessorEndTime(AudioAccessor accessor)
  --- ```
  --- Get the end time of the audio that can be returned from this accessor. See CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime, GetAudioAccessorSamples.
  ---@param accessor AudioAccessor
  ---@return number
  GetAudioAccessorEndTime = function(accessor) end,

  --- ```
  --- string hashNeed128 = reaper.GetAudioAccessorHash(AudioAccessor accessor, string hashNeed128)
  --- ```
  --- Deprecated. See AudioAccessorStateChanged instead.
  ---@param accessor AudioAccessor
  ---@param hashNeed128 string
  ---@return string
  ---@deprecated
  GetAudioAccessorHash = function(accessor, hashNeed128) end,

  --- ```
  --- integer _ = reaper.GetAudioAccessorSamples(AudioAccessor accessor, integer samplerate, integer numchannels, number starttime_sec, integer numsamplesperchannel, reaper.array samplebuffer)
  --- ```
  --- Get a block of samples from the audio accessor. Samples are extracted immediately pre-FX, and returned interleaved (first sample of first channel, first sample of second channel...). Returns 0 if no audio, 1 if audio, -1 on error. See CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorStartTime, GetAudioAccessorEndTime.
  ---
  ---
  ---
  --- This function has special handling in Python, and only returns two objects, the API function return value, and the sample buffer. Example usage:
  ---
  ---
  ---
  --- tr = RPR_GetTrack(0, 0)
  ---
  --- aa = RPR_CreateTrackAudioAccessor(tr)
  ---
  --- buf = list([0]*2*1024) # 2 channels, 1024 samples each, initialized to zero
  ---
  --- pos = 0.0
  ---
  --- (ret, buf) = GetAudioAccessorSamples(aa, 44100, 2, pos, 1024, buf)
  ---
  --- # buf now holds the first 2*1024 audio samples from the track.
  ---
  --- # typically GetAudioAccessorSamples() would be called within a loop, increasing pos each time.
  ---@param accessor AudioAccessor
  ---@param samplerate integer
  ---@param numchannels integer
  ---@param starttime_sec number
  ---@param numsamplesperchannel integer
  ---@param samplebuffer reaper.array
  ---@return integer
  GetAudioAccessorSamples = function(accessor, samplerate, numchannels, starttime_sec, numsamplesperchannel, samplebuffer) end,

  --- ```
  --- number _ = reaper.GetAudioAccessorStartTime(AudioAccessor accessor)
  --- ```
  --- Get the start time of the audio that can be returned from this accessor. See CreateTakeAudioAccessor, CreateTrackAudioAccessor, DestroyAudioAccessor, AudioAccessorStateChanged, GetAudioAccessorEndTime, GetAudioAccessorSamples.
  ---@param accessor AudioAccessor
  ---@return number
  GetAudioAccessorStartTime = function(accessor) end,

  --- ```
  --- boolean retval, string desc = reaper.GetAudioDeviceInfo(string attribute)
  --- ```
  --- get information about the currently open audio device. attribute can be MODE, IDENT_IN, IDENT_OUT, BSIZE, SRATE, BPS. returns false if unknown attribute or device not open.
  ---@param attribute string
  ---@return boolean, string
  GetAudioDeviceInfo = function(attribute) end,

  --- ```
  --- integer _ = reaper.GetConfigWantsDock(string ident_str)
  --- ```
  --- gets the dock ID desired by ident_str, if any
  ---@param ident_str string
  ---@return integer
  GetConfigWantsDock = function(ident_str) end,

  --- ```
  --- ReaProject _ = reaper.GetCurrentProjectInLoadSave()
  --- ```
  --- returns current project if in load/save (usually only used from project_config_extension_t)
  ---@return ReaProject
  GetCurrentProjectInLoadSave = function() end,

  --- ```
  --- integer _ = reaper.GetCursorContext()
  --- ```
  --- return the current cursor context: 0 if track panels, 1 if items, 2 if envelopes, otherwise unknown
  ---@return integer
  GetCursorContext = function() end,

  --- ```
  --- integer _ = reaper.GetCursorContext2(boolean want_last_valid)
  --- ```
  --- 0 if track panels, 1 if items, 2 if envelopes, otherwise unknown (unlikely when want_last_valid is true)
  ---@param want_last_valid boolean
  ---@return integer
  GetCursorContext2 = function(want_last_valid) end,

  --- ```
  --- number _ = reaper.GetCursorPosition()
  --- ```
  --- edit cursor position
  ---@return number
  GetCursorPosition = function() end,

  --- ```
  --- number _ = reaper.GetCursorPositionEx(ReaProject proj)
  --- ```
  --- edit cursor position
  ---@param proj ReaProject
  ---@return number
  GetCursorPositionEx = function(proj) end,

  --- ```
  --- integer _ = reaper.GetDisplayedMediaItemColor(MediaItem item)
  --- ```
  --- see GetDisplayedMediaItemColor2.
  ---@param item MediaItem
  ---@return integer
  GetDisplayedMediaItemColor = function(item) end,

  --- ```
  --- integer _ = reaper.GetDisplayedMediaItemColor2(MediaItem item, MediaItem_Take take)
  --- ```
  --- Returns the custom take, item, or track color that is used (according to the user preference) to color the media item. The returned color is OS dependent|0x01000000 (i.e. ColorToNative(r,g,b)|0x01000000), so a return of zero means "no color", not black.
  ---@param item MediaItem
  ---@param take MediaItem_Take
  ---@return integer
  GetDisplayedMediaItemColor2 = function(item, take) end,

  --- ```
  --- number _ = reaper.GetEnvelopeInfo_Value(TrackEnvelope env, string parmname)
  --- ```
  --- Gets an envelope numerical-value attribute:
  ---
  --- I_TCPY : int : Y offset of envelope relative to parent track (may be separate lane or overlap with track contents)
  ---
  --- I_TCPH : int : visible height of envelope
  ---
  --- I_TCPY_USED : int : Y offset of envelope relative to parent track, exclusive of padding
  ---
  --- I_TCPH_USED : int : visible height of envelope, exclusive of padding
  ---
  --- P_TRACK : MediaTrack * : parent track pointer (if any)
  ---
  --- P_DESTTRACK : MediaTrack * : destination track pointer, if on a send
  ---
  --- P_ITEM : MediaItem * : parent item pointer (if any)
  ---
  --- P_TAKE : MediaItem_Take * : parent take pointer (if any)
  ---
  --- I_SEND_IDX : int : 1-based index of send in P_TRACK, or 0 if not a send
  ---
  --- I_HWOUT_IDX : int : 1-based index of hardware output in P_TRACK or 0 if not a hardware output
  ---
  --- I_RECV_IDX : int : 1-based index of receive in P_DESTTRACK or 0 if not a send/receive
  ---@param env TrackEnvelope
  ---@param parmname string
  ---@return number
  GetEnvelopeInfo_Value = function(env, parmname) end,

  --- ```
  --- boolean retval, string buf = reaper.GetEnvelopeName(TrackEnvelope env)
  --- ```
  ---@param env TrackEnvelope
  ---@return boolean, string
  GetEnvelopeName = function(env) end,

  --- ```
  --- boolean retval, number time, number value, integer shape, number tension, boolean selected = reaper.GetEnvelopePoint(TrackEnvelope envelope, integer ptidx)
  --- ```
  --- Get the attributes of an envelope point. See GetEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param ptidx integer
  ---@return boolean, number, number, integer, number, boolean
  GetEnvelopePoint = function(envelope, ptidx) end,

  --- ```
  --- integer _ = reaper.GetEnvelopePointByTime(TrackEnvelope envelope, number time)
  --- ```
  --- Returns the envelope point at or immediately prior to the given time position. See GetEnvelopePointByTimeEx.
  ---@param envelope TrackEnvelope
  ---@param time number
  ---@return integer
  GetEnvelopePointByTime = function(envelope, time) end,

  --- ```
  --- integer _ = reaper.GetEnvelopePointByTimeEx(TrackEnvelope envelope, integer autoitem_idx, number time)
  --- ```
  --- Returns the envelope point at or immediately prior to the given time position.
  ---
  --- autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---
  --- For automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
  ---
  --- even if the automation item is trimmed so that not all points are visible.
  ---
  --- Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
  ---
  --- See GetEnvelopePointEx, SetEnvelopePointEx, InsertEnvelopePointEx, DeleteEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@param time number
  ---@return integer
  GetEnvelopePointByTimeEx = function(envelope, autoitem_idx, time) end,

  --- ```
  --- boolean retval, number time, number value, integer shape, number tension, boolean selected = reaper.GetEnvelopePointEx(TrackEnvelope envelope, integer autoitem_idx, integer ptidx)
  --- ```
  --- Get the attributes of an envelope point.
  ---
  --- autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---
  --- For automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
  ---
  --- even if the automation item is trimmed so that not all points are visible.
  ---
  --- Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
  ---
  --- See CountEnvelopePointsEx, SetEnvelopePointEx, InsertEnvelopePointEx, DeleteEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@param ptidx integer
  ---@return boolean, number, number, integer, number, boolean
  GetEnvelopePointEx = function(envelope, autoitem_idx, ptidx) end,

  --- ```
  --- integer _ = reaper.GetEnvelopeScalingMode(TrackEnvelope env)
  --- ```
  --- Returns the envelope scaling mode: 0=no scaling, 1=fader scaling. All API functions deal with raw envelope point values, to convert raw from/to scaled values see ScaleFromEnvelopeMode, ScaleToEnvelopeMode.
  ---@param env TrackEnvelope
  ---@return integer
  GetEnvelopeScalingMode = function(env) end,

  --- ```
  --- boolean retval, string str = reaper.GetEnvelopeStateChunk(TrackEnvelope env, string str, boolean isundo)
  --- ```
  --- Gets the RPPXML state of an envelope, returns true if successful. Undo flag is a performance/caching hint.
  ---@param env TrackEnvelope
  ---@param str string
  ---@param isundo boolean
  ---@return boolean, string
  GetEnvelopeStateChunk = function(env, str, isundo) end,

  --- ```
  --- integer _ = reaper.GetEnvelopeUIState(TrackEnvelope env)
  --- ```
  --- gets information on the UI state of an envelope: returns &1 if automation/modulation is playing back, &2 if automation is being actively written, &4 if the envelope recently had an effective automation mode change
  ---@param env TrackEnvelope
  ---@return integer
  GetEnvelopeUIState = function(env) end,

  --- ```
  --- string _ = reaper.GetExePath()
  --- ```
  --- returns path of REAPER.exe (not including EXE), i.e. C:\Program Files\REAPER
  ---@return string
  GetExePath = function() end,

  --- ```
  --- string _ = reaper.GetExtState(string section, string key)
  --- ```
  --- Get the extended state value for a specific section and key. See SetExtState, DeleteExtState, HasExtState.
  ---@param section string
  ---@param key string
  ---@return string
  GetExtState = function(section, key) end,

  --- ```
  --- integer retval, integer tracknumber, integer itemnumber, integer fxnumber = reaper.GetFocusedFX()
  --- ```
  --- This function is deprecated (returns GetFocusedFX2()&3), see GetTouchedOrFocusedFX.
  ---@return integer, integer, integer, integer
  ---@deprecated
  GetFocusedFX = function() end,

  --- ```
  --- integer retval, integer tracknumber, integer itemnumber, integer fxnumber = reaper.GetFocusedFX2()
  --- ```
  --- Return value has 1 set if track FX, 2 if take/item FX, 4 set if FX is no longer focused but still open. tracknumber==0 means the master track, 1 means track 1, etc. itemnumber is zero-based (or -1 if not an item). For interpretation of fxnumber, see GetLastTouchedFX. Deprecated, see GetTouchedOrFocusedFX
  ---@return integer, integer, integer, integer
  ---@deprecated
  GetFocusedFX2 = function() end,

  --- ```
  --- integer _ = reaper.GetFreeDiskSpaceForRecordPath(ReaProject proj, integer pathidx)
  --- ```
  --- returns free disk space in megabytes, pathIdx 0 for normal, 1 for alternate.
  ---@param proj ReaProject
  ---@param pathidx integer
  ---@return integer
  GetFreeDiskSpaceForRecordPath = function(proj, pathidx) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetFXEnvelope(MediaTrack track, integer fxindex, integer parameterindex, boolean create)
  --- ```
  --- Returns the FX parameter envelope. If the envelope does not exist and create=true, the envelope will be created. If the envelope already exists and is bypassed and create=true, then the envelope will be unbypassed.
  ---@param track MediaTrack
  ---@param fxindex integer
  ---@param parameterindex integer
  ---@param create boolean
  ---@return TrackEnvelope
  GetFXEnvelope = function(track, fxindex, parameterindex, create) end,

  --- ```
  --- integer _ = reaper.GetGlobalAutomationOverride()
  --- ```
  --- return -1=no override, 0=trim/read, 1=read, 2=touch, 3=write, 4=latch, 5=bypass
  ---@return integer
  GetGlobalAutomationOverride = function() end,

  --- ```
  --- number _ = reaper.GetHZoomLevel()
  --- ```
  --- returns pixels/second
  ---@return number
  GetHZoomLevel = function() end,

  --- ```
  --- number _ = reaper.GetInputActivityLevel(integer input_id)
  --- ```
  --- returns approximate input level if available, 0-511 mono inputs, |1024 for stereo pairs, 4096+devidx*32 for MIDI devices
  ---@param input_id integer
  ---@return number
  GetInputActivityLevel = function(input_id) end,

  --- ```
  --- string _ = reaper.GetInputChannelName(integer channelIndex)
  --- ```
  ---@param channelIndex integer
  ---@return string
  GetInputChannelName = function(channelIndex) end,

  --- ```
  --- integer inputlatency, integer outputLatency = reaper.GetInputOutputLatency()
  --- ```
  --- Gets the audio device input/output latency in samples
  ---@return integer, integer
  GetInputOutputLatency = function() end,

  --- ```
  --- number num, PCM_source which_item, integer flags = reaper.GetItemEditingTime2()
  --- ```
  --- returns time of relevant edit, set which_item to the pcm_source (if applicable), flags (if specified) will be set to 1 for edge resizing, 2 for fade change, 4 for item move, 8 for item slip edit (edit cursor time or start of item)
  ---@return number, PCM_source, integer
  GetItemEditingTime2 = function() end,

  --- ```
  --- MediaItem med, MediaItem_Take take = reaper.GetItemFromPoint(integer screen_x, integer screen_y, boolean allow_locked)
  --- ```
  --- Returns the first item at the screen coordinates specified. If allow_locked is false, locked items are ignored. If takeOutOptional specified, returns the take hit. See GetThingFromPoint.
  ---@param screen_x integer
  ---@param screen_y integer
  ---@param allow_locked boolean
  ---@return MediaItem, MediaItem_Take
  GetItemFromPoint = function(screen_x, screen_y, allow_locked) end,

  --- ```
  --- ReaProject _ = reaper.GetItemProjectContext(MediaItem item)
  --- ```
  ---@param item MediaItem
  ---@return ReaProject
  GetItemProjectContext = function(item) end,

  --- ```
  --- boolean retval, string str = reaper.GetItemStateChunk(MediaItem item, string str, boolean isundo)
  --- ```
  --- Gets the RPPXML state of an item, returns true if successful. Undo flag is a performance/caching hint.
  ---@param item MediaItem
  ---@param str string
  ---@param isundo boolean
  ---@return boolean, string
  GetItemStateChunk = function(item, str, isundo) end,

  --- ```
  --- string _ = reaper.GetLastColorThemeFile()
  --- ```
  ---@return string
  GetLastColorThemeFile = function() end,

  --- ```
  --- integer markeridx, integer regionidx = reaper.GetLastMarkerAndCurRegion(ReaProject proj, number time)
  --- ```
  --- Get the last project marker before time, and/or the project region that includes time. markeridx and regionidx are returned not necessarily as the displayed marker/region index, but as the index that can be passed to EnumProjectMarkers. Either or both of markeridx and regionidx may be NULL. See EnumProjectMarkers.
  ---@param proj ReaProject
  ---@param time number
  ---@return integer, integer
  GetLastMarkerAndCurRegion = function(proj, time) end,

  --- ```
  --- boolean retval, integer tracknumber, integer fxnumber, integer paramnumber = reaper.GetLastTouchedFX()
  --- ```
  --- Returns true if the last touched FX parameter is valid, false otherwise. The low word of tracknumber is the 1-based track index -- 0 means the master track, 1 means track 1, etc. If the high word of tracknumber is nonzero, it refers to the 1-based item index (1 is the first item on the track, etc). For track FX, the low 24 bits of fxnumber refer to the FX index in the chain, and if the next 8 bits are 01, then the FX is record FX. For item FX, the low word defines the FX index in the chain, and the high word defines the take number. Deprecated, see GetTouchedOrFocusedFX.
  ---@return boolean, integer, integer, integer
  ---@deprecated
  GetLastTouchedFX = function() end,

  --- ```
  --- MediaTrack _ = reaper.GetLastTouchedTrack()
  --- ```
  ---@return MediaTrack
  GetLastTouchedTrack = function() end,

  --- ```
  --- HWND _ = reaper.GetMainHwnd()
  --- ```
  ---@return HWND
  GetMainHwnd = function() end,

  --- ```
  --- integer _ = reaper.GetMasterMuteSoloFlags()
  --- ```
  --- &1=master mute,&2=master solo. This is deprecated as you can just query the master track as well.
  ---@return integer
  ---@deprecated
  GetMasterMuteSoloFlags = function() end,

  --- ```
  --- MediaTrack _ = reaper.GetMasterTrack(ReaProject proj)
  --- ```
  ---@param proj ReaProject
  ---@return MediaTrack
  GetMasterTrack = function(proj) end,

  --- ```
  --- integer _ = reaper.GetMasterTrackVisibility()
  --- ```
  --- returns &1 if the master track is visible in the TCP, &2 if NOT visible in the mixer. See SetMasterTrackVisibility.
  ---@return integer
  GetMasterTrackVisibility = function() end,

  --- ```
  --- integer _ = reaper.GetMaxMidiInputs()
  --- ```
  --- returns max dev for midi inputs/outputs
  ---@return integer
  GetMaxMidiInputs = function() end,

  --- ```
  --- integer _ = reaper.GetMaxMidiOutputs()
  --- ```
  ---@return integer
  GetMaxMidiOutputs = function() end,

  --- ```
  --- integer retval, string buf = reaper.GetMediaFileMetadata(PCM_source mediaSource, string identifier)
  --- ```
  --- Get text-based metadata from a media file for a given identifier. Call with identifier="" to list all identifiers contained in the file, separated by newlines. May return "[Binary data]" for metadata that REAPER doesn't handle.
  ---@param mediaSource PCM_source
  ---@param identifier string
  ---@return integer, string
  GetMediaFileMetadata = function(mediaSource, identifier) end,

  --- ```
  --- MediaItem _ = reaper.GetMediaItem(ReaProject proj, integer itemidx)
  --- ```
  --- get an item from a project by item count (zero-based) (proj=0 for active project)
  ---@param proj ReaProject
  ---@param itemidx integer
  ---@return MediaItem
  GetMediaItem = function(proj, itemidx) end,

  --- ```
  --- MediaTrack _ = reaper.GetMediaItem_Track(MediaItem item)
  --- ```
  --- Get parent track of media item
  ---@param item MediaItem
  ---@return MediaTrack
  GetMediaItem_Track = function(item) end,

  --- ```
  --- number _ = reaper.GetMediaItemInfo_Value(MediaItem item, string parmname)
  --- ```
  --- Get media item numerical-value attributes.
  ---
  --- B_MUTE : bool * : muted (item solo overrides). setting this value will clear C_MUTE_SOLO.
  ---
  --- B_MUTE_ACTUAL : bool * : muted (ignores solo). setting this value will not affect C_MUTE_SOLO.
  ---
  --- C_LANEPLAYS : char * : in fixed lane tracks, 0=this item lane does not play, 1=this item lane plays exclusively, 2=this item lane plays and other lanes also play, -1=this item is on a non-visible, non-playing lane on a non-fixed-lane track (read-only)
  ---
  --- C_MUTE_SOLO : char * : solo override (-1=soloed, 0=no override, 1=unsoloed). note that this API does not automatically unsolo other items when soloing (nor clear the unsolos when clearing the last soloed item), it must be done by the caller via action or via this API.
  ---
  --- B_LOOPSRC : bool * : loop source
  ---
  --- B_ALLTAKESPLAY : bool * : all takes play
  ---
  --- B_UISEL : bool * : selected in arrange view
  ---
  --- C_BEATATTACHMODE : char * : item timebase, -1=track or project default, 1=beats (position, length, rate), 2=beats (position only). for auto-stretch timebase: C_BEATATTACHMODE=1, C_AUTOSTRETCH=1
  ---
  --- C_AUTOSTRETCH: : char * : auto-stretch at project tempo changes, 1=enabled, requires C_BEATATTACHMODE=1
  ---
  --- C_LOCK : char * : locked, &1=locked
  ---
  --- D_VOL : double * : item volume,  0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
  ---
  --- D_POSITION : double * : item position in seconds
  ---
  --- D_LENGTH : double * : item length in seconds
  ---
  --- D_SNAPOFFSET : double * : item snap offset in seconds
  ---
  --- D_FADEINLEN : double * : item manual fadein length in seconds
  ---
  --- D_FADEOUTLEN : double * : item manual fadeout length in seconds
  ---
  --- D_FADEINDIR : double * : item fadein curvature, -1..1
  ---
  --- D_FADEOUTDIR : double * : item fadeout curvature, -1..1
  ---
  --- D_FADEINLEN_AUTO : double * : item auto-fadein length in seconds, -1=no auto-fadein
  ---
  --- D_FADEOUTLEN_AUTO : double * : item auto-fadeout length in seconds, -1=no auto-fadeout
  ---
  --- C_FADEINSHAPE : int * : fadein shape, 0..6, 0=linear
  ---
  --- C_FADEOUTSHAPE : int * : fadeout shape, 0..6, 0=linear
  ---
  --- I_GROUPID : int * : group ID, 0=no group
  ---
  --- I_LASTY : int * : Y-position (relative to top of track) in pixels (read-only)
  ---
  --- I_LASTH : int * : height in pixels (read-only)
  ---
  --- I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will not be used, but will store the color
  ---
  --- I_CURTAKE : int * : active take number
  ---
  --- IP_ITEMNUMBER : int : item number on this track (read-only, returns the item number directly)
  ---
  --- F_FREEMODE_Y : float * : free item positioning or fixed lane Y-position. 0=top of track, 1.0=bottom of track
  ---
  --- F_FREEMODE_H : float * : free item positioning or fixed lane height. 0.5=half the track height, 1.0=full track height
  ---
  --- I_FIXEDLANE : int * : fixed lane of item (fine to call with setNewValue, but returned value is read-only)
  ---
  --- B_FIXEDLANE_HIDDEN : bool * : true if displaying only one fixed lane and this item is in a different lane (read-only)
  ---
  --- P_TRACK : MediaTrack * : (read-only)
  ---@param item MediaItem
  ---@param parmname string
  ---@return number
  GetMediaItemInfo_Value = function(item, parmname) end,

  --- ```
  --- integer _ = reaper.GetMediaItemNumTakes(MediaItem item)
  --- ```
  ---@param item MediaItem
  ---@return integer
  GetMediaItemNumTakes = function(item) end,

  --- ```
  --- MediaItem_Take _ = reaper.GetMediaItemTake(MediaItem item, integer tk)
  --- ```
  ---@param item MediaItem
  ---@param tk integer
  ---@return MediaItem_Take
  GetMediaItemTake = function(item, tk) end,

  --- ```
  --- MediaItem _ = reaper.GetMediaItemTake_Item(MediaItem_Take take)
  --- ```
  --- Get parent item of media item take
  ---@param take MediaItem_Take
  ---@return MediaItem
  GetMediaItemTake_Item = function(take) end,

  --- ```
  --- integer _ = reaper.GetMediaItemTake_Peaks(MediaItem_Take take, number peakrate, number starttime, integer numchannels, integer numsamplesperchannel, integer want_extra_type, reaper.array buf)
  --- ```
  --- Gets block of peak samples to buf. Note that the peak samples are interleaved, but in two or three blocks (maximums, then minimums, then extra). Return value has 20 bits of returned sample count, then 4 bits of output_mode (0xf00000), then a bit to signify whether extra_type was available (0x1000000). extra_type can be 115 ('s') for spectral information, which will return peak samples as integers with the low 15 bits frequency, next 14 bits tonality.
  ---@param take MediaItem_Take
  ---@param peakrate number
  ---@param starttime number
  ---@param numchannels integer
  ---@param numsamplesperchannel integer
  ---@param want_extra_type integer
  ---@param buf reaper.array
  ---@return integer
  GetMediaItemTake_Peaks = function(take, peakrate, starttime, numchannels, numsamplesperchannel, want_extra_type, buf) end,

  --- ```
  --- PCM_source _ = reaper.GetMediaItemTake_Source(MediaItem_Take take)
  --- ```
  --- Get media source of media item take
  ---@param take MediaItem_Take
  ---@return PCM_source
  GetMediaItemTake_Source = function(take) end,

  --- ```
  --- MediaTrack _ = reaper.GetMediaItemTake_Track(MediaItem_Take take)
  --- ```
  --- Get parent track of media item take
  ---@param take MediaItem_Take
  ---@return MediaTrack
  GetMediaItemTake_Track = function(take) end,

  --- ```
  --- MediaItem_Take _ = reaper.GetMediaItemTakeByGUID(ReaProject project, string guidGUID)
  --- ```
  ---@param project ReaProject
  ---@param guidGUID string
  ---@return MediaItem_Take
  GetMediaItemTakeByGUID = function(project, guidGUID) end,

  --- ```
  --- number _ = reaper.GetMediaItemTakeInfo_Value(MediaItem_Take take, string parmname)
  --- ```
  --- Get media item take numerical-value attributes.
  ---
  --- D_STARTOFFS : double * : start offset in source media, in seconds
  ---
  --- D_VOL : double * : take volume, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc, negative if take polarity is flipped
  ---
  --- D_PAN : double * : take pan, -1..1
  ---
  --- D_PANLAW : double * : take pan law, -1=default, 0.5=-6dB, 1.0=+0dB, etc
  ---
  --- D_PLAYRATE : double * : take playback rate, 0.5=half speed, 1=normal, 2=double speed, etc
  ---
  --- D_PITCH : double * : take pitch adjustment in semitones, -12=one octave down, 0=normal, +12=one octave up, etc
  ---
  --- B_PPITCH : bool * : preserve pitch when changing playback rate
  ---
  --- I_LASTY : int * : Y-position (relative to top of track) in pixels (read-only)
  ---
  --- I_LASTH : int * : height in pixels (read-only)
  ---
  --- I_CHANMODE : int * : channel mode, 0=normal, 1=reverse stereo, 2=downmix, 3=left, 4=right
  ---
  --- I_PITCHMODE : int * : pitch shifter mode, -1=project default, otherwise high 2 bytes=shifter, low 2 bytes=parameter
  ---
  --- I_STRETCHFLAGS : int * : stretch marker flags (&7 mask for mode override: 0=default, 1=balanced, 2/3/6=tonal, 4=transient, 5=no pre-echo)
  ---
  --- F_STRETCHFADESIZE : float * : stretch marker fade size in seconds (0.0025 default)
  ---
  --- I_RECPASSID : int * : record pass ID
  ---
  --- I_TAKEFX_NCH : int * : number of internal audio channels for per-take FX to use (OK to call with setNewValue, but the returned value is read-only)
  ---
  --- I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will not be used, but will store the color
  ---
  --- IP_TAKENUMBER : int : take number (read-only, returns the take number directly)
  ---
  --- P_TRACK : pointer to MediaTrack (read-only)
  ---
  --- P_ITEM : pointer to MediaItem (read-only)
  ---
  --- P_SOURCE : PCM_source *. Note that if setting this, you should first retrieve the old source, set the new, THEN delete the old.
  ---@param take MediaItem_Take
  ---@param parmname string
  ---@return number
  GetMediaItemTakeInfo_Value = function(take, parmname) end,

  --- ```
  --- MediaTrack _ = reaper.GetMediaItemTrack(MediaItem item)
  --- ```
  ---@param item MediaItem
  ---@return MediaTrack
  GetMediaItemTrack = function(item) end,

  --- ```
  --- string filenamebuf = reaper.GetMediaSourceFileName(PCM_source source)
  --- ```
  --- Copies the media source filename to filenamebuf. Note that in-project MIDI media sources have no associated filename. See GetMediaSourceParent.
  ---@param source PCM_source
  ---@return string
  GetMediaSourceFileName = function(source) end,

  --- ```
  --- number retval, boolean lengthIsQN = reaper.GetMediaSourceLength(PCM_source source)
  --- ```
  --- Returns the length of the source media. If the media source is beat-based, the length will be in quarter notes, otherwise it will be in seconds.
  ---@param source PCM_source
  ---@return number, boolean
  GetMediaSourceLength = function(source) end,

  --- ```
  --- integer _ = reaper.GetMediaSourceNumChannels(PCM_source source)
  --- ```
  --- Returns the number of channels in the source media.
  ---@param source PCM_source
  ---@return integer
  GetMediaSourceNumChannels = function(source) end,

  --- ```
  --- PCM_source _ = reaper.GetMediaSourceParent(PCM_source src)
  --- ```
  --- Returns the parent source, or NULL if src is the root source. This can be used to retrieve the parent properties of sections or reversed sources for example.
  ---@param src PCM_source
  ---@return PCM_source
  GetMediaSourceParent = function(src) end,

  --- ```
  --- integer _ = reaper.GetMediaSourceSampleRate(PCM_source source)
  --- ```
  --- Returns the sample rate. MIDI source media will return zero.
  ---@param source PCM_source
  ---@return integer
  GetMediaSourceSampleRate = function(source) end,

  --- ```
  --- string typebuf = reaper.GetMediaSourceType(PCM_source source)
  --- ```
  --- copies the media source type ("WAV", "MIDI", etc) to typebuf
  ---@param source PCM_source
  ---@return string
  GetMediaSourceType = function(source) end,

  --- ```
  --- number _ = reaper.GetMediaTrackInfo_Value(MediaTrack tr, string parmname)
  --- ```
  --- Get track numerical-value attributes.
  ---
  --- B_MUTE : bool * : muted
  ---
  --- B_PHASE : bool * : track phase inverted
  ---
  --- B_RECMON_IN_EFFECT : bool * : record monitoring in effect (current audio-thread playback state, read-only)
  ---
  --- IP_TRACKNUMBER : int : track number 1-based, 0=not found, -1=master track (read-only, returns the int directly)
  ---
  --- I_SOLO : int * : soloed, 0=not soloed, 1=soloed, 2=soloed in place, 5=safe soloed, 6=safe soloed in place
  ---
  --- B_SOLO_DEFEAT : bool * : when set, if anything else is soloed and this track is not muted, this track acts soloed
  ---
  --- I_FXEN : int * : fx enabled, 0=bypassed, !0=fx active
  ---
  --- I_RECARM : int * : record armed, 0=not record armed, 1=record armed
  ---
  --- I_RECINPUT : int * : record input, <0=no input. if 4096 set, input is MIDI and low 5 bits represent channel (0=all, 1-16=only chan), next 6 bits represent physical input (63=all, 62=VKB). If 4096 is not set, low 10 bits (0..1023) are input start channel (ReaRoute/Loopback start at 512). If 2048 is set, input is multichannel input (using track channel count), or if 1024 is set, input is stereo input, otherwise input is mono.
  ---
  --- I_RECMODE : int * : record mode, 0=input, 1=stereo out, 2=none, 3=stereo out w/latency compensation, 4=midi output, 5=mono out, 6=mono out w/ latency compensation, 7=midi overdub, 8=midi replace
  ---
  --- I_RECMODE_FLAGS : int * : record mode flags, &3=output recording mode (0=post fader, 1=pre-fx, 2=post-fx/pre-fader)
  ---
  --- I_RECMON : int * : record monitoring, 0=off, 1=normal, 2=not when playing (tape style)
  ---
  --- I_RECMONITEMS : int * : monitor items while recording, 0=off, 1=on
  ---
  --- B_AUTO_RECARM : bool * : automatically set record arm when selected (does not immediately affect recarm state, script should set directly if desired)
  ---
  --- I_VUMODE : int * : track vu mode, &1:disabled, &30==0:stereo peaks, &30==2:multichannel peaks, &30==4:stereo RMS, &30==8:combined RMS, &30==12:LUFS-M, &30==16:LUFS-S (readout=max), &30==20:LUFS-S (readout=current), &32:LUFS calculation on channels 1+2 only
  ---
  --- I_AUTOMODE : int * : track automation mode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch
  ---
  --- I_NCHAN : int * : number of track channels, 2-128, even numbers only
  ---
  --- I_SELECTED : int * : track selected, 0=unselected, 1=selected
  ---
  --- I_WNDH : int * : current TCP window height in pixels including envelopes (read-only)
  ---
  --- I_TCPH : int * : current TCP window height in pixels not including envelopes (read-only)
  ---
  --- I_TCPY : int * : current TCP window Y-position in pixels relative to top of arrange view (read-only)
  ---
  --- I_MCPX : int * : current MCP X-position in pixels relative to mixer container (read-only)
  ---
  --- I_MCPY : int * : current MCP Y-position in pixels relative to mixer container (read-only)
  ---
  --- I_MCPW : int * : current MCP width in pixels (read-only)
  ---
  --- I_MCPH : int * : current MCP height in pixels (read-only)
  ---
  --- I_FOLDERDEPTH : int * : folder depth change, 0=normal, 1=track is a folder parent, -1=track is the last in the innermost folder, -2=track is the last in the innermost and next-innermost folders, etc
  ---
  --- I_FOLDERCOMPACT : int * : folder collapsed state (only valid on folders), 0=normal, 1=collapsed, 2=fully collapsed
  ---
  --- I_MIDIHWOUT : int * : track midi hardware output index, <0=disabled, low 5 bits are which channels (0=all, 1-16), next 5 bits are output device index (0-31)
  ---
  --- I_PERFFLAGS : int * : track performance flags, &1=no media buffering, &2=no anticipative FX
  ---
  --- I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will not be used, but will store the color
  ---
  --- I_HEIGHTOVERRIDE : int * : custom height override for TCP window, 0 for none, otherwise size in pixels
  ---
  --- I_SPACER : int * : 1=TCP track spacer above this trackB_HEIGHTLOCK : bool * : track height lock (must set I_HEIGHTOVERRIDE before locking)
  ---
  --- D_VOL : double * : trim volume of track, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
  ---
  --- D_PAN : double * : trim pan of track, -1..1
  ---
  --- D_WIDTH : double * : width of track, -1..1
  ---
  --- D_DUALPANL : double * : dualpan position 1, -1..1, only if I_PANMODE==6
  ---
  --- D_DUALPANR : double * : dualpan position 2, -1..1, only if I_PANMODE==6
  ---
  --- I_PANMODE : int * : pan mode, 0=classic 3.x, 3=new balance, 5=stereo pan, 6=dual pan
  ---
  --- D_PANLAW : double * : pan law of track, <0=project default, 0.5=-6dB, 0.707..=-3dB, 1=+0dB, 1.414..=-3dB with gain compensation, 2=-6dB with gain compensation, etc
  ---
  --- I_PANLAW_FLAGS : int * : pan law flags, 0=sine taper, 1=hybrid taper with deprecated behavior when gain compensation enabled, 2=linear taper, 3=hybrid taper
  ---
  --- P_ENV:<envchunkname or P_ENV:{GUID... : TrackEnvelope * : (read-only) chunkname can be <VOLENV, <PANENV, etc; GUID is the stringified envelope GUID.
  ---
  --- B_SHOWINMIXER : bool * : track control panel visible in mixer (do not use on master track)
  ---
  --- B_SHOWINTCP : bool * : track control panel visible in arrange view (do not use on master track)
  ---
  --- B_MAINSEND : bool * : track sends audio to parent
  ---
  --- C_MAINSEND_OFFS : char * : channel offset of track send to parent
  ---
  --- C_MAINSEND_NCH : char * : channel count of track send to parent (0=use all child track channels, 1=use one channel only)
  ---
  --- I_FREEMODE : int * : 1=track free item positioning enabled, 2=track fixed lanes enabled (call UpdateTimeline() after changing)
  ---
  --- I_NUMFIXEDLANES : int * : number of track fixed lanes (fine to call with setNewValue, but returned value is read-only)
  ---
  --- C_LANESCOLLAPSED : char * : fixed lane collapse state (1=lanes collapsed, 2=track displays as non-fixed-lanes but hidden lanes exist)
  ---
  --- C_LANEPLAYS:N : char * :  on fixed lane tracks, 0=lane N does not play, 1=lane N plays exclusively, 2=lane N plays and other lanes also play (fine to call with setNewValue, but returned value is read-only)
  ---
  --- C_ALLLANESPLAY : char * : on fixed lane tracks, 0=no lanes play, 1=all lanes play, 2=some lanes play (fine to call with setNewValue 0 or 1, but returned value is read-only)
  ---
  --- C_BEATATTACHMODE : char * : track timebase, -1=project default, 0=time, 1=beats (position, length, rate), 2=beats (position only)
  ---
  --- F_MCP_FXSEND_SCALE : float * : scale of fx+send area in MCP (0=minimum allowed, 1=maximum allowed)
  ---
  --- F_MCP_FXPARM_SCALE : float * : scale of fx parameter area in MCP (0=minimum allowed, 1=maximum allowed)
  ---
  --- F_MCP_SENDRGN_SCALE : float * : scale of send area as proportion of the fx+send total area (0=minimum allowed, 1=maximum allowed)
  ---
  --- F_TCP_FXPARM_SCALE : float * : scale of TCP parameter area when TCP FX are embedded (0=min allowed, default, 1=max allowed)
  ---
  --- I_PLAY_OFFSET_FLAG : int * : track media playback offset state, &1=bypassed, &2=offset value is measured in samples (otherwise measured in seconds)
  ---
  --- D_PLAY_OFFSET : double * : track media playback offset, units depend on I_PLAY_OFFSET_FLAG
  ---
  --- P_PARTRACK : MediaTrack * : parent track (read-only)
  ---
  --- P_PROJECT : ReaProject * : parent project (read-only)
  ---@param tr MediaTrack
  ---@param parmname string
  ---@return number
  ---@deprecated
  GetMediaTrackInfo_Value = function(tr, parmname) end,

  --- ```
  --- boolean retval, string nameout = reaper.GetMIDIInputName(integer dev, string nameout)
  --- ```
  --- returns true if device present
  ---@param dev integer
  ---@param nameout string
  ---@return boolean, string
  GetMIDIInputName = function(dev, nameout) end,

  --- ```
  --- boolean retval, string nameout = reaper.GetMIDIOutputName(integer dev, string nameout)
  --- ```
  --- returns true if device present
  ---@param dev integer
  ---@param nameout string
  ---@return boolean, string
  GetMIDIOutputName = function(dev, nameout) end,

  --- ```
  --- MediaTrack _ = reaper.GetMixerScroll()
  --- ```
  --- Get the leftmost track visible in the mixer
  ---@return MediaTrack
  GetMixerScroll = function() end,

  --- ```
  --- string action = reaper.GetMouseModifier(string context, integer modifier_flag)
  --- ```
  --- Get the current mouse modifier assignment for a specific modifier key assignment, in a specific context.
  ---
  --- action will be filled in with the command ID number for a built-in mouse modifier
  ---
  --- or built-in REAPER command ID, or the custom action ID string.
  ---
  --- Note: the action string may have a space and 'c' or 'm' appended to it to specify command ID vs mouse modifier ID.
  ---
  --- See SetMouseModifier for more information.
  ---@param context string
  ---@param modifier_flag integer
  ---@return string
  GetMouseModifier = function(context, modifier_flag) end,

  --- ```
  --- integer x, integer y = reaper.GetMousePosition()
  --- ```
  --- get mouse position in screen coordinates
  ---@return integer, integer
  GetMousePosition = function() end,

  --- ```
  --- integer _ = reaper.GetNumAudioInputs()
  --- ```
  --- Return number of normal audio hardware inputs available
  ---@return integer
  GetNumAudioInputs = function() end,

  --- ```
  --- integer _ = reaper.GetNumAudioOutputs()
  --- ```
  --- Return number of normal audio hardware outputs available
  ---@return integer
  GetNumAudioOutputs = function() end,

  --- ```
  --- integer _ = reaper.GetNumMIDIInputs()
  --- ```
  --- returns max number of real midi hardware inputs
  ---@return integer
  GetNumMIDIInputs = function() end,

  --- ```
  --- integer _ = reaper.GetNumMIDIOutputs()
  --- ```
  --- returns max number of real midi hardware outputs
  ---@return integer
  GetNumMIDIOutputs = function() end,

  --- ```
  --- integer _ = reaper.GetNumTakeMarkers(MediaItem_Take take)
  --- ```
  --- Returns number of take markers. See GetTakeMarker, SetTakeMarker, DeleteTakeMarker
  ---@param take MediaItem_Take
  ---@return integer
  GetNumTakeMarkers = function(take) end,

  --- ```
  --- integer _ = reaper.GetNumTracks()
  --- ```
  ---@return integer
  GetNumTracks = function() end,

  --- ```
  --- string _ = reaper.GetOS()
  --- ```
  --- Returns "Win32", "Win64", "OSX32", "OSX64", "macOS-arm64", or "Other".
  ---@return string
  GetOS = function() end,

  --- ```
  --- string _ = reaper.GetOutputChannelName(integer channelIndex)
  --- ```
  ---@param channelIndex integer
  ---@return string
  GetOutputChannelName = function(channelIndex) end,

  --- ```
  --- number _ = reaper.GetOutputLatency()
  --- ```
  --- returns output latency in seconds
  ---@return number
  GetOutputLatency = function() end,

  --- ```
  --- MediaTrack _ = reaper.GetParentTrack(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return MediaTrack
  GetParentTrack = function(track) end,

  --- ```
  --- string buf = reaper.GetPeakFileName(string fn)
  --- ```
  --- get the peak file name for a given file (can be either filename.reapeaks,or a hashed filename in another path)
  ---@param fn string
  ---@return string
  GetPeakFileName = function(fn) end,

  --- ```
  --- string buf = reaper.GetPeakFileNameEx(string fn, string buf, boolean forWrite)
  --- ```
  --- get the peak file name for a given file (can be either filename.reapeaks,or a hashed filename in another path)
  ---@param fn string
  ---@param buf string
  ---@param forWrite boolean
  ---@return string
  GetPeakFileNameEx = function(fn, buf, forWrite) end,

  --- ```
  --- string buf = reaper.GetPeakFileNameEx2(string fn, string buf, boolean forWrite, string peaksfileextension)
  --- ```
  --- Like GetPeakFileNameEx, but you can specify peaksfileextension such as ".reapeaks"
  ---@param fn string
  ---@param buf string
  ---@param forWrite boolean
  ---@param peaksfileextension string
  ---@return string
  GetPeakFileNameEx2 = function(fn, buf, forWrite, peaksfileextension) end,

  --- ```
  --- number _ = reaper.GetPlayPosition()
  --- ```
  --- returns latency-compensated actual-what-you-hear position
  ---@return number
  GetPlayPosition = function() end,

  --- ```
  --- number _ = reaper.GetPlayPosition2()
  --- ```
  --- returns position of next audio block being processed
  ---@return number
  GetPlayPosition2 = function() end,

  --- ```
  --- number _ = reaper.GetPlayPosition2Ex(ReaProject proj)
  --- ```
  --- returns position of next audio block being processed
  ---@param proj ReaProject
  ---@return number
  GetPlayPosition2Ex = function(proj) end,

  --- ```
  --- number _ = reaper.GetPlayPositionEx(ReaProject proj)
  --- ```
  --- returns latency-compensated actual-what-you-hear position
  ---@param proj ReaProject
  ---@return number
  GetPlayPositionEx = function(proj) end,

  --- ```
  --- integer _ = reaper.GetPlayState()
  --- ```
  --- &1=playing, &2=paused, &4=is recording
  ---@return integer
  GetPlayState = function() end,

  --- ```
  --- integer _ = reaper.GetPlayStateEx(ReaProject proj)
  --- ```
  --- &1=playing, &2=paused, &4=is recording
  ---@param proj ReaProject
  ---@return integer
  GetPlayStateEx = function(proj) end,

  --- ```
  --- number _ = reaper.GetProjectLength(ReaProject proj)
  --- ```
  --- returns length of project (maximum of end of media item, markers, end of regions, tempo map
  ---@param proj ReaProject
  ---@return number
  GetProjectLength = function(proj) end,

  --- ```
  --- string buf = reaper.GetProjectName(ReaProject proj)
  --- ```
  ---@param proj ReaProject
  ---@return string
  GetProjectName = function(proj) end,

  --- ```
  --- string buf = reaper.GetProjectPath()
  --- ```
  --- Get the project recording path.
  ---@return string
  GetProjectPath = function() end,

  --- ```
  --- string buf = reaper.GetProjectPathEx(ReaProject proj)
  --- ```
  --- Get the project recording path.
  ---@param proj ReaProject
  ---@return string
  GetProjectPathEx = function(proj) end,

  --- ```
  --- integer _ = reaper.GetProjectStateChangeCount(ReaProject proj)
  --- ```
  --- returns an integer that changes when the project state changes
  ---@param proj ReaProject
  ---@return integer
  GetProjectStateChangeCount = function(proj) end,

  --- ```
  --- number _ = reaper.GetProjectTimeOffset(ReaProject proj, boolean rndframe)
  --- ```
  --- Gets project time offset in seconds (project settings - project start time). If rndframe is true, the offset is rounded to a multiple of the project frame size.
  ---@param proj ReaProject
  ---@param rndframe boolean
  ---@return number
  GetProjectTimeOffset = function(proj, rndframe) end,

  --- ```
  --- number bpm, number bpi = reaper.GetProjectTimeSignature()
  --- ```
  --- deprecated
  ---@return number, number
  ---@deprecated
  GetProjectTimeSignature = function() end,

  --- ```
  --- number bpm, number bpi = reaper.GetProjectTimeSignature2(ReaProject proj)
  --- ```
  --- Gets basic time signature (beats per minute, numerator of time signature in bpi)
  ---
  --- this does not reflect tempo envelopes but is purely what is set in the project settings.
  ---@param proj ReaProject
  ---@return number, number
  GetProjectTimeSignature2 = function(proj) end,

  --- ```
  --- integer retval, string val = reaper.GetProjExtState(ReaProject proj, string extname, string key)
  --- ```
  --- Get the value previously associated with this extname and key, the last time the project was saved. See SetProjExtState, EnumProjExtState.
  ---@param proj ReaProject
  ---@param extname string
  ---@param key string
  ---@return integer, string
  GetProjExtState = function(proj, extname, key) end,

  --- ```
  --- string _ = reaper.GetResourcePath()
  --- ```
  --- returns path where ini files are stored, other things are in subdirectories.
  ---@return string
  GetResourcePath = function() end,

  --- ```
  --- TrackEnvelope _ = reaper.GetSelectedEnvelope(ReaProject proj)
  --- ```
  --- get the currently selected envelope, returns NULL/nil if no envelope is selected
  ---@param proj ReaProject
  ---@return TrackEnvelope
  GetSelectedEnvelope = function(proj) end,

  --- ```
  --- MediaItem _ = reaper.GetSelectedMediaItem(ReaProject proj, integer selitem)
  --- ```
  --- get a selected item by selected item count (zero-based) (proj=0 for active project)
  ---@param proj ReaProject
  ---@param selitem integer
  ---@return MediaItem
  GetSelectedMediaItem = function(proj, selitem) end,

  --- ```
  --- MediaTrack _ = reaper.GetSelectedTrack(ReaProject proj, integer seltrackidx)
  --- ```
  --- Get a selected track from a project (proj=0 for active project) by selected track count (zero-based). This function ignores the master track, see GetSelectedTrack2.
  ---@param proj ReaProject
  ---@param seltrackidx integer
  ---@return MediaTrack
  GetSelectedTrack = function(proj, seltrackidx) end,

  --- ```
  --- MediaTrack _ = reaper.GetSelectedTrack2(ReaProject proj, integer seltrackidx, boolean wantmaster)
  --- ```
  --- Get a selected track from a project (proj=0 for active project) by selected track count (zero-based).
  ---@param proj ReaProject
  ---@param seltrackidx integer
  ---@param wantmaster boolean
  ---@return MediaTrack
  GetSelectedTrack2 = function(proj, seltrackidx, wantmaster) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetSelectedTrackEnvelope(ReaProject proj)
  --- ```
  --- get the currently selected track envelope, returns NULL/nil if no envelope is selected
  ---@param proj ReaProject
  ---@return TrackEnvelope
  GetSelectedTrackEnvelope = function(proj) end,

  --- ```
  --- number start_time, number end_time = reaper.GetSet_ArrangeView2(ReaProject proj, boolean isSet, integer screen_x_start, integer screen_x_end, number start_time, number end_time)
  --- ```
  --- Gets or sets the arrange view start/end time for screen coordinates. use screen_x_start=screen_x_end=0 to use the full arrange view's start/end time
  ---@param proj ReaProject
  ---@param isSet boolean
  ---@param screen_x_start integer
  ---@param screen_x_end integer
  ---@param start_time number
  ---@param end_time number
  ---@return number, number
  GetSet_ArrangeView2 = function(proj, isSet, screen_x_start, screen_x_end, start_time, end_time) end,

  --- ```
  --- number start, number _end = reaper.GetSet_LoopTimeRange(boolean isSet, boolean isLoop, number start, number _end, boolean allowautoseek)
  --- ```
  ---@param isSet boolean
  ---@param isLoop boolean
  ---@param start number
  ---@param _end number
  ---@param allowautoseek boolean
  ---@return number, number
  GetSet_LoopTimeRange = function(isSet, isLoop, start, _end, allowautoseek) end,

  --- ```
  --- number start, number _end = reaper.GetSet_LoopTimeRange2(ReaProject proj, boolean isSet, boolean isLoop, number start, number _end, boolean allowautoseek)
  --- ```
  ---@param proj ReaProject
  ---@param isSet boolean
  ---@param isLoop boolean
  ---@param start number
  ---@param _end number
  ---@param allowautoseek boolean
  ---@return number, number
  GetSet_LoopTimeRange2 = function(proj, isSet, isLoop, start, _end, allowautoseek) end,

  --- ```
  --- number _ = reaper.GetSetAutomationItemInfo(TrackEnvelope env, integer autoitem_idx, string desc, number value, boolean is_set)
  --- ```
  --- Get or set automation item information. autoitem_idx=0 for the first automation item on an envelope, 1 for the second item, etc. desc can be any of the following:
  ---
  --- D_POOL_ID : double * : automation item pool ID (as an integer); edits are propagated to all other automation items that share a pool ID
  ---
  --- D_POSITION : double * : automation item timeline position in seconds
  ---
  --- D_LENGTH : double * : automation item length in seconds
  ---
  --- D_STARTOFFS : double * : automation item start offset in seconds
  ---
  --- D_PLAYRATE : double * : automation item playback rate
  ---
  --- D_BASELINE : double * : automation item baseline value in the range [0,1]
  ---
  --- D_AMPLITUDE : double * : automation item amplitude in the range [-1,1]
  ---
  --- D_LOOPSRC : double * : nonzero if the automation item contents are looped
  ---
  --- D_UISEL : double * : nonzero if the automation item is selected in the arrange view
  ---
  --- D_POOL_QNLEN : double * : automation item pooled source length in quarter notes (setting will affect all pooled instances)
  ---@param env TrackEnvelope
  ---@param autoitem_idx integer
  ---@param desc string
  ---@param value number
  ---@param is_set boolean
  ---@return number
  GetSetAutomationItemInfo = function(env, autoitem_idx, desc, value, is_set) end,

  --- ```
  --- boolean retval, string valuestrNeedBig = reaper.GetSetAutomationItemInfo_String(TrackEnvelope env, integer autoitem_idx, string desc, string valuestrNeedBig, boolean is_set)
  --- ```
  --- Get or set automation item information. autoitem_idx=0 for the first automation item on an envelope, 1 for the second item, etc. returns true on success. desc can be any of the following:
  ---
  --- P_POOL_NAME : char * : name of the underlying automation item pool
  ---
  --- P_POOL_EXT:xyz : char * : extension-specific persistent data
  ---@param env TrackEnvelope
  ---@param autoitem_idx integer
  ---@param desc string
  ---@param valuestrNeedBig string
  ---@param is_set boolean
  ---@return boolean, string
  GetSetAutomationItemInfo_String = function(env, autoitem_idx, desc, valuestrNeedBig, is_set) end,

  --- ```
  --- boolean retval, string stringNeedBig = reaper.GetSetEnvelopeInfo_String(TrackEnvelope env, string parmname, string stringNeedBig, boolean setNewValue)
  --- ```
  --- Gets/sets an attribute string:
  ---
  --- P_EXT:xyz : char * : extension-specific persistent data
  ---
  --- GUID : GUID * : 16-byte GUID, can query only, not set. If using a _String() function, GUID is a string {xyz-...}.
  ---@param env TrackEnvelope
  ---@param parmname string
  ---@param stringNeedBig string
  ---@param setNewValue boolean
  ---@return boolean, string
  GetSetEnvelopeInfo_String = function(env, parmname, stringNeedBig, setNewValue) end,

  --- ```
  --- boolean retval, string str = reaper.GetSetEnvelopeState(TrackEnvelope env, string str)
  --- ```
  --- deprecated -- see SetEnvelopeStateChunk, GetEnvelopeStateChunk
  ---@param env TrackEnvelope
  ---@param str string
  ---@return boolean, string
  ---@deprecated
  GetSetEnvelopeState = function(env, str) end,

  --- ```
  --- boolean retval, string str = reaper.GetSetEnvelopeState2(TrackEnvelope env, string str, boolean isundo)
  --- ```
  --- deprecated -- see SetEnvelopeStateChunk, GetEnvelopeStateChunk
  ---@param env TrackEnvelope
  ---@param str string
  ---@param isundo boolean
  ---@return boolean, string
  ---@deprecated
  GetSetEnvelopeState2 = function(env, str, isundo) end,

  --- ```
  --- boolean retval, string str = reaper.GetSetItemState(MediaItem item, string str)
  --- ```
  --- deprecated -- see SetItemStateChunk, GetItemStateChunk
  ---@param item MediaItem
  ---@param str string
  ---@return boolean, string
  ---@deprecated
  GetSetItemState = function(item, str) end,

  --- ```
  --- boolean retval, string str = reaper.GetSetItemState2(MediaItem item, string str, boolean isundo)
  --- ```
  --- deprecated -- see SetItemStateChunk, GetItemStateChunk
  ---@param item MediaItem
  ---@param str string
  ---@param isundo boolean
  ---@return boolean, string
  ---@deprecated
  GetSetItemState2 = function(item, str, isundo) end,

  --- ```
  --- boolean retval, string stringNeedBig = reaper.GetSetMediaItemInfo_String(MediaItem item, string parmname, string stringNeedBig, boolean setNewValue)
  --- ```
  --- Gets/sets an item attribute string:
  ---
  --- P_NOTES : char * : item note text (do not write to returned pointer, use setNewValue to update)
  ---
  --- P_EXT:xyz : char * : extension-specific persistent data
  ---
  --- GUID : GUID * : 16-byte GUID, can query or update. If using a _String() function, GUID is a string {xyz-...}.
  ---@param item MediaItem
  ---@param parmname string
  ---@param stringNeedBig string
  ---@param setNewValue boolean
  ---@return boolean, string
  GetSetMediaItemInfo_String = function(item, parmname, stringNeedBig, setNewValue) end,

  --- ```
  --- boolean retval, string stringNeedBig = reaper.GetSetMediaItemTakeInfo_String(MediaItem_Take tk, string parmname, string stringNeedBig, boolean setNewValue)
  --- ```
  --- Gets/sets a take attribute string:
  ---
  --- P_NAME : char * : take name
  ---
  --- P_EXT:xyz : char * : extension-specific persistent data
  ---
  --- GUID : GUID * : 16-byte GUID, can query or update. If using a _String() function, GUID is a string {xyz-...}.
  ---@param tk MediaItem_Take
  ---@param parmname string
  ---@param stringNeedBig string
  ---@param setNewValue boolean
  ---@return boolean, string
  GetSetMediaItemTakeInfo_String = function(tk, parmname, stringNeedBig, setNewValue) end,

  --- ```
  --- boolean retval, string stringNeedBig = reaper.GetSetMediaTrackInfo_String(MediaTrack tr, string parmname, string stringNeedBig, boolean setNewValue)
  --- ```
  --- Get or set track string attributes.
  ---
  --- P_NAME : char * : track name (on master returns NULL)
  ---
  --- P_ICON : const char * : track icon (full filename, or relative to resource_path/data/track_icons)
  ---
  --- P_LANENAME:n : char * : lane name (returns NULL for non-fixed-lane-tracks)
  ---
  --- P_MCP_LAYOUT : const char * : layout name
  ---
  --- P_RAZOREDITS : const char * : list of razor edit areas, as space-separated triples of start time, end time, and envelope GUID string.
  ---
  ---   Example: "0.0 1.0 \"\" 0.0 1.0 "{xyz-...}"
  ---
  --- P_RAZOREDITS_EXT : const char * : list of razor edit areas, as comma-separated sets of space-separated tuples of start time, end time, optional: envelope GUID string, fixed/fipm top y-position, fixed/fipm bottom y-position.
  ---
  ---   Example: "0.0 1.0,0.0 1.0 "{xyz-...}",1.0 2.0 "" 0.25 0.75"
  ---
  --- P_TCP_LAYOUT : const char * : layout name
  ---
  --- P_EXT:xyz : char * : extension-specific persistent data
  ---
  --- P_UI_RECT:tcp.mute : char * : read-only, allows querying screen position + size of track WALTER elements (tcp.size queries screen position and size of entire TCP, etc).
  ---
  --- GUID : GUID * : 16-byte GUID, can query or update. If using a _String() function, GUID is a string {xyz-...}.
  ---@param tr MediaTrack
  ---@param parmname string
  ---@param stringNeedBig string
  ---@param setNewValue boolean
  ---@return boolean, string
  GetSetMediaTrackInfo_String = function(tr, parmname, stringNeedBig, setNewValue) end,

  --- ```
  --- string author = reaper.GetSetProjectAuthor(ReaProject proj, boolean set, string author)
  --- ```
  --- deprecated, see GetSetProjectInfo_String with desc="PROJECT_AUTHOR"
  ---@param proj ReaProject
  ---@param set boolean
  ---@param author string
  ---@return string
  ---@deprecated
  GetSetProjectAuthor = function(proj, set, author) end,

  --- ```
  --- integer retval, optional number division, optional integer swingmode, optional number swingamt = reaper.GetSetProjectGrid(ReaProject project, boolean set, optional number division, optional integer swingmode, optional number swingamt)
  --- ```
  --- Get or set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half note triplet, etc. swingmode can be 1 for swing enabled, swingamt is -1..1. swingmode can be 3 for measure-grid. Returns grid configuration flags
  ---@param project ReaProject
  ---@param set boolean
  ---@param division? number
  ---@param swingmode? integer
  ---@param swingamt? number
  ---@return integer, number, integer, number
  GetSetProjectGrid = function(project, set, division, swingmode, swingamt) end,

  --- ```
  --- number _ = reaper.GetSetProjectInfo(ReaProject project, string desc, number value, boolean is_set)
  --- ```
  --- Get or set project information.
  ---
  --- RENDER_SETTINGS : &(1|2)=0:master mix, &1=stems+master mix, &2=stems only, &4=multichannel tracks to multichannel files, &8=use render matrix, &16=tracks with only mono media to mono files, &32=selected media items, &64=selected media items via master, &128=selected tracks via master, &256=embed transients if format supports, &512=embed metadata if format supports, &1024=embed take markers if format supports, &2048=2nd pass render
  ---
  --- RENDER_BOUNDSFLAG : 0=custom time bounds, 1=entire project, 2=time selection, 3=all project regions, 4=selected media items, 5=selected project regions, 6=all project markers, 7=selected project markers
  ---
  --- RENDER_CHANNELS : number of channels in rendered file
  ---
  --- RENDER_SRATE : sample rate of rendered file (or 0 for project sample rate)
  ---
  --- RENDER_STARTPOS : render start time when RENDER_BOUNDSFLAG=0
  ---
  --- RENDER_ENDPOS : render end time when RENDER_BOUNDSFLAG=0
  ---
  --- RENDER_TAILFLAG : apply render tail setting when rendering: &1=custom time bounds, &2=entire project, &4=time selection, &8=all project markers/regions, &16=selected media items, &32=selected project markers/regions
  ---
  --- RENDER_TAILMS : tail length in ms to render (only used if RENDER_BOUNDSFLAG and RENDER_TAILFLAG are set)
  ---
  --- RENDER_ADDTOPROJ : &1=add rendered files to project, &2=do not render files that are likely silent
  ---
  --- RENDER_DITHER : &1=dither, &2=noise shaping, &4=dither stems, &8=noise shaping on stems
  ---
  --- RENDER_NORMALIZE: &1=enable, (&14==0)=LUFS-I, (&14==2)=RMS, (&14==4)=peak, (&14==6)=true peak, (&14==8)=LUFS-M max, (&14==10)=LUFS-S max, &32=normalize stems to common gain based on master, &64=enable brickwall limit, &128=brickwall limit true peak, (&2304==256)=only normalize files that are too loud, (&2304==2048)=only normalize files that are too quiet, &512=apply fade-in, &1024=apply fade-out
  ---
  --- RENDER_NORMALIZE_TARGET: render normalization target as amplitude, so 0.5 means -6.02dB, 0.25 means -12.04dB, etc
  ---
  --- RENDER_BRICKWALL: render brickwall limit as amplitude, so 0.5 means -6.02dB, 0.25 means -12.04dB, etc
  ---
  --- RENDER_FADEIN: render fade-in (0.001 means 1 ms, requires RENDER_NORMALIZE&512)
  ---
  --- RENDER_FADEOUT: render fade-out (0.001 means 1 ms, requires RENDER_NORMALIZE&1024)
  ---
  --- RENDER_FADEINSHAPE: render fade-in shape
  ---
  --- RENDER_FADEOUTSHAPE: render fade-out shape
  ---
  --- PROJECT_SRATE : samplerate (ignored unless PROJECT_SRATE_USE set)
  ---
  --- PROJECT_SRATE_USE : set to 1 if project samplerate is used
  ---@param project ReaProject
  ---@param desc string
  ---@param value number
  ---@param is_set boolean
  ---@return number
  GetSetProjectInfo = function(project, desc, value, is_set) end,

  --- ```
  --- boolean retval, string valuestrNeedBig = reaper.GetSetProjectInfo_String(ReaProject project, string desc, string valuestrNeedBig, boolean is_set)
  --- ```
  --- Get or set project information.
  ---
  --- PROJECT_NAME : project file name (read-only, is_set will be ignored)
  ---
  --- PROJECT_TITLE : title field from Project Settings/Notes dialog
  ---
  --- PROJECT_AUTHOR : author field from Project Settings/Notes dialog
  ---
  --- TRACK_GROUP_NAME:X : track group name, X should be 1..64
  ---
  --- MARKER_GUID:X : get the GUID (unique ID) of the marker or region with index X, where X is the index passed to EnumProjectMarkers, not necessarily the displayed number (read-only)
  ---
  --- MARKER_INDEX_FROM_GUID:{GUID} : get the GUID index of the marker or region with GUID {GUID} (read-only)
  ---
  --- OPENCOPY_CFGIDX : integer for the configuration of format to use when creating copies/applying FX. 0=wave (auto-depth), 1=APPLYFX_FORMAT, 2=RECORD_FORMAT
  ---
  --- RECORD_PATH : recording directory -- may be blank or a relative path, to get the effective path see GetProjectPathEx()
  ---
  --- RECORD_PATH_SECONDARY : secondary recording directory
  ---
  --- RECORD_FORMAT : base64-encoded sink configuration (see project files, etc). Callers can also pass a simple 4-byte string (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that sink type.
  ---
  --- APPLYFX_FORMAT : base64-encoded sink configuration (see project files, etc). Used only if RECFMT_OPENCOPY is set to 1. Callers can also pass a simple 4-byte string (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that sink type.
  ---
  --- RENDER_FILE : render directory
  ---
  --- RENDER_PATTERN : render file name (may contain wildcards)
  ---
  --- RENDER_METADATA : get or set the metadata saved with the project (not metadata embedded in project media). Example, ID3 album name metadata: valuestr="ID3:TALB" to get, valuestr="ID3:TALB|my album name" to set. Call with valuestr="" and is_set=false to get a semicolon-separated list of defined project metadata identifiers.
  ---
  --- RENDER_TARGETS : semicolon separated list of files that would be written if the project is rendered using the most recent render settings
  ---
  --- RENDER_STATS : (read-only) semicolon separated list of statistics for the most recently rendered files. call with valuestr="XXX" to run an action (for example, "42437"=dry run render selected items) before returning statistics.
  ---
  --- RENDER_FORMAT : base64-encoded sink configuration (see project files, etc). Callers can also pass a simple 4-byte string (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that sink type.
  ---
  --- RENDER_FORMAT2 : base64-encoded secondary sink configuration. Callers can also pass a simple 4-byte string (non-base64-encoded), e.g. "evaw" or "l3pm", to use default settings for that sink type, or "" to disable secondary render.
  ---
  ---     Formats available on this machine:
  ---
  ---     "wave" "aiff" "caff" "raw " "mp3l" "wvpk" "OggS" "flac" "ddp " "iso " "oggv" "FFMP" "XAVF" "GIF " "LCF "
  ---@param project ReaProject
  ---@param desc string
  ---@param valuestrNeedBig string
  ---@param is_set boolean
  ---@return boolean, string
  GetSetProjectInfo_String = function(project, desc, valuestrNeedBig, is_set) end,

  --- ```
  --- string notes = reaper.GetSetProjectNotes(ReaProject proj, boolean set, string notes)
  --- ```
  --- gets or sets project notes, notesNeedBig_sz is ignored when setting
  ---@param proj ReaProject
  ---@param set boolean
  ---@param notes string
  ---@return string
  GetSetProjectNotes = function(proj, set, notes) end,

  --- ```
  --- integer _ = reaper.GetSetRepeat(integer val)
  --- ```
  --- -1 == query,0=clear,1=set,>1=toggle . returns new value
  ---@param val integer
  ---@return integer
  GetSetRepeat = function(val) end,

  --- ```
  --- integer _ = reaper.GetSetRepeatEx(ReaProject proj, integer val)
  --- ```
  --- -1 == query,0=clear,1=set,>1=toggle . returns new value
  ---@param proj ReaProject
  ---@param val integer
  ---@return integer
  GetSetRepeatEx = function(proj, val) end,

  --- ```
  --- integer _ = reaper.GetSetTrackGroupMembership(MediaTrack tr, string groupname, integer setmask, integer setvalue)
  --- ```
  --- Gets or modifies the group membership for a track. Returns group state prior to call (each bit represents one of the 32 group numbers). if setmask has bits set, those bits in setvalue will be applied to group. Group can be one of:
  ---
  --- MEDIA_EDIT_LEAD
  ---
  --- MEDIA_EDIT_FOLLOW
  ---
  --- VOLUME_LEAD
  ---
  --- VOLUME_FOLLOW
  ---
  --- VOLUME_VCA_LEAD
  ---
  --- VOLUME_VCA_FOLLOW
  ---
  --- PAN_LEAD
  ---
  --- PAN_FOLLOW
  ---
  --- WIDTH_LEAD
  ---
  --- WIDTH_FOLLOW
  ---
  --- MUTE_LEAD
  ---
  --- MUTE_FOLLOW
  ---
  --- SOLO_LEAD
  ---
  --- SOLO_FOLLOW
  ---
  --- RECARM_LEAD
  ---
  --- RECARM_FOLLOW
  ---
  --- POLARITY_LEAD
  ---
  --- POLARITY_FOLLOW
  ---
  --- AUTOMODE_LEAD
  ---
  --- AUTOMODE_FOLLOW
  ---
  --- VOLUME_REVERSE
  ---
  --- PAN_REVERSE
  ---
  --- WIDTH_REVERSE
  ---
  --- NO_LEAD_WHEN_FOLLOW
  ---
  --- VOLUME_VCA_FOLLOW_ISPREFX
  ---
  ---
  ---
  --- Note: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and _FOLLOW, which is deprecated but still supported (scripts that must support v6.11 and earlier can use the deprecated strings).
  ---@param tr MediaTrack
  ---@param groupname string
  ---@param setmask integer
  ---@param setvalue integer
  ---@return integer
  ---@deprecated
  GetSetTrackGroupMembership = function(tr, groupname, setmask, setvalue) end,

  --- ```
  --- integer _ = reaper.GetSetTrackGroupMembershipHigh(MediaTrack tr, string groupname, integer setmask, integer setvalue)
  --- ```
  --- Gets or modifies the group membership for a track. Returns group state prior to call (each bit represents one of the high 32 group numbers). if setmask has bits set, those bits in setvalue will be applied to group. Group can be one of:
  ---
  --- MEDIA_EDIT_LEAD
  ---
  --- MEDIA_EDIT_FOLLOW
  ---
  --- VOLUME_LEAD
  ---
  --- VOLUME_FOLLOW
  ---
  --- VOLUME_VCA_LEAD
  ---
  --- VOLUME_VCA_FOLLOW
  ---
  --- PAN_LEAD
  ---
  --- PAN_FOLLOW
  ---
  --- WIDTH_LEAD
  ---
  --- WIDTH_FOLLOW
  ---
  --- MUTE_LEAD
  ---
  --- MUTE_FOLLOW
  ---
  --- SOLO_LEAD
  ---
  --- SOLO_FOLLOW
  ---
  --- RECARM_LEAD
  ---
  --- RECARM_FOLLOW
  ---
  --- POLARITY_LEAD
  ---
  --- POLARITY_FOLLOW
  ---
  --- AUTOMODE_LEAD
  ---
  --- AUTOMODE_FOLLOW
  ---
  --- VOLUME_REVERSE
  ---
  --- PAN_REVERSE
  ---
  --- WIDTH_REVERSE
  ---
  --- NO_LEAD_WHEN_FOLLOW
  ---
  --- VOLUME_VCA_FOLLOW_ISPREFX
  ---
  ---
  ---
  --- Note: REAPER v6.11 and earlier used _MASTER and _SLAVE rather than _LEAD and _FOLLOW, which is deprecated but still supported (scripts that must support v6.11 and earlier can use the deprecated strings).
  ---@param tr MediaTrack
  ---@param groupname string
  ---@param setmask integer
  ---@param setvalue integer
  ---@return integer
  ---@deprecated
  GetSetTrackGroupMembershipHigh = function(tr, groupname, setmask, setvalue) end,

  --- ```
  --- boolean retval, string stringNeedBig = reaper.GetSetTrackSendInfo_String(MediaTrack tr, integer category, integer sendidx, string parmname, string stringNeedBig, boolean setNewValue)
  --- ```
  --- Gets/sets a send attribute string:
  ---
  --- P_EXT:xyz : char * : extension-specific persistent data
  ---@param tr MediaTrack
  ---@param category integer
  ---@param sendidx integer
  ---@param parmname string
  ---@param stringNeedBig string
  ---@param setNewValue boolean
  ---@return boolean, string
  GetSetTrackSendInfo_String = function(tr, category, sendidx, parmname, stringNeedBig, setNewValue) end,

  --- ```
  --- boolean retval, string str = reaper.GetSetTrackState(MediaTrack track, string str)
  --- ```
  --- deprecated -- see SetTrackStateChunk, GetTrackStateChunk
  ---@param track MediaTrack
  ---@param str string
  ---@return boolean, string
  ---@deprecated
  GetSetTrackState = function(track, str) end,

  --- ```
  --- boolean retval, string str = reaper.GetSetTrackState2(MediaTrack track, string str, boolean isundo)
  --- ```
  --- deprecated -- see SetTrackStateChunk, GetTrackStateChunk
  ---@param track MediaTrack
  ---@param str string
  ---@param isundo boolean
  ---@return boolean, string
  ---@deprecated
  GetSetTrackState2 = function(track, str, isundo) end,

  --- ```
  --- ReaProject _ = reaper.GetSubProjectFromSource(PCM_source src)
  --- ```
  ---@param src PCM_source
  ---@return ReaProject
  GetSubProjectFromSource = function(src) end,

  --- ```
  --- MediaItem_Take _ = reaper.GetTake(MediaItem item, integer takeidx)
  --- ```
  --- get a take from an item by take count (zero-based)
  ---@param item MediaItem
  ---@param takeidx integer
  ---@return MediaItem_Take
  GetTake = function(item, takeidx) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetTakeEnvelope(MediaItem_Take take, integer envidx)
  --- ```
  ---@param take MediaItem_Take
  ---@param envidx integer
  ---@return TrackEnvelope
  GetTakeEnvelope = function(take, envidx) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetTakeEnvelopeByName(MediaItem_Take take, string envname)
  --- ```
  ---@param take MediaItem_Take
  ---@param envname string
  ---@return TrackEnvelope
  GetTakeEnvelopeByName = function(take, envname) end,

  --- ```
  --- number retval, string name, optional integer color = reaper.GetTakeMarker(MediaItem_Take take, integer idx)
  --- ```
  --- Get information about a take marker. Returns the position in media item source time, or -1 if the take marker does not exist. See GetNumTakeMarkers, SetTakeMarker, DeleteTakeMarker
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@return number, string, integer
  GetTakeMarker = function(take, idx) end,

  --- ```
  --- string _ = reaper.GetTakeName(MediaItem_Take take)
  --- ```
  --- returns NULL if the take is not valid
  ---@param take MediaItem_Take
  ---@return string
  GetTakeName = function(take) end,

  --- ```
  --- integer _ = reaper.GetTakeNumStretchMarkers(MediaItem_Take take)
  --- ```
  --- Returns number of stretch markers in take
  ---@param take MediaItem_Take
  ---@return integer
  GetTakeNumStretchMarkers = function(take) end,

  --- ```
  --- integer retval, number pos, optional number srcpos = reaper.GetTakeStretchMarker(MediaItem_Take take, integer idx)
  --- ```
  --- Gets information on a stretch marker, idx is 0..n. Returns -1 if stretch marker not valid. posOut will be set to position in item, srcposOutOptional will be set to source media position. Returns index. if input index is -1, the following marker is found using position (or source position if position is -1). If position/source position are used to find marker position, their values are not updated.
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@return integer, number, number
  GetTakeStretchMarker = function(take, idx) end,

  --- ```
  --- number _ = reaper.GetTakeStretchMarkerSlope(MediaItem_Take take, integer idx)
  --- ```
  --- See SetTakeStretchMarkerSlope
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@return number
  GetTakeStretchMarkerSlope = function(take, idx) end,

  --- ```
  --- boolean retval, integer fxindex, integer parmidx = reaper.GetTCPFXParm(ReaProject project, MediaTrack track, integer index)
  --- ```
  --- Get information about a specific FX parameter knob (see CountTCPFXParms).
  ---@param project ReaProject
  ---@param track MediaTrack
  ---@param index integer
  ---@return boolean, integer, integer
  GetTCPFXParm = function(project, track, index) end,

  --- ```
  --- boolean retval, number rate, number targetlen = reaper.GetTempoMatchPlayRate(PCM_source source, number srcscale, number position, number mult)
  --- ```
  --- finds the playrate and target length to insert this item stretched to a round power-of-2 number of bars, between 1/8 and 256
  ---@param source PCM_source
  ---@param srcscale number
  ---@param position number
  ---@param mult number
  ---@return boolean, number, number
  GetTempoMatchPlayRate = function(source, srcscale, position, mult) end,

  --- ```
  --- boolean retval, number timepos, integer measurepos, number beatpos, number bpm, integer timesig_num, integer timesig_denom, boolean lineartempo = reaper.GetTempoTimeSigMarker(ReaProject proj, integer ptidx)
  --- ```
  --- Get information about a tempo/time signature marker. See CountTempoTimeSigMarkers, SetTempoTimeSigMarker, AddTempoTimeSigMarker.
  ---@param proj ReaProject
  ---@param ptidx integer
  ---@return boolean, number, integer, number, number, integer, integer, boolean
  GetTempoTimeSigMarker = function(proj, ptidx) end,

  --- ```
  --- integer _ = reaper.GetThemeColor(string ini_key, integer flags)
  --- ```
  --- Returns the theme color specified, or -1 on failure. If the low bit of flags is set, the color as originally specified by the theme (before any transformations) is returned, otherwise the current (possibly transformed and modified) color is returned. See SetThemeColor for a list of valid ini_key.
  ---@param ini_key string
  ---@param flags integer
  ---@return integer
  GetThemeColor = function(ini_key, flags) end,

  --- ```
  --- MediaTrack retval, string info = reaper.GetThingFromPoint(integer screen_x, integer screen_y)
  --- ```
  --- Hit tests a point in screen coordinates. Updates infoOut with information such as "arrange", "fx_chain", "fx_0" (first FX in chain, floating), "spacer_0" (spacer before first track). If a track panel is hit, string will begin with "tcp" or "mcp" or "tcp.mute" etc (future versions may append additional information). May return NULL with valid info string to indicate non-track thing.
  ---@param screen_x integer
  ---@param screen_y integer
  ---@return MediaTrack, string
  GetThingFromPoint = function(screen_x, screen_y) end,

  --- ```
  --- integer _ = reaper.GetToggleCommandState(integer command_id)
  --- ```
  --- See GetToggleCommandStateEx.
  ---@param command_id integer
  ---@return integer
  GetToggleCommandState = function(command_id) end,

  --- ```
  --- integer _ = reaper.GetToggleCommandStateEx(integer section_id, integer command_id)
  --- ```
  --- For the main action context, the MIDI editor, or the media explorer, returns the toggle state of the action. 0=off, 1=on, -1=NA because the action does not have on/off states. For the MIDI editor, the action state for the most recently focused window will be returned.
  ---@param section_id integer
  ---@param command_id integer
  ---@return integer
  GetToggleCommandStateEx = function(section_id, command_id) end,

  --- ```
  --- HWND _ = reaper.GetTooltipWindow()
  --- ```
  --- gets a tooltip window,in case you want to ask it for font information. Can return NULL.
  ---@return HWND
  GetTooltipWindow = function() end,

  --- ```
  --- boolean retval, integer trackidx, integer itemidx, integer takeidx, integer fxidx, integer parm = reaper.GetTouchedOrFocusedFX(integer mode)
  --- ```
  --- mode can be 0 to query last touched parameter, or 1 to query currently focused FX. Returns false if failed. If successful, trackIdxOut will be track index (-1 is master track, 0 is first track). itemidxOut will be 0-based item index if an item, or -1 if not an item. takeidxOut will be 0-based take index. fxidxOut will be FX index, potentially with 0x2000000 set to signify container-addressing, or with 0x1000000 set to signify record-input FX. parmOut will be set to the parameter index if querying last-touched. parmOut will have 1 set if querying focused state and FX is no longer focused but still open.
  ---@param mode integer
  ---@return boolean, integer, integer, integer, integer, integer
  GetTouchedOrFocusedFX = function(mode) end,

  --- ```
  --- MediaTrack _ = reaper.GetTrack(ReaProject proj, integer trackidx)
  --- ```
  --- get a track from a project by track count (zero-based) (proj=0 for active project)
  ---@param proj ReaProject
  ---@param trackidx integer
  ---@return MediaTrack
  GetTrack = function(proj, trackidx) end,

  --- ```
  --- integer _ = reaper.GetTrackAutomationMode(MediaTrack tr)
  --- ```
  --- return the track mode, regardless of global override
  ---@param tr MediaTrack
  ---@return integer
  GetTrackAutomationMode = function(tr) end,

  --- ```
  --- integer _ = reaper.GetTrackColor(MediaTrack track)
  --- ```
  --- Returns the track custom color as OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). Black is returned as 0x1000000, no color setting is returned as 0.
  ---@param track MediaTrack
  ---@return integer
  GetTrackColor = function(track) end,

  --- ```
  --- integer _ = reaper.GetTrackDepth(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return integer
  GetTrackDepth = function(track) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetTrackEnvelope(MediaTrack track, integer envidx)
  --- ```
  ---@param track MediaTrack
  ---@param envidx integer
  ---@return TrackEnvelope
  GetTrackEnvelope = function(track, envidx) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetTrackEnvelopeByChunkName(MediaTrack tr, string cfgchunkname_or_guid)
  --- ```
  --- Gets a built-in track envelope by configuration chunk name, like "<VOLENV", or GUID string, like "{B577250D-146F-B544-9B34-F24FBE488F1F}".
  ---@param tr MediaTrack
  ---@param cfgchunkname_or_guid string
  ---@return TrackEnvelope
  GetTrackEnvelopeByChunkName = function(tr, cfgchunkname_or_guid) end,

  --- ```
  --- TrackEnvelope _ = reaper.GetTrackEnvelopeByName(MediaTrack track, string envname)
  --- ```
  ---@param track MediaTrack
  ---@param envname string
  ---@return TrackEnvelope
  GetTrackEnvelopeByName = function(track, envname) end,

  --- ```
  --- MediaTrack retval, optional integer info = reaper.GetTrackFromPoint(integer screen_x, integer screen_y)
  --- ```
  --- Returns the track from the screen coordinates specified. If the screen coordinates refer to a window associated to the track (such as FX), the track will be returned. infoOutOptional will be set to 1 if it is likely an envelope, 2 if it is likely a track FX. For a free item positioning or fixed lane track, the second byte of infoOutOptional will be set to the (approximate, for fipm tracks) item lane underneath the mouse. See GetThingFromPoint.
  ---@param screen_x integer
  ---@param screen_y integer
  ---@return MediaTrack, integer
  GetTrackFromPoint = function(screen_x, screen_y) end,

  --- ```
  --- string GUID = reaper.GetTrackGUID(MediaTrack tr)
  --- ```
  ---@param tr MediaTrack
  ---@return string
  GetTrackGUID = function(tr) end,

  --- ```
  --- MediaItem _ = reaper.GetTrackMediaItem(MediaTrack tr, integer itemidx)
  --- ```
  ---@param tr MediaTrack
  ---@param itemidx integer
  ---@return MediaItem
  GetTrackMediaItem = function(tr, itemidx) end,

  --- ```
  --- boolean retval, string buf = reaper.GetTrackMIDILyrics(MediaTrack track, integer flag)
  --- ```
  --- Get all MIDI lyrics on the track. Lyrics will be returned as one string with tabs between each word. flag&1: double tabs at the end of each measure and triple tabs when skipping measures, flag&2: each lyric is preceded by its beat position in the project (example with flag=2: "1.1.2\tLyric for measure 1 beat 2\t2.1.1\tLyric for measure 2 beat 1	"). See SetTrackMIDILyrics
  ---@param track MediaTrack
  ---@param flag integer
  ---@return boolean, string
  GetTrackMIDILyrics = function(track, flag) end,

  --- ```
  --- string _ = reaper.GetTrackMIDINoteName(integer track, integer pitch, integer chan)
  --- ```
  --- see GetTrackMIDINoteNameEx
  ---@param track integer
  ---@param pitch integer
  ---@param chan integer
  ---@return string
  GetTrackMIDINoteName = function(track, pitch, chan) end,

  --- ```
  --- string _ = reaper.GetTrackMIDINoteNameEx(ReaProject proj, MediaTrack track, integer pitch, integer chan)
  --- ```
  --- Get note/CC name. pitch 128 for CC0 name, 129 for CC1 name, etc. See SetTrackMIDINoteNameEx
  ---@param proj ReaProject
  ---@param track MediaTrack
  ---@param pitch integer
  ---@param chan integer
  ---@return string
  GetTrackMIDINoteNameEx = function(proj, track, pitch, chan) end,

  --- ```
  --- integer note_lo, integer note_hi = reaper.GetTrackMIDINoteRange(ReaProject proj, MediaTrack track)
  --- ```
  ---@param proj ReaProject
  ---@param track MediaTrack
  ---@return integer, integer
  GetTrackMIDINoteRange = function(proj, track) end,

  --- ```
  --- boolean retval, string buf = reaper.GetTrackName(MediaTrack track)
  --- ```
  --- Returns "MASTER" for master track, "Track N" if track has no name.
  ---@param track MediaTrack
  ---@return boolean, string
  GetTrackName = function(track) end,

  --- ```
  --- integer _ = reaper.GetTrackNumMediaItems(MediaTrack tr)
  --- ```
  ---@param tr MediaTrack
  ---@return integer
  GetTrackNumMediaItems = function(tr) end,

  --- ```
  --- integer _ = reaper.GetTrackNumSends(MediaTrack tr, integer category)
  --- ```
  --- returns number of sends/receives/hardware outputs - category is <0 for receives, 0=sends, >0 for hardware outputs
  ---@param tr MediaTrack
  ---@param category integer
  ---@return integer
  GetTrackNumSends = function(tr, category) end,

  --- ```
  --- boolean retval, string buf = reaper.GetTrackReceiveName(MediaTrack track, integer recv_index)
  --- ```
  --- See GetTrackSendName.
  ---@param track MediaTrack
  ---@param recv_index integer
  ---@return boolean, string
  GetTrackReceiveName = function(track, recv_index) end,

  --- ```
  --- boolean retval, boolean mute = reaper.GetTrackReceiveUIMute(MediaTrack track, integer recv_index)
  --- ```
  --- See GetTrackSendUIMute.
  ---@param track MediaTrack
  ---@param recv_index integer
  ---@return boolean, boolean
  GetTrackReceiveUIMute = function(track, recv_index) end,

  --- ```
  --- boolean retval, number volume, number pan = reaper.GetTrackReceiveUIVolPan(MediaTrack track, integer recv_index)
  --- ```
  --- See GetTrackSendUIVolPan.
  ---@param track MediaTrack
  ---@param recv_index integer
  ---@return boolean, number, number
  GetTrackReceiveUIVolPan = function(track, recv_index) end,

  --- ```
  --- number _ = reaper.GetTrackSendInfo_Value(MediaTrack tr, integer category, integer sendidx, string parmname)
  --- ```
  --- Get send/receive/hardware output numerical-value attributes.
  ---
  --- category is <0 for receives, 0=sends, >0 for hardware outputs
  ---
  --- parameter names:
  ---
  --- B_MUTE : bool *
  ---
  --- B_PHASE : bool * : true to flip phase
  ---
  --- B_MONO : bool *
  ---
  --- D_VOL : double * : 1.0 = +0dB etc
  ---
  --- D_PAN : double * : -1..+1
  ---
  --- D_PANLAW : double * : 1.0=+0.0db, 0.5=-6dB, -1.0 = projdef etc
  ---
  --- I_SENDMODE : int * : 0=post-fader, 1=pre-fx, 2=post-fx (deprecated), 3=post-fx
  ---
  --- I_AUTOMODE : int * : automation mode (-1=use track automode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch)
  ---
  --- I_SRCCHAN : int * : -1 for no audio send. Low 10 bits specify channel offset, and higher bits specify channel count. (srcchan>>10) == 0 for stereo, 1 for mono, 2 for 4 channel, 3 for 6 channel, etc.
  ---
  --- I_DSTCHAN : int * : low 10 bits are destination index, &1024 set to mix to mono.
  ---
  --- I_MIDIFLAGS : int * : low 5 bits=source channel 0=all, 1-16, next 5 bits=dest channel, 0=orig, 1-16=chan
  ---
  --- P_DESTTRACK : MediaTrack * : destination track, only applies for sends/recvs (read-only)
  ---
  --- P_SRCTRACK : MediaTrack * : source track, only applies for sends/recvs (read-only)
  ---
  --- P_ENV:<envchunkname : TrackEnvelope * : call with :<VOLENV, :<PANENV, etc appended (read-only)
  ---
  --- See CreateTrackSend, RemoveTrackSend, GetTrackNumSends.
  ---@param tr MediaTrack
  ---@param category integer
  ---@param sendidx integer
  ---@param parmname string
  ---@return number
  ---@deprecated
  GetTrackSendInfo_Value = function(tr, category, sendidx, parmname) end,

  --- ```
  --- boolean retval, string buf = reaper.GetTrackSendName(MediaTrack track, integer send_index)
  --- ```
  --- send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See GetTrackReceiveName.
  ---@param track MediaTrack
  ---@param send_index integer
  ---@return boolean, string
  GetTrackSendName = function(track, send_index) end,

  --- ```
  --- boolean retval, boolean mute = reaper.GetTrackSendUIMute(MediaTrack track, integer send_index)
  --- ```
  --- send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See GetTrackReceiveUIMute.
  ---@param track MediaTrack
  ---@param send_index integer
  ---@return boolean, boolean
  GetTrackSendUIMute = function(track, send_index) end,

  --- ```
  --- boolean retval, number volume, number pan = reaper.GetTrackSendUIVolPan(MediaTrack track, integer send_index)
  --- ```
  --- send_idx>=0 for hw ouputs, >=nb_of_hw_ouputs for sends. See GetTrackReceiveUIVolPan.
  ---@param track MediaTrack
  ---@param send_index integer
  ---@return boolean, number, number
  GetTrackSendUIVolPan = function(track, send_index) end,

  --- ```
  --- string retval, integer flags = reaper.GetTrackState(MediaTrack track)
  --- ```
  --- Gets track state, returns track name.
  ---
  --- flags will be set to:
  ---
  --- &1=folder
  ---
  --- &2=selected
  ---
  --- &4=has fx enabled
  ---
  --- &8=muted
  ---
  --- &16=soloed
  ---
  --- &32=SIP'd (with &16)
  ---
  --- &64=rec armed
  ---
  --- &128=rec monitoring on
  ---
  --- &256=rec monitoring auto
  ---
  --- &512=hide from TCP
  ---
  --- &1024=hide from MCP
  ---@param track MediaTrack
  ---@return string, integer
  GetTrackState = function(track) end,

  --- ```
  --- boolean retval, string str = reaper.GetTrackStateChunk(MediaTrack track, string str, boolean isundo)
  --- ```
  --- Gets the RPPXML state of a track, returns true if successful. Undo flag is a performance/caching hint.
  ---@param track MediaTrack
  ---@param str string
  ---@param isundo boolean
  ---@return boolean, string
  GetTrackStateChunk = function(track, str, isundo) end,

  --- ```
  --- boolean retval, boolean mute = reaper.GetTrackUIMute(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return boolean, boolean
  GetTrackUIMute = function(track) end,

  --- ```
  --- boolean retval, number pan1, number pan2, integer panmode = reaper.GetTrackUIPan(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return boolean, number, number, integer
  GetTrackUIPan = function(track) end,

  --- ```
  --- boolean retval, number volume, number pan = reaper.GetTrackUIVolPan(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return boolean, number, number
  GetTrackUIVolPan = function(track) end,

  --- ```
  --- integer audio_xrun, integer media_xrun, integer curtime = reaper.GetUnderrunTime()
  --- ```
  --- retrieves the last timestamps of audio xrun (yellow-flash, if available), media xrun (red-flash), and the current time stamp (all milliseconds)
  ---@return integer, integer, integer
  GetUnderrunTime = function() end,

  --- ```
  --- boolean retval, string filenameNeed4096 = reaper.GetUserFileNameForRead(string filenameNeed4096, string title, string defext)
  --- ```
  --- returns true if the user selected a valid file, false if the user canceled the dialog
  ---@param filenameNeed4096 string
  ---@param title string
  ---@param defext string
  ---@return boolean, string
  GetUserFileNameForRead = function(filenameNeed4096, title, defext) end,

  --- ```
  --- boolean retval, string retvals_csv = reaper.GetUserInputs(string title, integer num_inputs, string captions_csv, string retvals_csv)
  --- ```
  --- Get values from the user.
  ---
  --- If a caption begins with *, for example "*password", the edit field will not display the input text.
  ---
  --- Maximum fields is 16. Values are returned as a comma-separated string. Returns false if the user canceled the dialog. You can supply special extra information via additional caption fields: extrawidth=XXX to increase text field width, separator=X to use a different separator for returned fields.
  ---@param title string
  ---@param num_inputs integer
  ---@param captions_csv string
  ---@param retvals_csv string
  ---@return boolean, string
  GetUserInputs = function(title, num_inputs, captions_csv, retvals_csv) end,

  --- ```
  --- reaper.GoToMarker(ReaProject proj, integer marker_index, boolean use_timeline_order)
  --- ```
  --- Go to marker. If use_timeline_order==true, marker_index 1 refers to the first marker on the timeline.  If use_timeline_order==false, marker_index 1 refers to the first marker with the user-editable index of 1.
  ---@param proj ReaProject
  ---@param marker_index integer
  ---@param use_timeline_order boolean
  GoToMarker = function(proj, marker_index, use_timeline_order) end,

  --- ```
  --- reaper.GoToRegion(ReaProject proj, integer region_index, boolean use_timeline_order)
  --- ```
  --- Seek to region after current region finishes playing (smooth seek). If use_timeline_order==true, region_index 1 refers to the first region on the timeline.  If use_timeline_order==false, region_index 1 refers to the first region with the user-editable index of 1.
  ---@param proj ReaProject
  ---@param region_index integer
  ---@param use_timeline_order boolean
  GoToRegion = function(proj, region_index, use_timeline_order) end,

  --- ```
  --- integer retval, integer color = reaper.GR_SelectColor(HWND hwnd)
  --- ```
  --- Runs the system color chooser dialog.  Returns 0 if the user cancels the dialog.
  ---@param hwnd HWND
  ---@return integer, integer
  GR_SelectColor = function(hwnd) end,

  --- ```
  --- integer _ = reaper.GSC_mainwnd(integer t)
  --- ```
  --- this is just like win32 GetSysColor() but can have overrides.
  ---@param t integer
  ---@return integer
  GSC_mainwnd = function(t) end,

  --- ```
  --- string destNeed64 = reaper.guidToString(string gGUID, string destNeed64)
  --- ```
  --- dest should be at least 64 chars long to be safe
  ---@param gGUID string
  ---@param destNeed64 string
  ---@return string
  guidToString = function(gGUID, destNeed64) end,

  --- ```
  --- boolean _ = reaper.HasExtState(string section, string key)
  --- ```
  --- Returns true if there exists an extended state value for a specific section and key. See SetExtState, GetExtState, DeleteExtState.
  ---@param section string
  ---@param key string
  ---@return boolean
  HasExtState = function(section, key) end,

  --- ```
  --- string _ = reaper.HasTrackMIDIPrograms(integer track)
  --- ```
  --- returns name of track plugin that is supplying MIDI programs,or NULL if there is none
  ---@param track integer
  ---@return string
  HasTrackMIDIPrograms = function(track) end,

  --- ```
  --- string _ = reaper.HasTrackMIDIProgramsEx(ReaProject proj, MediaTrack track)
  --- ```
  --- returns name of track plugin that is supplying MIDI programs,or NULL if there is none
  ---@param proj ReaProject
  ---@param track MediaTrack
  ---@return string
  HasTrackMIDIProgramsEx = function(proj, track) end,

  --- ```
  --- reaper.Help_Set(string helpstring, boolean is_temporary_help)
  --- ```
  ---@param helpstring string
  ---@param is_temporary_help boolean
  Help_Set = function(helpstring, is_temporary_help) end,

  --- ```
  --- string out = reaper.image_resolve_fn(string _in, string out)
  --- ```
  ---@param _in string
  ---@param out string
  ---@return string
  image_resolve_fn = function(_in, out) end,

  --- ```
  --- integer _ = reaper.InsertAutomationItem(TrackEnvelope env, integer pool_id, number position, number length)
  --- ```
  --- Insert a new automation item. pool_id < 0 collects existing envelope points into the automation item; if pool_id is >= 0 the automation item will be a new instance of that pool (which will be created as an empty instance if it does not exist). Returns the index of the item, suitable for passing to other automation item API functions. See GetSetAutomationItemInfo.
  ---@param env TrackEnvelope
  ---@param pool_id integer
  ---@param position number
  ---@param length number
  ---@return integer
  InsertAutomationItem = function(env, pool_id, position, length) end,

  --- ```
  --- boolean _ = reaper.InsertEnvelopePoint(TrackEnvelope envelope, number time, number value, integer shape, number tension, boolean selected, optional boolean noSortIn)
  --- ```
  --- Insert an envelope point. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done. See InsertEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param time number
  ---@param value number
  ---@param shape integer
  ---@param tension number
  ---@param selected boolean
  ---@param noSortIn? boolean
  ---@return boolean
  InsertEnvelopePoint = function(envelope, time, value, shape, tension, selected, noSortIn) end,

  --- ```
  --- boolean _ = reaper.InsertEnvelopePointEx(TrackEnvelope envelope, integer autoitem_idx, number time, number value, integer shape, number tension, boolean selected, optional boolean noSortIn)
  --- ```
  --- Insert an envelope point. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done.
  ---
  --- autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---
  --- For automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
  ---
  --- even if the automation item is trimmed so that not all points are visible.
  ---
  --- Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
  ---
  --- See CountEnvelopePointsEx, GetEnvelopePointEx, SetEnvelopePointEx, DeleteEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@param time number
  ---@param value number
  ---@param shape integer
  ---@param tension number
  ---@param selected boolean
  ---@param noSortIn? boolean
  ---@return boolean
  InsertEnvelopePointEx = function(envelope, autoitem_idx, time, value, shape, tension, selected, noSortIn) end,

  --- ```
  --- integer _ = reaper.InsertMedia(string file, integer mode)
  --- ```
  --- mode: 0=add to current track, 1=add new track, 3=add to selected items as takes, &4=stretch/loop to fit time sel, &8=try to match tempo 1x, &16=try to match tempo 0.5x, &32=try to match tempo 2x, &64=don't preserve pitch when matching tempo, &128=no loop/section if startpct/endpct set, &256=force loop regardless of global preference for looping imported items, &512=use high word as absolute track index if mode&3==0 or mode&2048, &1024=insert into reasamplomatic on a new track (add 1 to insert on last selected track), &2048=insert into open reasamplomatic instance (add 512 to use high word as absolute track index), &4096=move to source preferred position (BWF start offset), &8192=reverse
  ---@param file string
  ---@param mode integer
  ---@return integer
  InsertMedia = function(file, mode) end,

  --- ```
  --- integer _ = reaper.InsertMediaSection(string file, integer mode, number startpct, number endpct, number pitchshift)
  --- ```
  --- See InsertMedia.
  ---@param file string
  ---@param mode integer
  ---@param startpct number
  ---@param endpct number
  ---@param pitchshift number
  ---@return integer
  InsertMediaSection = function(file, mode, startpct, endpct, pitchshift) end,

  --- ```
  --- reaper.InsertTrackAtIndex(integer idx, boolean wantDefaults)
  --- ```
  --- inserts a track at idx,of course this will be clamped to 0..GetNumTracks(). wantDefaults=TRUE for default envelopes/FX,otherwise no enabled fx/env
  ---@param idx integer
  ---@param wantDefaults boolean
  InsertTrackAtIndex = function(idx, wantDefaults) end,

  --- ```
  --- boolean _ = reaper.IsMediaExtension(string ext, boolean wantOthers)
  --- ```
  --- Tests a file extension (i.e. "wav" or "mid") to see if it's a media extension.
  ---
  --- If wantOthers is set, then "RPP", "TXT" and other project-type formats will also pass.
  ---@param ext string
  ---@param wantOthers boolean
  ---@return boolean
  IsMediaExtension = function(ext, wantOthers) end,

  --- ```
  --- boolean _ = reaper.IsMediaItemSelected(MediaItem item)
  --- ```
  ---@param item MediaItem
  ---@return boolean
  IsMediaItemSelected = function(item) end,

  --- ```
  --- integer _ = reaper.IsProjectDirty(ReaProject proj)
  --- ```
  --- Is the project dirty (needing save)? Always returns 0 if 'undo/prompt to save' is disabled in preferences.
  ---@param proj ReaProject
  ---@return integer
  IsProjectDirty = function(proj) end,

  --- ```
  --- boolean _ = reaper.IsTrackSelected(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return boolean
  IsTrackSelected = function(track) end,

  --- ```
  --- boolean _ = reaper.IsTrackVisible(MediaTrack track, boolean mixer)
  --- ```
  --- If mixer==true, returns true if the track is visible in the mixer.  If mixer==false, returns true if the track is visible in the track control panel.
  ---@param track MediaTrack
  ---@param mixer boolean
  ---@return boolean
  IsTrackVisible = function(track, mixer) end,

  --- ```
  --- joystick_device _ = reaper.joystick_create(string guidGUID)
  --- ```
  --- creates a joystick device
  ---@param guidGUID string
  ---@return joystick_device
  joystick_create = function(guidGUID) end,

  --- ```
  --- reaper.joystick_destroy(joystick_device device)
  --- ```
  --- destroys a joystick device
  ---@param device joystick_device
  joystick_destroy = function(device) end,

  --- ```
  --- string retval, optional string namestr = reaper.joystick_enum(integer index)
  --- ```
  --- enumerates installed devices, returns GUID as a string
  ---@param index integer
  ---@return string, string
  joystick_enum = function(index) end,

  --- ```
  --- number _ = reaper.joystick_getaxis(joystick_device dev, integer axis)
  --- ```
  --- returns axis value (-1..1)
  ---@param dev joystick_device
  ---@param axis integer
  ---@return number
  joystick_getaxis = function(dev, axis) end,

  --- ```
  --- integer _ = reaper.joystick_getbuttonmask(joystick_device dev)
  --- ```
  --- returns button pressed mask, 1=first button, 2=second...
  ---@param dev joystick_device
  ---@return integer
  joystick_getbuttonmask = function(dev) end,

  --- ```
  --- integer retval, optional integer axes, optional integer povs = reaper.joystick_getinfo(joystick_device dev)
  --- ```
  --- returns button count
  ---@param dev joystick_device
  ---@return integer, integer, integer
  joystick_getinfo = function(dev) end,

  --- ```
  --- number _ = reaper.joystick_getpov(joystick_device dev, integer pov)
  --- ```
  --- returns POV value (usually 0..655.35, or 655.35 on error)
  ---@param dev joystick_device
  ---@param pov integer
  ---@return number
  joystick_getpov = function(dev, pov) end,

  --- ```
  --- boolean _ = reaper.joystick_update(joystick_device dev)
  --- ```
  --- Updates joystick state from hardware, returns true if successful (joystick_get* will not be valid until joystick_update() is called successfully)
  ---@param dev joystick_device
  ---@return boolean
  joystick_update = function(dev) end,

  --- ```
  --- integer retval, string name = reaper.kbd_enumerateActions(KbdSectionInfo section, integer idx)
  --- ```
  ---@param section KbdSectionInfo
  ---@param idx integer
  ---@return integer, string
  kbd_enumerateActions = function(section, idx) end,

  --- ```
  --- string _ = reaper.kbd_getTextFromCmd(integer cmd, KbdSectionInfo section)
  --- ```
  ---@param cmd integer
  ---@param section KbdSectionInfo
  ---@return string
  kbd_getTextFromCmd = function(cmd, section) end,

  --- ```
  --- boolean retval, integer pX1, integer pY1, integer pX2, integer pY2 = reaper.LICE_ClipLine(integer pX1, integer pY1, integer pX2, integer pY2, integer xLo, integer yLo, integer xHi, integer yHi)
  --- ```
  --- Returns false if the line is entirely offscreen.
  ---@param pX1 integer
  ---@param pY1 integer
  ---@param pX2 integer
  ---@param pY2 integer
  ---@param xLo integer
  ---@param yLo integer
  ---@param xHi integer
  ---@param yHi integer
  ---@return boolean, integer, integer, integer, integer
  LICE_ClipLine = function(pX1, pY1, pX2, pY2, xLo, yLo, xHi, yHi) end,

  --- ```
  --- string _ = reaper.LocalizeString(string src_string, string section, integer flags)
  --- ```
  --- Returns a localized version of src_string, in section section. flags can have 1 set to only localize if sprintf-style formatting matches the original.
  ---@param src_string string
  ---@param section string
  ---@param flags integer
  ---@return string
  LocalizeString = function(src_string, section, flags) end,

  --- ```
  --- boolean _ = reaper.Loop_OnArrow(ReaProject project, integer direction)
  --- ```
  --- Move the loop selection left or right. Returns true if snap is enabled.
  ---@param project ReaProject
  ---@param direction integer
  ---@return boolean
  Loop_OnArrow = function(project, direction) end,

  --- ```
  --- reaper.Main_OnCommand(integer command, integer flag)
  --- ```
  --- See Main_OnCommandEx.
  ---@param command integer
  ---@param flag integer
  Main_OnCommand = function(command, flag) end,

  --- ```
  --- reaper.Main_OnCommandEx(integer command, integer flag, ReaProject proj)
  --- ```
  --- Performs an action belonging to the main action section. To perform non-native actions (ReaScripts, custom or extension plugins' actions) safely, see NamedCommandLookup().
  ---@param command integer
  ---@param flag integer
  ---@param proj ReaProject
  Main_OnCommandEx = function(command, flag, proj) end,

  --- ```
  --- reaper.Main_openProject(string name)
  --- ```
  --- opens a project. will prompt the user to save unless name is prefixed with 'noprompt:'. If name is prefixed with 'template:', project file will be loaded as a template.
  ---
  --- If passed a .RTrackTemplate file, adds the template to the existing project.
  ---@param name string
  Main_openProject = function(name) end,

  --- ```
  --- reaper.Main_SaveProject(ReaProject proj, boolean forceSaveAsIn)
  --- ```
  --- Save the project.
  ---@param proj ReaProject
  ---@param forceSaveAsIn boolean
  Main_SaveProject = function(proj, forceSaveAsIn) end,

  --- ```
  --- reaper.Main_SaveProjectEx(ReaProject proj, string filename, integer options)
  --- ```
  --- Save the project. options: &1=save selected tracks as track template, &2=include media with track template, &4=include envelopes with track template. See Main_openProject, Main_SaveProject.
  ---@param proj ReaProject
  ---@param filename string
  ---@param options integer
  Main_SaveProjectEx = function(proj, filename, options) end,

  --- ```
  --- reaper.Main_UpdateLoopInfo(integer ignoremask)
  --- ```
  ---@param ignoremask integer
  Main_UpdateLoopInfo = function(ignoremask) end,

  --- ```
  --- reaper.MarkProjectDirty(ReaProject proj)
  --- ```
  --- Marks project as dirty (needing save) if 'undo/prompt to save' is enabled in preferences.
  ---@param proj ReaProject
  MarkProjectDirty = function(proj) end,

  --- ```
  --- reaper.MarkTrackItemsDirty(MediaTrack track, MediaItem item)
  --- ```
  --- If track is supplied, item is ignored
  ---@param track MediaTrack
  ---@param item MediaItem
  MarkTrackItemsDirty = function(track, item) end,

  --- ```
  --- number _ = reaper.Master_GetPlayRate(ReaProject project)
  --- ```
  ---@param project ReaProject
  ---@return number
  Master_GetPlayRate = function(project) end,

  --- ```
  --- number _ = reaper.Master_GetPlayRateAtTime(number time_s, ReaProject proj)
  --- ```
  ---@param time_s number
  ---@param proj ReaProject
  ---@return number
  Master_GetPlayRateAtTime = function(time_s, proj) end,

  --- ```
  --- number _ = reaper.Master_GetTempo()
  --- ```
  ---@return number
  Master_GetTempo = function() end,

  --- ```
  --- number _ = reaper.Master_NormalizePlayRate(number playrate, boolean isnormalized)
  --- ```
  --- Convert play rate to/from a value between 0 and 1, representing the position on the project playrate slider.
  ---@param playrate number
  ---@param isnormalized boolean
  ---@return number
  Master_NormalizePlayRate = function(playrate, isnormalized) end,

  --- ```
  --- number _ = reaper.Master_NormalizeTempo(number bpm, boolean isnormalized)
  --- ```
  --- Convert the tempo to/from a value between 0 and 1, representing bpm in the range of 40-296 bpm.
  ---@param bpm number
  ---@param isnormalized boolean
  ---@return number
  Master_NormalizeTempo = function(bpm, isnormalized) end,

  --- ```
  --- integer _ = reaper.MB(string msg, string title, integer type)
  --- ```
  --- type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL : ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO
  ---@param msg string
  ---@param title string
  ---@param type integer
  ---@return integer
  MB = function(msg, title, type) end,

  --- ```
  --- integer _ = reaper.MediaItemDescendsFromTrack(MediaItem item, MediaTrack track)
  --- ```
  --- Returns 1 if the track holds the item, 2 if the track is a folder containing the track that holds the item, etc.
  ---@param item MediaItem
  ---@param track MediaTrack
  ---@return integer
  MediaItemDescendsFromTrack = function(item, track) end,

  --- ```
  --- integer retval, integer notecnt, integer ccevtcnt, integer textsyxevtcnt = reaper.MIDI_CountEvts(MediaItem_Take take)
  --- ```
  --- Count the number of notes, CC events, and text/sysex events in a given MIDI item.
  ---@param take MediaItem_Take
  ---@return integer, integer, integer, integer
  MIDI_CountEvts = function(take) end,

  --- ```
  --- boolean _ = reaper.MIDI_DeleteCC(MediaItem_Take take, integer ccidx)
  --- ```
  --- Delete a MIDI CC event.
  ---@param take MediaItem_Take
  ---@param ccidx integer
  ---@return boolean
  MIDI_DeleteCC = function(take, ccidx) end,

  --- ```
  --- boolean _ = reaper.MIDI_DeleteEvt(MediaItem_Take take, integer evtidx)
  --- ```
  --- Delete a MIDI event.
  ---@param take MediaItem_Take
  ---@param evtidx integer
  ---@return boolean
  MIDI_DeleteEvt = function(take, evtidx) end,

  --- ```
  --- boolean _ = reaper.MIDI_DeleteNote(MediaItem_Take take, integer noteidx)
  --- ```
  --- Delete a MIDI note.
  ---@param take MediaItem_Take
  ---@param noteidx integer
  ---@return boolean
  MIDI_DeleteNote = function(take, noteidx) end,

  --- ```
  --- boolean _ = reaper.MIDI_DeleteTextSysexEvt(MediaItem_Take take, integer textsyxevtidx)
  --- ```
  --- Delete a MIDI text or sysex event.
  ---@param take MediaItem_Take
  ---@param textsyxevtidx integer
  ---@return boolean
  MIDI_DeleteTextSysexEvt = function(take, textsyxevtidx) end,

  --- ```
  --- reaper.MIDI_DisableSort(MediaItem_Take take)
  --- ```
  --- Disable sorting for all MIDI insert, delete, get and set functions, until MIDI_Sort is called.
  ---@param take MediaItem_Take
  MIDI_DisableSort = function(take) end,

  --- ```
  --- integer _ = reaper.MIDI_EnumSelCC(MediaItem_Take take, integer ccidx)
  --- ```
  --- Returns the index of the next selected MIDI CC event after ccidx (-1 if there are no more selected events).
  ---@param take MediaItem_Take
  ---@param ccidx integer
  ---@return integer
  MIDI_EnumSelCC = function(take, ccidx) end,

  --- ```
  --- integer _ = reaper.MIDI_EnumSelEvts(MediaItem_Take take, integer evtidx)
  --- ```
  --- Returns the index of the next selected MIDI event after evtidx (-1 if there are no more selected events).
  ---@param take MediaItem_Take
  ---@param evtidx integer
  ---@return integer
  MIDI_EnumSelEvts = function(take, evtidx) end,

  --- ```
  --- integer _ = reaper.MIDI_EnumSelNotes(MediaItem_Take take, integer noteidx)
  --- ```
  --- Returns the index of the next selected MIDI note after noteidx (-1 if there are no more selected events).
  ---@param take MediaItem_Take
  ---@param noteidx integer
  ---@return integer
  MIDI_EnumSelNotes = function(take, noteidx) end,

  --- ```
  --- integer _ = reaper.MIDI_EnumSelTextSysexEvts(MediaItem_Take take, integer textsyxidx)
  --- ```
  --- Returns the index of the next selected MIDI text/sysex event after textsyxidx (-1 if there are no more selected events).
  ---@param take MediaItem_Take
  ---@param textsyxidx integer
  ---@return integer
  MIDI_EnumSelTextSysexEvts = function(take, textsyxidx) end,

  --- ```
  --- boolean retval, string buf = reaper.MIDI_GetAllEvts(MediaItem_Take take)
  --- ```
  --- Get all MIDI data. MIDI buffer is returned as a list of { int offset, char flag, int msglen, unsigned char msg[] }.
  ---
  --- offset: MIDI ticks from previous event
  ---
  --- flag: &1=selected &2=muted
  ---
  --- flag high 4 bits for CC shape: &16=linear, &32=slow start/end, &16|32=fast start, &64=fast end, &64|16=bezier
  ---
  --- msg: the MIDI message.
  ---
  --- A meta-event of type 0xF followed by 'CCBZ ' and 5 more bytes represents bezier curve data for the previous MIDI event: 1 byte for the bezier type (usually 0) and 4 bytes for the bezier tension as a float.
  ---
  --- For tick intervals longer than a 32 bit word can represent, zero-length meta events may be placed between valid events.
  ---
  --- See MIDI_SetAllEvts.
  ---@param take MediaItem_Take
  ---@return boolean, string
  MIDI_GetAllEvts = function(take) end,

  --- ```
  --- boolean retval, boolean selected, boolean muted, number ppqpos, integer chanmsg, integer chan, integer msg2, integer msg3 = reaper.MIDI_GetCC(MediaItem_Take take, integer ccidx)
  --- ```
  --- Get MIDI CC event properties.
  ---@param take MediaItem_Take
  ---@param ccidx integer
  ---@return boolean, boolean, boolean, number, integer, integer, integer, integer
  MIDI_GetCC = function(take, ccidx) end,

  --- ```
  --- boolean retval, integer shape, number beztension = reaper.MIDI_GetCCShape(MediaItem_Take take, integer ccidx)
  --- ```
  --- Get CC shape and bezier tension. See MIDI_GetCC, MIDI_SetCCShape
  ---@param take MediaItem_Take
  ---@param ccidx integer
  ---@return boolean, integer, number
  MIDI_GetCCShape = function(take, ccidx) end,

  --- ```
  --- boolean retval, boolean selected, boolean muted, number ppqpos, string msg = reaper.MIDI_GetEvt(MediaItem_Take take, integer evtidx)
  --- ```
  --- Get MIDI event properties.
  ---@param take MediaItem_Take
  ---@param evtidx integer
  ---@return boolean, boolean, boolean, number, string
  MIDI_GetEvt = function(take, evtidx) end,

  --- ```
  --- number retval, optional number swing, optional number noteLen = reaper.MIDI_GetGrid(MediaItem_Take take)
  --- ```
  --- Returns the most recent MIDI editor grid size for this MIDI take, in QN. Swing is between 0 and 1. Note length is 0 if it follows the grid size.
  ---@param take MediaItem_Take
  ---@return number, number, number
  MIDI_GetGrid = function(take) end,

  --- ```
  --- boolean retval, string hash = reaper.MIDI_GetHash(MediaItem_Take take, boolean notesonly)
  --- ```
  --- Get a string that only changes when the MIDI data changes. If notesonly==true, then the string changes only when the MIDI notes change. See MIDI_GetTrackHash
  ---@param take MediaItem_Take
  ---@param notesonly boolean
  ---@return boolean, string
  MIDI_GetHash = function(take, notesonly) end,

  --- ```
  --- boolean retval, boolean selected, boolean muted, number startppqpos, number endppqpos, integer chan, integer pitch, integer vel = reaper.MIDI_GetNote(MediaItem_Take take, integer noteidx)
  --- ```
  --- Get MIDI note properties.
  ---@param take MediaItem_Take
  ---@param noteidx integer
  ---@return boolean, boolean, boolean, number, number, integer, integer, integer
  MIDI_GetNote = function(take, noteidx) end,

  --- ```
  --- number _ = reaper.MIDI_GetPPQPos_EndOfMeasure(MediaItem_Take take, number ppqpos)
  --- ```
  --- Returns the MIDI tick (ppq) position corresponding to the end of the measure.
  ---@param take MediaItem_Take
  ---@param ppqpos number
  ---@return number
  MIDI_GetPPQPos_EndOfMeasure = function(take, ppqpos) end,

  --- ```
  --- number _ = reaper.MIDI_GetPPQPos_StartOfMeasure(MediaItem_Take take, number ppqpos)
  --- ```
  --- Returns the MIDI tick (ppq) position corresponding to the start of the measure.
  ---@param take MediaItem_Take
  ---@param ppqpos number
  ---@return number
  MIDI_GetPPQPos_StartOfMeasure = function(take, ppqpos) end,

  --- ```
  --- number _ = reaper.MIDI_GetPPQPosFromProjQN(MediaItem_Take take, number projqn)
  --- ```
  --- Returns the MIDI tick (ppq) position corresponding to a specific project time in quarter notes.
  ---@param take MediaItem_Take
  ---@param projqn number
  ---@return number
  MIDI_GetPPQPosFromProjQN = function(take, projqn) end,

  --- ```
  --- number _ = reaper.MIDI_GetPPQPosFromProjTime(MediaItem_Take take, number projtime)
  --- ```
  --- Returns the MIDI tick (ppq) position corresponding to a specific project time in seconds.
  ---@param take MediaItem_Take
  ---@param projtime number
  ---@return number
  MIDI_GetPPQPosFromProjTime = function(take, projtime) end,

  --- ```
  --- number _ = reaper.MIDI_GetProjQNFromPPQPos(MediaItem_Take take, number ppqpos)
  --- ```
  --- Returns the project time in quarter notes corresponding to a specific MIDI tick (ppq) position.
  ---@param take MediaItem_Take
  ---@param ppqpos number
  ---@return number
  MIDI_GetProjQNFromPPQPos = function(take, ppqpos) end,

  --- ```
  --- number _ = reaper.MIDI_GetProjTimeFromPPQPos(MediaItem_Take take, number ppqpos)
  --- ```
  --- Returns the project time in seconds corresponding to a specific MIDI tick (ppq) position.
  ---@param take MediaItem_Take
  ---@param ppqpos number
  ---@return number
  MIDI_GetProjTimeFromPPQPos = function(take, ppqpos) end,

  --- ```
  --- integer retval, string buf, integer ts, integer devIdx, number projPos, integer projLoopCnt = reaper.MIDI_GetRecentInputEvent(integer idx)
  --- ```
  --- Gets a recent MIDI input event from the global history. idx=0 for the most recent event, which also latches to the latest MIDI event state (to get a more recent list, calling with idx=0 is necessary). idx=1 next most recent event, returns a non-zero sequence number for the event, or zero if no more events. tsOut will be set to the timestamp in samples relative to the current position (0 is current, -48000 is one second ago, etc). devIdxOut will have the low 16 bits set to the input device index, and 0x10000 will be set if device was enabled only for control. projPosOut will be set to project position in seconds if project was playing back at time of event, otherwise -1. Large SysEx events will not be included in this event list.
  ---@param idx integer
  ---@return integer, string, integer, integer, number, integer
  MIDI_GetRecentInputEvent = function(idx) end,

  --- ```
  --- boolean retval, integer root, integer scale, string name = reaper.MIDI_GetScale(MediaItem_Take take)
  --- ```
  --- Get the active scale in the media source, if any. root 0=C, 1=C#, etc. scale &0x1=root, &0x2=minor 2nd, &0x4=major 2nd, &0x8=minor 3rd, &0xF=fourth, etc.
  ---@param take MediaItem_Take
  ---@return boolean, integer, integer, string
  MIDI_GetScale = function(take) end,

  --- ```
  --- boolean retval, optional boolean selected, optional boolean muted, optional number ppqpos, optional integer type, optional string msg = reaper.MIDI_GetTextSysexEvt(MediaItem_Take take, integer textsyxevtidx, optional boolean selected, optional boolean muted, optional number ppqpos, optional integer type, optional string msg)
  --- ```
  --- Get MIDI meta-event properties. Allowable types are -1:sysex (msg should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation event. For all other meta-messages, type is returned as -2 and msg returned as all zeroes. See MIDI_GetEvt.
  ---@param take MediaItem_Take
  ---@param textsyxevtidx integer
  ---@param selected? boolean
  ---@param muted? boolean
  ---@param ppqpos? number
  ---@param type? integer
  ---@param msg? string
  ---@return boolean, boolean, boolean, number, integer, string
  MIDI_GetTextSysexEvt = function(take, textsyxevtidx, selected, muted, ppqpos, type, msg) end,

  --- ```
  --- boolean retval, string hash = reaper.MIDI_GetTrackHash(MediaTrack track, boolean notesonly)
  --- ```
  --- Get a string that only changes when the MIDI data changes. If notesonly==true, then the string changes only when the MIDI notes change. See MIDI_GetHash
  ---@param track MediaTrack
  ---@param notesonly boolean
  ---@return boolean, string
  MIDI_GetTrackHash = function(track, notesonly) end,

  --- ```
  --- reaper.midi_init(integer force_reinit_input, integer force_reinit_output)
  --- ```
  --- Opens MIDI devices as configured in preferences. force_reinit_input and force_reinit_output force a particular device index to close/re-open (pass -1 to not force any devices to reopen).
  ---@param force_reinit_input integer
  ---@param force_reinit_output integer
  midi_init = function(force_reinit_input, force_reinit_output) end,

  --- ```
  --- boolean _ = reaper.MIDI_InsertCC(MediaItem_Take take, boolean selected, boolean muted, number ppqpos, integer chanmsg, integer chan, integer msg2, integer msg3)
  --- ```
  --- Insert a new MIDI CC event.
  ---@param take MediaItem_Take
  ---@param selected boolean
  ---@param muted boolean
  ---@param ppqpos number
  ---@param chanmsg integer
  ---@param chan integer
  ---@param msg2 integer
  ---@param msg3 integer
  ---@return boolean
  MIDI_InsertCC = function(take, selected, muted, ppqpos, chanmsg, chan, msg2, msg3) end,

  --- ```
  --- boolean _ = reaper.MIDI_InsertEvt(MediaItem_Take take, boolean selected, boolean muted, number ppqpos, string bytestr)
  --- ```
  --- Insert a new MIDI event.
  ---@param take MediaItem_Take
  ---@param selected boolean
  ---@param muted boolean
  ---@param ppqpos number
  ---@param bytestr string
  ---@return boolean
  MIDI_InsertEvt = function(take, selected, muted, ppqpos, bytestr) end,

  --- ```
  --- boolean _ = reaper.MIDI_InsertNote(MediaItem_Take take, boolean selected, boolean muted, number startppqpos, number endppqpos, integer chan, integer pitch, integer vel, optional boolean noSortIn)
  --- ```
  --- Insert a new MIDI note. Set noSort if inserting multiple events, then call MIDI_Sort when done.
  ---@param take MediaItem_Take
  ---@param selected boolean
  ---@param muted boolean
  ---@param startppqpos number
  ---@param endppqpos number
  ---@param chan integer
  ---@param pitch integer
  ---@param vel integer
  ---@param noSortIn? boolean
  ---@return boolean
  MIDI_InsertNote = function(take, selected, muted, startppqpos, endppqpos, chan, pitch, vel, noSortIn) end,

  --- ```
  --- boolean _ = reaper.MIDI_InsertTextSysexEvt(MediaItem_Take take, boolean selected, boolean muted, number ppqpos, integer type, string bytestr)
  --- ```
  --- Insert a new MIDI text or sysex event. Allowable types are -1:sysex (msg should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation event.
  ---@param take MediaItem_Take
  ---@param selected boolean
  ---@param muted boolean
  ---@param ppqpos number
  ---@param type integer
  ---@param bytestr string
  ---@return boolean
  MIDI_InsertTextSysexEvt = function(take, selected, muted, ppqpos, type, bytestr) end,

  --- ```
  --- reaper.midi_reinit()
  --- ```
  --- Reset (close and re-open) all MIDI devices
  midi_reinit = function() end,

  --- ```
  --- reaper.MIDI_SelectAll(MediaItem_Take take, boolean select)
  --- ```
  --- Select or deselect all MIDI content.
  ---@param take MediaItem_Take
  ---@param select boolean
  MIDI_SelectAll = function(take, select) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetAllEvts(MediaItem_Take take, string buf)
  --- ```
  --- Set all MIDI data. MIDI buffer is passed in as a list of { int offset, char flag, int msglen, unsigned char msg[] }.
  ---
  --- offset: MIDI ticks from previous event
  ---
  --- flag: &1=selected &2=muted
  ---
  --- flag high 4 bits for CC shape: &16=linear, &32=slow start/end, &16|32=fast start, &64=fast end, &64|16=bezier
  ---
  --- msg: the MIDI message.
  ---
  --- A meta-event of type 0xF followed by 'CCBZ ' and 5 more bytes represents bezier curve data for the previous MIDI event: 1 byte for the bezier type (usually 0) and 4 bytes for the bezier tension as a float.
  ---
  --- For tick intervals longer than a 32 bit word can represent, zero-length meta events may be placed between valid events.
  ---
  --- See MIDI_GetAllEvts.
  ---@param take MediaItem_Take
  ---@param buf string
  ---@return boolean
  MIDI_SetAllEvts = function(take, buf) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetCC(MediaItem_Take take, integer ccidx, optional boolean selectedIn, optional boolean mutedIn, optional number ppqposIn, optional integer chanmsgIn, optional integer chanIn, optional integer msg2In, optional integer msg3In, optional boolean noSortIn)
  --- ```
  --- Set MIDI CC event properties. Properties passed as NULL will not be set. set noSort if setting multiple events, then call MIDI_Sort when done.
  ---@param take MediaItem_Take
  ---@param ccidx integer
  ---@param selectedIn? boolean
  ---@param mutedIn? boolean
  ---@param ppqposIn? number
  ---@param chanmsgIn? integer
  ---@param chanIn? integer
  ---@param msg2In? integer
  ---@param msg3In? integer
  ---@param noSortIn? boolean
  ---@return boolean
  MIDI_SetCC = function(take, ccidx, selectedIn, mutedIn, ppqposIn, chanmsgIn, chanIn, msg2In, msg3In, noSortIn) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetCCShape(MediaItem_Take take, integer ccidx, integer shape, number beztension, optional boolean noSortIn)
  --- ```
  --- Set CC shape and bezier tension. set noSort if setting multiple events, then call MIDI_Sort when done. See MIDI_SetCC, MIDI_GetCCShape
  ---@param take MediaItem_Take
  ---@param ccidx integer
  ---@param shape integer
  ---@param beztension number
  ---@param noSortIn? boolean
  ---@return boolean
  MIDI_SetCCShape = function(take, ccidx, shape, beztension, noSortIn) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetEvt(MediaItem_Take take, integer evtidx, optional boolean selectedIn, optional boolean mutedIn, optional number ppqposIn, optional string msg, optional boolean noSortIn)
  --- ```
  --- Set MIDI event properties. Properties passed as NULL will not be set.  set noSort if setting multiple events, then call MIDI_Sort when done.
  ---@param take MediaItem_Take
  ---@param evtidx integer
  ---@param selectedIn? boolean
  ---@param mutedIn? boolean
  ---@param ppqposIn? number
  ---@param msg? string
  ---@param noSortIn? boolean
  ---@return boolean
  MIDI_SetEvt = function(take, evtidx, selectedIn, mutedIn, ppqposIn, msg, noSortIn) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetItemExtents(MediaItem item, number startQN, number endQN)
  --- ```
  --- Set the start/end positions of a media item that contains a MIDI take.
  ---@param item MediaItem
  ---@param startQN number
  ---@param endQN number
  ---@return boolean
  MIDI_SetItemExtents = function(item, startQN, endQN) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetNote(MediaItem_Take take, integer noteidx, optional boolean selectedIn, optional boolean mutedIn, optional number startppqposIn, optional number endppqposIn, optional integer chanIn, optional integer pitchIn, optional integer velIn, optional boolean noSortIn)
  --- ```
  --- Set MIDI note properties. Properties passed as NULL (or negative values) will not be set. Set noSort if setting multiple events, then call MIDI_Sort when done. Setting multiple note start positions at once is done more safely by deleting and re-inserting the notes.
  ---@param take MediaItem_Take
  ---@param noteidx integer
  ---@param selectedIn? boolean
  ---@param mutedIn? boolean
  ---@param startppqposIn? number
  ---@param endppqposIn? number
  ---@param chanIn? integer
  ---@param pitchIn? integer
  ---@param velIn? integer
  ---@param noSortIn? boolean
  ---@return boolean
  MIDI_SetNote = function(take, noteidx, selectedIn, mutedIn, startppqposIn, endppqposIn, chanIn, pitchIn, velIn,
                          noSortIn) end,

  --- ```
  --- boolean _ = reaper.MIDI_SetTextSysexEvt(MediaItem_Take take, integer textsyxevtidx, optional boolean selectedIn, optional boolean mutedIn, optional number ppqposIn, optional integer typeIn, optional string msg, optional boolean noSortIn)
  --- ```
  --- Set MIDI text or sysex event properties. Properties passed as NULL will not be set. Allowable types are -1:sysex (msg should not include bounding F0..F7), 1-14:MIDI text event types, 15=REAPER notation event. set noSort if setting multiple events, then call MIDI_Sort when done.
  ---@param take MediaItem_Take
  ---@param textsyxevtidx integer
  ---@param selectedIn? boolean
  ---@param mutedIn? boolean
  ---@param ppqposIn? number
  ---@param typeIn? integer
  ---@param msg? string
  ---@param noSortIn? boolean
  ---@return boolean
  MIDI_SetTextSysexEvt = function(take, textsyxevtidx, selectedIn, mutedIn, ppqposIn, typeIn, msg, noSortIn) end,

  --- ```
  --- reaper.MIDI_Sort(MediaItem_Take take)
  --- ```
  --- Sort MIDI events after multiple calls to MIDI_SetNote, MIDI_SetCC, etc.
  ---@param take MediaItem_Take
  MIDI_Sort = function(take) end,

  --- ```
  --- MediaItem_Take _ = reaper.MIDIEditor_EnumTakes(HWND midieditor, integer takeindex, boolean editable_only)
  --- ```
  --- list the takes that are currently being edited in this MIDI editor, starting with the active take. See MIDIEditor_GetTake
  ---@param midieditor HWND
  ---@param takeindex integer
  ---@param editable_only boolean
  ---@return MediaItem_Take
  MIDIEditor_EnumTakes = function(midieditor, takeindex, editable_only) end,

  --- ```
  --- HWND _ = reaper.MIDIEditor_GetActive()
  --- ```
  --- get a pointer to the focused MIDI editor window
  ---
  --- see MIDIEditor_GetMode, MIDIEditor_OnCommand
  ---@return HWND
  MIDIEditor_GetActive = function() end,

  --- ```
  --- integer _ = reaper.MIDIEditor_GetMode(HWND midieditor)
  --- ```
  --- get the mode of a MIDI editor (0=piano roll, 1=event list, -1=invalid editor)
  ---
  --- see MIDIEditor_GetActive, MIDIEditor_OnCommand
  ---@param midieditor HWND
  ---@return integer
  MIDIEditor_GetMode = function(midieditor) end,

  --- ```
  --- integer _ = reaper.MIDIEditor_GetSetting_int(HWND midieditor, string setting_desc)
  --- ```
  --- Get settings from a MIDI editor. setting_desc can be:
  ---
  --- snap_enabled: returns 0 or 1
  ---
  --- active_note_row: returns 0-127
  ---
  --- last_clicked_cc_lane: returns 0-127=CC, 0x100|(0-31)=14-bit CC, 0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure, 0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207=off velocity, 0x208=notation events, 0x210=media item lane
  ---
  --- default_note_vel: returns 0-127
  ---
  --- default_note_chan: returns 0-15
  ---
  --- default_note_len: returns default length in MIDI ticks
  ---
  --- scale_enabled: returns 0-1
  ---
  --- scale_root: returns 0-12 (0=C)
  ---
  --- list_cnt: if viewing list view, returns event count
  ---
  --- if setting_desc is unsupported, the function returns -1.
  ---
  --- See MIDIEditor_SetSetting_int, MIDIEditor_GetActive, MIDIEditor_GetSetting_str
  ---@param midieditor HWND
  ---@param setting_desc string
  ---@return integer
  MIDIEditor_GetSetting_int = function(midieditor, setting_desc) end,

  --- ```
  --- boolean retval, string buf = reaper.MIDIEditor_GetSetting_str(HWND midieditor, string setting_desc)
  --- ```
  --- Get settings from a MIDI editor. setting_desc can be:
  ---
  --- last_clicked_cc_lane: returns text description ("velocity", "pitch", etc)
  ---
  --- scale: returns the scale record, for example "102034050607" for a major scale
  ---
  --- list_X: if viewing list view, returns string describing event at row X (0-based). String will have a list of key=value pairs, e.g. 'pos=4.0 len=4.0 offvel=127 msg=90317F'. pos/len times are in QN, len/offvel may not be present if event is not a note. other keys which may be present include pos_pq/len_pq, sel, mute, ccval14, ccshape, ccbeztension.
  ---
  --- if setting_desc is unsupported, the function returns false.
  ---
  --- See MIDIEditor_GetActive, MIDIEditor_GetSetting_int
  ---@param midieditor HWND
  ---@param setting_desc string
  ---@return boolean, string
  MIDIEditor_GetSetting_str = function(midieditor, setting_desc) end,

  --- ```
  --- MediaItem_Take _ = reaper.MIDIEditor_GetTake(HWND midieditor)
  --- ```
  --- get the take that is currently being edited in this MIDI editor. see MIDIEditor_EnumTakes
  ---@param midieditor HWND
  ---@return MediaItem_Take
  MIDIEditor_GetTake = function(midieditor) end,

  --- ```
  --- boolean _ = reaper.MIDIEditor_LastFocused_OnCommand(integer command_id, boolean islistviewcommand)
  --- ```
  --- Send an action command to the last focused MIDI editor. Returns false if there is no MIDI editor open, or if the view mode (piano roll or event list) does not match the input.
  ---
  --- see MIDIEditor_OnCommand
  ---@param command_id integer
  ---@param islistviewcommand boolean
  ---@return boolean
  MIDIEditor_LastFocused_OnCommand = function(command_id, islistviewcommand) end,

  --- ```
  --- boolean _ = reaper.MIDIEditor_OnCommand(HWND midieditor, integer command_id)
  --- ```
  --- Send an action command to a MIDI editor. Returns false if the supplied MIDI editor pointer is not valid (not an open MIDI editor).
  ---
  --- see MIDIEditor_GetActive, MIDIEditor_LastFocused_OnCommand
  ---@param midieditor HWND
  ---@param command_id integer
  ---@return boolean
  MIDIEditor_OnCommand = function(midieditor, command_id) end,

  --- ```
  --- boolean _ = reaper.MIDIEditor_SetSetting_int(HWND midieditor, string setting_desc, integer setting)
  --- ```
  --- Set settings for a MIDI editor. setting_desc can be:
  ---
  --- active_note_row: 0-127
  ---
  --- See MIDIEditor_GetSetting_int
  ---@param midieditor HWND
  ---@param setting_desc string
  ---@param setting integer
  ---@return boolean
  MIDIEditor_SetSetting_int = function(midieditor, setting_desc, setting) end,

  --- ```
  --- integer pitchwheelrange, integer flags = reaper.MIDIEditorFlagsForTrack(MediaTrack track, integer pitchwheelrange, integer flags, boolean is_set)
  --- ```
  --- Get or set MIDI editor settings for this track. pitchwheelrange: semitones up or down. flags &1: snap pitch lane edits to semitones if pitchwheel range is defined.
  ---@param track MediaTrack
  ---@param pitchwheelrange integer
  ---@param flags integer
  ---@param is_set boolean
  ---@return integer, integer
  MIDIEditorFlagsForTrack = function(track, pitchwheelrange, flags, is_set) end,

  --- ```
  --- string strNeed64 = reaper.mkpanstr(string strNeed64, number pan)
  --- ```
  ---@param strNeed64 string
  ---@param pan number
  ---@return string
  mkpanstr = function(strNeed64, pan) end,

  --- ```
  --- string strNeed64 = reaper.mkvolpanstr(string strNeed64, number vol, number pan)
  --- ```
  ---@param strNeed64 string
  ---@param vol number
  ---@param pan number
  ---@return string
  mkvolpanstr = function(strNeed64, vol, pan) end,

  --- ```
  --- string strNeed64 = reaper.mkvolstr(string strNeed64, number vol)
  --- ```
  ---@param strNeed64 string
  ---@param vol number
  ---@return string
  mkvolstr = function(strNeed64, vol) end,

  --- ```
  --- reaper.MoveEditCursor(number adjamt, boolean dosel)
  --- ```
  ---@param adjamt number
  ---@param dosel boolean
  MoveEditCursor = function(adjamt, dosel) end,

  --- ```
  --- boolean _ = reaper.MoveMediaItemToTrack(MediaItem item, MediaTrack desttr)
  --- ```
  --- returns TRUE if move succeeded
  ---@param item MediaItem
  ---@param desttr MediaTrack
  ---@return boolean
  MoveMediaItemToTrack = function(item, desttr) end,

  --- ```
  --- reaper.MuteAllTracks(boolean mute)
  --- ```
  ---@param mute boolean
  MuteAllTracks = function(mute) end,

  --- ```
  --- reaper.my_getViewport(integer r_left, integer r_top, integer r_right, integer r_bot, integer sr_left, integer sr_top, integer sr_right, integer sr_bot, boolean wantWorkArea)
  --- ```
  ---@param r_left integer
  ---@param r_top integer
  ---@param r_right integer
  ---@param r_bot integer
  ---@param sr_left integer
  ---@param sr_top integer
  ---@param sr_right integer
  ---@param sr_bot integer
  ---@param wantWorkArea boolean
  my_getViewport = function(r_left, r_top, r_right, r_bot, sr_left, sr_top, sr_right, sr_bot, wantWorkArea) end,

  --- ```
  --- integer _ = reaper.NamedCommandLookup(string command_name)
  --- ```
  --- Get the command ID number for named command that was registered by an extension such as "_SWS_ABOUT" or "_113088d11ae641c193a2b7ede3041ad5" for a ReaScript or a custom action.
  ---@param command_name string
  ---@return integer
  NamedCommandLookup = function(command_name) end,

  --- ```
  --- reaper.OnPauseButton()
  --- ```
  --- direct way to simulate pause button hit
  OnPauseButton = function() end,

  --- ```
  --- reaper.OnPauseButtonEx(ReaProject proj)
  --- ```
  --- direct way to simulate pause button hit
  ---@param proj ReaProject
  OnPauseButtonEx = function(proj) end,

  --- ```
  --- reaper.OnPlayButton()
  --- ```
  --- direct way to simulate play button hit
  OnPlayButton = function() end,

  --- ```
  --- reaper.OnPlayButtonEx(ReaProject proj)
  --- ```
  --- direct way to simulate play button hit
  ---@param proj ReaProject
  OnPlayButtonEx = function(proj) end,

  --- ```
  --- reaper.OnStopButton()
  --- ```
  --- direct way to simulate stop button hit
  OnStopButton = function() end,

  --- ```
  --- reaper.OnStopButtonEx(ReaProject proj)
  --- ```
  --- direct way to simulate stop button hit
  ---@param proj ReaProject
  OnStopButtonEx = function(proj) end,

  --- ```
  --- boolean _ = reaper.OpenColorThemeFile(string fn)
  --- ```
  ---@param fn string
  ---@return boolean
  OpenColorThemeFile = function(fn) end,

  --- ```
  --- HWND _ = reaper.OpenMediaExplorer(string mediafn, boolean play)
  --- ```
  --- Opens mediafn in the Media Explorer, play=true will play the file immediately (or toggle playback if mediafn was already open), =false will just select it.
  ---@param mediafn string
  ---@param play boolean
  ---@return HWND
  OpenMediaExplorer = function(mediafn, play) end,

  --- ```
  --- reaper.OscLocalMessageToHost(string message, optional number valueIn)
  --- ```
  --- Send an OSC message directly to REAPER. The value argument may be NULL. The message will be matched against the default OSC patterns.
  ---@param message string
  ---@param valueIn? number
  OscLocalMessageToHost = function(message, valueIn) end,

  --- ```
  --- number _ = reaper.parse_timestr(string buf)
  --- ```
  --- Parse hh:mm:ss.sss time string, return time in seconds (or 0.0 on error). See parse_timestr_pos, parse_timestr_len.
  ---@param buf string
  ---@return number
  parse_timestr = function(buf) end,

  --- ```
  --- number _ = reaper.parse_timestr_len(string buf, number offset, integer modeoverride)
  --- ```
  --- time formatting mode overrides: -1=proj default.
  ---
  --- 0=time
  ---
  --- 1=measures.beats + time
  ---
  --- 2=measures.beats
  ---
  --- 3=seconds
  ---
  --- 4=samples
  ---
  --- 5=h:m:s:f
  ---@param buf string
  ---@param offset number
  ---@param modeoverride integer
  ---@return number
  parse_timestr_len = function(buf, offset, modeoverride) end,

  --- ```
  --- number _ = reaper.parse_timestr_pos(string buf, integer modeoverride)
  --- ```
  --- Parse time string, time formatting mode overrides: -1=proj default.
  ---
  --- 0=time
  ---
  --- 1=measures.beats + time
  ---
  --- 2=measures.beats
  ---
  --- 3=seconds
  ---
  --- 4=samples
  ---
  --- 5=h:m:s:f
  ---@param buf string
  ---@param modeoverride integer
  ---@return number
  parse_timestr_pos = function(buf, modeoverride) end,

  --- ```
  --- number _ = reaper.parsepanstr(string str)
  --- ```
  ---@param str string
  ---@return number
  parsepanstr = function(str) end,

  --- ```
  --- integer retval, string descstr = reaper.PCM_Sink_Enum(integer idx)
  --- ```
  ---@param idx integer
  ---@return integer, string
  PCM_Sink_Enum = function(idx) end,

  --- ```
  --- string _ = reaper.PCM_Sink_GetExtension(string data)
  --- ```
  ---@param data string
  ---@return string
  PCM_Sink_GetExtension = function(data) end,

  --- ```
  --- HWND _ = reaper.PCM_Sink_ShowConfig(string cfg, HWND hwndParent)
  --- ```
  ---@param cfg string
  ---@param hwndParent HWND
  ---@return HWND
  PCM_Sink_ShowConfig = function(cfg, hwndParent) end,

  --- ```
  --- integer _ = reaper.PCM_Source_BuildPeaks(PCM_source src, integer mode)
  --- ```
  --- Calls and returns PCM_source::PeaksBuild_Begin() if mode=0, PeaksBuild_Run() if mode=1, and PeaksBuild_Finish() if mode=2. Normal use is to call PCM_Source_BuildPeaks(src,0), and if that returns nonzero, call PCM_Source_BuildPeaks(src,1) periodically until it returns zero (it returns the percentage of the file remaining), then call PCM_Source_BuildPeaks(src,2) to finalize. If PCM_Source_BuildPeaks(src,0) returns zero, then no further action is necessary.
  ---@param src PCM_source
  ---@param mode integer
  ---@return integer
  PCM_Source_BuildPeaks = function(src, mode) end,

  --- ```
  --- PCM_source _ = reaper.PCM_Source_CreateFromFile(string filename)
  --- ```
  --- See PCM_Source_CreateFromFileEx.
  ---@param filename string
  ---@return PCM_source
  PCM_Source_CreateFromFile = function(filename) end,

  --- ```
  --- PCM_source _ = reaper.PCM_Source_CreateFromFileEx(string filename, boolean forcenoMidiImp)
  --- ```
  --- Create a PCM_source from filename, and override pref of MIDI files being imported as in-project MIDI events.
  ---@param filename string
  ---@param forcenoMidiImp boolean
  ---@return PCM_source
  PCM_Source_CreateFromFileEx = function(filename, forcenoMidiImp) end,

  --- ```
  --- PCM_source _ = reaper.PCM_Source_CreateFromType(string sourcetype)
  --- ```
  --- Create a PCM_source from a "type" (use this if you're going to load its state via LoadState/ProjectStateContext).
  ---
  --- Valid types include "WAVE", "MIDI", or whatever plug-ins define as well.
  ---@param sourcetype string
  ---@return PCM_source
  PCM_Source_CreateFromType = function(sourcetype) end,

  --- ```
  --- reaper.PCM_Source_Destroy(PCM_source src)
  --- ```
  --- Deletes a PCM_source -- be sure that you remove any project reference before deleting a source
  ---@param src PCM_source
  PCM_Source_Destroy = function(src) end,

  --- ```
  --- integer _ = reaper.PCM_Source_GetPeaks(PCM_source src, number peakrate, number starttime, integer numchannels, integer numsamplesperchannel, integer want_extra_type, reaper.array buf)
  --- ```
  --- Gets block of peak samples to buf. Note that the peak samples are interleaved, but in two or three blocks (maximums, then minimums, then extra). Return value has 20 bits of returned sample count, then 4 bits of output_mode (0xf00000), then a bit to signify whether extra_type was available (0x1000000). extra_type can be 115 ('s') for spectral information, which will return peak samples as integers with the low 15 bits frequency, next 14 bits tonality.
  ---@param src PCM_source
  ---@param peakrate number
  ---@param starttime number
  ---@param numchannels integer
  ---@param numsamplesperchannel integer
  ---@param want_extra_type integer
  ---@param buf reaper.array
  ---@return integer
  PCM_Source_GetPeaks = function(src, peakrate, starttime, numchannels, numsamplesperchannel, want_extra_type, buf) end,

  --- ```
  --- boolean retval, number offs, number len, boolean rev = reaper.PCM_Source_GetSectionInfo(PCM_source src)
  --- ```
  --- If a section/reverse block, retrieves offset/len/reverse. return true if success
  ---@param src PCM_source
  ---@return boolean, number, number, boolean
  PCM_Source_GetSectionInfo = function(src) end,

  --- ```
  --- reaper.PluginWantsAlwaysRunFx(integer amt)
  --- ```
  ---@param amt integer
  PluginWantsAlwaysRunFx = function(amt) end,

  --- ```
  --- reaper.PreventUIRefresh(integer prevent_count)
  --- ```
  --- adds prevent_count to the UI refresh prevention state; always add then remove the same amount, or major disfunction will occur
  ---@param prevent_count integer
  PreventUIRefresh = function(prevent_count) end,

  --- ```
  --- integer _ = reaper.PromptForAction(integer session_mode, integer init_id, integer section_id)
  --- ```
  --- Uses the action list to choose an action. Call with session_mode=1 to create a session (init_id will be the initial action to select, or 0), then poll with session_mode=0, checking return value for user-selected action (will return 0 if no action selected yet, or -1 if the action window is no longer available). When finished, call with session_mode=-1.
  ---@param session_mode integer
  ---@param init_id integer
  ---@param section_id integer
  ---@return integer
  PromptForAction = function(session_mode, init_id, section_id) end,

  --- ```
  --- reaper.ReaScriptError(string errmsg)
  --- ```
  --- Causes REAPER to display the error message after the current ReaScript finishes. If called within a Lua context and errmsg has a ! prefix, script execution will be terminated.
  ---@param errmsg string
  ReaScriptError = function(errmsg) end,

  --- ```
  --- integer _ = reaper.RecursiveCreateDirectory(string path, integer ignored)
  --- ```
  --- returns positive value on success, 0 on failure.
  ---@param path string
  ---@param ignored integer
  ---@return integer
  RecursiveCreateDirectory = function(path, ignored) end,

  --- ```
  --- integer _ = reaper.reduce_open_files(integer flags)
  --- ```
  --- garbage-collects extra open files and closes them. if flags has 1 set, this is done incrementally (call this from a regular timer, if desired). if flags has 2 set, files are aggressively closed (they may need to be re-opened very soon). returns number of files closed by this call.
  ---@param flags integer
  ---@return integer
  reduce_open_files = function(flags) end,

  --- ```
  --- reaper.RefreshToolbar(integer command_id)
  --- ```
  --- See RefreshToolbar2.
  ---@param command_id integer
  RefreshToolbar = function(command_id) end,

  --- ```
  --- reaper.RefreshToolbar2(integer section_id, integer command_id)
  --- ```
  --- Refresh the toolbar button states of a toggle action.
  ---@param section_id integer
  ---@param command_id integer
  RefreshToolbar2 = function(section_id, command_id) end,

  --- ```
  --- string out = reaper.relative_fn(string _in, string out)
  --- ```
  --- Makes a filename "in" relative to the current project, if any.
  ---@param _in string
  ---@param out string
  ---@return string
  relative_fn = function(_in, out) end,

  --- ```
  --- boolean _ = reaper.RemoveTrackSend(MediaTrack tr, integer category, integer sendidx)
  --- ```
  --- Remove a send/receive/hardware output, return true on success. category is <0 for receives, 0=sends, >0 for hardware outputs. See CreateTrackSend, GetSetTrackSendInfo, GetTrackSendInfo_Value, SetTrackSendInfo_Value, GetTrackNumSends.
  ---@param tr MediaTrack
  ---@param category integer
  ---@param sendidx integer
  ---@return boolean
  RemoveTrackSend = function(tr, category, sendidx) end,

  --- ```
  --- boolean _ = reaper.RenderFileSection(string source_filename, string target_filename, number start_percent, number end_percent, number playrate)
  --- ```
  --- Not available while playing back.
  ---@param source_filename string
  ---@param target_filename string
  ---@param start_percent number
  ---@param end_percent number
  ---@param playrate number
  ---@return boolean
  RenderFileSection = function(source_filename, target_filename, start_percent, end_percent, playrate) end,

  --- ```
  --- boolean _ = reaper.ReorderSelectedTracks(integer beforeTrackIdx, integer makePrevFolder)
  --- ```
  --- Moves all selected tracks to immediately above track specified by index beforeTrackIdx, returns false if no tracks were selected. makePrevFolder=0 for normal, 1 = as child of track preceding track specified by beforeTrackIdx, 2 = if track preceding track specified by beforeTrackIdx is last track in folder, extend folder
  ---@param beforeTrackIdx integer
  ---@param makePrevFolder integer
  ---@return boolean
  ReorderSelectedTracks = function(beforeTrackIdx, makePrevFolder) end,

  --- ```
  --- string _ = reaper.Resample_EnumModes(integer mode)
  --- ```
  ---@param mode integer
  ---@return string
  Resample_EnumModes = function(mode) end,

  --- ```
  --- string out = reaper.resolve_fn(string _in, string out)
  --- ```
  --- See resolve_fn2.
  ---@param _in string
  ---@param out string
  ---@return string
  resolve_fn = function(_in, out) end,

  --- ```
  --- string out = reaper.resolve_fn2(string _in, string out, optional string checkSubDir)
  --- ```
  --- Resolves a filename "in" by using project settings etc. If no file found, out will be a copy of in.
  ---@param _in string
  ---@param out string
  ---@param checkSubDir? string
  ---@return string
  resolve_fn2 = function(_in, out, checkSubDir) end,

  --- ```
  --- string _ = reaper.ReverseNamedCommandLookup(integer command_id)
  --- ```
  --- Get the named command for the given command ID. The returned string will not start with '_' (e.g. it will return "SWS_ABOUT"), it will be NULL if command_id is a native action.
  ---@param command_id integer
  ---@return string
  ReverseNamedCommandLookup = function(command_id) end,

  --- ```
  --- number _ = reaper.ScaleFromEnvelopeMode(integer scaling_mode, number val)
  --- ```
  --- See GetEnvelopeScalingMode.
  ---@param scaling_mode integer
  ---@param val number
  ---@return number
  ScaleFromEnvelopeMode = function(scaling_mode, val) end,

  --- ```
  --- number _ = reaper.ScaleToEnvelopeMode(integer scaling_mode, number val)
  --- ```
  --- See GetEnvelopeScalingMode.
  ---@param scaling_mode integer
  ---@param val number
  ---@return number
  ScaleToEnvelopeMode = function(scaling_mode, val) end,

  --- ```
  --- KbdSectionInfo _ = reaper.SectionFromUniqueID(integer uniqueID)
  --- ```
  ---@param uniqueID integer
  ---@return KbdSectionInfo
  SectionFromUniqueID = function(uniqueID) end,

  --- ```
  --- reaper.SelectAllMediaItems(ReaProject proj, boolean selected)
  --- ```
  ---@param proj ReaProject
  ---@param selected boolean
  SelectAllMediaItems = function(proj, selected) end,

  --- ```
  --- reaper.SelectProjectInstance(ReaProject proj)
  --- ```
  ---@param proj ReaProject
  SelectProjectInstance = function(proj) end,

  --- ```
  --- reaper.SendMIDIMessageToHardware(integer output, string msg)
  --- ```
  --- Sends a MIDI message to output device specified by output. Message is sent in immediate mode.
  ---@param output integer
  ---@param msg string
  SendMIDIMessageToHardware = function(output, msg) end,

  --- ```
  --- reaper.SetActiveTake(MediaItem_Take take)
  --- ```
  --- set this take active in this media item
  ---@param take MediaItem_Take
  SetActiveTake = function(take) end,

  --- ```
  --- reaper.SetAutomationMode(integer mode, boolean onlySel)
  --- ```
  --- sets all or selected tracks to mode.
  ---@param mode integer
  ---@param onlySel boolean
  SetAutomationMode = function(mode, onlySel) end,

  --- ```
  --- reaper.SetCurrentBPM(ReaProject __proj, number bpm, boolean wantUndo)
  --- ```
  --- set current BPM in project, set wantUndo=true to add undo point
  ---@param __proj ReaProject
  ---@param bpm number
  ---@param wantUndo boolean
  SetCurrentBPM = function(__proj, bpm, wantUndo) end,

  --- ```
  --- reaper.SetCursorContext(integer mode, TrackEnvelope envIn)
  --- ```
  --- You must use this to change the focus programmatically. mode=0 to focus track panels, 1 to focus the arrange window, 2 to focus the arrange window and select env (or env==NULL to clear the current track/take envelope selection)
  ---@param mode integer
  ---@param envIn TrackEnvelope
  SetCursorContext = function(mode, envIn) end,

  --- ```
  --- reaper.SetEditCurPos(number time, boolean moveview, boolean seekplay)
  --- ```
  ---@param time number
  ---@param moveview boolean
  ---@param seekplay boolean
  SetEditCurPos = function(time, moveview, seekplay) end,

  --- ```
  --- reaper.SetEditCurPos2(ReaProject proj, number time, boolean moveview, boolean seekplay)
  --- ```
  ---@param proj ReaProject
  ---@param time number
  ---@param moveview boolean
  ---@param seekplay boolean
  SetEditCurPos2 = function(proj, time, moveview, seekplay) end,

  --- ```
  --- boolean _ = reaper.SetEnvelopePoint(TrackEnvelope envelope, integer ptidx, optional number timeIn, optional number valueIn, optional integer shapeIn, optional number tensionIn, optional boolean selectedIn, optional boolean noSortIn)
  --- ```
  --- Set attributes of an envelope point. Values that are not supplied will be ignored. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done. See SetEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param ptidx integer
  ---@param timeIn? number
  ---@param valueIn? number
  ---@param shapeIn? integer
  ---@param tensionIn? number
  ---@param selectedIn? boolean
  ---@param noSortIn? boolean
  ---@return boolean
  SetEnvelopePoint = function(envelope, ptidx, timeIn, valueIn, shapeIn, tensionIn, selectedIn, noSortIn) end,

  --- ```
  --- boolean _ = reaper.SetEnvelopePointEx(TrackEnvelope envelope, integer autoitem_idx, integer ptidx, optional number timeIn, optional number valueIn, optional integer shapeIn, optional number tensionIn, optional boolean selectedIn, optional boolean noSortIn)
  --- ```
  --- Set attributes of an envelope point. Values that are not supplied will be ignored. If setting multiple points at once, set noSort=true, and call Envelope_SortPoints when done.
  ---
  --- autoitem_idx=-1 for the underlying envelope, 0 for the first automation item on the envelope, etc.
  ---
  --- For automation items, pass autoitem_idx|0x10000000 to base ptidx on the number of points in one full loop iteration,
  ---
  --- even if the automation item is trimmed so that not all points are visible.
  ---
  --- Otherwise, ptidx will be based on the number of visible points in the automation item, including all loop iterations.
  ---
  --- See CountEnvelopePointsEx, GetEnvelopePointEx, InsertEnvelopePointEx, DeleteEnvelopePointEx.
  ---@param envelope TrackEnvelope
  ---@param autoitem_idx integer
  ---@param ptidx integer
  ---@param timeIn? number
  ---@param valueIn? number
  ---@param shapeIn? integer
  ---@param tensionIn? number
  ---@param selectedIn? boolean
  ---@param noSortIn? boolean
  ---@return boolean
  SetEnvelopePointEx = function(envelope, autoitem_idx, ptidx, timeIn, valueIn, shapeIn, tensionIn, selectedIn, noSortIn) end,

  --- ```
  --- boolean _ = reaper.SetEnvelopeStateChunk(TrackEnvelope env, string str, boolean isundo)
  --- ```
  --- Sets the RPPXML state of an envelope, returns true if successful. Undo flag is a performance/caching hint.
  ---@param env TrackEnvelope
  ---@param str string
  ---@param isundo boolean
  ---@return boolean
  SetEnvelopeStateChunk = function(env, str, isundo) end,

  --- ```
  --- reaper.SetExtState(string section, string key, string value, boolean persist)
  --- ```
  --- Set the extended state value for a specific section and key. persist=true means the value should be stored and reloaded the next time REAPER is opened. See GetExtState, DeleteExtState, HasExtState.
  ---@param section string
  ---@param key string
  ---@param value string
  ---@param persist boolean
  SetExtState = function(section, key, value, persist) end,

  --- ```
  --- reaper.SetGlobalAutomationOverride(integer mode)
  --- ```
  --- mode: see GetGlobalAutomationOverride
  ---@param mode integer
  SetGlobalAutomationOverride = function(mode) end,

  --- ```
  --- boolean _ = reaper.SetItemStateChunk(MediaItem item, string str, boolean isundo)
  --- ```
  --- Sets the RPPXML state of an item, returns true if successful. Undo flag is a performance/caching hint.
  ---@param item MediaItem
  ---@param str string
  ---@param isundo boolean
  ---@return boolean
  SetItemStateChunk = function(item, str, isundo) end,

  --- ```
  --- integer _ = reaper.SetMasterTrackVisibility(integer flag)
  --- ```
  --- set &1 to show the master track in the TCP, &2 to HIDE in the mixer. Returns the previous visibility state. See GetMasterTrackVisibility.
  ---@param flag integer
  ---@return integer
  SetMasterTrackVisibility = function(flag) end,

  --- ```
  --- boolean _ = reaper.SetMediaItemInfo_Value(MediaItem item, string parmname, number newvalue)
  --- ```
  --- Set media item numerical-value attributes.
  ---
  --- B_MUTE : bool * : muted (item solo overrides). setting this value will clear C_MUTE_SOLO.
  ---
  --- B_MUTE_ACTUAL : bool * : muted (ignores solo). setting this value will not affect C_MUTE_SOLO.
  ---
  --- C_LANEPLAYS : char * : in fixed lane tracks, 0=this item lane does not play, 1=this item lane plays exclusively, 2=this item lane plays and other lanes also play, -1=this item is on a non-visible, non-playing lane on a non-fixed-lane track (read-only)
  ---
  --- C_MUTE_SOLO : char * : solo override (-1=soloed, 0=no override, 1=unsoloed). note that this API does not automatically unsolo other items when soloing (nor clear the unsolos when clearing the last soloed item), it must be done by the caller via action or via this API.
  ---
  --- B_LOOPSRC : bool * : loop source
  ---
  --- B_ALLTAKESPLAY : bool * : all takes play
  ---
  --- B_UISEL : bool * : selected in arrange view
  ---
  --- C_BEATATTACHMODE : char * : item timebase, -1=track or project default, 1=beats (position, length, rate), 2=beats (position only). for auto-stretch timebase: C_BEATATTACHMODE=1, C_AUTOSTRETCH=1
  ---
  --- C_AUTOSTRETCH: : char * : auto-stretch at project tempo changes, 1=enabled, requires C_BEATATTACHMODE=1
  ---
  --- C_LOCK : char * : locked, &1=locked
  ---
  --- D_VOL : double * : item volume,  0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
  ---
  --- D_POSITION : double * : item position in seconds
  ---
  --- D_LENGTH : double * : item length in seconds
  ---
  --- D_SNAPOFFSET : double * : item snap offset in seconds
  ---
  --- D_FADEINLEN : double * : item manual fadein length in seconds
  ---
  --- D_FADEOUTLEN : double * : item manual fadeout length in seconds
  ---
  --- D_FADEINDIR : double * : item fadein curvature, -1..1
  ---
  --- D_FADEOUTDIR : double * : item fadeout curvature, -1..1
  ---
  --- D_FADEINLEN_AUTO : double * : item auto-fadein length in seconds, -1=no auto-fadein
  ---
  --- D_FADEOUTLEN_AUTO : double * : item auto-fadeout length in seconds, -1=no auto-fadeout
  ---
  --- C_FADEINSHAPE : int * : fadein shape, 0..6, 0=linear
  ---
  --- C_FADEOUTSHAPE : int * : fadeout shape, 0..6, 0=linear
  ---
  --- I_GROUPID : int * : group ID, 0=no group
  ---
  --- I_LASTY : int * : Y-position (relative to top of track) in pixels (read-only)
  ---
  --- I_LASTH : int * : height in pixels (read-only)
  ---
  --- I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will not be used, but will store the color
  ---
  --- I_CURTAKE : int * : active take number
  ---
  --- IP_ITEMNUMBER : int : item number on this track (read-only, returns the item number directly)
  ---
  --- F_FREEMODE_Y : float * : free item positioning or fixed lane Y-position. 0=top of track, 1.0=bottom of track
  ---
  --- F_FREEMODE_H : float * : free item positioning or fixed lane height. 0.5=half the track height, 1.0=full track height
  ---
  --- I_FIXEDLANE : int * : fixed lane of item (fine to call with setNewValue, but returned value is read-only)
  ---
  --- B_FIXEDLANE_HIDDEN : bool * : true if displaying only one fixed lane and this item is in a different lane (read-only)
  ---@param item MediaItem
  ---@param parmname string
  ---@param newvalue number
  ---@return boolean
  SetMediaItemInfo_Value = function(item, parmname, newvalue) end,

  --- ```
  --- boolean _ = reaper.SetMediaItemLength(MediaItem item, number length, boolean refreshUI)
  --- ```
  --- Redraws the screen only if refreshUI == true.
  ---
  --- See UpdateArrange().
  ---@param item MediaItem
  ---@param length number
  ---@param refreshUI boolean
  ---@return boolean
  SetMediaItemLength = function(item, length, refreshUI) end,

  --- ```
  --- boolean _ = reaper.SetMediaItemPosition(MediaItem item, number position, boolean refreshUI)
  --- ```
  --- Redraws the screen only if refreshUI == true.
  ---
  --- See UpdateArrange().
  ---@param item MediaItem
  ---@param position number
  ---@param refreshUI boolean
  ---@return boolean
  SetMediaItemPosition = function(item, position, refreshUI) end,

  --- ```
  --- reaper.SetMediaItemSelected(MediaItem item, boolean selected)
  --- ```
  ---@param item MediaItem
  ---@param selected boolean
  SetMediaItemSelected = function(item, selected) end,

  --- ```
  --- boolean _ = reaper.SetMediaItemTake_Source(MediaItem_Take take, PCM_source source)
  --- ```
  --- Set media source of media item take. The old source will not be destroyed, it is the caller's responsibility to retrieve it and destroy it after. If source already exists in any project, it will be duplicated before being set. C/C++ code should not use this and instead use GetSetMediaItemTakeInfo() with P_SOURCE to manage ownership directly.
  ---@param take MediaItem_Take
  ---@param source PCM_source
  ---@return boolean
  SetMediaItemTake_Source = function(take, source) end,

  --- ```
  --- boolean _ = reaper.SetMediaItemTakeInfo_Value(MediaItem_Take take, string parmname, number newvalue)
  --- ```
  --- Set media item take numerical-value attributes.
  ---
  --- D_STARTOFFS : double * : start offset in source media, in seconds
  ---
  --- D_VOL : double * : take volume, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc, negative if take polarity is flipped
  ---
  --- D_PAN : double * : take pan, -1..1
  ---
  --- D_PANLAW : double * : take pan law, -1=default, 0.5=-6dB, 1.0=+0dB, etc
  ---
  --- D_PLAYRATE : double * : take playback rate, 0.5=half speed, 1=normal, 2=double speed, etc
  ---
  --- D_PITCH : double * : take pitch adjustment in semitones, -12=one octave down, 0=normal, +12=one octave up, etc
  ---
  --- B_PPITCH : bool * : preserve pitch when changing playback rate
  ---
  --- I_LASTY : int * : Y-position (relative to top of track) in pixels (read-only)
  ---
  --- I_LASTH : int * : height in pixels (read-only)
  ---
  --- I_CHANMODE : int * : channel mode, 0=normal, 1=reverse stereo, 2=downmix, 3=left, 4=right
  ---
  --- I_PITCHMODE : int * : pitch shifter mode, -1=project default, otherwise high 2 bytes=shifter, low 2 bytes=parameter
  ---
  --- I_STRETCHFLAGS : int * : stretch marker flags (&7 mask for mode override: 0=default, 1=balanced, 2/3/6=tonal, 4=transient, 5=no pre-echo)
  ---
  --- F_STRETCHFADESIZE : float * : stretch marker fade size in seconds (0.0025 default)
  ---
  --- I_RECPASSID : int * : record pass ID
  ---
  --- I_TAKEFX_NCH : int * : number of internal audio channels for per-take FX to use (OK to call with setNewValue, but the returned value is read-only)
  ---
  --- I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will not be used, but will store the color
  ---
  --- IP_TAKENUMBER : int : take number (read-only, returns the take number directly)
  ---@param take MediaItem_Take
  ---@param parmname string
  ---@param newvalue number
  ---@return boolean
  SetMediaItemTakeInfo_Value = function(take, parmname, newvalue) end,

  --- ```
  --- boolean _ = reaper.SetMediaTrackInfo_Value(MediaTrack tr, string parmname, number newvalue)
  --- ```
  --- Set track numerical-value attributes.
  ---
  --- B_MUTE : bool * : muted
  ---
  --- B_PHASE : bool * : track phase inverted
  ---
  --- B_RECMON_IN_EFFECT : bool * : record monitoring in effect (current audio-thread playback state, read-only)
  ---
  --- IP_TRACKNUMBER : int : track number 1-based, 0=not found, -1=master track (read-only, returns the int directly)
  ---
  --- I_SOLO : int * : soloed, 0=not soloed, 1=soloed, 2=soloed in place, 5=safe soloed, 6=safe soloed in place
  ---
  --- B_SOLO_DEFEAT : bool * : when set, if anything else is soloed and this track is not muted, this track acts soloed
  ---
  --- I_FXEN : int * : fx enabled, 0=bypassed, !0=fx active
  ---
  --- I_RECARM : int * : record armed, 0=not record armed, 1=record armed
  ---
  --- I_RECINPUT : int * : record input, <0=no input. if 4096 set, input is MIDI and low 5 bits represent channel (0=all, 1-16=only chan), next 6 bits represent physical input (63=all, 62=VKB). If 4096 is not set, low 10 bits (0..1023) are input start channel (ReaRoute/Loopback start at 512). If 2048 is set, input is multichannel input (using track channel count), or if 1024 is set, input is stereo input, otherwise input is mono.
  ---
  --- I_RECMODE : int * : record mode, 0=input, 1=stereo out, 2=none, 3=stereo out w/latency compensation, 4=midi output, 5=mono out, 6=mono out w/ latency compensation, 7=midi overdub, 8=midi replace
  ---
  --- I_RECMODE_FLAGS : int * : record mode flags, &3=output recording mode (0=post fader, 1=pre-fx, 2=post-fx/pre-fader)
  ---
  --- I_RECMON : int * : record monitoring, 0=off, 1=normal, 2=not when playing (tape style)
  ---
  --- I_RECMONITEMS : int * : monitor items while recording, 0=off, 1=on
  ---
  --- B_AUTO_RECARM : bool * : automatically set record arm when selected (does not immediately affect recarm state, script should set directly if desired)
  ---
  --- I_VUMODE : int * : track vu mode, &1:disabled, &30==0:stereo peaks, &30==2:multichannel peaks, &30==4:stereo RMS, &30==8:combined RMS, &30==12:LUFS-M, &30==16:LUFS-S (readout=max), &30==20:LUFS-S (readout=current), &32:LUFS calculation on channels 1+2 only
  ---
  --- I_AUTOMODE : int * : track automation mode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch
  ---
  --- I_NCHAN : int * : number of track channels, 2-128, even numbers only
  ---
  --- I_SELECTED : int * : track selected, 0=unselected, 1=selected
  ---
  --- I_WNDH : int * : current TCP window height in pixels including envelopes (read-only)
  ---
  --- I_TCPH : int * : current TCP window height in pixels not including envelopes (read-only)
  ---
  --- I_TCPY : int * : current TCP window Y-position in pixels relative to top of arrange view (read-only)
  ---
  --- I_MCPX : int * : current MCP X-position in pixels relative to mixer container (read-only)
  ---
  --- I_MCPY : int * : current MCP Y-position in pixels relative to mixer container (read-only)
  ---
  --- I_MCPW : int * : current MCP width in pixels (read-only)
  ---
  --- I_MCPH : int * : current MCP height in pixels (read-only)
  ---
  --- I_FOLDERDEPTH : int * : folder depth change, 0=normal, 1=track is a folder parent, -1=track is the last in the innermost folder, -2=track is the last in the innermost and next-innermost folders, etc
  ---
  --- I_FOLDERCOMPACT : int * : folder collapsed state (only valid on folders), 0=normal, 1=collapsed, 2=fully collapsed
  ---
  --- I_MIDIHWOUT : int * : track midi hardware output index, <0=disabled, low 5 bits are which channels (0=all, 1-16), next 5 bits are output device index (0-31)
  ---
  --- I_PERFFLAGS : int * : track performance flags, &1=no media buffering, &2=no anticipative FX
  ---
  --- I_CUSTOMCOLOR : int * : custom color, OS dependent color|0x1000000 (i.e. ColorToNative(r,g,b)|0x1000000). If you do not |0x1000000, then it will not be used, but will store the color
  ---
  --- I_HEIGHTOVERRIDE : int * : custom height override for TCP window, 0 for none, otherwise size in pixels
  ---
  --- I_SPACER : int * : 1=TCP track spacer above this trackB_HEIGHTLOCK : bool * : track height lock (must set I_HEIGHTOVERRIDE before locking)
  ---
  --- D_VOL : double * : trim volume of track, 0=-inf, 0.5=-6dB, 1=+0dB, 2=+6dB, etc
  ---
  --- D_PAN : double * : trim pan of track, -1..1
  ---
  --- D_WIDTH : double * : width of track, -1..1
  ---
  --- D_DUALPANL : double * : dualpan position 1, -1..1, only if I_PANMODE==6
  ---
  --- D_DUALPANR : double * : dualpan position 2, -1..1, only if I_PANMODE==6
  ---
  --- I_PANMODE : int * : pan mode, 0=classic 3.x, 3=new balance, 5=stereo pan, 6=dual pan
  ---
  --- D_PANLAW : double * : pan law of track, <0=project default, 0.5=-6dB, 0.707..=-3dB, 1=+0dB, 1.414..=-3dB with gain compensation, 2=-6dB with gain compensation, etc
  ---
  --- I_PANLAW_FLAGS : int * : pan law flags, 0=sine taper, 1=hybrid taper with deprecated behavior when gain compensation enabled, 2=linear taper, 3=hybrid taper
  ---
  --- P_ENV:<envchunkname or P_ENV:{GUID... : TrackEnvelope * : (read-only) chunkname can be <VOLENV, <PANENV, etc; GUID is the stringified envelope GUID.
  ---
  --- B_SHOWINMIXER : bool * : track control panel visible in mixer (do not use on master track)
  ---
  --- B_SHOWINTCP : bool * : track control panel visible in arrange view (do not use on master track)
  ---
  --- B_MAINSEND : bool * : track sends audio to parent
  ---
  --- C_MAINSEND_OFFS : char * : channel offset of track send to parent
  ---
  --- C_MAINSEND_NCH : char * : channel count of track send to parent (0=use all child track channels, 1=use one channel only)
  ---
  --- I_FREEMODE : int * : 1=track free item positioning enabled, 2=track fixed lanes enabled (call UpdateTimeline() after changing)
  ---
  --- I_NUMFIXEDLANES : int * : number of track fixed lanes (fine to call with setNewValue, but returned value is read-only)
  ---
  --- C_LANESCOLLAPSED : char * : fixed lane collapse state (1=lanes collapsed, 2=track displays as non-fixed-lanes but hidden lanes exist)
  ---
  --- C_LANEPLAYS:N : char * :  on fixed lane tracks, 0=lane N does not play, 1=lane N plays exclusively, 2=lane N plays and other lanes also play (fine to call with setNewValue, but returned value is read-only)
  ---
  --- C_ALLLANESPLAY : char * : on fixed lane tracks, 0=no lanes play, 1=all lanes play, 2=some lanes play (fine to call with setNewValue 0 or 1, but returned value is read-only)
  ---
  --- C_BEATATTACHMODE : char * : track timebase, -1=project default, 0=time, 1=beats (position, length, rate), 2=beats (position only)
  ---
  --- F_MCP_FXSEND_SCALE : float * : scale of fx+send area in MCP (0=minimum allowed, 1=maximum allowed)
  ---
  --- F_MCP_FXPARM_SCALE : float * : scale of fx parameter area in MCP (0=minimum allowed, 1=maximum allowed)
  ---
  --- F_MCP_SENDRGN_SCALE : float * : scale of send area as proportion of the fx+send total area (0=minimum allowed, 1=maximum allowed)
  ---
  --- F_TCP_FXPARM_SCALE : float * : scale of TCP parameter area when TCP FX are embedded (0=min allowed, default, 1=max allowed)
  ---
  --- I_PLAY_OFFSET_FLAG : int * : track media playback offset state, &1=bypassed, &2=offset value is measured in samples (otherwise measured in seconds)
  ---
  --- D_PLAY_OFFSET : double * : track media playback offset, units depend on I_PLAY_OFFSET_FLAG
  ---@param tr MediaTrack
  ---@param parmname string
  ---@param newvalue number
  ---@return boolean
  ---@deprecated
  SetMediaTrackInfo_Value = function(tr, parmname, newvalue) end,

  --- ```
  --- reaper.SetMIDIEditorGrid(ReaProject project, number division)
  --- ```
  --- Set the MIDI editor grid division. 0.25=quarter note, 1.0/3.0=half note tripet, etc.
  ---@param project ReaProject
  ---@param division number
  SetMIDIEditorGrid = function(project, division) end,

  --- ```
  --- MediaTrack _ = reaper.SetMixerScroll(MediaTrack leftmosttrack)
  --- ```
  --- Scroll the mixer so that leftmosttrack is the leftmost visible track. Returns the leftmost track after scrolling, which may be different from the passed-in track if there are not enough tracks to its right.
  ---@param leftmosttrack MediaTrack
  ---@return MediaTrack
  SetMixerScroll = function(leftmosttrack) end,

  --- ```
  --- reaper.SetMouseModifier(string context, integer modifier_flag, string action)
  --- ```
  --- Set the mouse modifier assignment for a specific modifier key assignment, in a specific context.
  ---
  --- Context is a string like "MM_CTX_ITEM" (see reaper-mouse.ini) or "Media item left drag" (unlocalized).
  ---
  --- Modifier flag is a number from 0 to 15: add 1 for shift, 2 for control, 4 for alt, 8 for win.
  ---
  --- (macOS: add 1 for shift, 2 for command, 4 for opt, 8 for control.)
  ---
  --- For left-click and double-click contexts, the action can be any built-in command ID number
  ---
  --- or any custom action ID string. Find built-in command IDs in the REAPER actions window
  ---
  --- (enable "show command IDs" in the context menu), and find custom action ID strings in reaper-kb.ini.
  ---
  --- The action string may be a mouse modifier ID (see reaper-mouse.ini) with " m" appended to it,
  ---
  --- or (for click/double-click contexts) a command ID with " c" appended to it,
  ---
  --- or the text that appears in the mouse modifiers preferences dialog, like "Move item" (unlocalized).
  ---
  --- For example, SetMouseModifier("MM_CTX_ITEM", 0, "1 m") and SetMouseModifier("Media item left drag", 0, "Move item") are equivalent.
  ---
  --- SetMouseModifier(context, modifier_flag, -1) will reset that mouse modifier to default.
  ---
  --- SetMouseModifier(context, -1, -1) will reset the entire context to default.
  ---
  --- SetMouseModifier(-1, -1, -1) will reset all contexts to default.
  ---
  --- See GetMouseModifier.
  ---@param context string
  ---@param modifier_flag integer
  ---@param action string
  SetMouseModifier = function(context, modifier_flag, action) end,

  --- ```
  --- reaper.SetOnlyTrackSelected(MediaTrack track)
  --- ```
  --- Set exactly one track selected, deselect all others
  ---@param track MediaTrack
  SetOnlyTrackSelected = function(track) end,

  --- ```
  --- reaper.SetProjectGrid(ReaProject project, number division)
  --- ```
  --- Set the arrange view grid division. 0.25=quarter note, 1.0/3.0=half note triplet, etc.
  ---@param project ReaProject
  ---@param division number
  SetProjectGrid = function(project, division) end,

  --- ```
  --- boolean _ = reaper.SetProjectMarker(integer markrgnindexnumber, boolean isrgn, number pos, number rgnend, string name)
  --- ```
  --- Note: this function can't clear a marker's name (an empty string will leave the name unchanged), see SetProjectMarker4.
  ---@param markrgnindexnumber integer
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param name string
  ---@return boolean
  SetProjectMarker = function(markrgnindexnumber, isrgn, pos, rgnend, name) end,

  --- ```
  --- boolean _ = reaper.SetProjectMarker2(ReaProject proj, integer markrgnindexnumber, boolean isrgn, number pos, number rgnend, string name)
  --- ```
  --- Note: this function can't clear a marker's name (an empty string will leave the name unchanged), see SetProjectMarker4.
  ---@param proj ReaProject
  ---@param markrgnindexnumber integer
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param name string
  ---@return boolean
  SetProjectMarker2 = function(proj, markrgnindexnumber, isrgn, pos, rgnend, name) end,

  --- ```
  --- boolean _ = reaper.SetProjectMarker3(ReaProject proj, integer markrgnindexnumber, boolean isrgn, number pos, number rgnend, string name, integer color)
  --- ```
  --- Note: this function can't clear a marker's name (an empty string will leave the name unchanged), see SetProjectMarker4.
  ---@param proj ReaProject
  ---@param markrgnindexnumber integer
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param name string
  ---@param color integer
  ---@return boolean
  SetProjectMarker3 = function(proj, markrgnindexnumber, isrgn, pos, rgnend, name, color) end,

  --- ```
  --- boolean _ = reaper.SetProjectMarker4(ReaProject proj, integer markrgnindexnumber, boolean isrgn, number pos, number rgnend, string name, integer color, integer flags)
  --- ```
  --- color should be 0 to not change, or ColorToNative(r,g,b)|0x1000000, flags&1 to clear name
  ---@param proj ReaProject
  ---@param markrgnindexnumber integer
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param name string
  ---@param color integer
  ---@param flags integer
  ---@return boolean
  SetProjectMarker4 = function(proj, markrgnindexnumber, isrgn, pos, rgnend, name, color, flags) end,

  --- ```
  --- boolean _ = reaper.SetProjectMarkerByIndex(ReaProject proj, integer markrgnidx, boolean isrgn, number pos, number rgnend, integer IDnumber, string name, integer color)
  --- ```
  --- See SetProjectMarkerByIndex2.
  ---@param proj ReaProject
  ---@param markrgnidx integer
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param IDnumber integer
  ---@param name string
  ---@param color integer
  ---@return boolean
  SetProjectMarkerByIndex = function(proj, markrgnidx, isrgn, pos, rgnend, IDnumber, name, color) end,

  --- ```
  --- boolean _ = reaper.SetProjectMarkerByIndex2(ReaProject proj, integer markrgnidx, boolean isrgn, number pos, number rgnend, integer IDnumber, string name, integer color, integer flags)
  --- ```
  --- Differs from SetProjectMarker4 in that markrgnidx is 0 for the first marker/region, 1 for the next, etc (see EnumProjectMarkers3), rather than representing the displayed marker/region ID number (see SetProjectMarker3). Function will fail if attempting to set a duplicate ID number for a region (duplicate ID numbers for markers are OK). , flags&1 to clear name. If flags&2, markers will not be re-sorted, and after making updates, you MUST call SetProjectMarkerByIndex2 with markrgnidx=-1 and flags&2 to force re-sort/UI updates.
  ---@param proj ReaProject
  ---@param markrgnidx integer
  ---@param isrgn boolean
  ---@param pos number
  ---@param rgnend number
  ---@param IDnumber integer
  ---@param name string
  ---@param color integer
  ---@param flags integer
  ---@return boolean
  SetProjectMarkerByIndex2 = function(proj, markrgnidx, isrgn, pos, rgnend, IDnumber, name, color, flags) end,

  --- ```
  --- integer _ = reaper.SetProjExtState(ReaProject proj, string extname, string key, string value)
  --- ```
  --- Save a key/value pair for a specific extension, to be restored the next time this specific project is loaded. Typically extname will be the name of a reascript or extension section. If key is NULL or "", all extended data for that extname will be deleted.  If val is NULL or "", the data previously associated with that key will be deleted. Returns the size of the state for this extname. See GetProjExtState, EnumProjExtState.
  ---@param proj ReaProject
  ---@param extname string
  ---@param key string
  ---@param value string
  ---@return integer
  SetProjExtState = function(proj, extname, key, value) end,

  --- ```
  --- reaper.SetRegionRenderMatrix(ReaProject proj, integer regionindex, MediaTrack track, integer flag)
  --- ```
  --- Add (flag > 0) or remove (flag < 0) a track from this region when using the region render matrix. If adding, flag==2 means force mono, flag==4 means force stereo, flag==N means force N/2 channels.
  ---@param proj ReaProject
  ---@param regionindex integer
  ---@param track MediaTrack
  ---@param flag integer
  SetRegionRenderMatrix = function(proj, regionindex, track, flag) end,

  --- ```
  --- integer _ = reaper.SetTakeMarker(MediaItem_Take take, integer idx, string nameIn, optional number srcposIn, optional integer colorIn)
  --- ```
  --- Inserts or updates a take marker. If idx<0, a take marker will be added, otherwise an existing take marker will be updated. Returns the index of the new or updated take marker (which may change if srcPos is updated). See GetNumTakeMarkers, GetTakeMarker, DeleteTakeMarker
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@param nameIn string
  ---@param srcposIn? number
  ---@param colorIn? integer
  ---@return integer
  SetTakeMarker = function(take, idx, nameIn, srcposIn, colorIn) end,

  --- ```
  --- integer _ = reaper.SetTakeStretchMarker(MediaItem_Take take, integer idx, number pos, optional number srcposIn)
  --- ```
  --- Adds or updates a stretch marker. If idx<0, stretch marker will be added. If idx>=0, stretch marker will be updated. When adding, if srcposInOptional is omitted, source position will be auto-calculated. When updating a stretch marker, if srcposInOptional is omitted, srcpos will not be modified. Position/srcposition values will be constrained to nearby stretch markers. Returns index of stretch marker, or -1 if did not insert (or marker already existed at time).
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@param pos number
  ---@param srcposIn? number
  ---@return integer
  SetTakeStretchMarker = function(take, idx, pos, srcposIn) end,

  --- ```
  --- boolean _ = reaper.SetTakeStretchMarkerSlope(MediaItem_Take take, integer idx, number slope)
  --- ```
  --- See GetTakeStretchMarkerSlope
  ---@param take MediaItem_Take
  ---@param idx integer
  ---@param slope number
  ---@return boolean
  SetTakeStretchMarkerSlope = function(take, idx, slope) end,

  --- ```
  --- boolean _ = reaper.SetTempoTimeSigMarker(ReaProject proj, integer ptidx, number timepos, integer measurepos, number beatpos, number bpm, integer timesig_num, integer timesig_denom, boolean lineartempo)
  --- ```
  --- Set parameters of a tempo/time signature marker. Provide either timepos (with measurepos=-1, beatpos=-1), or measurepos and beatpos (with timepos=-1). If timesig_num and timesig_denom are zero, the previous time signature will be used. ptidx=-1 will insert a new tempo/time signature marker. See CountTempoTimeSigMarkers, GetTempoTimeSigMarker, AddTempoTimeSigMarker.
  ---@param proj ReaProject
  ---@param ptidx integer
  ---@param timepos number
  ---@param measurepos integer
  ---@param beatpos number
  ---@param bpm number
  ---@param timesig_num integer
  ---@param timesig_denom integer
  ---@param lineartempo boolean
  ---@return boolean
  SetTempoTimeSigMarker = function(proj, ptidx, timepos, measurepos, beatpos, bpm, timesig_num, timesig_denom,
                                   lineartempo) end,

  --- ```
  --- integer _ = reaper.SetThemeColor(string ini_key, integer color, integer flags)
  --- ```
  --- Temporarily updates the theme color to the color specified (or the theme default color if -1 is specified). Returns -1 on failure, otherwise returns the color (or transformed-color). Note that the UI is not updated by this, the caller should call UpdateArrange() etc as necessary. If the low bit of flags is set, any color transformations are bypassed. To read a value see GetThemeColor.Currently valid ini_keys:
  ---
  --- col_main_bg2 : Main window/transport background
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_main_text2 : Main window/transport text
  ---
  --- -- current RGB: 140,140,140
  ---
  --- col_main_textshadow : Main window text shadow (ignored if too close to text color)
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_main_3dhl : Main window 3D highlight
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_main_3dsh : Main window 3D shadow
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_main_resize2 : Main window pane resize mouseover
  ---
  --- -- current RGB: 20,160,140
  ---
  --- col_main_text : Themed window text
  ---
  --- -- current RGB: 30,34,34
  ---
  --- col_main_bg : Themed window background
  ---
  --- -- current RGB: 171,177,177
  ---
  --- col_main_editbk : Themed window edit background
  ---
  --- -- current RGB: 222,224,224
  ---
  --- col_nodarkmodemiscwnd : Do not use window theming on macOS dark mode
  ---
  --- -- bool 00000001
  ---
  --- col_transport_editbk : Transport edit background
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_toolbar_text : Toolbar button text
  ---
  --- -- current RGB: 159,159,159
  ---
  --- col_toolbar_text_on : Toolbar button enabled text
  ---
  --- -- current RGB: 26,188,152
  ---
  --- col_toolbar_frame : Toolbar frame when floating or docked
  ---
  --- -- current RGB: 71,78,78
  ---
  --- toolbararmed_color : Toolbar button armed color
  ---
  --- -- current RGB: 20,160,140
  ---
  --- toolbararmed_drawmode : Toolbar button armed fill mode
  ---
  --- -- blendmode 000300fe
  ---
  --- io_text : I/O window text
  ---
  --- -- current RGB: 67,71,71
  ---
  --- io_3dhl : I/O window 3D highlight
  ---
  --- -- current RGB: 129,135,135
  ---
  --- io_3dsh : I/O window 3D shadow
  ---
  --- -- current RGB: 203,205,205
  ---
  --- genlist_bg : Window list background
  ---
  --- -- current RGB: 220,222,222
  ---
  --- genlist_fg : Window list text
  ---
  --- -- current RGB: 36,43,43
  ---
  --- genlist_grid : Window list grid lines
  ---
  --- -- current RGB: 175,182,182
  ---
  --- genlist_selbg : Window list selected row
  ---
  --- -- current RGB: 70,97,104
  ---
  --- genlist_selfg : Window list selected text
  ---
  --- -- current RGB: 255,255,255
  ---
  --- genlist_seliabg : Window list selected row (inactive)
  ---
  --- -- current RGB: 240,240,240
  ---
  --- genlist_seliafg : Window list selected text (inactive)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- genlist_hilite : Window list highlighted text
  ---
  --- -- current RGB: 0,0,224
  ---
  --- genlist_hilite_sel : Window list highlighted selected text
  ---
  --- -- current RGB: 192,192,255
  ---
  --- col_buttonbg : Button background
  ---
  --- -- current RGB: 0,0,0
  ---
  --- col_tcp_text : Track panel text
  ---
  --- -- current RGB: 18,26,29
  ---
  --- col_tcp_textsel : Track panel (selected) text
  ---
  --- -- current RGB: 18,26,29
  ---
  --- col_seltrack : Selected track control panel background
  ---
  --- -- current RGB: 129,137,137
  ---
  --- col_seltrack2 : Unselected track control panel background (enabled with a checkbox above)
  ---
  --- -- current RGB: 129,137,137
  ---
  --- tcplocked_color : Locked track control panel overlay color
  ---
  --- -- current RGB: 51,51,51
  ---
  --- tcplocked_drawmode : Locked track control panel fill mode
  ---
  --- -- blendmode 0002c000
  ---
  --- col_tracklistbg : Empty track list area
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_mixerbg : Empty mixer list area
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_arrangebg : Empty arrange view area
  ---
  --- -- current RGB: 69,69,69
  ---
  --- arrange_vgrid : Empty arrange view area vertical grid shading
  ---
  --- -- current RGB: 70,70,70
  ---
  --- col_fadearm : Fader background when automation recording
  ---
  --- -- current RGB: 198,17,60
  ---
  --- col_fadearm2 : Fader background when automation playing
  ---
  --- -- current RGB: 0,100,72
  ---
  --- col_fadearm3 : Fader background when in inactive touch/latch
  ---
  --- -- current RGB: 128,80,0
  ---
  --- col_tl_fg : Timeline foreground
  ---
  --- -- current RGB: 116,116,116
  ---
  --- col_tl_fg2 : Timeline foreground (secondary markings)
  ---
  --- -- current RGB: 92,92,92
  ---
  --- col_tl_bg : Timeline background
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_tl_bgsel : Time selection color
  ---
  --- -- current RGB: 255,255,255
  ---
  --- timesel_drawmode : Time selection fill mode
  ---
  --- -- blendmode 00021100
  ---
  --- col_tl_bgsel2 : Timeline background (in loop points)
  ---
  --- -- current RGB: 130,136,136
  ---
  --- col_trans_bg : Transport status background
  ---
  --- -- current RGB: 51,51,51
  ---
  --- col_trans_fg : Transport status text
  ---
  --- -- current RGB: 124,124,124
  ---
  --- playrate_edited : Project play rate control when not 1.0
  ---
  --- -- current RGB: 0,255,172
  ---
  --- selitem_dot : Media item selection indicator
  ---
  --- -- current RGB: 255,255,255
  ---
  --- col_mi_label : Media item label
  ---
  --- -- current RGB: 44,44,44
  ---
  --- col_mi_label_sel : Media item label (selected)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- col_mi_label_float : Floating media item label
  ---
  --- -- current RGB: 167,173,173
  ---
  --- col_mi_label_float_sel : Floating media item label (selected)
  ---
  --- -- current RGB: 223,222,224
  ---
  --- col_mi_bg : Media item background (odd tracks)
  ---
  --- -- current RGB: 129,137,137
  ---
  --- col_mi_bg2 : Media item background (even tracks)
  ---
  --- -- current RGB: 129,137,137
  ---
  --- col_tr1_itembgsel : Media item background selected (odd tracks)
  ---
  --- -- current RGB: 177,180,180
  ---
  --- col_tr2_itembgsel : Media item background selected (even tracks)
  ---
  --- -- current RGB: 177,180,180
  ---
  --- itembg_drawmode : Media item background fill mode
  ---
  --- -- blendmode 00030000
  ---
  --- col_tr1_peaks : Media item peaks (odd tracks)
  ---
  --- -- current RGB: 26,26,26
  ---
  --- col_tr2_peaks : Media item peaks (even tracks)
  ---
  --- -- current RGB: 25,25,25
  ---
  --- col_tr1_ps2 : Media item peaks when selected (odd tracks)
  ---
  --- -- current RGB: 83,83,83
  ---
  --- col_tr2_ps2 : Media item peaks when selected (even tracks)
  ---
  --- -- current RGB: 83,83,83
  ---
  --- col_peaksedge : Media item peaks edge highlight (odd tracks)
  ---
  --- -- current RGB: 59,59,59
  ---
  --- col_peaksedge2 : Media item peaks edge highlight (even tracks)
  ---
  --- -- current RGB: 59,59,59
  ---
  --- col_peaksedgesel : Media item peaks edge highlight when selected (odd tracks)
  ---
  --- -- current RGB: 225,225,225
  ---
  --- col_peaksedgesel2 : Media item peaks edge highlight when selected (even tracks)
  ---
  --- -- current RGB: 225,225,225
  ---
  --- cc_chase_drawmode : Media item MIDI CC peaks fill mode
  ---
  --- -- blendmode 00024000
  ---
  --- col_peaksfade : Media item peaks when active in crossfade editor (fade-out)
  ---
  --- -- current RGB: 0,208,167
  ---
  --- col_peaksfade2 : Media item peaks when active in crossfade editor (fade-in)
  ---
  --- -- current RGB: 208,0,88
  ---
  --- col_mi_fades : Media item fade/volume controls
  ---
  --- -- current RGB: 121,0,0
  ---
  --- fadezone_color : Media item fade quiet zone fill color
  ---
  --- -- current RGB: 72,0,0
  ---
  --- fadezone_drawmode : Media item fade quiet zone fill mode
  ---
  --- -- blendmode 00022600
  ---
  --- fadearea_color : Media item fade full area fill color
  ---
  --- -- current RGB: 0,0,96
  ---
  --- fadearea_drawmode : Media item fade full area fill mode
  ---
  --- -- blendmode 00020000
  ---
  --- col_mi_fade2 : Media item edges of controls
  ---
  --- -- current RGB: 255,251,251
  ---
  --- col_mi_fade2_drawmode : Media item edges of controls blend mode
  ---
  --- -- blendmode 00024c00
  ---
  --- item_grouphl : Media item edge when selected via grouping
  ---
  --- -- current RGB: 51,184,48
  ---
  --- col_offlinetext : Media item "offline" text
  ---
  --- -- current RGB: 48,66,71
  ---
  --- col_stretchmarker : Media item stretch marker line
  ---
  --- -- current RGB: 197,197,197
  ---
  --- col_stretchmarker_h0 : Media item stretch marker handle (1x)
  ---
  --- -- current RGB: 195,195,195
  ---
  --- col_stretchmarker_h1 : Media item stretch marker handle (>1x)
  ---
  --- -- current RGB: 0,153,236
  ---
  --- col_stretchmarker_h2 : Media item stretch marker handle (<1x)
  ---
  --- -- current RGB: 223,0,0
  ---
  --- col_stretchmarker_b : Media item stretch marker handle edge
  ---
  --- -- current RGB: 255,255,255
  ---
  --- col_stretchmarkerm : Media item stretch marker blend mode
  ---
  --- -- blendmode 0002a800
  ---
  --- col_stretchmarker_text : Media item stretch marker text
  ---
  --- -- current RGB: 211,211,211
  ---
  --- col_stretchmarker_tm : Media item transient guide handle
  ---
  --- -- current RGB: 0,234,0
  ---
  --- take_marker : Media item take marker
  ---
  --- -- current RGB: 230,219,19
  ---
  --- selitem_tag : Selected media item bar color
  ---
  --- -- current RGB: 0,0,0
  ---
  --- activetake_tag : Active media item take bar color
  ---
  --- -- current RGB: 15,255,153
  ---
  --- col_tr1_bg : Track background (odd tracks)
  ---
  --- -- current RGB: 66,66,66
  ---
  --- col_tr2_bg : Track background (even tracks)
  ---
  --- -- current RGB: 69,69,69
  ---
  --- selcol_tr1_bg : Selected track background (odd tracks)
  ---
  --- -- current RGB: 81,81,81
  ---
  --- selcol_tr2_bg : Selected track background (even tracks)
  ---
  --- -- current RGB: 79,79,79
  ---
  --- track_lane_tabcol : Track fixed lane button
  ---
  --- -- current RGB: 87,96,87
  ---
  --- track_lanesolo_tabcol : Track fixed lane button when only this lane plays
  ---
  --- -- current RGB: 201,201,38
  ---
  --- track_lanesolo_text : Track fixed lane button text
  ---
  --- -- current RGB: 200,200,200
  ---
  --- track_lane_gutter : Track fixed lane add area
  ---
  --- -- current RGB: 128,128,128
  ---
  --- track_lane_gutter_drawmode : Track fixed lane add fill mode
  ---
  --- -- blendmode 00024000
  ---
  --- col_tr1_divline : Track divider line (odd tracks)
  ---
  --- -- current RGB: 66,66,66
  ---
  --- col_tr2_divline : Track divider line (even tracks)
  ---
  --- -- current RGB: 69,69,69
  ---
  --- col_envlane1_divline : Envelope lane divider line (odd tracks)
  ---
  --- -- current RGB: 114,120,120
  ---
  --- col_envlane2_divline : Envelope lane divider line (even tracks)
  ---
  --- -- current RGB: 114,120,120
  ---
  --- mute_overlay_col : Muted/unsoloed track/item overlay color
  ---
  --- -- current RGB: 65,65,65
  ---
  --- mute_overlay_mode : Muted/unsoloed track/item overlay mode
  ---
  --- -- blendmode 0002a600
  ---
  --- inactive_take_overlay_col : Inactive take/lane overlay color
  ---
  --- -- current RGB: 48,48,48
  ---
  --- inactive_take_overlay_mode : Inactive take/lane overlay mode
  ---
  --- -- blendmode 00028000
  ---
  --- locked_overlay_col : Locked track/item overlay color
  ---
  --- -- current RGB: 0,0,0
  ---
  --- locked_overlay_mode : Locked track/item overlay mode
  ---
  --- -- blendmode 00025c03
  ---
  --- marquee_fill : Marquee fill
  ---
  --- -- current RGB: 128,128,110
  ---
  --- marquee_drawmode : Marquee fill mode
  ---
  --- -- blendmode 000299fe
  ---
  --- marquee_outline : Marquee outline
  ---
  --- -- current RGB: 255,255,255
  ---
  --- marqueezoom_fill : Marquee zoom fill
  ---
  --- -- current RGB: 255,255,255
  ---
  --- marqueezoom_drawmode : Marquee zoom fill mode
  ---
  --- -- blendmode 00024002
  ---
  --- marqueezoom_outline : Marquee zoom outline
  ---
  --- -- current RGB: 0,255,0
  ---
  --- areasel_fill : Razor edit area fill
  ---
  --- -- current RGB: 31,233,192
  ---
  --- areasel_drawmode : Razor edit area fill mode
  ---
  --- -- blendmode 00021801
  ---
  --- areasel_outline : Razor edit area outline
  ---
  --- -- current RGB: 0,251,201
  ---
  --- areasel_outlinemode : Razor edit area outline mode
  ---
  --- -- blendmode 0002c000
  ---
  --- linkedlane_fill : Fixed lane comp area fill
  ---
  --- -- current RGB: 255,203,0
  ---
  --- linkedlane_fillmode : Fixed lane comp area fill mode
  ---
  --- -- blendmode 00020c01
  ---
  --- linkedlane_outline : Fixed lane comp area outline
  ---
  --- -- current RGB: 255,237,164
  ---
  --- linkedlane_outlinemode : Fixed lane comp area outline mode
  ---
  --- -- blendmode 0002c000
  ---
  --- linkedlane_unsynced : Fixed lane comp lane unsynced media item
  ---
  --- -- current RGB: 0,198,255
  ---
  --- linkedlane_unsynced_mode : Fixed lane comp lane unsynced media item mode
  ---
  --- -- blendmode 0002ff00
  ---
  --- col_cursor : Edit cursor
  ---
  --- -- current RGB: 51,152,135
  ---
  --- col_cursor2 : Edit cursor (alternate)
  ---
  --- -- current RGB: 51,152,135
  ---
  --- playcursor_color : Play cursor
  ---
  --- -- current RGB: 239,200,82
  ---
  --- playcursor_drawmode : Play cursor fill mode
  ---
  --- -- blendmode 00028000
  ---
  --- col_gridlines2 : Grid lines (start of measure)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- col_gridlines2dm : Grid lines (start of measure) - draw mode
  ---
  --- -- blendmode 0002c000
  ---
  --- col_gridlines3 : Grid lines (start of beats)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- col_gridlines3dm : Grid lines (start of beats) - draw mode
  ---
  --- -- blendmode 00025400
  ---
  --- col_gridlines : Grid lines (in between beats)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- col_gridlines1dm : Grid lines (in between beats) - draw mode
  ---
  --- -- blendmode 00025900
  ---
  --- guideline_color : Editing guide line color
  ---
  --- -- current RGB: 0,157,153
  ---
  --- guideline_drawmode : Editing guide fill mode
  ---
  --- -- blendmode 0002c000
  ---
  --- region : Regions
  ---
  --- -- current RGB: 86,114,114
  ---
  --- region_lane_bg : Region lane background
  ---
  --- -- current RGB: 51,51,51
  ---
  --- region_lane_text : Region lane text
  ---
  --- -- current RGB: 185,196,196
  ---
  --- marker : Markers
  ---
  --- -- current RGB: 160,0,0
  ---
  --- marker_lane_bg : Marker lane background
  ---
  --- -- current RGB: 60,60,60
  ---
  --- marker_lane_text : Marker lane text
  ---
  --- -- current RGB: 164,164,164
  ---
  --- col_tsigmark : Time signature change marker
  ---
  --- -- current RGB: 14,18,17
  ---
  --- ts_lane_bg : Time signature lane background
  ---
  --- -- current RGB: 51,51,51
  ---
  --- ts_lane_text : Time signature lane text
  ---
  --- -- current RGB: 165,165,165
  ---
  --- timesig_sel_bg : Time signature marker selected background
  ---
  --- -- current RGB: 160,0,0
  ---
  --- col_routinghl1 : Routing matrix row highlight
  ---
  --- -- current RGB: 255,255,192
  ---
  --- col_routinghl2 : Routing matrix column highlight
  ---
  --- -- current RGB: 128,128,255
  ---
  --- col_routingact : Routing matrix input activity highlight
  ---
  --- -- current RGB: 64,255,64
  ---
  --- col_vudoint : Theme has interlaced VU meters
  ---
  --- -- bool 00000000
  ---
  --- col_vuclip : VU meter clip indicator
  ---
  --- -- current RGB: 187,37,0
  ---
  --- col_vutop : VU meter top
  ---
  --- -- current RGB: 0,254,149
  ---
  --- col_vumid : VU meter middle
  ---
  --- -- current RGB: 0,218,173
  ---
  --- col_vubot : VU meter bottom
  ---
  --- -- current RGB: 0,191,191
  ---
  --- col_vuintcol : VU meter interlace/edge color
  ---
  --- -- current RGB: 32,32,32
  ---
  --- vu_gr_bgcol : VU meter gain reduction background
  ---
  --- -- current RGB: 32,32,32
  ---
  --- vu_gr_fgcol : VU meter gain reduction indicator
  ---
  --- -- current RGB: 224,224,0
  ---
  --- col_vumidi : VU meter midi activity
  ---
  --- -- current RGB: 255,196,0
  ---
  --- col_vuind1 : VU (indicator) - no signal
  ---
  --- -- current RGB: 32,32,32
  ---
  --- col_vuind2 : VU (indicator) - low signal
  ---
  --- -- current RGB: 0,40,0
  ---
  --- col_vuind3 : VU (indicator) - med signal
  ---
  --- -- current RGB: 32,255,0
  ---
  --- col_vuind4 : VU (indicator) - hot signal
  ---
  --- -- current RGB: 255,255,0
  ---
  --- mcp_sends_normal : Sends text: normal
  ---
  --- -- current RGB: 191,191,191
  ---
  --- mcp_sends_muted : Sends text: muted
  ---
  --- -- current RGB: 216,61,61
  ---
  --- mcp_send_midihw : Sends text: MIDI hardware
  ---
  --- -- current RGB: 105,241,214
  ---
  --- mcp_sends_levels : Sends level
  ---
  --- -- current RGB: 48,66,71
  ---
  --- mcp_fx_normal : FX insert text: normal
  ---
  --- -- current RGB: 38,38,38
  ---
  --- mcp_fx_bypassed : FX insert text: bypassed
  ---
  --- -- current RGB: 223,190,0
  ---
  --- mcp_fx_offlined : FX insert text: offline
  ---
  --- -- current RGB: 255,21,91
  ---
  --- mcp_fxparm_normal : FX parameter text: normal
  ---
  --- -- current RGB: 38,38,38
  ---
  --- mcp_fxparm_bypassed : FX parameter text: bypassed
  ---
  --- -- current RGB: 211,120,65
  ---
  --- mcp_fxparm_offlined : FX parameter text: offline
  ---
  --- -- current RGB: 216,61,61
  ---
  --- tcp_list_scrollbar : List scrollbar (track panel)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- tcp_list_scrollbar_mode : List scrollbar (track panel) - draw mode
  ---
  --- -- blendmode 00023300
  ---
  --- tcp_list_scrollbar_mouseover : List scrollbar mouseover (track panel)
  ---
  --- -- current RGB: 20,97,78
  ---
  --- tcp_list_scrollbar_mouseover_mode : List scrollbar mouseover (track panel) - draw mode
  ---
  --- -- blendmode 0002cc00
  ---
  --- mcp_list_scrollbar : List scrollbar (mixer panel)
  ---
  --- -- current RGB: 255,255,255
  ---
  --- mcp_list_scrollbar_mode : List scrollbar (mixer panel) - draw mode
  ---
  --- -- blendmode 00021e00
  ---
  --- mcp_list_scrollbar_mouseover : List scrollbar mouseover (mixer panel)
  ---
  --- -- current RGB: 64,191,159
  ---
  --- mcp_list_scrollbar_mouseover_mode : List scrollbar mouseover (mixer panel) - draw mode
  ---
  --- -- blendmode 00028000
  ---
  --- midi_rulerbg : MIDI editor ruler background
  ---
  --- -- current RGB: 68,68,68
  ---
  --- midi_rulerfg : MIDI editor ruler text
  ---
  --- -- current RGB: 154,154,154
  ---
  --- midi_grid2 : MIDI editor grid line (start of measure)
  ---
  --- -- current RGB: 255,255,255
  ---
  --- midi_griddm2 : MIDI editor grid line (start of measure) - draw mode
  ---
  --- -- blendmode 00021e00
  ---
  --- midi_grid3 : MIDI editor grid line (start of beats)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_griddm3 : MIDI editor grid line (start of beats) - draw mode
  ---
  --- -- blendmode 00023300
  ---
  --- midi_grid1 : MIDI editor grid line (between beats)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_griddm1 : MIDI editor grid line (between beats) - draw mode
  ---
  --- -- blendmode 00021e00
  ---
  --- midi_trackbg1 : MIDI editor background color (naturals)
  ---
  --- -- current RGB: 70,70,70
  ---
  --- midi_trackbg2 : MIDI editor background color (sharps/flats)
  ---
  --- -- current RGB: 62,62,62
  ---
  --- midi_trackbg_outer1 : MIDI editor background color, out of bounds (naturals)
  ---
  --- -- current RGB: 51,51,51
  ---
  --- midi_trackbg_outer2 : MIDI editor background color, out of bounds (sharps/flats)
  ---
  --- -- current RGB: 54,54,54
  ---
  --- midi_selpitch1 : MIDI editor background color, selected pitch (naturals)
  ---
  --- -- current RGB: 66,100,94
  ---
  --- midi_selpitch2 : MIDI editor background color, selected pitch (sharps/flats)
  ---
  --- -- current RGB: 71,105,99
  ---
  --- midi_selbg : MIDI editor time selection color
  ---
  --- -- current RGB: 255,255,255
  ---
  --- midi_selbg_drawmode : MIDI editor time selection fill mode
  ---
  --- -- blendmode 00021001
  ---
  --- midi_gridhc : MIDI editor CC horizontal center line
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_gridhcdm : MIDI editor CC horizontal center line - draw mode
  ---
  --- -- blendmode 00030000
  ---
  --- midi_gridh : MIDI editor CC horizontal line
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_gridhdm : MIDI editor CC horizontal line - draw mode
  ---
  --- -- blendmode 00028000
  ---
  --- midi_ccbut : MIDI editor CC lane add/remove buttons
  ---
  --- -- current RGB: 111,111,111
  ---
  --- midi_ccbut_text : MIDI editor CC lane button text
  ---
  --- -- current RGB: 77,77,77
  ---
  --- midi_ccbut_arrow : MIDI editor CC lane button arrow
  ---
  --- -- current RGB: 77,77,77
  ---
  --- midioct : MIDI editor octave line color
  ---
  --- -- current RGB: 46,46,46
  ---
  --- midi_inline_trackbg1 : MIDI inline background color (naturals)
  ---
  --- -- current RGB: 70,70,70
  ---
  --- midi_inline_trackbg2 : MIDI inline background color (sharps/flats)
  ---
  --- -- current RGB: 62,62,62
  ---
  --- midioct_inline : MIDI inline octave line color
  ---
  --- -- current RGB: 46,46,46
  ---
  --- midi_endpt : MIDI editor end marker
  ---
  --- -- current RGB: 19,189,153
  ---
  --- midi_notebg : MIDI editor note, unselected (midi_note_colormap overrides)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_notefg : MIDI editor note, selected (midi_note_colormap overrides)
  ---
  --- -- current RGB: 255,255,255
  ---
  --- midi_notemute : MIDI editor note, muted, unselected (midi_note_colormap overrides)
  ---
  --- -- current RGB: 128,0,0
  ---
  --- midi_notemute_sel : MIDI editor note, muted, selected (midi_note_colormap overrides)
  ---
  --- -- current RGB: 255,0,0
  ---
  --- midi_itemctl : MIDI editor note controls
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_ofsn : MIDI editor note (offscreen)
  ---
  --- -- current RGB: 73,73,73
  ---
  --- midi_ofsnsel : MIDI editor note (offscreen, selected)
  ---
  --- -- current RGB: 19,189,153
  ---
  --- midi_editcurs : MIDI editor cursor
  ---
  --- -- current RGB: 51,152,135
  ---
  --- midi_pkey1 : MIDI piano key color (naturals background, sharps/flats text)
  ---
  --- -- current RGB: 255,255,255
  ---
  --- midi_pkey2 : MIDI piano key color (sharps/flats background, naturals text)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midi_pkey3 : MIDI piano key color (selected)
  ---
  --- -- current RGB: 93,93,93
  ---
  --- midi_noteon_flash : MIDI piano key note-on flash
  ---
  --- -- current RGB: 64,0,0
  ---
  --- midi_leftbg : MIDI piano pane background
  ---
  --- -- current RGB: 171,177,177
  ---
  --- midifont_col_light_unsel : MIDI editor note text and control color, unselected (light)
  ---
  --- -- current RGB: 255,255,255
  ---
  --- midifont_col_dark_unsel : MIDI editor note text and control color, unselected (dark)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midifont_mode_unsel : MIDI editor note text and control mode, unselected
  ---
  --- -- blendmode 00028000
  ---
  --- midifont_col_light : MIDI editor note text and control color (light)
  ---
  --- -- current RGB: 255,255,255
  ---
  --- midifont_col_dark : MIDI editor note text and control color (dark)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midifont_mode : MIDI editor note text and control mode
  ---
  --- -- blendmode 0002c000
  ---
  --- score_bg : MIDI notation editor background
  ---
  --- -- current RGB: 255,255,255
  ---
  --- score_fg : MIDI notation editor staff/notation/text
  ---
  --- -- current RGB: 0,0,0
  ---
  --- score_sel : MIDI notation editor selected staff/notation/text
  ---
  --- -- current RGB: 0,0,255
  ---
  --- score_timesel : MIDI notation editor time selection
  ---
  --- -- current RGB: 255,255,224
  ---
  --- score_loop : MIDI notation editor loop points, selected pitch
  ---
  --- -- current RGB: 255,192,0
  ---
  --- midieditorlist_bg : MIDI list editor background
  ---
  --- -- current RGB: 84,84,84
  ---
  --- midieditorlist_fg : MIDI list editor text
  ---
  --- -- current RGB: 224,224,224
  ---
  --- midieditorlist_grid : MIDI list editor grid lines
  ---
  --- -- current RGB: 171,177,177
  ---
  --- midieditorlist_selbg : MIDI list editor selected row
  ---
  --- -- current RGB: 238,240,240
  ---
  --- midieditorlist_selfg : MIDI list editor selected text
  ---
  --- -- current RGB: 42,44,44
  ---
  --- midieditorlist_seliabg : MIDI list editor selected row (inactive)
  ---
  --- -- current RGB: 240,240,240
  ---
  --- midieditorlist_seliafg : MIDI list editor selected text (inactive)
  ---
  --- -- current RGB: 0,0,0
  ---
  --- midieditorlist_bg2 : MIDI list editor background (secondary)
  ---
  --- -- current RGB: 170,176,176
  ---
  --- midieditorlist_fg2 : MIDI list editor text (secondary)
  ---
  --- -- current RGB: 68,70,70
  ---
  --- midieditorlist_selbg2 : MIDI list editor selected row (secondary)
  ---
  --- -- current RGB: 214,217,217
  ---
  --- midieditorlist_selfg2 : MIDI list editor selected text (secondary)
  ---
  --- -- current RGB: 75,77,77
  ---
  --- col_explorer_sel : Media explorer selection
  ---
  --- -- current RGB: 255,255,255
  ---
  --- col_explorer_seldm : Media explorer selection mode
  ---
  --- -- blendmode 00026600
  ---
  --- col_explorer_seledge : Media explorer selection edge
  ---
  --- -- current RGB: 0,0,0
  ---
  --- explorer_grid : Media explorer grid, markers
  ---
  --- -- current RGB: 255,255,255
  ---
  --- explorer_pitchtext : Media explorer pitch detection text
  ---
  --- -- current RGB: 255,255,255
  ---
  --- docker_shadow : Tab control shadow
  ---
  --- -- current RGB: 51,51,51
  ---
  --- docker_selface : Tab control selected tab
  ---
  --- -- current RGB: 125,137,137
  ---
  --- docker_unselface : Tab control unselected tab
  ---
  --- -- current RGB: 42,42,42
  ---
  --- docker_text : Tab control text
  ---
  --- -- current RGB: 129,137,137
  ---
  --- docker_text_sel : Tab control text selected tab
  ---
  --- -- current RGB: 26,26,26
  ---
  --- docker_bg : Tab control background
  ---
  --- -- current RGB: 60,60,60
  ---
  --- windowtab_bg : Tab control background in windows
  ---
  --- -- current RGB: 60,60,60
  ---
  --- auto_item_unsel : Envelope: Unselected automation item
  ---
  --- -- current RGB: 96,96,96
  ---
  --- col_env1 : Envelope: Volume (pre-FX)
  ---
  --- -- current RGB: 43,255,53
  ---
  --- col_env2 : Envelope: Volume
  ---
  --- -- current RGB: 64,255,179
  ---
  --- env_trim_vol : Envelope: Trim Volume
  ---
  --- -- current RGB: 255,4,149
  ---
  --- col_env3 : Envelope: Pan (pre-FX)
  ---
  --- -- current RGB: 255,0,0
  ---
  --- col_env4 : Envelope: Pan
  ---
  --- -- current RGB: 255,170,43
  ---
  --- env_track_mute : Envelope: Mute
  ---
  --- -- current RGB: 255,53,94
  ---
  --- col_env5 : Envelope: Master playrate
  ---
  --- -- current RGB: 193,255,225
  ---
  --- col_env6 : Envelope: Master tempo
  ---
  --- -- current RGB: 0,255,255
  ---
  --- col_env7 : Envelope: Width / Send volume
  ---
  --- -- current RGB: 255,255,0
  ---
  --- col_env8 : Envelope: Send pan
  ---
  --- -- current RGB: 172,255,47
  ---
  --- col_env9 : Envelope: Send volume 2
  ---
  --- -- current RGB: 255,252,145
  ---
  --- col_env10 : Envelope: Send pan 2
  ---
  --- -- current RGB: 221,255,157
  ---
  --- env_sends_mute : Envelope: Send mute
  ---
  --- -- current RGB: 244,49,0
  ---
  --- col_env11 : Envelope: Audio hardware output volume
  ---
  --- -- current RGB: 0,255,255
  ---
  --- col_env12 : Envelope: Audio hardware output pan
  ---
  --- -- current RGB: 255,255,0
  ---
  --- col_env13 : Envelope: FX parameter 1
  ---
  --- -- current RGB: 181,106,255
  ---
  --- col_env14 : Envelope: FX parameter 2
  ---
  --- -- current RGB: 74,179,255
  ---
  --- col_env15 : Envelope: FX parameter 3
  ---
  --- -- current RGB: 74,92,255
  ---
  --- col_env16 : Envelope: FX parameter 4
  ---
  --- -- current RGB: 0,242,255
  ---
  --- env_item_vol : Envelope: Item take volume
  ---
  --- -- current RGB: 255,47,109
  ---
  --- env_item_pan : Envelope: Item take pan
  ---
  --- -- current RGB: 255,189,100
  ---
  --- env_item_mute : Envelope: Item take mute
  ---
  --- -- current RGB: 255,111,175
  ---
  --- env_item_pitch : Envelope: Item take pitch
  ---
  --- -- current RGB: 0,255,255
  ---
  --- wiring_grid2 : Wiring: Background
  ---
  --- -- current RGB: 46,46,46
  ---
  --- wiring_grid : Wiring: Background grid lines
  ---
  --- -- current RGB: 51,51,51
  ---
  --- wiring_border : Wiring: Box border
  ---
  --- -- current RGB: 153,153,153
  ---
  --- wiring_tbg : Wiring: Box background
  ---
  --- -- current RGB: 38,38,38
  ---
  --- wiring_ticon : Wiring: Box foreground
  ---
  --- -- current RGB: 204,204,204
  ---
  --- wiring_recbg : Wiring: Record section background
  ---
  --- -- current RGB: 101,77,77
  ---
  --- wiring_recitem : Wiring: Record section foreground
  ---
  --- -- current RGB: 63,33,33
  ---
  --- wiring_media : Wiring: Media
  ---
  --- -- current RGB: 32,64,32
  ---
  --- wiring_recv : Wiring: Receives
  ---
  --- -- current RGB: 92,92,92
  ---
  --- wiring_send : Wiring: Sends
  ---
  --- -- current RGB: 92,92,92
  ---
  --- wiring_fader : Wiring: Fader
  ---
  --- -- current RGB: 128,128,192
  ---
  --- wiring_parent : Wiring: Master/Parent
  ---
  --- -- current RGB: 64,128,128
  ---
  --- wiring_parentwire_border : Wiring: Master/Parent wire border
  ---
  --- -- current RGB: 100,100,100
  ---
  --- wiring_parentwire_master : Wiring: Master/Parent to master wire
  ---
  --- -- current RGB: 192,192,192
  ---
  --- wiring_parentwire_folder : Wiring: Master/Parent to parent folder wire
  ---
  --- -- current RGB: 128,128,128
  ---
  --- wiring_pin_normal : Wiring: Pins normal
  ---
  --- -- current RGB: 192,192,192
  ---
  --- wiring_pin_connected : Wiring: Pins connected
  ---
  --- -- current RGB: 96,144,96
  ---
  --- wiring_pin_disconnected : Wiring: Pins disconnected
  ---
  --- -- current RGB: 64,32,32
  ---
  --- wiring_horz_col : Wiring: Horizontal pin connections
  ---
  --- -- current RGB: 72,72,72
  ---
  --- wiring_sendwire : Wiring: Send hanging wire
  ---
  --- -- current RGB: 128,128,128
  ---
  --- wiring_hwoutwire : Wiring: Hardware output wire
  ---
  --- -- current RGB: 128,128,128
  ---
  --- wiring_recinputwire : Wiring: Record input wire
  ---
  --- -- current RGB: 255,128,128
  ---
  --- wiring_hwout : Wiring: System hardware outputs
  ---
  --- -- current RGB: 64,64,64
  ---
  --- wiring_recinput : Wiring: System record inputs
  ---
  --- -- current RGB: 128,64,64
  ---
  --- wiring_activity : Wiring: Activity lights
  ---
  --- -- current RGB: 64,255,64
  ---
  --- autogroup : Automatic track group
  ---
  --- -- current RGB: 255,255,255
  ---
  --- group_0 : Group #1
  ---
  --- -- current RGB: 255,0,0
  ---
  --- group_1 : Group #2
  ---
  --- -- current RGB: 0,255,0
  ---
  --- group_2 : Group #3
  ---
  --- -- current RGB: 0,0,255
  ---
  --- group_3 : Group #4
  ---
  --- -- current RGB: 255,255,0
  ---
  --- group_4 : Group #5
  ---
  --- -- current RGB: 255,0,255
  ---
  --- group_5 : Group #6
  ---
  --- -- current RGB: 0,255,255
  ---
  --- group_6 : Group #7
  ---
  --- -- current RGB: 192,0,0
  ---
  --- group_7 : Group #8
  ---
  --- -- current RGB: 0,192,0
  ---
  --- group_8 : Group #9
  ---
  --- -- current RGB: 0,0,192
  ---
  --- group_9 : Group #10
  ---
  --- -- current RGB: 192,192,0
  ---
  --- group_10 : Group #11
  ---
  --- -- current RGB: 192,0,192
  ---
  --- group_11 : Group #12
  ---
  --- -- current RGB: 0,192,192
  ---
  --- group_12 : Group #13
  ---
  --- -- current RGB: 128,0,0
  ---
  --- group_13 : Group #14
  ---
  --- -- current RGB: 0,128,0
  ---
  --- group_14 : Group #15
  ---
  --- -- current RGB: 0,0,128
  ---
  --- group_15 : Group #16
  ---
  --- -- current RGB: 128,128,0
  ---
  --- group_16 : Group #17
  ---
  --- -- current RGB: 128,0,128
  ---
  --- group_17 : Group #18
  ---
  --- -- current RGB: 0,128,128
  ---
  --- group_18 : Group #19
  ---
  --- -- current RGB: 192,128,0
  ---
  --- group_19 : Group #20
  ---
  --- -- current RGB: 0,192,128
  ---
  --- group_20 : Group #21
  ---
  --- -- current RGB: 0,128,192
  ---
  --- group_21 : Group #22
  ---
  --- -- current RGB: 192,128,0
  ---
  --- group_22 : Group #23
  ---
  --- -- current RGB: 128,0,192
  ---
  --- group_23 : Group #24
  ---
  --- -- current RGB: 128,192,0
  ---
  --- group_24 : Group #25
  ---
  --- -- current RGB: 64,0,0
  ---
  --- group_25 : Group #26
  ---
  --- -- current RGB: 0,64,0
  ---
  --- group_26 : Group #27
  ---
  --- -- current RGB: 0,0,64
  ---
  --- group_27 : Group #28
  ---
  --- -- current RGB: 64,64,0
  ---
  --- group_28 : Group #29
  ---
  --- -- current RGB: 64,0,64
  ---
  --- group_29 : Group #30
  ---
  --- -- current RGB: 0,64,64
  ---
  --- group_30 : Group #31
  ---
  --- -- current RGB: 64,0,64
  ---
  --- group_31 : Group #32
  ---
  --- -- current RGB: 0,64,64
  ---
  --- group_32 : Group #33
  ---
  --- -- current RGB: 128,255,255
  ---
  --- group_33 : Group #34
  ---
  --- -- current RGB: 128,0,128
  ---
  --- group_34 : Group #35
  ---
  --- -- current RGB: 1,255,128
  ---
  --- group_35 : Group #36
  ---
  --- -- current RGB: 128,0,255
  ---
  --- group_36 : Group #37
  ---
  --- -- current RGB: 1,255,255
  ---
  --- group_37 : Group #38
  ---
  --- -- current RGB: 1,0,128
  ---
  --- group_38 : Group #39
  ---
  --- -- current RGB: 128,255,224
  ---
  --- group_39 : Group #40
  ---
  --- -- current RGB: 128,63,128
  ---
  --- group_40 : Group #41
  ---
  --- -- current RGB: 32,255,128
  ---
  --- group_41 : Group #42
  ---
  --- -- current RGB: 128,63,224
  ---
  --- group_42 : Group #43
  ---
  --- -- current RGB: 32,255,224
  ---
  --- group_43 : Group #44
  ---
  --- -- current RGB: 32,63,128
  ---
  --- group_44 : Group #45
  ---
  --- -- current RGB: 128,255,192
  ---
  --- group_45 : Group #46
  ---
  --- -- current RGB: 128,127,128
  ---
  --- group_46 : Group #47
  ---
  --- -- current RGB: 64,255,128
  ---
  --- group_47 : Group #48
  ---
  --- -- current RGB: 128,127,192
  ---
  --- group_48 : Group #49
  ---
  --- -- current RGB: 64,255,192
  ---
  --- group_49 : Group #50
  ---
  --- -- current RGB: 64,127,128
  ---
  --- group_50 : Group #51
  ---
  --- -- current RGB: 128,127,224
  ---
  --- group_51 : Group #52
  ---
  --- -- current RGB: 64,63,128
  ---
  --- group_52 : Group #53
  ---
  --- -- current RGB: 32,127,128
  ---
  --- group_53 : Group #54
  ---
  --- -- current RGB: 128,127,224
  ---
  --- group_54 : Group #55
  ---
  --- -- current RGB: 32,255,192
  ---
  --- group_55 : Group #56
  ---
  --- -- current RGB: 128,63,192
  ---
  --- group_56 : Group #57
  ---
  --- -- current RGB: 128,255,160
  ---
  --- group_57 : Group #58
  ---
  --- -- current RGB: 128,191,128
  ---
  --- group_58 : Group #59
  ---
  --- -- current RGB: 96,255,128
  ---
  --- group_59 : Group #60
  ---
  --- -- current RGB: 128,191,160
  ---
  --- group_60 : Group #61
  ---
  --- -- current RGB: 96,255,160
  ---
  --- group_61 : Group #62
  ---
  --- -- current RGB: 96,191,128
  ---
  --- group_62 : Group #63
  ---
  --- -- current RGB: 96,255,160
  ---
  --- group_63 : Group #64
  ---
  --- -- current RGB: 96,191,128
  ---@param ini_key string
  ---@param color integer
  ---@param flags integer
  ---@return integer
  SetThemeColor = function(ini_key, color, flags) end,

  --- ```
  --- boolean _ = reaper.SetToggleCommandState(integer section_id, integer command_id, integer state)
  --- ```
  --- Updates the toggle state of an action, returns true if succeeded. Only ReaScripts can have their toggle states changed programmatically. See RefreshToolbar2.
  ---@param section_id integer
  ---@param command_id integer
  ---@param state integer
  ---@return boolean
  SetToggleCommandState = function(section_id, command_id, state) end,

  --- ```
  --- reaper.SetTrackAutomationMode(MediaTrack tr, integer mode)
  --- ```
  ---@param tr MediaTrack
  ---@param mode integer
  SetTrackAutomationMode = function(tr, mode) end,

  --- ```
  --- reaper.SetTrackColor(MediaTrack track, integer color)
  --- ```
  --- Set the custom track color, color is OS dependent (i.e. ColorToNative(r,g,b). To unset the track color, see SetMediaTrackInfo_Value I_CUSTOMCOLOR
  ---@param track MediaTrack
  ---@param color integer
  SetTrackColor = function(track, color) end,

  --- ```
  --- boolean _ = reaper.SetTrackMIDILyrics(MediaTrack track, integer flag, string str)
  --- ```
  --- Set all MIDI lyrics on the track. Lyrics will be stuffed into any MIDI items found in range. Flag is unused at present. str is passed in as beat position, tab, text, tab (example with flag=2: "1.1.2\tLyric for measure 1 beat 2\t2.1.1\tLyric for measure 2 beat 1	"). See GetTrackMIDILyrics
  ---@param track MediaTrack
  ---@param flag integer
  ---@param str string
  ---@return boolean
  SetTrackMIDILyrics = function(track, flag, str) end,

  --- ```
  --- boolean _ = reaper.SetTrackMIDINoteName(integer track, integer pitch, integer chan, string name)
  --- ```
  --- channel < 0 assigns these note names to all channels.
  ---@param track integer
  ---@param pitch integer
  ---@param chan integer
  ---@param name string
  ---@return boolean
  SetTrackMIDINoteName = function(track, pitch, chan, name) end,

  --- ```
  --- boolean _ = reaper.SetTrackMIDINoteNameEx(ReaProject proj, MediaTrack track, integer pitch, integer chan, string name)
  --- ```
  --- channel < 0 assigns note name to all channels. pitch 128 assigns name for CC0, pitch 129 for CC1, etc.
  ---@param proj ReaProject
  ---@param track MediaTrack
  ---@param pitch integer
  ---@param chan integer
  ---@param name string
  ---@return boolean
  SetTrackMIDINoteNameEx = function(proj, track, pitch, chan, name) end,

  --- ```
  --- reaper.SetTrackSelected(MediaTrack track, boolean selected)
  --- ```
  ---@param track MediaTrack
  ---@param selected boolean
  SetTrackSelected = function(track, selected) end,

  --- ```
  --- boolean _ = reaper.SetTrackSendInfo_Value(MediaTrack tr, integer category, integer sendidx, string parmname, number newvalue)
  --- ```
  --- Set send/receive/hardware output numerical-value attributes, return true on success.
  ---
  --- category is <0 for receives, 0=sends, >0 for hardware outputs
  ---
  --- parameter names:
  ---
  --- B_MUTE : bool *
  ---
  --- B_PHASE : bool * : true to flip phase
  ---
  --- B_MONO : bool *
  ---
  --- D_VOL : double * : 1.0 = +0dB etc
  ---
  --- D_PAN : double * : -1..+1
  ---
  --- D_PANLAW : double * : 1.0=+0.0db, 0.5=-6dB, -1.0 = projdef etc
  ---
  --- I_SENDMODE : int * : 0=post-fader, 1=pre-fx, 2=post-fx (deprecated), 3=post-fx
  ---
  --- I_AUTOMODE : int * : automation mode (-1=use track automode, 0=trim/off, 1=read, 2=touch, 3=write, 4=latch)
  ---
  --- I_SRCCHAN : int * : -1 for no audio send. Low 10 bits specify channel offset, and higher bits specify channel count. (srcchan>>10) == 0 for stereo, 1 for mono, 2 for 4 channel, 3 for 6 channel, etc.
  ---
  --- I_DSTCHAN : int * : low 10 bits are destination index, &1024 set to mix to mono.
  ---
  --- I_MIDIFLAGS : int * : low 5 bits=source channel 0=all, 1-16, next 5 bits=dest channel, 0=orig, 1-16=chan
  ---
  --- See CreateTrackSend, RemoveTrackSend, GetTrackNumSends.
  ---@param tr MediaTrack
  ---@param category integer
  ---@param sendidx integer
  ---@param parmname string
  ---@param newvalue number
  ---@return boolean
  ---@deprecated
  SetTrackSendInfo_Value = function(tr, category, sendidx, parmname, newvalue) end,

  --- ```
  --- boolean _ = reaper.SetTrackSendUIPan(MediaTrack track, integer send_idx, number pan, integer isend)
  --- ```
  --- send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends. isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal tweak.
  ---@param track MediaTrack
  ---@param send_idx integer
  ---@param pan number
  ---@param isend integer
  ---@return boolean
  SetTrackSendUIPan = function(track, send_idx, pan, isend) end,

  --- ```
  --- boolean _ = reaper.SetTrackSendUIVol(MediaTrack track, integer send_idx, number vol, integer isend)
  --- ```
  --- send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends. isend=1 for end of edit, -1 for an instant edit (such as reset), 0 for normal tweak.
  ---@param track MediaTrack
  ---@param send_idx integer
  ---@param vol number
  ---@param isend integer
  ---@return boolean
  SetTrackSendUIVol = function(track, send_idx, vol, isend) end,

  --- ```
  --- boolean _ = reaper.SetTrackStateChunk(MediaTrack track, string str, boolean isundo)
  --- ```
  --- Sets the RPPXML state of a track, returns true if successful. Undo flag is a performance/caching hint.
  ---@param track MediaTrack
  ---@param str string
  ---@param isundo boolean
  ---@return boolean
  SetTrackStateChunk = function(track, str, isundo) end,

  --- ```
  --- integer _ = reaper.SetTrackUIInputMonitor(MediaTrack track, integer monitor, integer igngroupflags)
  --- ```
  --- monitor: 0=no monitoring, 1=monitoring, 2=auto-monitoring. returns new value or -1 if error. igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param monitor integer
  ---@param igngroupflags integer
  ---@return integer
  SetTrackUIInputMonitor = function(track, monitor, igngroupflags) end,

  --- ```
  --- integer _ = reaper.SetTrackUIMute(MediaTrack track, integer mute, integer igngroupflags)
  --- ```
  --- mute: <0 toggles, >0 sets mute, 0=unsets mute. returns new value or -1 if error. igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param mute integer
  ---@param igngroupflags integer
  ---@return integer
  SetTrackUIMute = function(track, mute, igngroupflags) end,

  --- ```
  --- number _ = reaper.SetTrackUIPan(MediaTrack track, number pan, boolean relative, boolean done, integer igngroupflags)
  --- ```
  --- igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param pan number
  ---@param relative boolean
  ---@param done boolean
  ---@param igngroupflags integer
  ---@return number
  SetTrackUIPan = function(track, pan, relative, done, igngroupflags) end,

  --- ```
  --- integer _ = reaper.SetTrackUIPolarity(MediaTrack track, integer polarity, integer igngroupflags)
  --- ```
  --- polarity (AKA phase): <0 toggles, 0=normal, >0=inverted. returns new value or -1 if error.igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param polarity integer
  ---@param igngroupflags integer
  ---@return integer
  SetTrackUIPolarity = function(track, polarity, igngroupflags) end,

  --- ```
  --- integer _ = reaper.SetTrackUIRecArm(MediaTrack track, integer recarm, integer igngroupflags)
  --- ```
  --- recarm: <0 toggles, >0 sets recarm, 0=unsets recarm. returns new value or -1 if error. igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param recarm integer
  ---@param igngroupflags integer
  ---@return integer
  SetTrackUIRecArm = function(track, recarm, igngroupflags) end,

  --- ```
  --- integer _ = reaper.SetTrackUISolo(MediaTrack track, integer solo, integer igngroupflags)
  --- ```
  --- solo: <0 toggles, 1 sets solo (default mode), 0=unsets solo, 2 sets solo (non-SIP), 4 sets solo (SIP). returns new value or -1 if error. igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param solo integer
  ---@param igngroupflags integer
  ---@return integer
  SetTrackUISolo = function(track, solo, igngroupflags) end,

  --- ```
  --- number _ = reaper.SetTrackUIVolume(MediaTrack track, number volume, boolean relative, boolean done, integer igngroupflags)
  --- ```
  --- igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param volume number
  ---@param relative boolean
  ---@param done boolean
  ---@param igngroupflags integer
  ---@return number
  SetTrackUIVolume = function(track, volume, relative, done, igngroupflags) end,

  --- ```
  --- number _ = reaper.SetTrackUIWidth(MediaTrack track, number width, boolean relative, boolean done, integer igngroupflags)
  --- ```
  --- igngroupflags: &1 to prevent track grouping, &2 to prevent selection ganging
  ---@param track MediaTrack
  ---@param width number
  ---@param relative boolean
  ---@param done boolean
  ---@param igngroupflags integer
  ---@return number
  SetTrackUIWidth = function(track, width, relative, done, igngroupflags) end,

  --- ```
  --- reaper.ShowActionList(KbdSectionInfo section, HWND callerWnd)
  --- ```
  ---@param section KbdSectionInfo
  ---@param callerWnd HWND
  ShowActionList = function(section, callerWnd) end,

  --- ```
  --- reaper.ShowConsoleMsg(string msg)
  --- ```
  --- Show a message to the user (also useful for debugging). Send "\n" for newline, "" to clear the console. Prefix string with "!SHOW:" and text will be added to console without opening the window. See ClearConsole
  ---@param msg string
  ShowConsoleMsg = function(msg) end,

  --- ```
  --- integer _ = reaper.ShowMessageBox(string msg, string title, integer type)
  --- ```
  --- type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL : ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO
  ---@param msg string
  ---@param title string
  ---@param type integer
  ---@return integer
  ShowMessageBox = function(msg, title, type) end,

  --- ```
  --- reaper.ShowPopupMenu(string name, integer x, integer y, HWND hwndParent, identifier ctx, integer ctx2, integer ctx3)
  --- ```
  --- shows a context menu, valid names include: track_input, track_panel, track_area, track_routing, item, ruler, envelope, envelope_point, envelope_item. ctxOptional can be a track pointer for track_*, item pointer for item* (but is optional). for envelope_point, ctx2Optional has point index, ctx3Optional has item index (0=main envelope, 1=first AI). for envelope_item, ctx2Optional has AI index (1=first AI)
  ---@param name string
  ---@param x integer
  ---@param y integer
  ---@param hwndParent HWND
  ---@param ctx identifier
  ---@param ctx2 integer
  ---@param ctx3 integer
  ShowPopupMenu = function(name, x, y, hwndParent, ctx, ctx2, ctx3) end,

  --- ```
  --- number _ = reaper.SLIDER2DB(number y)
  --- ```
  ---@param y number
  ---@return number
  SLIDER2DB = function(y) end,

  --- ```
  --- number _ = reaper.SnapToGrid(ReaProject project, number time_pos)
  --- ```
  ---@param project ReaProject
  ---@param time_pos number
  ---@return number
  SnapToGrid = function(project, time_pos) end,

  --- ```
  --- reaper.SoloAllTracks(integer solo)
  --- ```
  --- solo=2 for SIP
  ---@param solo integer
  SoloAllTracks = function(solo) end,

  --- ```
  --- HWND _ = reaper.Splash_GetWnd()
  --- ```
  --- gets the splash window, in case you want to display a message over it. Returns NULL when the splash window is not displayed.
  ---@return HWND
  Splash_GetWnd = function() end,

  --- ```
  --- MediaItem _ = reaper.SplitMediaItem(MediaItem item, number position)
  --- ```
  --- the original item becomes the left-hand split, the function returns the right-hand split (or NULL if the split failed)
  ---@param item MediaItem
  ---@param position number
  ---@return MediaItem
  SplitMediaItem = function(item, position) end,

  --- ```
  --- string gGUID = reaper.stringToGuid(string str, string gGUID)
  --- ```
  ---@param str string
  ---@param gGUID string
  ---@return string
  stringToGuid = function(str, gGUID) end,

  --- ```
  --- reaper.StuffMIDIMessage(integer mode, integer msg1, integer msg2, integer msg3)
  --- ```
  --- Stuffs a 3 byte MIDI message into either the Virtual MIDI Keyboard queue, or the MIDI-as-control input queue, or sends to a MIDI hardware output. mode=0 for VKB, 1 for control (actions map etc), 2 for VKB-on-current-channel; 16 for external MIDI device 0, 17 for external MIDI device 1, etc; see GetNumMIDIOutputs, GetMIDIOutputName.
  ---@param mode integer
  ---@param msg1 integer
  ---@param msg2 integer
  ---@param msg3 integer
  StuffMIDIMessage = function(mode, msg1, msg2, msg3) end,

  --- ```
  --- integer _ = reaper.TakeFX_AddByName(MediaItem_Take take, string fxname, integer instantiate)
  --- ```
  --- Adds or queries the position of a named FX in a take. See TrackFX_AddByName() for information on fxname and instantiate. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fxname string
  ---@param instantiate integer
  ---@return integer
  TakeFX_AddByName = function(take, fxname, instantiate) end,

  --- ```
  --- reaper.TakeFX_CopyToTake(MediaItem_Take src_take, integer src_fx, MediaItem_Take dest_take, integer dest_fx, boolean is_move)
  --- ```
  --- Copies (or moves) FX from src_take to dest_take. Can be used with src_take=dest_take to reorder. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param src_take MediaItem_Take
  ---@param src_fx integer
  ---@param dest_take MediaItem_Take
  ---@param dest_fx integer
  ---@param is_move boolean
  TakeFX_CopyToTake = function(src_take, src_fx, dest_take, dest_fx, is_move) end,

  --- ```
  --- reaper.TakeFX_CopyToTrack(MediaItem_Take src_take, integer src_fx, MediaTrack dest_track, integer dest_fx, boolean is_move)
  --- ```
  --- Copies (or moves) FX from src_take to dest_track. dest_fx can have 0x1000000 set to reference input FX. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param src_take MediaItem_Take
  ---@param src_fx integer
  ---@param dest_track MediaTrack
  ---@param dest_fx integer
  ---@param is_move boolean
  TakeFX_CopyToTrack = function(src_take, src_fx, dest_track, dest_fx, is_move) end,

  --- ```
  --- boolean _ = reaper.TakeFX_Delete(MediaItem_Take take, integer fx)
  --- ```
  --- Remove a FX from take chain (returns true on success) FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return boolean
  TakeFX_Delete = function(take, fx) end,

  --- ```
  --- boolean _ = reaper.TakeFX_EndParamEdit(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return boolean
  TakeFX_EndParamEdit = function(take, fx, param) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_FormatParamValue(MediaItem_Take take, integer fx, integer param, number val)
  --- ```
  --- Note: only works with FX that support Cockos VST extensions. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@param val number
  ---@return boolean, string
  TakeFX_FormatParamValue = function(take, fx, param, val) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_FormatParamValueNormalized(MediaItem_Take take, integer fx, integer param, number value, string buf)
  --- ```
  --- Note: only works with FX that support Cockos VST extensions. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@param value number
  ---@param buf string
  ---@return boolean, string
  TakeFX_FormatParamValueNormalized = function(take, fx, param, value, buf) end,

  --- ```
  --- integer _ = reaper.TakeFX_GetChainVisible(MediaItem_Take take)
  --- ```
  --- returns index of effect visible in chain, or -1 for chain hidden, or -2 for chain visible but no effect selected
  ---@param take MediaItem_Take
  ---@return integer
  TakeFX_GetChainVisible = function(take) end,

  --- ```
  --- integer _ = reaper.TakeFX_GetCount(MediaItem_Take take)
  --- ```
  ---@param take MediaItem_Take
  ---@return integer
  TakeFX_GetCount = function(take) end,

  --- ```
  --- boolean _ = reaper.TakeFX_GetEnabled(MediaItem_Take take, integer fx)
  --- ```
  --- See TakeFX_SetEnabled FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return boolean
  TakeFX_GetEnabled = function(take, fx) end,

  --- ```
  --- TrackEnvelope _ = reaper.TakeFX_GetEnvelope(MediaItem_Take take, integer fxindex, integer parameterindex, boolean create)
  --- ```
  --- Returns the FX parameter envelope. If the envelope does not exist and create=true, the envelope will be created. If the envelope already exists and is bypassed and create=true, then the envelope will be unbypassed. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fxindex integer
  ---@param parameterindex integer
  ---@param create boolean
  ---@return TrackEnvelope
  TakeFX_GetEnvelope = function(take, fxindex, parameterindex, create) end,

  --- ```
  --- HWND _ = reaper.TakeFX_GetFloatingWindow(MediaItem_Take take, integer index)
  --- ```
  --- returns HWND of floating window for effect index, if any FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param index integer
  ---@return HWND
  TakeFX_GetFloatingWindow = function(take, index) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_GetFormattedParamValue(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return boolean, string
  TakeFX_GetFormattedParamValue = function(take, fx, param) end,

  --- ```
  --- string GUID = reaper.TakeFX_GetFXGUID(MediaItem_Take take, integer fx)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return string
  TakeFX_GetFXGUID = function(take, fx) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_GetFXName(MediaItem_Take take, integer fx)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return boolean, string
  TakeFX_GetFXName = function(take, fx) end,

  --- ```
  --- integer retval, integer inputPins, integer outputPins = reaper.TakeFX_GetIOSize(MediaItem_Take take, integer fx)
  --- ```
  --- Gets the number of input/output pins for FX if available, returns plug-in type or -1 on error FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return integer, integer, integer
  TakeFX_GetIOSize = function(take, fx) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_GetNamedConfigParm(MediaItem_Take take, integer fx, string parmname)
  --- ```
  --- gets plug-in specific named configuration value (returns true on success). see TrackFX_GetNamedConfigParm FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param parmname string
  ---@return boolean, string
  TakeFX_GetNamedConfigParm = function(take, fx, parmname) end,

  --- ```
  --- integer _ = reaper.TakeFX_GetNumParams(MediaItem_Take take, integer fx)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return integer
  TakeFX_GetNumParams = function(take, fx) end,

  --- ```
  --- boolean _ = reaper.TakeFX_GetOffline(MediaItem_Take take, integer fx)
  --- ```
  --- See TakeFX_SetOffline FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return boolean
  TakeFX_GetOffline = function(take, fx) end,

  --- ```
  --- boolean _ = reaper.TakeFX_GetOpen(MediaItem_Take take, integer fx)
  --- ```
  --- Returns true if this FX UI is open in the FX chain window or a floating window. See TakeFX_SetOpen FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return boolean
  TakeFX_GetOpen = function(take, fx) end,

  --- ```
  --- number retval, number minval, number maxval = reaper.TakeFX_GetParam(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return number, number, number
  TakeFX_GetParam = function(take, fx, param) end,

  --- ```
  --- boolean retval, number step, number smallstep, number largestep, boolean istoggle = reaper.TakeFX_GetParameterStepSizes(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return boolean, number, number, number, boolean
  TakeFX_GetParameterStepSizes = function(take, fx, param) end,

  --- ```
  --- number retval, number minval, number maxval, number midval = reaper.TakeFX_GetParamEx(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return number, number, number, number
  TakeFX_GetParamEx = function(take, fx, param) end,

  --- ```
  --- integer _ = reaper.TakeFX_GetParamFromIdent(MediaItem_Take take, integer fx, string ident_str)
  --- ```
  --- gets the parameter index from an identifying string (:wet, :bypass, or a string returned from GetParamIdent), or -1 if unknown. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param ident_str string
  ---@return integer
  TakeFX_GetParamFromIdent = function(take, fx, ident_str) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_GetParamIdent(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- gets an identifying string for the parameter FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return boolean, string
  TakeFX_GetParamIdent = function(take, fx, param) end,

  --- ```
  --- boolean retval, string buf = reaper.TakeFX_GetParamName(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return boolean, string
  TakeFX_GetParamName = function(take, fx, param) end,

  --- ```
  --- number _ = reaper.TakeFX_GetParamNormalized(MediaItem_Take take, integer fx, integer param)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@return number
  TakeFX_GetParamNormalized = function(take, fx, param) end,

  --- ```
  --- integer retval, integer high32 = reaper.TakeFX_GetPinMappings(MediaItem_Take take, integer fx, integer isoutput, integer pin)
  --- ```
  --- gets the effective channel mapping bitmask for a particular pin. high32Out will be set to the high 32 bits. Add 0x1000000 to pin index in order to access the second 64 bits of mappings independent of the first 64 bits. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param isoutput integer
  ---@param pin integer
  ---@return integer, integer
  TakeFX_GetPinMappings = function(take, fx, isoutput, pin) end,

  --- ```
  --- boolean retval, string presetname = reaper.TakeFX_GetPreset(MediaItem_Take take, integer fx)
  --- ```
  --- Get the name of the preset currently showing in the REAPER dropdown, or the full path to a factory preset file for VST3 plug-ins (.vstpreset). See TakeFX_SetPreset. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return boolean, string
  TakeFX_GetPreset = function(take, fx) end,

  --- ```
  --- integer retval, integer numberOfPresets = reaper.TakeFX_GetPresetIndex(MediaItem_Take take, integer fx)
  --- ```
  --- Returns current preset index, or -1 if error. numberOfPresetsOut will be set to total number of presets available. See TakeFX_SetPresetByIndex FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return integer, integer
  TakeFX_GetPresetIndex = function(take, fx) end,

  --- ```
  --- string fn = reaper.TakeFX_GetUserPresetFilename(MediaItem_Take take, integer fx)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@return string
  TakeFX_GetUserPresetFilename = function(take, fx) end,

  --- ```
  --- boolean _ = reaper.TakeFX_NavigatePresets(MediaItem_Take take, integer fx, integer presetmove)
  --- ```
  --- presetmove==1 activates the next preset, presetmove==-1 activates the previous preset, etc. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param presetmove integer
  ---@return boolean
  TakeFX_NavigatePresets = function(take, fx, presetmove) end,

  --- ```
  --- reaper.TakeFX_SetEnabled(MediaItem_Take take, integer fx, boolean enabled)
  --- ```
  --- See TakeFX_GetEnabled FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param enabled boolean
  TakeFX_SetEnabled = function(take, fx, enabled) end,

  --- ```
  --- boolean _ = reaper.TakeFX_SetNamedConfigParm(MediaItem_Take take, integer fx, string parmname, string value)
  --- ```
  --- gets plug-in specific named configuration value (returns true on success). see TrackFX_SetNamedConfigParm FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param parmname string
  ---@param value string
  ---@return boolean
  TakeFX_SetNamedConfigParm = function(take, fx, parmname, value) end,

  --- ```
  --- reaper.TakeFX_SetOffline(MediaItem_Take take, integer fx, boolean offline)
  --- ```
  --- See TakeFX_GetOffline FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param offline boolean
  TakeFX_SetOffline = function(take, fx, offline) end,

  --- ```
  --- reaper.TakeFX_SetOpen(MediaItem_Take take, integer fx, boolean open)
  --- ```
  --- Open this FX UI. See TakeFX_GetOpen FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param open boolean
  TakeFX_SetOpen = function(take, fx, open) end,

  --- ```
  --- boolean _ = reaper.TakeFX_SetParam(MediaItem_Take take, integer fx, integer param, number val)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@param val number
  ---@return boolean
  TakeFX_SetParam = function(take, fx, param, val) end,

  --- ```
  --- boolean _ = reaper.TakeFX_SetParamNormalized(MediaItem_Take take, integer fx, integer param, number value)
  --- ```
  --- FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param param integer
  ---@param value number
  ---@return boolean
  TakeFX_SetParamNormalized = function(take, fx, param, value) end,

  --- ```
  --- boolean _ = reaper.TakeFX_SetPinMappings(MediaItem_Take take, integer fx, integer isoutput, integer pin, integer low32bits, integer hi32bits)
  --- ```
  --- sets the channel mapping bitmask for a particular pin. returns false if unsupported (not all types of plug-ins support this capability). Add 0x1000000 to pin index in order to access the second 64 bits of mappings independent of the first 64 bits. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param isoutput integer
  ---@param pin integer
  ---@param low32bits integer
  ---@param hi32bits integer
  ---@return boolean
  TakeFX_SetPinMappings = function(take, fx, isoutput, pin, low32bits, hi32bits) end,

  --- ```
  --- boolean _ = reaper.TakeFX_SetPreset(MediaItem_Take take, integer fx, string presetname)
  --- ```
  --- Activate a preset with the name shown in the REAPER dropdown. Full paths to .vstpreset files are also supported for VST3 plug-ins. See TakeFX_GetPreset. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param presetname string
  ---@return boolean
  TakeFX_SetPreset = function(take, fx, presetname) end,

  --- ```
  --- boolean _ = reaper.TakeFX_SetPresetByIndex(MediaItem_Take take, integer fx, integer idx)
  --- ```
  --- Sets the preset idx, or the factory preset (idx==-2), or the default user preset (idx==-1). Returns true on success. See TakeFX_GetPresetIndex. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param fx integer
  ---@param idx integer
  ---@return boolean
  TakeFX_SetPresetByIndex = function(take, fx, idx) end,

  --- ```
  --- reaper.TakeFX_Show(MediaItem_Take take, integer index, integer showFlag)
  --- ```
  --- showflag=0 for hidechain, =1 for show chain(index valid), =2 for hide floating window(index valid), =3 for show floating window (index valid) FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param take MediaItem_Take
  ---@param index integer
  ---@param showFlag integer
  TakeFX_Show = function(take, index, showFlag) end,

  --- ```
  --- boolean _ = reaper.TakeIsMIDI(MediaItem_Take take)
  --- ```
  --- Returns true if the active take contains MIDI.
  ---@param take MediaItem_Take
  ---@return boolean
  TakeIsMIDI = function(take) end,

  --- ```
  --- boolean retval, string name = reaper.ThemeLayout_GetLayout(string section, integer idx)
  --- ```
  --- Gets theme layout information. section can be 'global' for global layout override, 'seclist' to enumerate a list of layout sections, otherwise a layout section such as 'mcp', 'tcp', 'trans', etc. idx can be -1 to query the current value, -2 to get the description of the section (if not global), -3 will return the current context DPI-scaling (256=normal, 512=retina, etc), or 0..x. returns false if failed.
  ---@param section string
  ---@param idx integer
  ---@return boolean, string
  ThemeLayout_GetLayout = function(section, idx) end,

  --- ```
  --- string retval, optional string desc, optional integer value, optional integer defValue, optional integer minValue, optional integer maxValue = reaper.ThemeLayout_GetParameter(integer wp)
  --- ```
  --- returns theme layout parameter. return value is cfg-name, or nil/empty if out of range.
  ---@param wp integer
  ---@return string, string, integer, integer, integer, integer
  ThemeLayout_GetParameter = function(wp) end,

  --- ```
  --- reaper.ThemeLayout_RefreshAll()
  --- ```
  --- Refreshes all layouts
  ThemeLayout_RefreshAll = function() end,

  --- ```
  --- boolean _ = reaper.ThemeLayout_SetLayout(string section, string layout)
  --- ```
  --- Sets theme layout override for a particular section -- section can be 'global' or 'mcp' etc. If setting global layout, prefix a ! to the layout string to clear any per-layout overrides. Returns false if failed.
  ---@param section string
  ---@param layout string
  ---@return boolean
  ThemeLayout_SetLayout = function(section, layout) end,

  --- ```
  --- boolean _ = reaper.ThemeLayout_SetParameter(integer wp, integer value, boolean persist)
  --- ```
  --- sets theme layout parameter to value. persist=true in order to have change loaded on next theme load. note that the caller should update layouts via ??? to make changes visible.
  ---@param wp integer
  ---@param value integer
  ---@param persist boolean
  ---@return boolean
  ThemeLayout_SetParameter = function(wp, value, persist) end,

  --- ```
  --- number _ = reaper.time_precise()
  --- ```
  --- Gets a precise system timestamp in seconds
  ---@return number
  time_precise = function() end,

  --- ```
  --- number _ = reaper.TimeMap2_beatsToTime(ReaProject proj, number tpos, optional integer measuresIn)
  --- ```
  --- convert a beat position (or optionally a beats+measures if measures is non-NULL) to time.
  ---@param proj ReaProject
  ---@param tpos number
  ---@param measuresIn? integer
  ---@return number
  TimeMap2_beatsToTime = function(proj, tpos, measuresIn) end,

  --- ```
  --- number _ = reaper.TimeMap2_GetDividedBpmAtTime(ReaProject proj, number time)
  --- ```
  --- get the effective BPM at the time (seconds) position (i.e. 2x in /8 signatures)
  ---@param proj ReaProject
  ---@param time number
  ---@return number
  TimeMap2_GetDividedBpmAtTime = function(proj, time) end,

  --- ```
  --- number _ = reaper.TimeMap2_GetNextChangeTime(ReaProject proj, number time)
  --- ```
  --- when does the next time map (tempo or time sig) change occur
  ---@param proj ReaProject
  ---@param time number
  ---@return number
  TimeMap2_GetNextChangeTime = function(proj, time) end,

  --- ```
  --- number _ = reaper.TimeMap2_QNToTime(ReaProject proj, number qn)
  --- ```
  --- converts project QN position to time.
  ---@param proj ReaProject
  ---@param qn number
  ---@return number
  TimeMap2_QNToTime = function(proj, qn) end,

  --- ```
  --- number retval, optional integer measures, optional integer cml, optional number fullbeats, optional integer cdenom = reaper.TimeMap2_timeToBeats(ReaProject proj, number tpos)
  --- ```
  --- convert a time into beats.
  ---
  --- if measures is non-NULL, measures will be set to the measure count, return value will be beats since measure.
  ---
  --- if cml is non-NULL, will be set to current measure length in beats (i.e. time signature numerator)
  ---
  --- if fullbeats is non-NULL, and measures is non-NULL, fullbeats will get the full beat count (same value returned if measures is NULL).
  ---
  --- if cdenom is non-NULL, will be set to the current time signature denominator.
  ---@param proj ReaProject
  ---@param tpos number
  ---@return number, integer, integer, number, integer
  TimeMap2_timeToBeats = function(proj, tpos) end,

  --- ```
  --- number _ = reaper.TimeMap2_timeToQN(ReaProject proj, number tpos)
  --- ```
  --- converts project time position to QN position.
  ---@param proj ReaProject
  ---@param tpos number
  ---@return number
  TimeMap2_timeToQN = function(proj, tpos) end,

  --- ```
  --- number retval, boolean dropFrame = reaper.TimeMap_curFrameRate(ReaProject proj)
  --- ```
  --- Gets project framerate, and optionally whether it is drop-frame timecode
  ---@param proj ReaProject
  ---@return number, boolean
  TimeMap_curFrameRate = function(proj) end,

  --- ```
  --- number _ = reaper.TimeMap_GetDividedBpmAtTime(number time)
  --- ```
  --- get the effective BPM at the time (seconds) position (i.e. 2x in /8 signatures)
  ---@param time number
  ---@return number
  TimeMap_GetDividedBpmAtTime = function(time) end,

  --- ```
  --- number retval, number qn_start, number qn_end, integer timesig_num, integer timesig_denom, number tempo = reaper.TimeMap_GetMeasureInfo(ReaProject proj, integer measure)
  --- ```
  --- Get the QN position and time signature information for the start of a measure. Return the time in seconds of the measure start.
  ---@param proj ReaProject
  ---@param measure integer
  ---@return number, number, number, integer, integer, number
  TimeMap_GetMeasureInfo = function(proj, measure) end,

  --- ```
  --- integer retval, string pattern = reaper.TimeMap_GetMetronomePattern(ReaProject proj, number time, string pattern)
  --- ```
  --- Fills in a string representing the active metronome pattern. For example, in a 7/8 measure divided 3+4, the pattern might be "1221222". The length of the string is the time signature numerator, and the function returns the time signature denominator.
  ---@param proj ReaProject
  ---@param time number
  ---@param pattern string
  ---@return integer, string
  TimeMap_GetMetronomePattern = function(proj, time, pattern) end,

  --- ```
  --- integer timesig_num, integer timesig_denom, number tempo = reaper.TimeMap_GetTimeSigAtTime(ReaProject proj, number time)
  --- ```
  --- get the effective time signature and tempo
  ---@param proj ReaProject
  ---@param time number
  ---@return integer, integer, number
  TimeMap_GetTimeSigAtTime = function(proj, time) end,

  --- ```
  --- integer retval, optional number qnMeasureStart, optional number qnMeasureEnd = reaper.TimeMap_QNToMeasures(ReaProject proj, number qn)
  --- ```
  --- Find which measure the given QN position falls in.
  ---@param proj ReaProject
  ---@param qn number
  ---@return integer, number, number
  TimeMap_QNToMeasures = function(proj, qn) end,

  --- ```
  --- number _ = reaper.TimeMap_QNToTime(number qn)
  --- ```
  --- converts project QN position to time.
  ---@param qn number
  ---@return number
  TimeMap_QNToTime = function(qn) end,

  --- ```
  --- number _ = reaper.TimeMap_QNToTime_abs(ReaProject proj, number qn)
  --- ```
  --- Converts project quarter note count (QN) to time. QN is counted from the start of the project, regardless of any partial measures. See TimeMap2_QNToTime
  ---@param proj ReaProject
  ---@param qn number
  ---@return number
  TimeMap_QNToTime_abs = function(proj, qn) end,

  --- ```
  --- number _ = reaper.TimeMap_timeToQN(number tpos)
  --- ```
  --- converts project QN position to time.
  ---@param tpos number
  ---@return number
  TimeMap_timeToQN = function(tpos) end,

  --- ```
  --- number _ = reaper.TimeMap_timeToQN_abs(ReaProject proj, number tpos)
  --- ```
  --- Converts project time position to quarter note count (QN). QN is counted from the start of the project, regardless of any partial measures. See TimeMap2_timeToQN
  ---@param proj ReaProject
  ---@param tpos number
  ---@return number
  TimeMap_timeToQN_abs = function(proj, tpos) end,

  --- ```
  --- boolean _ = reaper.ToggleTrackSendUIMute(MediaTrack track, integer send_idx)
  --- ```
  --- send_idx<0 for receives, >=0 for hw ouputs, >=nb_of_hw_ouputs for sends.
  ---@param track MediaTrack
  ---@param send_idx integer
  ---@return boolean
  ToggleTrackSendUIMute = function(track, send_idx) end,

  --- ```
  --- number _ = reaper.Track_GetPeakHoldDB(MediaTrack track, integer channel, boolean clear)
  --- ```
  --- Returns meter hold state, in dB*0.01 (0 = +0dB, -0.01 = -1dB, 0.02 = +2dB, etc). If clear is set, clears the meter hold. If channel==1024 or channel==1025, returns loudness values if this is the master track or this track's VU meters are set to display loudness.
  ---@param track MediaTrack
  ---@param channel integer
  ---@param clear boolean
  ---@return number
  Track_GetPeakHoldDB = function(track, channel, clear) end,

  --- ```
  --- number _ = reaper.Track_GetPeakInfo(MediaTrack track, integer channel)
  --- ```
  --- Returns peak meter value (1.0=+0dB, 0.0=-inf) for channel. If channel==1024 or channel==1025, returns loudness values if this is the master track or this track's VU meters are set to display loudness.
  ---@param track MediaTrack
  ---@param channel integer
  ---@return number
  Track_GetPeakInfo = function(track, channel) end,

  --- ```
  --- reaper.TrackCtl_SetToolTip(string fmt, integer xpos, integer ypos, boolean topmost)
  --- ```
  --- displays tooltip at location, or removes if empty string
  ---@param fmt string
  ---@param xpos integer
  ---@param ypos integer
  ---@param topmost boolean
  TrackCtl_SetToolTip = function(fmt, xpos, ypos, topmost) end,

  --- ```
  --- integer _ = reaper.TrackFX_AddByName(MediaTrack track, string fxname, boolean recFX, integer instantiate)
  --- ```
  --- Adds or queries the position of a named FX from the track FX chain (recFX=false) or record input FX/monitoring FX (recFX=true, monitoring FX are on master track). Specify a negative value for instantiate to always create a new effect, 0 to only query the first instance of an effect, or a positive value to add an instance if one is not found. If instantiate is <= -1000, it is used for the insertion position (-1000 is first item in chain, -1001 is second, etc). fxname can have prefix to specify type: VST3:,VST2:,VST:,AU:,JS:, or DX:, or FXADD: which adds selected items from the currently-open FX browser, FXADD:2 to limit to 2 FX added, or FXADD:2e to only succeed if exactly 2 FX are selected. Returns -1 on failure or the new position in chain on success. FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fxname string
  ---@param recFX boolean
  ---@param instantiate integer
  ---@return integer
  TrackFX_AddByName = function(track, fxname, recFX, instantiate) end,

  --- ```
  --- reaper.TrackFX_CopyToTake(MediaTrack src_track, integer src_fx, MediaItem_Take dest_take, integer dest_fx, boolean is_move)
  --- ```
  --- Copies (or moves) FX from src_track to dest_take. src_fx can have 0x1000000 set to reference input FX. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param src_track MediaTrack
  ---@param src_fx integer
  ---@param dest_take MediaItem_Take
  ---@param dest_fx integer
  ---@param is_move boolean
  TrackFX_CopyToTake = function(src_track, src_fx, dest_take, dest_fx, is_move) end,

  --- ```
  --- reaper.TrackFX_CopyToTrack(MediaTrack src_track, integer src_fx, MediaTrack dest_track, integer dest_fx, boolean is_move)
  --- ```
  --- Copies (or moves) FX from src_track to dest_track. Can be used with src_track=dest_track to reorder, FX indices have 0x1000000 set to reference input FX. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param src_track MediaTrack
  ---@param src_fx integer
  ---@param dest_track MediaTrack
  ---@param dest_fx integer
  ---@param is_move boolean
  TrackFX_CopyToTrack = function(src_track, src_fx, dest_track, dest_fx, is_move) end,

  --- ```
  --- boolean _ = reaper.TrackFX_Delete(MediaTrack track, integer fx)
  --- ```
  --- Remove a FX from track chain (returns true on success) FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return boolean
  TrackFX_Delete = function(track, fx) end,

  --- ```
  --- boolean _ = reaper.TrackFX_EndParamEdit(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return boolean
  TrackFX_EndParamEdit = function(track, fx, param) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_FormatParamValue(MediaTrack track, integer fx, integer param, number val)
  --- ```
  --- Note: only works with FX that support Cockos VST extensions. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@param val number
  ---@return boolean, string
  TrackFX_FormatParamValue = function(track, fx, param, val) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_FormatParamValueNormalized(MediaTrack track, integer fx, integer param, number value, string buf)
  --- ```
  --- Note: only works with FX that support Cockos VST extensions. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@param value number
  ---@param buf string
  ---@return boolean, string
  TrackFX_FormatParamValueNormalized = function(track, fx, param, value, buf) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetByName(MediaTrack track, string fxname, boolean instantiate)
  --- ```
  --- Get the index of the first track FX insert that matches fxname. If the FX is not in the chain and instantiate is true, it will be inserted. See TrackFX_GetInstrument, TrackFX_GetEQ. Deprecated in favor of TrackFX_AddByName.
  ---@param track MediaTrack
  ---@param fxname string
  ---@param instantiate boolean
  ---@return integer
  ---@deprecated
  TrackFX_GetByName = function(track, fxname, instantiate) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetChainVisible(MediaTrack track)
  --- ```
  --- returns index of effect visible in chain, or -1 for chain hidden, or -2 for chain visible but no effect selected
  ---@param track MediaTrack
  ---@return integer
  TrackFX_GetChainVisible = function(track) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetCount(MediaTrack track)
  --- ```
  ---@param track MediaTrack
  ---@return integer
  TrackFX_GetCount = function(track) end,

  --- ```
  --- boolean _ = reaper.TrackFX_GetEnabled(MediaTrack track, integer fx)
  --- ```
  --- See TrackFX_SetEnabled FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return boolean
  TrackFX_GetEnabled = function(track, fx) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetEQ(MediaTrack track, boolean instantiate)
  --- ```
  --- Get the index of ReaEQ in the track FX chain. If ReaEQ is not in the chain and instantiate is true, it will be inserted. See TrackFX_GetInstrument, TrackFX_GetByName.
  ---@param track MediaTrack
  ---@param instantiate boolean
  ---@return integer
  TrackFX_GetEQ = function(track, instantiate) end,

  --- ```
  --- boolean _ = reaper.TrackFX_GetEQBandEnabled(MediaTrack track, integer fxidx, integer bandtype, integer bandidx)
  --- ```
  --- Returns true if the EQ band is enabled.
  ---
  --- Returns false if the band is disabled, or if track/fxidx is not ReaEQ.
  ---
  --- Bandtype: -1=master gain, 0=hipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass, 6=bandpass, 7=parallel bandpass.
  ---
  --- Bandidx (ignored for master gain): 0=target first band matching bandtype, 1=target 2nd band matching bandtype, etc.
  ---
  ---
  ---
  --- See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_SetEQParam, TrackFX_SetEQBandEnabled. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fxidx integer
  ---@param bandtype integer
  ---@param bandidx integer
  ---@return boolean
  TrackFX_GetEQBandEnabled = function(track, fxidx, bandtype, bandidx) end,

  --- ```
  --- boolean retval, integer bandtype, integer bandidx, integer paramtype, number normval = reaper.TrackFX_GetEQParam(MediaTrack track, integer fxidx, integer paramidx)
  --- ```
  --- Returns false if track/fxidx is not ReaEQ.
  ---
  --- Bandtype: -1=master gain, 0=hipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass, 6=bandpass, 7=parallel bandpass.
  ---
  --- Bandidx (ignored for master gain): 0=target first band matching bandtype, 1=target 2nd band matching bandtype, etc.
  ---
  --- Paramtype (ignored for master gain): 0=freq, 1=gain, 2=Q.
  ---
  --- See TrackFX_GetEQ, TrackFX_SetEQParam, TrackFX_GetEQBandEnabled, TrackFX_SetEQBandEnabled. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fxidx integer
  ---@param paramidx integer
  ---@return boolean, integer, integer, integer, number
  TrackFX_GetEQParam = function(track, fxidx, paramidx) end,

  --- ```
  --- HWND _ = reaper.TrackFX_GetFloatingWindow(MediaTrack track, integer index)
  --- ```
  --- returns HWND of floating window for effect index, if any FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param index integer
  ---@return HWND
  TrackFX_GetFloatingWindow = function(track, index) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_GetFormattedParamValue(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return boolean, string
  TrackFX_GetFormattedParamValue = function(track, fx, param) end,

  --- ```
  --- string GUID = reaper.TrackFX_GetFXGUID(MediaTrack track, integer fx)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return string
  TrackFX_GetFXGUID = function(track, fx) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_GetFXName(MediaTrack track, integer fx)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return boolean, string
  TrackFX_GetFXName = function(track, fx) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetInstrument(MediaTrack track)
  --- ```
  --- Get the index of the first track FX insert that is a virtual instrument, or -1 if none. See TrackFX_GetEQ, TrackFX_GetByName.
  ---@param track MediaTrack
  ---@return integer
  TrackFX_GetInstrument = function(track) end,

  --- ```
  --- integer retval, integer inputPins, integer outputPins = reaper.TrackFX_GetIOSize(MediaTrack track, integer fx)
  --- ```
  --- Gets the number of input/output pins for FX if available, returns plug-in type or -1 on error FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return integer, integer, integer
  TrackFX_GetIOSize = function(track, fx) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_GetNamedConfigParm(MediaTrack track, integer fx, string parmname)
  --- ```
  --- gets plug-in specific named configuration value (returns true on success).
  ---
  ---
  ---
  --- Supported values for read:
  ---
  --- pdc : PDC latency
  ---
  --- in_pin_X : name of input pin X
  ---
  --- out_pin_X : name of output pin X
  ---
  --- fx_type : type string
  ---
  --- fx_ident : type-specific identifier
  ---
  --- fx_name : name of FX (also supported as original_name)
  ---
  --- GainReduction_dB : [ReaComp + other supported compressors]
  ---
  --- parent_container : FX ID of parent container, if any (v7.06+)
  ---
  --- container_count : [Container] number of FX in container
  ---
  --- container_item.X : FX ID of item in container (first item is container_item.0) (v7.06+)
  ---
  --- param.X.container_map.hint_id : unique ID of mapping (preserved if mapping order changes)
  ---
  --- param.X.container_map.delete : read this value in order to remove the mapping for this parameter
  ---
  --- container_map.add : read from this value to add a new container parameter mapping -- will return new parameter index (accessed via param.X.container_map.*)
  ---
  --- container_map.add.FXID.PARMIDX : read from this value to add/get container parameter mapping for FXID/PARMIDX -- will return the parameter index (accessed via param.X.container_map.*). FXID can be a full address (must be a child of the container) or a 0-based sub-index (v7.06+).
  ---
  --- container_map.get.FXID.PARMIDX : read from this value to get container parameter mapping for FXID/PARMIDX -- will return the parameter index (accessed via param.X.container_map.*). FXID can be a full address (must be a child of the container) or a 0-based sub-index (v7.06+).
  ---
  ---
  ---
  ---
  ---
  --- Supported values for read/write:
  ---
  --- vst_chunk[_program] : base64-encoded VST-specific chunk.
  ---
  --- clap_chunk : base64-encoded CLAP-specific chunk.
  ---
  --- param.X.lfo.[active,dir,phase,speed,strength,temposync,free,shape] : parameter moduation LFO state
  ---
  --- param.X.acs.[active,dir,strength,attack,release,dblo,dbhi,chan,stereo,x2,y2] : parameter modulation ACS state
  ---
  --- param.X.plink.[active,scale,offset,effect,param,midi_bus,midi_chan,midi_msg,midi_msg2] : parameter link/MIDI link: set effect=-100 to support midi_*
  ---
  --- param.X.mod.[active,baseline,visible] : parameter module global settings
  ---
  --- param.X.learn.[midi1,midi2,osc] : first two bytes of MIDI message, or OSC string if set
  ---
  --- param.X.learn.mode : absolution/relative mode flag (0: Absolute, 1: 127=-1,1=+1, 2: 63=-1, 65=+1, 3: 65=-1, 1=+1, 4: toggle if nonzero)
  ---
  --- param.X.learn.flags : &1=selected track only, &2=soft takeover, &4=focused FX only, &8=LFO retrigger, &16=visible FX only
  ---
  --- param.X.container_map.fx_index : index of FX contained in container
  ---
  --- param.X.container_map.fx_parm : parameter index of parameter of FX contained in container
  ---
  --- param.X.container_map.aliased_name : name of parameter (if user-renamed, otherwise fails)
  ---
  --- BANDTYPEx, BANDENABLEDx : band configuration [ReaEQ]
  ---
  --- THRESHOLD, CEILING, TRUEPEAK : [ReaLimit]
  ---
  --- NUMCHANNELS, NUMSPEAKERS, RESETCHANNELS : [ReaSurroundPan]
  ---
  --- ITEMx : [ReaVerb] state configuration line, when writing should be followed by a write of DONE
  ---
  --- FILE, FILEx, -FILEx, +FILEx, -FILE* : [RS5k] file list, -/+ prefixes are write-only, when writing any, should be followed by a write of DONE
  ---
  --- MODE, RSMODE : [RS5k] general mode, resample mode
  ---
  --- VIDEO_CODE : [video processor] code
  ---
  --- force_auto_bypass : 0 or 1 - force auto-bypass plug-in on silence
  ---
  --- parallel : 0, 1 or 2 - 1=process plug-in in parallel with previous, 2=process plug-in parallel and merge MIDI
  ---
  --- instance_oversample_shift : instance oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When setting requires playback stop/start to take effect
  ---
  --- chain_oversample_shift : chain oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When setting requires playback stop/start to take effect
  ---
  --- chain_pdc_mode : chain PDC mode (0=classic, 1=new-default, 2=ignore PDC, 3=hwcomp-master)
  ---
  --- chain_sel : selected/visible FX in chain
  ---
  --- renamed_name : renamed FX instance name (empty string = not renamed)
  ---
  --- container_nch : number of internal channels for container
  ---
  --- container_nch_in : number of input pins for container
  ---
  --- container_nch_out : number of output pints for container
  ---
  --- container_nch_feedback : number of internal feedback channels enabled in container
  ---
  --- focused : reading returns 1 if focused. Writing a positive value to this sets the FX UI as "last focused."
  ---
  --- last_touched : reading returns two integers, one indicates whether FX is the last-touched FX, the second indicates which parameter was last touched. Writing a negative value ensures this plug-in is not set as last touched, otherwise the FX is set "last touched," and last touched parameter index is set to the value in the string (if valid).
  ---
  ---  FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param parmname string
  ---@return boolean, string
  TrackFX_GetNamedConfigParm = function(track, fx, parmname) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetNumParams(MediaTrack track, integer fx)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return integer
  TrackFX_GetNumParams = function(track, fx) end,

  --- ```
  --- boolean _ = reaper.TrackFX_GetOffline(MediaTrack track, integer fx)
  --- ```
  --- See TrackFX_SetOffline FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return boolean
  TrackFX_GetOffline = function(track, fx) end,

  --- ```
  --- boolean _ = reaper.TrackFX_GetOpen(MediaTrack track, integer fx)
  --- ```
  --- Returns true if this FX UI is open in the FX chain window or a floating window. See TrackFX_SetOpen FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return boolean
  TrackFX_GetOpen = function(track, fx) end,

  --- ```
  --- number retval, number minval, number maxval = reaper.TrackFX_GetParam(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return number, number, number
  TrackFX_GetParam = function(track, fx, param) end,

  --- ```
  --- boolean retval, number step, number smallstep, number largestep, boolean istoggle = reaper.TrackFX_GetParameterStepSizes(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return boolean, number, number, number, boolean
  TrackFX_GetParameterStepSizes = function(track, fx, param) end,

  --- ```
  --- number retval, number minval, number maxval, number midval = reaper.TrackFX_GetParamEx(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return number, number, number, number
  TrackFX_GetParamEx = function(track, fx, param) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetParamFromIdent(MediaTrack track, integer fx, string ident_str)
  --- ```
  --- gets the parameter index from an identifying string (:wet, :bypass, :delta, or a string returned from GetParamIdent), or -1 if unknown. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param ident_str string
  ---@return integer
  TrackFX_GetParamFromIdent = function(track, fx, ident_str) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_GetParamIdent(MediaTrack track, integer fx, integer param)
  --- ```
  --- gets an identifying string for the parameter FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return boolean, string
  TrackFX_GetParamIdent = function(track, fx, param) end,

  --- ```
  --- boolean retval, string buf = reaper.TrackFX_GetParamName(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return boolean, string
  TrackFX_GetParamName = function(track, fx, param) end,

  --- ```
  --- number _ = reaper.TrackFX_GetParamNormalized(MediaTrack track, integer fx, integer param)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@return number
  TrackFX_GetParamNormalized = function(track, fx, param) end,

  --- ```
  --- integer retval, integer high32 = reaper.TrackFX_GetPinMappings(MediaTrack tr, integer fx, integer isoutput, integer pin)
  --- ```
  --- gets the effective channel mapping bitmask for a particular pin. high32Out will be set to the high 32 bits. Add 0x1000000 to pin index in order to access the second 64 bits of mappings independent of the first 64 bits. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param tr MediaTrack
  ---@param fx integer
  ---@param isoutput integer
  ---@param pin integer
  ---@return integer, integer
  TrackFX_GetPinMappings = function(tr, fx, isoutput, pin) end,

  --- ```
  --- boolean retval, string presetname = reaper.TrackFX_GetPreset(MediaTrack track, integer fx)
  --- ```
  --- Get the name of the preset currently showing in the REAPER dropdown, or the full path to a factory preset file for VST3 plug-ins (.vstpreset). See TrackFX_SetPreset. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return boolean, string
  TrackFX_GetPreset = function(track, fx) end,

  --- ```
  --- integer retval, integer numberOfPresets = reaper.TrackFX_GetPresetIndex(MediaTrack track, integer fx)
  --- ```
  --- Returns current preset index, or -1 if error. numberOfPresetsOut will be set to total number of presets available. See TrackFX_SetPresetByIndex FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return integer, integer
  TrackFX_GetPresetIndex = function(track, fx) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetRecChainVisible(MediaTrack track)
  --- ```
  --- returns index of effect visible in record input chain, or -1 for chain hidden, or -2 for chain visible but no effect selected
  ---@param track MediaTrack
  ---@return integer
  TrackFX_GetRecChainVisible = function(track) end,

  --- ```
  --- integer _ = reaper.TrackFX_GetRecCount(MediaTrack track)
  --- ```
  --- returns count of record input FX. To access record input FX, use a FX indices [0x1000000..0x1000000+n). On the master track, this accesses monitoring FX rather than record input FX.
  ---@param track MediaTrack
  ---@return integer
  TrackFX_GetRecCount = function(track) end,

  --- ```
  --- string fn = reaper.TrackFX_GetUserPresetFilename(MediaTrack track, integer fx)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@return string
  TrackFX_GetUserPresetFilename = function(track, fx) end,

  --- ```
  --- boolean _ = reaper.TrackFX_NavigatePresets(MediaTrack track, integer fx, integer presetmove)
  --- ```
  --- presetmove==1 activates the next preset, presetmove==-1 activates the previous preset, etc. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param presetmove integer
  ---@return boolean
  TrackFX_NavigatePresets = function(track, fx, presetmove) end,

  --- ```
  --- reaper.TrackFX_SetEnabled(MediaTrack track, integer fx, boolean enabled)
  --- ```
  --- See TrackFX_GetEnabled FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param enabled boolean
  TrackFX_SetEnabled = function(track, fx, enabled) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetEQBandEnabled(MediaTrack track, integer fxidx, integer bandtype, integer bandidx, boolean enable)
  --- ```
  --- Enable or disable a ReaEQ band.
  ---
  --- Returns false if track/fxidx is not ReaEQ.
  ---
  --- Bandtype: -1=master gain, 0=hipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass, 6=bandpass, 7=parallel bandpass.
  ---
  --- Bandidx (ignored for master gain): 0=target first band matching bandtype, 1=target 2nd band matching bandtype, etc.
  ---
  ---
  ---
  --- See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_SetEQParam, TrackFX_GetEQBandEnabled. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fxidx integer
  ---@param bandtype integer
  ---@param bandidx integer
  ---@param enable boolean
  ---@return boolean
  TrackFX_SetEQBandEnabled = function(track, fxidx, bandtype, bandidx, enable) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetEQParam(MediaTrack track, integer fxidx, integer bandtype, integer bandidx, integer paramtype, number val, boolean isnorm)
  --- ```
  --- Returns false if track/fxidx is not ReaEQ. Targets a band matching bandtype.
  ---
  --- Bandtype: -1=master gain, 0=hipass, 1=loshelf, 2=band, 3=notch, 4=hishelf, 5=lopass, 6=bandpass, 7=parallel bandpass.
  ---
  --- Bandidx (ignored for master gain): 0=target first band matching bandtype, 1=target 2nd band matching bandtype, etc.
  ---
  --- Paramtype (ignored for master gain): 0=freq, 1=gain, 2=Q.
  ---
  --- See TrackFX_GetEQ, TrackFX_GetEQParam, TrackFX_GetEQBandEnabled, TrackFX_SetEQBandEnabled. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fxidx integer
  ---@param bandtype integer
  ---@param bandidx integer
  ---@param paramtype integer
  ---@param val number
  ---@param isnorm boolean
  ---@return boolean
  TrackFX_SetEQParam = function(track, fxidx, bandtype, bandidx, paramtype, val, isnorm) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetNamedConfigParm(MediaTrack track, integer fx, string parmname, string value)
  --- ```
  --- sets plug-in specific named configuration value (returns true on success).
  ---
  ---
  ---
  --- Support values for write:
  ---
  --- vst_chunk[_program] : base64-encoded VST-specific chunk.
  ---
  --- clap_chunk : base64-encoded CLAP-specific chunk.
  ---
  --- param.X.lfo.[active,dir,phase,speed,strength,temposync,free,shape] : parameter moduation LFO state
  ---
  --- param.X.acs.[active,dir,strength,attack,release,dblo,dbhi,chan,stereo,x2,y2] : parameter modulation ACS state
  ---
  --- param.X.plink.[active,scale,offset,effect,param,midi_bus,midi_chan,midi_msg,midi_msg2] : parameter link/MIDI link: set effect=-100 to support midi_*
  ---
  --- param.X.mod.[active,baseline,visible] : parameter module global settings
  ---
  --- param.X.learn.[midi1,midi2,osc] : first two bytes of MIDI message, or OSC string if set
  ---
  --- param.X.learn.mode : absolution/relative mode flag (0: Absolute, 1: 127=-1,1=+1, 2: 63=-1, 65=+1, 3: 65=-1, 1=+1, 4: toggle if nonzero)
  ---
  --- param.X.learn.flags : &1=selected track only, &2=soft takeover, &4=focused FX only, &8=LFO retrigger, &16=visible FX only
  ---
  --- param.X.container_map.fx_index : index of FX contained in container
  ---
  --- param.X.container_map.fx_parm : parameter index of parameter of FX contained in container
  ---
  --- param.X.container_map.aliased_name : name of parameter (if user-renamed, otherwise fails)
  ---
  --- BANDTYPEx, BANDENABLEDx : band configuration [ReaEQ]
  ---
  --- THRESHOLD, CEILING, TRUEPEAK : [ReaLimit]
  ---
  --- NUMCHANNELS, NUMSPEAKERS, RESETCHANNELS : [ReaSurroundPan]
  ---
  --- ITEMx : [ReaVerb] state configuration line, when writing should be followed by a write of DONE
  ---
  --- FILE, FILEx, -FILEx, +FILEx, -FILE* : [RS5k] file list, -/+ prefixes are write-only, when writing any, should be followed by a write of DONE
  ---
  --- MODE, RSMODE : [RS5k] general mode, resample mode
  ---
  --- VIDEO_CODE : [video processor] code
  ---
  --- force_auto_bypass : 0 or 1 - force auto-bypass plug-in on silence
  ---
  --- parallel : 0, 1 or 2 - 1=process plug-in in parallel with previous, 2=process plug-in parallel and merge MIDI
  ---
  --- instance_oversample_shift : instance oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When setting requires playback stop/start to take effect
  ---
  --- chain_oversample_shift : chain oversampling shift amount, 0=none, 1=~96k, 2=~192k, etc. When setting requires playback stop/start to take effect
  ---
  --- chain_pdc_mode : chain PDC mode (0=classic, 1=new-default, 2=ignore PDC, 3=hwcomp-master)
  ---
  --- chain_sel : selected/visible FX in chain
  ---
  --- renamed_name : renamed FX instance name (empty string = not renamed)
  ---
  --- container_nch : number of internal channels for container
  ---
  --- container_nch_in : number of input pins for container
  ---
  --- container_nch_out : number of output pints for container
  ---
  --- container_nch_feedback : number of internal feedback channels enabled in container
  ---
  --- focused : reading returns 1 if focused. Writing a positive value to this sets the FX UI as "last focused."
  ---
  --- last_touched : reading returns two integers, one indicates whether FX is the last-touched FX, the second indicates which parameter was last touched. Writing a negative value ensures this plug-in is not set as last touched, otherwise the FX is set "last touched," and last touched parameter index is set to the value in the string (if valid).
  ---
  ---  FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param parmname string
  ---@param value string
  ---@return boolean
  TrackFX_SetNamedConfigParm = function(track, fx, parmname, value) end,

  --- ```
  --- reaper.TrackFX_SetOffline(MediaTrack track, integer fx, boolean offline)
  --- ```
  --- See TrackFX_GetOffline FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param offline boolean
  TrackFX_SetOffline = function(track, fx, offline) end,

  --- ```
  --- reaper.TrackFX_SetOpen(MediaTrack track, integer fx, boolean open)
  --- ```
  --- Open this FX UI. See TrackFX_GetOpen FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param open boolean
  TrackFX_SetOpen = function(track, fx, open) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetParam(MediaTrack track, integer fx, integer param, number val)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@param val number
  ---@return boolean
  TrackFX_SetParam = function(track, fx, param, val) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetParamNormalized(MediaTrack track, integer fx, integer param, number value)
  --- ```
  --- FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param param integer
  ---@param value number
  ---@return boolean
  TrackFX_SetParamNormalized = function(track, fx, param, value) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetPinMappings(MediaTrack tr, integer fx, integer isoutput, integer pin, integer low32bits, integer hi32bits)
  --- ```
  --- sets the channel mapping bitmask for a particular pin. returns false if unsupported (not all types of plug-ins support this capability). Add 0x1000000 to pin index in order to access the second 64 bits of mappings independent of the first 64 bits. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param tr MediaTrack
  ---@param fx integer
  ---@param isoutput integer
  ---@param pin integer
  ---@param low32bits integer
  ---@param hi32bits integer
  ---@return boolean
  TrackFX_SetPinMappings = function(tr, fx, isoutput, pin, low32bits, hi32bits) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetPreset(MediaTrack track, integer fx, string presetname)
  --- ```
  --- Activate a preset with the name shown in the REAPER dropdown. Full paths to .vstpreset files are also supported for VST3 plug-ins. See TrackFX_GetPreset. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param presetname string
  ---@return boolean
  TrackFX_SetPreset = function(track, fx, presetname) end,

  --- ```
  --- boolean _ = reaper.TrackFX_SetPresetByIndex(MediaTrack track, integer fx, integer idx)
  --- ```
  --- Sets the preset idx, or the factory preset (idx==-2), or the default user preset (idx==-1). Returns true on success. See TrackFX_GetPresetIndex. FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param fx integer
  ---@param idx integer
  ---@return boolean
  TrackFX_SetPresetByIndex = function(track, fx, idx) end,

  --- ```
  --- reaper.TrackFX_Show(MediaTrack track, integer index, integer showFlag)
  --- ```
  --- showflag=0 for hidechain, =1 for show chain(index valid), =2 for hide floating window(index valid), =3 for show floating window (index valid) FX indices for tracks can have 0x1000000 added to them in order to reference record input FX (normal tracks) or hardware output FX (master track). FX indices can have 0x2000000 added to them, in which case they will be used to address FX in containers. To address a container, the 1-based subitem is multiplied by one plus the count of the FX chain and added to the 1-based container item index. e.g. to address the third item in the container at the second position of the track FX chain for tr, the index would be 0x2000000 + 3*(TrackFX_GetCount(tr)+1) + 2. This can be extended to sub-containers using TrackFX_GetNamedConfigParm with container_count and similar logic. In REAPER v7.06+, you can use the much more convenient method to navigate hierarchies, see TrackFX_GetNamedConfigParm with parent_container and container_item.X.
  ---@param track MediaTrack
  ---@param index integer
  ---@param showFlag integer
  TrackFX_Show = function(track, index, showFlag) end,

  --- ```
  --- reaper.TrackList_AdjustWindows(boolean isMinor)
  --- ```
  ---@param isMinor boolean
  TrackList_AdjustWindows = function(isMinor) end,

  --- ```
  --- reaper.TrackList_UpdateAllExternalSurfaces()
  --- ```
  TrackList_UpdateAllExternalSurfaces = function() end,

  --- ```
  --- reaper.Undo_BeginBlock()
  --- ```
  --- call to start a new block
  Undo_BeginBlock = function() end,

  --- ```
  --- reaper.Undo_BeginBlock2(ReaProject proj)
  --- ```
  --- call to start a new block
  ---@param proj ReaProject
  Undo_BeginBlock2 = function(proj) end,

  --- ```
  --- string _ = reaper.Undo_CanRedo2(ReaProject proj)
  --- ```
  --- returns string of next action,if able,NULL if not
  ---@param proj ReaProject
  ---@return string
  Undo_CanRedo2 = function(proj) end,

  --- ```
  --- string _ = reaper.Undo_CanUndo2(ReaProject proj)
  --- ```
  --- returns string of last action,if able,NULL if not
  ---@param proj ReaProject
  ---@return string
  Undo_CanUndo2 = function(proj) end,

  --- ```
  --- integer _ = reaper.Undo_DoRedo2(ReaProject proj)
  --- ```
  --- nonzero if success
  ---@param proj ReaProject
  ---@return integer
  Undo_DoRedo2 = function(proj) end,

  --- ```
  --- integer _ = reaper.Undo_DoUndo2(ReaProject proj)
  --- ```
  --- nonzero if success
  ---@param proj ReaProject
  ---@return integer
  Undo_DoUndo2 = function(proj) end,

  --- ```
  --- reaper.Undo_EndBlock(string descchange, integer extraflags)
  --- ```
  --- call to end the block,with extra flags if any,and a description
  ---@param descchange string
  ---@param extraflags integer
  Undo_EndBlock = function(descchange, extraflags) end,

  --- ```
  --- reaper.Undo_EndBlock2(ReaProject proj, string descchange, integer extraflags)
  --- ```
  --- call to end the block,with extra flags if any,and a description
  ---@param proj ReaProject
  ---@param descchange string
  ---@param extraflags integer
  Undo_EndBlock2 = function(proj, descchange, extraflags) end,

  --- ```
  --- reaper.Undo_OnStateChange(string descchange)
  --- ```
  --- limited state change to items
  ---@param descchange string
  Undo_OnStateChange = function(descchange) end,

  --- ```
  --- reaper.Undo_OnStateChange2(ReaProject proj, string descchange)
  --- ```
  --- limited state change to items
  ---@param proj ReaProject
  ---@param descchange string
  Undo_OnStateChange2 = function(proj, descchange) end,

  --- ```
  --- reaper.Undo_OnStateChange_Item(ReaProject proj, string name, MediaItem item)
  --- ```
  ---@param proj ReaProject
  ---@param name string
  ---@param item MediaItem
  Undo_OnStateChange_Item = function(proj, name, item) end,

  --- ```
  --- reaper.Undo_OnStateChangeEx(string descchange, integer whichStates, integer trackparm)
  --- ```
  --- trackparm=-1 by default,or if updating one fx chain,you can specify track index
  ---@param descchange string
  ---@param whichStates integer
  ---@param trackparm integer
  Undo_OnStateChangeEx = function(descchange, whichStates, trackparm) end,

  --- ```
  --- reaper.Undo_OnStateChangeEx2(ReaProject proj, string descchange, integer whichStates, integer trackparm)
  --- ```
  --- trackparm=-1 by default,or if updating one fx chain,you can specify track index
  ---@param proj ReaProject
  ---@param descchange string
  ---@param whichStates integer
  ---@param trackparm integer
  Undo_OnStateChangeEx2 = function(proj, descchange, whichStates, trackparm) end,

  --- ```
  --- reaper.UpdateArrange()
  --- ```
  --- Redraw the arrange view
  UpdateArrange = function() end,

  --- ```
  --- reaper.UpdateItemInProject(MediaItem item)
  --- ```
  ---@param item MediaItem
  UpdateItemInProject = function(item) end,

  --- ```
  --- boolean _ = reaper.UpdateItemLanes(ReaProject proj)
  --- ```
  --- Recalculate lane arrangement for fixed lane tracks, including auto-removing empty lanes at the bottom of the track
  ---@param proj ReaProject
  ---@return boolean
  UpdateItemLanes = function(proj) end,

  --- ```
  --- reaper.UpdateTimeline()
  --- ```
  --- Redraw the arrange view and ruler
  UpdateTimeline = function() end,

  --- ```
  --- boolean _ = reaper.ValidatePtr(identifier pointer, string ctypename)
  --- ```
  --- see ValidatePtr2
  ---@param pointer identifier
  ---@param ctypename string
  ---@return boolean
  ValidatePtr = function(pointer, ctypename) end,

  --- ```
  --- boolean _ = reaper.ValidatePtr2(ReaProject proj, identifier pointer, string ctypename)
  --- ```
  --- Return true if the pointer is a valid object of the right type in proj (proj is ignored if pointer is itself a project). Supported types are: ReaProject*, MediaTrack*, MediaItem*, MediaItem_Take*, TrackEnvelope* and PCM_source*.
  ---@param proj ReaProject
  ---@param pointer identifier
  ---@param ctypename string
  ---@return boolean
  ValidatePtr2 = function(proj, pointer, ctypename) end,

  --- ```
  --- reaper.ViewPrefs(integer page, string pageByName)
  --- ```
  --- Opens the prefs to a page, use pageByName if page is 0.
  ---@param page integer
  ---@param pageByName string
  ViewPrefs = function(page, pageByName) end,

  --- ```
  --- reaper.atexit(function fun)
  --- ```
  --- Adds code to be executed when the script finishes or is ended by the user. Typically used to clean up after the user terminates defer() or runloop() code.
  ---@param fun function
  atexit = function(fun) end,

  --- ```
  --- reaper.defer(function fun)
  --- ```
  --- Adds code to be called back by REAPER. Used to create persistent ReaScripts that continue to run and respond to input, while the user does other tasks. Identical to runloop().Note that no undo point will be automatically created when the script finishes, unless you create it explicitly.
  ---@param fun function
  defer = function(fun) end,

  --- ```
  --- reaper.get_action_context()
  --- ```
  --- is_new_value,filename,sectionID,cmdID,mode,resolution,val,contextstr = reaper.get_action_context()Returns contextual information about the script, typically MIDI/OSC input values.val will be set to a relative or absolute value depending on mode (=0: absolute mode, >0: relative modes).resolution=127 for 7-bit resolution, =16383 for 14-bit resolution.sectionID, and cmdID will be set to -1 if the script is not part of the action list.mode, resolution and val will be set to -1 if the script was not triggered via MIDI/OSC.contextstr may be empty or one of: midi:XX[:YY] (one or two bytes hex) [wheel|hwheel|mtvert|mthorz|mtzoom|mtrot|mediakbd]:flags key:flags:keycode osc:/msg[:f=FloatValue|:s=StringValue] KBD_OnMainActionEx(flags may include V=virtkey, S=shift, A=alt/option, C=control/command, W=win/control)
  get_action_context = function() end,

  --- ```
  --- reaper.runloop(function fun)
  --- ```
  --- Adds code to be called back by REAPER. Used to create persistent ReaScripts that continue to run and respond to input, while the user does other tasks. Identical to defer().Note that no undo point will be automatically created when the script finishes, unless you create it explicitly.
  ---@param fun function
  runloop = function(fun) end,
}

---@diagnostic disable-next-line: lowercase-global
gfx = {
  --- ```
  --- gfx.getfont()
  --- ```
  --- Returns current font index, and the actual font face used by this font (if available).
  getfont = function() end,

  --- ```
  --- gfx.getpixel()
  --- ```
  --- Returns r,g,b values [0..1] of the pixel at (gfx.x,gfx.y)
  getpixel = function() end,

  --- ```
  --- gfx.quit()
  --- ```
  --- Closes the graphics window.
  quit = function() end,

  --- ```
  --- gfx.update()
  --- ```
  --- Updates the graphics display, if opened
  update = function() end,
}

---@class reaper.array
local _ = {}

--- ```
--- reaper.array.get_alloc()
--- ```
--- Returns the maximum (allocated) size of the array.
function _:get_alloc() end
