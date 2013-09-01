function getRestaurants() {
	$('#loading-image').show();
	var address = $('#address').val();
	var place = $('#place').val();
	var city = $('#city').val();
	var goBack = false;
	
	if (address == '') {
		$('#address-error').css('display' , 'block');
		goBack = true;
	}
	else {
		$('#address-error').hide();
	}
	
	if (place == '') {
		$('#place-error').css('display' , 'block');
		goBack = true;
	}
	else {
		$('#place-error').hide();
	}
	
	if( goBack == true) {
		$('#loading-image').hide();
		return;
	}
		
	var fullAddress = address + ',' + place + ',' + city;
	var geocoder;
	geocoder = new google.maps.Geocoder();
	var latitude;
	var longitude;
	geocoder.geocode({
		'address' : fullAddress
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			latitude = results[0].geometry.location.lat();
			longitude = results[0].geometry.location.lng();
			document.getElementById('latitude').value = latitude;
			document.getElementById('longitude').value = longitude;
			document.forms["addressform"].submit();
		} else {
			$('#loading-image').hide();
			alert("Geocode was not successful for the following reason: "
					+ status);
		}
	});
}

function getRestaurantById(id) {

	$.ajax({
		url : "restaurantMenu.mnd",
		type : "POST",
		data : 'restaurantId=' + encodeURIComponent(id),
		cache : false,
		success : function(message) {
			$("#ciHomeContent").html(message);
			// Goto next slide
			$(".coda-nav-right").find('a').click();
		}
	});
}
// function getRestaurantsForGeoCode(latitude,longitude){
// var content="";
// $.ajax({
// url : "listRestaurants.mnd?"+latitude,
// type :"GET",
// data : 'latitude='+encodeURIComponent(latitude)+
// '&longitude='+encodeURIComponent(longitude),
// cache :false,
// success : function(message) {
// document.getElementById("subCategory").innerHTML="";
// document.getElementById("subCategory").innerHTML=message;
// }
// });
// }
function updateItem(element) {
	var params = {};
	
	params['restaurantId'] = $('#restaurantId').val();
	params['restuarantMenuItemId'] = $(element).parents('li').find('.itemId').val();
	params['quantity'] = $(element).val();
	
	$.ajax({
		url : "editCart.mnd",
		type : "POST",
		data : params,
		cache : false,
		success : function(response) {
			// Convert response to JSON object
			var myJSONObject = eval('(' + response + ')');
			updateTwoCarts(myJSONObject);
			$('#coda-slider-1').height($('#ciHomeContent').height());
		}
	});
}

function updateTwoCarts(myJSONObject)
{
	if (typeof(myJSONObject.order) != undefined && typeof(myJSONObject.order) != 'undefined')
	{
		$('#orderDetails').html(
						$('#order-info-template').jqote(myJSONObject.order, '*'));
				
		
		$('#miniCartTablecontent tbody').html(
			$('#shopping-cart-template').jqote(myJSONObject["order"], '*'));
	}
	if (typeof(myJSONObject.totalAmount) != undefined && typeof(myJSONObject.totalAmount) != 'undefined')
	{
		$('#yfc_sub_total_mini').html('&#x20B9;' + myJSONObject["subtotal"]);
		$('#yfc_total_items_mini').html(myJSONObject["totalQuantity"] + " Item(s)");
		$('#yfc_total_footer').html('&#x20B9;' + myJSONObject["totalAmount"]);
		$('#yfc_tax_footer').html('&#x20B9;' + myJSONObject["tax"]);
		$('#yfc_sub_total_footer').html('&#x20B9;' + myJSONObject["subtotal"]);
		$('#order-total').html('&#x20B9;' + myJSONObject["totalAmount"]);
		$('#order-tax').html('&#x20B9;' + myJSONObject["tax"]);
		$('#order-subtotal').html('&#x20B9;' + myJSONObject["subtotal"]);
		
		if(myJSONObject["remainingAmount"] != 0)
		{
			$('p.ordermore').show();
			$('p.ordermore').html('Keep Ordering. You are still ' + '&#x20B9;' + '<strong>' + myJSONObject["remainingAmount"] + '</strong>' + ' away from hiting the minimum amount'
			+ ' for this order');	
			$('#updateStep3Link').hide();
			$('#mc-checkout').hide();
		}
		else
		{
			$('p.ordermore').html('Change a menu item quantity to add it to your order.');
			$('p.ordermore').hide();
			$('#updateStep3Link').show();
			$('#mc-checkout').show();
		}
		
	}	
	else
	{
		$('#yfc_sub_total_mini').html('&#x20B9;' + '0.00');
		$('#yfc_total_items_mini').html('0' + " Item(s)");
		$('#yfc_total_footer').html('&#x20B9;' + '0.00');
		$('#yfc_tax_footer').html('&#x20B9;' + '0.00');
		$('#yfc_sub_total_footer').html('&#x20B9;' + '0.00');
		$('#order-total').html('&#x20B9;' + '0.00');
		$('#order-tax').html('&#x20B9;' + '0.00');
		$('#order-subtotal').html('&#x20B9;' + '0.00');
		$('p.ordermore').show();
		$('#updateStep3Link').hide();
		$('#mc-checkout').hide();
	}
	
}	

