package com.semi.moim.model.vo;

import java.util.List;

import com.semi.member.model.vo.Member;

public class Moim {
	
	private int moimNum;
	private int mNum;
	private String moimTitle;
	private String moimText;
	private int moimReadCount;
	private String moimDate;
	private String moimKeyword;
	private Member member;
	private List<MoimUpload> moimUpload;

	public Moim() {
		// TODO Auto-generated constructor stub
	}

	public Moim(int moimNum, int mNum, String moimTitle, String moimText, int moimReadCount, String moimDate,
			String moimKeyword, Member member, List<MoimUpload> moimUpload) {
		super();
		this.moimNum = moimNum;
		this.mNum = mNum;
		this.moimTitle = moimTitle;
		this.moimText = moimText;
		this.moimReadCount = moimReadCount;
		this.moimDate = moimDate;
		this.moimKeyword = moimKeyword;
		this.member = member;
		this.moimUpload = moimUpload;
	}

	public Moim(int mNum, String moimTitle, String moimText, String moimKeyword) {
		super();
		this.mNum = mNum;
		this.moimTitle = moimTitle;
		this.moimText = moimText;
		this.moimKeyword = moimKeyword;
	}


	public Moim(int moimNum, int mNum, String moimTitle, String moimText, String moimKeyword) {
		super();
		this.moimNum = moimNum;
		this.mNum = mNum;
		this.moimTitle = moimTitle;
		this.moimText = moimText;
		this.moimKeyword = moimKeyword;
	}

	public int getMoimNum() {
		return moimNum;
	}

	public void setMoimNum(int moimNum) {
		this.moimNum = moimNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getMoimTitle() {
		return moimTitle;
	}

	public void setMoimTitle(String moimTitle) {
		this.moimTitle = moimTitle;
	}

	public String getMoimText() {
		return moimText;
	}

	public void setMoimText(String moimText) {
		this.moimText = moimText;
	}

	public int getMoimReadCount() {
		return moimReadCount;
	}

	public void setMoimReadCount(int moimReadCount) {
		this.moimReadCount = moimReadCount;
	}

	

	public String getMoimDate() {
		return moimDate;
	}



	public void setMoimDate(String moimDate) {
		this.moimDate = moimDate;
	}



	public String getMoimKeyword() {
		return moimKeyword;
	}

	public void setMoimKeyword(String moimKeyword) {
		this.moimKeyword = moimKeyword;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}



	public List<MoimUpload> getMoimUpload() {
		return moimUpload;
	}

	public void setMoimUpload(List<MoimUpload> moimUpload) {
		this.moimUpload = moimUpload;
	}

	@Override
	public String toString() {
		return "Moim [moimNum=" + moimNum + ", mNum=" + mNum + ", moimTitle=" + moimTitle + ", moimText=" + moimText
				+ ", moimReadCount=" + moimReadCount + ", moimDate=" + moimDate + ", moimKeyword=" + moimKeyword
				+ ", member=" + member + ", moimUpload=" + moimUpload + "]";
	}


	
}
