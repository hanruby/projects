package com.eatifying.server.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eatifying.commons.domain.restaurant.RestaurantMenu;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItem;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItemCategory;
import com.eatifying.dao.RestaurantMenuMapper;

@Service
public class RestaurantMenuService {

	@Autowired
	public RestaurantMenuMapper restaurantMenuMapper;

	/**
	 * get the menu of the restaurant with the items
	 * 
	 * @param restaurantId
	 * @return
	 */
	public RestaurantMenu getRestaurantMenu(int restaurantId) {
		RestaurantMenu restaurantMenu = restaurantMenuMapper
				.getRestaurantMenu(restaurantId);
		restaurantMenu.setMenuItems(getRestaurantMenuItems(restaurantId));
		restaurantMenu
				.setCategoryMenuMap(getResaurantMenuCategoryMap(restaurantMenu.getMenuItems()));
		return restaurantMenu;
	}

	public Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> getResaurantMenuCategoryMap(
			List<RestaurantMenuItem> items) {
		Map<RestaurantMenuItemCategory, List<RestaurantMenuItem>> categoryMenuMap 
					= new HashMap<RestaurantMenuItemCategory, List<RestaurantMenuItem>>();

		for (RestaurantMenuItem item : items) {
			if (categoryMenuMap.containsKey(item.getCategory())) {
				categoryMenuMap.get(item.getCategory()).add(item);
			} else {
				List<RestaurantMenuItem> itemList = new ArrayList<RestaurantMenuItem>();
				itemList.add(item);
				categoryMenuMap.put(item.getCategory(), itemList);
			}
		}
		return categoryMenuMap;
	}

	/**
	 * gets the restaurant menu items
	 * 
	 * @param restaurantId
	 * @return
	 */
	public List<RestaurantMenuItem> getRestaurantMenuItems(int restaurantId) {
		return restaurantMenuMapper.getRestaurantMenuItems(restaurantId);
	}
	
	/**
	 * Retrieves a menu item given an item id
	 */
	public RestaurantMenuItem getRestaurantMenuItemById(int itemId) {
		return restaurantMenuMapper.getRestaurantMenuItemById(itemId);
	}
	
}	

