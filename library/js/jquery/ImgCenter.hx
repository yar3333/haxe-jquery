package js.jquery;

class ImgCenter
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/ImgCenter.js");
	}
	
	public static inline function imgCenter(jq:js.JQuery, ?params : { 
		parentSteps : Int /*=0*/,
		scaleToFit : Bool /*=true*/,
		complete : js.JQuery->Void /*=function(){}*/,
		start : js.JQuery->Void /*=function(){}*/,
		end : js.JQuery->Void /*=function(){}*/
	}) : String untyped
	{
		return jq.imgCenter(params);
	}
}