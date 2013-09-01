var socket = io.connect('/');

function updateAnnMessageCount() {
	var message = $('#ann_msg').val();
	var ct = 400 - message.length;
	$('#ann_msg_ct').html(ct);
	if (ct < 10) {
		$('#ann_msg_ct').css('color', 'red');
	} else {
		$('#ann_msg_ct').css('color', 'black');
	}
}

function loadView(url) {
	socket.emit('view:load', url);
}