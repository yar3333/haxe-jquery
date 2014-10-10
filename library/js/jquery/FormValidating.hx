package js.jquery;

import js.html.FormElement;
import js.JQuery;

class FormValidating
{
	public static function checkValidaty(elements:js.JQuery) : Bool
	{
		for (element in elements)
		{
			var e : { checkValidity:Dynamic, form:FormElement } = cast element[0];
			
			if (e.checkValidity && !e.checkValidity() && e.form != null)
			{
				var form = new JQuery(e.form);
				if (form.find("input[type=submit]").length == 0)
				{
					form.append("<input type='submit' style='display:none' />");
				}
				form.one("submit", function(e)
				{
					e.preventDefault();
				});
				form.find("input[type=submit]").click();
				return false;
			}
		}
		return true;
	}
}
