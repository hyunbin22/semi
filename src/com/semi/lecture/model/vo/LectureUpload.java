package com.semi.lecture.model.vo;

public class LectureUpload {

	private int upLectureNum;
	private int lecNum;
	private String upLectureCategory;
	private String LectureOrgName;
	private String LectureReName;

	public LectureUpload() {
		// TODO Auto-generated constructor stub
	}

	public LectureUpload(int upLectureNum, int lecNum, String upLectureCategory, String LectureOrgName, String LectureReName) {
		super();
		this.upLectureNum = upLectureNum;
		this.lecNum = lecNum;
		this.upLectureCategory = upLectureCategory;
		this.LectureOrgName = LectureOrgName;
		this.LectureReName = LectureReName;
	}
	
	

	public LectureUpload(int lecNum, String upLectureCategory, String LectureOrgName, String LectureReName) {
		super();
		this.lecNum = lecNum;
		this.upLectureCategory = upLectureCategory;
		this.LectureOrgName = LectureOrgName;
		this.LectureReName = LectureReName;
	}

	public int getUpLectureNum() {
		return upLectureNum;
	}

	public void setUpLectureNum(int upLectureNum) {
		this.upLectureNum = upLectureNum;
	}

	public int getLecNum() {
		return lecNum;
	}

	public void setLecNum(int lecNum) {
		this.lecNum = lecNum;
	}

	public String getUpLectureCategory() {
		return upLectureCategory;
	}

	public void setUpLectureCategory(String upLectureCategory) {
		this.upLectureCategory = upLectureCategory;
	}

	public String getLectureOrgName() {
		return LectureOrgName;
	}

	public void setLectureOrgName(String lectureOrgName) {
		LectureOrgName = lectureOrgName;
	}

	public String getLectureReName() {
		return LectureReName;
	}

	public void setLectureReName(String lectureReName) {
		LectureReName = lectureReName;
	}

	@Override
	public String toString() {
		return "LectureUpload [upLectureNum=" + upLectureNum + ", lecNum=" + lecNum + ", upLectureCategory="
				+ upLectureCategory + ", LectureOrgName=" + LectureOrgName + ", LectureReName=" + LectureReName + "]";
	}

	
	

}