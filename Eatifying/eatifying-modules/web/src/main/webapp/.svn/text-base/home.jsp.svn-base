<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="x-ua-compatible" content="IE=8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Mealz 'n' Dealz | Order Food Online &amp; Get it
	delivered at your doorstep</title>
<meta name="keywords"
	content="food delivery, delivery food, restaurants, delivery restaurants, restaurant delivery, delivery restaurants, food delivery service, food, order food online, online ordering, local food delivery, takeout, take out, Mealz 'n' Dealz">
<meta name="description"
	content="Order food online from food delivery restaurants in your area. Ordering food online from delivery food restaurants is fast and get discounts for ordering food online or via mobile at Mealz 'n' Dealz in Hyderabad">
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/chosen.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/jquery.fancybox-1.3.4.css" type="text/css"
	media="screen" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script type="text/javascript"
	src="<s:url value="/js/jquery.nivo.slider.pack.js" includeParams="none"/>"></script>
<script type="text/javascript"
	src="<s:url value="/js/eatifying-main.js" includeParams="none"/>"></script>
<script type="text/javascript"
	src="<s:url value="/js/jquery.blockUI.js" includeParams="none"/>"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript"
	src="<s:url value="/js/modernizr-latest.js" includeParams="none"/>"></script>
<script type="text/javascript"
	src="<s:url value="/js/chosen.jquery.min.js" includeParams="none"/>"></script>
<script type="text/javascript" 
    src="<s:url value="/js/jquery.fancybox-1.3.4.pack.js" includeParams="none"/>"></script>
<script type="text/javascript">
			$(window).load(function() {
				$('#slider').nivoSlider();
				$(".chzn-select").chosen({no_results_text: "No results matched"});
			});
			$(document).ready(function() {
				$("#alogin").fancybox({
					'autoDimensions'	: false,
					'width'				: '500',
					'height'			: '350'});
			});
		</script>
</head>

<body>
	<jsp:include page="/header.jsp" />
	<div class="clear" style="position: relative"/>
	<div id="main_content">
		<ul id="crumbs">
			<li>Enter Address</a></li>
			<li><a href="#">Select restaurant</a></li>
			<li><a href="#">Select Menu</a></li>
			<li><a href="#">Checkout</a></li>
		</ul>
		<!--useful to create the 960px limit-->
		<div id="main-container">
		<section class="left_cont">
			<article>
				<!-- place the carousel here-->
				<figure id="slider" class="nivoSlider">
					<!-- The figure tag marks data (usually an image) that is part of the article -->
					<img src="images/1.jpg" alt=""  />
					<img src="images/2.jpg" alt=""  />
					<img src="images/3.jpg" alt=""  />
					<img src="images/4.jpg" alt=""  />
					<img src="images/5.jpg" alt=""  />
					<img src="images/6.jpg" alt=""  />
					<img src="images/7.jpg" alt=""  />
					<img src="images/8.jpg" alt=""  />
					<img src="images/9.jpg" alt=""  />
					<img src="images/10.jpg" alt="" />
				</figure>
			</article>
		</section>
		<!-- /#featured -->
		<aside>
			<article>
				<!--span class="form-title">I 'm hungry!!!</span-->
				<!-- Place the form-->
				<form name="addressform" id="addressform"
					action="listRestaurants.action">
					<input type="text" name="address" id="address" placeholder="Address"> 
					<br> 
					<input type="hidden" name="city" id="city" value="hyderabad">
					<br>
					<select data-placeholder="Place" style="width:350px;" class="chzn-select"" name="place" id="place">
					<option value=""></option> 
					<option value="Madhapur">Madhapur</option> 
					<option value="Jubilee Hills">Jubilee Hills</option> 
					<option value="Banjara Hills">Banjara Hills</option> 
					<option value="Kukatpally">Kukatpally</option> 
					
					</select>
					<br> <input type="text" name="restaurant" id="restaurant" placeholder="Restaurant" required> 
					<br> <input type="hidden" name="latitude" id="latitude">
					<br> <input type="hidden" name="longitude" id="longitude">
					<br> 
					<a class="findfoodbutton largewhite" id="FindFood" tabindex="5" href="#"
					onclick="getRestaurants();return false;">Find Your Food
					</a>	
				</form>
			</article>
		</aside>
		</div>
	</div>
	
	<div class="clear"/>
	<jsp:include page="/footer.jsp" />
</body>
</html>