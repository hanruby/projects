<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<br>
<object width="425" height="344"> <%
 	String vid = request.getParameter("vid");
 %>
	<param name="movie"
		value="http://www.youtube.com/v/<%=vid.trim()%>&autoplay=1&rel=0&fs=1&color1=0x3a3a3a&color2=0x999999&border=0&loop=0"></param>
	<param name="allowFullScreen" value="true"></param>
	<embed
		src="http://www.youtube.com/v/<%=vid.trim()%>&autoplay=1&rel=0&fs=1&color1=0x3a3a3a&color2=0x999999&border=0&loop=0"
		type="application/x-shockwave-flash" allowfullscreen="true"
		width="425" height="344"></embed></object>