<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.Bookmark"%>
<%@ page import="com.code.savemarks.service.BookmarkService"%>
<%
	BookmarkService myBookmarkService = new BookmarkService();
	String user = (String) session.getAttribute("user");

	String category = (String) session.getAttribute("category");
	String hierarchy = (String) session.getAttribute("hierarchy");
	String tags = (String) session.getAttribute("tags");
	List<Bookmark> allBookmarks = myBookmarkService.getAllBookmarks(
			user, category, hierarchy, tags);
%>

<table id=filter>
	<tr>
		<td><b>Filter : </b><input name="filter"
			onkeyup="filter1(this, 'AllBookmarksTable','pagingall')" type="text">&nbsp;&nbsp;</td>
		<%
			if (!category.equals("ALL")) {
		%>
		<td>&nbsp;<b>Show Category : </b><a class="hierarchy"
			onclick="setCategory('ALL')">ALL</a>,&nbsp;<%=category%><%=" | " %>
		</td>
		<%
			}
		%> 
		<%
 		if (!tags.equals("ALL")) {
 		%>
		<td>&nbsp;<b>Show Tags : </b><a class="tags" onclick="setTags('ALL');">ALL</a>,&nbsp;<%=tags%><%=" | " %>
		</td>
		<%
			}
		%>
		<%
		if (!hierarchy.equals("ALL")) {
		%>
		<td>&nbsp;<b>Show Hierarchy : </b><a class="hierarchy" onclick="setHierarchy('ALL')">ALL<%=">>"%></a>,&nbsp;
		<% 
				String hierarchyList[] = hierarchy.split(",");
			    String path = "";
				for (int i = 0; i < hierarchyList.length; i++) {
					path = path + hierarchyList[i] + " ";
		%> 
			<a class='hierarchy' onclick="setHierarchy('<%=path.substring(0, path.length() - 1)%>')">
			<%if(i==hierarchyList.length-1){%>
				<%=hierarchyList[i]%> 
				<% }else{%>
				 <%=hierarchyList[i] + ">>"%>
				 <% }%>
			</a>&nbsp; 
		<%
	 		}
		%>
		<%=" | " %></td>
		<%} %>
	</tr>
</table>
<hr>
<table id='AllBookmarksTable' height=100% width=100%>
	<%
		for (Bookmark bookmark : allBookmarks) {
	%>
	<tr>
		<td>
			<div id="bookmark"><b><%=bookmark.getName()%></b><br>
			<a target='_blank' href=<%=bookmark.getUrls()%> onclick="updateBookmark('<%=bookmark.getId()%>','count');">
				<%=bookmark.getUrls()%>
			</a> 
		    <br>
		    <%
				String hierarchyList[] = bookmark.getHierarchy().split(",");
				String path = "";
				for (int i = 0; i < hierarchyList.length; i++) {
					path = path + hierarchyList[i] + ",";
			%> 
			<a class='hierarchy' onclick="setHierarchy('<%=path.substring(0, path.length() - 1)%>')">
			<%if(i==hierarchyList.length-1){%>
				<%=hierarchyList[i]%> 
				<% }else{%>
				 <%=hierarchyList[i] + ">>"%>
				 <% }%>
			</a>&nbsp; 
			<%
 				}
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
				   id="1play<%=bookmark.getId()%>"
				   onclick="getVideo('1playVideo<%=bookmark.getId()%>','1play<%=bookmark.getId()%>','<%=vid%>');" />&nbsp;
			<div id="1playVideo<%=bookmark.getId()%>"></div>
			
			<%
				}
			%>
			</td>
			<td align=right>
			<div align="right"> 
				<%
				    String tagList[] = bookmark.getTags().split(",");
					for (int i = 0; i < tagList.length; i++) {
			    %> 
			    <a class='tags' onclick="setTags('<%=tagList[i]%>')"> <%=tagList[i]%> </a>&nbsp; 
			    <% } %> 
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
	%>
</table>
<div id = 'pagingall' <%if(allBookmarks.size()<50) {%>
			style='visibility:hidden';"
		<%}%>>
<div id="controls">
	<table width="100%">
		<col width="25%" />
  		<col width="50%" />
  		<col width="25%" />
	<tr><td>
	<div id="perpage">
			<select onchange="sorter.size(this.value)">
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
			<img src="/../images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
			<img src="/../images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
			<img src="/../images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
			<img src="/../images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />		
		</div>
		</center>
		</td>
		<td>
			<div id="text">Displaying Page <span id="currentpageall"></span> of <span id="pagelimitall"></span></div>
		</td>
		</tr>
	</table>
	</div>
</div>
<script>
var sorter = new TINY.table.sorter("sorter");
sorter.asc = "asc";
sorter.desc = "desc";
sorter.paginate = true;
sorter.currentid = "currentpageall";
sorter.limitid = "pagelimitall";
sorter.init('AllBookmarksTable', 1);
</script>