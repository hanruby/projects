function addBookmarkPopUp(dialogtitle) {

	$("#AddBookmarkDialog").dialog({
		modal : true,
		position : 'center',
		draggable : true,
		title : dialogtitle,
		height : 360,
		width : 600,
		overlay : {
			opacity : 0.5,
			background : "black"
		},
		open : function(event, ui) {
			getCategoriesList();
			getHierarchyList();
			$('#urlName').focus();
		},
		buttons : {
			"Cancel" : function() {
				$(this).dialog("close");
				return false;
			},
			"OK" : function() {
				// document.addmark.submit();
				var url = $('#urlName').val();
				url = url.trim();
				var bookmarkName = $('#bookmarkName').val();
				if (url == 'undefined' || url == '') {

				} else {
					$(this).dialog("close");
					addBookmark();
					return false;
				}
			}
		}
	});
}

function getCategoriesList() {
	var url = "GetAutoCompleteList.jsp";

	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : 'type=category',
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			availableTags = resp.responseText;
			var splitted = availableTags.split(":");

			$("#categoryName").autocomplete({
				source : splitted
			});
		}
	});
}

function getHierarchyList() {
	var url = "GetAutoCompleteList.jsp";

	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : 'type=hierarchy',
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			availableTags = resp.responseText;
			var splitted = availableTags.split(":");

			$("#hierarchy").autocomplete({
				source : splitted
			});
		}
	});
}

function copyCategory() {
	var catVal = $("#categoryName").val();
	if (catVal != '' || catVal == 'null')
		document.getElementById("hierarchy").value = catVal + ',';
}

function AddOrUpdateBookmark(bookmarkId) {
	var url = "AddBookmark.jsp";
	if (bookmarkId == '')
		title = 'Add Bookmark';
	else
		title = 'Update Bookmark';
	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : 'BookmarkId=' + bookmarkId,
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('AddBookmarkDialog').innerHTML = resp.responseText;
					addBookmarkPopUp(title);
				}
			});
}

function AddFeed(name, feedurl, tags, category, hierarchy) {
	var url = "AddBookmark.jsp";
	title = 'Save Feed';
	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : 'name=' + encodeURIComponent(name) + '&feedurl='
						+ encodeURIComponent(feedurl) + '&tags=' + tags
						+ '&category=' + category + '&hierarchy=' + hierarchy,
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('AddBookmarkDialog').innerHTML = resp.responseText;
					addBookmarkPopUp(title);
				}
			});
}

function addBookmark() {
	var bookmarkName = $('#bookmarkName').val();
	bookmarkName = bookmarkName.replace(/"/g, '-');
	var url = $('#urlName').val();
	var tag = $('#tagsName').val();
	var category = $('#categoryName').val();
	var bookmarkId = $('#bookmarkId').val();
	var hierarchy = $('#hierarchy').val();

	var myJSONObject = {
		"Name" : encodeURIComponent(bookmarkName),
		"Url" : encodeURIComponent(url),
		"Tags" : tag,
		"Category" : category,
		"BookmarkId" : bookmarkId,
		"Hierarchy" : hierarchy
	}

	var url = "/AddBookmarkServlet";
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'POST',
		data : "boomarkData=" + JSON.stringify(myJSONObject),
		complete : function(resp) {
			// clearBusyStatus('saveGrid');

			var status = resp.responseText.trim();
			if (status == 'login') {
				signOut();
			} else {
				showMessage(resp.responseText);
				refreshTabs();
			}
		}
	});
	return false;
}

function refreshTabs() {
	var activeTab = document.getElementById('activetab').value;

	refreshCategories();
	if (activeTab == '#allBookmarks') {
		refreshAllBookmarksTab();
	}
	if (activeTab == '#mostlyViewed') {
		refreshMostlyViewedBookmarksTab();
	}
	if (activeTab == '#recentlyAdded') {
		refreshRecentlyAddedBookmarksTab();
	}
	if (activeTab == '#marked') {
		refreshMarkedBookmarksTab();
	}
	if (activeTab == '#feeds') {
		refreshFeeds();
	}

	if (activeTab != '#allBookmarks') {
		refreshAllBookmarksTab();
	}
	if (activeTab != '#mostlyViewed') {
		refreshMostlyViewedBookmarksTab();
	}
	if (activeTab != '#recentlyAdded') {
		refreshRecentlyAddedBookmarksTab();
	}
	if (activeTab != '#marked') {
		refreshMarkedBookmarksTab();
	}
	if (activeTab != '#feeds') {
		refreshFeeds();
	}
}

function refreshCategories() {
	var url = "Categories.jsp";

	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : '',
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('categories').innerHTML = resp.responseText;
				}
			});
}

function refreshAllBookmarksTab() {
	var url = "AllBookmarks.jsp";

	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : '',
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('allBookmarks').innerHTML = resp.responseText;
					pageInitAllBookmarks();
				}
			});
}

function refreshMostlyViewedBookmarksTab() {
	var url = "MostlyViewedBookmarks.jsp";

	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : '',
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('mostlyViewed').innerHTML = resp.responseText;
				}
			});
}

