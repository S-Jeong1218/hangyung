<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="include/include.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

	body, ul {
		margin:0;
		padding:0;
		background-color: beige;
		font-family: 'Nanum Gothic', sans-serif;
	}
	a{
		text-decoration: none;
	}
	ul{
		list-style-type:none;
	}
	
	/* header (로고) */
	#content_layout{
		width:460px;
		margin:0 auto;
	}
	#header_div img{
		display:block;
		margin: 62px auto;
		
	}
	#header_welcome {
		font-size : 14px;
		text-align: center;
	}
	
	
	.div_input{
		background-color: white;
		border : 1px solid #EFDBEB;
		width:408px;
		height:29px;
		margin-bottom:14px;
		padding : 10px 35px 10px 15px;
		cursor:pointer;
	}
	.div_input > input{
		outline-width:0;
		color:#d5d5d5;
	}
	.char_input{
		font-size:12px;
	}
	.input_join{
		width:408px;
		heigth: 16px;
		border-width: 0px;
		padding : 7px 0px 6px 0px;
		cursor:pointer;
	}
	.inputaddr{
		width:225px;
		heigth: 16px;
		background-color: white;
		border : 1px solid #EFDBEB;
		margin-bottom:7px;
		outline-width:0
	}
	#btn_addr{
		width:225px;
		height:30px;
		background-color: #A881B6;
		border : 0;
		outline-width:0;
		color:white;
	}
	#closet_email{
		margin-bottom:14px;
	}
	#closet_email > input, select{
		width:144px;
		height:30px;
		box-sizing: border-box;
		border : 1px solid #EFDBEB;
		outline-width:0;
	}
	#closet_email > select{
		border : 1px solid #EFDBEB;
		
	}
	#selmail { 
		width:130px;
	}
	/* #wrap_email{
		padding: 5px;
	}
	#wrap_email > *{
		float:left;
		margin-right:10px;
	} */
	
	#btn_join{
		width:460px;
		height:59px;
		font-size:22px;
		text-align:center;
		background-color: #A881B6;
		color:white;
		display:block;
		padding-top:2px;
		line-height:61px;
	}
	table {
		width:100%;
	}
	td{
		height: 26px;
	}
	#secure{
		text-align:right;
		font-size:12px;
	}
	#ip_ud{
		color:#747474;
	}
	#ip_ud a{
		color:inherit; /* 부모의 글자색을 그대로 물려받아서 사용하는 것. */
	}
	#off{
		font-weight:bold;
		width:22px;
		text-aligh:left;
		display:inline-block;
	}
	.si{
		color:#d5d5d5;
	}
	#secure img{
		vertical-align:bottom;
	}
	
	hr{
		width:98%;
		margin: 20px auto;
		border: thin solid #eaeaea;
	}
	#macketing{
		width:100%;
	}
	#footer{
		padding: 15px 0;
	}
	#footer *{
		font-size:11px;
		ling-height:normal;
		list-style:none;
		color:#333;
	}
	#footer > ul {
		text-align: center;
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
	#address{
		margin:0 auto;
		text-align: center;
	}
	#address *{
		font: 9px verdana;
	}
	#addr_logo{
		width:63px;
		height:11px;
	}
	#addr a{
		font-weight:bold;
	}
	a:hover{
		text-decoration:underline;
	}
	#footer> ul> li a:hover{
		color:#1fbc02;
	}
	
	#err_check_msg{
		display: inline-block;
		width:428px;
		heigth:24px;
		font-size:11px;
		font-weight:700;
		line-height:24px;
		color:#f46665;
		padding:0px 15px;
		text-align:center;
	}
	#err_check{
		display:none;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		/* focus : 초점이 가는것, blur : 초점에서 빠져나오는 것. */
		$("#inputid").focus(function(){
			$("#closet_id").css("border","1px solid #A881B6");
		});
		$("#inputid").blur(function(){
			$("#closet_id").css("border","1px solid #dadada");
		});
		
		$("#inputpw").focus(function(){
			$("#closet_pw").css("border","1px solid #A881B6");
		});
		$("#inputpw").blur(function(){
			$("#closet_pw").css("border","1px solid #dadada");
		});
		
		$("#inputrepw").focus(function(){
			$("#closet_repw").css("border","1px solid #A881B6");
		});
		$("#inputrepw").blur(function(){
			$("#closet_repw").css("border","1px solid #dadada");
		});
		
		$("#inputname").focus(function(){
			$("#closet_name").css("border","1px solid #A881B6");
		});
		$("#inputname").blur(function(){
			$("#closet_name").css("border","1px solid #dadada");
		});
		
		$(".inputaddr").focus(function(){
			$(".inputaddr").css("border","1px solid #A881B6");
		});
		$(".inputaddr").blur(function(){
			$(".inputaddr").css("border","1px solid #dadada");
		});
		
		$(".email_input").focus(function(){
			$(".email_input").css("border","1px solid #A881B6");
		});
		$(".email_input").blur(function(){
			$(".email_input").css("border","1px solid #dadada");
		});
		
		$("#inputphone").focus(function(){
			$("#closet_phone").css("border","1px solid #A881B6");
		});
		$("#inputphone").blur(function(){
			$("#closet_phone").css("border","1px solid #dadada");
		});
		
		
		$("#btn_join").click(function(){
			/* alert("test"); */
			var id = $("#inputid").val();
			var pw = $("#inputpw").val();
			var repw = $("#inputrepw").val();
			var name = $("#inputname").val();
			var phone = $("#inputphone").val();
			var addr = $(".inputaddr").val();
			var email = $("#inputemail").val();
			/* alert(id+","+pw +","+repw+","+name+","+phone+","+addr+","+email); */
			
			if(id != "" && pw != "" && repw !="" && name !="" && phone !="" && addr !="" && email !=""){
				alert("페이지 이동");
			}else{
				$("#err_check").css("display","block");
				return; /* JAVA로 이동하지 않고 화면단으로 다시 돌아감 */
			}
		});
		
		$("#selmail").change(function(){
			var selmail = $("#selmail").val();
			/* #selmail의 value 값을 selmail 변수에 담아라 */
			
			if(selmail=="directVal"){
				$("#email_url").val("");
				$("#email_url").focus();
			}else{
				$("#email_url").val(selmail);
				/* #email_url의 value속성에 selmail변수의 값을 넣어라 */
			}
			
		});
		
		
		/* 우편번호, 주소 클릭했을 때 다음 우편번호 API실행 */
		$(".addrbtn").click(function(){
			$("#addr_btn").click();
		});
		
		$("#btn_join").click(function(){
			$("#frm_mem").submit();
		});

		/* id */
		 /* $("#inputid").blur(function(){
			alert("test");
			val idVal = $(this).val();
			
			if(id != ""){
				$.ajax({
					/* ajax db 갔다오려면 View -> Controller -> Model -> DB 
					url: "idCheck.bizpoll",
					type: "POST",
					dataType: "json",
					data:"id="+idVal,
					success:function(data){
						if(data.message =="-1"){
							alert("overlap");
							$("#inputid").next().text("중복된아이디입니다.").css("display","block").css("color","#F46665");
							$("#inputid").select();
							$("#inputid").parent().css("margin-bottom","30px");
						}else{
							$("#inputid").next().text("멋진 아이디네요.").css("display","block").css("color","#0000FF");
							$("#inputid").select();
							$("#inputid").parent().css("margin-bottom","30px");
						}
					},
					error:function(){
						alert("System Error!!!");
					}
				});
			}
		}); */
	});
	
	/* $(document).on("click",".btn_join",function(){
		alert("test");
		//유효성 체크하는 값 받아오기
		var 
		form = $("#frm_mem"),
		mid =$("#inputid"),
		mpw =$("#inputpw"),
		mpw2 =$("#inputrepw"),
		mname =$("#inputname"),
		mphone =$("#inputphone"),
		memail1 =$("#email"),
		memail2 =$("#email_url"),
		zipcode =$("#sample6_postcode"),
		maddr1 =$("#sample6_address"),
		maddr2 =$("#sample6_address2");
		
		
		
		/* $('.btn_join').blur(function(){
			/* 인풋태그에 입력된 값을 가져옴 
			var inputVal=$(this).val();
			
			/* input태그에 값이 없으면 경고메세지 출력
			if(inputVal==""){
				$(this).next().text("필수정보입니다.").css("display","block");
			}else{
				$(this).next().css("display","none");
			}
		});
		
		$("#inputrepw").blur(function(){
			var pw1=$("#inputpw").val();
			var pw2=$("#inputrepw").val();
			if(pw1 !="" && pw2 !=""){
				if(pw1=pw2){
					$(".checkpw").next().css("display","none");
				}else{
					/* 비밀번호와 비밀번호 확인 값이 다르면 경고메세지 출력
				          선행조건:둘 다 값이 존재할 때만 적용 가능
						1.비밀번호 확인 메세지에 "비밀번호가 일치하지 않습니다" 출력
						2.비밀번호확인(input)->focus가 가고
						3.값을 초기화
					$(this).next().text("비밀번호가 일치하지 않습니다.").css("display","block");
					$(this).select();
					$(this).parent().css("margin-bottom","30px");
				}
			}
				
		}); 
		/* 유효성체크 
		/* trim: 앞뒤 공백 제거 
		var id = $.trim(mid.val());
		var regId = /^[a-zA-Z0-9]{4,12}$/; /* 4~12자 까지 영대소문자와 숫자만 입력 가능 
		if(id == ""){
			mid.focus();
			mid.next().text("필수정보 입니다.").css("display","block");
			mid.parent().css("margin-bottom","30px");
			return false;/* 이걸해야 submit이 안됨! 꼭 해야함 
		}/* +ID중복체크 else if(!regId.test(id)){
			mid.focus();
			mid.next().text("영문자와 숫자만 입력하세요.").css("display","block");
			mid.parent().css("margin-bottom","30px");
			return false;
		}
		
		*/
		
		
		
		/*
		var pw = $.trim(mpw.val());
		var pw2 = $.trim(mpw2.val());
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;/* 영문자, 숫자 포함 특수문자 사용가능 8~20자리 
		if(pw == ""){
			mpw.focus();
			mpw.next().text("필수정보 입니다.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		}else if(!regPass.test(pw)){
			mpw.focus();
			mpw.next().text("8~20자 이내 영문자와 숫자 특수문자만 입력하세요.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		}else if(pw2 == ""){
			mpw2.focus();
			mpw2.next().text("필수정보 입니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}else if(pw != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지 않습니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}
		
		var name = $.trim(mname.val());
		if(name == ""){
			mname.focus();
			mname.next().text("필수정보 입니다.").css("display","block");
			mname.parent().css("margin-bottom","30px");
		}
		
		var phone = $.trim(mphone.val());
		// var regPhone =/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 안됨
		// var regPhone = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/; 안됨
		// var regPhone = /(^02.{0}|01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; 맞다는데....
		var regPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		if(phone == ""){
			mphone.focus();
			mphone.next().text("필수정보 입니다.").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
		} else if($.isNumeric(phone)==false){ //숫자값만 들어왔는지 체크
			mphone.select();
			mphone.next().text("숫자만 입력하세요").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
		} else if(!regPhone.text(phone)){
			mphone.select();
			mphone.next().text("올바를 값을 입력하세요.").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
		}
		
		var mailid = $.trim(memail1.val());
		var mailurl = $.trim(memail2.val());
		
		var mail = mailid +"@"+mailurl;
		var regMail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(mailid==""){
			memail1.focus();
			$("#selmail").next().text("필수정보 입니다.").css("display","block");
			memail1.parent().css("margin-bottom","30px");
			return false;
		}else if(mailurl==""){
			memail2.focus();
			$("#selmail").next().text("필수정보 입니다.").css("display","block");
			memail2.parent().css("margin-bottom","30px");
			return false;
		}else if(!regMail.test(mail)){
			mailid.select();
			mailid.next().text("Email형식이 올바르지 않습니다.").css("display","block");
			mailid.parent().css("margin-bottom","30px");
			return false;
		}
		
		var zipcodeVal = $.trim(zipcode.val());
		var addr1 = $.trim(maddr1.val());
		var addr2 = $.trim(maddr2.val());

		if(zipcodeVal ==""){
			zipcode.next().text("필수정보 입니다.").css("display","block");
			zipcode.parent().css("margin-bottom","30px");
			return false;
		} else if(addr1==""){
			maddr1.next().text("필수정보 입니다.").css("display","block");
			maddr1.parent().css("margin-bottom","30px");
			return false;
		} else if(addr2==""){
			maddr2.focus();
			maddr2.next().text("필수정보 입니다.").css("display","block");
			maddr2.parent().css("margin-bottom","30px");
			return false;
		}
		
		// 유효성 체크 값이 유효한지 확인 끝!!!
		form.submit();
	});  */
	
	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

