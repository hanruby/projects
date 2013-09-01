<%@taglib uri="/struts-tags" prefix="s"%>
<div id="basketTitleWrap">
	<h3>Your Basket </h3><div id="jSuccess1" style="opacity: 0">Item added to cart</div>
</div>
<s:if test="detailsList.size > 0">
	<s:if test="remainingAmount > 0">
	<p class="ordermore">Keep on clicking, you're <strong><s:property value="remainingAmount"/></strong> away from hitting the delivery minimum!</p>	
	</s:if>
</s:if>
<div id="info">
	<s:iterator value="detailsList">
	<dl id="basket_<s:property value="restaurantItemId"/>">
	<dd class="first">
	<ul>
		<li><s:property value="quantity"/></li>
	</ul>
	</dd>
	<dd class="second">
	<ul>
		<li>*</li>
	</ul>
	</dd>
	<dd class="third">
	<ul>
		<li><s:property value="restaurantItemName"/></li>
	</ul>
	</dd>
	<dd class="fourth">
	<ul>
		<li><s:property value="amount"/></li>
	</ul>
	</dd>
	</dl>
	</s:iterator>
</div>
		
<s:if test="detailsList.size > 0">
	<p style="font-weight:bold;font-size:13px">Total<span style="float:right"><s:property value="totalAmount"/></span></p>
	
</s:if>
<s:if test="remainingAmount == 0">
	<div class="clearfix check">
		<a href="#" style="cursor:hand" onclick="shopMore();return false;">
		  <img src="<s:url value="/images/shop-more.png"/>" onclick="goToMenu(this);return false;">
		</a>
		<a href="#" style="cursor:hand;float:right" onclick="checkout();return false;">
		  <img src="<s:url value="/images/checkout.png"/>" onclick="goToCheckout(this);return false;">
		</a>
	</div>
</s:if>