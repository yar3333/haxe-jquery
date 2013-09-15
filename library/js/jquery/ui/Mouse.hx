package js.jquery.ui;

/**
	Mouse
	http://jqueryui.com/demos/mouse/
**/

class Mouse
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
			js.jquery.ui.Widget.init();
			haxe.macro.Compiler.includeFile("js/jquery/ui/Mouse.js");
			isInited = true;
		}
	}
}
