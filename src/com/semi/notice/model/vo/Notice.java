package com.semi.notice.model.vo;

import java.util.Date;

public class Notice {

	private int nNum; //공지번호
	private int aidNum; //관리자번호
	private String nName; //공지제목
	private String nText; //공지내용
	private Date nDate; //공지작성일

	
	public Notice() {
		// TODO Auto-generated constructor stub
	}


	public Notice(int nNum) {
		super();
		this.nNum = nNum;
	}


	public Notice(int aidNum, String nName, String nText) {
		super();
		this.aidNum = aidNum;
		this.nName = nName;
		this.nText = nText;
	}


	public Notice(int nNum, int aidNum, String nName, String nText, Date nDate) {
		super();
		this.nNum = nNum;
		this.aidNum = aidNum;
		this.nName = nName;
		this.nText = nText;
		this.nDate = nDate;
	}


	public int getnNum() {
		return nNum;
	}


	public void setnNum(int nNum) {
		this.nNum = nNum;
	}


	public int getAidNum() {
		return aidNum;
	}


	public void setAidNum(int aidNum) {
		this.aidNum = aidNum;
	}


	public String getnName() {
		return nName;
	}


	public void setnName(String nName) {
		this.nName = nName;
	}


	public String getnText() {
		return nText;
	}


	public void setnText(String nText) {
		this.nText = nText;
	}


	public Date getnDate() {
		return nDate;
	}


	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}


	@Override
	public String toString() {
		return "Notice [nNum=" + nNum + ", aidNum=" + aidNum + ", nName=" + nName + ", nText=" + nText + ", nDate="
				+ nDate + "]";
	}

	
	


	
	


	
	
}
