package js.jquery;

class Autocomplete
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Autocomplete.js");
	}
	
	public static inline function autocomplete(jq:js.JQuery, params : { 
		autoSubmit : Bool /*=false*/,
		minChars : Int /*=1*/,
		maxHeight : Int /*=300*/,
		deferRequestBy : Int /*=0*/,
		width : Int /*=0*/,
		highlight : Bool /*=true*/,
		delimiter : String /*=null*/,
		zIndex : Int /*=9999*/,
		lookup : Array<String> /*=[]*/
	}) : String untyped
	{
		return jq.autocomplete(params);
	}
}