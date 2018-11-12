<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- index.jsp 페이지에 header.jsp페이지를 추가 -->
<%@ include file="include/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop Closet</title>	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	@keyframes animateleft{
		0%{left:-300px; opacity:0;}
		100%{left:0;}
	}
	#index_body{
		padding-top:170px;
	}
	body,ul{margin:0; padding:0;}
	*{font-family: 'Nanum Gothic', serif;}
	ul{list-style-type: none;}/*리스트앞에 점이나 숫자 사라짐 */
	a{text-decoration: none;} /*하이퍼링크 효과들없어짐*/
	
	#content{
		padding-left: 300px;
		transition:0.3s;
	}
	#contact>p{
		/* text-align: center; */
	}
	
	h2{
		/* text-align: center; */
	}
	
	.main_product_wrap{
		padding:32px;
	}
	.main_product{
		margin:auto;
		text-align: left;		
	}
	.main_product >span{
		display: block;
		padding: 5px 0 5px 25px;
		color:#757575;
	}
	#main_product_recommend{
		width:40%;
	}
	#main_product_new{
		width:30%;
	}
	.div_product{
		display:inline-block;
	}
	.photo{
		width:400px;
		height:400px;
	}
	.div_info_photo > p {
	 	text-align: center;
	}
	
	button#upbtn{
		display:none;
		position:fixed;
		bottom:20px;
		right:30px;
		z-index:99;
		font-size:18px;
		border:none;
		outline:none;
		background-color: #A881B6;
		color:white;
		cursor:pointer;
		padding:15px;
		border-radius:4px;
	}
	button#upbtn:hover{
		background-color: #555;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	/* 
	var state=false;
	
	$("#close_btn").on("click", function(){
		if(!state){ 
			$("#content").css("padding-left","0px");
		}
		else{
			$("#content").css("padding-left","300px");
		}
		state=!state;
	});
	 */
});
</script>
<script type="text/javascript">
	/* Scroll이벤트가 발생하면 scrollFunction함수 실행 
	JavaScript 버전 */
	window.onscroll=function(){scrollFunction()};
	
	function scrollFunction(){
		if(document.body.scrollTop>20 || document.documentElement.scrollTop>20){
			document.getElementById("upbtn").style.display="block";
		}else{
			document.getElementById("upbtn").style.display="none";
		}
	}
	
	function topFuntion(){
		document.body.scrollTop = 0;
		document.documentElement.scrollTop=0;
	}
</script>
</head>
<body id = "index_body">
<h1>에베베ㅔ베베베ㅔ베베ㅔ베ㅔ베베베베베베베베베ㅔ베벱</h1>
	<section>
		<div id ="content">
			
			<div class="main_product_wrap">
				<div class="main_product" id="main_product_recommend">
					<h2><b>Month's Recommendation</b></h2>
					
				</div>
				
				<!-- 상품1 -->
				<c:forEach items="${bestlist}" var="bestDto">
					<div class="div_product">
						<div class="div_photo">
							<img alt="그림1" src="img/${bestDto.p_img }" class=photo>
							
						</div>
						<div class="div_info_photo">
							<p>
							상품명 : ${bestDto.p_name } <br>
							</p>
							<hr>
							<p>
							<%-- 상품가격 : ${bestDto.p_price } --%> 
							<fmt:setLocale value="ko_kr" /> <!-- en_us:달러, ja_jp:엔화 -->
							상품가격 : <fmt:formatNumber value="${bestDto.p_price }" type="currency"/>
							<%-- 상품가격 : <fmt:formatNumber value="0.25" type="percent"/> --%>
							<%-- 상품가격 : <fmt:formatNumber value="3.14158" pattern="#.##"/> --%>
							<br>
							♥좋아요(${bestDto.p_goodcnt }) 상품후기(3)
							</p>
						</div>
					</div>
				</c:forEach>
				
				
			</div>
			
			
			
			
			<div class="main_product_wrap">
				<div class="main_product" id="main_product_new">
					<h2><b>New Product</b></h2>
				</div>
				
				<!-- 상품4 -->
				
				<div class="div_product">
					<div class="div_photo">
						<img alt="그림4" src="img/photo4.jpg" class=photo>
					</div>
					<div class="div_info_photo">
						<p>
						원피스 <br>
						<p>
						<hr>
						<p>
						35000원 <br>
						♥좋아요(11) 상품후기(3)
						</p>
					</div>
				</div>
				
				<!-- 상품5 -->
				
				<div class="div_product">
					<div class="div_photo">
						<img alt="그림5" src="img/photo5.jpg" class=photo>
					</div>
					<div class="div_info_photo">
						<p>
						원피스 <br>
						<p>
						<hr>
						<p>
						40000원 <br>
						♥좋아요(21) 상품후기(6)
						</p>
					</div>
				</div>
				
				<!-- 상품6 -->
				
				<div class="div_product">
					<div class="div_photo">
						<img alt="그림6" src="img/photo6.jpg" class=photo>
					</div>
					<div class="div_info_photo">
						<p>
						원피스 <br>
						<p>
						<hr>
						<p>
						35000원 <br>
						♥좋아요(17) 상품후기(3)
						</p>
					</div>
				</div>
			</div>
			
		</div>
	</section>
	
	<button onclick="topFuntion()" id="upbtn">Top</button>
</body>
</html>
<%@ include file="include/footer.jsp" %>