(function () {
	var el_Html;
	var el_Body;

	onLoad = () => {
		el_Html = document.querySelector('html');
		el_Body = document.querySelector('body');

		var el_Gallery = document.querySelector('#screenshots');
		el_Gallery && gallery(el_Gallery);
	}

	function scrollToggle(setting) {
		var s = el_Html.scrollTop;
		el_Html.style.overflow = setting;
		el_Body.style.overflowY = setting === "hidden" ? 'scroll' : 'auto';
		el_Html.scrollTop = s;
	}

	function gallery(el_Gallery) {

		var el_Zoomer = document.createElement('div');
		el_Zoomer.id = 'Zoomer';
		el_Body.appendChild(el_Zoomer);

		el_Gallery.querySelector('a').addEventListener('click', function (e) {
			e.preventDefault();
			var image_href = this.href;

			scrollToggle('hidden');
			el_Zoomer.innerHTML = '<img src="' + image_href + '" />';

			el_Zoomer.style.opacity = 0;
			el_Zoomer.style.transition = '0.7s all';
			el_Zoomer.style.display = 'block';

			window.setTimeout(function () {
				el_Zoomer.style.opacity = 1;
			}, 10)

		});

		function closeImage() {

			el_Zoomer.style.transition = '0.1s all';
			el_Zoomer.style.opacity = 0;

			window.setTimeout(function () {
				el_Zoomer.style.display = '';
				el_Zoomer.innerHTML = '';
				scrollToggle('auto');
			})

		}

		el_Zoomer.addEventListener('click', closeImage)
		document.addEventListener('keydown', closeImage)

	}

	window.onload = onLoad;

})();
