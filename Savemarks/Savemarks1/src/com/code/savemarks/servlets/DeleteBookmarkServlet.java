package com.code.savemarks.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.service.BookmarkService;
import com.code.savemarks.service.FeedService;

@SuppressWarnings("serial")
public class DeleteBookmarkServlet extends HttpServlet {

	BookmarkService myBookmarkService = new BookmarkService();
	FeedService myFeedService = new FeedService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");

		if(user!=null){
		String bookmarkId = request.getParameter("boomarkId");

		String status = "";
		try {
			String deleteStatus = myBookmarkService.deleteBookmark(user,
					bookmarkId);
			if ("success".equals(deleteStatus))
				status = "success-Bookmark deleted.";
			String FeedStatus = myFeedService.deleteBookmark(bookmarkId);
			if ("success".equals(FeedStatus))
				status = status + "Feed Deleted.";
		} catch (Exception e) {
			status = "failed-Error Occured.";
		}
		if (status.equals(""))
			status = "failed-Error occured.";
		System.out.println(status);
		response.setContentType("text/plain");
		response.getWriter().println(status);
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
