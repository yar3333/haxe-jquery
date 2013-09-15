package js.jquery;

class ScrollPane
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/ScrollPane.js");
	}
	
	public static inline function jScrollPane(jq:js.JQuery, ?params : { 
		  showArrows : Bool					// false
		, maintainPosition : Bool			// true
		, stickToBottom : Bool				// false
		, stickToRight : Bool				// false
		, autoReinitialise : Bool			// false
		, autoReinitialiseDelay : Int		// 500
		, verticalDragMinHeight : Int 		// 0
		, verticalDragMaxHeight : Int		// 9999
		, horizontalDragMinWidth : Int		// 0
		, horizontalDragMaxWidth : Int		// 99999
		, contentWidth : Int 				// undefined
		, animateScroll : Bool				// false
		, animateDuration : Int				// 300
		, animateEase : String				// linear
		, hijackInternalLinks : Bool		// false
		, verticalGutter : Int				// 4
		, horizontalGutter : Int			// 4
		, mouseWheelSpeed : Int				// 10
		, arrowButtonSpeed : Int			// 10
		, arrowRepeatFreq : Int				// 100
		, arrowScrollOnHover : Bool			// false
		, verticalArrowPositions : String	// [split|before|after|os] (default split)
		, horizontalArrowPositions : String	// [split|before|after|os] (default split)
		, enableKeyboardNavigation : Bool	// true
		, hideFocus : Bool					// false
		, clickOnTrack : Bool				// true
		, trackClickSpeed : Int				// 30
		, trackClickRepeatFreq : Int		// 100
	}) : js.JQuery
	{
		return (cast jq).jScrollPane(params);
	}
}