(function($) {
	//Global Vars
	var jHTML = $('html');
	var jBody = $('body');
	
	
	function scrollToggle(setting){
		var s = jHTML.scrollTop();
		jHTML.css('overflow', setting);
		if (setting === "hidden") {
			jBody.css('overflow-y', 'scroll');
		}
		else {
			jBody.css('overflow-y', 'auto');
		}
		jHTML.scrollTop(s);
	}
	
	function gallery(gallerycontainer) {
		

		$('a', $(gallerycontainer)).click(function(e) {
			e.preventDefault();
			var image_href = $(this).attr('href');
			jBody.prepend('<div id="Zoomer"></div>');
			var zoomer = $('#Zoomer');
			scrollToggle('hidden');
			zoomer.html('<img src="' + image_href + '" />').fadeIn(700);
			
			function backToLife() {
				zoomer.fadeOut(700, function(){
					$(this)
						.empty();
					scrollToggle('auto');
				});
			}
		
			zoomer.live('click', function() {
				backToLife();
			});
				
			$(document).keydown(function() {
				backToLife();
			});
			
		});
		
		}
	
	$(window).load(function() {
		gallery($('#Screenshots'));
	});
})(jQuery);