package com.code.savemarks.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class SavemarksServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");

		session.setAttribute("category", "ALL");
		session.setAttribute("hierarchy", "ALL");
		session.setAttribute("tags", "ALL");
		session.setAttribute("feedtitle", "ALL");
		if (user == null) {
			String nextJSP = "/Login.jsp";
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(nextJSP);
			try {
				System.out.println(dispatcher);
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				System.out.println(e.toString());
			}
		} else {
			System.out.println("Logged In : " + user);
			String nextJSP = "/Savemarks.jsp";
			System.out.println(nextJSP);
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(nextJSP);
			List<String> categories = new ArrayList<String>();
			categories.add("ALL");
			request.setAttribute("categories", categories);
			try {
				System.out.println(dispatcher);
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		doGet(request, response);

	}
}
