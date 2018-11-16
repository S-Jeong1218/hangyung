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
	}

}
