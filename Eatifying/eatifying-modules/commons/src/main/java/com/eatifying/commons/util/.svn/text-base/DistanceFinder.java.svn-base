package com.eatifying.commons.util;

/**
 * Utility class to do distance related calculations
 * 
 * @author Dhass
 * 
 */
public class DistanceFinder {

	/**
	 * This returns distance between two places given geocodes between two
	 * places
	 * 
	 * @param lat1
	 * @param lon1
	 * @param lat2
	 * @param lon2
	 * @return distance
	 */
	public double distance(double lat1, double lon1, double lat2, double lon2) {
		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))
				* Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		//for converting to Kms
		dist = dist * 1.609344;
		return (dist);
	}

    /**
     * This function converts decimal degrees to radians
     * @param deg
     * @return radians
     */
	public double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	/**
	 * This function converts radians to decimal degrees
	 * @param rad
	 * @return decimal degress
	 */
	public double rad2deg(double rad) {
		return (rad * 180.0 / Math.PI);
	}
}
