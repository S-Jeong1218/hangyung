package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_closet.dao.MemberDAO;

public class PwUpdatePlayAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "pw_update.jsp";
		
		//현재 비밀번호, 새 비밀번호, 새 비밀번호 확인 중 새 비밀번호만 받아온다!
		String pw = request.getParameter("inputpw");
		System.out.println("변경할 pw:"+pw);
		String id = request.getParameter("inputid");
		System.out.println("변경할 ID:"+id);
		
		//값을 못 받아온다!
		//1. getParameter("") 매개변수가 name값으로 설정되있는지 확인
		//2. 현재 Action단으로 이동하는지 체크
		//		console창에 *.bizpoll이 출력되는지 확인.
		//		가) 안탐 : 화면단으로 가서 form태그에 action값, submit()등을 확인한다.
		//      나) 간다 : 
		
		//MemberDAO mDao = new MemberDAO();
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.updatePw(id, pw);
		
		if(result>0) {
			System.out.println("pw 수정 성공");
			url = "index.bizpoll";
		}else {
			System.out.println("pw 수정 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
}
