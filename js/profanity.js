(function($) {
	//Global Vars
	
	function scrollToggle(setting){
		var b = $('html');
		var s = b.scrollTop();
		b.css('overflow', setting);
		b.scrollTop(s);
	}
	
	function backToLife() {
		$('#Zoomer').fadeOut(700, function(){
			$(this).empty();
		});
		scrollToggle('auto');
	}
	
	function gallery(gallerycontainer) {
		$('a', $(gallerycontainer)).click(function(e) {
			e.preventDefault();
			var image_href = $(this).attr('href');
			$('body').prepend('<div id="Zoomer"></div>');
			scrollToggle('hidden');
			$('#Zoomer').html('<img src="' + image_href + '" />').fadeIn(700);
		});
		
			$('#Zoomer').live('click', function() {
				backToLife();
			});
				
			$(document).keydown(function() {
				backToLife();
			});
		
		}

	
	$(window).load(function() {
		gallery($('#Screenshots'));
	});
})(jQuery);