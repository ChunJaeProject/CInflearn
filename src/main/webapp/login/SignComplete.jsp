<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/login/SignComplete.css">
    
    <Style>
   .mainContent{

   height:800px;
   text-align:center;}
 
    </Style>
</head>

<body>
 <%@ include file="../common/header.jsp" %>
 
<%
String email= request.getParameter("email");
%>  

    <div class="mainContent">
     
        <div class="mainSection">
        <br><br><br><br><br><br><br><br><br><br>
        <span>
            <%=email %>님의 <br>    
                인프런 회원가입을 축하합니다🎉<br><br>

                반가워요. 인프런에 오신것을 환영해요🖐🏻<br>
                앞으로 인프런과 함께 차근 차근 성장해봐요!!<br>
                인프런은 회원님의 성장을 응원합니다!<br><br>

                다시 한번 가입해주셔서 감사합니다. 🙇🏻<br><br>
                </span>
  <div class="toButton">
        <button class="toMain" onclick="location.href='../mainPage/Main.do'">인프런 이용하러가기</button>
       </div>
        </div>
        </div>
    
   <%@ include file="../common/footer.jsp" %>
  
</body>
<Script>
    
</Script>
</html>