package com.code.savemarks.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.Transactional;

import com.code.savemarks.model.Bookmark;
import com.code.savemarks.model.Category;
import com.code.savemarks.utils.PMF;
import com.code.savemarks.utils.Utils;

/**
 * Bookmarkservice provides methods to add,update,delete bookmarks and its
 * categories
 * 
 * @author Dhass
 * 
 */
public class BookmarkService {

	private static final long serialVersionUID = 1L;

	private static final Logger log = Logger.getLogger(Utils.class.getName());

	public List<Category> getCategories(String user) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<Category> Categories = new ArrayList<Category>();
		try {
			String query = "select from " + Category.class.getName()
					+ " where user == '" + user + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Category> categories = (List<Category>) pm.newQuery(query)
					.execute();
			System.out.println(categories.size());
			for (Category category : categories) {
				System.out.println("here");
				System.out.println(category.getCategoryName());
			}

			Categories = categories;
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			pm.close();
		}
		return Categories;
	}

	public String[] getCategoriesArray(String user) {
		List<Category> categoryList = getCategories(user);
		String[] categoryStr = new String[categoryList.size()];
		for (int i = 0; i < categoryStr.length; i++) {
			categoryStr[i] = categoryList.get(i).getCategoryName();
		}
		return categoryStr;
	}

	/**
	 * adds new bookmark
	 * 
	 * @param bookmark
	 * @return
	 */
	public String addCategory(Category category) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			String query = "select from " + Category.class.getName()
					+ " where user == '" + category.getUser()
					+ "' && categoryName == '" + category.getCategoryName()
					+ "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Category> Category = (List<Category>) pm.newQuery(query)
					.execute();
			if (Category.size() != 0)
				return "";
			else
				pm.makePersistent(category);
			String bid = category.getId();
			System.out.println("bid : " + bid);
			category.setId(bid);
		} catch (Exception e) {
			// TODO: handle exception
			return e.toString();
		} finally {
			pm.close();
		}
		return "SUCCESS";
	}

	public void checkCategory(String user, String category) {
		int count = getNumberOfBookmarksByCategory(user, category);
		if (count == 0) {
			System.out.println("size is 0");
			deleteCategory(user, category);
		}
	}

	@SuppressWarnings("unchecked")
	public String deleteCategory(String user, String category) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			System.out.println("Deleting....");
			String query = "select from " + Category.class.getName()
					+ " where user == '" + user + "' && categoryName == '"
					+ category + "'";
			List<Category> categoryOb = (List<Category>) pm.newQuery(query)
					.execute();
			Category myCategory = pm.getObjectById(Category.class, categoryOb
					.get(0).getId());
			System.out.println(myCategory.getCategoryName());
			pm.deletePersistent(myCategory);
		} finally {
			pm.close();
		}
		return "SUCCESS";
	}

	public String deleteBookmark(String user, String id) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String category = "";
		try {
			Bookmark bookmark = new Bookmark();
			bookmark = pm.getObjectById(Bookmark.class, id);
			category = bookmark.getCategory();
			pm.deletePersistent(bookmark);
			checkCategory(user, category);
		} finally {
			pm.close();
		}
		return "success";
	}

	/**
	 * get the bookmark for the given id.
	 */
	public Bookmark getBookmark(String id) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Bookmark bookmark = new Bookmark();
		try {
			bookmark = (Bookmark) pm.getObjectById(Bookmark.class, id);

		} finally {
			pm.close();
		}
		System.out.println(bookmark.getName() + " : " + bookmark.getUrls());
		return bookmark;
	}

	public String updateBookmark(Bookmark bookmark) {
		System.out.println("Comin here");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.currentTransaction().begin();

			// Update with the new field
			pm.makePersistent(bookmark);
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			return ex.toString();
		} finally {
			pm.close();
		}
		return "success";
	}

	/**
	 * adds new bookmark
	 * 
	 * @param bookmark
	 * @return
	 */
	public Bookmark addBookMark(Bookmark bookmark) {
		System.out.println("Adding . .");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(bookmark);
			String bid = bookmark.getId();
			System.out.println("bid : " + bid);
			bookmark.setId(bid);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		} finally {
			pm.close();
		}
		return bookmark;
	}

	/**
	 * gets all the bookmarks saved for the user from the database.
	 */
	@Transactional
	public List<Bookmark> getAllBookmarks(String user, String category,
			String hierarchy, String tags) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<Bookmark> Bookmarks = new ArrayList<Bookmark>();
		try {
			String query = "select from " + Bookmark.class.getName()
					+ " where user == '" + user + "'";
			System.out.println("Category : " + category + " : " + hierarchy
					+ " : " + tags);

			if (!category.equals("ALL"))
				query = query + " && category == '" + category + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Bookmark> bookmarks = (List<Bookmark>) pm.newQuery(query)
					.execute();
			System.out.println(bookmarks.size());

			if (!tags.equals("ALL")) {
				bookmarks = getSelectedTags(bookmarks, tags);
			}

			if (!hierarchy.equals("ALL")) {
				bookmarks = getSelectedHierarchy(bookmarks, hierarchy);
			}

			for (Bookmark bookmark : bookmarks) {
				System.out.println(bookmark.getName());
			}

			Bookmarks = bookmarks;
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			pm.close();
		}
		return Bookmarks;
	}

	List<Bookmark> getSelectedTags(List<Bookmark> bookmarks, String tags) {
		List<Bookmark> tagsBookmarks = new ArrayList<Bookmark>();
		String tagStr = tags.toLowerCase();
		for (Bookmark bookmark : bookmarks) {
			if (bookmark.getTags().toLowerCase().contains(tagStr)) {
				tagsBookmarks.add(bookmark);
			}
		}
		return tagsBookmarks;
	}

	List<Bookmark> getSelectedHierarchy(List<Bookmark> bookmarks,
			String hierarchy) {
		List<Bookmark> hierarchyBookmarks = new ArrayList<Bookmark>();
		for (Bookmark bookmark : bookmarks) {
			if (bookmark.getHierarchy().toLowerCase()
					.startsWith(hierarchy.toLowerCase())) {
				hierarchyBookmarks.add(bookmark);
			}
		}
		return hierarchyBookmarks;
	}

	/**
	 * gets all the bookmarks saved for the user from the database.
	 */
	@Transactional
	public List<Bookmark> getMarkedBookmarks(String user, String category,
			String hierarchy, String tags) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<Bookmark> Bookmarks = new ArrayList<Bookmark>();
		try {
			String query = "select from " + Bookmark.class.getName()
					+ " where user == '" + user + "' && mark==true";

			if (!category.equals("ALL"))
				query = query + " && category == '" + category + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Bookmark> bookmarks = (List<Bookmark>) pm.newQuery(query)
					.execute();
			System.out.println(bookmarks.size());

			if (!tags.equals("ALL")) {
				bookmarks = getSelectedTags(bookmarks, tags);
			}

			if (!hierarchy.equals("ALL")) {
				bookmarks = getSelectedHierarchy(bookmarks, hierarchy);
			}

			for (Bookmark bookmark : bookmarks) {
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

	/**
	 * gets all the bookmarks saved for the user from the database.
	 */
	@Transactional
	public List<Bookmark> getRecentlyAddedBookmarks(String user,
			String category, String hierarchy, String tags) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<Bookmark> Bookmarks = new ArrayList<Bookmark>();
		try {
			String query = "select from " + Bookmark.class.getName()
					+ " where user == '" + user + "'";

			if (!category.equals("ALL"))
				query = query + " && category == '" + category + "'";

			query = query + " ORDER BY createdDate DESC LIMIT 100";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Bookmark> bookmarks = (List<Bookmark>) pm.newQuery(query)
					.execute();
			System.out.println(bookmarks.size());
			if (!tags.equals("ALL")) {
				bookmarks = getSelectedTags(bookmarks, tags);
			}

			if (!hierarchy.equals("ALL")) {
				bookmarks = getSelectedHierarchy(bookmarks, hierarchy);
			}

			for (Bookmark bookmark : bookmarks) {
				System.out.println(bookmark.getName());
			}

			Bookmarks = bookmarks;
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			pm.close();
		}
		return Bookmarks;
	}

	/**
	 * gets all the bookmarks saved for the user from the database.
	 */
	@Transactional
	public List<Bookmark> getMostlyViewedBookmarks(String user,
			String category, String hierarchy, String tags) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<Bookmark> Bookmarks = new ArrayList<Bookmark>();
		try {
			String query = "select from " + Bookmark.class.getName()
					+ " where user == '" + user + "'";

			if (!category.equals("ALL"))
				query = query + " && category == '" + category + "'";

			query = query + " ORDER BY used DESC LIMIT 100";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Bookmark> bookmarks = (List<Bookmark>) pm.newQuery(query)
					.execute();
			System.out.println(bookmarks.size());

			if (!tags.equals("ALL")) {
				bookmarks = getSelectedTags(bookmarks, tags);
			}

			if (!hierarchy.equals("ALL")) {
				bookmarks = getSelectedHierarchy(bookmarks, hierarchy);
			}

			for (Bookmark bookmark : bookmarks) {
				System.out.println(bookmark.getName());
			}

			Bookmarks = bookmarks;
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			pm.close();
		}
		return Bookmarks;
	}

	/**
	 * gets bookmarks by category for the user from the database.
	 */
	@Transactional
	public List<Bookmark> getBookmarksByCategory(String user, String category) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<Bookmark> Bookmarks = new ArrayList<Bookmark>();
		try {
			String query = "select from " + Bookmark.class.getName()
					+ " where user == '" + user + "' && category == '"
					+ category + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Bookmark> bookmarks = (List<Bookmark>) pm.newQuery(query)
					.execute();

			Bookmarks = bookmarks;
		} finally {
			pm.close();
		}
		return Bookmarks;
	}

	/**
	 * gets bookmarks by category for the user from the database.
	 */
	@Transactional
	public int getNumberOfBookmarksByCategory(String user, String category) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		int count = 0;
		try {
			String query = "select from " + Bookmark.class.getName()
					+ " where user == '" + user + "' && category == '"
					+ category + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<Bookmark> bookmarks = (List<Bookmark>) pm.newQuery(query)
					.execute();

			count = bookmarks.size();
		} finally {
			pm.close();
		}
		return count;
	}

	public Set<String> getHierarchy(String user) {
		List<Bookmark> bookmarks = getAllBookmarks(user, "ALL", "ALL", "ALL");
		Set<String> hierarchy = new HashSet<String>();
		for (Bookmark bookmark : bookmarks) {
			hierarchy.add(bookmark.getHierarchy());
		}
		return hierarchy;
	}

	public List<Bookmark> searchBookmarks(String user, String keyword) {
		List<Bookmark> allBookmarks = getAllBookmarks(user, "ALL", "ALL", "ALL");
		List<Bookmark> searchedBookmarks = new ArrayList<Bookmark>();
		String keywordStr = keyword.toLowerCase();
		for (Bookmark bookmark : allBookmarks) {
			if (bookmark.getName().toLowerCase().contains(keywordStr)
					|| bookmark.getUrls().toLowerCase().contains(keywordStr)
					|| bookmark.getHierarchy().toLowerCase()
							.contains(keywordStr)
					|| bookmark.getTags().toLowerCase().contains(keywordStr)) {
				searchedBookmarks.add(bookmark);
			}
		}
		return searchedBookmarks;
	}

}