</head>
<body>
	<div id="content_layout">
	
		<header>
			<div id="header_div">
				<a href="#">
					<img alt="클로젯 로고" src="img/4_clear.png">
				</a>
			</div>
			<div id="header_welcome">
				Shop Closet 회원가입을 환영합니다.<br>
				다음 목록들을 빠짐없이 입력해 주세요<br>
				<br><br><br><br>
			</div>
		</header>
		
		<section>
			<form name="frm_mem" action="memberplay.bizpoll" method="POST" id="frm_mem">
				<label for="inputid" class="char_input">ID를 입력해주세요</label>
				<div class="div_input" id="closet_id">
					<input type="text" placeholder="Closet ID" class="input_join" id="inputid" name="inputid">					
					<!-- <span class="err">필수정보입니다.</span> -->
				</div>
				
				<label for="inputpw" class="char_input">비밀번호를 입력해 주세요</label>
				<div class="div_input" id="closet_pw">
					<input type="password" placeholder="Closet PW" class="input_join" id="inputpw" name="inputpw">
				</div>
				
				<label for="inputrepw" class="char_input">비밀번호를 다시 입력해 주세요</label>
				<div class="div_input" id="closet_repw">
					<input type="password" placeholder="PW 재입력" class="input_join checkpw" id="inputrepw">
				</div>
				
				<label for="inputname" class="char_input">이름을 입력해 주세요</label>
				<div class="div_input" id="closet_name">
					<input type="text" placeholder="Name" class="input_join checkpw" id="inputname" name="inputname">
				</div>
				
				<label for="inputphone" class="char_input">전화번호를 입력해주세요</label>
				<div class="div_input" id="closet_phone">
					<input type="text" placeholder="01012345678" class="input_join" id="inputphone" name="inputphone">
				</div>
				
				<label for="sample6_postcode" class="char_input">주소를 입력해 주세요</label> <br>
				<!-- <div class="div_input" id="closet_addr"> -->
					<!-- <input type="text" placeholder="address" class="input_join" id="inputaddr"> -->
				<!-- </div> -->
				<input type="text" id="sample6_postcode" name="sample6_postcode" class="input_join inputaddr" placeholder="우편번호" readonly="readonly">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="btn_addr"><br>
				<input type="text" id="sample6_address" name="sample6_address" class="input_join inputaddr" placeholder="주소" readonly="readonly">
				<input type="text" id="sample6_address2" name="sample6_address2" class="input_join inputaddr" placeholder="상세주소">
				
				
				<br><label for="email" class="char_input">e-mail을 입력해 주세요</label>
				
				<!-- <div class="div_input" id="closet_email">
					<input type="text" placeholder="asdf123@naver.com" class="input_join" id="inputemail">
				</div> -->
				
				<div id="closet_email">
					<input type="text" id="email" name="email" class="email_input" placeholder="ID">
					<span>@</span>
					<input type="text" id="email_url" name="email_url" class="email_input" placeholder="URL">
					<select id="selmail">
						<option value="" selected="selected">Email 선택</option>
						<option value="directVal">직접입력</option>
						<option value="naver.com">naver.com(네이버)</option>
						<option value="daum.net">daum.net(다음카카오)</option>
						<option value="gmail.com">gmail.com(구글)</option>
						<option value="nate.com">nate.com(네이트)</option>		
					</select>
				</div>
				
				<div id="err_check">
					<span id="err_check_msg">위의 항목을 모두 입력해 주세요</span>
				</div>
				<div><a href="#" id="btn_join">회원 가입</a></div>

				<div>
					<hr>
				</div>
			</form>
		</section>
		
		<aside>
			
		</aside>
		
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보 처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적 고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address">
					<span>Copyright</span>
					<span>ⓒ</span>
					<span>
						<strong><a href="#">Closet Copr.</a></strong>
					</span>
					<span>All Rights Reserved.</span>
				</div>
			</div>
		</footer>
		
	</div>
</body>
</html>