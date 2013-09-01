var socket = io.connect('/');

// listener, whenever the server emits 'chat:new', this updates the chat body
socket.on('commit:new', function (message) {
	alert('here');
	var msgHTML = '<li><b>'+message.username + ':</b><br> ' + message.msg + ' <span style="font-size: 85%;color: #AAA" class="buzz_msg_timestamp" data-timestamp="' + message.timestamp + '">' + prettyDate(message.timestamp) + '</span></li>'
	prependListItem('git_update_list', msgHTML);
});

