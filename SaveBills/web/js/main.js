function showAddBill() {
	$.ajax({
		cache : false,
		url : "/showAddBill",
		type : 'GET',
		data : "",
		complete : function(response) {
			$("#addBill").html(response.responseText);
			$('#addBill').modal('show');
		}
	});
}

function submitAddBill() {
	alert('submit');
	document.forms['addBillForm'].submit();
}