<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%String user = (String) session.getAttribute("user");%>
<header>
      <div id="site-title">
      	<a href="/savemarks">
      		<span class="save">Save</span>
      		<span class="marks">marks</span> </a></div>
      	<form id="search" action="/SearchResults.jsp">
      		Welcome,<%=user%>&nbsp;<a href="#" onclick="signOut();">Sign out</a><br>
        	<input type="text" placeholder="Search bookmark..." name="b"/>
        	<input type="submit" value="Go"/>
      	</form>
      	<form name="signout" action="/SignOutServlet"></form>

  		<p id="pitch">
    		Save and organise your bookmarks in web. 
    		<a href="#" onclick="AddOrUpdateBookmark('');">Add a bookmark &rarr;</a>
  		</p>
</header>
