package com.eatifying.commons.domain.restaurant;

/**
 * This class represents a user review which are sourced from
 * Zomato and Burrp.
 * @author narayan
 *
 */
public class RestaurantReview {
	
	private Integer id;
	
	private String review;
	
	private ReviewSource source;
	
	private String user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public ReviewSource getSource() {
		return source;
	}

	public void setSource(ReviewSource source) {
		this.source = source;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "RestaurantReview [id=" + id + ", review=" + review + ", user="
				+ user + "]";
	}
	
	
}
