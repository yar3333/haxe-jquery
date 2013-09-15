package js.jquery.ui;

/**
	Widget
	http://jqueryui.com/demos/widget/
**/

class Widget
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
			haxe.macro.Compiler.includeFile("js/jquery/ui/Widget.js");
			isInited = true;
		}
	}	
}
