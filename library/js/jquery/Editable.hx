package js.jquery;

import haxe.Timer;
import js.JQuery;

typedef Params =
{
	@:optional var enabled : JQuery->Bool;
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
		
		jq.click(_ ->
		{
			if (!params.enabled(jq)) return;
			
            if (timer != null) timer.stop();
            timer = Timer.delay(beginEditInner.bind(jq, params), params.delay);
            new JQuery(js.Browser.document).one("mousemove", _ -> timer.stop());
		});
		
		jq.dblclick(_ ->
		{
			if (timer != null) timer.stop();
		});
		
		jq.on("editable.beginedit", _ -> beginEditInner(jq, params));
	}
	
	static function fixParams(params:Dynamic) : Dynamic
	{
		if (params == null) params = { };
		
		if (params.enabled		 == null) params.enabled = function(jq) return true;
		if (params.getData		 == null) params.getData = function(jq) return jq.html();
		if (params.setData		 == null) params.setData = function(jq, value) jq.html(value);
		if (params.delay		 == null) params.delay = 600;
		if (params.cssClass		 == null) params.cssClass = "";
		if (params.blurIsSuccess == null) params.blurIsSuccess = true;
		if (params.beginEdit	 == null) params.beginEdit = function(jq, input) { jq.hide(); input.insertBefore(jq); };
		if (params.endEdit		 == null) params.endEdit   = function(jq)        { jq.show(); }
		
		return params;
	}
	
	public static function beginEdit(jq:JQuery, ?params:Params)
	{
		if (params == null) jq.triggerHandler("editable.beginedit");
		else                beginEditInner(jq, params);
	}
	
	static function beginEditInner(jq:JQuery, params:Params)
	{
		if (jq.data("editing")) return;
		
		jq.data("editing", true);
		
		final input = new JQuery("<input type='text' value='" + params.getData(jq) + "' class='" + params.cssClass + "' />");
		
		params.beginEdit(jq, input);
		
		input
            // .keydown(e ->
            // {
            //     trace("input.keydown " + e.keyCode);
            // })
            .keyup(e ->
            {
                //trace("input.keyup " + e.keyCode);
                if (e.keyCode == 27) // ESCAPE
                {
                    endEdit(input, jq, params, false);
                }
            })
			.keypress(e ->
			{
                //trace("input.keypress " + e.keyCode);
				if (e.keyCode == 13) // ENTER
				{
					endEdit(input, jq, params, true);
				}
			})
			.blur(e ->
			{
				endEdit(input, jq, params, params.blurIsSuccess);
			});
		
		(cast input[0]).select();
	}
	
	static function endEdit(input:JQuery, jq:JQuery, params:Params, success:Bool)
	{
		jq.data("editing", false);
		
		final value = input.val();
		input.remove();
		params.endEdit(jq);
		if (success) params.setData(jq, value);
	}
}