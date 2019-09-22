package com.semi.mento.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.lecture.model.vo.Lecture;
import com.semi.mento.model.vo.MentoUpload;

public class MentoUploadDao {

	private Properties prop = new Properties();

	public MentoUploadDao() {
		String path=MentoUploadDao.class.getResource("/sql/semi/mento-query.properties").getPath();
		try {
			prop.load(new FileReader(path));

		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	 // 멘토이미지 등록
    public int registerMentoImage(Connection conn, MentoUpload mtu, int mtnum, String category) {
       PreparedStatement pstmt=null;
       System.out.println("mtnum : "+mtnum);
       int result=0;
       String sql=prop.getProperty("registerMentoImage");
       try {
          pstmt=conn.prepareStatement(sql);
          pstmt.setInt(1, mtnum);
          pstmt.setString(2, category);
          pstmt.setString(3, mtu.getUpMentoNameLicense());
          pstmt.setString(4, mtu.getUpMentoOrgName());
          pstmt.setString(5, mtu.getUpMentoReName());
          result=pstmt.executeUpdate();

       }catch(SQLException e) {
          e.printStackTrace();
       }finally {
          close(pstmt);
       }
       return result;
    }
    

	//첨부파일 전체불러오기
	public List<MentoUpload> mentoUpList(Connection conn, int mtNum) {
		System.out.println("MentoUploadDao" + mtNum);
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mentoUpList");
		List<MentoUpload> list = new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MentoUpload mtu = new MentoUpload();
				mtu.setUpMentoNum(rs.getInt("up_mentonum"));
				mtu.setMtNum(rs.getInt("mtnum"));
				mtu.setUpMentoCategory(rs.getString("up_mento_category"));
				mtu.setUpMentoNameLicense(rs.getString("up_mento_name_license"));
				mtu.setUpMentoOrgName(rs.getString("up_mento_org_name"));
				mtu.setUpMentoReName(rs.getString("up_mento_re_name"));
				list.add(mtu);
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 
		return list;
	}

	//프로필 사진 불러오기
	public List<MentoUpload> mentoUpProList(Connection conn, int mtNum) {

		PreparedStatement pstmt = null;
		String sql = "select * from tb_upload_mento where mtnum=? and up_mento_category='profile'";
		List<MentoUpload> list = new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				MentoUpload mtu = new MentoUpload();
				mtu.setUpMentoNum(rs.getInt("up_mentonum"));
				mtu.setMtNum(rs.getInt("mtnum"));
				mtu.setUpMentoCategory(rs.getString("up_mento_category"));
				mtu.setUpMentoNameLicense(rs.getString("up_mento_name_license"));
				mtu.setUpMentoOrgName(rs.getString("up_mento_org_name"));
				mtu.setUpMentoReName(rs.getString("up_mento_re_name"));
				list.add(mtu);

			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 

		return list;
	}

	//여러개 들어오는 자격증
	public List<MentoUpload> mentoUpLicenList(Connection conn, int mtNum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mentoUpLicenList");
		List<MentoUpload> list = new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MentoUpload mtu = new MentoUpload();
				mtu.setUpMentoNum(rs.getInt("up_mentonum"));
				mtu.setMtNum(rs.getInt("mtnum"));
				mtu.setUpMentoCategory(rs.getString("up_mento_category"));
				mtu.setUpMentoNameLicense(rs.getString("up_mento_name_license"));
				mtu.setUpMentoOrgName(rs.getString("up_mento_org_name"));
				mtu.setUpMentoReName(rs.getString("up_mento_re_name"));
				list.add(mtu);

			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	//멘토 사진 수정
	public int updateMentoImage(Connection conn, MentoUpload mtu1, int result, String category) {
		PreparedStatement pstmt = null;
		int result1=0;
		String sql=prop.getProperty("updateMentoImage");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, mtu1.getUpMentoNameLicense());
			pstmt.setString(3, mtu1.getUpMentoOrgName());
			pstmt.setString(4, mtu1.getUpMentoReName());
			pstmt.setInt(5, result);

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result1;
	}
	
	//멘토 이미지 삭제
	public int deleteMentoImg(Connection conn, int mtNum) {
		PreparedStatement pstmt = null;
		int result1=0;
		String sql=prop.getProperty("deleteMentoImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mtNum);
			result1=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result1;
	}


}
