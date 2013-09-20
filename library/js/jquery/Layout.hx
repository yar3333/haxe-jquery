package js.jquery;

////////////////////////////////////////////////////////////
//
// See "http://layout.jquery-dev.net/" for details.
//
////////////////////////////////////////////////////////////

typedef LayoutPaneOptions =
{
	// Basic Layout/Pane Options
	@:optional var applyDefaultStyles : Bool;
	@:optional var scrollToBookmarkOnLoad : Bool;
	@:optional var showOverflowOnHover : Bool;
	@:optional var closable : Bool;
	@:optional var resizable : Bool;
	@:optional var slidable : Bool;

	// Element Selectors Strings
	@:optional var paneSelector : String;
	@:optional var contentSelector : String;
	@:optional var contentIgnoreSelector : String;

	// Auto-generated Classnames
	@:optional var paneClass : String;
	@:optional var resizerClass : String;
	@:optional var togglerClass : String;
	@:optional var buttonClass : String;

	// Pane Size & Spacing
	@:optional var size : Dynamic; // initial size - 'auto'/200
	@:optional var minSize : Int;
	@:optional var maxSize : Int;
	@:optional var spacing_open : Int;
	@:optional var spacing_closed : Int;

	// Resizer-bar Formatting
	@:optional var resizerTip : String;
	@:optional var resizerCursor : String;
	@:optional var resizerDragOpacity : Float;
	@:optional var sliderTip : String;
	@:optional var sliderCursor : String;
	@:optional var maskIframesOnResize : Bool;
	@:optional var slideTrigger_open : String; // "click", "dblclick", "mouseover"
	@:optional var slideTrigger_close : String; // "click", "mouseout"

	// Toggler-button Formatting
	@:optional var togglerTip_open : String;
	@:optional var togglerTip_closed : String;
	@:optional var togglerLength_open : Int;
	@:optional var togglerLength_closed : Int;
	@:optional var hideTogglerOnSlide : Bool;
	@:optional var togglerAlign_open : String;
	@:optional var togglerAlign_closed : String;
	@:optional var togglerContent_open : String;
	@:optional var togglerContent_closed : String;

	// Pane Open/Close Hotkeys
	@:optional var enableCursorHotkey : Bool;
	@:optional var customHotkeyModifier : String; // "CTRL", "SHIFT", "CTRL+SHIFT"
	@:optional var customHotkey : String; // alphanumeric character OR a charCode

	// Pane Animation Effects
	@:optional var fxName : String;
	//@:optional var fxName_open : String;
	//@:optional var fxName_close : String;
	@:optional var fxSpeed : Dynamic; // "fast", "normal", "slow", integer - ms
	//@:optional var fxSpeed_open : String;
	//@:optional var fxSpeed_close : String;
	@:optional var fxSettings : Dynamic; // like { duration: 500, easing: "bounceInOut" }
	//@:optional var fxSettings_open : String;
	//@:optional var fxSettings_close : String;

	// Layout State Initialization
	@:optional var initClosed : Bool;
	@:optional var initHidden : Bool;

	// Layout Event Callbacks
	@:optional var onshow_start : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Bool; // paneName, paneElem, paneState, paneOptions, paneLayoutName
	@:optional var onshow_end : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Void;
	@:optional var onhide_start : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Bool;
	@:optional var onhide_end : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Void;
	@:optional var onopen_start : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Bool;
	@:optional var onopen_end : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Void;
	@:optional var onclose_start : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Bool;
	@:optional var onclose_end : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Void;
	@:optional var onresize_start : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Bool;
	@:optional var onresize_end : String->js.JQuery->LayoutPaneState->LayoutPaneOptions->String->Void;
}

typedef LayoutPaneState =
{
	var isClosed : Bool;
	var isSliding : Bool;
	var isResizing : Bool;
	var isHidden : Bool;
	var noRoom : Bool;
	var size : Int;
	var minSize : Int;
	var maxSize : Int;
	
	var innerWidth : Int;
	var innerHeight : Int;
	var outerWidth : Int;
	var outerHeight : Int;
	var paddingTop : Int;
	var paddingLeft : Int;
	var paddingBottom : Int;
	var paddingRight : Int;
}

typedef LayoutInstance =
{
	var panes : { center:js.JQuery, north:js.JQuery, south:js.JQuery, east:js.JQuery, west:js.JQuery };
	var options : { center:LayoutPaneOptions, north:LayoutPaneOptions, south:LayoutPaneOptions, east:LayoutPaneOptions, west:LayoutPaneOptions };
	var state : { center:LayoutPaneState, container:LayoutPaneState, north:LayoutPaneState, south:LayoutPaneState, east:LayoutPaneState, west:LayoutPaneState };
	
	function toggle(pane:String) : Void;
	function open(pane:String) : Void;
	function close(pane:String) : Void;
	function hide(pane:String) : Void;
	function show(pane:String, ?openPane:Bool) : Void;
	
	/**
	 * This sizes the pane in the direction it opens and closes - for north and south panes, size=outerHeight, 
	 * for east and west panes, size=outerWidth. The pane will only resize within its minSize and maxSize limits.
	 */
	function sizePane(pane:String, sizeInPixels:Int) : Void;

	/**
	 * Resizes the 'content container' inside the specified pane.
	 * Content is resized automatically when the pane is resized or opened,
	 * so this method only needs to be called manually if something 
	 * 'changes the height' of a header or footer element in the pane.
	 */
	function resizeContent(pane:String) : Void;
    
	/**
	 * Resizes the entire layout to fit its container. This method runs automatically for all layouts when the browser window is resized.
	 */
	function resizeAll() : Void;
    
	function addToggleBtn(selector:String, pane:String) : Void;
	function addCloseBtn(selector:String, pane:String) : Void;
	function addOpenBtn(selector:String, pane:String) : Void;
	function addPinBtn(selector:String, pane:String) : Void;
	function allowOverflow(elem_or_pane:Dynamic) : Void;
	function resetOverflow(elem_or_pane:Dynamic) : Void;
}

class Layout
{
	static var isInited = false;
	
	static function __init__() : Void
	{
		init();
	}
	
	public static function init() : Void
	{
		if (!isInited)
		{
			js.jquery.ui.Draggable.init();
			haxe.macro.Compiler.includeFile("js/jquery/Layout.js");
			isInited = true;
		}
	}
	
	public static inline function layout(jq:js.JQuery, ?params :
	{
		?defaults:LayoutPaneOptions,
		?center:LayoutPaneOptions,
		?north:LayoutPaneOptions,
		?south:LayoutPaneOptions,
		?east:LayoutPaneOptions,
		?west:LayoutPaneOptions
	}
	) : LayoutInstance untyped
	{
		return params != null ? jq.layout(params) : jq.layout();
	}
}