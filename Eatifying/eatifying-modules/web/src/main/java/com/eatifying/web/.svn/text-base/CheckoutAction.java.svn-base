package com.eatifying.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Component;

@Component
public class CheckoutAction extends DefaultCartAction implements ServletRequestAware, ServletResponseAware{
	
	/**
	 * The default serial version UID for this class
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;

	private HttpServletResponse response;
	
	public String execute() {
		// Check if user is already logged in. Is so, use them here.
		super.initializeOrderJSON(request);
		
		return SUCCESS;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
