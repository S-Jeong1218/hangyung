<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.shop_closet.Rserve.test2"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% test2 p = new test2();
   String imageTag = p.plot();
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style text="text/css">
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(document).ready(function(){
 
})
</script>
</head>
<body>
<h1>안녕하세요 !</h1>
<%=imageTag %>
</body>
</html>