function refreshRecentlyAddedBookmarksTab() {
	var url = "RecentlyAddedBookmarks.jsp";

	// showBusyStatus(null,"Loading...");
	$
			.ajax({
				cache : false,
				url : url,
				type : 'GET',
				data : '',
				complete : function(resp) {
					// clearBusyStatus('saveGrid');
					document.getElementById('recentlyAdded').innerHTML = resp.responseText;
				}
			});
}

function refreshMarkedBookmarksTab() {
	var url = "MarkedBookmarks.jsp";

	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : '',
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			document.getElementById('marked').innerHTML = resp.responseText;
		}
	});
}

function refreshFeeds() {
	var url = "Feeds.jsp";
	document.getElementById('feedimg').style.visibility = 'visible';
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : '',
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			document.getElementById('feeds').innerHTML = resp.responseText;
			pageInitFeeds();
			document.getElementById('feedimg').style.visibility = 'hidden';
		}
	});
}
function signOut() {
	document.signout.submit();
}

function getWebsiteDetails() {
	var url = "/WebsiteDetailsServlet";
	var webUrl = $('#urlName').val();
	var img = '<img src="/../images/ajax-loader.gif"/>';
	document.getElementById('load').innerHTML = img;
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : 'url=' + encodeURIComponent(webUrl),
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			document.getElementById('load').innerHTML = '';

			var val = resp.responseText;
			var splitted = val.split("$");
			document.getElementById("bookmarkName").value = splitted[0].trim();
			// document.getElementById("tagsName").value = splitted[1];

			if (splitted[1] != ' ') {
				var tagArr = splitted[1].split(",");
				populateTagList(tagArr);
			} 
			if(splitted[1] == ' '){
				document.getElementById("TagList").innerHTML = '';
				document.getElementById("tagsName").value='';		
			}
			document.getElementById("categoryName").value = splitted[2].trim();
			document.getElementById("hierarchy").value='';
		}
	});
}
function populateTagList(tagArr) {
	var taglinks = '';
	for (i = 0; i < tagArr.length; i++) {
		taglinks = taglinks + '<a href=# onclick=copyTag(' + i + ',"' + tagArr
				+ '")>' + tagArr[i] + '<a>,';
	}
	document.getElementById("TagList").style.display = '';
	document.getElementById("TagList").innerHTML = taglinks;
}

function copyTag(i, tagArray) {
	var tagArr = tagArray.split(",");
	var tag = tagArr[i];
	var tags = document.getElementById("tagsName").value;
	if (tags == '' || tags == 'undefined') {
		document.getElementById("tagsName").value = tag
	} else {
		document.getElementById("tagsName").value = document
				.getElementById("tagsName").value
				+ ',' + tag;
	}
	tagArr.splice(i, 1);
	populateTagList(tagArr);
}

function deleteBookmark(bookmarkId) {
	// showBusyStatus(null,"Loading...");
	var url = "/DeleteBookmarkServlet";
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : "boomarkId=" + bookmarkId,
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			var status = resp.responseText.trim();
			if (status == 'login') {
				signOut();
			} else {
				showMessage(resp.responseText);
				refreshTabs();
			}
		}
	});
	return false;
}

function updateBookmark(bookmarkId, update) {
	// showBusyStatus(null,"Loading...");
	var url = "/UpdateBookmarkServlet";
	pars = "boomarkId=" + bookmarkId + "&update=" + update;
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : pars,
		complete : function(resp) {
			// clearBusyStatus('saveGrid');

			var status = resp.responseText.trim();
			if (status == 'login') {
				signOut();
			} else {
				if (update != "count") {
					refreshTabs();
				}
			}
		}
	});
	return false;
}

function getVideo(divId, buttonId, vid) {
	var url = "Video.jsp";
	if (document.getElementById(buttonId).value == "stop") {
		document.getElementById(buttonId).value = "play";
		document.getElementById(divId).innerHTML = "";
		return;
	}
	// showBusyStatus(null,"Loading...");
	$.ajax({
		cache : false,
		url : url,
		type : 'GET',
		data : "vid=" + vid,
		complete : function(resp) {
			// clearBusyStatus('saveGrid');
			document.getElementById(buttonId).value = "stop";
			document.getElementById(divId).innerHTML = resp.responseText;
		}
	});
}

function showMessage(message) {
	var status = message.split('-');
	document.getElementById('ShowUpdate').innerHTML = status[1];
	if (status[0] != 'success') {
		$('ShowUpdate').addClass('error');
	}
	document.getElementById('ShowUpdate').style.visibility = 'visible';
	var t = setTimeout(
			"document.getElementById('ShowUpdate').style.visibility='hidden'",
			3000);
	$('ShowUpdate').removeClass('error');
}

function pageInitAllBookmarks() {
	var val = $('#AllBookmarksTable tr').length;
	val = val / 2;
	sorter.setlength(val);
}

function pageInitFeeds() {

	var val = $('#FeedsTable tr').length;
	val = val / 3;
	if (val >= 50) {
		document.getElementById('pagingfeeds').style.visibility = 'visible';
	}
	sorter2.setlength(val);
}