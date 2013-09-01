package com.eatifying.server.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eatifying.commons.domain.order.CustomerOrder;
import com.eatifying.commons.domain.order.CustomerOrderDetails;
import com.eatifying.dao.CustomerOrderMapper;

@Service
public class CustomerOrderService {

	@Autowired
	private CustomerOrderMapper customerMapper;
	
	/**
	 * This method is used to insert a customer order into the database.
	 * This includes ordering food from multiple places simultaneously.
	 * This is after the user confirms the order. 
	 * @param orders
	 */
	public synchronized void insertCustomerOrder(List<CustomerOrder> orders)
	{
		try
		{
			// Set it to null for the first record
			Long orderId = null; 
			for(CustomerOrder order: orders)
			{
				if(orderId != null)
				{
					order.setOrderId(orderId);
				}
				else
				{
					orderId = Long.valueOf(customerMapper.getMaxOrderId());
					order.setOrderId(Long.valueOf(customerMapper.getMaxOrderId()));
				}
				// Insert order here.
				customerMapper.insertOrder(order);
				
				// Insert the details for the order here.
				for(CustomerOrderDetails detail : order.getCustomerOrderDetails())
				{
					detail.setOrderId(orderId);
					detail.setRestaurantId(order.getRestaurantId());
					customerMapper.insertOrderDetail(detail);
				}
			}
		}
		catch (Exception e) {
			// This should an internal notification because the order has been 
			// confirmed by the user. We need to take corrective action here.
			System.out.println("Errror while saving the order.");
			e.printStackTrace();
		}
	}
	
}
