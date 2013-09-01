<%@taglib uri="/struts-tags" prefix="s"%>

<script>
	
	
	var name = "#floatMenu";
    var menuYloc = null;

    $(document).ready(function(){
        menuYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")))
        $(window).scroll(function () {
            var offset = menuYloc+$(document).scrollTop() 
            if(offset > 50)
			{
				offset = offset - 50;
			}
			offset += "px";
			$(name).animate({top:offset},{duration:500,queue:false});
        });
		$( "#tabs" ).tabs({
			ajaxOptions: {
				error: function( xhr, status, index, anchor ) {
					$( anchor.hash ).html(
						"Couldn't load this tab. We'll try to fix this as soon as possible. " +
						"If this wouldn't be a demo." );
				}
			}
		});
    });

	</script>
	

<div id="restMenuLeft">
	
	<div id="restaurantMenuAddress" style="postion: relative;overflow: hidden;">
		<div style="float:right;width: 45%">
			<div class="expandable_note_box" style="margin-left: 60px;">
			<div class="middle">
    		<div class="inside">
    			<p><h3 style="border-bottom: 1px solid silver;">Delivery Address</h3>
				<br/>		
				<s:property value="restaurant.restaurantAddress.fullAddressHTML" escape="false"/>
			
				</p>
    		</div>
    		<img src="bottom.jpg" alt="bottom" />
    	</div>
    </div>
		</div>
		<div id="restaurantAddress" style="float:left; width: 50%">
			<h2 style="font-weight: bold">
				<s:property value="restaurant.restaurantName" />
				<s:hidden name="restaurant.restaurantId" id="restaurantId"/>
			</h2>
			<s:property value="restaurant.restaurantAddress.fullAddressHTML" escape="false"/>
			<br/>
			<li class="info">Minimum order of <strong>
			<s:property value="minimumDeliveryAmount"/></strong> is required for delivery. 
			</li>
		</div>
	</div>
	<div class="clear:both"/>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Details and Menu</a></li>
			<li><a href="#tabs-2">Reviews</a></li>
		</ul>
		<div id="tabs-1">
			<div id="restaurantMain">
			
			<s:iterator value="restaurant.restaurantMenu.categoryMenuMap" status="category">
				<h5><a><s:property value="key.categoryName"/></a></h5>
				<div id="menuItems1" class="floatLeft">
				<table>
					<colgroup width="10%" />
					<colgroup width="55%" />
					<colgroup width="20%" />
					<colgroup width="15%" />
					<tr class="firstRow">
						<td>
						</td>
						<td>
						Item
						</td>
						<td>
						Price
						</td>
						<td>
						Qty
						</td>
					</tr>
					<s:iterator value="menuItemsList1[key]">
					<tr>
						<td>
						<img alt="Add Item" src="<s:url value="/images/add.png"/>" style="padding-top: 2px"
						onclick="onAddItem(this);return false;"></img>
						<img alt="Remove Item" src="<s:url value="/images/remove.png"/>" 
						onclick="onRemoveItem(this);return false;" style="display:none;padding-top: 2px"></img>
						<s:hidden name="itemId" cssClass="itemId"/>
						</td>
						<td>
						<a id="item_<s:property value='itemId'/>" href="#" style="cursor:hand;color:#000" onclick="onAddItem(this);return false;">
							<s:property value="itemName" />
						</a>
						</td>
						<td>
							<s:property value="price" />
						</td>
						<td>
							<input type="text" value="1" class="quantity" style="display:none"
							onchange="onUpdateItem(this);return false;"/>
						</td>
					</tr>
					</s:iterator>
				</table>
				</div>
				
				<div id="menuItems2" class="floatLeft">
				<table>
					<colgroup width="10%" />
					<colgroup width="55%" />
					<colgroup width="20%" />
					<colgroup width="15%" />
					<tr class="firstRow">
						<td>
						</td>
						<td>
						Item
						</td>
						<td>
						Price
						</td>
						<td>
						Qty
						</td>
					</tr>
					
					<s:iterator value="menuItemsList2[key]">
					<tr>
						<td>
						<img alt="Add Item" src="<s:url value="/images/add.png"/>" style="padding-top: 2px"
						onclick="onAddItem(this);return false;"></img>
						<img alt="Remove Item" src="<s:url value="/images/remove.png"/>"  
						onclick="onRemoveItem(this);return false;" style="display:none;padding-top: 2px"></img>
						<s:hidden name="itemId" cssClass="itemId"/>
						</td>
						<td>
						<a id="item_<s:property value='itemId'/>" href="#" style="cursor:hand;color:#000" onclick="onAddItem(this);return false;">
							<s:property value="itemName" />
						</a>
						</td>
						<td>
						<s:property value="price" />
						</td>
						<td>
							<input type="text" value="1" class="quantity" style="display:none" 
							onchange="onUpdateItem(this);return false;"/>
						</td>
					</tr>
					</s:iterator>
					
				</table>
				</div>
			</s:iterator>
			</div>
		</div>
		<div id="tabs-2">
			<div id="userReview">
			<s:iterator value="restaurant.restaurantReviews">
				<div>
					<div style="float: left;width: 30%; color:darkBlue;font-family: tahoma, verdana, arial, sans-serif;font-size: 13px;">
						<s:property value="user"/> on
						<br/>	
						<a style="color:green;text-decoration: underline;" href='<s:property value="source.website"/>' target="_blank"><s:property value="source.source"/></a>
						
					</div>
					<div style="float: right;width: 70%; font-family: tahoma, verdana, arial, sans-serif;font-size: 13px;">
						<s:property value="review"/>
					</div>
				</div>
				<div style="clear:both"/>
				<br/>
				<hr/>
			</s:iterator>	
			</div>
		</div>
		
		
	</div>
</div>
<div id="floatMenu">
	<div id="orderInfo">
		<s:include value="restaurant_cart_items.jsp"></s:include>
	</div>
	<div id="mostOrdered">
		<h3>Most Ordered</h3>
		<table id="mostOrderedItems">
		<colgroup width="90%" />
		<colgroup width="10%" />
		<s:iterator value="restaurant.mostOrderedItems">
		<tr>
			<td><s:property value="itemName"/></td>
			<td><s:property value="price"/></td>
		</tr>
		</s:iterator>
		</table>

	</div>
	
	
	
	
</div>

<div id="dialog"/>
<div class="clear:both"/>
