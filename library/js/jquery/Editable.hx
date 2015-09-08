package js.jquery;

import haxe.Timer;
import js.JQuery;
import nanofl.ide.keyboard.Keys;

typedef Params =
{
	@:optional var clicked : JQuery->Bool;
	@:optional var getData : JQuery->String;
	@:optional var setData : JQuery->String->Void;
	@:optional var delay : Int;
	@:optional var cssClass : String;
	@:optional var blurIsSuccess : Bool;
	@:optional var beginEdit : JQuery->JQuery->Void;
	@:optional var endEdit : JQuery->Void;
}

class Editable
{
	public static function editable(jq:JQuery, ?params:Params) : Void
	{
		params = fixParams(params);
		
		var timer : Timer = null;
		
		jq.click(function(_)
		{
			if (params.clicked(jq))
			{
				if (timer != null) timer.stop();
				timer = Timer.delay(beginEdit.bind(jq, params), params.delay);
				jq.one("mousemove", function(_) timer.stop());
			}
		});
		
		jq.dblclick(function(_)
		{
			if (timer != null) timer.stop();
		});
	}
	
	static function fixParams(params:Dynamic) : Dynamic
	{
		if (params == null) params = { };
		
		if (params.clicked		== null) params.clicked = function(jq) return true;
		if (params.getData		== null) params.getData = function(jq) return jq.html();
		if (params.setData		== null) params.setData = function(jq, value) jq.html(value);
		if (params.delay		== null) params.delay = 600;
		if (params.cssClass		== null) params.cssClass = "";
		if (params.blurIsSuccess== null) params.blurIsSuccess = true;
		if (params.beginEdit	== null) params.beginEdit = function(jq, input) { jq.hide(); input.insertBefore(jq); };
		if (params.endEdit		== null) params.endEdit   = function(jq)        { jq.show(); }
		
		return params;
	}
	
	public static function beginEdit(jq:JQuery, params:Params)
	{
		var input = new JQuery("<input type='text' value='" + params.getData(jq) + "' class='" + params.cssClass + "' />");
		
		params.beginEdit(jq, input);
		
		input
			.keypress(function(e)
			{
				if (e.keyCode == Keys.ENTER)
				{
					endEdit(input, jq, params, true);
				}
				else
				if (e.keyCode == Keys.ESCAPE)
				{
					endEdit(input, jq, params, false);
				}
			})
			.blur(function(e)
			{
				endEdit(input, jq, params, params.blurIsSuccess);
			});
		
		(cast input[0]).select();
	}
	
	static function endEdit(input:JQuery, jq:JQuery, params:Params, success:Bool)
	{
		var value = input.val();
		input.remove();
		params.endEdit(jq);
		if (success) params.setData(jq, value);
	}
}