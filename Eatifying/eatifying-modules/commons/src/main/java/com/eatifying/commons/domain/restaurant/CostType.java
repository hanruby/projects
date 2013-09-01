package com.eatifying.commons.domain.restaurant;

/**
 * Types of cost at which the restaurants can be categorised
 * 
 * @author Dhass
 * 
 */
public class CostType {
	
	int costTypeId;
	String costTypeName;
	String costTypeDesc;

	public CostType() {

	}

	public int getCostTypeId() {
		return costTypeId;
	}

	public void setCostTypeId(int costTypeId) {
		this.costTypeId = costTypeId;
	}

	public String getCostTypeName() {
		return costTypeName;
	}

	public void setCostTypeName(String costTypeName) {
		this.costTypeName = costTypeName;
	}

	public String getCostTypeDesc() {
		return costTypeDesc;
	}

	public void setCostTypeDesc(String costTypeDesc) {
		this.costTypeDesc = costTypeDesc;
	}

}
