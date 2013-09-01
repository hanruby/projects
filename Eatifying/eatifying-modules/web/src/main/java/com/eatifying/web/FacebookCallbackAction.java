package com.eatifying.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;
import org.springframework.stereotype.Component;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class FacebookCallbackAction extends ActionSupport implements
		ServletRequestAware {
	/**
	 * CallBack facebook action class which will get the user details from
	 * facebook
	 */
	private static final long serialVersionUID = 1L;
	private static final Token EMPTY_TOKEN = null;
	private static final String PROTECTED_RESOURCE_URL = "https://graph.facebook.com/me";

	private HttpServletRequest request;

	public String loginFacebook() {

		String code = request.getParameter("code");
		Verifier verifier = new Verifier(code);

		HttpSession httpsession = request.getSession(true);
		OAuthService service = (OAuthService) httpsession
				.getAttribute("oauth.service");

		Token accessToken = service.getAccessToken(EMPTY_TOKEN, verifier);
		httpsession.setAttribute("oauth.access_token", accessToken);

		OAuthRequest req = new OAuthRequest(Verb.GET, PROTECTED_RESOURCE_URL);
		service.signRequest(accessToken, req);
		Response resp = req.send();
		// System.out.println(resp.getCode());
		System.out.println(resp.getBody());

		// make a json out of facebook user profile
		// filter and persist the data for future use.
		JsonObject userJson = new JsonParser().parse(resp.getBody())
				.getAsJsonObject();

		System.out.println(userJson.get("name"));
		System.out.println(userJson.get("email"));
		System.out.println(userJson.get("id"));

		return SUCCESS;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
