<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.Category"%>
<%@ page import="com.code.savemarks.service.BookmarkService"%>
<%
	BookmarkService myBookmarkService = new BookmarkService();
	String user = (String) session.getAttribute("user");
	List<Category> categories = myBookmarkService.getCategories(user);
	String category=(String)session.getAttribute("category");
	category = category == null?"":category;
%>
<br><br>

<table align="right" width="75%">
	<tr>
		<td>
			<center><b>Category</b></center><hr>
		</td>
	</tr>
	<%
		for (Category categoryVal : categories) {
	%>
	<tr>
		<td>
		<div width="100%"
		<%if(category.equals(categoryVal.getCategoryName())){ %>
			id=selected-category
			<%} %>
		>
		<%String categoryStr = categoryVal.getCategoryName(); 
			if(categoryStr.length()>14)
			{
				categoryStr = categoryStr.substring(0,12)+"..";
			}
		%>
			<a class="category" onclick="setCategory('<%=categoryVal.getCategoryName()%>');pageInit('AllBookmarksTable');"> <%=categoryStr%> </a>
		</div>
		</td>
	</tr>
	<%
		}
	%>
</table>