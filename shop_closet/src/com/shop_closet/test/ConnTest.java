package com.shop_closet.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnTest {
	//인스턴스의 주소를 저장하기 위한 참조변수
	private static Connection conn;
	
	// Connection 관련 정보 상수
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private final static String USER = "java";
	private final static String PASS = "1234";
	
	@Test
	public void testGetConnection() {
		conn= null;
		
		if (conn==null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASS);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
