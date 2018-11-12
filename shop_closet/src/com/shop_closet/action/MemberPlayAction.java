package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_closet.dao.MemberDAO;
import com.shop_closet.dto.MemberDTO;

public class MemberPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "welcome_join.jsp";
		String url2 = "member.bizpoll";

		// View단에서 전송한 데이터를 받아오세요.
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
		//MemberDAO mDao = new MemberDAO();
		MemberDAO mDao = MemberDAO.getInstance();
		
		System.out.println(mDto.toString());
		
		int result = mDao.insertMember(mDto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		ActionForward forward = new ActionForward();
		
		if(result>0) {
			System.out.println("회원가입성공");
			
			forward.setPath(url);
			forward.setRedirect(true);	
		}else {
			System.out.println("회원가입실패");
			forward.setPath(url2);
		}

		return forward;
	}

}
