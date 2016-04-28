$(document).ready(function(){
	$(".classification-selector").click(function(){
		var classification = ["red","white","rosé", "dessert"];
		var selected = this.id.replace("-classification", "")
		for (i = 0; i < classification.length; i++){
			$("." + classification[i] +"-colored").hide();
		}
		$("." + selected +"-colored").show();
	});


	function heightsEqualizer(selector) {
		var elements = document.querySelectorAll(selector),
		max_height = 0,
		len = 0,
		i;

		if ( (elements) && (elements.length > 0) ) {
			len = elements.length;
		  for (i = 0; i < len; i++) { // get max height
				elements[i].style.height = ''; // reset height attr
				if (elements[i].clientHeight > max_height) {
					max_height = elements[i].clientHeight;
				}
			}

		  for (i = 0; i < len; i++) { // set max height to all elements
		  	elements[i].style.height = max_height + 'px';
		  }
		}
	}

	if (document.addEventListener) {
		document.addEventListener('DOMContentLoaded', function() {
			heightsEqualizer('.js-equal-height');
		});
		window.addEventListener('resize', function(){
			heightsEqualizer('.js-equal-height');
		});
	}

	setTimeout(function () { // set 1 second timeout for having all fonts loaded
		heightsEqualizer('.js-equal-height');
	}, 1000);
});