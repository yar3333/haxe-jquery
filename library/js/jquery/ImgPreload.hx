package js.jquery;

class ImgPreload
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/ImgPreload.js");
	}
	
	public static inline function imgPreload(jq:js.JQuery, urls:Array<String>, params:
	{ 
		  ?each : Void->Void
		, ?all : Void->Void
	}
	) : String untyped
	{
		return js.JQuery.imgpreload(urls, params);
	}
}