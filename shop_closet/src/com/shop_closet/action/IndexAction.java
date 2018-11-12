package com.shop_closet.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_closet.dao.ProductDAO;
import com.shop_closet.dto.ProductDTO;

public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "index.jsp";
		
		//동작하는 부분
		// : Best 상품을 출력 => Best 상품을 DB에서 조회
		// Model단 이동(DAO)
		//ProductDAO pDao= new ProductDAO(); //ProductDAO class 객체생성
		//ArrayList<ProductDTO> bestlist = new ArrayList<>(); //ProductDTO타입의 ArrayList객체 생성
		//bestlist = pDao.bestView();//ProductDAO클래스의 bestView매서드 호출, 실행 후 리턴값을 bestlist 변수에 담음.
									//best상품 목록이 담김.
		
		//싱글톤 패턴
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bestList = pDao.bestView();
		
		
		request.setAttribute("bestlist", bestList); //View단으로 전송할 데이터를 담는다.
		//					("이름표",실제값)
		
		//어떤 View단으로 이동하는지 설정
		ActionForward forward = new ActionForward();//ActionForward객체 생성
		
		//ActionForward class의 setPath() method호출하고 매개변수 url(index.jsp)값 전송
		forward.setPath(url);	//index.jsp로 이동
		//ActionForward class의 setRedirect() method호출하고 매게변수로 boolean타입의 false값을 전송
		forward.setRedirect(false);	//forward방식을 사용한다.
									//true일때는 sendRedirect방법으로 보내는 것!
		
		return forward;
	}
	
}
