<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bubble.css" />
		<link rel="icon" href="/../images/favicon.ico"/>
		
	</head>
<body>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.2.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bookmarks.js"></script>
		<script src="${pageContext.request.contextPath}/js/script.js"></script>

<header>
      <div id="site-title">
      	<a href="/savemarks">
      		<span class="save">Save</span>
      		<span class="marks">marks</span> </a>
      </div>
      		<p id="pitch">
    		Save and organise your bookmarks in web. 
  			</p>   
</header>


<div id="left-pane">
<center>
<div id="slideshow">

	<ul class="slides">
	    <li><img src="/../images/Slides/Bookmarks.PNG" width="720" height="450" alt="Bookmarks" /></li>
    	<li><img src="/../images/Slides/AddBookmarks.PNG" width="720" height="450" alt="AddBookmarks" /></li>
        <li><img src="/../images/Slides/Categorise.PNG" width="720" height="450" alt="Categorise" /></li>
        <li><img src="/../images/Slides/ReadFeeds.PNG" width="720" height="450" alt="ReadFeeds" /></li>
        <li><img src="/../images/Slides/ViewVideos.PNG" width="720" height="450" alt="ViewVideos" /></li>
    </ul>

    <span class="arrow previous"></span>
    <span class="arrow next"></span>
</div>

</center>
</div>
<div id=right-pane>
<div id="Info">
<div class="triangle-border left">
	<div id="site-title" align=center>
      	
      		<span class="save">Save</span>
      		<span class="marks">marks</span> 
      </div>
      <br><br>
	<p id='login-info'>Savemarks is a place to store your online bookmarks,get feeds from your
	favourite sites.</p>
	
	<p style="font-style:italic;margin-left:20px;">Features &nbsp;:</p>
	<ul>
	<li> Organise your bookmarks.</li>
	<li> Share it.</li>
	<li> Categorise in folder structure.</li>
	</ul>
	<br>
	</div>
	
	<div class="triangle-border top"><center>
	Login using your Google Account : 
	<input class="button gray" type=button value="Login" onclick="window.location.href='/LoginGoogle'">
	</center>
</div> 
	</div>
</div>

<footer>   
    <p>
      You can contact us in
     <a href="mailto:savemarks@save-marks.com">
		savemarks@save-marks.com</a>
    </p>  
</footer>

</body>
</html>