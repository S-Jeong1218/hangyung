package com.shop_closet.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.shop_closet.dao.MemberDAO;
import com.shop_closet.dto.MemberDTO;

public class LoginPlayAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*String url = "";*/
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id+","+pw);
		
		//DAO클래스에 LoginCheck()메서드를 활용하여 id와  pw값으로 SELECT절에 Where 조건으로 검색후
		//결과값을 가지고 현재 지금 이곳 Action단으로 돌아오는 코드를 작성.
		
		//MemberDAO mDao = new MemberDAO();
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.LoginCheck(id, pw);
		
		String message = null;
		
		if(mDto != null) {
			System.out.println("로그인 성공");
			//Session값에 로그인된 회원 정보를 담아야 함.
			session.removeAttribute("id"); //혹시모를 기존에 남아있는 값을 제거
			session.setAttribute("loginUser", mDto);
			/*url = "index.bizpoll";*/
			message = "1";
		}else {
			System.out.println("로그인 실패");
			message = "-1";
		}
		JSONObject jObj = new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		/*ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);*/
		
		return null;
	}
}
