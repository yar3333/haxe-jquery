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

class Spectrum
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Spectrum.js");
	}
	
	public static inline function spectrum(jq:js.JQuery, ?options :
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
		?preferredFormat : String, // hex, hex6, hsl, rgb, name, 
		
		?change: TinyColor->Void,
		?move: TinyColor->Void,
		?show: TinyColor->Void,
		?hide: TinyColor->Void,
		?beforeShow: TinyColor->Void
	}
	) : js.JQuery untyped
	{
		return jq.spectrum(options);
	}
	
	public static inline function spectrumShow(jq:js.JQuery) : Void untyped jq.spectrum("show");
	public static inline function spectrumHide(jq:js.JQuery) : Void untyped jq.spectrum("hide");
	public static inline function spectrumToggle(jq:js.JQuery) : Void untyped jq.spectrum("toggle");
	public static inline function spectrumGet(jq:js.JQuery) : TinyColor untyped return jq.spectrum("get");
	public static inline function spectrumSet(jq:js.JQuery) : Void untyped jq.spectrum("set", colorString);
	public static inline function spectrumContainer(jq:js.JQuery) : Void untyped jq.spectrum("container");
	public static inline function spectrumReflow(jq:js.JQuery) : Void untyped jq.spectrum("reflow");
	public static inline function spectrumDestroy(jq:js.JQuery) : Void untyped jq.spectrum("destroy");
	public static inline function spectrumEnable(jq:js.JQuery) : Void untyped jq.spectrum("enable");
	public static inline function spectrumDisable(jq:js.JQuery) : Void untyped jq.spectrum("disable");
	public static inline function spectrumOptionGet(jq:js.JQuery, optionName:String) : Dynamic untyped return jq.spectrum("option", optionName);
	public static inline function spectrumOptionSet(jq:js.JQuery, optionName:String, newOptionValue:String) : Void untyped jq.spectrum("option", optionName, newOptionValue);	
}