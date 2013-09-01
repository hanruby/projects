<%@taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	// Handle to slider object
	var slider;
	
	$(document).ready(function() {
		var myJSONObject = '<s:property value="userOrder" escape="false"/>';
		myJSONObject = (eval('(' + myJSONObject + ')'));
		
		if (typeof(myJSONObject.order) != undefined && typeof(myJSONObject.order) != 'undefined')
		{
			$('#checkout-table tbody').html(
			$('#checkout-template').jqote(myJSONObject["order"], '*'));
			$('#checkout-total').html('&#x20B9;' + myJSONObject["totalAmount"]);
			$('#checkout-tax').html('&#x20B9;' + myJSONObject["tax"]);
			$('#checkout-subtotal').html('&#x20B9;' + myJSONObject["subtotal"]);
		
		}
	});
</script>

<script type="text/x-jqote-template" id="checkout-template">
		<![CDATA[
		  <tr>
			<td colspan="3">
			  <hr style="height: 1px; width:100%; color: #DDDDDD;" />
			</td>
		  </tr>

		  <tr>
			<td align="left" valign="top">
			<*= this.restaurantItemName *>
			</td>

			<td align="center" valign="top">
			<*= this.quantity *>
			</td>

			<td align="right" valign="top">&#x20B9;<*= this.amount *>
			</td>
		  </tr>
		]]>
</script>
		
  <div id="ciHomeContentlhs">
    <div class="first left eightcol">
      <input type="hidden" value="Checkout" id="whereAmI" />

      <!--form id="checkoutForm" action="/Food-Delivery/checkoutorder.m" method="post"
      autocomplete="off" name="checkoutForm"-->
        <input type="hidden" name="checkoutVendorLocationId" value="18836" />
        
        <div class="whatnow">
          <h5>Review &amp; Submit Your Order</h5>

          <p><a href="#" onclick="openSignInDialog();return false;">Log in to retrieve your account information</a>. If this
          is your first order, just <a href="#" onclick="openJoinDialog();return false;">click here to create your account</a> and process
          your order.</p><!--ul id="DeliveryNotes">
                    <li class="ready-time">
                        Delivery
                        estimate from
                        810 Deli Cafe: <strong>
                            30-45
                            min.</strong></li>
                    
                    
                    
                </ul-->

          <table width="100%" cellpadding="4" cellspacing="0" border="0" style=
          "border-style: solid; border-width: 1px; border-color: #444444;">
            <tbody>
              <tr>
                <td align="left" valign="top">
                  <table width="100%" cellpadding="2" cellspacing="0" border="0" id="checkout-table">
                    <thead style="background: #057CA6;">
                      <tr>
                        <td align="left" valign="middle"><b>Item(s)</b></td>

                        <td align="center" valign="middle"><b>Qty</b></td>

                        <td align="right" valign="middle"><b>Price</b></td>
                      </tr>
					</thead>
					<tbody style="font-size:12px">
					</tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
		  <a href="#" onclick="" class="color-button"><strong>Confirm Order</strong></a>	
		
		</div>
      <!--/form-->
    </div><!--sideBar-->
  </div>

  <div id="ciHomeContentrhs">
    <div style="border: 1px silver solid;width:92%;padding:10px">
      <div id="OrderInformationAjaxArea">
        <input id="IsAtLeastRecognized" type="hidden" value="False" />

        <div class="orderInfo"></div>

        <h5 class="order" id="orderInformation">Order Information</h5>

        <form id="orderInformationForm" name="orderInformationForm">
          <input type="hidden" name="returnUrl" id="returnUrl" value=
          "/food-delivery/Famous-Original-Rays-Pizza-54th-Bdway-New-York-City.3355.r" />

          <table cellpadding="0" cellspacing="0" border="0">
            <colgroup>
              <col class="maincol" />
              <col class="sidecol" />
            </colgroup>

            <tbody>
              <tr id="addressDisplay">
                <td class="main">Your order will be delivered to the Address<br />
                <strong>116 TERRENCE HATTON WAY</strong></td>
                <!--td><a id="addressEditLink">Edit</a></td-->
              </tr>
            </tbody>
          </table>
        </form><!--h3>This order will be delivered.<br />
                                <a href="#" id="ChangeDeliveryType" rel="P">Change it to pickup</a>
                        </h3-->
      </div><!-- Ajax Order Totals Area -->

      <div id="orderTotalsAjaxArea">
        <table border="0" cellpadding="0" cellspacing="0" class="width:100%">
          <colgroup>
            <col class="maincol" />
            <col class="sidecol" />
          </colgroup>

          <tbody>
            <tr>
              <td class="main">Total:</td>
			  <td class="text-right" id="checkout-total">0.00</td>
            </tr>

            <tr class="noline">
              <td class="main">Tax:</td>

              <td class="text-right" id="checkout-tax">0.00</td>
            </tr>

            <tr class="subtotal">
              <td class="main">Subtotal:</td>

              <td class="text-right" id="checkout-subtotal">0.00</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
