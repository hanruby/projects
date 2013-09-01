function filter1(phrase, _id, pagingid) {
	
	var words = phrase.value.toLowerCase().split(" ");
	var table = document.getElementById(_id);
	if (phrase.value.length > 0) {
		document.getElementById(pagingid).style.visibility = 'hidden';
	} else {
		document.getElementById(pagingid).style.visibility = 'visible';
	}
	var ele;
	for ( var r = 0; r < table.rows.length; r++) {
		ele = table.rows[r].innerHTML.replace(/<[^>]+>/g, "");
		var displayStyle = 'none';
		for ( var i = 0; i < words.length; i++) {
			if (ele.toLowerCase().indexOf(words[i]) >= 0)
				displayStyle = '';
			else {
				displayStyle = 'none';
				break;
			}
		}
		table.rows[r].style.display = displayStyle;
	}
}

function filter(phrase, _id) {
	var words = phrase.value.toLowerCase().split(" ");
	var table = document.getElementById(_id);
	var ele;
	for ( var r = 0; r < table.rows.length; r++) {
		ele = table.rows[r].innerHTML.replace(/<[^>]+>/g, "");
		var displayStyle = 'none';
		for ( var i = 0; i < words.length; i++) {
			if (ele.toLowerCase().indexOf(words[i]) >= 0)
				displayStyle = '';
			else {
				displayStyle = 'none';
				break;
			}
		}
		table.rows[r].style.display = displayStyle;
	}
}

function fbs_click(title, url) {
	window.open('http://www.facebook.com/sharer.php?u='
			+ encodeURIComponent(url) + '&t=' + encodeURIComponent(title),
			'sharer', 'toolbar=0,status=0,width=626,height=436');
	return false;
}

function getEmailDiv(bookmarkId) {
	var url = "SendMail.jsp";
	var title = 'Send Email';

	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : 'BookmarkId=' + bookmarkId,
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('sendMailDialog').innerHTML = resp.responseText;
					sendMailPopUp(title);
				}
			});
}

function sendMailPopUp(dialogtitle) {

	$("#sendMailDialog").dialog({
		modal : true,
		position : 'center',
		draggable : true,
		title : dialogtitle,
		overlay : {
			opacity : 0.5,
			background : "black"
		},
		open : function(event, ui) {
		},
		buttons : {
			"Cancel" : function() {
				$(this).dialog("close");
				return false;
			},
			"Send" : function() {
				// document.addmark.submit();
				$(this).dialog("close");
				// runStoredProc(procName, param, displayName);
				sendMail();
				return false;
			}
		}
	});
}

function sendMail() {
	var to = $('#to').val();
	var subject = $('#subject').val();
	var message = $('#message').val();

	var myJSONObject = {
		"to" : to,
		"subject" : encodeURIComponent(subject),
		"message" : encodeURIComponent(message)
	}

	var url = "/SendMailServlet";
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'POST',
		data : "messageData=" + JSON.stringify(myJSONObject),
		complete : function(resp) {
			// clearBusyStatus('saveGrid');

			var status = resp.responseText;

		}
	});
	return false;
}

