<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* String id = (String)session.getAttribute("userId"); */
String id =(String)session.getAttribute("userId") != null ? (String)session.getAttribute("userId") : "고객님";
%>

<%=id %> 환영합니다.
<a href="../common/header.jsp" > 안녕</a>
</body>
</html>