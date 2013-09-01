package com.code.savemarks.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.service.BookmarkService;
import com.code.savemarks.service.FeedService;
import com.code.savemarks.utils.WebsiteParser;

@SuppressWarnings("serial")
public class WebsiteDetailsServlet extends HttpServlet {
	BookmarkService myBookmarkService = new BookmarkService();
	FeedService myFeedService = new FeedService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");

		String url = request.getParameter("url");
		WebsiteParser parser = new WebsiteParser();
		String bookmark = "";
		try {
			bookmark = parser.getWebsiteDetails(url, user);
		} catch (Exception e) {
			System.out.println(e.toString());
			bookmark = " $ $ ";
		}

		if (bookmark == null)
			bookmark = " $ $ ";
		response.setContentType("text/plain");
		response.getWriter().println(bookmark);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doGet(request, response);

	}
}
