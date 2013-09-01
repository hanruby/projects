package com.eatifying.commons.domain.order;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/*
 * The PK for this table is orderId + restaurantId
 */
public class CustomerOrder {

	private Long orderId;

	private Date orderDate;

	private String userConfirmationCode = "test";

	private Integer customerUserId = 1;

	private String restaurantConfirmationCode = "test";

	private Integer restaurantId;

	private Double totalAmount;

	private int status = 0;

	private CustomerOrderDetails[] customerOrderDetails;
	
	private List<CustomerOrderDetails> customersOrderDetailsList = new ArrayList<CustomerOrderDetails>();
	
	/**
	 * This field is used while updating and deleting items from the shopping cart. This is not to be used for any
	 * other purposes such as display or persistence although this map is in-line with customersOrderDetailsList.
	 */
	private transient Map<Integer, CustomerOrderDetails> customersOrderDetailsMap = new LinkedHashMap<Integer, CustomerOrderDetails>();
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getUserConfirmationCode() {
		return userConfirmationCode;
	}

	public void setUserConfirmationCode(String userConfirmationCode) {
		this.userConfirmationCode = userConfirmationCode;
	}

	public Integer getCustomerUserId() {
		return customerUserId;
	}

	public void setCustomerUserId(Integer customerUserId) {
		this.customerUserId = customerUserId;
	}

	public String getRestaurantConfirmationCode() {
		return restaurantConfirmationCode;
	}

	public void setRestaurantConfirmationCode(String restaurantConfirmationCode) {
		this.restaurantConfirmationCode = restaurantConfirmationCode;
	}

	public Integer getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(Integer restaurantId) {
		this.restaurantId = restaurantId;
	}

	public BigDecimal getTotalAmount() {
		BigDecimal totalAmount = new BigDecimal(0.00);
		for(CustomerOrderDetails detail: getCustomersOrderDetailsList())
		{
			totalAmount = totalAmount.add(detail.getFormattedAmount());
		}
		return totalAmount;
	}
	
	public BigDecimal getFormattedTotalAmount() {
		return getTotalAmount().setScale(2, RoundingMode.HALF_UP);
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public CustomerOrderDetails[] getCustomerOrderDetails() {
		return customerOrderDetails;
	}

	public void setCustomerOrderDetails(CustomerOrderDetails[] customerOrderDetails) {
		this.customerOrderDetails = customerOrderDetails;
		System.out.println("Setting Array"); 
		setCustomersOrderDetailsList(Arrays.asList(customerOrderDetails));
	}

	public List<CustomerOrderDetails> getCustomersOrderDetailsList() {
		return new ArrayList<CustomerOrderDetails>(customersOrderDetailsMap.values());
	}

	public void setCustomersOrderDetailsList(
			List<CustomerOrderDetails> customersOrderDetailsList) {
		this.customersOrderDetailsList = customersOrderDetailsList;
	}

	public Map<Integer, CustomerOrderDetails> getCustomersOrderDetailsMap() {
		return customersOrderDetailsMap;
	}

	public void setCustomersOrderDetailsMap(
			Map<Integer, CustomerOrderDetails> customersOrderDetailsMap) {
		this.customersOrderDetailsMap = customersOrderDetailsMap;
	}

	@Override
	public String toString() {
		return "CustomerOrder [orderId=" + orderId + ", orderDate=" + orderDate
				+ ", userConfirmationCode=" + userConfirmationCode
				+ ", customerUserId=" + customerUserId
				+ ", restaurantConfirmationCode=" + restaurantConfirmationCode
				+ ", restaurantId=" + restaurantId + ", totalAmount="
				+ totalAmount + ", status=" + status
				+ ", customersOrderDetailsList=" + customersOrderDetailsList
				+ "]";
	}
}
