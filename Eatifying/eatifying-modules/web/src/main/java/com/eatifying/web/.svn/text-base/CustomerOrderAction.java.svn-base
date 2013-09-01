package com.eatifying.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eatifying.commons.domain.order.CustomerOrder;
import com.eatifying.commons.domain.order.CustomerOrderDetails;
import com.eatifying.commons.domain.restaurant.RestaurantMenuItem;
import com.eatifying.server.SessionConstants;
import com.eatifying.server.service.CustomerOrderService;
import com.eatifying.server.service.RestaurantMenuService;
import com.google.gson.Gson;

@Component
public class CustomerOrderAction extends DefaultCartAction implements ServletRequestAware, ServletResponseAware{

	/**
	 * The default serial version UID for this class
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;

	private HttpServletResponse response;

	@Autowired
	private CustomerOrderService customerOrderService;

	@Autowired
	private RestaurantMenuService restaurantMenuService;

	// This is the JSON string representing the user order.
	private String orderString;

	private Integer restaurantId;

	private Integer restuarantMenuItemId;

	private int quantity;

	private List<CustomerOrderDetails> detailsList = new ArrayList<CustomerOrderDetails>();

	/**
	 * This consists of the following steps:
	 * ------------------------------------- 
	 * (1) validate user name and
	 * password. 
	 * (2) validate that the minimum amount criteria is met for all
	 * restaurants involved. 
	 * (3) place user order. 
	 * (4) change the status to
	 * order placed on completion of transaction. [Continued.] The notification
	 * to the user is then through SMS/email based on the reply from the
	 * restaurant.
	 * 
	 * @return
	 */
	public String executeCustomerOrder() {
		// validate user name and password.
		Boolean isUserValid = Boolean.FALSE;
		isUserValid = isValidUser();
		if (!isUserValid) {
			addActionError("Please login in as a valid user.");
			return ERROR;
		}
		System.out.println("Validation successful");
		// validate that the minimum amount criteria is met for all restaurants
		// involved.
		Boolean isMinAmountCriteriaMet = Boolean.FALSE;
		isMinAmountCriteriaMet = isMinAmountCriteriaMet();
		if (!isMinAmountCriteriaMet) {
			addActionError("Please make sure the minimum amount criteria is met for the "
					+ "the restuarant(s)");
			return ERROR;
		}
		System.out.println("Minimum amount criteria met.");

		// create user order from the JSON string
		// place user order.
		try {
			orderString = "[{'restaurantId':1, 'customerOrderDetails':[{'restaurantItemId':1,'quantity':2},{'restaurantItemId':2,'quantity':2}]}]";
			
			List<CustomerOrder> orders = getOrderFromJSON(orderString);
			System.out.println("The orders are: ");

			for (CustomerOrder order : orders) {
				System.out.println(order);
			}
			customerOrderService.insertCustomerOrder(orders);
		} catch (Exception e) {
			addActionError("An unexpected error occured. Please "
					+ "retry in a short while.");
			System.out.println("An unexpected error occured.");
			e.printStackTrace();
			return ERROR;
		}

		// change the status to order placed on completion of transaction.

		return SUCCESS;
	}

	private List<CustomerOrder> getOrderFromJSON(String orderString) {
		Gson gson = new Gson();
		CustomerOrder[] orders = gson.fromJson(orderString,
				CustomerOrder[].class);
		// Copy from Array to List. Find a more elegant way to do this.
		for (CustomerOrder order : orders) {
			order.setCustomersOrderDetailsList(Arrays.asList(order
					.getCustomerOrderDetails()));
		}
		return Arrays.asList(orders);
	}

	// TODO: N Complete this
	private Boolean isMinAmountCriteriaMet() {
		return Boolean.TRUE;
	}

	// TODO: G Complete this.
	private Boolean isValidUser() {
		return Boolean.TRUE;
	}
	
