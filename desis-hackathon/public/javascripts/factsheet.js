$(document).ready(function() {
	$('.carousel').carousel({
  		interval: 5000,
  		pause: 'hover'
	});

	$('.carousel .item').first().addClass('active');
});

var socket = io.connect('/');

socket.on('view:load', function(url) {
	if ($("#user_name").html() == "projector")
		window.location = url;
});