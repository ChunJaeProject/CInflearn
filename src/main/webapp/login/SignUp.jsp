<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/login/SignUp.css">
</head>

<body>
   <div class="content">
    <div class="sign_title">
    <h2>회원가입</h2>
    <h3>인프런에서 가치를 높이세요.</h3>
    </div>
    
    <div class="sing_up">
        <form class = "signfrm" name="signfrm"  id ="signfrm" method="post" action ="regist.do">
       
            <label for="email" class="form_email">이메일</label><br>
           
            <input type="email" placeholder="example@inflab.com"><br><br><br>
           
            <label for="password" class="form_email">비밀번호</label><br>
       
            <input type="password" placeholder="*******"><br><br><br>
            
            <label for="passwordConfirm" class="form_emailConfirm">비밀번호 확인</label><br>
       
            <input type="password" placeholder="*******"><br><br><br>
          
            <input type="button"   name ="sign_button" id = "sign_button" value="회원가입"> <br><br>
    
            <span class="terms">가입 시 <a href="#">서비스이용약관</a>, <a href="#">개인정보처리방침</a>에 동의합니다.</span>
        </form>

       


   </div>
   
   <Script>
   
   const uSubmit = document.querySelector("#sign_button");
   
   uSubmit.addEventListener("click",function (e){
		document.signfrm.submit();
	},false);
   
   </Script>
   
   
</body>
</html>