package js.jquery;

typedef AutocompleteSuggestion =
{
	value : String,
	data : Dynamic
}

typedef AutocompleteOptions = 
{
	/**
	 * Server side URL or callback function that returns serviceUrl string. Optional if local lookup data is provided.
	 */
	@:optional var serviceUrl : String;
	
	/**
	 * Lookup array for the suggestions. It may be array of strings or suggestion object literals.
	 */
	@:optional var lookup : Array<Dynamic>;
	
	/**
	 * filter function for local lookups. By default it does partial string match (case insensitive).
	 * function (suggestion, query, queryLowerCase) {}
	 */	
	@:optional var lookupFilter : AutocompleteSuggestion->String->String->Void;
	
	/**
	 * Callback function invoked when user selects suggestion from the list. this inside callback refers to input HtmlElement.
	 * function (suggestion) {}
	 */
	@:optional var onSelect : AutocompleteSuggestion->Void;
	
	/**
	 * Minimum number of characters required to trigger autosuggest. Default: 1.
	 */
	@:optional var minChars : Int;
	
	/**
	 * Maximum height of the suggestions container in pixels. Default: 300.
	 */
	@:optional var maxHeight : Int;
	
	/**
	 * Number of miliseconds to defer ajax request. Default: 0.
	 */
	@:optional var deferRequestBy : Int;
	
	/**
	 * Suggestions container width in pixels, e.g.: 300. Default: auto, takes input field width.
	 */
	@:optional var width : Int;
	
	/**
	 * Additional parameters to pass with the request, optional.
	 */
	@:optional var params : Dynamic;
	
	/**
	 * Custom function to format suggestion entry inside suggestions container, optional.
	 * function (suggestion, currentValue) {} 
	 */
	@:optional var formatResult : AutocompleteSuggestion->String->Void;
	
	/**
	 * String or RegExp, that splits input value and takes last part to as query for suggestions. Useful when for example you need to fill list of coma separated values.
	 */
	@:optional var delimiter : Dynamic;
	
	/**
	 * 'z-index' for suggestions container. Default: 9999.
	 */
	@:optional var zIndex : Int;
	
	/**
	 * Ajax request type to get suggestions. Default: GET.
	 */
	@:optional var type : String;
	
	/**
	 * Boolean value indicating whether to cache suggestion results. Default false.
	 */
	@:optional var noCache : Bool;
	
	/**
	 * Called before ajax request. this is bound to input element.
	 * function (query) {} 
	 */
	@:optional var onSearchStart : String->Void;
	
	/**
	 * Called after ajax response is processed. this is bound to input element.
	 * function (query) {} 
	 */
	@:optional var onSearchComplete : String->Void;
	
	/**
	 * Default false. Set to true to leave the cursor in the input field after the user tabs to select a suggestion.
	 */
	@:optional var tabDisabled : Bool;
	
	/**
	 * Default query. The name of the request parameter that contains the query.
	 */
	@:optional var paramName : String;
	
	/**
	 * Called after the result of the query is ready. Converts the result into response.suggestions format.
	 * function(response, originalQuery) {} 
	 */
	@:optional var transformResult : Dynamic->String->{ suggestions:Array<AutocompleteSuggestion> };
	
	/**
	 * If set to true, first item will be selected when showing suggestions. Default value false.
	 */
	@:optional var autoSelectFirst : Bool;
	
	/**
	 * Container where suggestions will be appended. Default value body. Can be jQuery object, selector or html element. Make sure to set position: absolute or position: relative for that element.
	 */
	@:optional var appendTo : Dynamic;
	
	/**
	 * Type of data returned from server. Either 'text' (default) or 'jsonp', which will cause the autocomplete to use jsonp. You may return a json object in your callback when using jsonp.
	 */
	@:optional var dataType : String;
}

typedef AutocompleteInstance =
{
	var visible : Bool;
	
	var disabled : Bool;
	
	var selectedIndex(default, null) : Int;
	
	/**
	 * Clears suggestion cache and current suggestions.
	 */
	function clear() : Void;
	
	/**
	 * Clears suggestion cache.
	 */
	function clearCache() : Void;
	
	/**
	 * Deactivate autocomplete.
	 */
	function disable() : Void;
	
	/**
	 * Activates autocomplete if it was deactivated before.
	 */	
	function enable() : Void;
	
	/**
	 * Hides suggestions.
	 */
	function hide() : Void;
	
	/**
	 * Destroys autocomplete instance. All events are detached and suggestion containers removed.
	 */
	function dispose() : Void;
	
	function setOptions(options:AutocompleteOptions) : Void;
	
	/**
	 * Show suggestions.
	 */
	function suggest() : Void;
}

class Autocomplete
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/jquery/Autocomplete.js");
	}
	
	public static function autocomplete(jq:js.JQuery, ?params:AutocompleteOptions) : AutocompleteInstance untyped
	{
		jq.autocomplete(params);
		return jq.autocomplete();
	}
}