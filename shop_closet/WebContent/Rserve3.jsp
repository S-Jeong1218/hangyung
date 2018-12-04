<%@page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<%@page import="com.shop_closet.Rserve.test3"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Movie Chart...</h1>
<%test3 mv = new test3(); %>
<img src="data:image/jpg;base64,<%=Base64.encode(mv.getImage()) %>"/>
</body>
</html>