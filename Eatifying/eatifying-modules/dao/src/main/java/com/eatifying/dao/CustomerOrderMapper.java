package com.eatifying.dao;

import com.eatifying.commons.domain.order.CustomerOrder;
import com.eatifying.commons.domain.order.CustomerOrderDetails;

public interface CustomerOrderMapper {

	public int getMaxOrderId() throws Exception;
	
	public int insertOrder(CustomerOrder order) throws Exception;
	
	public void insertOrderDetail(CustomerOrderDetails detail) throws Exception;
	
}
