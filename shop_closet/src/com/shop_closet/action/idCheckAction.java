package com.shop_closet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.shop_closet.dao.MemberDAO;

//Ajax사용
public class idCheckAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userid= request.getParameter("id");
		System.out.println("id:"+userid);
		
		if(userid != null) {
			if(userid.trim().equals("")==false) {
				//MemberDAO mDao = new MemberDAO();
				MemberDAO mDao = MemberDAO.getInstance();
				//String msg = mDao.confirmID(userid);
				String msg = mDao.confirmID(userid);
				
				// 이 방법 안됨 -> request.setAtrribute("idCount",msg);
				//Ajax -> json방식 ->값을 다시 전달할때도 json방식
				
				JSONObject jObj = new JSONObject();
				
				jObj.put("massage", msg);
				jObj.put("id", userid);
				
				//JSON객체에 담은 데이터를 호출한 페이지로 전송하는 기능
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
			}
		}
		
		return null;
	}
}
