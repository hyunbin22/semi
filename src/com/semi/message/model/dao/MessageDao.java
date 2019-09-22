package com.semi.message.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.category.model.dao.CategoryDao;
import com.semi.member.model.dao.MemberDao;
import com.semi.message.model.vo.Message;

public class MessageDao {
	
	private Properties prop=new Properties();
	
	public MessageDao() {
		String path=CategoryDao.class.getResource("/sql/semi/message-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//헤더에서 안읽은 메세지수 보여주기
	public int noReadCount(Connection conn, String id) {
		int mNum = new MemberDao().selectMember(conn, id).getmNum();
		
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from tb_message where message_readCount=0 and to_mnum="+mNum;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return result;
	}
	
	//대화상대별 안읽은 메세지 갯수
	public int noReadCountById(Connection conn, String fromId, String toId) {
		int fromMNum = new MemberDao().selectMember(conn, fromId).getmNum();
		int toMNum =  new MemberDao().selectMember(conn, toId).getmNum();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from tb_message where message_readCount=0 and to_mnum=? and from_mnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, toMNum);
			pstmt.setInt(2, fromMNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	//메세지 읽음 표시
	public int readChat(Connection conn, int fromMNum, int toMNum) {
		PreparedStatement pstmt = null;
		String sql = "update tb_message set message_readcount=1 where (from_mnum=? and to_mnum=?)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, toMNum);
			pstmt.setInt(2, fromMNum);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//메세지 불러오기
	public List<Message> messageListById(Connection conn, int fromMNum, int toMNum, String chatId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList();
		String sql = "select * from tb_message where ((from_mnum=? and to_mnum=?) or (from_mnum=? and to_mnum=?)) and message_Num > ? order by message_sendDate";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fromMNum);
			pstmt.setInt(2, toMNum);
			pstmt.setInt(3, toMNum);
			pstmt.setInt(4, fromMNum);
			pstmt.setInt(5, Integer.parseInt(chatId));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Message me = new Message();
				me.setMessageNum(rs.getInt("message_num"));
				me.setFromMNum(rs.getInt("from_mnum"));
				me.setToMNum(rs.getInt("to_mnum"));
				me.setMessageText(rs.getString("message_text").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int messageTime = Integer.parseInt(rs.getString("message_sendDate").substring(11, 13));
				String timeType = "오전";
				if(messageTime > 12) {
					timeType="오후";
					messageTime -= 12;
				}
				me.setMessageSendDate(rs.getString("message_sendDate").substring(0,11) + " " + timeType + " " + messageTime + ":" + rs.getString("message_sendDate").substring(14, 16));
				me.setMessageReadCount(rs.getInt("message_readCount"));
				
				me.setFromMember(new MemberDao().selectMemberMnum(conn, rs.getInt("from_mnum")));
				me.setToMember(new MemberDao().selectMemberMnum(conn, rs.getInt("to_mnum")));
				
				list.add(me);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	//메세지 불러오기
	public List<Message> messageListByRecent(Connection conn, int fromMNum, int toMNum, int number) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList();
		String sql = "select * from tb_message where ((from_mnum=? and to_mnum=?) or (from_mnum=? and to_mnum=?)) and message_Num > (select max(message_Num)-? from tb_message where (from_mnum=? and to_mnum=?) or (from_mnum=? and to_mnum=?)) order by message_sendDate";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fromMNum);
			pstmt.setInt(2, toMNum);
			pstmt.setInt(3, toMNum);
			pstmt.setInt(4, fromMNum);
			pstmt.setInt(5, number);
			pstmt.setInt(6, fromMNum);
			pstmt.setInt(7, toMNum);
			pstmt.setInt(8, toMNum);
			pstmt.setInt(9, fromMNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Message me = new Message();
				me.setMessageNum(rs.getInt("message_num"));
				me.setFromMNum(rs.getInt("from_mnum"));
				me.setToMNum(rs.getInt("to_mnum"));
				me.setMessageText(rs.getString("message_text").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				me.setMessageText(rs.getString("message_text"));
				int messageTime = Integer.parseInt(rs.getString("message_sendDate").substring(11, 13));
				String timeType = "오전";
				if(messageTime > 12) {
					timeType="오후";
					messageTime -= 12;
				}
				me.setMessageSendDate(rs.getString("message_sendDate").substring(0,11) + " " + timeType + " " + messageTime + ":" + rs.getString("message_sendDate").substring(14, 16));
				me.setMessageReadCount(rs.getInt("message_readCount"));
				
				me.setFromMember(new MemberDao().selectMemberMnum(conn, rs.getInt("from_mnum")));
				me.setToMember(new MemberDao().selectMemberMnum(conn, rs.getInt("to_mnum")));
				
				list.add(me);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}	
	
	//메세지 리스트(각 대화상대 별 맨 마지막꺼 리스트로 보여주기)
	public List<Message> getMessageBox(Connection conn, String userId) {
		int mNum = new MemberDao().selectMember(conn, userId).getmNum();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList();
		String sql = "select * from tb_message where message_num in (select max(message_num) from tb_message "
				+ "where to_mnum=? or from_mnum=? group by from_mnum, to_mnum)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNum);
			pstmt.setInt(2, mNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Message me = new Message();
				me.setMessageNum(rs.getInt("message_num"));
				me.setFromMNum(rs.getInt("from_mnum"));
				me.setToMNum(rs.getInt("to_mnum"));
				me.setMessageText(rs.getString("message_text"));
				int messageTime = Integer.parseInt(rs.getString("message_sendDate").substring(11, 13));
				String timeType = "오전";
				if(messageTime > 12) {
					timeType="오후";
					messageTime -= 12;
				}
				me.setMessageSendDate(rs.getString("message_sendDate").substring(0,11) + " " + timeType + " " + messageTime + ":" + rs.getString("message_sendDate").substring(14, 16));
				me.setMessageReadCount(rs.getInt("message_readCount"));
				
				me.setFromMember(new MemberDao().selectMemberMnum(conn, rs.getInt("from_mnum")));
				me.setToMember(new MemberDao().selectMemberMnum(conn, rs.getInt("to_mnum")));
				
				list.add(me);			
			}
			for(int i = 0; i < list.size(); i++) {
				Message x = list.get(i);
				for(int j = 0; j < list.size(); j++) {
					Message y = list.get(j);
					if(x.getFromMNum() == y.getToMNum() && x.getToMNum()==y.getFromMNum()) {
						if(x.getMessageNum() < y.getMessageNum()) {
							list.remove(x);
							i--;
							break;
						} else {
							list.remove(y);
							j--;
						}
					}
				} 
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}	
	
	//메세지 저장
	public int insertMessage(Connection conn, String fromId, String toId, String text) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into tb_message values(seq_message.nextval,(select mnum from tb_member where mid=?),(select mnum from tb_member where mid=?),?,default,default)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, text);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
