package js.jquery;

class MouseWheel
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/MouseWheel.js");
	}
	
	public static inline function mousewheel(jq:js.JQuery, callb:Dynamic->Int->Int->Int->Void) : js.JQuery
	{
		return (cast jq).mousewheel(callb);
	}
}