<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Order food online now - Mealz'N'Dealz</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="css/droid.css" />
		<link rel="stylesheet" href="css/all.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/coda-slider-2.0.css" type="text/css" media="screen" />
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
		<script type="text/javascript" src="js/eatifying-main.js"></script>
		<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript" src="js/jquery.coda-slider-2.0.js"></script>
		<script type="text/javascript" src="js/jquery.fast.live.js"></script>
		<script type="text/javascript" src="js/jquery.jqote2.min.js"></script>
		<link rel="stylesheet" href="css/chosen.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/jquery-ui-1.8.18.custom.css" type="text/css" media="screen" />
		<link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">
		
		<script type="text/x-jqote-template" id="order-info-template">
			<![CDATA[
			<tr id="basket_<*= this.itemId *>">
				<td class="first"><*= this.quantity *></td>
				<td class="second"><*= this.restaurantItemName *></td>
				<td class="third">&#x20B9;<*= this.amount *></td>
			<tr>
				
			]]>
		</script>
		<script type="text/x-jqote-template" id="shopping-cart-template">
			<![CDATA[
			<tr>
				<td class="first">
				<*= this.restaurantItemName *>
				</td>
				<td class="second">
				<*= this.quantity *>
				</td>
				<td class="third">
				&#x20B9;<*= this.amount *>
				</td>
			</tr>
			]]>
		</script>
		
		<script type="text/javascript">
			// Handle to slider object
			var slider;
			
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
			
				slider = $('#coda-slider-1').codaSlider();
				
				
				$('#yfc_wrapper').click(
				  function () {
					$('#miniCart').show();
				  }
				 );
				
				var myJSONObject = '<s:property value="userOrder" escape="false"/>';
				updateTwoCarts(eval('(' + myJSONObject + ')'));
				
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
			<div id="below-header-wrapper">
				<div id="below-header" class="content">
					<h2></h2>
					<div class="other"><ul><li><a href="home.mnd">1.Fill Address  </a></li><li class="separator">|</li><li style="color: white"> 2.Search </li><li class="separator">|</li><li> 3.Order </li><li class="separator">|</li><li> 4.Checkout</li><ul></div>
					<div class="search">
					<!--form action="/search" method="get">
						<input type="text" placeholder="search for favorite restaurants and food" id="search-q" name="q" autocomplete="off" />
						<input type="button" id="search-button" value="" />
					</form-->
						<div class="search-text">
							<!--a><b>Cart</b> (<span id="item_count_in_cart_top_displayed">0</span>)</a-->
							<div id="yfc_mini" style="float:right">
								<div class="smb-mc">
									<div id="yfc_minicart" class="minicart_c1">
										<div id="yfc_wrapper">
											<div id="yfc_mini_align" class="mini_align"></div>
											<span id="yfc_sub_total_mini" class="mini_subtotal">&#x20B9;0.00</span>
											<span id="yfc_total_items_mini" class="mini_item_count">0 Item(s)</span>
											<span id="yfc_show_mini" class="mini_msg">Shopping Cart</span>
										</div>
										<div id="miniCart" style="height: 287px;background-color:#057CA6;position: absolute;z-index:999;right: 0px;width:324px;top:29px;padding: 5px 5px 5px 5px;display:none">
											<div  style="left: 0px; top: -29px; display: block;position: absolute;background-color: #057CA6;width: 98px;height: 27px;font-size: 20px;padding: 1px" id="mc-close">
												<a style="color:white" onclick="$('#miniCart').hide();return false;">[X]</a>
											</div>
											<span id="yfc_dt-header-item">Item(s)</span>
											<span id="yfc_dt-header-qty">Qty</span>
											<span id="yfc_dt-header-price">Price</span>
											<div style="background-color: white;position: absolute;width: 97%;height: 200px;overflow-y: scroll">
												<table id="no-content">
												</table>
												<table id="miniCartTablecontent">
													<tbody>
													</tbody>
												</table>
											</div>
											<div style="background-color: white;position: absolute;width: 97%;height: 60px;margin-top: 210px;color:#555">
													<div style="width:60%;float: left">
														<div style="width: 50%;float: left">
															<div style="text-align:right;font-weight:bold;padding:0px">
															Total<br/>
															Tax
															<hr/>
															Subtotal<br/>
															</div>
														</div>
														<div style="width: 40%;float: right">
															<div style="text-align: left;font-weight:bold;padding:0px">
															<span id="yfc_total_footer">
															&#x20B9;0.0
															</span>
															<br/>
															<span id="yfc_tax_footer">
															&#x20B9;0.0
															</span>
															<hr/>
															<span id="yfc_sub_total_footer">
															&#x20B9;0.0
															</span>
															<br/>
															</div>
														</div>
													</div>
													<div style="width:40%;float: right">
														<a href="#" onclick="openUnderConstructionDialog();return false;" class="color-button"><strong>Check Out</strong></a>
													</div>	
											</div>
										</div>
										<span id="yfc_mini_icon" class="mini_icon"></span>
										<div class="clear"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="intro-wrapper">
				
				<div class="wide-content slider-container">
					
					<div class="coda-slider-wrapper" style="z-index: 1" id="coda-slider-wrapper-1">
						<div class="coda-slider preload" id="coda-slider-1" style="position: relative: overflow: hidden">
							<div class="panel">
								<div class="panel-wrapper">
									<div id="restaurant-list">
										<div id="filter" class="filter">
										<h5>Filter search</h5>
										<div>
											<input type="text" id="restaurantNameFilter"
												placeholder="Restaurant name" /> <input id="foodNameFilter"
												type="text" placeholder="Food name" /> <input type="button"
												onclick="filterRestaurants();">
										</div>
										<form class="form">
											<div id="filterCusine">
												<h3>Cusine</h3>
												<s:iterator value="cusineList">
													<input id="cusine-<s:property value="cusineId"/>" type="checkbox"
														value="<s:property value="cusineId"/>"
														title=<s:property value="cusineDesc"/>
														onclick="filterRestaurants();">
													<label> <s:property value="cusineName" /> </label>
													<br>
												</s:iterator>
											</div>
											<hr>
											<div id="filterCost">
												<h3>Cost type:</h3>
												<input id="cost-1" type="checkbox" value="1"
													onclick="filterRestaurants();"> <label>&#x20B9;</label> <br>
												<input id="cost-2" type="checkbox" value="2"
													onclick="filterRestaurants();"> <label>&#x20B9;&#x20B9;</label> <br>
												<input id="cost-3" type="checkbox" value="3"
													onclick="filterRestaurants();"> <label>&#x20B9;&#x20B9;&#x20B9;</label> <br>
												<br>
											</div>
											<hr>
											<div id="filterRating">
												<h3>Rating</h3>
												<input id="rating-1" type="checkbox" value="1"
													onclick="filterRestaurants();"> <img
													src="images/star_x_orange.gif" /> <br> <input id="rating-2"
													type="checkbox" value="2" onclick="filterRestaurants();">
												<img src="images/star_x_orange.gif" /><img
													src="images/star_x_orange.gif" /> <br> <input id="rating-3"
													type="checkbox" value="3" onclick="filterRestaurants();">
												<img src="images/star_x_orange.gif" /><img
													src="images/star_x_orange.gif" /><img
													src="images/star_x_orange.gif" /> <br>
											</div>
										</form>
									</div>
										<div id="restaurantsTableDiv" class="restaurantsTable">
											<table id="restListTable" class="table">
												<colgroup width="30%" />
												<colgroup width="15%" />
												<colgroup width="15%" />
												<colgroup width="20%" />
												<colgroup width="20%" />
												<thead>
													<tr>
														<th>Restaurant Name</th>
														<th>Price</th>
														<th>Rating</th>
														<th>Distance</th>
														<th>Delivery time</th>
													</tr>
												</thead>
												<s:iterator value="restaurantList">
													<tr>
														<td><a href="#"
															onclick="getRestaurantById('<s:property value="restaurantId"/>');return false;">
																<s:property value="restaurantName" /> </a> <br> <s:property
																value="restaurantAddress.addressLine1" /> , <s:property
																value="restaurantPhone" />
														</td>
														<td><s:iterator value="restaurantDetails.costType.costTypeId" >
															&#x20B9;
															</s:iterator>
														</td>
														<td><s:iterator value="restaurantDetails.rating.ratingId" >
															<img src="images/star_x_orange.gif" />
															</s:iterator>
														</td>
														<td><s:property value="restaurantDetails.distance" />
														</td>
														<td><s:property value="restaurantDetails.deliveryTime" />
														</td>
													</tr>
												</s:iterator>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-wrapper">
									<div id="ciHomeContent">
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-wrapper">
									<div id="checkout">
									</div>
								</div>
							</div>
						</div><!-- .coda-slider -->
					</div><!-- .coda-slider-wrapper -->
					<!-- Three page slider setup -->
				</div>	
			</div>
			<!-- footer fragment -->
			<s:include value="footer.jsp"></s:include>
		</div>
		<!-- modal box fragment -->
		<s:include value="modal_box_fragment.html"></s:include>
	</body>
	
</html>