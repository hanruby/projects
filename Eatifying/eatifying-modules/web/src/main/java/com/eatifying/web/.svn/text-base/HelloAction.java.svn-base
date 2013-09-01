package com.eatifying.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eatifying.commons.domain.GeoCode;
import com.eatifying.server.service.PlaceService;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class HelloAction extends ActionSupport {
	/**
	 * The default serial version id for this class.
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private PlaceService placeService;

	public String execute() {
		System.out.println("In Action : --> ");
		placeService.getRestaurants(new GeoCode(17.4411482, 78.3910691));
		
		return SUCCESS;
	}

}
