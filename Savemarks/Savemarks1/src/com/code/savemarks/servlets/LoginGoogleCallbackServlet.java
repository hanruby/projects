package com.code.savemarks.servlets;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.model.UserAccount;
import com.code.savemarks.service.UserService;

@SuppressWarnings("serial")
public class LoginGoogleCallbackServlet extends HttpServlet {
	private static Logger log = Logger
			.getLogger(LoginGoogleCallbackServlet.class.getName());

	UserService myUserService = new UserService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Principal googleUser = request.getUserPrincipal();
		if (googleUser != null) {
			// update or create user
			UserAccount u = new UserAccount();
			u.setUser(googleUser.getName());
			HttpSession session = request.getSession();
			session.setAttribute("user", u.getUser());
			System.out.println("User logging in : " + u.getUser());

			UserAccount userInfo = myUserService.getUser(u.getUser());

			if (userInfo == null) {
				userInfo = new UserAccount();
				userInfo.setUser(u.getUser());
				userInfo.setEmailId(u.getUser());
				userInfo.setCreatedDate(new Date());
				userInfo.setLastLoginTime(new Date());
				myUserService.addUser(userInfo);
			} else {
				userInfo.setLastLoginTime(new Date());
				myUserService.updateUser(userInfo);
			}

			String nextJSP = "/Savemarks.jsp";
			System.out.println(nextJSP);
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(nextJSP);

			try {
				System.out.println(dispatcher);
				// dispatcher.forward(request, response);
				response.sendRedirect("/");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		// response.sendRedirect(LoginHelper.getApplitionURL(request));
	}
}
