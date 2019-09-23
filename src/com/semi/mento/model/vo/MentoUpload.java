package com.semi.mento.model.vo;

public class MentoUpload {

   private int upMentoNum; // 멘토첨부파일 번호
   private int mtNum; // 멘토테이블 참조 멘토번호
   private String upMentoCategory; // 멘토 첨부파일 카테고리 참조 카테고리 이름
   private String upMentoNameLicense; // 멘토 자격증 이름
   private String upMentoOrgName; // 멘토 첨부파일 원래이름
   private String upMentoReName; // 멘토 첨부파일 변경이름


   public MentoUpload() {
      // TODO Auto-generated constructor stub
   }
   
   


   public MentoUpload(int mtNum, String upMentoCategory, String upMentoOrgName, String upMentoReName) {
	super();
	this.mtNum = mtNum;
	this.upMentoCategory = upMentoCategory;
	this.upMentoOrgName = upMentoOrgName;
	this.upMentoReName = upMentoReName;
}




public MentoUpload(int upMentoNum, int mtNum, String upMentoCategory, String upMentoNameLicense,
         String upMentoOrgName, String upMentoReName) {
      super();
      this.upMentoNum = upMentoNum;
      this.mtNum = mtNum;
      this.upMentoCategory = upMentoCategory;
      this.upMentoNameLicense = upMentoNameLicense;
      this.upMentoOrgName = upMentoOrgName;
      this.upMentoReName = upMentoReName;
   }
   
   
   
   public MentoUpload(String upMentoCategory, String upMentoNameLicense, String upMentoOrgName, String upMentoReName) {

	      this.upMentoCategory = upMentoCategory;
	      this.upMentoNameLicense = upMentoNameLicense;
	      this.upMentoOrgName = upMentoOrgName;
	      this.upMentoReName = upMentoReName;
	   }

   public MentoUpload(int mtNum, String upMentoCategory, String upMentoNameLicense, String upMentoOrgName, String upMentoReName) {

	   	  this.mtNum = mtNum;
	      this.upMentoCategory = upMentoCategory;
	      this.upMentoNameLicense = upMentoNameLicense;
	      this.upMentoOrgName = upMentoOrgName;
	      this.upMentoReName = upMentoReName;
	   }


   

   public int getUpMentoNum() {
      return upMentoNum;
   }




   public void setUpMentoNum(int upMentoNum) {
      this.upMentoNum = upMentoNum;
   }




   public int getMtNum() {
      return mtNum;
   }




   public void setMtNum(int mtNum) {
      this.mtNum = mtNum;
   }




   public String getUpMentoCategory() {
      return upMentoCategory;
   }




   public void setUpMentoCategory(String upMentoCategory) {
      this.upMentoCategory = upMentoCategory;
   }




   public String getUpMentoNameLicense() {
      return upMentoNameLicense;
   }




   public void setUpMentoNameLicense(String upMentoNameLicense) {
      this.upMentoNameLicense = upMentoNameLicense;
   }




   public String getUpMentoOrgName() {
      return upMentoOrgName;
   }




   public void setUpMentoOrgName(String upMentoOrgName) {
      this.upMentoOrgName = upMentoOrgName;
   }




   public String getUpMentoReName() {
      return upMentoReName;
   }




   public void setUpMentoReName(String upMentoReName) {
      this.upMentoReName = upMentoReName;
   }




   @Override
   public String toString() {
      return "MentoUpload [upMentoNum=" + upMentoNum + ", mtNum=" + mtNum + ", upMentoCategory=" + upMentoCategory
            + ", upMentoNameLicense=" + upMentoNameLicense + ", upMentoOrgName=" + upMentoOrgName
            + ", upMentoReName=" + upMentoReName + "]";
   }




}