package js.jquery.ui;

/**
	Position
**/

class Position
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
			haxe.macro.Compiler.includeFile("js/jquery/ui/Position.js");
			isInited = true;
		}
	}
	
	public static inline function position(jq:js.JQuery, options:Dynamic) : js.JQuery untyped 
	{
		return jq.position(options);
	}
}
