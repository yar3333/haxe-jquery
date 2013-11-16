package js.jquery;

class MouseWheel
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/MouseWheel.js");
	}
	
	/**
	 * Callback arguments: event, delta, deltaX, deltaY
	 */
	public static inline function mousewheel(jq:js.JQuery, callb:Dynamic->Int->Int->Int->Void) : js.JQuery untyped
	{
		return jq.mousewheel(callb);
	}
}