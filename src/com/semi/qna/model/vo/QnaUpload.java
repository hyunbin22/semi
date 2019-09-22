package com.semi.qna.model.vo;

public class QnaUpload {
	private int upQnaNum; //qna첨부파일 번호
	private int qNum; //작성자 회원테이블 참조 번호
	private String upQnaOrgName; //qna첨부파일 원본이름
	private String upQnaReName; //qna천부파일 변경이름
	
	public QnaUpload() {
		// TODO Auto-generated constructor stub
	}

	
	public QnaUpload(int qNum) {
		super();
		this.qNum = qNum;
	}




	public QnaUpload(int qNum, String upQnaOrgName, String upQnaReName) {
		super();
		this.qNum = qNum;
		this.upQnaOrgName = upQnaOrgName;
		this.upQnaReName = upQnaReName;
	}


	public QnaUpload(String upQnaOrgName, String upQnaReName) {
		super();
		this.upQnaOrgName = upQnaOrgName;
		this.upQnaReName = upQnaReName;
	}


	public QnaUpload(int upQnaNum, int qNum, String upQnaOrgName, String upQnaReName) {
		super();
		this.upQnaNum = upQnaNum;
		this.qNum = qNum;
		this.upQnaOrgName = upQnaOrgName;
		this.upQnaReName = upQnaReName;
	}

	public int getUpQnaNum() {
		return upQnaNum;
	}

	public void setUpQnaNum(int upQnaNum) {
		this.upQnaNum = upQnaNum;
	}

	public int getqNum() {
		return qNum;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public String getUpQnaOrgName() {
		return upQnaOrgName;
	}

	public void setUpQnaOrgName(String upQnaOrgName) {
		this.upQnaOrgName = upQnaOrgName;
	}

	public String getUpQnaReName() {
		return upQnaReName;
	}

	public void setUpQnaReName(String upQnaReName) {
		this.upQnaReName = upQnaReName;
	}

	@Override
	public String toString() {
		return "QnaUpload [upQnaNum=" + upQnaNum + ", qNum=" + qNum + ", upQnaOrgName=" + upQnaOrgName
				+ ", upQnaReName=" + upQnaReName + "]";
	}
	
	

}
