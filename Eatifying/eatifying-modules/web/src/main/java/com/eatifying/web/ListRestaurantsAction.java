package com.eatifying.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eatifying.commons.domain.GeoCode;
import com.eatifying.commons.domain.restaurant.CostType;
import com.eatifying.commons.domain.restaurant.Cusine;
import com.eatifying.commons.domain.restaurant.RatingDetails;
import com.eatifying.commons.domain.restaurant.Restaurant;
import com.eatifying.commons.domain.restaurant.RestaurantFilterOptions;
import com.eatifying.server.SessionConstants;
import com.eatifying.server.service.PlaceService;
import com.eatifying.server.service.RestaurantService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.eatifying.commons.util.*;

@Component
public class ListRestaurantsAction extends  DefaultCartAction implements ServletRequestAware{
	/**
	 * The default serial version id for this class.
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private PlaceService placeService;

	@Autowired
	private RestaurantService restaurantService;

	private HttpServletRequest request;

	private StrUtils strUtils = new StrUtils();

	/**
	 * The variables for this class.
	 */
	private double latitude;

	private double longitude;

	private int costType;
	private int rating;
	private String cusineType;

	private String filter;
	private String address;
	private String place;

	private List<Restaurant> restaurantList;
	private List<Restaurant> filteredRestaurants;
	private List<Cusine> cusineList;
	private List<RatingDetails> ratingDetailsList;
	private List<CostType> costTypeList;

	/**
	 * This method is used to display the list of restaurants
	 * for the specified address.
	 * @return
	 */
	public String listRestaurants() {
		
		HttpSession session = request.getSession(true);
		
		/*if(!DataTypes.isDefined(session.getAttribute(SessionConstants.USER_ADDRESS)))
		{
			return WebConstants.UNAUTHORIZED;
		}
		*/
		
		session.setAttribute(SessionConstants.RESTAURANT_LIST, restaurantList);
		
		System.out.println("In list action");
		System.out.println(address+","+place);
		session.setAttribute(SessionConstants.USER_ADDRESS, address+","+place);
		// get the restaurants delivering for the given address
		restaurantList = placeService.getRestaurants(new GeoCode(latitude,
				longitude));
		
		try {
			cusineList = restaurantService.getCusines();
			ratingDetailsList = restaurantService.getRatingDetails();
			costTypeList = restaurantService.getCostTypes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		super.initializeOrderJSON(request);
		return SUCCESS;
	}

	/**
	 * This method is used to filter the restaurant list displayed
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String filterRestaurants() {

		System.out.println(filter);

		Gson gson = new Gson();
		RestaurantFilterOptions filterOptions = gson.fromJson(filter,
				RestaurantFilterOptions.class);

		List<Integer> cusineList = strUtils.splitString(filterOptions
				.getCusine());
		List<Integer> costTypeList = strUtils.splitString(filterOptions
				.getCostType());
		List<Integer> ratingList = strUtils.splitString(filterOptions
				.getRating());

		HttpSession session = request.getSession(true);
		restaurantList = (List<Restaurant>) session
				.getAttribute(SessionConstants.RESTAURANT_LIST);

		filteredRestaurants = new ArrayList<Restaurant>();
		for (Restaurant restaurant : restaurantList) {

			// filter based on selected
			if ((filterOptions.getRestaurantName().equals("") || filterOptions
					.getRestaurantName().equalsIgnoreCase(
							restaurant.getRestaurantName())
					&& (filterOptions.getFoodName().equals("") || restaurantService
							.isFoodAvailableInRestaurant(
									filterOptions.getFoodName(), restaurant))
					&& (cusineList.isEmpty() || cusineList.contains(restaurant
							.getRestaurantDetails().getCusine().getCusineId())))
					&& (costTypeList.isEmpty() || costTypeList
							.contains(restaurant.getRestaurantDetails()
									.getCostType().getCostTypeId()))
					&& (ratingList.isEmpty() || ratingList.contains(restaurant
							.getRestaurantDetails().getRating().getRatingId()))) {
				filteredRestaurants.add(restaurant);
			}
		}

		return SUCCESS;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public List<Restaurant> getRestaurantList() {
		return restaurantList;
	}

	public void setRestaurantList(List<Restaurant> resturantList) {
		this.restaurantList = resturantList;
	}

	public List<Cusine> getCusineList() {
		return cusineList;
	}

	public void setCusineList(List<Cusine> cusineList) {
		this.cusineList = cusineList;
	}

	public List<RatingDetails> getRatingDetailsList() {
		return ratingDetailsList;
	}

	public void setRatingDetailsList(List<RatingDetails> ratingDetailsList) {
		this.ratingDetailsList = ratingDetailsList;
	}

	public List<CostType> getCostTypeList() {
		return costTypeList;
	}

	public void setCostTypeList(List<CostType> costTypeList) {
		this.costTypeList = costTypeList;
	}

	public int getCostType() {
		return costType;
	}

	public void setCostType(int costType) {
		this.costType = costType;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getCusineType() {
		return cusineType;
	}

	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}

	public List<Restaurant> getFilteredRestaurants() {
		return filteredRestaurants;
	}

	public void setFilteredRestaurants(List<Restaurant> filteredRestaurants) {
		this.filteredRestaurants = filteredRestaurants;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
}
