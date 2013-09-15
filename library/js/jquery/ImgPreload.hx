package js.jquery;

class ImgPreload
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/ImgPreload.js");
	}
	
	public static inline function imgPreload(jq:js.JQuery, urls:Array<String>, params : { 
		each:Void->Void /*=function(){}*/,
		all:Void->Void /*=function(){}*/
	}) : String untyped
	{
		return js.JQuery.imgpreload(urls, params);
	}
}