package com.eatifying.commons.domain;

/**
 * Object to represent latitude and longitude
 * 
 * @author Dhass
 * 
 */
public class GeoCode {

	public double latitude;
	public double longitude;

	public GeoCode() {

	}

	public GeoCode(double latitude, double longitude) {
		super();
		this.latitude = latitude;
		this.longitude = longitude;
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

}
