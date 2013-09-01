<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.Bookmark"%>
<%@ page import="com.code.savemarks.service.BookmarkService"%>
<%
	BookmarkService myBookmarkService = new BookmarkService();
	String user = "t.bhags21@gmail.com";
	String bookmarkId = request.getParameter("BookmarkId");
    System.out.println(bookmarkId);
	if (!bookmarkId.equals("")) {
		Bookmark bookmark = myBookmarkService.getBookmark(bookmarkId);
%>
<input type=hidden id=bookmarkId value='<%=bookmark.getId()%>'>
<table>
<tr>
		<td><label for="name">To : </label></td>
		<td><input type="text" name="to" id="to"
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Subject : </label></td>
		<td><input type="text" name="subject" id="subject"
			value=<%=bookmark.getName()%>
			class="text ui-widget-content ui-corner-all" /></td>
	</tr>
	<tr>
		<td><label for="name">Message : </label></td>
		<td><textArea id=message name=message><%=bookmark.getUrls()%></textArea>
			</td>
	</tr>
</table>
<%} %>
