package com.eatifying.commons.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

public class StrUtils {

	/**
	 * convert Strings to ArrayList
	 * 
	 * @param str
	 * @param delimiter
	 * @return
	 */
	public List<Integer> splitString(String str, char delimiter) {
		List<Integer> intList = new ArrayList<Integer>();
		str = StringUtils.trim(str);
		String[] subStrs = StringUtils.split(str, delimiter);

		for (int i = 0; i < subStrs.length; i++) {
			intList.add(Integer.parseInt(subStrs[i]));
		}
		return intList;
	}

	public List<Integer> splitString(String str) {
		return splitString(str, ',');
	}
}
