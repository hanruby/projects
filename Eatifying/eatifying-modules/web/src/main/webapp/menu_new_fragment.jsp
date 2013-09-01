<%@taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	$(document).ready(function() {
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
		
		
		var myJSONObject = '<s:property value="userOrder" escape="false"/>';
		updateTwoCarts(eval('(' + myJSONObject + ')'));
		
		$('.menuItems h5').click(
			function(){
				if($(this).is('.collapse'))
					$(this).removeClass('collapse');
				else
					$(this).addClass('collapse');
						
				
			}
		);
													
	});

</script>



<!--Put test contents here -->
<div id="ciHomeContentlhs">
	<s:hidden name="restaurant.restaurantId" id="restaurantId"/>
	<div style="padding:10px">
		<h1 class="consumer">
			<span id="VendorName" itemprop="name">
			<s:property value="restaurant.restaurantName"/>
			</span> 
		</h1>
		<div id="restaurantAddressBox">
			<p id="RestaurantAddress" itemprop="address" itemscope="" itemtype="http://schema.org/PostalAddress">
			<span itemprop="streetAddress">
				<s:property value="restaurant.restaurantAddress.addressLine1" /> , 
			</span>
			<br>
			<span itemprop="telephone">
					<s:property value="restaurant.restaurantPhone" />
			</span>
			</p>
		</div>
		<ul id="RestaurantDetails" class="estimates" itemprop="geo" itemscope="" itemtype="http://schema.org/GeoCoordinates">
			<li class="info">Minimum order of <strong>
			&#x20B9;1000.00</strong> is required for delivery. </li>
			<li class="ready-time">Delivery estimate is <strong>
			30
			-
			45
			min</strong> (<a class="tooltip-header" title="About Delivery Estimates|Online orders placed through Seamless are generally delivered more quickly than orders placed over the phone. However, please keep in mind that this is the restaurant's best estimate. If the weather is bad or the restaurant becomes unexpectedly busy, it is not uncommon for an order to take an extra 10 minutes (and, of course, it's also possible for the order to be delivered much more quickly).&lt;br /&gt;&lt;br /&gt;Once you checkout, your order is immediately transmitted to the restaurant. The moment the restaurant confirms receipt of your order, you will receive an email confirmation with an updated delivery time, so you can be sure the restaurant is working to prepare and deliver your food as quickly as possible!">more
				info</a>). </li>
			<li style="display: none;" itemprop="geo" itemscope="" itemtype="http://schema.org/GeoCoordinates">
			<meta itemprop="latitude" content="40.76081000">
			<meta itemprop="longitude" content="-73.98352700">
			</li>
		</ul>
	</div>
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
							<strong><a style="font-size: 14px;color:#555">Skip to Menu Category</a></strong>
							<ul class="shadow">
								<s:iterator value="restaurant.restaurantMenu.categoryMenuMap" status="category">
									<li><a href='#<s:property value="key.categoryName"/>' title='Skip to <s:property value="key.categoryName"/>'>
										<s:property value="key.categoryName"/>
										</a> 
									</li>
								</s:iterator>	
							</ul>
						</li>
					</ul>
				</div>
				<input id="search_input" placeholder="type to filter menu item" />
				<div class="clear"></div>
				<br />
				<!-- START 650 AREA -->
				<div class="menuItems">
					<s:iterator value="restaurant.restaurantMenu.categoryMenuMap" status="category">
						<a name="<s:property value="key.categoryName"/>"></a>
						<h5>
							<s:property value="key.categoryName"/>
						</h5>
						<p>
							Available Monday - Friday, 11am - 4pm. All dressings come on the side.
						</p>
						
						<div class="fourcol left menucol first">
							<ul class="search_list">
								<s:iterator value="menuItemsList1[key]">
									<li class="menuItem">
										<span id="item_<s:property value='itemId'/>">
											<a class="productFancyBox tooltip-header product" name="product" onclick="menuItemClicked()" href="#" rel="nofollow" title=""><s:property value='itemName'/></a>
										</span>
										<s:hidden name="itemId" cssClass="itemId"/>
										<span class="price">&#x20B9;<s:property value='formattedPrice'/></span>
										<input type="hidden" class="hiddenQuantity" value="0" /></input>
										<input type="text" class="quantity" value="0" onchange="updateItem(this);return false;"/></input>
									</li>
								</s:iterator>	
							</ul>
						</div>
						<div class="fourcol right menucol last">
							<ul class="search_list">
								<s:iterator value="menuItemsList2[key]">
									<li class="menuItem">
										<span id="item_<s:property value='itemId'/>">
											<a class="productFancyBox tooltip-header product" name="product" onclick="menuItemClicked()" href="#" rel="nofollow" title=""><s:property value='itemName'/></a>
										</span>
										<s:hidden name="itemId" cssClass="itemId"/>
										<span class="price">&#x20B9;<s:property value='formattedPrice'/></span>
										<input type="hidden" class="hiddenQuantity" value="0" /></input>
										<input type="text" class="quantity" value="0" onchange="updateItem(this);return false;"/></input>
									</li>
								</s:iterator>
							</ul>
							<br />
						</div>
						
					</s:iterator>
					
				</div>
			</div>
		</div>
		<div class="tabs-content tabs-reviews" style="color:black">
			<div id="userreviews" class="user-reviews-tab" itemprop="reviews" itemscope="" itemtype="http://schema.org/Review" style="">
				<div id="reviews">
					<s:iterator value="restaurant.restaurantReviews">	
						<div class="reviewblock first">
							<input type="hidden" value="1315421220" class="ratingdate">
							<input type="hidden" value="1" class="rating">
							<input type="hidden" value="1" class="helpfultagcount">
							
							<p>
								<s:property value="review"/>
							</p>
							
							<p class="postedby">
								Posted
								6 months ago
								by
								<s:property value="user"/> on
								<a style="color:green;text-decoration: underline;" href='<s:property value="source.website"/>' target="_blank"><s:property value="source.source"/></a>
							</p>
							
						</div>
					</s:iterator>	
					<div class="addyours">
						<h3 class="backtomenu">
							<a href="#" title="Go Back to menu and continue your order" onclick="$('#tabs-menu-card').click();return false;"><< Back to the menu</a>
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="ciHomeContentrhs">
	<div id="OrderInfoBox" class="boxed" style="border: 1px silver solid;width:92%;padding:10px">
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
							<td class="main">Your order will be delivered to the Address<br /><strong>116 TERRENCE HATTON WAY</strong></td>
							<!--td><a id="addressEditLink">Edit</a></td-->
						</tr>
						
					</tbody>
				</table>
			</form>
			<!--h3>This order will be delivered.<br />
				<a href="#" id="ChangeDeliveryType" rel="P">Change it to pickup</a>
			</h3-->
		</div>
		<!-- Ajax Order Totals Area -->
		<div id="orderTotalsAjaxArea">
			<table class="DataTable" border="0" cellpadding="0" cellspacing="0" class="width:100%">
				<colgroup>
					<col class="maincol">
					<col class="sidecol">
				</colgroup>
				<tbody>
					<tr>
						<td class="main">
							Total:
						</td>
						<td class="text-right" id="order-total">
							0.00
						</td>
					</tr>
					<tr class="noline">
						<td class="main">
							Tax:
						</td>
						<td class="text-right" id="order-tax">
							0.00
						</td>
					</tr>
					<tr class="subtotal">
						<td class="main">
							Subtotal:
						</td>
						<td class="text-right" id="order-subtotal">
							0.00
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<p class="ordermore" style="margin-top: 15px !important;">Change a menu item quantity to add it to your order.</p>
		<div class="FormAction" id="FormAction">
			<div class="findfoodbutton largewhite" title="Proceed to the next step" name="updateStep3Link" id="updateStep3Link" style="display: none; ">
				<h3>
					<a class="green" href="#" onclick="goToCheckout();return false;"><strong>Proceed to Checkout >></strong></a>
				</h3>
			</div>
		</div>
		<!-- FormAction -->
		<!-- Ajax Order Details Area -->
		<div id="orderDetailsAjaxArea">
			<div id="OrderDetailTable">
				<h5>Order Details</h5>
				<table id="orderDetails"> 
					<tbody>
					</tbody>
				</table>
			</div>
			<!--#OrderDetailTable-->
		</div>
		<h3 class="startover">
			<a href="#" onclick="goToMenu();return false;"><strong><< Back to restaurant list</strong></a>
		</h3>
	</div>
	<div id="mostOrderedItems" class="border popular">
		<h5>Most Ordered Items</h5>
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<s:iterator value="restaurant.mostOrderedItems" status="status">
					<tr>
						<td class="main">
							<s:property value="#status.count" />. <a href="#" class="productFancyBox tooltip-header" title=""><s:property value="itemName"/></a>
							<s:hidden value="itemId"></s:hidden>
						</td>
						<td>&#x20B9;<s:property value="formattedPrice"/></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- START 320 AREA -->
	<!-- END 320 AREA -->
</div>
