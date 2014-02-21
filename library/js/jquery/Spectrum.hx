package js.jquery;

typedef TinyColor =
{
	function toHex() : String;   		    			// "ff0000"
	function toHexString() : String; 					// "#ff0000"
	function toRgb() : { r:Int, g:Int, b:Int };   		// {"r":255,"g":0,"b":0}
	function toRgbString() : String;					// "rgb(255, 0, 0)"
	function toHsv() : { h:Float, s:Float, v:Float };	// {"h":0,"s":1,"v":1}
	function toHsvString() : String; 					// "hsv(0, 100%, 100%)"
	function toHsl() : { h:Float, s:Float, l:Float };	// {"h":0,"s":1,"l":0.5}
	function toHslString() : String;					// "hsl(0, 100%, 50%)"
	function toName() : String;      					// "red"
}

typedef SpectrumOptions =
{
	?color : String,
	?flat : Bool,
	?showInput : Bool,
	?allowEmpty : Bool,
	?showAlpha : Bool,
	?disabled : Bool,
	?showPalette : Bool,
	?palette : Array<String>,
	?showPaletteOnly : Bool,
	?showSelectionPalette : Bool,
	?clickoutFiresChange : Bool,
	?showInitial : Bool,
	?chooseText : String,
	?cancelText : String,
	?showButtons : Bool,
	?className : String,
	?preferredFormat : String, // hex, hex6, hsl, rgb, name
	
	?change : TinyColor->Void,
	?move : TinyColor->Void,
	?show : TinyColor->Void,
	?hide : TinyColor->Void,
	?beforeShow : TinyColor->Void
}

class SpectrumOptionsBuilder
{
	public var options : SpectrumOptions;
	
	public function new() options = {};
	
	function set(n:String, v:Dynamic, ?d:Dynamic) : SpectrumOptionsBuilder
	{
		untyped options[n] = v != null ? v : d;
		return this;
	}
	
	public inline function color(v:String) return set("color", v);
	public inline function flat(v:Bool) return set("flat", v);
	public inline function showInput(v:Bool) return set("showInput", v);
	public inline function allowEmpty(v:Bool) return set("allowEmpty", v);
	public inline function showAlpha(v:Bool) return set("showAlpha", v);
	public inline function disabled(v:Bool) return set("disabled", v);
	public inline function showPalette(v:Bool) return set("showPalette", v);
	public inline function palette(v:Array<String>) return set("palette", v);
	public inline function showPaletteOnly(v:Bool) return set("showPaletteOnly", v);
	public inline function showSelectionPalette(v:Bool) return set("showSelectionPalette", v);
	public inline function clickoutFiresChange(v:Bool) return set("clickoutFiresChange", v);
	public inline function showInitial(v:Bool) return set("showInitial", v);
	public inline function chooseText(v:String) return set("chooseText", v);
	public inline function cancelText(v:String) return set("cancelText", v);
	public inline function showButtons(v:Bool) return set("showButtons", v);
	public inline function className(v:String) return set("className", v);
	public inline function preferredFormat(v:String) return set("preferredFormat", v);
	public inline function change(v:TinyColor->Void) return set("change", v);
	public inline function move(v:TinyColor->Void) return set("move", v);
	public inline function show(v:TinyColor->Void) return set("show", v);
	public inline function hide(v:TinyColor->Void) return set("hide", v);
	public inline function beforeShow(v:TinyColor->Void) return set("beforeShow", v);
}

extern class SpectrumInstance
{
	private function spectrum(method:Dynamic, ?p1:Dynamic, ?p1:Dynamic) : Dynamic;
	
	public inline function show() : Void spectrum("show");
	public inline function hide() : Void spectrum("hide");
	public inline function toggle() : Void spectrum("toggle");
	public inline function get() : TinyColor return spectrum("get");
	public inline function set(color:String) : Void spectrum("set", color);
	public inline function container() : Void spectrum("container");
	public inline function reflow() : Void spectrum("reflow");
	public inline function destroy() : Void spectrum("destroy");
	public inline function enable() : Void spectrum("enable");
	public inline function disable() : Void spectrum("disable");
	public inline function getOption(name:String) : Dynamic return spectrum("option", name);
	public inline function setOption(name:String, value:String) : Void spectrum("option", name, value);	
}

class Spectrum
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Spectrum.js");
	}
	
	public static function spectrum(jq:js.JQuery, ?options:Dynamic) : SpectrumInstance untyped
	{
		if (options != null) jq.spectrum(options);
		return jq;
	}
}