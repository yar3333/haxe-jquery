package js.jquery;

typedef AutoresizeOptions = 
{
	@:optional var onResize : Void->Void;
	@:optional var animate : Bool;
	@:optional var animateDuration : Int;
	@:optional var animateCallback : Void->Void;
	@:optional var extraSpace : Int;
	@:optional var limit: Int;
}

class Autoresize
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Autoresize.js");
	}
	
	public static function autoResize(jq:js.JQuery, ?params:AutoresizeOptions) : js.JQuery
	{
		return jq.autoResize(params);
	}
}