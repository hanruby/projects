package com.eatifying.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eatifying.commons.domain.restaurant.Restaurant;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItem;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItemCategory;
import com.eatifying.server.service.RestaurantService;

@Component
public class RestaurantMenuAction extends DefaultCartAction implements ServletRequestAware{

	/**
	 * The default serial version id for this class
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private RestaurantService restaurantService;

	private int restaurantId;

	private Restaurant restaurant;

	// The following two list are used specially for two column display
	private Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> menuItemsList1 = new HashMap<RestaurantMenuItemCategory, List<RestaurantMenuItem>>();

	private Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> menuItemsList2 = new HashMap<RestaurantMenuItemCategory, List<RestaurantMenuItem>>();

	private HttpServletRequest request;
	
	/**
	 * This method is used to display the menu for the selected restaurant
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String execute() {

		System.out.println("In restaurant menu action");
		// get the restaurants delivering for the given address
		try {
			restaurant = restaurantService.getRestaurantById(restaurantId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(restaurant.getRestaurantName());

		// Populate the two lists for display
		for (RestaurantMenuItemCategory category : restaurant
				.getRestaurantMenu().getCategoryMenuMap().keySet()) {
			List<RestaurantMenuItem> list1 = new ArrayList<RestaurantMenuItem>();
			List<RestaurantMenuItem> list2 = new ArrayList<RestaurantMenuItem>();

			int index = 1;
			for (RestaurantMenuItem item : restaurant.getRestaurantMenu().getCategoryMenuMap().get(category)) 
			{
				if (index % 2 == 0) {
					list1.add(item);
				} else {
					list2.add(item);
				}
				index++;
			}
			menuItemsList1.put(category, list1);
			menuItemsList2.put(category, list2);
		}
		
		// TODO : Change this
		// Setting minimum amount for delivery. This should come from service method
		super.initializeOrderJSON(request);
		
		return SUCCESS;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> getMenuItemsList1() {
		return menuItemsList1;
	}

	public void setMenuItemsList1(
			Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> menuItemsList1) {
		this.menuItemsList1 = menuItemsList1;
	}

	public Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> getMenuItemsList2() {
		return menuItemsList2;
	}

	public void setMenuItemsList2(
			Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> menuItemsList2) {
		this.menuItemsList2 = menuItemsList2;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
