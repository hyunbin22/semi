package com.semi.sublocal.model.dao;

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

import com.semi.local.model.vo.Local;
import com.semi.subcategory.model.vo.SubCategory;
import com.semi.sublocal.model.vo.SubLocal;

public class SubLocalDao {
	
	private Properties prop=new Properties();
	
	public SubLocalDao() {
		String path=SubLocalDao.class.getResource("/sql/semi/sublocal-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollSubLocal(Connection conn, SubLocal sl, Local l) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("enrollSubLocal");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sl.getLocalCountry());
			pstmt.setInt(2, l.getLocalNum());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<SubLocal> selectSubLocal(Connection conn){
		Statement stmt=null;
		ResultSet rs=null;
		List<SubLocal> list=new ArrayList();
		String sql="select * from tb_sub_location";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				SubLocal sl=new SubLocal();
				sl.setLocalsubNum(rs.getInt("sublocalNum"));
				sl.setLocalCountry(rs.getString("local_Country"));
				list.add(sl);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	public int updateSubLocal(Connection conn, String localCountry, int localsubNum) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateSubLocal");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, localCountry);
			pstmt.setInt(2, localsubNum);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteSubLocal(Connection conn, String localCountry) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteSubLocal");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, localCountry);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<SubLocal> selectSubLocal(Connection conn, int localNum) {
		Statement stmt=null;
		ResultSet rs=null;
		List<SubLocal> list=new ArrayList();
		String sql="select local_country from tb_sub_location where localNum = " + localNum;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				SubLocal sl=new SubLocal();
				sl.setLocalCountry(rs.getString("local_country"));
				list.add(sl);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public int selectsubLocalName(Connection conn, int local, String subLocal) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql="select sublocalnum from tb_sub_location where localnum=? and local_country=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, local);
			pstmt.setString(2, subLocal);
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
