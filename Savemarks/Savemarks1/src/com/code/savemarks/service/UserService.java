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

import com.code.savemarks.model.Bookmark;
import com.code.savemarks.model.FeedInfo;
import com.code.savemarks.model.StreamInfo;
import com.code.savemarks.model.UserAccount;
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
public class UserService {

	private static final long serialVersionUID = 1L;

	public String addUser(UserAccount user) {
		System.out.println("Adding . .");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(user);
			String uid = user.getId();
			System.out.println("uid : " + uid);
		} catch (Exception e) {
			// TODO: handle exception
			return e.toString();
		} finally {
			pm.close();
		}
		return "SUCCESS";
	}

	/**
	 * gets all the bookmarks saved for the user from the database.
	 */
	@Transactional
	public UserAccount getUser(String user) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		UserAccount userOb = new UserAccount();
		try {
			String query = "select from " + UserAccount.class.getName()
					+ " where user == '" + user + "'";

			System.out.println(query);
			@SuppressWarnings("unchecked")
			List<UserAccount> userInfo = (List<UserAccount>) pm.newQuery(query)
					.execute();
			if (userInfo.size() == 0) {
				return null;
			} else {
				userOb = userInfo.get(0);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return userOb;
		} finally {
			pm.close();
		}

		return userOb;
	}

	public String updateUser(UserAccount user) {
		System.out.println("Updating user info");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.currentTransaction().begin();

			// Update with the new field
			pm.makePersistent(user);
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			return ex.toString();
		} finally {
			pm.close();
		}
		return "SUCCESS";
	}

}
