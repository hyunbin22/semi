package com.semi.subcategory.model.dao;

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

import com.semi.category.model.vo.Category;
import com.semi.subcategory.model.vo.SubCategory;

public class SubCategoryDao {
	
	private Properties prop=new Properties();
	
	public SubCategoryDao() {
		String path=SubCategoryDao.class.getResource("/sql/semi/subcategory-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollSubCategory(Connection conn, String inputsubcategory, int maincategory) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("enrollSubCategory");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputsubcategory);
			pstmt.setInt(2, maincategory);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<SubCategory> selectSubCategory(Connection conn){
		Statement stmt=null;
		ResultSet rs=null;
		List<SubCategory> list=new ArrayList();
		String sql="select * from tb_subcategory";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				SubCategory sc=new SubCategory();
				sc.setSubNum(rs.getInt("subNum"));
				sc.setSubName(rs.getString("SubName"));
				list.add(sc);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	public int updateSubCategory(Connection conn, int subcategory, String inputsubcategory) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateSubCategory");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputsubcategory);
			pstmt.setInt(2, subcategory);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteSubCategory(Connection conn, int subcategory) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteSubCategory");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, subcategory);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<SubCategory> selectSubCategory(Connection conn,int scNum){
		Statement stmt=null;
		ResultSet rs=null;
		List<SubCategory> list=new ArrayList();
		String sql="select subname from tb_subcategory where scnum = " + scNum;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				SubCategory sc=new SubCategory();
				sc.setSubName(rs.getString("subName"));
				list.add(sc);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public int selectsubName(Connection conn, String subCategory) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="select subnum from tb_subcategory where subname=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, subCategory);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
