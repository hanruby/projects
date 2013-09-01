<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Order food online now - Mealz'N'Dealz</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
		<script type="text/javascript" src="js/eatifying-main.js"></script>
		<script type="text/javascript" src="js/jquery.coda-slider-2.0.js"></script>
		<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
		<link rel="stylesheet" href="css/droid.css" />
		<link rel="stylesheet" href="css/all.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/coda-slider-2.0.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/chosen.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/jquery-ui-1.8.18.custom.css" type="text/css" media="screen" />
		<script type="text/javascript">
			$(document).ready(function() {
			
				$('#joinUsModalBox').dialog({ autoOpen: false, title: 'Join Us',modal: true, buttons: [
			
				{
			
					text: "Create Account",
			
					click: function() { $(this).dialog("close"); }
			
				}
			
				], width: '552px'});
			
				$('#signInModalBox').dialog({ autoOpen: false, title: 'Sign In',modal: true, buttons: [
			
				{
			
					text: "Sign In",
			
					click: function() { $(this).dialog("close"); }
			
				}
			
				], width: '552px'});
				
				$('#underConstructionModalBox').dialog({ autoOpen: false, title: 'Under Construction',modal: true, width: '300px'});
				
				$(".chzn-select").chosen({no_results_text: "No results matched"});
				
				$('#coda-slider-2').codaSlider()
			
			});
			
			
			
			function openJoinDialog() {
			
				$('#joinUsModalBox').dialog('open');
			
			}
			
			
			
			function openSignInDialog() {
			
				$('#signInModalBox').dialog('open');
			
			}
			
			function openUnderConstructionDialog() {
				$('#underConstructionModalBox').dialog('open');
			
			}
			
			
		</script>
		
		<!-- Full Background -->
		<script type="text/javascript">
			jQuery.backstretch("images/home_bg.jpg")
			
		</script> 
	</head>
	<body>
		<!-- header fragment-->
		<s:include value="header.jsp"></s:include>
		<div id="non-mashable">
			<!-- below header fragment-->
			<s:include value="below_header_fragment.html"></s:include>
			<div id="intro-wrapper" class="white">
				<!-- intro -->
				<div id="intro" class="content">
					<div class="buttons">
						<a id="intro-join" href="#" onclick="openJoinDialog();return false;">Join <strong>US</strong> right now!</a>
						<a id="intro-signin" class="sign-in" href="#" onclick="openSignInDialog();return false;">Already have an account? <strong>SIGN IN HERE</strong></a>
					</div>
					<div class="message">
						<h2><span>mealzndealz</span> is the <strong>easiest way</strong> to order the best food at the best deals. The ordering is easy, even better <span>mealzndealz</span> is free!</h2>
					</div>
				</div>
				<div class="content">
					<div class="start-order">
						<div id="loading-image">
							<img src="images/ajax-loader-black.gif" alt="Loading..." />
						</div>
						<h2> Start Your Order</h2>
						<form name="addressform" id="addressform" action="find-n-order.mnd" method="POST">
							<fieldset class="labels-left narrow">
								<div class="alert-message error" id="signin-error" style="display: none; "></div>
								<p>
									<label for="address">Address:</label>
									<span>
										<input type="text" name="address" id="address" placeholder="Address"/>
									</span>
									<span style="display:none" id="address-error" class="error-message">
										*Please specify your delivery address 
									</span>
								</p>
								<p>
									<label for="area-zipcode">Area/Zipcode:</label>
									<span id="place-holder">
										<select data-placeholder="Area/Zipcode" style="width:293px;border-radius: 5px" class="chzn-select" " name="place" id="place">
											<option value=""></option>
											<option value="Madhapur">Madhapur</option>
											<option value="Jubilee Hills">Jubilee Hills</option>
											<option value="Banjara Hills">Banjara Hills</option>
											<option value="Kukatpally">Kukatpally</option>
										</select>
									</span>
									<span style="display:none" id="place-error" class="error-message">
										*Please specify your Area/Zipcode 
									</span>
								</p>
								<p>
									<label for="restaurant">Restaurant:</label>
									<span>
										<input type="text" name="restaurant" id="restaurant"/>
									</span>
								</p>
								<input type="hidden" name="city" id="city" value="hyderabad">
								<input type="hidden" name="latitude" id="latitude">
								<input type="hidden" name="longitude" id="longitude">
							</fieldset>
							<a href="#" onclick="getRestaurants();return false;" id="find-food">Find Your Food
							</a>
						</form>
					</div>
				</div>
			</div>
			<div class="instructions-wrapper">
				<div class="content">
					<h2>
						Most popular restaurants on <span>mealzndealz</span>
						<!--a class="see-more" href="/movies/trending">see more »</a-->
					</h2>
				</div>
			</div>
			<div class="main-wrapper">
				<div class="main content">
					<div class="one-column">
						<div id="popular-shows">
							<div class="coda-slider-wrapper" style="z-index: 1;overflow: hidden" id="coda-slider-wrapper-2">
								<div class="coda-slider preload" id="coda-slider-2" style="position: relative: overflow: hidden">
									<div class="panel">
										<div class="panel-wrapper">
											<div class="library-wrapper">
												<div class="library-show first-poster">
													<div class="poster">
														<a href="#"><img alt="" src="images/dominoes.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Dominoes</a>
													</h4>
													<!--a class="plays" href="/movie/the-descendants-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/subway.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Subway</a>
													</h4>
													<!--a class="plays" href="#">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/pizza-hut.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Pizza Hut</a>
													</h4>
													<!--a class="plays" href="/movie/tower-heist-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/chutneys.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Chutneys</a>
													</h4>
													<!--a class="plays" href="/movie/the-muppets-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/minerva.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Minerva Coffee Shop</a>
													</h4>
													<!--a class="plays" href="/movie/jack-and-jill-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/shangai-chef.jpeg" />
														</a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Shangai Chef</a>
													</h4>
													<!--a class="plays" href="/movie/the-adventures-of-tintin-2011/watchers">4 people watching</a-->
												</div>
											</div>
										</div>
									</div>
									<div class="panel">
										<div class="panel-wrapper">
											<div class="library-wrapper">
												<div class="library-show first-poster">
													<div class="poster">
														<a href="#"><img alt="" src="images/dominoes.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Dominoes</a>
													</h4>
													<!--a class="plays" href="/movie/the-descendants-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/subway.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Subway</a>
													</h4>
													<!--a class="plays" href="#">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/pizza-hut.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Pizza Hut</a>
													</h4>
													<!--a class="plays" href="/movie/tower-heist-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/chutneys.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Chutneys</a>
													</h4>
													<!--a class="plays" href="/movie/the-muppets-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/minerva.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Minerva Coffee Shop</a>
													</h4>
													<!--a class="plays" href="/movie/jack-and-jill-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/shangai-chef.jpeg" />
														</a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Shangai Chef</a>
													</h4>
													<!--a class="plays" href="/movie/the-adventures-of-tintin-2011/watchers">4 people watching</a-->
												</div>
											</div>
										</div>
									</div>	
									<div class="panel">
										<div class="panel-wrapper">
											<div class="library-wrapper">
												<div class="library-show first-poster">
													<div class="poster">
														<a href="#"><img alt="" src="images/dominoes.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Dominoes</a>
													</h4>
													<!--a class="plays" href="/movie/the-descendants-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/subway.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Subway</a>
													</h4>
													<!--a class="plays" href="#">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/pizza-hut.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Pizza Hut</a>
													</h4>
													<!--a class="plays" href="/movie/tower-heist-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/chutneys.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Chutneys</a>
													</h4>
													<!--a class="plays" href="/movie/the-muppets-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/minerva.jpg" /></a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Minerva Coffee Shop</a>
													</h4>
													<!--a class="plays" href="/movie/jack-and-jill-2011/watchers">2 people watching</a-->
												</div>
												<div class="library-show">
													<div class="poster">
														<a href="#"><img alt="" src="images/shangai-chef.jpeg" />
														</a>
													</div>
													<h4>
														<div class="title-overflow"></div>
														<a class="title" href="#">Shangai Chef</a>
													</h4>
													<!--a class="plays" href="/movie/the-adventures-of-tintin-2011/watchers">4 people watching</a-->
												</div>
											</div>
										</div>
									</div>	
								</div>
							</div>		
						</div>
					</div>
				</div>
			</div>
			
			<!-- footer fragment -->
			<s:include value="footer.jsp"></s:include>
		</div>
		<!-- modal box fragment -->
		<s:include value="modal_box_fragment.html"></s:include>
	</body>
</html>