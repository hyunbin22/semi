package com.semi.moim.model.vo;

public class MoimUpload {

	private int upMoimNum;
	private int moimNum;
	private String upMoimOrgName;
	private String upMoimReName;
	
	public MoimUpload() {
		// TODO Auto-generated constructor stub
	}
	

	public MoimUpload(int upMoimNum, int moimNum, String upMoimOrgName, String upMoimReName) {
		super();
		this.upMoimNum = upMoimNum;
		this.moimNum = moimNum;
		this.upMoimOrgName = upMoimOrgName;
		this.upMoimReName = upMoimReName;
	}

	public MoimUpload(String upMoimOrgName, String upMoimReName) {
		super();
		this.upMoimOrgName = upMoimOrgName;
		this.upMoimReName = upMoimReName;
	}

	public int getUpMoimNum() {
		return upMoimNum;
	}

	public void setUpMoimNum(int upMoimNum) {
		this.upMoimNum = upMoimNum;
	}

	public int getMoimNum() {
		return moimNum;
	}

	public void setMoimNum(int moimNum) {
		this.moimNum = moimNum;
	}

	public String getUpMoimOrgName() {
		return upMoimOrgName;
	}

	public void setUpMoimOrgName(String upMoimOrgName) {
		this.upMoimOrgName = upMoimOrgName;
	}

	public String getUpMoimReName() {
		return upMoimReName;
	}

	public void setUpMoimReName(String upMoimReName) {
		this.upMoimReName = upMoimReName;
	}

	@Override
	public String toString() {
		return "MoimUpload [upMoimNum=" + upMoimNum + ", moimNum=" + moimNum + ", upMoimOrgName=" + upMoimOrgName
				+ ", upMoimReName=" + upMoimReName + "]";
	}

	
}
