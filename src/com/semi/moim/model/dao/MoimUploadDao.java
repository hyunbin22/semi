package com.semi.moim.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.semi.moim.model.vo.MoimUpload;

public class MoimUploadDao {
	
	public int moimFileInsert(Connection conn, MoimUpload mu, int moimNum) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into tb_upload_moim values(seq_upload_moim.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			pstmt.setString(2, mu.getUpMoimOrgName());
			pstmt.setString(3, mu.getUpMoimReName());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public MoimUpload selectUpload(Connection conn, int moimNum) {
		
		PreparedStatement pstmt = null;
		MoimUpload mu = null;
		ResultSet rs = null;
		String sql = "select * from tb_upload_moim where moim_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mu = new MoimUpload();
				mu.setUpMoimNum(rs.getInt("up_moimnum"));
				mu.setMoimNum(rs.getInt("moim_num"));
				mu.setUpMoimOrgName(rs.getString("up_moim_org_filename"));
				mu.setUpMoimReName(rs.getString("up_moim_re_filename"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mu;
	}

}
