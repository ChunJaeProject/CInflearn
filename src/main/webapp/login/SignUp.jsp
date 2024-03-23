<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/login/SignUp.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> 
<style>
.main{
padding-top:100px;
width: 1200px;
margin: 0 auto;
}
#email{
 border-radius : 5px;
         border : 1px solid #ced4da;
           box-shadow: 0  1px #ced4da;
           height:45px;
           width:300px;
     
}
#password{
 border-radius : 5px;
         border : 1px solid #ced4da;
           box-shadow: 0  1px #ced4da;
           height:45px;
           width:300px;
}
#passwordConfirm{
 border-radius : 5px;
         border : 1px solid #ced4da;
           box-shadow: 0  1px #ced4da;
           height:45px;
           width:300px;}
#sign_button{
	width:300px;
	height:45px;
	margin-top:20px;
	color:white;
        border : none;
        border-radius :5px;
        background : rgb(14,192,12);
}
.term{

text-decoration: underline}
</style>

</head>

<body>
 <%@ include file="../common/header.jsp" %>
   <div class="main">
   
    <div class="sign_title">
    <h2>회원가입</h2>
    <h3>인프런에서 가치를 높이세요.</h3>
    </div>
    
    <div class="sing_up">
        <form class = "signfrm" name="signfrm"  id ="signfrm" method="post" action ="regist.do">
       
            <label for="email" class="form_email">이메일</label><br>
           
           
            <input type="email" name ="email" id="email"placeholder="example@inflab.com">
           	<p> </p><br>
           	
            <label for="password" class="form_email">비밀번호</label><br>
       
            <input type="password" name ="password" id="password" class="password" placeholder="*******"><i class="fa fa-eye fa-lg"  id ="mask3"style="cursor:pointer; margin-left:10px;"></i><br><br><br>
            
            <label for="passwordConfirm" class="form_emailConfirm">비밀번호 확인</label><br>
       
            <input type="password" id="passwordConfirm" class="form_emailConfirm" placeholder="*******"><i class="fa fa-eye fa-lg"  id ="mask4"style="cursor:pointer; margin-left:10px;"></i>
          	<p id="passwordMessage"></p>
            <input type="button"   name ="sign_button" id = "sign_button" value="회원가입"> <br><br>
    
            <span class="terms">가입 시 <a href="./PersonalTerm.jsp" class="term">개인정보처리방침</a>, <a href="./UseTerm.jsp" class="term">서비스이용약관</a>에 동의합니다.</span>
        </form>

       


   </div>
   </div>
     <%@ include file="../common/footer.jsp" %>
</body>
 <Script>
 
 const mask3 = document.querySelector("#mask3");
 const mask4 = document.querySelector("#mask4");
 
 const pwd1 = document.querySelector("#password");
 const pwdCfrm = document.querySelector("#passwordConfirm");
 
 mask3.addEventListener("click",function(e){
 	if(pwd1.type==="password"){
 	pwd1.type="text";
 	}
 	else{
 		pwd1.type="password";
 	}

 	});
 
 mask4.addEventListener("click",function(e){
	 	if(pwdCfrm.type==="password"){
	 		pwdCfrm.type="text";
	 	}
	 	else{
	 		pwdCfrm.type="password";
	 	}

	 	});
 
 const emailInput = document.querySelector('#email');
 const p = document.querySelector('p');

 // 이메일 유효성 검사 함수
 function isEmail(value) {
     //'@' 문자의 위치를 찾아서, 그 위치가 1보다 큰지 확인
     return (value.indexOf('@') > 1) 
     // .확인
     && (value.split('@')[1].indexOf('.') > 1);
 }

 //비밀번호 유효성검사 
 function validatePassword(password) {
	    const regex = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,32}$/;
	    return regex.test(password);
	}
 
 // 이메일 입력 시 유효성 검사
 emailInput.addEventListener('keyup', (e) => {
     const value = e.currentTarget.value;
     if (isEmail(value)) {
         p.style.color = 'green';
         p.textContent = '이메일 형식입니다';
     } else {
         p.style.color = 'red';
         p.textContent = '이메일 형식이 올바르지 않습니다.';
     }
 });

 // 비밀번호 입력 필드 선택
 const password = document.getElementById('password');
 const passwordConfirm = document.getElementById('passwordConfirm');
 const passwordMessage = document.getElementById('passwordMessage');
 
//비밀번호 일치 및 유효성 검사
 function validatePasswords() {
     // 먼저 비밀번호 유효성 검사를 수행
     if (!validatePassword(password.value)) {
         passwordMessage.style.color = 'red';
         passwordMessage.textContent = '비밀번호는 8글자 이상 32글자 이하이며, 특수 문자를 포함해야 합니다.';
     } else {
         // 비밀번호 유효성 검사를 통과한 경우, 비밀번호 일치 여부 검사
         if (password.value === passwordConfirm.value) {
             passwordMessage.style.color = 'green';
             passwordMessage.textContent = '비밀번호가 올바릅니다.';
         } else {
             passwordMessage.style.color = 'red';
             passwordMessage.textContent = '비밀번호가 일치하지 않습니다.';
         }
     }
 }

 

 // 비밀번호 입력 시 검사
 password.addEventListener('input', validatePasswords);
 passwordConfirm.addEventListener('input', validatePasswords);

 const uSubmit = document.querySelector("#sign_button");

 // 회원가입 버튼 클릭 시 실행
 uSubmit.addEventListener("click", function (e){
	 e.preventDefault();
	 
	  if (emailInput.value.trim() === "" || password.value.trim() === "" || passwordConfirm.value.trim() === "") {
	        alert("이메일, 비밀번호, 비밀번호 확인 칸을 모두 입력해주세요.");
	        return false;
	    }
     // 이메일 형식 및 비밀번호 일치 확인
     if (isEmail(emailInput.value) && password.value === passwordConfirm.value && validatePassword(password.value)	) {
         // 유효성 검사를 모두 통과하면 폼 제출
         document.signfrm.submit();
     } else {
         // 유효성 검사를 통과하지 못하면 경고 메시지
         alert("입력한 정보를 다시 확인해주세요.");
     }
 });
   
   </Script>
</html>