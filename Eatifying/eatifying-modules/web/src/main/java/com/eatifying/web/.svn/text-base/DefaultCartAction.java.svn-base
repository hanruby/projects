package com.eatifying.web;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.eatifying.commons.domain.order.CustomerOrder;
import com.eatifying.commons.domain.order.CustomerOrderDetails;
import com.eatifying.server.SessionConstants;
import com.opensymphony.xwork2.ActionSupport;

/**
 * This class is responsible for maintaining the cart session state 
 * across all pages.
 * 
 * All user facing actions will have to extend this class.
 * @author narayan
 *
 */
public class DefaultCartAction extends ActionSupport {
	
	/**
	 * The generated serial version UID for this class
	 */
	private static final long serialVersionUID = -5099941178849156407L;

	/**
	 * The JSON representation of the user order
	 */
	String userOrder;

	@SuppressWarnings("unchecked")
	public void initializeOrderJSON(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		
		if (session.getAttribute(SessionConstants.ITEM_CART) != null) {
			
			Map<Integer, CustomerOrder> cart = (Map<Integer, CustomerOrder>) session
					.getAttribute(SessionConstants.ITEM_CART);
			
			Integer key = cart.keySet().iterator().next();
			CustomerOrder order = cart.get(key);
			
			userOrder = prepareJSONString(order);
		}
		else {
			userOrder = WebConstants.EMPTY_JSON;
		}
	}
	
	private String prepareJSONString(CustomerOrder order) {
		if(order == null || order.getCustomersOrderDetailsList() == null || order.getCustomersOrderDetailsList().size() == 0)
			return WebConstants.EMPTY_JSON;
		
		StringBuilder jsonString = new StringBuilder();
		jsonString.append("{\"order\":[");
		int quantity = 0;
		for (CustomerOrderDetails detail : order.getCustomersOrderDetailsList())
		{
			jsonString.append("{");
			jsonString.append("\"itemId\":\"");
			jsonString.append(detail.getRestaurantItemId());
			jsonString.append("\",\"restaurantItemName\":\"");
			jsonString.append(detail.getRestaurantItemName());
			jsonString.append("\",\"quantity\":\"");
			jsonString.append(detail.getQuantity());
			quantity += detail.getQuantity();
			jsonString.append("\",\"amount\":\"");
			jsonString.append(detail.getFormattedAmount());
			jsonString.append("\"},");
		}
		
		jsonString.replace(jsonString.lastIndexOf(","),jsonString.lastIndexOf(",")+1,"");
		jsonString.substring(0, jsonString.length()-1);
		jsonString.append("]");
		jsonString.append(",\"totalAmount\":");
		BigDecimal formattedTotalAmount = order.getFormattedTotalAmount();
		jsonString.append(formattedTotalAmount);
		// TODO: Change this. 
		BigDecimal tax = (formattedTotalAmount.multiply(new BigDecimal(0.145))).setScale(2, RoundingMode.HALF_UP);
		jsonString.append(",\"tax\":");
		jsonString.append(tax);
		BigDecimal subtotal = formattedTotalAmount.add(tax).setScale(2, RoundingMode.HALF_UP);
		jsonString.append(",\"subtotal\":");
		jsonString.append(subtotal);
		jsonString.append(",\"totalQuantity\":");
		jsonString.append(quantity);
		BigDecimal minimumAmount = new BigDecimal(1000.00);
		BigDecimal remainingAmount = minimumAmount.subtract(subtotal).setScale(2, RoundingMode.HALF_UP);
		jsonString.append(",\"remainingAmount\":");
		jsonString.append(remainingAmount.compareTo(new BigDecimal(0.00)) <=0 ? 0.00 : remainingAmount);
		
		jsonString.append("}");
		
		return jsonString.toString();
	}
	
	public String getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(String userOrder) {
		this.userOrder = userOrder;
	}
	
}