	@SuppressWarnings("unchecked")
	public String editCart() throws IOException
	{
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(true);
		
		// Set the current edited item information
		CustomerOrderDetails detail = new CustomerOrderDetails();
		if (quantity != 0)
		{
			RestaurantMenuItem item = restaurantMenuService.getRestaurantMenuItemById(restuarantMenuItemId);
			detail.setQuantity(quantity);
			detail.setRestaurantId(restaurantId);
			detail.setRestaurantItemId(restuarantMenuItemId);
			detail.setRestaurantItemName(item.getItemName());
			detail.setAmount(item.getPrice().multiply(new BigDecimal(quantity)));
		}
		
		// Check if cart already exists
		if (session.getAttribute(SessionConstants.ITEM_CART) != null) {
			Map<Integer, CustomerOrder> cart = (Map<Integer, CustomerOrder>) session
					.getAttribute(SessionConstants.ITEM_CART);
			if (cart.containsKey(restaurantId)) {
				CustomerOrder order = cart.get(restaurantId);
				// Add/Update/Remove to/from existing cart
				if (quantity == 0) {
					// Remove item
					order.getCustomersOrderDetailsMap().remove(getRestuarantMenuItemId());
				}
				else {
					CustomerOrderDetails oldDetail = order.getCustomersOrderDetailsMap().get(getRestuarantMenuItemId());
					if (oldDetail != null) {
						// Update item
						int itemQuantity = oldDetail.getQuantity();
						BigDecimal unitPrice = oldDetail.getAmount().divide(new BigDecimal(itemQuantity));
				
						detail.setQuantity(quantity);
						detail.setAmount(unitPrice.multiply(new BigDecimal(quantity)));
					}
					else {
						// Add item
						order.getCustomersOrderDetailsMap().put(restuarantMenuItemId, detail);
					}
				}
			}
			else {
				// TODO: Add this if needed
				/*if (cart.size() != 0) {
					// Remove Existing entry for other restaurants
					
				}*/
				// Create a new entry for this restaurant
				CustomerOrder order = new CustomerOrder();
				order.setRestaurantId(restaurantId);
				order.getCustomersOrderDetailsMap().put(restuarantMenuItemId, detail);
				cart.put(restaurantId, order);
				session.setAttribute(SessionConstants.ITEM_CART, cart);
			}
		}
		else {
			Map<Integer, CustomerOrder> cart = new LinkedHashMap<Integer, CustomerOrder>();
			CustomerOrder order = new CustomerOrder();
			order.setRestaurantId(restaurantId);
			order.getCustomersOrderDetailsMap()
					.put(restuarantMenuItemId, detail);
			cart.put(restaurantId, order);
			session.setAttribute(SessionConstants.ITEM_CART, cart);
		}
		
		super.initializeOrderJSON(request);
		// Write contents to the output Stream.
		pw.write(getUserOrder());
		return null;
	}
	/*@SuppressWarnings("unchecked")
	public String addToCart()
	{
		CustomerOrderDetails detail = new CustomerOrderDetails();
		RestaurantMenuItem item = restaurantMenuService.getRestaurantMenuItemById(restuarantMenuItemId);
		// For a new item always set to 1
		quantity = 1;
		detail.setQuantity(quantity);
		detail.setRestaurantId(restaurantId);
		detail.setRestaurantItemId(restuarantMenuItemId);
		detail.setRestaurantItemName(item.getItemName());
		detail.setAmount(item.getPrice() * quantity);

		HttpSession session = request.getSession(true);
		if (session.getAttribute(SessionConstants.ITEM_CART) != null) {
			Map<Integer, CustomerOrder> cart = (Map<Integer, CustomerOrder>) session
					.getAttribute(SessionConstants.ITEM_CART);
			if (cart.containsKey(restaurantId)) {
				cart.get(restaurantId).getCustomersOrderDetailsMap()
						.put(restuarantMenuItemId, detail);
			} else {
				CustomerOrder order = new CustomerOrder();
				order.setRestaurantId(restaurantId);
				order.getCustomersOrderDetailsMap()
						.put(restuarantMenuItemId, detail);
				cart.put(restaurantId, order);
			}
		} else {
			Map<Integer, CustomerOrder> cart = new LinkedHashMap<Integer, CustomerOrder>();
			CustomerOrder order = new CustomerOrder();
			order.setRestaurantId(restaurantId);
			order.getCustomersOrderDetailsMap()
					.put(restuarantMenuItemId, detail);
			cart.put(restaurantId, order);
			session.setAttribute(SessionConstants.ITEM_CART, cart);
		}

		totalAmount = ((Map<Integer, CustomerOrder>) session
				.getAttribute(SessionConstants.ITEM_CART)).get(restaurantId).getTotalAmount();
		detailsList = ((Map<Integer, CustomerOrder>) session
				.getAttribute(SessionConstants.ITEM_CART)).get(restaurantId)
				.getCustomersOrderDetailsList();
		Collections.reverse(detailsList);
		
		// TODO: Change to read from service method
		Double minimumAmount = 1000.00;
		remainingAmount = (totalAmount > minimumAmount)? 0.00 : (minimumAmount - totalAmount);
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String updateCart() {
		HttpSession session = request.getSession(true);
		if (session.getAttribute(SessionConstants.ITEM_CART) != null) {
			Map<Integer, CustomerOrder> cart = (Map<Integer, CustomerOrder>) session
					.getAttribute(SessionConstants.ITEM_CART);
			if (cart.containsKey(restaurantId)) {
				CustomerOrder order = cart.get(restaurantId);

				if (order.getCustomersOrderDetailsMap().containsKey(
						restuarantMenuItemId)) {
					if (REMOVE.equals(action)) {
						order.getCustomersOrderDetailsMap().remove(
								getRestuarantMenuItemId());
					} else {
						CustomerOrderDetails detail = order
								.getCustomersOrderDetailsMap().get(
										getRestuarantMenuItemId());

						int itemQuantity = detail.getQuantity();
						Double unitPrice = detail.getAmount() / itemQuantity;

						detail.setQuantity(quantity);
						detail.setAmount(unitPrice * quantity);
					}
				} else {
					// TODO: Add exception message that this item has already
					// been removed.
				}

			} else {
				// TODO: Add exception message that this order has already been
				// placed from a different window.
			}
		} else {
			// TODO: Add session expired exception message here.
		}

		totalAmount = ((Map<Integer, CustomerOrder>) session
				.getAttribute(SessionConstants.ITEM_CART)).get(restaurantId).getTotalAmount();
		detailsList = ((Map<Integer, CustomerOrder>) session
				.getAttribute(SessionConstants.ITEM_CART)).get(restaurantId)
				.getCustomersOrderDetailsList();

		Double minimumAmount = 1000.00;
		remainingAmount = (totalAmount > minimumAmount)? 0.00 : (minimumAmount - totalAmount);
		
		return SUCCESS;
	}*/

	public void setOrderString(String orderString) {
		this.orderString = orderString;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public Integer getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(Integer restaurantId) {
		this.restaurantId = restaurantId;
	}

	public Integer getRestuarantMenuItemId() {
		return restuarantMenuItemId;
	}

	public void setRestuarantMenuItemId(Integer restuarantMenuItemId) {
		this.restuarantMenuItemId = restuarantMenuItemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<CustomerOrderDetails> getDetailsList() {
		return detailsList;
	}

	public void setDetailsList(List<CustomerOrderDetails> detailsList) {
		this.detailsList = detailsList;
	}

	
}
