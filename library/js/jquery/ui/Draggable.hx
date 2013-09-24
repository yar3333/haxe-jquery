package js.jquery.ui;

/**
	Draggable
	http://jqueryui.com/demos/draggable/
**/

typedef DraggableUI = 
{
	var helper : js.JQuery;
	var position : { top:Int, left:Int };
	var offset: { top:Int, left:Int };
}

class Draggable
{
	static var isInited = false;
	
	static function __init__()
	{
		init();
	}	
	
	public static function init()
	{
		if (!isInited)
		{
			js.jquery.ui.Core.init();
			js.jquery.ui.Mouse.init();
			js.jquery.ui.Widget.init();
			haxe.macro.Compiler.includeFile("js/jquery/ui/Draggable.js");
			isInited = true;
		}
	}
	
	public static inline function draggable(jq:js.JQuery, ?options:
	{
		  ?addClasses : Bool
		, ?appendTo : Dynamic
		, ?axis : Dynamic // false, "x", "y"
		, ?cancel : String // ":input,option"
		, ?connectToSortable : String
		, ?containment : Dynamic // false, Selector or Element or String or Array
		, ?cursor : String // "auto"
		, ?cursorAt : { ?top:Int, ?left:Int, ?right:Int, ?bottom:Int }
		, ?delay : Int
		, ?disabled : Bool
		, ?distance : Int
		, ?grid : Dynamic // false, [x, y]
		, ?handle : Dynamic // false, Selector or Element
		, ?helper : Dynamic // "original", String or Function
		, ?iframeFix : Dynamic // false, Selector
		, ?opacity : Dynamic // false, Float
		, ?refreshPositions : Bool
		, ?revert : Dynamic // false, Boolean or String or Function()
		, ?revertDuration : Int
		, ?scope : String // "default"
		, ?scroll : Bool
		, ?scrollSensitivity : Int
		, ?scrollSpeed : Int
		, ?snap : Dynamic // false, Boolean or Selector
		, ?snapMode : String // "both"
		, ?snapTolerance : Int
		, ?stack : Dynamic // false, Selector
		, ?zIndex : Dynamic // false, Int
				
		, ?create: js.JQuery.JqEvent->DraggableUI->Void
		, ?drag: js.JQuery.JqEvent->DraggableUI->Void
		, ?start: js.JQuery.JqEvent->DraggableUI->Void
		, ?stop: js.JQuery.JqEvent->DraggableUI->Void
	}
	) : js.JQuery untyped 
	{
		return jq.draggable(options);
	}
	
	/**
	 * Remove the draggable functionality completely. This will return the element back to its pre-init state.
	 */
	public static inline function draggableDestroy(jq:js.JQuery) : js.JQuery untyped return jq.draggable("destroy");
	
	/**
	 * Disable the draggable.
	 */
	public static inline function draggableDisable(jq:js.JQuery) : js.JQuery untyped return jq.draggable("disable");
	
	/**
	 * Enable the draggable.
	 */
	public static inline function draggableEnable(jq:js.JQuery) : js.JQuery untyped return jq.draggable("enable");
	
	/**
	 * Get any draggable option
	 */
	public static inline function draggableOptionGet(jq:js.JQuery, optionName:String) : Dynamic untyped return jq.draggable("option", optionName);
	
	/**
	 * Set any draggable option
	 */
	public static inline function draggableOptionSet(jq:js.JQuery, optionName:String, value:Dynamic) : js.JQuery untyped return jq.draggable("option", optionName, value);
	
	/**
	 * Returns the .ui-draggable element.
	 */
	public static inline function draggableWidget(jq:js.JQuery) : js.JQuery untyped return jq.draggable("widget");
}
