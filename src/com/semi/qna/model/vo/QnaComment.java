package com.semi.qna.model.vo;

import java.util.Date;

public class QnaComment {

	private int qcNum;
	private int mnum;
	private String qcContent;
	private int qRef;
	private Date qcDate;
	
	public QnaComment() {
		// TODO Auto-generated constructor stub
	}
	
	

	public QnaComment(int qRef) {
		super();
		this.qRef = qRef;
	}



	public QnaComment(int mnum, String qcContent, int qRef) {
		super();
		this.mnum = mnum;
		this.qcContent = qcContent;
		this.qRef = qRef;
	}



	public QnaComment(int qcNum, int mnum, String qcContent, int qRef, Date qcDate) {
		super();
		this.qcNum = qcNum;
		this.mnum = mnum;
		this.qcContent = qcContent;
		this.qRef = qRef;
		this.qcDate = qcDate;
	}

	public int getQcNum() {
		return qcNum;
	}

	public void setQcNum(int qcNum) {
		this.qcNum = qcNum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getQcContent() {
		return qcContent;
	}

	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}

	public int getqRef() {
		return qRef;
	}

	public void setqRef(int qRef) {
		this.qRef = qRef;
	}

	public Date getQcDate() {
		return qcDate;
	}

	public void setQcDate(Date qcDate) {
		this.qcDate = qcDate;
	}

	@Override
	public String toString() {
		return "QnaComment [qcNum=" + qcNum + ", mnum=" + mnum + ", qcContent=" + qcContent
				+ ", qRef=" + qRef + ", qcDate=" + qcDate + "]";
	}
	
	
}
