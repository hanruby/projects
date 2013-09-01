<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Savemarks</title>
		<meta name="title" content="Savemarks">
		<meta name="description" content="Savemarks is a place to store your online bookmarks,get feeds from your favourite sites....">
		<meta name="keywords" content="bookmark,rssreader,feeds">
		<link href="${pageContext.request.contextPath}/css/savemarks.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bookmarkstab.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/jquery.css" rel="stylesheet" type="text/css">
		
		<link rel="icon" href="/../images/favicon.ico"/>
    	
	</head>
	<body>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.2.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagingscript.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bookmarks.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bookmarktab.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/categorybookmark.js"></script>
		<script>
			$(document).ready(function() {
				//When page loads...
				$(".tab_content").hide(); //Hide all content
				$("ul.tabs li:first").addClass("active").show(); //Activate first tab
				$(".tab_content:first").show(); //Show first tab content
		
				//On Click Event
				$("ul.tabs li").click(function() {
		
					$("ul.tabs li").removeClass("active"); //Remove any "active" class
					$(this).addClass("active"); //Add "active" class to selected tab
					$(".tab_content").hide(); //Hide all tab content
					
					var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
					document.getElementById('activetab').value=activeTab;
					if(activeTab == '#feeds'){
						refreshFeeds();
					}
					$(activeTab).fadeIn(); //Fade in the active ID content
					return false;
				});
			});
		</script>
		<input type=hidden id=activetab value="#allBookmarks">
		<table height=100% width=100%>
		<tr height=10%>
			<td colspan=2><jsp:include page="/Header.jsp" /></td>
		</tr>
		<tr height=80%>
		<td width=16% valign="top">
			<div id="categories"><jsp:include page="/Categories.jsp" /></div>
		</td>
		<td width=84% valign=top>

			<center>
				<div id=addBookmarkDiv><input class="button white" type=button onclick="AddOrUpdateBookmark('');" value="ADD NEW BOOKMARK">
				</div>
				<div id="ShowUpdate">Bookmark Added.</div>
			</center>
			<div id="AddBookmarkDialog" title="Add new Bookmark"
					style="visible: hidden; display: none">	
			</div>
			<div id="sendMailDialog" title="Send Mail"
					style="visible: hidden; display: none">
			</div>
		<div class="tab">
			<ul class="tabs">
				<li><a href="#allBookmarks">All</a></li>
				<li><a href="#mostlyViewed">Most Viewed</a></li>
				<li><a href="#recentlyAdded">Most Recent</a></li>
				<li><a href="#marked">Marked</a></li>
				<li><a href="#feeds">Feeds</a></li>
			</ul>

			<div class="tab_container">
			<div id="allBookmarks" class="tab_content">
				<jsp:include page="/AllBookmarks.jsp" />
			</div>
			<div id="mostlyViewed" class="tab_content">
				<jsp:include page="/MostlyViewedBookmarks.jsp" />
			</div>
			<div id="recentlyAdded" class="tab_content">
				<jsp:include page="/RecentlyAddedBookmarks.jsp" />
			</div>
			<div id="marked" class="tab_content">
				<jsp:include page="/MarkedBookmarks.jsp" />
			</div>
			<div id="feeds" class="tab_content" style="height=100%;">
				<center><img id="load-img" src="/../images/ajax-loader1.gif"/></center>
				<table id = 'FeedsTable' height=100% width=100%>
				<tr>
				<td>
				<img id='feedimg' src="/../images/ajax-loader1.gif" style='visibility:hidden;display:none'></td></tr></table>
				<div id = 'pagingfeeds' style="visibility:hidden;">
			<div id="controls">
				<table width="100%">
					<col width="25%" />
			  		<col width="50%" />
			  		<col width="25%" />
				<tr><td>
				<div id="perpage">
						<select onchange="sorter2.size(this.value)">
						<option value="5" selected="selected">5</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="50">50</option>
							<option value="100">100</option>
							<option value="1000">100</option>
							<option value="10000">100</option>
						</select>
						<span>Entries Per Page</span>
					</div>
					</td>
					<td><center>
					<div id="navigation">
						<img src="/../images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
						<img src="/../images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
						<img src="/../images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
						<img src="/../images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />		
							</div>
							</center>
							</td>
							<td>
								<div id="text">Displaying Page <span id="currentpagefeeds"></span> of <span id="pagelimitfeeds"></span></div>
							</td>
							</tr>
						</table>
						</div>
						</div>
						<script>
						var sorter2 = new TINY.table.sorter("sorter2");
						sorter2.asc = "asc";
						sorter2.desc = "desc";
						sorter2.paginate = true;
						sorter2.currentid = "currentpagefeeds";
						sorter2.limitid = "pagelimitfeeds";
						sorter2.init('FeedsTable', 1);
						</script>
						</div>
					</div>
				</div>
		</td>
	</tr>
	<tr height=10%>
		<td colspan=2><jsp:include page="/Footer.jsp" /></td>
	</tr>
</table>
</body>
</html>
