<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.Bookmark"%>
<%@ page import="com.code.savemarks.service.BookmarkService"%>
<%@ page import="com.code.savemarks.model.StreamInfo"%>
<%@ page import="com.code.savemarks.service.FeedService"%>
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
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bookmarks.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagingscript.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bookmarktab.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/categorybookmark.js"></script>

		<jsp:include page="/Header.jsp" />
		<div id="AddBookmarkDialog" title="Add new Bookmark"
					style="visible: hidden; display: none">	
			</div>
		<div id="search-div">
		    <% String user = (String) session.getAttribute("user"); 
		    	String word = request.getParameter("b");
		    	BookmarkService myBookmarkService = new BookmarkService();
		    	List<Bookmark> bookmarks = myBookmarkService.searchBookmarks(user, word);
		    	FeedService myFeedService = new FeedService();
		    	List<StreamInfo> feeds = myFeedService.searchFeeds(user, word);
		    %>
		    <%if(feeds.size()==0 && bookmarks.size()==0) {%>
		    <table style="margin-left:15%">
			<tr><td> <center><p>No result found for <%="'"+word+"'"%>.Go to homepage :
					<a href='/savemarks'>Savemarks</a>
					</p></center>
	</td></tr></table>
	<% }else{%>
		    <table style="margin-left:15%">
			<tr>
				<td>Filter : 
					<input name="filter" onkeyup="filter1(this, 'SearchBookmarksTable','searchpaging')" type="text"> &nbsp;
					<a href='/savemarks'>Home Page</a>
				</td>
				<td>&nbsp;&nbsp;Search results for '<%="" + word %>'
				</td>
			</tr>
			</table>
			<br>
			<table id='SearchBookmarksTable'>

	<%
		for (Bookmark bookmark : bookmarks) {
	%>
	<tr>
		<td style="padding-left:7px;">
			<div id="bookmark"><b><%=bookmark.getName()%></b><br>
			<a target='_blank' href=<%=bookmark.getUrls()%> onclick="updateBookmark('<%=bookmark.getId()%>','count');">
				<%=bookmark.getUrls()%>
			</a> 
		    <br>
		    <%=
				bookmark.getHierarchy()
 			%> <br>
 			<table width=100%><tr><td>
			<input type="button" class="utilButton" value="Delete" onclick="deleteBookmark('<%=bookmark.getId()%>');" />&nbsp; 
			<input type="button" class="utilButton" 
				<%if (bookmark.getMark()) {%>
					value="Unmark" <%} 
				else {%> value="Mark" 
				<%}%>
				onclick="updateBookmark('<%=bookmark.getId()%>','mark');" />&nbsp; 
			<input type="button" class="utilButton" value="Edit"
				onclick="AddOrUpdateBookmark('<%=bookmark.getId()%>')" />&nbsp;&nbsp; 
			Share : 
			<a class="small_link" style="color: #FFFFFF; font-weight: bold" target="_blank"
			   onclick="return fbs_click('<%=bookmark.getName()%>','<%=bookmark.getUrls()%>');"
			   href="http://www.facebook.com/share.php?u=<%=bookmark.getUrls()%>">
			<img height="18px" align="absmiddle" alt="Facebook" src="images/facebook_16-16.png"></a> 
			<a title="Click to share this post on Twitter"
			   href="http://twitter.com/home?status=<%=bookmark.getName() + " : " + bookmark.getUrls()%>"
			   target="_blank"><img border="0" align="absmiddle" alt="Twitter"
			   src="images/twitter.jpg"></a>  
		    <%
 			if (bookmark.getUrls().contains("youtube")) {
 				String remUrl = bookmark.getUrls().substring(
 					            bookmark.getUrls().indexOf("v=") + 2);
 			    int x = remUrl.indexOf("&");
 				String vid = x == -1 ? remUrl : remUrl.substring(0, x);
 			%> 
 			<input type="button" class="utilButton" value="play"
				   id="5play<%=bookmark.getId()%>"
				   onclick="getVideo('5playVideo<%=bookmark.getId()%>','5play<%=bookmark.getId()%>','<%=vid%>');" />&nbsp;
			<div id="5playVideo<%=bookmark.getId()%>"></div>
			
			<%
				}
			%>
			</td>
			<td align=right>
			<div align="right"> 
				<%=bookmark.getTags()%>
		    </div>
		    </td>
		    </tr>
		    </table>
			<hr>
		</div>
		</td>
	</tr>
	<%
		}
	 	for (StreamInfo feed : feeds) {%>

	<tr>
		<td style="padding-left:7px;">
		<div id="bookmark">
		<table width=100%>
			<tr><td width="55%">
			<a target='_blank' href=<%=feed.getUrl()%>> <%=feed.getTitle()%> </a>
			</td>
			<td width="25%" align=right>
			 	<%=feed.getPublishedDate()%>
			</td>
			<td width="20%" align=right>
			 	<%=feed.getFeedTitle()%>
			</td>
		</tr> 
		</table>
		<img src=<%=feed.getImageUrl()%> width=25 valign=middle />&nbsp;<%=feed.getDescription()%><br>
		<table width=100%><tr><td width=30%>
		<input type="button" class="utilButton" value="save" onclick="AddFeed('<%=feed.getTitle()%>','<%=feed.getUrl()%>','<%=feed.getTags()%>','<%=feed.getCategory()%>','<%=feed.getHierarchy()%>')" />&nbsp; 
		Share : 
			<a class="small_link" style="color: #FFFFFF; font-weight: bold" target="_blank"
			   onclick="return fbs_click('<%=feed.getTitle()%>','<%=feed.getUrl()%>');"
			   href="http://www.facebook.com/share.php?u=<%=feed.getUrl()%>">
			<img height="18px" align="absmiddle" alt="Facebook" src="images/facebook_16-16.png"></a> 
			<a title="Click to share this post on Twitter"
			   href="http://twitter.com/home?status=<%=feed.getTitle() + " : " + feed.getUrl()%>"
			   target="_blank"><img border="0" align="absmiddle" alt="Twitter"
			   src="images/twitter.jpg"></a>
			   </td>
			   <td width=40%>
			   <%=
				feed.getHierarchy()%>
			   </td>
			   <td width=25% align=right>
			    <%=feed.getTags()%>
			   </td>
			   </tr>
			   </table>
		<hr>
		</div>
		</td>
	</tr>
	<%
		}
	%>
</table>
<%} %>
<div id = 'searchpaging'
			 <%if((feeds.size()+bookmarks.size())<50) {%>
			style='visibility:hidden';"
		<%}else{%>
			style='margin-left:15%;'
		<%} %>
		 >
