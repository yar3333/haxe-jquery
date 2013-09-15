(function($){
	$.fn.imgCenter = function(options)
	{
		var defaults = {  
		  	parentSteps: 0,
		  	scaleToFit: true,
		  	complete: function(){},
		  	start: function(){},
		  	end: function(){}
	  	};  
	 	var opts = $.extend(defaults, options);
	 	
		opts.start.call(this);
		
		// Get total number of items.
		var len = this.length - 1;
		
		return this.each(function(i){
			var current = i;
			
			// Declare the current Image as a variable.
			var org_image = $(this);
			
			org_image.hide();
			
			// Move up Parents until the spcified limit has been met.
			var theParent = org_image;
			for (var i=0; i <= opts.parentSteps; i++){
				theParent = theParent.parent();
			}			
			var parWidth = parseInt(theParent.width());
			var parHeight = parseInt(theParent.height());
			var parAspect = parWidth / parHeight;

			if(org_image[0].complete){
				imgMath(org_image);
			} else {
				var loadWatch = setInterval(watch, 500);
			}
			
			function watch()
			{
				if (org_image[0].complete)
				{
					clearInterval(loadWatch);
					imgMath(org_image);
				}
			}

			function imgMath(org_image)
			{
				org_image.show();
                
                // Get image properties.		
				var imgWidth = org_image.width();
				var imgHeight = org_image.height();
	
				// Center the image.
				theParent.css("overflow","hidden");
				
				if (opts.scaleToFit)
				{
					var k = Math.min(parWidth / imgWidth, parHeight / imgHeight);
					
					org_image.width(Math.round(imgWidth*k));
					org_image.height(Math.round(imgHeight*k));
					
					org_image.css("margin-left", Math.round((parWidth - org_image.width()) / 2) + "px");
					org_image.css("margin-top", Math.round((parHeight - org_image.height()) / 2) + "px");
				} 
				else
				{
					if (imgWidth > parWidth)
					{
						org_image.css({"margin-left":"-"+ Math.round((imgWidth - parWidth) / 2) + "px"});
					} 
					else if (imgWidth < parWidth)
					{
						org_image.css("margin-left", Math.round((parWidth -imgWidth) / 2) + "px");
					}
					
					if (imgHeight > parHeight)
					{
						org_image.css("margin-top", "-" + Math.round((imgHeight - parHeight) / 2) + "px");
					}
					else if (imgHeight < parHeight && opts.centerVertical)
					{
						org_image.css("margin-top", Math.round((parHeight - imgHeight) / 2) + "px");
					}
				}
				
				opts.complete.call(this);
				
				if(current == len)
				{
					opts.end.call(this);
				}
			}
		});		
	}
})(jQuery);  