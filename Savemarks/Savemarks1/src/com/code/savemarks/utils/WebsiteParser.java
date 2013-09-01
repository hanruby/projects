package com.code.savemarks.utils;

import java.net.URL;
import java.util.List;

import net.htmlparser.jericho.CharacterReference;
import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.MasonTagTypes;
import net.htmlparser.jericho.MicrosoftConditionalCommentTagTypes;
import net.htmlparser.jericho.PHPTagTypes;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.StartTag;
import net.htmlparser.jericho.TextExtractor;

import com.code.savemarks.model.Category;
import com.code.savemarks.service.BookmarkService;

public class WebsiteParser {
	public String getWebsiteDetails(String url, String user) {

		String bookmark = "";
		BookmarkService bookmarkService = new BookmarkService();
		List<Category> category = bookmarkService.getCategories(user);

		if (url.indexOf(':') == -1)
			url = "http://" + url;
		MicrosoftConditionalCommentTagTypes.register();
		PHPTagTypes.register();
		PHPTagTypes.PHP_SHORT.deregister(); // remove PHP short tags for this
											// example otherwise they override
											// processing instructions
		MasonTagTypes.register();
		Source source = null;
		try {
			source = new Source(new URL(url));
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}

		// Call fullSequentialParse manually as most of the source will be
		// parsed.
		source.fullSequentialParse();

		System.out.println("Document title:");
		String title = getTitle(source);
		System.out.println(title == null ? " " : title);
		title = title == null ? " " : title;
		bookmark = title + "$";

		String description = getMetaValue(source, "description");
		description = description == null ? "" : description;


		String keywords = getMetaValue(source, "keywords");
		keywords = keywords == null ? " " : keywords.replaceAll(" ", "");
		if (keywords.length() > 50) {
			keywords = keywords.substring(0, 50);
			int i = keywords.lastIndexOf(",");
			keywords = keywords.substring(0, i);
		}

		bookmark = bookmark + keywords + "$";

		TextExtractor textExtractor = new TextExtractor(source) {
			public boolean excludeElement(StartTag startTag) {
				return startTag.getName() == HTMLElementName.P
						|| "control".equalsIgnoreCase(startTag
								.getAttributeValue("class"));
			}
		};
		System.out.println(textExtractor.setIncludeAttributes(true).toString());
		String text = textExtractor.setIncludeAttributes(true).toString() == null ? " "
				: textExtractor.setIncludeAttributes(true).toString()
						.toLowerCase();

		String categoryStr = " ";
		for (Category categoryVal : category) {
			String catName = categoryVal.getCategoryName().toLowerCase();
			if (title.contains(catName) || description.contains(catName)
					|| text.contains(catName)) {
				categoryStr = categoryVal.getCategoryName();
				break;
			}
		}
		bookmark = bookmark + categoryStr;
		System.out.println(bookmark);
		return bookmark;
	}

	private String getTitle(Source source) {
		Element titleElement = source.getFirstElement(HTMLElementName.TITLE);
		if (titleElement == null)
			return null;
		// TITLE element never contains other tags so just decode it collapsing
		// whitespace:
		return CharacterReference.decodeCollapseWhiteSpace(titleElement
				.getContent());
	}

	private String getMetaValue(Source source, String key) {
		for (int pos = 0; pos < source.length();) {
			StartTag startTag = source.getNextStartTag(pos, "name", key, false);
			if (startTag == null)
				return null;
			if (startTag.getName() == HTMLElementName.META)
				return startTag.getAttributeValue("content"); // Attribute
																// values are
																// automatically
																// decoded
			pos = startTag.getEnd();
		}
		return null;
	}
}
