package com.eatifying.commons.domain.restaurant;


public class RestaurantFilterOptions {
	String restaurantName;
	String foodName;
	String cusine;
	String costType;
	String rating;

	public RestaurantFilterOptions() {

	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getCusine() {
		return cusine;
	}

	public void setCusine(String cusine) {
		this.cusine = cusine;
	}

	public String getCostType() {
		return costType;
	}

	public void setCostType(String costType) {
		this.costType = costType;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

}
