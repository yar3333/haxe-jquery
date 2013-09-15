package js.jquery;

typedef Event = {>js.JQuery.JqEvent,
	var touches : Array<Dynamic>;
	var direction : String;
}

class TouchEvents
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/TouchEvents.js");
	}
	
	public static inline function touch(jq:js.JQuery, touchEventName:String, ?callb:Event->Void) : js.JQuery
	{
		return callb != null ? jq.bind(touchEventName, cast callb) : jq.trigger(touchEventName);
	}
}
