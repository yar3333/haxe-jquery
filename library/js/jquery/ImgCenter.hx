package js.jquery;

class ImgCenter
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/ImgCenter.js");
	}
	
	public static inline function imgCenter(jq:js.JQuery, ?params : { 
		?mode : String, // "fit", "fill", "noscale"
		?parentPrecedence : Int, // 0
		?complete : js.JQuery->Void, // function()
		?start : js.JQuery->Void, // function()
		?end : js.JQuery->Void // function()
	}) : js.JQuery untyped
	{
		return jq.imgCenter(params);
	}
}