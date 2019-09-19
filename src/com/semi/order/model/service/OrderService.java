package com.semi.order.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.order.model.dao.OrderDao;
import com.semi.order.model.vo.Order;

import common.template.JDBCTemplate;

public class OrderService {
	
private OrderDao dao = new OrderDao();
	
	//수업신청
	public int insertOrder(Order order, String mId) {
		Connection conn = getConnection();

		int result = dao.insertOrder(conn, mId, order);
		
		System.out.println("서비스 result : "+result);
		if(result>0) {
			commit(conn);
//			int result2 = dao.selectOrder(conn, result).getsNum();
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//결제 전 신청내역 가져오기
	public Order noPayOrder(int oNum) {
		Connection conn = getConnection();
		Order order = null;
		order = dao.selectOrder(conn, oNum);
		close(conn);
		return order;
		
	}

	//결제 Y로 바꾸기
	public int updatePayment(int oNum) {
		Connection conn = getConnection();
		int result = dao.updatePayment(conn, oNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int selectStudyListCount() {
		Connection conn = getConnection();
		int result = dao.selectStudyListCount(conn);
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}

		return result;
	}

	public List<Order> selectOrderList(int cPage, int numPerPage, int mNum) {
		Connection conn = getConnection();
		List<Order> list = dao.selectStudyList(conn,cPage,numPerPage, mNum);
		close(conn);
		return list;
	}

	public Order seeMoreStudy(int lecNum) {
		Connection conn = getConnection();
		Order o = dao.seeMoreStudyList(conn, lecNum);
		close(conn);
		return o;
	}

}
