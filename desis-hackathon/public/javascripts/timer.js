var socket = io.connect('/');

socket.on('view:load', function(url) {
	if ($("#user_name").html() == "projector")
		window.location = url;
});