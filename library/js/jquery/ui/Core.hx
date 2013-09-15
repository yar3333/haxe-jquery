package js.jquery.ui;

/**
	Core
	http://jqueryui.com/demos/core/
**/

class Core
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
			haxe.macro.Compiler.includeFile("js/jquery/ui/Core.js");
			isInited = true;
		}
	}
}
