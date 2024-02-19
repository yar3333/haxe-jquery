import js.Browser;
import js.JQuery;
using js.jquery.ImgCenter;

class Main
{
    static function main()
	{
		new JQuery(cast function()
		{
			new JQuery("#img0").imgCenter();
			new JQuery("#img1").imgCenter({ mode:"fill" });
			new JQuery("#img2").imgCenter({ mode:"noscale" });
			new JQuery("#img3").imgCenter({ mode:"noscale" });

            var imgs = new JQuery("img");
            for (img in imgs) Browser.console.log(img);
		});
	}
}
