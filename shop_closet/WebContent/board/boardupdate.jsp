<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#boardwrite_body{
		padding-top:170px;
	}
	
	/* 게시글 */
	#write_content_wrap{
		width:1070px;
		margin:0 auto;
	}
	#content_table{
		display:inline-block;
	}
	table{
		font-size: 17px;
		border-collapse:collapse;
		border-spacing:0;
		disblay:table;
	}
	th{padding: 5px;}
	tr{
		border:1px solid #BBBBBB;
		border-radius: 5px;
	}
	.th_1{
		width:200px;
	}
	.th_2{
		width:870px;
		text-align: left;
	}
	#input_title{
		width:850px;
		height:20px;
	}
	#content{
		width:1070px;
		height:400px;
	}
	#uploadfile{
		display:none;
	}
</style>
<%-- <script type="text/javascript" src="<%=path%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script> --%>
<script type="text/javascript" src="<%=path%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript">
	$(document).on("click","#board_search_btn",function(elClickedObj){
		var title = $("#input_title").val();
		alert(title);
		
		//스마트 에디터로 content값 넘겨받는 부분
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
		
		if(title == ""){
			$("#input_title").focus();
			return false;
		}
		$("#frm_btn").submit
	});
	$(document).ready(function(){
		var file = $("#uploadfile").files[0].name;
		$("#file-name").text(file);
	});
	$(document).on("click",".btn-file", function(){
		$("#uploadfile").click();
	});
	$(document).on("change","#uploadfile", function(){
		var filename = this.files[0].name;
		$("#file-name").text(filename);
		$("#close_btn").css("display","block");
	});
	$(document).on("click","#close_btn",function(){
		alert("클릭됨");
		$("#uploadfile").replaceWith($("#uploadfile").clone(true)); /*초기화 */
		$("#uploadfile").val("");
		$("#file-name").text("선택된 파일 없음");
		$("#close_btn").css("display","none");
	});
</script>
</head>
<body id="boardwrite_body">

<!-- 게시글 -->
<div id="write_content_wrap">
	<h2>게시글 수정</h2>
	<form action="boardUpdatePlay.bizpoll" id="frm_btn" name="frm_btn" method="post" enctype="multipart/form-data">
		<table id="content_table">
			<tr>
				<th class="th_1">작성자</th>
				<th class="th_2"><input type="text" value="${sessionScope.loginUser.id}" readonly="readonly" name="writer"></th>
			</tr>
			<tr id="">
				<th class="th_1">제목</th>
				<th class="th_2"><input id="input_title" type="text" placeholder="제목을입력해주세요" name="title"></th>
			</tr>
			<tr id="">
				<td style="height:400px;" colspan="2">
					<textarea id="content" name="content" rows="10" cols="15"></textarea>
				</td>
			</tr>
			<tr>
				<th class="th_1">파일등록</th>
				<th class="th_2">
					<input type="file" name="uploadfile" id="uploadfile" value="파일등록">
					<input type="button" class="btn btn-file" value="파일 선택">
					<span class="files" id="file-name" style="height:29px;border:none;">${boardview.filename}</span>
					<i class="fa fa-close" id="close_btn" style="display:none"></i>	
				</th>
			</tr>
		</table>
		<span><input id="board_search_btn" type="submit" value="수정하기"></span>
	</form>
</div>

<%-- <script type="text/javascript">
	var oEditors =[];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI : "<%=path%>/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
</script> --%>


<script type="text/javascript">

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

	oAppRef: oEditors,

	elPlaceHolder: "content",

	sSkinURI: "<%=path%>/smarteditor/SmartEditor2Skin.html",

	fCreator: "createSEditor2"

});



</script>

</body>
</html>

<%@ include file="../include/footer.jsp" %>