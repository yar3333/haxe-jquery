(function($){
	$.fn.imgCenter = function(options)
	{
		var defaults = {  
		  	mode: "fit", // fit, fill, noscale
		  	parentPrecedence: 0,
		  	complete: function(){},
		  	start: function(){},
		  	end: function(){}
	  	};  
	 	var opts = $.extend(defaults, options);
	 	
		opts.start.call(this);
		
		var maxIndex = this.length - 1;
		
		return this.each(function(current) {
			
			var $img = $(this);
			
			$img.hide();
			
			var $parent = $img;
			for (var i=0; i<=opts.parentPrecedence; i++)
			{
				$parent = $parent.parent();
			}			
			
			var parWidth = parseInt($parent.width());
			var parHeight = parseInt($parent.height());

			if ($img[0].complete)
			{
				processImage($img);
			}
			else
			{
				$img.load(function(e) { processImage($img); });
			}

			function processImage($img)
			{
				if (opts.mode != "fit") $parent.css("overflow","hidden");
				
				$img.show();
                
				var imgWidth = $img[0].width;
				var imgHeight = $img[0].height;
				
				if (opts.mode == "fit" || opts.mode == "fill")
				{
					var k = opts.mode == "fit" 
						? Math.min(parWidth / imgWidth, parHeight / imgHeight)
						: Math.max(parWidth / imgWidth, parHeight / imgHeight);
					
					imgWidth = Math.round(imgWidth * k);
					imgHeight = Math.round(imgHeight * k);
						
					$img.width(imgWidth);
					$img.height(imgHeight);
					
					$img.css("margin-left", Math.round((parWidth - imgWidth) / 2) + "px");
					$img.css("margin-top", Math.round((parHeight - imgHeight) / 2) + "px");
				}
				else
				{
					$img.css("margin-left", Math.round((parWidth - imgWidth) / 2) + "px");
					$img.css("margin-top", Math.round((parHeight - imgHeight) / 2) + "px");
				}
				
				opts.complete.call(this);
				
				if (current == maxIndex)
				{
					opts.end.call(this);
				}
			}
		});		
	}
})(jQuery);  