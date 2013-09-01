var socket = io.connect('/');

// listener, whenever the server emits 'chat:new', this updates the chat body
socket.on('chat:new', function (message) {
	var msgHTML = '<li><b>'+message.username + ':</b> ' + message.msg + ' <span style="font-size: 85%;color: #AAA" class="buzz_msg_timestamp" data-timestamp="' + message.timestamp + '">' + prettyDate(message.timestamp) + '</span></li>'
	prependListItem('buzz_update_list', msgHTML);
});

// listener, whenever the server emits 'chat:init', this updates the chat body with existing chat conversations
socket.on('chat:init', function (chatMessages) {
	$("#buzz_update_list").html("");
	for (var i=0; i < chatMessages.length; i++){
		var message = chatMessages[i];
		var msgHTML = '<li><b>'+message.username + ':</b> ' + message.msg + ' <span style="font-size: 85%;color: #AAA" class="buzz_msg_timestamp" data-timestamp="' + message.timestamp + '">' + prettyDate(message.timestamp) + '</span></li>'
		appendListItem('buzz_update_list', msgHTML);
	}
});

// Show alerts on new announcements
socket.on('ann:message', function(ann) {
	$.gritter.add({
		title: 'Alert!',
		text: "New message from admin! View <a href='/showPost/" + ann._id +"'>here</a>"
	});
});

socket.on('ann:album', function(ann) {
	$.gritter.add({
		title: 'Alert!',
		text: "New album posted! View <a href='/showPost/" + ann._id +"'>here</a>"
	});
});

socket.on('view:load', function(url) {
	if ($("#user_name").html() == "projector")
		window.location = url;
});

// on load of page
$(document).ready(function(){
	// when the client clicks SEND
	$('#buzz_send').click( function() {
		var message = $('#buzz_msg').val();
		message = removeTags(message);

		if (message.length > 0 && message.length <= 140) {
			$('#buzz_msg').val('');
			$('#buzz_msg_ct').html('140');
			$('#buzz_msg_ct').css('color', 'black');
			
			// tell server to execute 'chat:new' and send along one parameter			
			socket.emit('chat:new', message);
		}
	});

	// when the client hits ENTER on their keyboard
	$('#buzz_msg').keypress(function(e) {
		if(e.which == 13) {
			$(this).blur();
			$('#buzz_send').focus().click();
		}
	});

	$("#buzz_update_list").html("<center><img src='/images/loading.gif'/></center>");

	setInterval(updateBuzzMessageTimestamp, 1000);
});

function updateBuzzMessageTimestamp() {
	$(".buzz_msg_timestamp").each(function(index) {
		$(this).html(prettyDate($(this).data("timestamp")));
	});
}

function updateBuzzMessageCount() {
	var message = $('#buzz_msg').val();
	var ct = 140 - message.length;
	$('#buzz_msg_ct').html(ct);
	if (ct < 10) {
		$('#buzz_msg_ct').css('color', 'red');
	} else {
		$('#buzz_msg_ct').css('color', 'black');
	}
}
