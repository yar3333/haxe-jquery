package js.jquery.ui;

/**
	Resizable
	http://jqueryui.com/demos/resizable/
**/

typedef ResizeEvent =
{
    /**
     * The jQuery object representing the element to be resized.
     */
	var element : js.JQuery;
    
    /**
     * The jQuery object representing the helper that's being resized.
     */
	var helper : js.JQuery;
    
    /**
     * The jQuery object representing the original element before it is wrapped.
     */
	var originalElement : js.JQuery;
    
    /**
     * The position before the resizable is resized.
     */
	var originalPosition : { left:Int, top:Int };
    
    /**
     * The size before the resizable is resized.
     */
	var originalSize : { width:Int, height:Int };
    
    /**
     * The current position.
     */
	var position : { left:Int, top:Int };
    
    /**
     * The current size.
     */
	var size : { width:Int, height:Int };
}

class Resizable
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
			haxe.macro.Compiler.includeFile("js/jquery/ui/Resizable.js");
			isInited = true;
		}
	}
	
	public static inline function resizable(jq:js.JQuery, options:
	{
		  ?alsoResize : Dynamic // Selector or jQuery or Element - One or more elements to resize synchronously with the resizable element.
		, ?animate : Bool
		, ?animateDuration : Dynamic // Number or String
		, ?animateEasing : String
		, ?aspectRatio : Dynamic // Boolean or Number
		, ?autoHide : Bool
		, ?cancel : String // Selector
		, ?containment : Dynamic // Selector or Element or String
		, ?delay : Int
		, ?disabled : Bool
		, ?distance : Int
		, ?ghost : Bool // If set to true, a semi-transparent helper element is shown for resizing.
		, ?grid : Array<Int> // [x, y]
		, ?handles : Dynamic // String or Object (default is "e, s, se").
		, ?helper : String // A class name that will be added to a proxy element to outline the resize during the drag of the resize handle. Once the resize is complete, the original element is sized.
		, ?maxHeight : Int
		, ?maxWidth : Int
		, ?minHeight : Int
		, ?minWidth : Int
	}
	) : js.JQuery untyped 
	{
		return jq.resizable(options);
	}
	
	public static inline function resizableDestroy(jq:js.JQuery) : js.JQuery untyped return jq.resizable("destroy");
	public static inline function resizableDisable(jq:js.JQuery) : js.JQuery untyped return jq.resizable("disable");
	public static inline function resizableEnable(jq:js.JQuery) : js.JQuery untyped  return jq.resizable("enable");
	public static inline function resizableOptionGet(jq:js.JQuery, optionName:String) : Dynamic untyped return jq.resizable("option", optionName);
	public static inline function resizableOptionSet(jq:js.JQuery, optionName:String, value:Dynamic) : js.JQuery untyped return jq.resizable("option", optionName, value);
	public static inline function resizableWidget(jq:js.JQuery) : js.JQuery untyped return jq.resizable("widget");
	
	public static inline function onResizeCreate(f:js.JQuery.JqEvent->Void) : js.JQuery untyped return jq.on("resizecreate", f);
	public static inline function onResize(f:js.JQuery.JqEvent->ResizeEvent->Void) : js.JQuery untyped return jq.on("resize", f);
	public static inline function onResizeStart(f:js.JQuery.JqEvent->ResizeEvent->Void) : js.JQuery untyped return jq.on("resizestart", f);
	public static inline function onResizeStop(f:js.JQuery.JqEvent->ResizeEvent->Void) : js.JQuery untyped return jq.on("resizestop", f);
}
