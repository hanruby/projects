package com.eatifying.dao;

import java.util.List;

import com.eatifying.commons.domain.restaurant.CostType;
import com.eatifying.commons.domain.restaurant.Cusine;
import com.eatifying.commons.domain.restaurant.RatingDetails;
import com.eatifying.commons.domain.restaurant.Restaurant;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItem;
import com.eatifying.commons.domain.restaurant.RestaurantMinDistanceDetails;
import com.eatifying.commons.domain.restaurant.RestaurantReview;

public interface RestaurantMapper {
	// int addRestaurant(Restaurant restaurant);

	List<Restaurant> getRestaurantsInCity(String name);

	List<Cusine> getCusineTypes();
	
	List<RatingDetails> getRatingDetails();
	
	List<CostType> getCostTypes();
	
	Restaurant getRestaurantById(int restaurantId);
	
	List<RestaurantMinDistanceDetails> getRestaurantMinAmountDetails(int restaurantId);
	
	List<RestaurantMenuItem> getMostOrderedItems(int restaurantId);

	List<RestaurantReview> getRestaurantReviews(int restaurantId);
}
