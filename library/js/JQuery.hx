/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package js;

import js.html.Window;
import js.html.Element;
import js.html.Document;

typedef JqEvent = {
	var originalEvent : Dynamic;
	
	var target : Element;
	var currentTarget : Element;
	var relatedTarget : Element;
	var delegateTarget : Element;

	var type : String;
	var timeStamp : Int;

	//var data : Dynamic;
	//var namespace : String;
	//var result : Dynamic;

	// position
	var pageX : Int;
	var pageY : Int;

	var wheelDelta : Int;

	// keys
	var keyCode : Int;
	var charCode : Int;
	var shiftKey : Bool;
	var ctrlKey : Bool;
	var altKey : Bool;
	var metaKey : Bool;

	var which : Int;

	// propagation
	function isDefaultPrevented() : Bool;
	function isImmediatePropagationStopped() : Bool;
	function isPropagationStopped() : Bool;
	function preventDefault() : Void;
	function stopImmediatePropagation() : Void;
	function stopPropagation() : Void;
}

typedef JqXHR =
{
	function done(callb:String->String->JqXHR->Void) : JqXHR;
	function fail(callb:JqXHR->String->Dynamic) : JqXHR;
	function always(callb:Dynamic->String->Dynamic) : JqXHR;
}

extern class JQueryHelper
{
	public static inline function J( html : haxe.extern.EitherType<String,haxe.extern.EitherType<JQuery,haxe.extern.EitherType<Window,haxe.extern.EitherType<Document,Element>>>> ) : JQuery {
        return new JQuery(cast html);
    }	

	public static var JTHIS(get, null) : JQuery;

	static inline function get_JTHIS() : JQuery {
		return new JQuery(js.Lib.nativeThis);
	}
}

typedef AjaxSettings = {
	?accepts : Dynamic,
	?async : Bool,
	?beforeSend : js.html.XMLHttpRequest->AjaxSettings->Void,
	?cache : Bool,
	?complete : js.html.XMLHttpRequest->AjaxSettings->Void,
	?contents : Dynamic<String>,
	?contentType : String,
	?context : Dynamic,
	?converters : Dynamic<String->Dynamic>,
	?crossDomain : Bool,
	?data : Dynamic,
	?dataFilter : String->String->Dynamic,
	?dataType : String,
	?error : js.html.XMLHttpRequest->String->String->Void,
	?global : Bool,
	?headers : Dynamic<String>,
	?ifModified : Bool,
	?isLocal : Bool,
	?jsonp : String,
	?jsonpCallback : Void->Void,
	?mimeType : String,
	?password : String,
	?processData : Bool,
	?scriptCharset : String, 
	?statusCode : Dynamic<Void->Void>,
	?success : Dynamic->String->js.html.XMLHttpRequest->Void,
	?timeout : Int,
	?traditional : Bool,
	?type : String,
	?url : String,
	?username : String,
	?xhr : Void->Dynamic,
	?xhrFields : Dynamic
}

