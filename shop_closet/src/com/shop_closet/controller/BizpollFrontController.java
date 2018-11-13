package com.shop_closet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_closet.action.Action;
import com.shop_closet.action.ActionForward;
import com.shop_closet.action.BoardDetailAction;
import com.shop_closet.action.BoardInsertPlayAction;
import com.shop_closet.action.BoardListAction;
import com.shop_closet.action.BoardSearchAction;
import com.shop_closet.action.BoardUpdateAction;
import com.shop_closet.action.BoardUpdatePlayAction;
import com.shop_closet.action.BoardViewcntAction;
import com.shop_closet.action.BoardWriteAction;
import com.shop_closet.action.ConstractAction;
import com.shop_closet.action.IndexAction;
import com.shop_closet.action.LoginAction;
import com.shop_closet.action.LoginOutPlayAction;
import com.shop_closet.action.LoginPlayAction;
import com.shop_closet.action.MemberAction;
import com.shop_closet.action.MemberDeletePlayAction;
import com.shop_closet.action.MemberPlayAction;
import com.shop_closet.action.MemberUpdateAction;
import com.shop_closet.action.MemberUpdatePlayAction;
import com.shop_closet.action.MemberWithdrawPlay;
import com.shop_closet.action.PwCheckAction;
import com.shop_closet.action.PwUpdatePlayAction;
import com.shop_closet.action.idCheckAction;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BizpollFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET, POST 둘다 받음

		// 한글깨짐 방지(POST방식): 가장 위에 적어주세요.
		request.setCharacterEncoding("UTF-8");

		Action action = null; // 실제 동작하는 부분
		ActionForward forward = null; // forward, sendRedirect 설정

		// uri - ctx = 내가 원하는 Action 경로
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());

		System.out.println("uri: " + uri);
		System.out.println("ctx: " + ctx);
		System.out.println("페이지이동==============> " + command);

		// Action단 이동
		if (command.equals("/index.bizpoll")) {
			action = new IndexAction(); //객체생성
			forward = action.excute(request, response); //객체(인스턴스) 사용
			//Web에서는 무조건 request,response를 매개변수로 받아야 한다.
		}else if(command.equals("/constract.bizpoll")) {
			action = new ConstractAction();
			forward = action.excute(request, response); 
		}else if(command.equals("/member.bizpoll")) {
			action = new MemberAction();
			forward = action.excute(request, response); 
		}else if(command.equals("/memberplay.bizpoll")){
			action = new MemberPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/login.bizpoll")) {
			action = new LoginAction();
			forward = action.excute(request, response);
		}else if(command.equals("/loginPlay.bizpoll")) {
			action = new LoginPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/loginOut.bizpoll")) {
			action = new LoginOutPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberUpdate.bizpoll")) {
			action = new MemberUpdateAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberUpdatePlay.bizpoll")) {
			action = new MemberUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/idCheck.bizpoll")) {
			action = new idCheckAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwCheck.bizpoll")){
			action = new PwCheckAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwUadate.bizpoll")) {
			action = new PwUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/member_withdraw.bizpoll")) {
			action = new MemberWithdrawPlay();
			forward = action.excute(request, response);
		}else if(command.equals("/deletePlay.bizpoll")) {
			action = new MemberDeletePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardList.bizpoll")) {
			action = new BoardListAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardSearch.bizpoll")) {
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardDetail.bizpoll")) {
			action = new BoardDetailAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardViewcnt.bizpoll")) {
			action = new BoardViewcntAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardwrite.bizpoll")) {
			action = new BoardWriteAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardInsertPlay.bizpoll")) {
			action = new BoardInsertPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardUpdate.bizpoll")) {
			action = new BoardUpdateAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardUpdatePlay.bizpoll")) {
			action = new BoardUpdatePlayAction();
			forward = action.excute(request, response);
		}

		// 공통 분기작업(페이지 이동)
		if (forward != null) {
			if (forward.isRedirect()) { // true: sendRedirect 방식
				response.sendRedirect(forward.getPath());
			} else { // false: forward 방식
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}

	}

}
