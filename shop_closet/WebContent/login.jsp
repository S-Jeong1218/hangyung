<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>

<%
/* 이 페이지 오기 이전 페이지의 주소를 담아 놓았음. */
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
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
    }
    .input_login{
        width:408px;
        heigth: 16px;
        border-width: 0px;
        padding : 7px 0px 6px 0px;
        cursor:pointer;
    }
    
    #btn_login{
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
    #btn_jumun{
        font-size:12px;
        text-align:right;
        margin-top:10px;
        display: inline-block;
        float : right;
        color:#747474;
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
    #member{
        color:#8c8c8c;
        font-size:12px;
        text-align:center;
    }
    #member a{
        color:inherit;
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
        border-left:0px!important;  /* !important 최우선으로 css 적용 */
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
        
        /* OFF를 클릭했을 때 녹색 ON으로 바뀌도록 */
        $("#ip_off").click(function(){
            /* alert("클릭됨"); */
            var val = $("#ip_off").text();
            /* alert("text="+val); */
            
            if(val == "OFF"){
                $("#ip_off").text("ON ").css("color","#A881B6");
            }else{
                $("#ip_off").text("OFF").css("color","black");
            }
            
        });
        
        /* 로그인 버튼을 클릭했을 때 유효성 체크하는 부분 */
        $("#btn_login").click(function(){
            /* input의 id와 pw 값을 입력 */
            var id = $("#inputid").val();
            var pw = $("#inputpw").val();
            /* alert(id+","+pw); */
            
            /* 유효성 체크.
            	id와 pw중 하나라도 값이 없으면 경고문 출력*/
            if(id != "" && pw != ""){
                /* $("#frm_login").submit(); */
                alert(id+","+pw);
            	$.ajax({
    				url:"loginPlay.bizpoll",
    				type: "POST",
    				dataType:"json",
    				data:"id="+id+"&pw="+pw,
    				success: function(data){
    					alert("Ajax 성공");
    					if(data.message=="1"){
    						alert("로그인 성공");
    						location.href="<%=referer%>";
    					}else{
    						alert("로그인 실패");
    						$("#err_check_msg").text("id또는 pw가 일치하지 않습니다.");
    						$("#err_check").css("display","block");
    					}
    				},
    				error: function(){
    					alert("System Error!");
    				}
    			});
            }else{
                $("#err_check").css("display","block");
                return; /* JAVA로 이동하지 않고 화면단으로 다시 돌아감 */
            }
        });
        
    });
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
                Shop Closet에 오신걸 환영합니다<br>
                회원가입을 하시면 더 많은 혜택이 기다리고 있습니다.<br>
                ♥<br>
                <br><br><br><br>
            </div>
        </header>
        
        <section>
        <form name="frm_login" action="loginPlay.bizpoll" method="POST" id="frm_login">
            <div class="div_input" id="closet_id">
                <input type="text" placeholder="Closet ID" class="input_login" id="inputid" name="inputid">
            </div>
            <div class="div_input" id="closet_pw">
                <input type="password" placeholder="Closet PW" class="input_login" id="inputpw" name="inputpw">
            </div>
            <div id="err_check">
                <span id="err_check_msg">ID와 PW를 모두 입력해 주세요</span>
            </div>
        
            <div><a href="#" id="btn_login">LOG IN</a></div>
        </form>
            <div><a href="#" id="btn_jumun">비회원 주문조회</a></div>
            <div>
                <table>
                    <tbody>
                        <tr>
                            <td id="secure">
                                <span id="ip_ud"><a href="#">IP보안</a></span>&nbsp;
                                <span id="ip_off">OFF</span>&nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <hr>
            </div>
            <div id="member">
                <a href="#">아이디 찾기</a>
                &nbsp;
                <span class="si">|</span>
                &nbsp;
                <a href="#">비밀번호 찾기</a>
                &nbsp;
                <span class="si">|</span>
                &nbsp;
                <a href="constract.jsp">회원가입</a>
            </div>
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