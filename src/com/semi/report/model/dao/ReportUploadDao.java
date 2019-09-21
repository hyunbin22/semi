package com.semi.report.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.mento.model.dao.MentoDao;
import com.semi.report.model.vo.ReportUpload;

public class ReportUploadDao {
	
private Properties prop = new Properties();
	
	public ReportUploadDao() {
		String path=MentoDao.class.getResource("/sql/semi/report-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	List<ReportUpload> reportUpProList(Connection conn, int reportNum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("serachReportUp");
		List<ReportUpload> list = new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReportUpload rpu = new ReportUpload();
				rpu.setReportRefNum(reportNum);
				rpu.setFileOriName("UP_REPORT_ORG_FILENAME");
				rpu.setFileReNmae("UP_REPORT_RE_FILENAME");
				list.add(rpu);
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 
		return list;
	}

}
