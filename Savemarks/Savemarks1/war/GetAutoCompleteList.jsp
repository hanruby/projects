<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.code.savemarks.model.Category"%>
<%@ page import="com.code.savemarks.service.BookmarkService"%>
<%
	BookmarkService myBookmarkService = new BookmarkService();
	String user = (String) session.getAttribute("user");
	String type = request.getParameter("type");
	if(type.equals("category")){
	String[] categoryArr = myBookmarkService.getCategoriesArray(user);

	for (int i = 0; i < categoryArr.length; i++) {
		out.print(categoryArr[i] + ":");
	}
	}
	else{
		Set<String> hierachy = myBookmarkService.getHierarchy(user);
		Iterator it = hierachy.iterator();
		while (it.hasNext()) {
		    // Get element
		    String element = (String)it.next();
		    out.print(element + ":");
		}
	}
%>

