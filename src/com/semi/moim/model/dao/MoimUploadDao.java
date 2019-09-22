package com.semi.moim.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	//모임게시물 첨부파일 가져오기
	public List<MoimUpload> selectUpload(Connection conn, int moimNum) {
		
		PreparedStatement pstmt = null;
		MoimUpload mu = null;
		ResultSet rs = null;
		List<MoimUpload> list = new ArrayList();
		String sql = "select * from tb_upload_moim where moim_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mu = new MoimUpload();
				mu.setUpMoimNum(rs.getInt("up_moimnum"));
				mu.setMoimNum(rs.getInt("moim_num"));
				mu.setUpMoimOrgName(rs.getString("up_moim_org_filename"));
				mu.setUpMoimReName(rs.getString("up_moim_re_filename"));
				list.add(mu);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	//게시글 수정시 원래있던 첨부파일 지웠을떄
	public int deleteUpload(Connection conn, int upMoimNum) {
		
		PreparedStatement pstmt = null;
		String sql = "delete from tb_upload_moim where up_moimnum=?";
		int result = 0; 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, upMoimNum);
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//게시글 수정시 원래있던 첨부파일 다지웠을때
	public int allDeleteUpload(Connection conn, int moimNum) {
		PreparedStatement pstmt = null;
		String sql = "delete from tb_upload_moim where moim_Num=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moimNum);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
