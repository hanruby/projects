package com.eatifying.commons.domain.restaurant;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

/**
 * Represents menu item in a restuarant.
 * 
 * @author Dhass
 * 
 */
public class RestaurantMenuItem implements Comparable<RestaurantMenuItem>{
	private int restuaurantMenuId;
	
	private int itemId;
	
	private String itemName;
	
	private RestaurantMenuItemCategory category;
	
	private int sortOrder;
	
	private int cusineId;
	
	private String description;
	
	private BigDecimal price;
	
	private String tasteType;
	
	private int numberOfTimesOrdered;
	
	private int likes;
	
	public int getRestuaurantMenuId() {
		return restuaurantMenuId;
	}

	public void setRestuaurantMenuId(int restuaurantMenuId) {
		this.restuaurantMenuId = restuaurantMenuId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public RestaurantMenuItemCategory getCategory() {
		return category;
	}

	public void setCategory(RestaurantMenuItemCategory category) {
		this.category = category;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	public int getCusineId() {
		return cusineId;
	}

	public void setCusineId(int cusineId) {
		this.cusineId = cusineId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}
	
	public BigDecimal getFormattedPrice() {
		return price.setScale(2, RoundingMode.HALF_UP);
	}
	
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getTasteType() {
		return tasteType;
	}

	public void setTasteType(String tasteType) {
		this.tasteType = tasteType;
	}

	public int getNumberOfTimesOrdered() {
		return numberOfTimesOrdered;
	}

	public void setNumberOfTimesOrdered(int numberOfTimesOrdered) {
		this.numberOfTimesOrdered = numberOfTimesOrdered;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int compareTo(RestaurantMenuItem o) {
		// TODO Auto-generated method stub
		return o.getNumberOfTimesOrdered() - getNumberOfTimesOrdered();
	}

}
