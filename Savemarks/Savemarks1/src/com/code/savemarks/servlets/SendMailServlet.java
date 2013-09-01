package com.code.savemarks.servlets;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.savemarks.service.BookmarkService;
import com.code.savemarks.service.FeedService;
import com.google.appengine.repackaged.org.json.JSONException;
import com.google.appengine.repackaged.org.json.JSONObject;

@SuppressWarnings("serial")
public class SendMailServlet extends HttpServlet {
	BookmarkService myBookmarkService = new BookmarkService();
	FeedService myFeedService = new FeedService();


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		System.out.println(request.getParameter("messageData"));
		String to = "";
		String subject = "";
		String message = "";
		response.setContentType("text/plain");
		System.out.println("Send mail servlet");

		JSONObject messageJson = null;
		try {
			messageJson = new JSONObject(request.getParameter("messageData"));
			System.out.println(messageJson.toString());

			if (messageJson.has("to")) {
				to = messageJson.getString("to");
				System.out.println(to);
			}

			if (messageJson.has("subject")) {
				subject = messageJson.getString("subject");
				System.out.println(subject);
			}
			if (messageJson.has("message")) {
				message = messageJson.getString("message");
				System.out.println(message);

			}

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			System.out.println("In catch :" + e.toString());
		}
		Properties props = new Properties();

		Session mimeSession = Session.getDefaultInstance(props, null);


		try {
			Message msg = new MimeMessage(mimeSession);
			msg.setFrom(new InternetAddress(""));
			
			System.out.println("to : " + to);
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(""));
			msg.setSubject(subject);
			msg.setText(message);
			Transport.send(msg);

			response.getWriter().println("SUCCESS");
		} catch (AddressException e) {
			// response.getWriter().println("Message not send :" +
			// e.toString());
			response.getWriter().println("FAILED");
		} catch (MessagingException e) {
			response.getWriter().println("FAILED");
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		doGet(request, response);
	}
}
