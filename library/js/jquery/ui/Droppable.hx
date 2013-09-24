package js.jquery.ui;

/**
	Droppable
	http://jqueryui.com/demos/droppable/
**/

typedef DroppableUI = 
{
	var draggable : js.JQuery;
	var helper : js.JQuery;
	var position : { top:Int, left:Int };
	var offset: { top:Int, left:Int };
}

class Droppable
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
			js.jquery.ui.Draggable.init();
			haxe.macro.Compiler.includeFile("js/jquery/ui/Droppable.js");
			isInited = true;
		}
	}
	
	public static inline function droppable(jq:js.JQuery, ?options:
	{
          ?accept : Dynamic // "*"
		, ?activeClass : String // false
		
		, ?activate : js.JQuery.JqEvent->DroppableUI->Void
		, ?create : js.JQuery.JqEvent->DroppableUI->Void
		, ?deactivate : js.JQuery.JqEvent->DroppableUI->Void
		, ?drop : js.JQuery.JqEvent->DroppableUI->Void
		, ?out : js.JQuery.JqEvent->DroppableUI->Void
		, ?over : js.JQuery.JqEvent->DroppableUI->Void
	}
	) : js.JQuery untyped 
	{
		return jq.droppable(options);
	}
	
	/**
	 * Remove the draggable functionality completely. This will return the element back to its pre-init state.
	 */
	public static inline function draggableDestroy(jq:js.JQuery) : js.JQuery untyped 
	{
		return jq.draggable("destroy");
	}
	
	/**
	 * Disable the draggable.
	 */
	public static inline function draggableDisable(jq:js.JQuery) : js.JQuery untyped 
	{
		return jq.draggable("disable");
	}
	
	/**
	 * Enable the draggable.
	 */
	public static inline function draggableEnable(jq:js.JQuery) : js.JQuery untyped 
	{
		return jq.draggable("enable");
	}
	
	/**
	 * Get any draggable option
	 */
	public static inline function draggableOptionGet(jq:js.JQuery, optionName:String) : Dynamic untyped
	{
		return jq.draggable("option", optionName);
	}
	
	/**
	 * Set any draggable option
	 */
	public static inline function draggableOptionSet(jq:js.JQuery, optionName:String, value:Dynamic) : js.JQuery untyped
	{
		return jq.draggable("option", optionName, value);
	}
	
	/**
	 * Returns the .ui-draggable element.
	 */
	public static inline function draggableWidget(jq:js.JQuery) : js.JQuery untyped
	{
		return jq.draggable("widget");
	}
}
