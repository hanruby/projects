package com.eatifying.server.service.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.FacebookApi;
import org.scribe.model.Token;
import org.scribe.oauth.OAuthService;

public class FacebookLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String FB_APPID = "197995226948726";
	private static final String FB_APISECRET = "5748d26dd04cf04f4af8e76f719d122d";
	private static final String FB_CALLBACK_URL = "http://localhost:8081/eatifying/facebookCallback.action";
	private static final Token EMPTY_TOKEN = null;
	private static final String perms = "publish_stream,email";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		//build the OAuth service
		OAuthService service = new ServiceBuilder().provider(FacebookApi.class)
				.callback(FB_CALLBACK_URL).apiKey(FB_APPID)
				.apiSecret(FB_APISECRET).scope(perms).build();
		HttpSession session = request.getSession();
		session.setAttribute("oauth.service", service);

		String confirmAccessURL = service.getAuthorizationUrl(EMPTY_TOKEN);

		//auth Url for facebook
		System.out.println(confirmAccessURL);
		try {
			//redirect to fb page to get username and passwd
			response.sendRedirect(response.encodeRedirectURL(confirmAccessURL));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doGet(request, response);
	}
}
