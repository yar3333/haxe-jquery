package js.jquery.ui;

/**
	Sortable
	http://jqueryui.com/demos/sortable/
**/

class Sortable
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
			haxe.macro.Compiler.includeFile("js/jquery/ui/Sortable.js");
			isInited = true;
		}
	}
}
