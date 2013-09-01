<%@taglib uri="/struts-tags" prefix="s"%>
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
	<s:iterator value="filteredRestaurants">
		<tr>
			<td><a href="#"
				onclick="getRestaurantById('<s:property value="restaurantId"/>');return false;">
					<s:property value="restaurantName" /> </a> <br> <s:property
					value="restaurantAddress.addressLine1" /> , <s:property
					value="restaurantPhone" /></td>
			<td><s:property value="restaurantDetails.costType" /></td>
			<td><s:property value="restaurantDetails.rating" /></td>
			<td><s:property value="restaurantDetails.distance" /></td>
			<td><s:property value="restaurantDetails.deliveryTime" /></td>
		</tr>
	</s:iterator>
</table>