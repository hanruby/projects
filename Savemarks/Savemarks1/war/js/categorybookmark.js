function setCategory(category) {
	var url = "/CategoryBookmarkServlet";
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : "category=" + category + "&type=category",
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			var status = resp.responseText;
			refreshCategories();
			refreshTabs();
		}
	});
}

function setTags(tags) {
	var url = "/CategoryBookmarkServlet";
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : "tags=" + tags + "&type=tags",
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			var status = resp.responseText;
			refreshTabs();
		}
	});
}

function setHierarchy(hierarchy) {
	var url = "/CategoryBookmarkServlet";

	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : "hierarchy=" + hierarchy + "&type=hierarchy",
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			var status = resp.responseText;
			
			refreshTabs();
		}
	});
}


function setFeedTitle(feedtitle) {
	var url = "/CategoryBookmarkServlet";

	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : "feedtitle=" + encodeURIComponent(feedtitle) + "&type=feedtitle",
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			var status = resp.responseText;
			refreshFeeds();
		}
	});
}