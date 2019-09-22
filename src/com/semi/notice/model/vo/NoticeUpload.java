package com.semi.notice.model.vo;

public class NoticeUpload {

	private int noticeRefNum; // 공지게시글 참조 번호
	private String fileOriName; // 첨부파일 원래 이름
	private String fileReNmae; //첨부파일 변경 이름
	
	public NoticeUpload() {
		// TODO Auto-generated constructor stub
	}

	
	
	public NoticeUpload(String fileOriName, String fileReNmae) {
		super();
		this.fileOriName = fileOriName;
		this.fileReNmae = fileReNmae;
	}



	public NoticeUpload(int noticeRefNum, String fileOriName, String fileReNmae) {
		super();
		this.noticeRefNum = noticeRefNum;
		this.fileOriName = fileOriName;
		this.fileReNmae = fileReNmae;
	}

	public int getNoticeRefNum() {
		return noticeRefNum;
	}

	public void setNoticeRefNum(int noticeRefNum) {
		this.noticeRefNum = noticeRefNum;
	}

	public String getFileOriName() {
		return fileOriName;
	}

	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}

	public String getFileReNmae() {
		return fileReNmae;
	}

	public void setFileReNmae(String fileReNmae) {
		this.fileReNmae = fileReNmae;
	}

	@Override
	public String toString() {
		return "NoticeUpload [noticeRefNum=" + noticeRefNum + ", fileOriName=" + fileOriName + ", fileReNmae="
				+ fileReNmae + "]";
	}
	
	
	
	
	
	
}
