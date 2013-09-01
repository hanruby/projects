package com.eatifying.commons.domain.restaurant;

/**
 * This represents the min amount and min distance of delivery
 * 
 * @author Dhass
 * 
 */
public class RestaurantMinDistanceDetails {
	int restaurantMinDistId;
	int restaurantId;
	double minDistance;
	double minAmount;

	public int getRestaurantMinDistId() {
		return restaurantMinDistId;
	}

	public void setRestaurantMinDistId(int restaurantMinDistId) {
		this.restaurantMinDistId = restaurantMinDistId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restataurantId) {
		this.restaurantId = restataurantId;
	}

	public double getMinDistance() {
		return minDistance;
	}

	public void setMinDistance(double minDistance) {
		this.minDistance = minDistance;
	}

	public double getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(double minAmount) {
		this.minAmount = minAmount;
	}

}
