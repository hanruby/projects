<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.StreamInfo"%>
<%@ page import="com.code.savemarks.service.FeedService"%>
<%
	FeedService myFeedService = new FeedService();
	String user = (String) session.getAttribute("user");
	
	String category = (String) session.getAttribute("category");
	String hierarchy = (String) session.getAttribute("hierarchy");
	String tags = (String) session.getAttribute("tags");
	String feedTitle = (String) session.getAttribute("feedtitle");
	List<StreamInfo> allFeeds = myFeedService.getAllFeeds(user, category, hierarchy, 
			tags, feedTitle);
%>
<%if(allFeeds.size()==0) {%>
	<table>
	<tr><td> 
		<center><p>No Feeds available.&nbsp;Add feeds&nbsp;
				   <a href='#' onClick="AddOrUpdateBookmark('');">AddFeeds</a>
					</p>
		</center>
	</td></tr></table>
<%} %>
<table id=filter>
	<tr>
		<td><b>Filter : </b><input name="filter"
			onkeyup="filter1(this, 'FeedsTable','pagingfeeds')" type="text">&nbsp;&nbsp;</td>
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
			if (!feedTitle.equals("ALL")) {
		%>
		<td>&nbsp;<b>Show FeedTitle : </b><a class="hierarchy"
			onclick="setFeedTitle('ALL')">ALL</a>,&nbsp;<%=feedTitle%><%=" | " %>
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
		<td align=right><img id='feedimg' src="/../images/ajax-loader1.gif" style='visibility:hidden;'> </td>
	</tr>
</table>
<hr>
<table id = 'FeedsTable' height=100% width=100%>

	<%
		for (StreamInfo feed : allFeeds) {
	%>
	<tr>
		<td>
		<div id="bookmark">
		<table width=100%>
			<tr><td width="55%">
			<a target='_blank' href=<%=feed.getUrl()%>> <%=feed.getTitle()%> </a>
			</td>
			<td width="25%" align=right>
			 	<%=feed.getPublishedDate()%>
			</td>
			<td width="20%" align=right>
			 	<a class="hierarchy" onclick=setFeedTitle('<%=feed.getFeedTitle()%>')><%=feed.getFeedTitle()%></a>
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
			   <%
				String hierarchyList[] = feed.getHierarchy().split(",");
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
 			%> 
			   </td>
			   <td width=25% align=right>
			    <a class="tags" onclick=setTags('<%=feed.getTags()%>')><%=feed.getTags()%></a>
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
<div id = 'pagingfeeds' 
		<%if(allFeeds.size()<50) {%>
			style='visibility:hidden';"
		<%}%> >
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
						<img src="/../images/first.gif" width="16" height="16" alt="First Page" onclick="sorter2.move(-1,true)" />
						<img src="/../images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter2.move(-1)" />
						<img src="/../images/next.gif" width="16" height="16" alt="First Page" onclick="sorter2.move(1)" />
						<img src="/../images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter2.move(1,true)" />		
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