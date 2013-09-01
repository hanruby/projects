package com.code.savemarks.servlets;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.model.Bookmark;
import com.code.savemarks.model.Category;
import com.code.savemarks.model.FeedInfo;
import com.code.savemarks.model.StreamInfo;
import com.code.savemarks.service.BookmarkService;
import com.code.savemarks.service.FeedService;
import com.code.savemarks.utils.UrlFetcher;
import com.code.savemarks.utils.Utils;
import com.google.appengine.repackaged.org.json.JSONException;
import com.google.appengine.repackaged.org.json.JSONObject;

@SuppressWarnings("serial")
public class AddBookmarkServlet extends HttpServlet {

	private static final Logger log = Logger.getLogger(Utils.class.getName());

	BookmarkService myBookmarkService = new BookmarkService();
	FeedService myFeedService = new FeedService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		
		if (user != null) {

			Bookmark bookmarks = new Bookmark();
			String bookmarkId = "";

			JSONObject bookmarkJson = null;
			try {
				bookmarkJson = new JSONObject(
						request.getParameter("boomarkData"));
				System.out.println(bookmarkJson.toString());
				log.info(bookmarkJson.toString());
				
				if (bookmarkJson.has("Name")) {
					String bookmarkName = bookmarkJson.getString("Name");
					bookmarks.setName(bookmarkName.trim());
				}

				if (bookmarkJson.has("Url")) {
					String url = bookmarkJson.getString("Url");
					if (url.startsWith("http")) {
						bookmarks.setUrls(url);

					} else {
						url = "http://" + url;
						bookmarks.setUrls(url);
					}
				}
				if (bookmarkJson.has("Tags")) {
					String tags = bookmarkJson.getString("Tags");
					bookmarks.setTags(tags.trim());

				}
				if (bookmarkJson.has("Hierarchy")) {
					String hierarchy = bookmarkJson.getString("Hierarchy");
					bookmarks.setHierarchy(hierarchy.trim());

				}
				if (bookmarkJson.has("Category")) {
					String category = bookmarkJson.getString("Category").trim();
					Category categoryOb = new Category();
					if (category == null || "".equals(category))
						category = "Bookmark";
					String firstLetter = category.substring(0, 1).toUpperCase();
					String categoryVal = firstLetter
							+ category.substring(1, category.length());
					categoryOb.setCategoryName(categoryVal);
					categoryOb.setUser(user);
					myBookmarkService.addCategory(categoryOb);
					bookmarks.setCategory(categoryVal);
				}

				UrlFetcher fetch = new UrlFetcher();
				try {
					String siteResponse = fetch.get(bookmarks.getUrls());
					bookmarks.setIsAlive(true);
				} catch (Exception e) {
					bookmarks.setIsAlive(false);
				}
				if (bookmarkJson.has("BookmarkId")) {
					bookmarkId = bookmarkJson.getString("BookmarkId");
				}
				bookmarks.setUser(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e.toString());
			}
			bookmarks.setCreatedDate(new Date());
			String status = "";
			try {
				if (bookmarkId.equals("")) {
					if (bookmarks.getName() == null
							|| "".equals(bookmarks.getName()))
						bookmarks.setName(bookmarks.getUrls());
					if (bookmarks.getTags() == null
							|| "".equals(bookmarks.getTags()))
						bookmarks.setTags("tags");
					if (bookmarks.getCategory() == null
							|| "".equals(bookmarks.getCategory()))
						bookmarks.setCategory("Bookmark");
					if (bookmarks.getHierarchy() == null
							|| "".equals(bookmarks.getHierarchy()))
						bookmarks.setHierarchy(bookmarks.getCategory() + ","
								+ bookmarks.getName());
					Bookmark addedBookmark = myBookmarkService
							.addBookMark(bookmarks);
					if (addedBookmark == null)
						status = "failed-Bookmark not added.";
					else {
						status = "success-Bookmark added.";
					}
					List<StreamInfo> feed = myFeedService.getFeeds(bookmarks
							.getUrls());
					if (feed != null) {
						FeedInfo newFeed = new FeedInfo();
						newFeed.setUser(user);
						newFeed.setCategory(bookmarks.getCategory());
						newFeed.setFeedUrl(bookmarks.getUrls());
						newFeed.setCreatedDate(bookmarks.getCreatedDate());
						newFeed.setAlive(true);
						newFeed.setName(feed.get(0).getFeedTitle());
						newFeed.setTags(bookmarks.getTags());
						newFeed.setBookmarkId(addedBookmark.getId());
						newFeed.setHierarchy(bookmarks.getHierarchy());
						String feedStatus = myFeedService.addFeeds(newFeed);
						if ("failed".equals(feedStatus)) {
							if (status.contains("failed")) {
								status = status + "Feed not added.";
							} else
								status = "failed-" + status + "Feed not added.";
						} else
							status = status + " Feed added.";
					}
				} else {
					bookmarks.setId(bookmarkId);
					Bookmark myBookmark = myBookmarkService
							.getBookmark(bookmarkId);
					String category = myBookmark.getCategory();
					String updateStatus = myBookmarkService
							.updateBookmark(bookmarks);
					if ("success".equals(updateStatus))
						status = "success-Bookmark updated.";
					else
						status = "failed-Bookmark not updated.";
					myBookmarkService.checkCategory(user, category);

					// check whether it is a feed Url
					List<StreamInfo> feed = myFeedService.getFeeds(bookmarks
							.getUrls());
					if (feed != null) {

						// update feedInfo data since bookmark is updated
						FeedInfo newFeed = myFeedService
								.getFeedInfoForBookmarkId(bookmarks.getId());
						newFeed.setCategory(bookmarks.getCategory());
						newFeed.setFeedUrl(bookmarks.getUrls());
						newFeed.setCreatedDate(bookmarks.getCreatedDate());
						newFeed.setAlive(true);
						newFeed.setTags(bookmarks.getTags());
						newFeed.setBookmarkId(bookmarks.getId());
						String updateFeedStatus = myFeedService
								.updateFeedInfo(newFeed);
						if ("success".equals(updateFeedStatus))
							status = status + "Feed updated.";
						else {
							if (status.contains("failed")) {
								status = "failed-" + status
										+ "Feed not updated";
							} else {
								status = status + "Feed not updated";
							}

						}
						myBookmarkService.checkCategory(user, category);
					}
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				status = "failed-Error Occured.";
			}
			log.info(status);
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
