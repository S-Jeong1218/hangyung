<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	@keyframes animateleft{
		0%{left:-300px; opacity:0;}
		100%{left:0;}
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
	
	#recommend_wrap{
		padding:32px;
	}
	#recommend{
		width:25%;
		margin:auto;
		text-align: left;		
	}
	#recommend >span{
		display: block;
		padding: 5px 0 5px 25px;
		color:#757575;
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
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var state=false;
	
	$("#close_btn").on("click", function(){
		if(!state){ /* true일때 */
			$("#content").css("padding-left","0px");
		}
		else{
			$("#content").css("padding-left","300px");
		}
		state=!state;
	});		
});
</script>
</head>
<body>
	<section>
		<div id ="content">
			
			<div id="recommend_wrap">
				<div id="recommend">
					<h2><b>이달의 추천 상품</b></h2>
					
				</div>
				
				<!-- 상품1 -->
				
				<div class="div_product">
					<div class="div_photo">
						<img alt="그림1" src="img/photo1.jpg" class=photo>
					</div>
					<div class="div_info_photo">
						<p>
						예쁜 까만 슬렉스 <br>
						<p>
						<hr>
						<p>
						35000원 <br>
						♥좋아요(11) 상품후기(3)
						</p>
					</div>
				</div>
				
				<!-- 상품2 -->
				
				<div class="div_product">
					<div class="div_photo">
						<img alt="그림2" src="img/photo2.jpg" class=photo>
					</div>
					<div class="div_info_photo">
						<p>
						깔끔한 블라우스 <br>
						<p>
						<hr>
						<p>
						40000원 <br>
						♥좋아요(21) 상품후기(6)
						</p>
					</div>
				</div>
				
				<!-- 상품3 -->
				
				<div class="div_product">
					<div class="div_photo">
						<img alt="그림3" src="img/photo3.jpg" class=photo>
					</div>
					<div class="div_info_photo">
						<p>
						예쁜 베이지색 슬렉스 <br>
						<p>
						<hr>
						<p>
						35000원 <br>
						♥좋아요(17) 상품후기(3)
						</p>
					</div>
				</div>
				
				
			</div>
			
			
			
			<div id="contact">
				<h2><b>Contect Shop Closet</b></h2>
				
				<p>
					Shop Closet을 찾아주신 고객님 감사합니다. 
					<br>만약 문의사항이 있다면, 아래의 연락처로 연락주세요. 
					<br>고객센터 근무시간은 오전 10시부터 오후 5시까지입니다.(12시 점심시간 1시간)
				</p>
				
				<p>
					062-971-xxxx, asdf123@gmail.com
				</p>	
			</div>
		</div>
	</section>
</body>
</html>