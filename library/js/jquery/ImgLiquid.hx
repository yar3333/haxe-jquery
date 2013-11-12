package js.jquery;

/**
 *	html5 data attr (overwrite all)
 *			data-imgLiquid-fill="true"
 *			data-imgLiquid-horizontalAlign="center"
 *			data-imgLiquid-verticalAlign='center'
 */

class ImgLiquid
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/ImgLiquid.js");
	}
	
	public static inline function imgLiquid(jq:js.JQuery, ?params : { 
		?fill : Bool,
		?verticalAlign : String,	// 'center' //	'top'	//	'bottom' // '50%'  // '10%' 
		?horizontalAlign : String,	// 'center' //	'left'	//	'right'  // '50%'  // '10%' 
		?onStart : Void->Void,
		?onFinish : Void->Void,
		?onItemStart : Int->js.JQuery->js.JQuery->Void, // function(index, container, img)
		?onItemFinish : Int->js.JQuery->js.JQuery->Void, // function(index, container, img)
	}) : js.JQuery untyped
	{
		return jq.imgLiquid(params);
	}
}