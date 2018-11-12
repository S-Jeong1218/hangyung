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
	
	nav{
		width:300px;
		font-weight: bold;
		color:#757575;
		text-align: center;/*글자정렬 */
		position:fixed; /*위치설정*/
		height:100%; 
		top:0px; /*position설정 기준으로 어디에 위치시킬것인가*/
		animation:animateleft 0.6s;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
					0 4px 20px 0 rgba(0,0,0,0.19);
	}
	#close_btn{
		background-color: black;
		width:20px;
		height:70px;
		padding: 24px 0;
		box-sizing:border-box;
		position:absolute;
		right:-20px;
		top:300px;
	}
	#close_btn > i{
		color:white;
		font-size:12px;
	}
	h3{
		font-size: 40px; 
		padding:100px 0;
		margin:10px 0;
		font-weight: 400;/*글자 두껍게*/
	}
	.nav_a{
		display:block;/*출력방법*/
		width:100%;
		padding:12px 16px;
		font-size: 20px;
		color:#757575;
		box-sizing: border-box; /*크기고정*/
	}
	.nav_a:hover{
		color:black;
		background-color: #ccc;
	}
	

	
	 #snslink{
		width:207px;
		height:42px;
		padding:10px 0 10px 50px;
		margin:auto;
		box-sizing: border-box;
	}
	#snslink>ul>li{
		float:left;
		padding:0 10px;
		font-size: 20px;
		
	}
	#snslink>ul>li>a{
		color:black;
	} 
	
	
</style>

<script type="text/javascript">
$(document).ready(function(){
	var state=false;
	$("#arrowright").css("display","none");
	
	$("#close_btn").on("click", function(){
		if(!state){ /* true일때 */
			$("#nav").animate({left:'-300px'},300);
			$("#arrowright").css("display","inline-block");
			$("#arrowleft").css("display","none");
			$("#content").css("padding-left","0px");
		}
		else{
			$("#nav").animate({left:'0px'},300);
			$("#arrowright").css("display","none");
			$("#arrowleft").css("display","inline-block");
			$("#content").css("padding-left","300px");
		}
		state=!state;
	});		
});
</script>

</head>
<body>
	<nav id="nav">
		<div id="close_btn">
			<i class="fa fa-chevron-left" id="arrowleft"></i>
			<i class="fa fa-chevron-right" id="arrowright"></i>
		</div>
		<h3>
			<b>
				Shop<br>
				Closet
			</b>
		</h3>
		<a class="nav_a" href="#">베스트 상품</a>
		<a class="nav_a" href="#">신상품</a>
		<a class="nav_a" href="#">할인상품</a>
		
		<div id="snslink">
					<ul>
						<li><a href="https://www.facebook.com/"><i class="fa fa-facebook-official"></i></a></li>
						<li><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
						<li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
					</ul>
		</div> 
	</nav>
	
</body>
</body>
</html>