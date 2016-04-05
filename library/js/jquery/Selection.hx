package js.jquery;

import js.JQuery;

class Selection
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Selection.js");
	}
	
	/**
	 * Caret: keep, start, end.
	 */
	public static inline function selectionReplace(jq:JQuery, text:String, caret="keep") : JQuery
	{
		return (cast jq).selection("replace", { text:text, caret:caret });
	}
	
	/**
	 * Mode: before, after.
	 * Caret: keep, start, end.
	 */
	public static inline function selectionInsert(jq:JQuery, text:String, mode="", caret="keep") : JQuery
	{
		return (cast jq).selection("insert", { text:text, mode:mode, caret:caret });
	}
	
	public static inline function selectionGet(jq:JQuery) : String
	{
		return (cast jq).selection("get");
	}
	
	public static inline function selectionGetPos(jq:JQuery) : { start:Int, end:Int }
	{
		return (cast jq).selection("getPos");
	}
	
	public static inline function selectionSetPos(jq:JQuery, start:Int, end:Int) : JQuery
	{
		return (cast jq).selection("setPos", { start:start, end:end });
	}
	
	/**
	 * Mode: text, html.
	 */
	public static inline function selection(jq:Class<JQuery>, mode="text") : String
	{
		return untyped JQuery.selection(mode);
	}
}