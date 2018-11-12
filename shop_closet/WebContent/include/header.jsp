<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="include.jsp" %>
<%
	String path = request.getContextPath(); //컨텍스트 경로
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shop_closet</title>
</head>
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		*{
			font-family: 'Nanum Gothic', serif;
		}
		body, ul {
			margin: 0px;
			padding: 0px;
		}
		ul {
			list-style-type:none;
		}
		a{
			text-decoration:none;
		}
		#header_wrap{
			position:fixed;
			background-color:white;
			top:0px;
			left:0px;
			width:100%;
			box-sizing: border-box;
			
		}
		/* header 로그인 회원가입 마이페이지 고객센터 */
		#header_line1{
			height:30px;
			width: 100%; /* header엔 무조건 width: 100% */
			background-color: #6D3660;
			box-sizing:border-box;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),
						0 6px 20px 0 rgba(0,0,0,0.19);
		}
		#header_line1_in{
			width:70%;
			margin:0 auto;
		}
		#header_line1_ul > li > a {
			color: white;
			font-size: 12px;
			font-weight: bold;
			height:30px;
			display:inline-block;
			padding:0 10px; /* 위아래 좌우 */
			line-height: 30px;
			/* width:82px; */
		}
		#header_line1_ul{
			float: right;
		}
		#header_line1_ul > li{
			float: left; /* 태그들을 좌측, 우측 유동 배치 */
			height:30px;
			position:relative;
		}
		#header_line1_ul > li:not(#loginUser_name_id):hover{	/* li태그에 마우스를 올렸을 때 동작하는 내용 */
			background-color: #2C3E4C;
		}
		#header_line1_ul > li:hover #header_line1_dropdown{
			/* #header_line1_ul > li:hover했을 떄 
			   #header_line1_dropdown를 어떻게 변경할지 적용*/
			display:block;
			
		}
		#header_line1_dropdown > a:hover{
			background-color: #2C3E4C;
			text-decoration:underline;
		}
		#header_line1_dropdown > a{
			display : block;
			font-size: 12px;
			background-color:#6D3660;
			color:white;
			padding: 5px 5px; /* 위아래 여백 5px, 좌우측 여백 5px */
			padding-left:10px; /* 좌측 안쪽 여백 */
			/* padding: 5px 0px 5px 10px; */
			/* border-bottom: 1px solid white; */
		
		}
		#header_line1_dropdown{
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),
						0 6px 20px 0 rgba(0,0,0,0.19);
			/* 숨기는 효과 */
			display:none;/* 존재 자체 없앰 */
			/* visiblity:false; */ /* 있는데 안 보이는 것. */
			position:absolute;
			z-index:1;
		}
		.header_line1_mypage{
		}
		#loginUser_name_id{
			color:white;
			font-size:15px;
			line-height: 30px;
		}
		
		
		/* 로고 이미지, 검색 창 */
		#header_line2 {
			width: 70%;
			height:80px;
			margin:5px auto;
			box-sizing: border-box;
		}
		#header_line2 img{
			display: inline-block;
			margin-top: 8px;
		}
		/* 라인2 검색창 */
		div#header_line2_wrap_search{
			height:34px;
			display:inline-block;
			float:right;
			padding-top:45px;
		}
		div#header_line2_search{
			border:2px solid #A881B6;
			height:34px;
			box-sizing: border-box;
			position:relative;
		}
		input#search_keyword{
			width:353px;
			height:30px;
			font-size:13px;
			box-sizing: border-box;
			border:0px;
			padding-left:10px;
		}
		input#search_btn{
			width:55px;
			height:30px;
			background-color:#A881B6;
			color:white;
			font-size:13px;
			border:0px;
			position:absolute;
			right:0px;
			top:0px;
		}
		
		/* 네비게이션 메뉴 바 */
		#header_line3{
			width:100%;
			height:49px;
			background-color:#A881B6;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
						0 4px 20px 0 rgba(0,0,0,0.19);
			box-sizing: border-box; /* 크기고정 */
		}
		#header_line3_ul > li{
			float: left;
			box-sizing:border-box;
			height:49px;
			position:relative;
		}
		#header_line3_ul > li > a{
			width: 90px;
			color: white;
			line-height:49px;
			font-size:20px;
			padding:0px 13px;
			display:inline-block;
			text-align:center;
		}
		#header_line3_ul > li:hover{
			background-color: #DCB9DC;
			border-top: 5px solid white;
		}
		
		#header_line3_in{
			width:70%;
			margin:0 auto;
		}
		.header_line3_dropdown{
			background-color:#A881B6;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),
						0 6px 20px 0 rgba(0,0,0,0.19);
			display:none;
			position:absolute;
			width:116px;
		}
		
		.header_line3_dropdown > a{
			display : block;
			font-size: 20px;
			background-color:#A881B6;
			color:white;
			text-align:center;
			padding: 5px 5px; /* 위아래 여백 5px, 좌우측 여백 5px */
		}
		.header_line3_dropdown > a:hover{
			background-color: #DCB9DC;
		}
		#header_line3_ul > li:hover .header_line3_dropdown{
			display:block;
			top:44px;
		}
		.header_line3_dropdown > ul> li > a {
			display : inline-block;
			font-size: 20px;
			color:white;
			padding: 5px 20px;
		}
		.header_line3_dropdown > ul> li{
			text-align:center;
			background-color:#A881B6;
			width:116px;
		}
		.header_line3_dropdown > ul> li:hover{
			background-color: #DCB9DC;
		}
	</style>

