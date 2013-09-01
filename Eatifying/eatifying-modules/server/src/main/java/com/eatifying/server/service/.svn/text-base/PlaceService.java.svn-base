package com.eatifying.server.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eatifying.commons.domain.GeoCode;
import com.eatifying.commons.domain.restaurant.Restaurant;
import com.eatifying.commons.domain.restaurant.RestaurantMinDistanceDetails;
import com.eatifying.commons.util.DistanceFinder;
import com.eatifying.dao.RestaurantMapper;

@Service
public class PlaceService {
	// http://maps.googleapis.com/maps/api/geocode/json?address=plot%20no:1071,Sri%20Ayappa%20Society,Madhapur,Hyderabad&sensor=false

	@Autowired
	private RestaurantMapper restaurantMapper;

	private DistanceFinder distanceFinder = new DistanceFinder();

	@Autowired
	private RestaurantService restaurantService;

	/**
	 * method to get the restaurant which delivers from a given location
	 * 
	 * @param geocode
	 * @return
	 */
	public List<Restaurant> getRestaurants(GeoCode geocode) {
		// TODO:change it to take it from database.
		List<Restaurant> cityRestaurantList = restaurantMapper
				.getRestaurantsInCity("hyderabad");

		List<Restaurant> restaurantList = new ArrayList<Restaurant>();

		for (Restaurant restaurant : cityRestaurantList) {
			double d = distanceFinder.distance(geocode.getLatitude(), geocode
					.getLongitude(), restaurant.getRestaurantAddress()
					.getLatitude(), restaurant.getRestaurantAddress()
					.getLongitude());

			// get the minimum distance amount map.
			List<RestaurantMinDistanceDetails> restaurantMinDistanceDetailsList = restaurantService
					.getRestaurantMinAmountDetails(restaurant.getRestaurantId());

			for (RestaurantMinDistanceDetails restaurantMinDisDetail : restaurantMinDistanceDetailsList) {
				if (d <= restaurantMinDisDetail.getMinDistance()) {
					// rounding to two decimal and adding to the
					// restaurantDetails
					restaurant.getRestaurantDetails().setDistance(
							Math.round(d * 100.0) / 100.0);
					restaurantList.add(restaurant);
				}
			}
		}
		return restaurantList;

	}

	/**
	 * gets minimum amount to for delivery for a restaurant to a given
	 * address(GeoCode)
	 * 
	 * @param restaurantId
	 * @param geocode
	 * @return
	 * @throws Exception
	 */
	public double getMinAmtForAddressAndRestaurant(int restaurantId,
			GeoCode geocode) throws Exception {
		List<RestaurantMinDistanceDetails> restaurantMinDistanceDetails = restaurantService
				.getRestaurantMinAmountDetails(restaurantId);
		Restaurant restaurant = restaurantService
				.getRestaurantById(restaurantId);
		double d = distanceFinder.distance(geocode.getLatitude(), geocode
				.getLongitude(), restaurant.getRestaurantAddress()
				.getLatitude(), restaurant.getRestaurantAddress()
				.getLongitude());
		for (RestaurantMinDistanceDetails restaurantMinDisDetail : restaurantMinDistanceDetails)
			if (d <= restaurantMinDisDetail.getMinDistance())
				return restaurantMinDisDetail.getMinAmount();
		return (double) 0.0;
	}
}
