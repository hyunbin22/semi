package com.semi.subcategory.model.vo;

public class SubCategory {

	private int subNum;
	private String subName;
	


	public SubCategory() {
		// TODO Auto-generated constructor stub
	}
	
	public SubCategory(int subNum) {
		this.subNum = subNum;
	}
	
	public SubCategory(String subName) {
		this.subName = subName;
	}


	public SubCategory(String subName, int subNum) {
		this.subName = subName;
		this.subNum = subNum;
	}


	public String getSubName() {
		return subName;
	}


	public void setSubName(String subName) {
		this.subName = subName;
	}


	public int getSubNum() {
		return subNum;
	}


	public void setSubNum(int subNum) {
		this.subNum = subNum;
	}


	@Override
	public String toString() {
		return subName;
	}



}
