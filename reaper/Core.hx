package reaper;

import reaper.ReaperTypes;

@:native("reaper")
extern class Core {
	/**
	 * Creates a new media item in a track and returns it
	 * @param track 
	 * @return MediaItem
	 */
	public static function AddMediaItemToTrack(track:MediaTrack):MediaItem;

	/**
	 *  Adds a project marker. Supply an id >=0  if you want a particular index number,
	    *  but you'll get a different index number a region and wantidx is already in use.
	    * @param project 
	    * @param isRegion 
	    * @param position 
	    * @param regionEnd 
	    * @param name 
	    * @param id 
	    * @return number | The index of the created marker/region, or -1 on failure.
	 */
	public static function AddProjectMarker(project:ReaProject, isRegion:Bool, position:Int, regionEnd:Int, name:String, id:Int):Int;

	/**
	 *  Adds a project marker. Supply an id >=0  if you want a particular index number,
	    * but you'll get a different index number a region and wantidx is already in use.
	    * color should be 0 (default color), or ColorToNative(r,g,b)|0x1000000
	    * @param project 
	    * @param isRegion 
	    * @param position 
	    * @param regionEnd 
	    * @param name 
	    * @param id 
	    * @param color
	    * @return number | The index of the created marker/region, or -1 on failure.
	 */
	public static function AddProjectMarkerWithColor(project:ReaProject, isRegion:Bool, position:Int, regionEnd:Int, name:String, id:Int, color:Color):Int;

	public static function AddProjectMarker2(project:ReaProject, isRegion:Bool, position:Int, regionEnd:Int, name:String, id:Int, color:Color):Int;

	/**
	 	* Add a ReaScript (return the new command ID, or 0 if failed) or remove a
	 * ReaScript (return >0 on success). Use commit==true when adding/removing a
	 * single script. When bulk adding/removing (n) scripts, you can optimize the
	 * n-1 first calls with commit==false and commit==true for the last call.
	    * @param add 
	    * @param sectionID 
	    * @param scriptFunc 
	    * @param commit 
	    * @return Int
	 */
	public static function AddRemoveReaScript(add:Bool, sectionID:Int, scriptFunc:String, commit:Bool):Int;

	public static function AddTakeToMediaItem(item:MediaItem):MediaItemTake;

	public static function AddTempoTimeSigMarker(proj:ReaProject, timepos:Float, bpm:Float, timesig_num:Int, timesig_denom:Int, lineartempochange:Bool):Int;

	public static function AdjustZoom(amt:Int, forceset:Int, doupd:Bool, centermode:Int):Void;

  public static function AnyTrackSolo(proj:ReaProject):Bool;

  public static function APITest():Void;

  public static function APIExists(function_name:String):Bool;

  public static function ApplyNudge(project: ReaProject, nudgeFlag: Int, nudgeWhat: Int, nudgeUnits: Int, value: Float, reverse: Bool, copies: Int):Bool;

  public static function ArmCommand(command: Int, sectionName: String):Void;

  public static function AudioInit():Void;

  public static function AudioIsPreBuffer():Bool;

  public static function AudioIsRunning():Bool;

  public static function audioQuit():Void;

  public static function AudioAccessorStateChanged(accessor:AudioAccessor):Void;

  public static function AudioAccessorUpdate(accessor:AudioAccessor):Void;

  public static function AudioAccessorValidateState(accessor:AudioAccessor):Void;

  public static function BypassFxAllTracks(bypass: Int):Void;

  public static function CalcMediaSrcLoudness(mediaSource: PCMSource):Float; 

  public static function CalculateNormalization(source: PCMSource, normalizeTo: Float, normalizeTarget: Float, normalizeStart: Float, normalizeEnd: Float):Float;

  public static function ClearAllRecArmed():Void;

  public static function ClearConsole():Void;

  public static function ClearPeakCache():Void;

  public static function ColorFromNative(col: Int):Color;

  public static function ColorToNative(r: Int, g: Int, b: Int):Int;

  public static function CountActionShortcuts(section: Int, cmdID: Int):Int;

  public static function CountAutomationItems(env: TrackEnvelope):Int;

  public static function CountEnvelopePoints(env: TrackEnvelope):Int;

  public static function CountEnvelopePointsEx(env: TrackEnvelope, autoItemIdx: Int):Int;

  public static function CountMediaItems(proj:ReaProject):Int;

  public static function CountProjectMarkers(project:ReaProject):Int;

  public static function CountSelectedTracks(proj:ReaProject):Int;

  public static function CountTakeEnvelopes(proj:ReaProject):Int;

	public static function CountTakes(item:MediaItem):Int;

	public static function CountTCPFXParms(item:MediaItem):Int;

	public static function CountTempoTimeSigMarkers(project:ReaProject):Int;

  public static function CountTrackEvnvelopes(proj:ReaProject):Int;

  public static function CountTracks(proj:ReaProject):Int;

  public static function CountMIDIItemInProj(track: MediaTrack, startTime: Float, endTime: Float, qnIn: Int):Int;

  public static function CreateTakeAudioAccessor(take: MediaItemTake):AudioAccessor;

  public static function CreateTrackAudioAccessor(track: MediaTrack):AudioAccessor;

  public static function CreateTrackSend(tr: MediaTrack, desttrIn: MediaTrack):Int;

  public static function FSurf_FlushUndo(force: Bool):Void;

  public static function GetTrack(project:ReaProject, trackIdx:Int):MediaTrack;

  public static function GetMasterTrack(project: ReaProject): MediaTrack;

  public static function ShowConsoleMsg(msg: String):Void;

	public static function ShowMessageBox(msg: String, title: String, type: Int):Void;
}
