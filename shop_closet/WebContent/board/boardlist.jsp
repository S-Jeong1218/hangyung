<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<style type="text/css">
	#board_body{
		padding-top:170px;
	}
	#board_all{
		width:1070px;
		margin:0 auto;
	}
	board_arrange{
		display:block;
		margin-bottom:20px;
	}
	#board_arrange>ul>li{
		list-style:none;
		float:left;
        display: inline-block;
        border-left:1px solid #EFDBEB;
        padding: 0 5px 0 7px;
    }
  	#board_arrange>ul > li:first-child{
        border-left:0px!important;
    }
    #board_write{
    	padding: 2px;
		background-color: blue;
		width:50px;
		display: block;
		border-radius: 10px;
		background-color: #6D3660;
		float:right;
    }
    #board_write>a{
    	color: white;
    }
	#board_table{
		display:inline-block;
	}
	table{
		font-size: 17px;
		border-collapse:collapse;
		border-spacing:0;
		disblay:table;
	}
	th{padding: 5px;}
	tr{border-bottom:1px dashed #BBBBBB;}
	.th_etc{
		width:100px;
	}
	#th_title{
		width:350px;
	}
	.td_title>a{
		text-decoration: none;
	}
	.td_etc{
		text-align: center;
	}
	.td_title{
		text-align: left;
	}
	.new_time{
		color:red;
		font-size:10px;
	}
	
	/* Pagination links */
	#div_pagination{
		text-align:center;
	}
	.pagination{
		display:inline-block;
		margin:0 auto;
	}
	.pagination a {
 	   color: black;
 	   float: left;
 	   padding: 8px 16px;
 	   text-decoration: none;
 	   transition: background-color .3s;
	}

	/* Style the active/current link*/
	.pagination a.active {
	    background-color: dodgerblue;
	    color: white;
	}
	.pagination li {
		float: left;
	}

	/* Add a grey background color on mouse-over */
	.pagination a:hover:not(.active) {background-color: #ddd;}
	
	/* 검색창 */
	div#board_search_all{
		height:34px;
		display:inline-block;
		padding-top:20px;
		margin:auto;
	}
	div#board_search{
		border:2px solid #A881B6;
		height:34px;
		box-sizing: border-box;
		position:relative;
		width:360px;
		display:inline-block;
	}
	input#board_search_keyword{
		width:353px;
		height:30px;
		font-size:13px;
		box-sizing: border-box;
		border:0px;
		padding-left:10px;
	}
	input#board_search_btn{
		width:55px;
		height:30px;
		background-color:#A881B6;
		color:white;
		font-size:13px;
		border:0px;
		position:absolute;
		right:0px;
		top:0px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#board_search_btn").click(function(){
			alert("test");
			var keyword = $("#board_search_keyword").val();
			var flag = $("#board_search_select").val();
			alert(flag+keyword);
			location.href="boardList.bizpoll?flag="+flag+"&keyword="+keyword;
		});
	});
</script>
</head>
<body id="board_body">
	<div id="board_all">
		<h2><a>Q&A</a></h2>
		<div id="board_arrange">
			<ul>
				<li><a href="#">최신순</a></li>
				<li><a href="#">추천순</a></li>
				<li><a href="#">조회순</a></li>
				<li><a href="#">댓글순</a></li>
			</ul>
		</div>
		
		<div id="board_write">
			<a href="boardwrite.bizpoll">글쓰기</a>
		</div>
		
		<div id="board_table">
			<table>
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
				
				<c:forEach items="${boardList}" var="bDto">
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
					<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
							
					<tr class="">
						<td class="td_etc">${bDto.bno}</td>
						<td class="td_etc">질문</td>
						<td class="td_title">
							<a href="boardViewcnt.bizpoll?bno=${bDto.bno}">
								${bDto.title}
								<c:if test="${today2 == regdate2}">
									<span class="new_time">NEW</span>
								</c:if>
							</a>
							[${bDto.replycnt}]
						</td>
						<td class="td_etc">${bDto.goodcnt}</td>
						<td class="td_etc">${bDto.viewcnt}</td>
						<td class="td_etc">
							<c:if test="${bDto.filesize>0}">
								<i class="fa fa-floppy-o"></i>
							</c:if>
						</td>
						<td class="td_etc">${bDto.writer}</td>
						<td class="td_etc">
							<c:choose>
								<c:when test="${today2 == regdate2}">
									<fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/>
								</c:when>
								<c:otherwise>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		
		<!-- <div id="div_pagination">
			<div class="pagination">
		 		 <a href="#">&laquo;</a>
  				 <a href="#">1</a>
 				 <a class="active" href="#">2</a>
 				 <a href="#">3</a>
 				 <a href="#">4</a>
 				 <a href="#">5</a>
 				 <a href="#">6</a>
 				 <a href="#">&raquo;</a>
			</div>
		</div> -->
		
		<div id="div_pagination">
			<ul class = "pagination">
				<c:if test="${pageMaker.prev}">
					<li>
						<a href="boardList.bizpoll?page=${pageMaker.startPage-1}">&laquo;</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
					<li 
						<c:out value="${pageMaker.criDto.page==idx? 'class=active':''}"/>>
						<a href="boardList.bizpoll?page=${idx}&flag=${flag}&keyword=${keyword}">${idx}</a>
					
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li>
						<a href="boardList.bizpoll?page=${pageMaker.endPage+1}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
		
		
		<div id="board_search_all">
			<select id="board_search_select">
				<option value="3" selected="selected">검색</option>
				<option value="1">title</option>
				<option value="2">content</option>
				<option value="3">title+content</option>
				<option value="4">writer</option>
			</select>
			
			<div id="board_search">
				<input id="board_search_keyword" type="text" placeholder="검색어를 입력하세요">
				<input id="board_search_btn" type="submit" value="검색">
			</div>
			<!-- <span>#제목과 글만 검색되고, 댓글은 검색되지 않습니다.</span> -->
		</div>	
		
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>