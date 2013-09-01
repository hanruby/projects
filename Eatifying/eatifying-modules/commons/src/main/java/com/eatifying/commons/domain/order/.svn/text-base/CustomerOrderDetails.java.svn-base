package com.eatifying.commons.domain.order;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class CustomerOrderDetails {

	private Long orderId;

	private int restaurantId;

	private int restaurantItemId;

	private int quantity;

	private BigDecimal amount;
	
	private transient String restaurantItemName;
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public BigDecimal getFormattedAmount() {
		return amount.setScale(2, RoundingMode.HALF_UP);
	}
	
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public int getRestaurantItemId() {
		return restaurantItemId;
	}

	public void setRestaurantItemId(int restaurantItemId) {
		this.restaurantItemId = restaurantItemId;
	}

	public String getRestaurantItemName() {
		return restaurantItemName;
	}

	public void setRestaurantItemName(String restaurantItemName) {
		this.restaurantItemName = restaurantItemName;
	}

	@Override
	public String toString() {
		return "CustomerOrderDetails [orderId=" + orderId + ", restaurantId="
				+ restaurantId + ", restuaurantItemId=" + restaurantItemId
				+ ", qunatity=" + quantity + ", amount=" + amount + "]";
	}

}
