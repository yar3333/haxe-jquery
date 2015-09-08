package js.jquery;

private typedef Params =
{
	/**
	 * Method to use when submitting edited content. Default is POST. You most likely want to use POST or PUT. PUT method is compatible with Rails.
	 */
	@:optional var method : String;
	
	/**
	 * Function is called after form has been submitted. Callback function receives two parameters. Value contains submitted form content. Settings contain all plugin settings. Inside function this refers to the original element.
	 */
	@:optional var callback : String;
	
	/**
	 * Name of the submitted parameter which contains edited content. Default is value.
	 */
	@:optional var name : String;
	
	/**
	 * Name of the submitted parameter which contains content id. Default is id.
	 */
	@:optional var id : String;
	
	/**
	 * Extra parameters when submitting content. Can be either a hash or function returning a hash.
	 */
	@:optional var submitdata : String;
	
	/**
	 * Input type to use. Default input types are text, textarea or select. Additional input types are provided using custom input type API.
	 */
	@:optional var type : String;
	
	/**
	 *  Number of rows if using textarea.
	 */
	@:optional var rows : Int;
	
	/**
	 * Number of columns if using textarea.
	 */
	@:optional var cols : Int;
	
	/**
	 * Height of the input element in pixels. Default is auto. This means height is calculated automatically. Can also be set to none.
	 */
	@:optional var height : Int;
	
	/**
	 * Width of the input element in pixels. Default is auto. This means width is calculated automatically. Can also be set to none.
	 */
	@:optional var width : Int;
	
	/**
	 * Normally content of the form will be same as content of the edited element. However using this parameter you can load form content from external URL.
	 */
	@:optional var loadurl : String;
	
	/**
	 * Request type to use when using loadurl. Default is GET. You most likely want to use only GET or POST.
	 */
	@:optional var loadtype : String;
	
	/**
	 * Text to display while loading external content.
	 */
	@:optional var loadtext : String;
	
	/**
	 * Extra parameter to add to request when using loadurl. Can be either a hash or function returning a hash.
	 */
	@:optional var loaddata : Dynamic;
	
	/**
	 * Form data passed as parameter. Can be either a string or function returning a string. Can be useful when you need to alter the text before editing.
	 */
	@:optional var data : Dynamic;
	
	/**
	 * Indicator html to show when saving.
	 */
	@:optional var indicator : String;
	
	/**
	 * Tooltip text via title attribute.
	 */
	@:optional var tooltip : String;
	
	/**
	 * Submit button value, empty means no button.
	 */
	@:optional var submit : String;
	
	/**
	 * Cancel button value, empty means no button.
	 */
	@:optional var cancel : String;
	
	/**
	 * CSS class to apply to input form. 'inherit' to copy from parent.
	 */
	@:optional var cssclass : String;
	
	/**
	 * Style to apply to input form 'inherit' to copy from parent.
	 */
	@:optional var style : String;
	
	/**
	 * When true text is highlighted.
	 */
	@:optional var select : Bool;
	
	/**
	 * Placeholder text or html to insert when element is empty.
	 */
	@:optional var placeholder : String;
	
	/**
	 * Default action of when user clicks outside of editable area is to cancel edits.
	 * You can control this by setting onblur option.
	 * Possible values are: cancel, submit, ignore.
	 */
	@:optional var onblur : String;
}

class Jeditable
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Jeditable.js");
	}
	
	public static function editable(jq:js.JQuery, callbackFunctionOrSubmitUrl:Dynamic, params:Params) : Void untyped
	{
		jq.editable(callbackFunctionOrSubmitUrl, params);
	}
}