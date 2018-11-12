package com.shop_closet.mybatis;

import java.io.Reader;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private static SqlSessionFactory sqlSessionFactory; //sqlSessionFactory는 mybatis를 쓰기 위한 객체
	
	static {
		//resource라는 변수를 선언. 아직 기능 no
		
		String resource = "com/shop_closet/mybatis/Configuration.xml";
		
		//DB와 입출력(io)할때는 무조건 try~catch
		try {
			//JAVA입출력 객체
			//getResourceAsReader = resource라는 파일을 읽어줌
			
			Reader reader = Resources.getResourceAsReader(resource);
			
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
