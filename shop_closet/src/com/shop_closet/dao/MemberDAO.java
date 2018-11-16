package com.shop_closet.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shop_closet.common.DBManager;
import com.shop_closet.dto.MemberDTO;
import com.shop_closet.mybatis.SqlMapConfig;


public class MemberDAO {
	//Mybatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
		
	//mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
		
	//싱글톤으로 new없이 사용하기 때문에 다른 곳에서 객체생성 못하게 private로 막음
	public MemberDAO() {}
		
	//싱글톤 패턴 -객체생성 1회 실시 후 공유해서 사용
	//객체생성 1회 실시
	private static MemberDAO instance =new MemberDAO();
		
	//공유의 개념으로
	//외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	//회원 가입 = 회원 등록
	public int insertMember(MemberDTO mDto) {
		int result=0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("insertMember",mDto);
			sqlSession.commit(); //자동커밋 안됨.
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//회원가입 페이지 아이디 중복체크  Ajax
	public String confirmID(String userid) {
		String result=null;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("confirmID",userid);
			if(result!=null) {
				result = "-1";
			}else {
				result="1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	//비밀번호 수정페이지 현재 비밀번호와 일치하는지 확인
	public String confirmPW(String userid, String userpw) {
		String result=null;
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(userid);
		mDto.setPw(userpw);
		try {
			result = sqlSession.selectOne("confirmPW", mDto); //값 하나만 보낼 수 있어서 mDto에 담음.
			if(result!=null) {
				result = "-1";
			}else {
				result="1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//로그인 기능
	public MemberDTO LoginCheck(String userid,String userpw) {
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(userid);
		mDto.setPw(userpw);
		try {
			mDto = sqlSession.selectOne("LoginCheck",mDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return mDto;
	}
	
	//회원정보 수정, 비밀번호 제외
	public int updateMember(MemberDTO mDto) {
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			result = sqlSession.update("updateMember",mDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public int updatePw(String userid,String userpw) {
		int result=0;
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(userid);
		mDto.setPw(userpw);
		try {
			result = sqlSession.update("updatePw",mDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//회원 삭제(탈퇴)
	public int deleteMember(String userid) {
		int flag = 0;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			flag = sqlSession.delete("deleteMember",userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return flag;
	}
	
	//=======================================================================
/*	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = new ArrayList<>();
	int result = 0;
	MemberDTO mDto;
	
	public int insertMember(MemberDTO mDto){
		try {
			conn = DBManager.getConnection();
			String sql = "INSERT INTO membercloset(id,pw,name,phone,email,zipcode,addr1,addr2) "
						+ "VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getId());
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getName());
			pstmt.setString(4, mDto.getPhone());
			pstmt.setString(5, mDto.getEmail());
			pstmt.setString(6, mDto.getZipcode());
			pstmt.setString(7, mDto.getAddr1());
			pstmt.setString(8, mDto.getAddr2());
			
			result = pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	//로그인시 회원 여부 체크
	public MemberDTO LoginCheck(String uid, String upw) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM membercloset "
						+ "WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email= rs.getString("email");
				String zipcode = rs.getString("zipcode");
				String addr1 = rs.getString("addr1");
				String addr2 = rs.getString("addr2");
				mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return mDto;
	}
	
	public int updateMember(MemberDTO mDto){
		try {
			conn = DBManager.getConnection();
			String sql = "UPDATE membercloset SET "
					+ "pw=?, name=?, phone=?, email=?, zipcode=?, addr1=?, addr2=? "
					+ "WHERE id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getPw());
			pstmt.setString(2, mDto.getName());
			pstmt.setString(3, mDto.getPhone());
			pstmt.setString(4, mDto.getEmail());
			pstmt.setString(5, mDto.getZipcode());
			pstmt.setString(6, mDto.getAddr1());
			pstmt.setString(7, mDto.getAddr2());
			pstmt.setString(8, mDto.getId());
			
			result = pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	
	//Ajax를 활용한 ID 중복 체크
	
	public String confirmID(String userid) {
		String msg ="";
		try {
			conn = DBManager.getConnection();
			String sql ="SELECT id FROM membercloset "
					+ "WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//중복된 아이디
				msg = "-1";
			}else {
				msg = "1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return msg;
	}
	
	public String confirmPW(String userid, String userpw) {
		String msg="";
		try {
			conn = DBManager.getConnection();
			String sql ="SELECT id,pw FROM membercloset "
					+ "WHERE id = ? AND pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//중복된 아이디
				msg = "-1";
			}else {
				msg = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return msg;
	}
	
	public int updatePw(String userid,String userpw) {
		try {
			conn = DBManager.getConnection();
			String sql ="UPDATE membercloset SET "
					  + "pw = ? "
					  + "WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userpw);
			pstmt.setString(2, userid);

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}*/
}
