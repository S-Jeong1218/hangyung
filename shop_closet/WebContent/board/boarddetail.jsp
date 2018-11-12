<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#boarddetail_body{
		padding-top:170px;
	}
	
	/* 게시글 */
	#detail_content_wrap{
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
	.th_etc{
		width:100px;
	}
	#th_title{
		width:350px;
	}
	#content_tr_td{
		text-align: center;
	}
	.td_etc{
		text-align: left;
	}
	.td_title{
		text-align: left;
	}
	
	/* 리플 */
	#detail_reply_wrap{
		width:1070px;
		margin:0 auto;
	}
	#reply_table{
		display:inline-block;
		width:1070px;
	}
	#reply_table th{
		text-align: left;
	}
	
	/* 댓글입력 */
	#input_reply{
		width:970px;
		height:100px;
	}
	
</style>
</head>
<body id="boarddetail_body">

<!-- 게시글 -->
<div id="detail_content_wrap">
	<h2>QnA</h2>
	<table id="content_table">
		<tr id="">
			<th class="th_etc">게시글번호</th>
			<th class="th_etc">게시글타입</th>
			<th id="th_title">제목</th>
			<th class="th_etc">좋아요</th>
			<th class="th_etc">view_count</th>
			<th class="th_etc">첨부파일</th>
			<th class="th_etc">작성자</th>
			<th class="th_etc">작성일자</th>
		</tr>
		
		<tr id="content_tr_td">
			<td>${boardview.bno}</td>
			<td>질문</td>
			<td>${boardview.title}</td>
			<td>${boardview.goodcnt}</td>
			<td>${boardview.viewcnt}</td>
			<td>${boardview.filename}(<fmt:formatNumber type="number" value="${boardview.filesize/1024}" pattern="#.#"/>KB)</td>
			<td>${boardview.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardview.regdate}"/></td>
		</tr>
		
		<tr id="">
			<td style="height:400px;" colspan="8">${boardview.content}</td>
		</tr>
	</table>
	<c:if test="${sessionScope.loginUser.id == boardview.writer}">
		<span><a href="#">게시글 수정</a></span>
		<span><a href="#">게시글 삭제</a></span>
	</c:if>
</div>

<!-- 댓글 -->
<div id="detail_reply_wrap">
	<h4>reply</h4>
	<table id="reply_table">
		<tr>
			<th style="width:200px">댓글번호: </th>
			<th style="width:270px">작성자 : </th>
			<th style="width:200px">작성일자: </th>
			<th style="width:400px"></th>
		</tr>
		
		<tr>
			<td colspan="4">댓글 내용입니다아아아아아아</td>
		</tr>
	</table>
	
	<c:choose>
		<c:when test="${empty sessionScope.loginUser}">
			<h4>로그인을 하시면 댓글을 등록할 수 있습니다.</h4>
		</c:when>
		<c:otherwise>
			<div id="div_input_reply">
				<div id="user_name">${sessionScope.loginUser.id}</div>
				<input id="input_reply" type="text" placeholder="댓글을 입력해주세요">
				<input id="submit_reply" type="submit" value="입력">
			</div>
		</c:otherwise>
	</c:choose>	
</div>

</body>
</html>

<%@ include file="../include/footer.jsp" %>