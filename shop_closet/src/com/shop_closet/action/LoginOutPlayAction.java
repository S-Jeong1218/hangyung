package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOutPlayAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.bizpoll";
		//jsp는 화면단만 출력. model단의 데이터 못 가져옴.
		
		// session을 가져옴
		HttpSession session = request.getSession();
		
		//session에 값이 없을 것을 대비해서 조건문 작성.
		if(session != null) {
			//session 초기화.=>로그인 정보삭제
			session.invalidate();
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		//false 일때, 즉 forward일때는 로그아웃 후 뒤로가기 했을 때 로그인 정보가 그대로 남아 있음.
		//sendRedirect일때는 로그아웃 후 뒤로가기 했을 때 로그인 정보가 사라짐. LoginPlayAction도 true로 바꿔주기
		//forward는 page1에서 page2로 이동할때  page1위에 page2를 덮어씀. 그러니 page2에서 뒤로가기하면 page1이 다시 나타남
		//sendRedirect는 page1에서 page2로 이동할때  page2를 새로 만듦! 그러니 page2에서 뒤로가기하면 page1이 다시 나타나지않음.
		//DB에 가서 작업하는 경우 : sendRedirect
		//page만 띄워주는 경우: forward
		
		return forward;
	}
}
