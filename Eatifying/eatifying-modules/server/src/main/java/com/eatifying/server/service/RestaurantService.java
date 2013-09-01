package com.eatifying.server.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eatifying.commons.domain.restaurant.CostType;
import com.eatifying.commons.domain.restaurant.Cusine;
import com.eatifying.commons.domain.restaurant.RatingDetails;
import com.eatifying.commons.domain.restaurant.Restaurant;
import com.eatifying.commons.domain.restaurant.RestaurantAddress;
import com.eatifying.commons.domain.restaurant.RestaurantMenu;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItem;
import com.eatifying.commons.domain.restaurant.RestaurantMinDistanceDetails;
import com.eatifying.commons.domain.restaurant.RestaurantReview;
import com.eatifying.dao.RestaurantMapper;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;

	@Autowired
	private RestaurantMenuService restaurantMenuService;

	public int addRestaurant() {
		return -1;
	}

	public void addRestaurantTest() {
		RestaurantAddress restaurantAddress = new RestaurantAddress();
		restaurantAddress.setAddressLine1("Plot No.1-99/14/A Madhina Plaza");
		restaurantAddress.setAddressLine2("");
		restaurantAddress.setPlace("madhapur");
		restaurantAddress.setPlace("Hyderabad");
		restaurantAddress.setZipcode("500081");
		restaurantAddress.setLatitude(new Double(17.4481290));
		restaurantAddress.setLongitude(new Double(78.3921719));
		Restaurant restaurant = new Restaurant();
	}

	/**
	 * method to return the type of cusines
	 * 
	 * @return cusines
	 */
	public List<Cusine> getCusines() throws Exception {
		return restaurantMapper.getCusineTypes();
	}

	/**
	 * method to return the cost types
	 * 
	 * @return CostType
	 */
	public List<CostType> getCostTypes() throws Exception {
		return restaurantMapper.getCostTypes();
	}

	/**
	 * method to return the type of ratings given by users
	 * 
	 * @return RatingDetails
	 */
	public List<RatingDetails> getRatingDetails() throws Exception {
		return restaurantMapper.getRatingDetails();
	}

	/**
	 * method to get the restaurant by restaurant id.
	 * 
	 * @param restaurantId
	 * @return
	 */
	public Restaurant getRestaurantById(int restaurantId) throws Exception {
		Restaurant restaurant = restaurantMapper
				.getRestaurantById(restaurantId);

		// set the menu in the restaurant Object
		restaurant.setRestaurantMenu(restaurantMenuService
				.getRestaurantMenu(restaurantId));
		restaurant.setMostOrderedItems(getMostOrderedItems(restaurant.getRestaurantMenu()));
		restaurant.setRestaurantReviews(getRestaurantReviews(restaurantId));
		System.out.println("The reviews for this restaurant are : ");
		/*for(RestaurantReview review : restaurant.getRestaurantReviews())
		{
			System.out.println(review.toString());
		}*/
		return restaurant;
	}

	/**
	 * get cusine Id for cusine Name
	 * 
	 * @param cusineName
	 * @param cusineList
	 * @return
	 */
	public Integer getCusineId(String cusineName, List<Cusine> cusineList) {
		for (Cusine cusine : cusineList) {
			if (cusine.getCusineName().equalsIgnoreCase(cusineName))
				return cusine.getCusineId();
		}
		return -1;
	}

	/**
	 * Searches for a food item in a restaurant
	 * 
	 * @param food
	 * @param restaurant
	 * @return
	 */
	public boolean isFoodAvailableInRestaurant(String food,
			Restaurant restaurant) {
		List<RestaurantMenuItem> restaurantMenuItemList = restaurant
				.getRestaurantMenu().getMenuItems();
		for (RestaurantMenuItem restaurantMenuItem : restaurantMenuItemList) {
			if (restaurantMenuItem.getItemName().contains(food))
				return true;
		}
		return false;
	}

	/**
	 * Gets the restaurant minimum distance amount map details. 
	 * @param restaurantId
	 * @return
	 */
	public List<RestaurantMinDistanceDetails> getRestaurantMinAmountDetails(
			int restaurantId) {
		List<RestaurantMinDistanceDetails> restaurantMinDistanceDetails = restaurantMapper
				.getRestaurantMinAmountDetails(restaurantId);
		return restaurantMinDistanceDetails;
	}
	
	/**
	 * Retrieves the most ordered items goven a restaurant id
	 */
	private List<RestaurantMenuItem> getMostOrderedItems(RestaurantMenu menu) {
		List<RestaurantMenuItem> mostOrderedItemsList = new ArrayList<RestaurantMenuItem>(menu.getMenuItems());
		Collections.sort(mostOrderedItemsList);
		return mostOrderedItemsList;
	}
	
	private List<RestaurantReview> getRestaurantReviews(int restaurantId) {
		return restaurantMapper.getRestaurantReviews(restaurantId);
	}
}
