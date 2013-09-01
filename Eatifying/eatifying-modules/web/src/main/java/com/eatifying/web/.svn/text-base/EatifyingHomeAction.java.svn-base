package com.eatifying.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Component;

@Component
public class EatifyingHomeAction extends DefaultCartAction implements ServletRequestAware{
	/**
	 * The default serial version id for this class.
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	
	private static Log log = LogFactory.getLog(EatifyingHomeAction.class);

	public String execute() {
		System.out.println("In Action");
		log.debug("In Action");
		super.initializeOrderJSON(request);
		
		return SUCCESS;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
