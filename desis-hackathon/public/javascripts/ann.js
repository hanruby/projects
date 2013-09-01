$(document).ready(function() {
	try {
		$('.carousel').carousel({
	  		interval: 5000,
	  		pause: 'hover'
		});

		$('.carousel .item').first().addClass('active');
	} catch(e) {}
});

