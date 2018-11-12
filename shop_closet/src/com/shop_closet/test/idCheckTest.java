package com.shop_closet.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.shop_closet.dao.MemberDAO;

public class idCheckTest {
	String userid = "tnals1234";
	
	@Test
	public void testConfirmID() {
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.confirmID(userid);
	}

}
