package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.shop_closet.dao.MemberDAO;

public class PwCheckAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id:"+id);
		System.out.println("pw:"+pw);
		
		//DB에서 pw값 가지고와서 비교. SELECT pw FROM member WHERE id=?;
		//id값을 구하는 방법 2가지
		//1. Controller단에서 Session객체 호출해서 ID값 빼오는 방법
		//2. View단에서 Session에 담겨있는 ID값을 PW와 불러오는 방법
		
		//MemberDAO mDao = new MemberDAO();
		MemberDAO mDao = MemberDAO.getInstance();
		String result = mDao.confirmPW(id, pw);
		
		System.out.println("result:"+result);
		
		JSONObject jObj = new JSONObject();
		jObj.put("message", result);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		//페이지 이동 안 하게 null!
		return null;
	}
}
