package com.semi.qna.model.vo;

import java.util.Date;

import com.semi.member.model.vo.Member;

public class Qna {

	private int qNum; //게시글 번호
	private String qTitle; //게시글 제목
	private int mNum; //게시글 작성자
	private String qContent; // 게시글 내용
	private Date qDate; //작성일자
	
	private QnaUpload qnaUpload; //업로드 파일
	
	private Member member; //맴버
	
	public Qna() {
		// TODO Auto-generated constructor stub
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Qna(int mNum) {
		super();
		this.mNum = mNum;
	}	

	public Qna(int qNum, String qTitle, int mNum, String qContent, Date qDate, QnaUpload qnaUpload, Member member,
			QnaComment qnaComment) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.mNum = mNum;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qnaUpload = qnaUpload;
		this.member = member;

	}

	public Qna(String qTitle, String qContent) {
		super();
		this.qTitle = qTitle;
		this.qContent = qContent;
	}


	public Qna(int qNum, String qTitle, String qContent) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.qContent = qContent;
	}


	public Qna(int qNum, String qTitle, int mNum, String qContent, Date qDate) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.mNum = mNum;
		this.qContent = qContent;
		this.qDate = qDate;
	}

	
	
	public QnaUpload getQnaUpload() {
		return qnaUpload;
	}


	public Qna(int qNum, String qTitle, int mNum, String qContent, Date qDate, QnaUpload qnaUpload) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.mNum = mNum;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qnaUpload = qnaUpload;
	}

	public Qna(int qNum, String qTitle, int mNum, String qContent, Date qDate, QnaUpload qnaUpload, Member member) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.mNum = mNum;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qnaUpload = qnaUpload;
		this.member = member;
	}







	public void setQnaUpload(QnaUpload qnaUpload) {
		this.qnaUpload = qnaUpload;
	}

	public int getqNum() {
		return qNum;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	@Override
	public String toString() {
		return "Qna [qNum=" + qNum + ", qTitle=" + qTitle + ", mNum=" + mNum + ", qContent=" + qContent + ", qDate="
				+ qDate + ", qnaUpload=" + qnaUpload + ", member=" + member + "]";
	}

}
