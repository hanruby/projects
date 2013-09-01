package com.eatifying.commons.domain.restaurant;

import java.util.ArrayList;
import java.util.List;

/**
 * Restaurant Class contains all details about restaurant.
 * 
 * @author Dhass
 * 
 */
public class Restaurant {
	int restaurantId;
	int restaurantAddressId;
	String restaurantName;
	String restaurantEmail;
	String restaurantPhone;

	/**
	 * object to store restaurant address coordinates
	 */
	RestaurantAddress restaurantAddress;
	/**
	 * object to store restuarant meta details
	 */
	RestaurantDetails restaurantDetails;

	RestaurantMenu restaurantMenu;

	List<RestaurantMenuItem> mostOrderedItems = new ArrayList<RestaurantMenuItem>();

	List<RestaurantReview> restaurantReviews = new ArrayList<RestaurantReview>();

	public Restaurant() {

	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public int getRestaurantAddressId() {
		return restaurantAddressId;
	}

	public void setRestaurantAddressId(int restaurantAddressId) {
		this.restaurantAddressId = restaurantAddressId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getRestaurantEmail() {
		return restaurantEmail;
	}

	public void setRestaurantEmail(String restaurantEmail) {
		this.restaurantEmail = restaurantEmail;
	}

	public String getRestaurantPhone() {
		return restaurantPhone;
	}

	public void setRestaurantPhone(String restaurantPhone) {
		this.restaurantPhone = restaurantPhone;
	}

	public RestaurantAddress getRestaurantAddress() {
		return restaurantAddress;
	}

	public void setRestaurantAddress(RestaurantAddress restaurantAddress) {
		this.restaurantAddress = restaurantAddress;
	}

	public RestaurantDetails getRestaurantDetails() {
		return restaurantDetails;
	}

	public void setRestaurantDetails(RestaurantDetails restaurantDetails) {
		this.restaurantDetails = restaurantDetails;
	}

	public RestaurantMenu getRestaurantMenu() {
		return restaurantMenu;
	}

	public void setRestaurantMenu(RestaurantMenu restaurantMenu) {
		this.restaurantMenu = restaurantMenu;
	}

	public List<RestaurantMenuItem> getMostOrderedItems() {
		return mostOrderedItems;
	}

	public void setMostOrderedItems(List<RestaurantMenuItem> mostOrderedItems) {
		this.mostOrderedItems = mostOrderedItems;
	}
	
	public List<RestaurantReview> getRestaurantReviews() {
		return restaurantReviews;
	}

	public void setRestaurantReviews(List<RestaurantReview> restaurantReviews) {
		this.restaurantReviews = restaurantReviews;
	}
}
