<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.Bookmark"%>
<%@ page import="com.code.savemarks.service.BookmarkService"%>
<%
	BookmarkService myBookmarkService = new BookmarkService();
	String user = "t.bhags21@gmail.com";
	String bookmarkId = request.getParameter("BookmarkId");
	bookmarkId = bookmarkId==null?"":bookmarkId;
	String name = request.getParameter("name");
	String url = request.getParameter("feedurl");
	String tags = request.getParameter("tags");
	String category = request.getParameter("category");
	String hierarchy = request.getParameter("hierarchy");
	
	if (!bookmarkId.equals("")) {
		Bookmark bookmark = myBookmarkService.getBookmark(bookmarkId);
%>
<input type=hidden id=bookmarkId value='<%=bookmark.getId()%>'>
<table>
	<tr>
		<td><label for="name">Name : </label></td>
		<td><input type="text" name="bookmarkName" id="bookmarkName"
			value='<%=bookmark.getName()%>'
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Url : </label></td>
		<td><input type="text" name="urlName" id="urlName"
			value='<%=bookmark.getUrls()%>'
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Tags : </label></td>
		<td><input type="text" name="tagsName" id="tagsName"
			value='<%=bookmark.getTags()%>' 
			title="Enter tags with comma seperated.."
			class="text ui-widget-content
		ui-corner-all"/></td>
	</tr>
	<tr>
		<td><label for="name">Category : </label></td>
		<td><input type="text" name="categoryName" id="categoryName"
			value='<%=bookmark.getCategory()%>'
			title="Enter category.If new category is added a menu will be created on left side"
			class="text ui-widget-content ui-corner-all" /></td>
			
	</tr>
	<tr>
		<td><label for="name">Hierarchy : </label></td>
		<td><input type="text" name="hierarchy" id="hierarchy" onfocus="copyCategory()"
			value='<%=bookmark.getHierarchy()%>'
			title="Enter hierarchy with comma seperated.It is like folder structure."
			class="text ui-widget-content ui-corner-all" /></td>
			
	</tr>
</table>
<%}else if(name!=null && !name.equals("")){%>
<table>
	<tr>
		<td><label for="name">Name : </label></td>
		<td><input type="text" name="bookmarkName" id="bookmarkName"
			value='<%=name%>'
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Url : </label></td>
		<td><input type="text" name="urlName" id="urlName"
			value='<%=url%>'
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Tags : </label></td>
		<td><input type="text" name="tagsName" id="tagsName"
		           title="Enter tags with comma seperated."
			value='<%=tags%>' class="text ui-widget-content
		ui-corner-all"/></td>
	</tr>
	<tr>
		<td><label for="name">Category : </label></td>
		<td><input type="text" name="categoryName" id="categoryName"
			value='<%=category%>'
			title="Enter category. If new category is added a menu will be created on left side."
			class="text ui-widget-content ui-corner-all" /></td>
			
	</tr>
	<tr>
		<td><label for="name">Hierarchy : </label></td>
		<td><input type="text" name="hierarchy" id="hierarchy" onfocus="copyCategory()"
			title="Enter hierarchy with comma seperated. It is like folder structure."
			value='<%=hierarchy%>'
			class="text ui-widget-content ui-corner-all" /></td>
			
	</tr>
</table>
<%}else{ %>
<input type=hidden id=bookmarkId value=''>
<table table="AddBookmarkTable">
	<col width="25%" />
  	<col width="75" />
	<tr>
		<td><label for="name">Name : </label></td>
		<td><input type="text" name="bookmarkName" id="bookmarkName"
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Url : </label><div id="load" style="float: right"></div></td>
		<td><input type="text" name="urlName" id="urlName"
			class="text ui-widget-content ui-corner-all" onchange="getWebsiteDetails();"/>
			
			    
		</td>
	</tr>
	<tr>
		<td><label for="name">Tags : </label></td>
		<td><input type="text" name="tagsName" id="tagsName"
		           title="Enter tags with comma seperated."
			class="text ui-widget-content ui-corner-all" />
			<div id="TagList"></div>
		</td>
	</tr>
	<tr>
		<td><label for="name">Category : </label></td>
		<td><input type="text" name="categoryName" id="categoryName"
		           title="Enter category. If new category is added a menu will be created on left side."
			       class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Hierarchy : </label></td>
		<td><input type="text" name="hierarchy" id="hierarchy"
		           title="Enter hierarchy with comma seperated.It is like folder structure." 
		           onfocus="copyCategory()"
			class="text ui-widget-content ui-corner-all" /></td>
			
	</tr>
</table>
<%}%>