<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Order food online now - Mealz'N'Dealz</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="https://fonts.googleapis.com/css?family=Droid+Sans:regular,bold" rel="stylesheet" />
		<link rel="stylesheet" href="css/all.css" type="text/css" media="screen" />
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script type="text/javascript" src="http://fineforce.happytables.com/wp-content/themes/fineforce/js/jquery.backstretch.min.js?ver=3.2.3"></script>
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.fast.live.js"></script>
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
				
				$(".tabs-menu > li").click(function(e){
					switch(e.target.id){
						case "tabs-menu-card":
							//change status & style menu
							$("#tabs-menu-card").addClass("active");
							$("#tabs-reviews").removeClass("active");
							//display selected division, hide others
							$("div.tabs-menu-card").fadeIn();
							$("div.tabs-reviews").css("display", "none");
						break;
						case "tabs-reviews":
							//change status & style menu
							$("#tabs-menu-card").removeClass("active");
							$("#tabs-reviews").addClass("active");
							$("#links").removeClass("active");
							//display selected division, hide others
							$("div.tabs-reviews").fadeIn();
							$("div.tabs-menu-card").css("display", "none");
							$("div.links").css("display", "none");
						break;
					}
					//alert(e.target.id);
					return false;
				});
				
				$('#search_input').fastLiveFilter('.search_list', { timeout: 200,});
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
			jQuery.backstretch("http://fineforce.happytables.com/files/2012/03/fine_bg24.jpg")
			
		</script> 
	</head>
	<body>
		<!-- header fragment-->
		<s:include value="header.jsp"></s:include>
		<div id="non-mashable">
			<!-- below header fragment-->
			<s:include value="below_header_fragment.html"></s:include>
			<div id="intro-wrapper">
				<!--Put test contents here -->
				<div id="ciHomeContent">
					<div id="ciHomeContentlhs">
						<div id="tabs-container">
							<ul class="tabs-menu">
								<li id="tabs-menu-card" class="active">Menu</li>
								<li id="tabs-reviews">Reviews</li>
							</ul>
							<span class="clear"></span>
							<div class="tabs-content tabs-menu-card" style="color:black">
								<div id="RestaurantPage" class="first left eightcol" itemscope="" itemtype="http://schema.org/Restaurant">
									<div id="CategoryDropdownArea" class="menu-tab first left">
										<ul id="CategoryDropDown">
											<li class="dropdown">
												<strong><a style="font-size: 14px;color:black">Skip to Menu Category</a></strong>
												<ul class="shadow">
													<li><a href="#Appetizers (Brunch)" title="Skip to Appetizers (Brunch)">
														Appetizers (Brunch)</a> 
													</li>
													<li><a href="#Soup (Brunch)" title="Skip to Soup (Brunch)">
														Soup (Brunch)</a> 
													</li>
													<li><a href="#Entr&eacute;e Salads (Brunch)" title="Skip to Entr&eacute;e Salads (Brunch)">
														Entrée Salads (Brunch)</a> 
													</li>
													<li><a href="#Sandwiches (Brunch)" title="Skip to Sandwiches (Brunch)">
														Sandwiches (Brunch)</a> 
													</li>
													<li><a href="#Entr&eacute;es (Brunch)" title="Skip to Entr&eacute;es (Brunch)">
														Entrées (Brunch)</a> 
													</li>
													<li><a href="#Sides (Brunch)" title="Skip to Sides (Brunch)">
														Sides (Brunch)</a> 
													</li>
													<li><a href="#Dessert" title="Skip to Dessert">
														Dessert</a> 
													</li>
													<li><a href="#Beverages" title="Skip to Beverages">
														Beverages</a> 
													</li>
												</ul>
											</li>
										</ul>
									</div>
									<input id="search_input" placeholder="type to filter menu item" />
									<div class="clear"></div>
									<br />
									<!-- START 650 AREA -->
									<div class="menuItems">
										<a name="Salads (Lunch)"></a>
										<h5>
											<a href="#">
											Salads (Lunch)</a>
										</h5>
										<p>
											Available Monday - Friday, 11am - 4pm. All dressings come on the side.
										</p>
										<div class="fourcol left menucol first">
											<ul class="search_list">
												<li class="menuItem">
													<span id="4488099">
													<a class="productFancyBox tooltip-header product" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4488099/1906191/add.m" rel="nofollow" title="Baby Greens Salad (Lunch) - $8.95|Cherry tomatoes, shredded carrots, &amp; sherry vinaigrette.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;1 other person likes this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="1 other person likes this">Baby Greens Salad (Lunch)</a>
													</span>
													<span class="price">$8.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem"><span id="4488122"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4488122/1906191/add.m" rel="nofollow" title="Chopped Chicken Salad (Lunch) - $11.95|Please contact Eatery at (212) 765-7080 for the daily salad selection.  Enter your selection in the special instruction box below.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;0 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="0 other people like this">Chopped Chicken Salad (Lunch)</a></span><span class="price">$11.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem"><span id="4488132"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4488132/1906191/add.m" rel="nofollow" title="Grilled Marinated Tofu Stir-Fry Salad (Lunch) - $11.95|With kabocha squash, shiitake mushrooms, snow peas, forbidden rice, &amp; curry coconut glaze.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;2 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="2 other people like this">Grilled Marinated Tofu Stir-Fry Salad (Lunch)</a></span><span class="price">$11.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem popular"><span id="4488135"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4488135/1906191/add.m" rel="nofollow" title="Grilled Asian Chicken Salad (Lunch) - $14.95|Mixed greens, sprouts &amp; jicama tossed with lemon ginger vinaigrette, crisp wontons, &amp; toasted peanuts dressed with sweet chili vinaigrette.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;13 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="13 other people like this">Grilled Asian Chicken Salad (Lunch)</a></span><span class="price">$14.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem"><span id="4994511"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4994511/1906191/add.m" rel="nofollow" title="Mediterranean Salad (Lunch) - $13.95|With grilled chicken, vine-ripened tomatoes, cucumber, red onions, Kalamata olives, capers, imported Feta cheese, red wine vinaigrette &amp; grilled rosemary focaccia.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;5 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="5 other people like this">Mediterranean Salad (Lunch)</a></span><span class="price">$13.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
											</ul>
										</div>
										<div class="fourcol right menucol last">
											<ul class="search_list">
												<li class="menuItem"><span id="4488121"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4488121/1906191/add.m" rel="nofollow" title="Eggless Ceasar Salad (Lunch) - $8.95|Garlic croutons &amp; shaved Parmesan.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;5 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="5 other people like this">Eggless Ceasar Salad (Lunch)</a></span><span class="price">$8.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem"><span id="4488129"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4488129/1906191/add.m" rel="nofollow" title="Adobe Salad (Lunch) - $13.95|Grilled chicken, smoked bacon, Jack cheese, blue tortillas, black beans, buttermilk dressing &amp; honey chipotle dressing.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;3 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="3 other people like this">Adobe Salad (Lunch)</a></span><span class="price">$13.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem"><span id="5864467"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/5864467/1906191/add.m" rel="nofollow" title="Eatery Winter Salad (Lunch) - $12.95|Boston Bibb and Frisee Greens, Dried Cranberries, Roasted Pecans, Blue Cheese &amp; Herb Vinaigrette&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;1 other person likes this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="1 other person likes this">Eatery Winter Salad (Lunch)</a></span><span class="price">$12.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
												<li class="menuItem"><span id="4679161"><a class="productFancyBox tooltip-header" name="product" onclick="menuItemClicked()" href="/Food-Delivery/6499/4679161/1906191/add.m" rel="nofollow" title="Grilled Salmon Salad (Lunch) - $15.95|With roasted red and golden beets over arugula, toasted almonds and herb vinaigrette.&lt;br /&gt;&lt;br /&gt;&lt;div&gt;&lt;p class=&quot;like&quot;&gt;&lt;span class=&quot;like-message&quot;&gt;3 other people like this&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;" data="3 other people like this">Grilled Salmon Salad (Lunch)</a></span><span class="price">$15.95</span>
													<input type="text" class="quantity" value="0" /></input>
												</li>
											</ul>
											<br />
										</div>
									</div>
								</div>
							</div>
							<div class="tabs-content tabs-reviews" style="color:black">
								Add Reviews here
							</div>
						</div>
					</div>
					<div id="ciHomeContentrhs">
						<div id="OrderInfoBox" class="boxed" style="border: 1px silver solid;width:92%;margin-top: 10px;padding:10px">
							<!-- Ajax OrderInformation Area -->
							<div id="OrderInformationAjaxArea">
								<input id="IsAtLeastRecognized" type="hidden" value="False" />
								<div class="orderInfo"></div>
								<h5 class="order" id="orderInformation">Order Information</h5>
								<form id="orderInformationForm">
									<input type="hidden" name="returnUrl" id="returnUrl" value="/food-delivery/Famous-Original-Rays-Pizza-54th-Bdway-New-York-City.3355.r" />
									<table cellpadding="0" cellspacing="0" border="0">
										<colgroup>
											<col class="maincol" />
											<col class="sidecol" />
										</colgroup>
										<tbody>
											<tr id="addressDisplay">
												<td class="main">Address<br /><strong>116 TERRENCE HATTON WAY</strong></td>
												<!--td><a id="addressEditLink">Edit</a></td-->
											</tr>
											<!--tr id="addressSelect" style="display:none;">
												<td class="main">
													Saved Addresses<br />
													<div class="form-field">
														<select id="addressId" name="addressId">
															<option value="">------------------</option>
														</select>
														<a id="addressSelectNewAddress" class="newaddress">Enter a new address</a><br /><br />
													</div>
													<a>
														<div class="submitaddressButton">Submit</div>
													</a>
													<a id="cancelAddressSelect">Cancel</a>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr id="addressEdit" style="display:none;">
												<td class="main">
													<div class="form-field" style="clear: both; padding-top: .5em;">
														<label for="street">Address<span><a class="tooltip-header" title="How to Enter Your Address|Please type out your street address (NOT building name) without abbreviations. Ex: &lt;strong&gt;123 West 1st Street&lt;/strong&gt;">
														(How?)</a></span></label>
														<input id="street" name="street" type="text" size="23" value="116 TERRENCE HATTON WAY" class="{required:true, messages:{required:'We need your address to find all the great restaurants that deliver to you!'}}" />
													</div>
													<div class="form-field half" style="clear: both; margin-right: 10px;">
														<label for="buildingFloor">
														Apt/Suite</label>
														<input id="buildingFloor" name="buildingFloor" type="text" class="half small" value="" />
													</div>
													<div class="form-field half">
														<label for="zipCode">
														Zip Code</label>
														<input id="zipCode" name="zipCode" type="text" class="half {required:true, messages:{required:'We need your Zip Code!'}}" value="10036" /><br />
													</div>
													<br class="clear" />
													<a>
														<div class="submitaddressEditButton">Submit</div>
													</a>
													<a href="#" id="cancelAddressEdit">Cancel</a>
												</td>
											</tr>
											<tr id="deliveryTimeDisplay" style="">
												<td class="main">Delivery Time<br /><strong>Today - ASAP</strong></td>
												<td><a id="editDeliveryTimeLink">Edit</a></td>
											</tr>
											<tr id="deliveryTimeEdit" style="display: none;">
												<td class="main">
													<div class="form-field half" style="clear: both; margin-right: 6px;">
														<label>Delivery Time<br /></label>
														<select class="" name="time" id="time">
															<option value="12:00 AM">12:00 AM</option>
															<option value="12:15 AM">12:15 AM</option>
															<option value="12:30 AM">12:30 AM</option>
															<option value="12:45 AM">12:45 AM</option>
															<option value="1:00 AM">1:00 AM</option>
															<option value="1:15 AM">1:15 AM</option>
															<option value="1:30 AM">1:30 AM</option>
															<option value="1:45 AM">1:45 AM</option>
															<option value="2:00 AM">2:00 AM</option>
															<option value="2:15 AM">2:15 AM</option>
															<option value="2:30 AM">2:30 AM</option>
															<option value="2:45 AM">2:45 AM</option>
															<option value="3:00 AM">3:00 AM</option>
															<option value="3:15 AM">3:15 AM</option>
															<option value="3:30 AM">3:30 AM</option>
															<option value="3:45 AM">3:45 AM</option>
															<option value="4:00 AM">4:00 AM</option>
															<option value="4:15 AM">4:15 AM</option>
															<option value="4:30 AM">4:30 AM</option>
															<option value="4:45 AM">4:45 AM</option>
															<option value="5:00 AM">5:00 AM</option>
															<option value="5:15 AM">5:15 AM</option>
															<option value="5:30 AM">5:30 AM</option>
															<option value="5:45 AM">5:45 AM</option>
															<option value="6:00 AM">6:00 AM</option>
															<option value="6:15 AM">6:15 AM</option>
															<option value="6:30 AM">6:30 AM</option>
															<option value="6:45 AM">6:45 AM</option>
															<option value="7:00 AM">7:00 AM</option>
															<option value="7:15 AM">7:15 AM</option>
															<option value="7:30 AM">7:30 AM</option>
															<option value="7:45 AM">7:45 AM</option>
															<option value="8:00 AM">8:00 AM</option>
															<option value="8:15 AM">8:15 AM</option>
															<option value="8:30 AM">8:30 AM</option>
															<option value="8:45 AM">8:45 AM</option>
															<option value="9:00 AM">9:00 AM</option>
															<option value="9:15 AM">9:15 AM</option>
															<option value="9:30 AM">9:30 AM</option>
															<option value="9:45 AM">9:45 AM</option>
															<option value="10:00 AM">10:00 AM</option>
															<option value="10:15 AM">10:15 AM</option>
															<option value="10:30 AM">10:30 AM</option>
															<option selected="selected" value="ASAP">ASAP</option>
															<option value="10:45 AM">10:45 AM</option>
															<option value="11:00 AM">11:00 AM</option>
															<option value="11:15 AM">11:15 AM</option>
															<option value="11:30 AM">11:30 AM</option>
															<option value="11:45 AM">11:45 AM</option>
															<option value="12:00 PM">12:00 PM</option>
															<option value="12:15 PM">12:15 PM</option>
															<option value="12:30 PM">12:30 PM</option>
															<option value="12:45 PM">12:45 PM</option>
															<option value="1:00 PM">1:00 PM</option>
															<option value="1:15 PM">1:15 PM</option>
															<option value="1:30 PM">1:30 PM</option>
															<option value="1:45 PM">1:45 PM</option>
															<option value="2:00 PM">2:00 PM</option>
															<option value="2:15 PM">2:15 PM</option>
															<option value="2:30 PM">2:30 PM</option>
															<option value="2:45 PM">2:45 PM</option>
															<option value="3:00 PM">3:00 PM</option>
															<option value="3:15 PM">3:15 PM</option>
															<option value="3:30 PM">3:30 PM</option>
															<option value="3:45 PM">3:45 PM</option>
															<option value="4:00 PM">4:00 PM</option>
															<option value="4:15 PM">4:15 PM</option>
															<option value="4:30 PM">4:30 PM</option>
															<option value="4:45 PM">4:45 PM</option>
															<option value="5:00 PM">5:00 PM</option>
															<option value="5:15 PM">5:15 PM</option>
															<option value="5:30 PM">5:30 PM</option>
															<option value="5:45 PM">5:45 PM</option>
															<option value="6:00 PM">6:00 PM</option>
															<option value="6:15 PM">6:15 PM</option>
															<option value="6:30 PM">6:30 PM</option>
															<option value="6:45 PM">6:45 PM</option>
															<option value="7:00 PM">7:00 PM</option>
															<option value="7:15 PM">7:15 PM</option>
															<option value="7:30 PM">7:30 PM</option>
															<option value="7:45 PM">7:45 PM</option>
															<option value="8:00 PM">8:00 PM</option>
															<option value="8:15 PM">8:15 PM</option>
															<option value="8:30 PM">8:30 PM</option>
															<option value="8:45 PM">8:45 PM</option>
															<option value="9:00 PM">9:00 PM</option>
															<option value="9:15 PM">9:15 PM</option>
															<option value="9:30 PM">9:30 PM</option>
															<option value="9:45 PM">9:45 PM</option>
															<option value="10:00 PM">10:00 PM</option>
															<option value="10:15 PM">10:15 PM</option>
															<option value="10:30 PM">10:30 PM</option>
															<option value="10:45 PM">10:45 PM</option>
															<option value="11:00 PM">11:00 PM</option>
															<option value="11:15 PM">11:15 PM</option>
															<option value="11:30 PM">11:30 PM</option>
															<option value="11:45 PM">11:45 PM</option>
														</select>
													</div>
													<div class="form-field half">
														<label for="deliveryDate">  Delivery  Date</label>
														<select id="deliveryDate" name="deliveryDate" class="half">
															<option value="3/10/2012" selected="">
																Today
															</option>
															<option value="3/11/2012">
																Tomorrow
															</option>
															<option value="3/12/2012">
																Monday
															</option>
														</select>
													</div>
													<br class="clear" />
													<a>
														<div class="submittimeButton">Submit</div>
													</a>
													<a id="cancelTimeSelect">Cancel</a>
												</td>
											</tr-->
										</tbody>
									</table>
								</form>
								<!--h3>This order will be delivered.<br />
									<a href="#" id="ChangeDeliveryType" rel="P">Change it to pickup</a>
								</h3-->
							</div>
							<!-- Ajax Order Totals Area -->
							<div id="orderTotalsAjaxArea">
								&nbsp;
							</div>
							<p class="ordermore" style="margin-top: -15px !important;">Change a menu item quantity to add it to your order.</p>
							<div class="FormAction" id="FormAction">
								<div class="findfoodbutton largewhite" onclick="location.href='/Food-Delivery/checkout.m';" title="Proceed to the next step" name="updateStep3Link" id="updateStep3Link" style="display: none; ">
									<h4>
										Proceed to Checkout
									</h4>
								</div>
							</div>
							<!-- FormAction -->
							<!-- Ajax Order Details Area -->
							<div id="orderDetailsAjaxArea">
								<div id="OrderDetailTable">
									<h5>Order Details</h5>
									<div id="OrderDetails">
									</div>
								</div>
								<!--#OrderDetailTable-->
							</div>
							<h3 class="startover">
								<a href="/Food-Delivery/vendors.m">Back to restaurant list</a>
							</h3>
						</div>
						<div id="mostOrderedItems" class="border popular">
							<h5>Most Ordered Items</h5>
							<table cellpadding="0" cellspacing="0" border="0">
								<tbody>
									<tr>
										<td class="main">
											1. <a href="/Food-Delivery/fried-mozzarella-sticks/1856120/51064/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Fried Mozzarella Sticks - $6.75|6 pieces.  Served with marinara sauce.">Fried Mozzarella Sticks</a>
											<input type="hidden" value="1856120" />
										</td>
										<td>$6.75</td>
									</tr>
									<tr>
										<td class="main">
											2. <a href="/Food-Delivery/10-piece-buffalo-chicken-wings/1369631/51074/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;10 Piece Buffalo Chicken Wings - $8.50|Served with Bleu cheese &amp; celery.">10 Piece Buffalo Chicken Wings</a>
											<input type="hidden" value="1369631" />
										</td>
										<td>$8.50</td>
									</tr>
									<tr>
										<td class="main">
											3. <a href="/Food-Delivery/philly-cheese-steak-hero/1856077/51067/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Philly Cheese Steak Hero - $7.00|Thin sliced sirloin steak, green peppers, onions &amp; choice of cheese.">Philly Cheese Steak Hero</a>
											<input type="hidden" value="1856077" />
										</td>
										<td>$7.00</td>
									</tr>
									<tr>
										<td class="main">
											4. <a href="/Food-Delivery/sausage-pepper-roll/1369713/51068/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Sausage &amp; Pepper Roll - $5.75|">Sausage &amp; Pepper Roll</a>
											<input type="hidden" value="1369713" />
										</td>
										<td>$5.75</td>
									</tr>
									<tr>
										<td class="main">
											5. <a href="/Food-Delivery/pepperoni-roll/1369717/51068/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Pepperoni Roll - $5.75|">Pepperoni Roll</a>
											<input type="hidden" value="1369717" />
										</td>
										<td>$5.75</td>
									</tr>
									<tr>
										<td class="main">
											6. <a href="/Food-Delivery/fresh-mozzarella-tomato-basil-pizza-slice/1855875/51069/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Fresh Mozzarella, Tomato &amp; Basil Pizza Slice - $4.75|">Fresh Mozzarella, Tomato &amp; Basil Pizza Slice</a>
											<input type="hidden" value="1855875" />
										</td>
										<td>$4.75</td>
									</tr>
									<tr>
										<td class="main">
											7. <a href="/Food-Delivery/pasta-with-meatballs/1369640/51072/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Pasta with Meatballs - $11.00|">Pasta with Meatballs</a>
											<input type="hidden" value="1369640" />
										</td>
										<td>$11.00</td>
									</tr>
									<tr>
										<td class="main">
											8. <a href="/Food-Delivery/pasta-with-sausage/1369641/51072/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Pasta with Sausage - $11.00|">Pasta with Sausage</a>
											<input type="hidden" value="1369641" />
										</td>
										<td>$11.00</td>
									</tr>
									<tr>
										<td class="main">
											9. <a href="/Food-Delivery/baked-penne/1369645/51073/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Baked Penne - $9.50|">Baked Penne</a>
											<input type="hidden" value="1369645" />
										</td>
										<td>$9.50</td>
									</tr>
									<tr>
										<td class="main">
											10. <a href="/Food-Delivery/brownie-fudge-cake/6207061/51078/add.m" class="productFancyBox tooltip-header" title="&lt;img src='/Food-Delivery/img/consumer/icon_popular.gif?35602d' &gt;&lt;/a&gt;Brownie Fudge Cake  - $4.75|">Brownie Fudge Cake </a>
											<input type="hidden" value="6207061" />
										</td>
										<td>$4.75</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- START 320 AREA -->
						<!-- END 320 AREA -->
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