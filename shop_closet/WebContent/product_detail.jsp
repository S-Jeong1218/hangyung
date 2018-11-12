<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- index.jsp 페이지에 header.jsp페이지를 추가 -->
<%@ include file="include/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#detail_body{
		padding-top:170px;
	}
	body,ul{margin:0; padding:0;}
	#div_detail_wrap{
		width:1200px;
		display:inline-block;
		margin-left:300px;
	}
	.photo{
		width:700px;
		height:700px;
	}
	#div_detail_image{
		display:inline-block;
		float:left;
	}
	#div_detail_explain{
		display:inline-block;
		float:left;
		width:400px;
		height:600px;
		margin: 0 50px;
	}
	#div_detail_image2{
		display:inline-block;
		margin: auto;
	}
	#detail_img{
		margin: auto;
	}
	#div_detail_explain>p{
		text-align: center;
	}
	.detail_select{
		right:0px;
		top: 14px;
	}
	.product_size{
		font-size:12px;
		font-weight: 400;
		height:30px;
		padding:6px 8px 5px 7px;
		min-width:98px;
		color:#333;
		border:1px solid #ccc;
		-webkit-appearance:none; /* 화살표 없애기 */
		background-color:white;
		width:98px;
		background:url("img/sel_arr.gif") 100% 50% no-repeat; /* 화살표 이미지로 주기 */
	}
	
	#btn_buy{
		width:400px;
		height:59px;
		font-size:22px;
		text-align:center;
		background-color: #A881B6;
		color:white;
		display:block;
		padding-top:2px;
		line-height:61px;
	}
</style>
</head>
<body id="detail_body">
	<div id="div_detail_wrap">
		<div id="div_detail_image">
			<%-- <img alt="그림1" src="img/${bestDto.p_img }" class=photo> --%>
			<img alt="그림1" src="img/photo2.jpg" class=photo>
		</div>
		
		<div id="div_detail_explain">
			
			<h2><br>상품명 : ${bestDto.p_name }<br></h2>
			<h2>상품가격 : ${bestDto.p_price }</h2>
			<hr>
			<p>
				shop closet 인기 상품 '예쁜 블라우스'입니다<br>
				품절이 예상되니 주문을 서둘러주세요
			</p>
			<div id="div_detail_image2">
				<img alt="detail" src="img/detail.PNG" id="detail_img">
			</div>
			<div class="detail_select">
				<p> 상품색상을 골라주세요 </p>
				<select class="product_size">
					<option>beige</option>
					<option>black</option>
					<option>white</option>
				</select>
			</div>
			<div class="detail_select">
				<p> 상품사이즈를 골라주세요 </p>
				<select class="product_size">
					<option>Small</option>
					<option>Medium</option>
					<option>Large</option>
				</select>
			</div>
			<br>
			<div><a href="#" id="btn_buy">구매하기</a></div>
			<hr>
			<p>
			♥좋아요(11) <a href="#">상품후기</a>
			</p>
		</div>
	</div>
</body>
</html>
<%@ include file="include/footer.jsp" %>