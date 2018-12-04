<%@page import="com.shop_closet.Rserve.test"%>
<%@ page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  test rc = new test();
  out.print(rc.returnRClass());
%>






</body>
</html>