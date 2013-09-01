package com.code.savemarks.servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.savemarks.model.Bookmark;
import com.code.savemarks.service.BookmarkService;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


@SuppressWarnings("serial")
public class LoginGoogleServlet extends LoginSuperServlet{

	String user;
	  private static Logger log = Logger.getLogger(LoginGoogleServlet.class
		      .getName());
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/plain");
		response.getWriter().println("Hello!!");
	    String callbackURL = buildCallBackURL(request, 1);
	    UserService userService = UserServiceFactory.getUserService();
	    String googleLoginUrl = userService.createLoginURL(callbackURL);
	    log.info("Going to Google login URL: " + googleLoginUrl);
	    response.sendRedirect(googleLoginUrl);
	    }



	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doGet(request, response);

	}
}
