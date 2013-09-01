package com.eatifying.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eatifying.server.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class UserAction extends ActionSupport implements ServletResponseAware {
	/**
	 * The default serial version id for this class.
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService userService;
	String username;
	String password;
	private HttpServletResponse response;

	public String execute() {
		int loginStatus = userService.login(username, password);
		try {
			PrintWriter out = response.getWriter();
			if (loginStatus == -1)
				out.print("Invalid Login");
			else {
				// TODO:place userObject in session
				System.out.println("Logged in");
				out.print("success");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

}
