package com.eatifying.commons.domain.restaurant;

import com.eatifying.commons.domain.GeoCode;
import com.eatifying.commons.util.DataTypes;

public class RestaurantAddress {
	int restaurantAddressId;
	String addressLine1;
	String addressLine2;
	String place;
	String city;
	String zipcode;
	String directions;
	Double latitude;
	Double longitude;
	GeoCode geoCode;

	public RestaurantAddress() {
	}

	public int getRestaurantAddressId() {
		return restaurantAddressId;
	}

	public void setRestaurantAddressId(int restaurantAddressId) {
		this.restaurantAddressId = restaurantAddressId;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getDirections() {
		return directions;
	}

	public void setDirections(String directions) {
		this.directions = directions;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public GeoCode getGeoCode() {
		return geoCode;
	}

	public void setGeoCode() {
		this.geoCode = new GeoCode();
		this.geoCode.latitude = this.latitude;
		this.geoCode.longitude = this.longitude;
	}
	
	public String getFullAddressHTML() {
		String fullAddress = (DataTypes.isDefined(addressLine1)? addressLine1: "") +  " " + 
							 (DataTypes.isDefined(addressLine2)? addressLine2: "") +  "<br/>" + 
							 (DataTypes.isDefined(place)? place.toUpperCase(): "<br/>") + 
							 (DataTypes.isDefined(city)? city.toUpperCase(): " ") + 
							 (DataTypes.isDefined(zipcode)? zipcode: "");
		
		return fullAddress; 
				
		
	}

}
