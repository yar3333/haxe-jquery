package js.jquery.ui;

/**
	Draggable
	http://jqueryui.com/demos/draggable/
**/

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
		?cancel : String /*=":input,option"*/,
		?revert : Dynamic /*=false*/, 
		?containment : Dynamic /*=false*/,
		?helper : Dynamic /*="original"*/,
		?cursor : String /*="auto"*/
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
