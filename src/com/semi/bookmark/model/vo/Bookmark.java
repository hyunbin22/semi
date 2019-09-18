package com.semi.bookmark.model.vo;

import com.semi.lecture.model.vo.Lecture;

public class Bookmark {
	
	private int bNum; // 북마크 Num
	private int mNum; // 회원 번호
	private int lecNum; //수업 번호
	private Lecture lecture;
	
	public Bookmark() {
		
	}

	public Bookmark(int bNum, int mNum, int lecNum, Lecture lecture) {
		this.bNum = bNum;
		this.mNum = mNum;
		this.lecNum = lecNum;
		this.lecture = lecture;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getLecNum() {
		return lecNum;
	}

	public void setLecNum(int lecNum) {
		this.lecNum = lecNum;
	}

	public Lecture getLecture() {
		return lecture;
	}

	public void setLecture(Lecture lecture) {
		this.lecture = lecture;
	}

	@Override
	public String toString() {
		return "Bookmark [bNum=" + bNum + ", mNum=" + mNum + ", lecNum=" + lecNum + ", l=" + lecture + "]";
	}
	
	
	
	
	
	

}