@:initPackage
extern class JQuery implements ArrayAccess<Element> {

	var context(default,null) : Element;
	var length(default, null) : Int;

	@:selfCall
	@:overload(function(j:JQuery):Void{})
	@:overload(function(j:Window):Void{})
	@:overload(function(j:Element):Void{})
	@:overload(function():Void{})
	@:overload(function(j:Document):Void{})
	@:overload(function(html:String, j:JQuery):Void{})
	@:overload(function(html:String, j:Element):Void{})
	@:overload(function(html:String, attrs:Dynamic):Void{})
	@:overload(function(elements:Array<js.html.Element>):Void{})
	function new( html : String ) : Void;

	// attributes
	function addClass( className : String ) : JQuery;
	function removeClass( ?className : String ) : JQuery;
	function hasClass( className : String ) : Bool;
	function toggleClass( className : String, ?addRemove : Bool ) : JQuery;

	@:overload(function(name:String,value:String):JQuery{})
	function attr( name : String ) : String;

	function removeAttr( attr : String ) : JQuery;

	@:overload(function(name:String,value:Dynamic):JQuery{})
	function prop( name : String ) : Dynamic;

	@:overload(function(prop:String,value:String):JQuery{})
	@:overload(function(prop:String,value:Int):JQuery{})
	@:overload(function(prop:String,value:Float):JQuery{})
	@:overload(function(map:{}):JQuery{})
	function css( prop : String ) : String;

	@:overload(function(html:String):JQuery{})
	@:overload(function(html:JQuery):JQuery{})
	function html() : String;

	@:overload(function(value:String):JQuery{})
	@:overload(function(value:Int):JQuery{})
	@:overload(function(value:Float):JQuery{})
	function val() : String;

	@:overload(function(text:String):JQuery{})
	function text() : String;

	// Size & Position
	@:overload(function(value:Int):JQuery{})
	function width() : Int;
	@:overload(function(value:Int):JQuery{})
	function height() : Int;
	@:overload(function(value:Int):JQuery{})
	function innerWidth() : Int;
	@:overload(function(value:Int):JQuery{})
	function innerHeight() : Int;

	function outerWidth( ?includeMargin : Bool ) : Int;
	function outerHeight( ?includeMargin : Bool ) : Int;

	@:overload(function(value:Int):JQuery{})
	function scrollLeft() : Int;

	@:overload(function(value:Int):JQuery{})
	function scrollTop() : Int;

	@:overload(function(value: { left : Int, top : Int }):JQuery{})
	function offset() : { left : Int, top : Int };

	function offsetParent() : JQuery;

	@:overload(function(value: { left : Int, top : Int }):JQuery{})
	function position() : { left : Int, top : Int };

	// current group manipulation
	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function add( selector : String, ?context : JQuery ) : JQuery;
	function andSelf() : JQuery;
	function children( ?selector : String ) : JQuery;
	function clone( ?withDataAndEvents : Bool ) : JQuery;
	function closest( selector : String, ?context : JQuery ) : JQuery;
	function contents() : JQuery;

	@:overload(function( f : Int -> Element -> Void ):JQuery{})
	function each( f : Void -> Void ) : JQuery;
	function end() : JQuery;
	function eq( index : Int ) : JQuery;
	@:overload(function( f : Int -> Element -> Bool ):JQuery{})
	function filter( selector : String ) : JQuery;
	function find( selector : String ) : JQuery;
	function first() : JQuery;
	@:overload(function(j:JQuery):Int{})
	function index( ?selector : String ) : Int;
	function last( ?selector : String ) : JQuery;
	function has( selector : String ) : JQuery;
	function next( ?selector : String ) : JQuery;
	function nextAll( ?selector : String ) : JQuery;
	function nextUntil( ?selector : String ) : JQuery;
	function parent( ?selector : String ) : JQuery;
	function parents( ?selector : String ) : JQuery;
	function parentsUntil( ?selector : String ) : JQuery;
	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function not( selector : String ) : JQuery;
	function prev( ?selector : String ) : JQuery;
	function prevAll( ?selector : String ) : JQuery;
	function prevUntil( ?selector : String ) : JQuery;
	function pushStack( elements : Array<Element> ) : JQuery;
	function siblings( ?selector : String ) : JQuery;
	function size() : Int;
	function slice( start : Int, ?end : Int ) : JQuery;
	function toArray() : Array<Element>;

	// DOM changes
	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function before( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function after( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function append( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function appendTo( html : String ) : JQuery;

	function detach( ?selector : String ) : JQuery;
	function empty() : JQuery; // remove all texts

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function insertBefore( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function insertAfter( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function prepend( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function prependTo( html : String ) : JQuery;

	function remove( ?selector : String ) : JQuery;
	
	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function replaceAll( selector : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	@:overload(function(value:Array<Element>):JQuery{})
	function replaceWith( html : String ) : JQuery;

	function unwrap() : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	function wrap( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	function wrapAll( html : String ) : JQuery;

	@:overload(function(value:JQuery):JQuery{})
	@:overload(function(value:Element):JQuery{})
	function wrapInner( html : String ) : JQuery;

	function addBack( ?selector : String ) : JQuery;

	// animation
	@:overload(function(properties:{},?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function animate( properties : { }, ?duration : Int, ?callb : Void -> Void ) : JQuery;

	function delay( duration : Int, ?queueName : String ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function hide( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function fadeIn( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function fadeOut( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(duration:String,opacity:Float,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(duration:Int,opacity:Float,?easing:String,?call:Void->Void) : JQuery{})
	function fadeTo( duration : Int, opacity : Float, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function fadeToggle( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function show( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function slideDown( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function slideToggle( ?duration : Int, ?call : Void -> Void ) : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	function slideUp( ?duration : Int, ?call : Void -> Void ) : JQuery;

	function stop( ?clearQueue : Bool, ?jumpToEnd : Bool ) : JQuery;
	function finish() : JQuery;

	@:overload(function(?duration:String,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(?duration:Int,?easing:String,?call:Void->Void) : JQuery{})
	@:overload(function(show:Bool) : JQuery{})
	function toggle( ?duration : Int, ?call : Void -> Void ) : JQuery;

	// Events
	function blur( ?callb : JqEvent -> Void ) : JQuery;
	function change( ?callb : JqEvent -> Void ) : JQuery;

	@:overload(function(callb:Void->Void):JQuery { } )
	@:overload(function(callb:JQuery.JqEvent->Void):JQuery{})
	@:overload(function(callb:Void->Bool):JQuery{})
	function click( ?callb : JqEvent -> Void ) : JQuery;
	function dblclick( ?callb : JqEvent -> Void ) : JQuery;
	function error( ?callb : JqEvent -> Void ) : JQuery;
	function focus( ?callb : JqEvent -> Void ) : JQuery;
	function focusin( ?callb : JqEvent -> Void ) : JQuery;
	function focusout( ?callb : JqEvent -> Void ) : JQuery;

	@:overload(function(onInOut:JqEvent->Void):JQuery{})
	function hover( onIn : JqEvent -> Void, ?onOut : JqEvent -> Void ) : JQuery;

	@:overload(function( callb : JQuery.JqEvent -> Bool ) : JQuery {})
	function keydown( ?callb : JqEvent -> Void ) : JQuery;

	@:overload(function( callb : JQuery.JqEvent -> Bool ) : JQuery {})
	function keypress( ?callb : JqEvent -> Void ) : JQuery;

	@:overload(function( callb : JQuery.JqEvent -> Bool ) : JQuery {})
	function keyup( ?callb : JqEvent -> Void ) : JQuery;

	function mousedown( ?callb : JqEvent -> Void ) : JQuery;
	function mouseenter( ?callb : JqEvent -> Void ) : JQuery;
	function mouseleave( ?callb : JqEvent -> Void ) : JQuery;
	function mouseout( ?callb : JqEvent -> Void ) : JQuery;
	function mouseover( ?callb : JqEvent -> Void ) : JQuery;
	function mousemove( ?callb : JqEvent -> Void ) : JQuery;
	function mouseup( ?callb : JqEvent -> Void ) : JQuery;

	// AJAX overloads
	@:overload(function( url:String, ?data : {}, ?callb : String -> String -> Void ) : JQuery {})
	@:overload(function( url:String, ?data : {}, ?callb : String -> Void ) : JQuery {})
	@:overload(function( url:String, ?data : {}, ?callb : Void -> Void ) : JQuery {})
	function load( ?callb : JqEvent -> Void ) : JQuery;
	function ready( callb : JqEvent -> Void ) : JQuery;
	function resize( ?callb : JqEvent -> Void ) : JQuery;
	function scroll( ?callb : JqEvent -> Void ) : JQuery;
	function select( ?callb : JqEvent -> Void ) : JQuery;
	function submit( ?callb : JqEvent -> Void ) : JQuery;
	function unload( ?callb : JqEvent -> Void ) : JQuery;

	function bind( events : String, callb : JqEvent -> Void ) : JQuery;
	function delegate( selector : String, events : String, callb : JqEvent -> Void ) : JQuery;
	function die( ?events : String, ?callb : JqEvent -> Void ) : JQuery;
	function one( events : String, callb : JqEvent -> Void ) : JQuery;
	function live( events : String, callb : JqEvent -> Void ) : JQuery;
	function trigger( events : String ) : JQuery;
	function triggerHandler( events : String ) : JQuery;
	function unbind( ?events : String, ?callb : JqEvent -> Void ) : JQuery;
	function undelegate( ?selector : String, ?events : String, ?callb : JqEvent -> Void ) : JQuery;

	// JQuery 1.7+
	@:overload(function(events:String, selector:String, data:Dynamic, callb:JqEvent->Void):JQuery{})
	@:overload(function(events:String, selector:String, callb:JqEvent->Void):JQuery{})
	@:overload(function(events:Dynamic<JqEvent->Void>):JQuery{})
	function on( events : String, callb : JqEvent -> Void ) : JQuery;
	
	@:overload(function(events:String, selector:String, callb:JqEvent->Void):JQuery{})
	@:overload(function(events:String, selector:String):JQuery{})
	@:overload(function(events:String):JQuery{})
	function off( events : String, callb : JqEvent -> Void ) : JQuery;
	
	// queue
	function clearQueue( ?queueName : String ) : JQuery;
	function dequeue( ?queueName : String ) : JQuery;
	
	@:overload(function(callb : (Void -> Void) -> Void):JQuery{})
	function queue(queueName : String, ?callb : (Void -> Void) -> Void ) : JQuery;
	
	// ajax
	static inline function getAjax( url : String, ?params : Dynamic, ?callb : Dynamic -> Void, ?dataType : String ) : Void {
		untyped jQuery.get(url, params, callb, dataType);
	}
	static inline function postAjax( url : String, ?params : Dynamic, ?callb : Dynamic -> Void, ?dataType : String ) : Void {
		untyped jQuery.post(url, params, callb, dataType);
	}
	
	@:overload(function(settings:AjaxSettings):Void{})
	static function ajax(url:String, ?settings:AjaxSettings) : Void;

	static function getScript( url : String, ?success : String -> String -> JqXHR -> Void ) : JqXHR;
	static function getJSON( url : String, ?success : Dynamic -> String -> JqXHR -> Void ) : JqXHR;
	
	// deferred
	// TODO

	// other tools
	@:overload(function(index:Int):Element{})
	function get() : Array<Element>;

	@:overload(function(j:JQuery):Bool{})
	function is( selector : String ) : Bool;

	@:overload(function() : Dynamic {})
	@:overload(function( key : String ) : Dynamic {})
	function data( key : String, value : Dynamic ) : JQuery;
	function removeData( ?key : String ) : JQuery;
	function serialize() : String;
	function serializeArray() : Array<{ name : String, value : String }>;
	//inline function map<T>( f : JQuery -> T ) : Array<T> {
	//	return untyped this["map"](function() return f(cur)).get();
	//}

	// Haxe addition
	@:runtime inline function iterator() : Iterator<JQuery> {
		return untyped __define_feature__('js.JQuery.iterator', this["iterator"])();
	}

	/**
		Return the current JQuery element (in a callback), similar to $(this) in JS.
	**/
	static var cur(get, null) : JQuery;

	static var fx(default, null) : { off : Bool, interval : Int };
	static var browser(default, null) : { webkit : Bool, opera : Bool, msie : Bool, mozilla : Bool, version : String };

	static function contains( parent : Element, child : Element ) : Bool;
	static function noConflict( ?removeAll : Bool ) : Void;
	static function parseJSON( json : String ) : Dynamic;
	static function globalEval( js : String ) : Void;


	//static function parseXML
	//static function get, post
	//static function getJSON, getScript, grep
	//static function is*, makeArray, map, merge, noop, now, param, proxy, sub, trim, type, unique
	
	static function makeArray(arrayLike:{ var length(default, null):Int; }) : Array<js.html.Element>;

	private static inline function get_cur() : JQuery {
		return new js.JQuery(js.Lib.nativeThis);
	}

	private static function __init__() : Void untyped {
		#if embed_js
		if( js.Syntax.code("typeof($) == 'undefined'") )
			haxe.macro.Compiler.includeFile("js/jquery-latest.min.js");
		#end
		var q : Dynamic = (untyped js.Browser.window).jQuery;
		js.Syntax.code("var js = js || {}");
		js.JQuery = q;
		__feature__('js.JQuery.iterator',
			q.fn.iterator = function() return { pos : 0, j : __this__, hasNext : function() return __this__.pos < __this__.j.length, next : function() return $(__this__.j[__this__.pos++]) }
		);
	}
}
