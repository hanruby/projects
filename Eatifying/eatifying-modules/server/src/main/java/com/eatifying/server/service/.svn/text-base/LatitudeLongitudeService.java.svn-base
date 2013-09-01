package com.eatifying.server.service;

import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.eatifying.commons.domain.GeoCode;

/**
 * Service to get the geocodes for the given address
 * Google geocode API is used to get the geocodes
 * @author Dhass
 *
 */
@Service
public class LatitudeLongitudeService {

	/**
	 * Google map webservice url
	 */
	private static final String GEOCODE_REQUEST_URL = "http://maps.googleapis.com/maps/api/geocode/xml?sensor=false&";
	private static HttpClient httpClient = new HttpClient(
			new MultiThreadedHttpConnectionManager());

	/**
	 * method to get the latitude and latitude for a given address
	 * 
	 * @param address
	 * @return
	 */
	public GeoCode getLatitudeLongitude(String address) {
		GeoCode geoCode = null;
		try {
			StringBuilder urlBuilder = new StringBuilder(GEOCODE_REQUEST_URL);
			if (StringUtils.isNotBlank(address)) {
				urlBuilder.append("&address=").append(
						URLEncoder.encode(address, "UTF-8"));
			}

			final GetMethod getMethod = new GetMethod(urlBuilder.toString());
			try {
				httpClient.executeMethod(getMethod);
				Reader reader = new InputStreamReader(
						getMethod.getResponseBodyAsStream(),
						getMethod.getResponseCharSet());

				int data = reader.read();
				char[] buffer = new char[1024];
				Writer writer = new StringWriter();
				while ((data = reader.read(buffer)) != -1) {
					writer.write(buffer, 0, data);
				}

				//XML result for the address
				String result = writer.toString();
				System.out.println(result.toString());

				DocumentBuilderFactory dbf = DocumentBuilderFactory
						.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				InputSource is = new InputSource();
				is.setCharacterStream(new StringReader("<"
						+ writer.toString().trim()));
				Document doc = db.parse(is);

				String strLatitude = getXpathValue(doc,
						"//GeocodeResponse/result/geometry/location/lat/text()");
				System.out.println("Latitude:" + strLatitude);

				String strLongtitude = getXpathValue(doc,
						"//GeocodeResponse/result/geometry/location/lng/text()");
				System.out.println("Longitude:" + strLongtitude);

				// not a valid location to get Geocode
				if (strLatitude == null || strLongtitude == null)
					return null;
				
				geoCode = new GeoCode();
				geoCode.setLatitude(Double.parseDouble(strLatitude));
				geoCode.setLongitude(Double.parseDouble(strLongtitude));

				return geoCode;

			} finally {
				getMethod.releaseConnection();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return geoCode;
	}

	/**
	 * Returns the given xml node value
	 * 
	 * @param doc
	 * @param strXpath
	 * @return nodevalue
	 * @throws XPathExpressionException
	 */
	private String getXpathValue(Document doc, String strXpath)
			throws XPathExpressionException {
		XPath xPath = XPathFactory.newInstance().newXPath();
		XPathExpression expr = xPath.compile(strXpath);
		String resultData = null;
		Object result4 = expr.evaluate(doc, XPathConstants.NODESET);
		NodeList nodes = (NodeList) result4;
		for (int i = 0; i < nodes.getLength(); i++) {
			resultData = nodes.item(i).getNodeValue();
		}
		return resultData;
	}

}