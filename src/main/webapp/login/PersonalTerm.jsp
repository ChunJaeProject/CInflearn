<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/login/PersonalTerm.css">
    <Style>
    .main{
height:800px;

}
.content2{
height:100px}
    
.term{
text-decoration: underline;
}
    </Style>
</head>

<body>
 <%@ include file="../common/header.jsp" %>
   <div class="content2">
   </div>
   <div class ="main">
    <div class="term_menu">
        <ul class="term_ul">
            <li class="li0"></li>
            <li class="li1"><a href="./personalTerm.html" class="aa">개인정보 처리방침</a> </li>
            <li class="li2">&nbsp;<a href="./useTerm.html" class="bb"> 이용약관</a></li>
        
            <li class="li3"></li>
        </ul>
    </div>
    <div class= "person_term">
        <span>
            <h3>개인정보처리방침</h3>
        인프랩 (이하 "회사")는 개인정보를 소중하게 생각하고 개인정보를 보호하기 위하여 최선을 다하고 있습니다. <br>
        "회사"는 본 개인정보처리방침을 통하여 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며<br>
        개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고자 합니다.<br>
        본 개인정보처리방침은 정부의 법률 및 지침 변경이나 "회사"의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있으며, <br>
        변경될 경우 변경된 개인정보처리방침을 "회사"가 제공하는 서비스 페이지에 공지하도록 하겠습니다.<br>
        </span><br><br>
        <a href="https://www.inflearn.com/policy/privacy"  class="term">개인정보처리방침 바로가기</a>
    </div>
    <div class="use_term">
        <span>
            <h3>제1장. 약관 및 계약</h3>
            <h3>제  제1조. 목적</h3>
            이 이용약관(이하 ”본 약관”이라 합니다)은 인프랩(이하 ”회사”라 합니다)<br>
            이 제공하는 인프런(inflearn.com) 및 인프런 관련 제반 서비스를<br>
             이용자가 이용함에 있어 회사와 이용자 간의 권리,<br>
             의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
        </span><br><br>
        <a href="https://www.inflearn.com/policy/terms-of-service"  class="term" >이용약관 바로가기</a>
    
    </div>
   

   </div>
   <footer>
    
  <%@ include file="../common/footer.jsp" %>
    
   </footer>
</body>

<script>
  let li1 = document.querySelector(".li1");
    let aa = document.querySelector(".aa");

    let li2 = document.querySelector(".li2");
    let li0 = document.querySelector(".li0");
    let li3 = document.querySelector(".li3");
    let bb = document.querySelector(".bb");

    let personTerm = document.querySelector(".person_term");
    let useTerm = document.querySelector(".use_term");

    aa.addEventListener("click",function(e){
        event.preventDefault();
        li1.style.borderTop ="1px solid black";
        li1.style.borderLeft ="1px solid black";
        li1.style.borderRight ="1px solid black";
        li1.style.borderBottom="none";

        li2.style.borderTop ="none";
        li2.style.borderLeft ="none";
        li2.style.borderRight ="none";
        li2.style.borderBottom="1px solid black";

        personTerm.style.display ="block"
        useTerm.style.display="none";
        
        bb.style.color="black";
        bb.style.fontWeight="normal";
        aa.style.color="green";
        aa.style.fontWeight="bold";

            });

     bb.addEventListener("click",function(e){
        event.preventDefault();
        li1.style.borderTop ="none";
        li1.style.borderLeft ="none";
        li1.style.borderRight ="none";
        li1.style.borderBottom="1px solid black"

        li2.style.borderTop ="1px solid black";
        li2.style.borderLeft ="1px solid black";     
        li2.style.borderRight ="1px solid black";
        li2.style.borderBottom ="none";

        personTerm.style.display ="none"
        useTerm.style.display="block";

        aa.style.color="black";
        aa.style.fontWeight="normal";
        bb.style.color="green";
        bb.style.fontWeight="bold";

        

                });

</script>
</html>