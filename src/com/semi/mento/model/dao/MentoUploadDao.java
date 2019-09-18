package com.semi.mento.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

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
	

}