function filterRestaurants() {
	var cusineFilterObj = $("#filterCusine").children("input:checked");
	var cusineFilterStr = getCheckBoxString(cusineFilterObj);
	var costFilterObj = $("#filterCost").children("input:checked");
	var costFilterStr = getCheckBoxString(costFilterObj);
	var ratingFilterObj = $("#filterRating").children("input:checked");
	var ratingFilterStr = getCheckBoxString(ratingFilterObj);
	var restaurantFilter = $('#restaurantNameFilter').val();
	var foodFilter = $('#foodNameFilter').val();

	var myJSONObject = {
		"restaurantName" : encodeURIComponent(restaurantFilter),
		"foodName" : encodeURIComponent(foodFilter),
		"cusine" : cusineFilterStr,
		"costType" : costFilterStr,
		"rating" : ratingFilterStr
	}

	showBusyFilterStatus();
	$.ajax({
		cache : false,
		url : "filterRestaurants.mnd",
		type : 'POST',
		data : "filter=" + JSON.stringify(myJSONObject),
		complete : function(response) {
			// clearBusyStatus('');
			clearBusyFilterStatus();
			$("#restaurantsTableDiv").html(response.responseText);
		}
	});
	return false;
}

function getCheckBoxString(arrCheckBox) {
	var str = '';
	for (i = 0; i < arrCheckBox.length; i++) {
		str = str + ',' + arrCheckBox[i].value;
	}
	str = str.substring(1, str.length);
	return str;
}

function showBusyFilterStatus() {
	$.blockUI({
		// message : 'Filtering..',
		css : {
			border : 'none',
			padding : '15px',
			backgroundColor : '#000',
			'-webkit-border-radius' : '10px',
			'-moz-border-radius' : '10px',
			opacity : .5,
			color : '#fff'
		}
	});
}

function clearBusyFilterStatus() {
	$.unblockUI();
}

function goToMenu() {
	$(".coda-nav-left").find('a').click();
}


function goToCheckout() {
	
	$.ajax({
		url : "checkout.mnd",
		type : "POST",
		cache : false,
		success : function(message) {
			$("#checkout").html(message);
			$(".coda-nav-right").find('a').click();
		}
	});
	
}


function login() {
	$("#loginForm").submit(function(e) {
		e.preventDefault();
		dataString = $("#loginForm").serialize();
		$.ajax({
			type : "POST",
			url : "userAction.mnd",
			data : dataString,
			dataType : "json",
			success : function(data) {

				if (data.reponseText == "success") {
					// set the email id as logged in
					alert('login successful');
				} else {
					// set login failed
				}
			}
		});
	});
}
