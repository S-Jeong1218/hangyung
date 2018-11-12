<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- meta태그 활용 -->
<!-- <meta http-equiv="refresh" content="3; url=index.bizpoll"> -->
<!-- 3초뒤에 index.bizpoll로 이동! -->
<title>Insert title here</title>
<style type="text/css">
	.body{
		margin:0px;
		paddig:0px;
	}
	#welcome_join_box{
		width: 700px;
		border: 2px solid #6D3660;
		background-color: #EFDBEB;
		margin: 0 auto;
		margin-top: 300px;
		border-radius:20px;
	}
	.welcome_box_div{
		text-align: center;
		font-size:30px;
	}
	#rCut{
		font-size: 30px;
		color:red;
	}
</style>
<script type="text/javascript">
/* Javascript 사용 */
	var cnt=4; //3,2,1,0 /함수가 실행되는 시간이 1초가량이라 4초부터 시작하도록 설정함.
	function countdown(){
		if(cnt==0){
			clearInterval(s);
			location.href="index.bizpoll";
		}
		document.getElementById("rCnt").innerHTML=cnt;
		cnt--;
	}
	var s = setInterval(countdown,1000); //start! 1초 단위로 countdown() 실행
</script>
</head>
<body>

	<div id="welcome_join_box">
		<div class="welcome_box_div">
			Shop Closet에 회원이 되신걸 환영합니다.
		</div>
		<div class="welcome_box_div">
			<span id="rCnt">5</span>초 뒤 메인 페이지로 이동합니다.
		</div>
	</div>


	<!-- 카운트 다운 방법
		 1. meta 태그 활용
		 2. JavaScript의 setInterval()활용 -->
</body>
</html>