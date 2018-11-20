package com.shop_closet.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.shop_closet.dao.MemberDAO;

public class loginCheckTest {

	@Test
	public void testLoginCheck() {
		String id = "tnals123";
		String pw = "sumin12345";
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.LoginCheck(id, pw);
		/*String result1 = mDao.confirmPW(id, pw);
		int result = Integer.parseInt(result1);*/
		if(mDao.LoginCheck(id, pw) != null) {
			System.out.println("로그인성공");
		}else {
			System.out.println("로그인 실패");
		}
		
		
	}

}
