package com.code.savemarks.service;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.Transactional;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import com.code.savemarks.model.FeedInfo;
import com.code.savemarks.model.StreamInfo;
import com.code.savemarks.utils.PMF;
import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndImage;
import com.sun.syndication.feed.synd.SyndLink;
import com.sun.syndication.feed.synd.SyndPerson;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

/**
 * Bookmarkservice provides methods to add,update,delete bookmarks and its
 * categories
 * 
 * @author Dhass
 * 
 */
public class FeedService {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	public List<StreamInfo> getFeeds(FeedInfo feed) throws IOException {

		List<StreamInfo> feeds = new ArrayList<StreamInfo>();
		URL urlConnection = new URL(feed.getFeedUrl());
		XmlReader reader = null;

		try {
			reader = new XmlReader(urlConnection);
			SyndFeed sf = new SyndFeedInput().build(reader);

			List<SyndEntry> feedList = sf.getEntries();
			for (SyndEntry entry : feedList) {

				String title = "", url = "", description = "", feedDescription = "", feedTitle = "", author = "", imageUrl = "";
				Date date = null;
				String descr = null;

				try {
					// gather all the information.....
					url = entry.getLink();
					date = entry.getPublishedDate();

					feedTitle = sf.getTitle();

					feedDescription = sf.getDescription();
					title = Jsoup.clean(entry.getTitle(),
							Whitelist.simpleText());
					// for twitter, first remove the leading author string
					if (url.contains("twitter.com")) {
						int cindex = title.indexOf(":");
						if (cindex > 0) {
							title = title.substring(cindex + 1);
						}
					}
					if (entry.getDescription() != null) {
						descr = entry.getDescription().getValue();
					}
					if (descr == null) {
						if (entry.getContents().size() > 0) {
							SyndContent content = (SyndContent) entry
									.getContents().get(0);
							if (content.getType().equalsIgnoreCase("html")) {
								descr = content.getValue();
							}
						}
					}
					if (descr != null) {
						// sanitize the content
						description = Jsoup.clean(descr,
								Whitelist.basicWithImages());
					}

					List<SyndPerson> sauthors = entry.getAuthors();
					List<String> auths = new ArrayList<String>();
					for (SyndPerson auth : sauthors) {
						auths.add(auth.getName());
					}
					author = auths.toString();
					SyndImage eImg = sf.getImage();
					if (eImg != null) {
						imageUrl = eImg.getUrl();
					} else {
						// if twitter link...
						if (url.contains("twitter.com")) {
							// then see if a second link is available-- if so,
							// it should be the link to the image
							List<SyndLink> links = entry.getLinks();
							if (links.size() >= 2) {
								SyndLink imgl = links.get(1);
								imageUrl = imgl.getHref();
							}
						}
					}
					System.out
							.println("--------------------------------------");
					System.out.println("Title : " + title);

					System.out.println("description : "
							+ buildDescrSummary(description));

					System.out.println("feedDescription : "
							+ description.length());
					System.out.println("feedDescription : " + feedDescription);
					System.out.println("date : " + date);
					System.out.println("feedTitle : " + feedTitle);
					System.out.println("author : " + author);
					System.out.println("url : " + url);
					System.out.println("imageUrl : " + imageUrl);

					StreamInfo feedStream = new StreamInfo();
					feedStream.setAuthor(author);
					feedStream.setDescription(buildDescrSummary(description));
					feedStream.setFeedDescription(feedDescription);
					feedStream.setFeedTitle(feedTitle);
					feedStream.setImageUrl(imageUrl);
					feedStream.setPublishedDate(date);
					feedStream.setTitle(title);
					feedStream.setUrl(url);
					feedStream.setCategory(feed.getCategory());
					feedStream.setTags(feed.getTags());
					feedStream.setHierarchy(feed.getHierarchy());
					feeds.add(feedStream);

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Not a feed!!");
			return null;
		} finally {
			if (reader != null)
				reader.close();
		}
		return feeds;
	}

	@SuppressWarnings("unchecked")
	public List<StreamInfo> getFeeds(String feedUrl) throws IOException {

		List<StreamInfo> feeds = new ArrayList<StreamInfo>();
		URL urlConnection = new URL(feedUrl);
		XmlReader reader = null;

		try {
			reader = new XmlReader(urlConnection);
			SyndFeed sf = new SyndFeedInput().build(reader);

			List<SyndEntry> feedList = sf.getEntries();
			for (SyndEntry entry : feedList) {

				String title = "", url = "", description = "", feedDescription = "", feedTitle = "", author = "", imageUrl = "";
				Date date = null;
				String descr = null;

				try {
					// gather all the information.....
					url = entry.getLink();
					date = entry.getPublishedDate();
					feedTitle = sf.getTitle();
					feedDescription = sf.getDescription();
					title = Jsoup.clean(entry.getTitle(),
							Whitelist.simpleText());
					// for twitter, first remove the leading author string
					if (url.contains("twitter.com")) {
						int cindex = title.indexOf(":");
						if (cindex > 0) {
							title = title.substring(cindex + 1);
						}
					}
					if (entry.getDescription() != null) {
						descr = entry.getDescription().getValue();
					}
					if (descr == null) {
						if (entry.getContents().size() > 0) {
							SyndContent content = (SyndContent) entry
									.getContents().get(0);
							if (content.getType().equalsIgnoreCase("html")) {
								descr = content.getValue();
							}
						}
					}
					if (descr != null) {
						// sanitize the content
						description = Jsoup.clean(descr,
								Whitelist.basicWithImages());
					}

					List<SyndPerson> sauthors = entry.getAuthors();
					List<String> auths = new ArrayList<String>();
					for (SyndPerson auth : sauthors) {
						auths.add(auth.getName());
					}
					author = auths.toString();
					SyndImage eImg = sf.getImage();
					if (eImg != null) {
						imageUrl = eImg.getUrl();
					} else {
						// if twitter link...
						if (url.contains("twitter.com")) {
							// then see if a second link is available-- if so,
							// it should be the link to the image
							List<SyndLink> links = entry.getLinks();
							if (links.size() >= 2) {
								SyndLink imgl = links.get(1);
								imageUrl = imgl.getHref();
							}
						}
					}
					System.out
							.println("--------------------------------------");
					System.out.println("Title : " + title);

					System.out.println("description : "
							+ buildDescrSummary(description));

					System.out.println("feedDescription : "
							+ description.length());
					System.out.println("feedDescription : " + feedDescription);
					System.out.println("date : " + date);
					System.out.println("feedTitle : " + feedTitle);
					System.out.println("author : " + author);
					System.out.println("url : " + url);
					System.out.println("imageUrl : " + imageUrl);

					StreamInfo feedStream = new StreamInfo();
					feedStream.setAuthor(author);
					feedStream.setDescription(buildDescrSummary(description));
					feedStream.setFeedDescription(feedDescription);
					feedStream.setFeedTitle(feedTitle);
					feedStream.setImageUrl(imageUrl);
					feedStream.setPublishedDate(date);
					feedStream.setTitle(title);
					feedStream.setUrl(url);
					feeds.add(feedStream);

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Not a feed!!");
			return null;
		} finally {
			if (reader != null)
				reader.close();
		}
		return feeds;
	}

	private static String buildDescrSummary(String description) {
		String descrSummary = "";
		String cleaned = Jsoup.clean(description, Whitelist.none());

		if (cleaned.length() > 246) {
			descrSummary = cleaned.substring(0, 246 - 1) + "...";
		} else {
			descrSummary = cleaned;
		}
		return descrSummary;
	}

	/**
	 * adds new feed
	 * 
	 * @param bookmark
	 * @return
	 */
	@Transactional
	public String addFeeds(FeedInfo feed) {
		System.out.println("Adding . .");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(feed);
			String bid = feed.getId();
			System.out.println("bid : " + bid);
			feed.setId(bid);
		} catch (Exception e) {
			// TODO: handle exception
			return "failed";
		} finally {
			pm.close();
		}
		return "SUCCESS";
	}

	List<FeedInfo> getSelectedTags(List<FeedInfo> feeds, String tags) {
		List<FeedInfo> tagsFeeds = new ArrayList<FeedInfo>();
		String tagStr = tags.toLowerCase();
		for (FeedInfo bookmark : feeds) {
			if (bookmark.getTags().toLowerCase().contains(tagStr)) {
				tagsFeeds.add(bookmark);
			}
		}
		return tagsFeeds;
	}

	List<FeedInfo> getSelectedHierarchy(List<FeedInfo> feeds, String hierarchy) {
		List<FeedInfo> hierarchyFeedInfo = new ArrayList<FeedInfo>();
		for (FeedInfo feed : feeds) {
			if (feed.getHierarchy().toLowerCase()
					.startsWith(hierarchy.toLowerCase())) {
				hierarchyFeedInfo.add(feed);
			}
		}
		return hierarchyFeedInfo;
	}

	/**
	 * gets all the bookmarks saved for the user from the database.
	 */
	@Transactional
	public List<FeedInfo> getAllFeedInfo(String user, String category,
			String hierarchy, String tags, String FeedTitle) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<FeedInfo> Bookmarks = new ArrayList<FeedInfo>();
		try {
			String query = "select from " + FeedInfo.class.getName()
					+ " where user == '" + user + "'";
			if (!category.equals("ALL"))
				query = query + " && category == '" + category + "'";

			if (!FeedTitle.equals("ALL"))
				query = query + " && name == '" + FeedTitle + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<FeedInfo> bookmarks = (List<FeedInfo>) pm.newQuery(query)
					.execute();

			if (!tags.equals("ALL")) {
				bookmarks = getSelectedTags(bookmarks, tags);
			}

			if (!hierarchy.equals("ALL")) {
				bookmarks = getSelectedHierarchy(bookmarks, hierarchy);
			}

			for (FeedInfo bookmark : bookmarks) {
				System.out.println(bookmark.getName());
			}

			Bookmarks = bookmarks;
		} catch (Exception e) {
			System.out.println(e.toString());
			return Bookmarks;
		} finally {
			pm.close();
		}

		return Bookmarks;
	}

	public List<StreamInfo> getAllFeeds(String user, String category,
			String hierarchy, String tags, String feedTitle) throws IOException {
		List<FeedInfo> allFeeds = getAllFeedInfo(user, category, hierarchy,
				tags, feedTitle);
		List<StreamInfo> allFeedStream = new ArrayList<StreamInfo>();
		for (FeedInfo feed : allFeeds) {
			List<StreamInfo> feeds = getFeeds(feed);
			if (feeds != null)
				allFeedStream.addAll(feeds);
		}
		return allFeedStream;
	}

	public List<StreamInfo> searchFeeds(String user, String keyword)
			throws IOException {
		List<StreamInfo> allFeeds = getAllFeeds(user, "ALL", "ALL", "ALL",
				"ALL");
		List<StreamInfo> searchedFeeds = new ArrayList<StreamInfo>();
		for (StreamInfo feedinfo : allFeeds) {
			if (feedinfo.getDescription().contains(keyword)
					|| feedinfo.getUrl().contains(keyword)
					|| feedinfo.getFeedDescription().contains(keyword)) {

				searchedFeeds.add(feedinfo);
			}
		}

		return searchedFeeds;
	}

	public FeedInfo getFeedInfoForBookmarkId(String bookmarkId) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		FeedInfo getFeedInfo = new FeedInfo();
		try {
			String query = "select from " + FeedInfo.class.getName()
					+ " where bookmarkId == '" + bookmarkId + "'";

			System.out.println(query);
			List<FeedInfo> feedInfo = (List<FeedInfo>) pm.newQuery(query)
					.execute();

			if (feedInfo.size() > 0)
				getFeedInfo = feedInfo.get(0);
			else
				return null;
		} finally {
			pm.close();
		}
		return getFeedInfo;
	}

	public String updateFeedInfo(FeedInfo feed) {
		System.out.println("Comin here");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.currentTransaction().begin();

			// Update with the new field
			pm.makePersistent(feed);
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			return ex.toString();
		} finally {
			pm.close();
		}
		return "success";
	}

	public String deleteBookmark(String id) {
		PersistenceManager pm = PMF.get().getPersistenceManager();

		try {
			FeedInfo feed = getFeedInfoForBookmarkId(id);
			if (feed == null)
				return "Feed not available";
			FeedInfo feedInfo = pm.getObjectById(FeedInfo.class, feed.getId());
			pm.deletePersistent(feedInfo);

		} finally {
			pm.close();
		}
		return "success";
	}
}