<div id="controls">
	<table width="100%">
		<col width="25%" />
  		<col width="50%" />
  		<col width="25%" />
	<tr><td>
	<div id="perpage">
			<select onchange="sorter1.size(this.value)">
			<option value="5">5</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50" selected="selected">50</option>
				<option value="100">100</option>
				<option value="1000">1000</option>
				<option value="10000">10000</option>
			</select>
			<span>Entries Per Page</span>
		</div>
		</td>
		<td><center>
		<div id="navigation">
			<img src="/../images/first.gif" width="16" height="16" alt="First Page" onclick="sorter1.move(-1,true)" />
			<img src="/../images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter1.move(-1)" />
			<img src="/../images/next.gif" width="16" height="16" alt="First Page" onclick="sorter1.move(1)" />
			<img src="/../images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter1.move(1,true)" />		
		</div>
		</center>
		</td>
		<td>
			<div id="text">Displaying Page <span id="currentpagesearch"></span> of <span id="pagelimitsearch"></span></div>
		</td>
		</tr>
	</table>
</div>
</div>
<script>
var sorter1 = new TINY.table.sorter("sorter1");
sorter1.asc = "asc";
sorter1.desc = "desc";
sorter1.paginate = true;
sorter1.currentid = "currentpagesearch";
sorter1.limitid = "pagelimitsearch";
sorter1.init('SearchBookmarksTable', 1);
</script>
</div>
	<jsp:include page="/Footer.jsp" />
</div>
	</body>
</html>