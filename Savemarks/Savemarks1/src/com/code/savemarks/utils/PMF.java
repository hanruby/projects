
package com.code.savemarks.utils;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;

public final class PMF {

	@SuppressWarnings("rawtypes")
	private static final java.lang.Class[] classes = new java.lang.Class[] { com.code.savemarks.model.Bookmark.class };
	private static final PersistenceManagerFactory pmfInstance = JDOHelper
			.getPersistenceManagerFactory("transactions-optional");

	private PMF() {
	}

	public static PersistenceManagerFactory get() {
		return pmfInstance;
	}

	@SuppressWarnings("rawtypes")
	public static java.lang.Class[] getClasses() {
		return classes;
	}

	public static PersistenceManager getNonTxnPm() {
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		return pm;
	}

	public static PersistenceManager getTxnPm() {
		PersistenceManager pm = pmfInstance.getPersistenceManager();
		return pm;
	}
}
