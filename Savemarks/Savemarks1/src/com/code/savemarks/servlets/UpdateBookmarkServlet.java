package com.code.savemarks.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.model.Bookmark;
import com.code.savemarks.service.BookmarkService;

@SuppressWarnings("serial")
public class UpdateBookmarkServlet extends HttpServlet {
	BookmarkService myBookmarkService = new BookmarkService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		if (user != null) {
			String update = request.getParameter("update");
			String bookmarkId = request.getParameter("boomarkId");
			String status = "";
			System.out.println(update + " : " + bookmarkId);
			if (update.equals("mark")) {
				Bookmark bookmark = myBookmarkService.getBookmark(bookmarkId);
				bookmark.setMark(!bookmark.getMark());
				status = myBookmarkService.updateBookmark(bookmark);

			}

			if (update.equals("count")) {
				Bookmark bookmark = myBookmarkService.getBookmark(bookmarkId);
				bookmark.setUsed(bookmark.getUsed() + 1);
				status = myBookmarkService.updateBookmark(bookmark);

			}
			response.setContentType("text/plain");
			response.getWriter().println(status);
		} else {
			response.setContentType("text/plain");
			response.getWriter().println("login");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doGet(request, response);
	}
}
