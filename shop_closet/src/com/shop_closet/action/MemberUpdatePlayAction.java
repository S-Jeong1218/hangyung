package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop_closet.dao.MemberDAO;
import com.shop_closet.dto.MemberDTO;

public class MemberUpdatePlayAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		HttpSession session = request.getSession();
		
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
		System.out.println(mDto.toString());
		
		//MemberDAO mDao = new MemberDAO();
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.updateMember(mDto);
		
		if(result>0) {
			System.out.println("수정성공");
			
			url="index.bizpoll";
			
			session.removeAttribute("id");
			session.setAttribute("loginUser", mDto);
		}else {
			System.out.println("수정실패");
			url="memberUpdate.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
}
