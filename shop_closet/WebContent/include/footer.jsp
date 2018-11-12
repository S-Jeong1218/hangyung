<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#footer_div{
		margin-left: 300px;
		display:block;
	}
	/* #content{
		padding-left: 300px;
		transition:0.3s;
	} */
	#footer{
		/* padding: 15px 0; */
	}
	#footer *{
		font-size:9px;
		ling-height:normal;
		list-style:none;
		color:#333;
	}
	#footer > ul {
		text-align: left;
		margin: 0 auto 9px;
	}
	#footer > ul > li{
		display: inline-block;
		border-left:1px solid #EFDBEB;
		padding: 0 5px 0 7px;
	}
	#footer > ul > li:first-child{
		border-left:0px!important;	/* !important 최우선으로 css 적용 */
									/* 남발해서 사용x, css속성으로 해결하고,최후에 사용할 것을 권장. */
	}
</style>
</head>
<body id="footer_body">
	<div id="footer_div">
		<br><br><br>
		
		<div id="contact">
			<h3><b>&nbsp Contect Shop Closet</b></h3>
			
			<p>
				&nbsp Shop Closet을 찾아주신 고객님 감사합니다. 
				<br>&nbsp 만약 문의사항이 있다면, 아래의 연락처로 연락주세요. 
				<br>&nbsp 고객센터 근무시간은 평일 오전 10시부터 오후 5시까지입니다.(12시 점심시간 1시간)
				<br>&nbsp (주말, 공휴일 휴무)
			</p>
					
			<p>
				&nbsp 062-971-xxxx, asdf123@gmail.com
			</p>	
		</div>
		<div id="footer">
			<ul>
				<li><a href="#">기관소개</a></li>
				<li><a href="#">찾아오시는 길</a></li>
				<li><a href="#">교환 및 반품 정책</a></li>
			</ul>
		</div>	
	</div>
</body>
</html>