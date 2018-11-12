package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop_closet.dao.MemberDAO;
import com.shop_closet.dto.MemberDTO;

public class MemberUpdateAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "member_update.jsp";
		
		//회원정보 수정을 하려면 반드시 선행조건이 있다.
		//로그인이 되있어야 한다.
		//session이 null이 아니면 로그인!
		
		HttpSession session = request.getSession(); //session값 취득
		
		ActionForward forward = new ActionForward();
		
		if(session.getAttribute("loginUser") == null) { //login안된 경우
			url = "index.bizpoll";
		}else { //login 된 경우
			url = "member_update.jsp";
			forward.setPath(url);
			forward.setRedirect(false);
			String id = request.getParameter("inputid");
			String pw = request.getParameter("inputpw");
			String name = request.getParameter("inputname");
			String phone = request.getParameter("inputphone");
			String mail1 = request.getParameter("email");
			String mail2 = request.getParameter("email_url");
			String email = mail1 + "@" + mail2;
			String zipcode = request.getParameter("sample6_postcode");
			String addr1 = request.getParameter("sample6_address");
			String addr2 = request.getParameter("sample6_address2");
			
			MemberDTO mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2);
			// MemberDAO mDao = new MemberDAO();
			MemberDAO mDao = MemberDAO.getInstance();
			System.out.println(mDto.toString());
			
			int result = mDao.updateMember(mDto);
			
			if(result>0) {
				System.out.println("회원수정 성공");
				String url2="index.bizpoll";
				forward.setPath(url2);
				forward.setRedirect(false);
			}else {
				System.out.println("회원수정 실패");
				forward.setPath(url);
				forward.setRedirect(false);
			}

		}
		
		return forward;
	}
}
