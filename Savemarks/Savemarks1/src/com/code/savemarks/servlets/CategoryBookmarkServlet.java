package com.code.savemarks.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.service.BookmarkService;

@SuppressWarnings("serial")
public class CategoryBookmarkServlet extends HttpServlet {
	BookmarkService myBookmarkService = new BookmarkService();
	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");

		if(user!=null){
		// set the category,hierarchy or tags based on selection so that while
		// retrieving data it can be shown accordingly
		String update = request.getParameter("type");
		System.out.println(update);
		if (update.equals("category")) {
			String category = request.getParameter("category");
			session.setAttribute("category", category);
		}
		if (update.equals("tags")) {
			String tags = request.getParameter("tags");
			session.setAttribute("tags", tags);
		}

		if (update.equals("hierarchy")) {
			String hierarchy = request.getParameter("hierarchy");
			session.setAttribute("hierarchy", hierarchy);
		}

		if (update.equals("feedtitle")) {
			String feedtitle = request.getParameter("feedtitle");
			session.setAttribute("feedtitle", feedtitle);
		}

		response.setContentType("text/plain");
		response.getWriter().println("SUCCESS");
		}
		else
		{
			response.setContentType("text/plain");
			response.getWriter().println("login");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doGet(request, response);
	}
}