<body>
	<header>
		<div id="header_wrap">
			<div id="header_line1">
				<div id="header_line1_in">
					<ul id="header_line1_ul">
					
						<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<li><a href="<%=path%>/login.bizpoll" id="header_login_btn">로그인</a></li>
								<li><a href="<%=path%>/constract.bizpoll">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li id="loginUser_name_id">
									${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
								</li>
								<li><a href="<%=path%>/loginOut.bizpoll">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						
						<li><a href="#" id="header_line1_mypage">마이페이지▼</a>
							<div id="header_line1_dropdown">
								<a href="#">주문/배송조회</a>
								<a href="#">장바구니</a>
								<a href="#">위시리스트</a>
								<a href="<%=path%>/memberUpdate.bizpoll">회원정보수정</a>
								<a href="<%=path%>/pwUadate.bizpoll">비밀번호변경</a>
								<a href="<%=path%>/member_withdraw.bizpoll">회원탈퇴</a>
							</div>
						</li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
			</div>
			<div id="header_line2">
				<a href="<%=path%>/index.bizpoll">
					<img id="header_logo" src="<%=path%>/img/4_clear.png" alt="로고">
				</a>
				<div id="header_line2_wrap_search">
					<div id="header_line2_search">
						<input id="search_keyword" type="text" placeholder="검색어를 입력하세요">
						<input id="search_btn" type="submit" value="검색">
					</div>
				</div>
			</div>
			<div id="header_line3">
				<div id="header_line3_in">
					<ul id="header_line3_ul">
						<li><a href="#">DRESS</a></li>
						<li>
							<a href="#">TOP</a>
							<div class="header_line3_dropdown">
								<a href="#">Blouse</a>
								<a href="#">T-Shirt</a>
							</div>
						</li>
						<li><a href="#">SKIRT</a></li>
						<li><a href="#">PANTS</a></li>
						<li><a href="#">OUTER</a></li>
						<li>
							<a href="#">ACC</a>
							<div class="header_line3_dropdown">
								<ul>
									<li><a href="#">Jewelry</a></li>
									<li><a href="#">Bag</a></li>
								</ul>
							</div>
						</li>
						<li><a href="<%=path%>/boardList.bizpoll">Q&A</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>