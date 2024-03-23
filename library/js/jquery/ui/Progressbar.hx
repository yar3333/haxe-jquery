package js.jquery.ui;

/**
	Progressbar
	https://jqueryui.com/progressbar/
**/

import haxe.extern.EitherType;

class Progressbar
{
	static var isInited = false;
	
	static function __init__()
	{
		init();
	}	
	
	public static function init()
	{
		if (!isInited)
		{
			js.jquery.ui.Core.init();
			js.jquery.ui.Widget.init();
			haxe.macro.Compiler.includeFile("js/jquery/ui/Progressbar.js");
			isInited = true;
		}
	}
	
	public static inline function progressbar(jq:js.JQuery, ?options:
	{
		  ?disabled : Bool
		, ?max : Float // 100
        , ?value : EitherType<Float, Bool> // false to create an indeterminate progressbar
	}
	) : js.JQuery untyped 
	{
		return jq.progressbar(options);
	}
	
	public static inline function progressbarDestroy(jq:js.JQuery) : js.JQuery untyped return jq.progressbar("destroy");
	public static inline function progressbarDisable(jq:js.JQuery) : js.JQuery untyped return jq.progressbar("disable");
	public static inline function progressbarEnable(jq:js.JQuery) : js.JQuery untyped  return jq.progressbar("enable");
	public static inline function progressbarOptionGet(jq:js.JQuery, optionName:String) : Dynamic untyped return jq.progressbar("option", optionName);
	public static inline function progressbarOptionSet(jq:js.JQuery, optionName:String, value:Dynamic) : js.JQuery untyped return jq.progressbar("option", optionName, value);
	public static inline function progressbarValueGet(jq:js.JQuery) : js.JQuery untyped return jq.progressbar("value");
	public static inline function progressbarValueSet(jq:js.JQuery, v:Float) : js.JQuery untyped return jq.progressbar("value", v);
	
	public static inline function onChange(f:js.JQuery.JqEvent->Void) : js.JQuery untyped return jq.on("progressbarchange", f);
	public static inline function onComplete(f:js.JQuery.JqEvent->Void) : js.JQuery untyped return jq.on("progressbarcomplete", f);
	public static inline function onCreate(f:js.JQuery.JqEvent->Void) : js.JQuery untyped return jq.on("progressbarcreate", f);
}
