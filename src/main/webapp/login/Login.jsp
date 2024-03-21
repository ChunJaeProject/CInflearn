<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{ 
            width: 100%; 
            height: 1200px; 
            background-color: azure; 
        } 
        #login_popupContainer{
            position: fixed; 
            display: none; 
            top: 0; 
            left: 0; 
            width: 100%;
             height: 100%; 
             background-color: rgba(0, 0, 0, 0.5);
        }  
        .modal_signUp{  
            width: 500px; 
            height: 350px;  
            position:absolute; 
            top:50%; left:50%; 
            transform: translate(-50%,-50%); 
            z-index: 1000; 
            background: #fff; 
            border-radius: 15px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); 
        } 
        .close_button{  
            margin: 0 auto; 
            height: 30px; 
            width: 500px;
        } 
        .close_button svg{ 
            float: right;
        } 
        .header_logo{ 
            margin-top:55px; 
            margin-left: 150px; 
            height: 40px; 
            width: 500px;   
        } 
        .sign_div { 
            margin-top: 30px; 
            width: 500px; 
            height: 100px; 
            float:left; 
            margin-left: 150px 
        } 
        .form_login{ 
            margin-left:100px; 
            margin-bottom: 5px; 
            width:300px; 
            height: 40px;  
        } 
        .form_signup{ 
            margin-left:100px; 
            width:300px; 
            height: 40px;  
        } 
        .modal_signUp{ 
            border: 1px solid black; 
        } 
        .sign_form{
            width:300px; 
        } 
        #form_email{ 
            height: 30px; 
            width:400px; 
            margin-left :-100px;  
        } 
        #form_password{ 
            margin-top:10px; 
            height: 30px; 
            width:400px; 
            margin-left :-100px; 
        } 
        .close-btn { 
            position: absolute; 
            top: 10px; 
            right: 10px; 
            font-size: 20px; 
            cursor: pointer;
        }
</style>
</head>
<body>
	 <header id="header">
        <div id="logo"></div>
        <div id="menuBox">
            <nav id="menu">
                <ul id="menuUl">
                    <li>멘토링</li>
                    <li>질문&답변</li>
                    <li>강의평</li>
                    <li>멘토링후기</li>
                </ul>
            </nav>
        </div>
        <div id="headerBtnBox">
            <button class ="headerLogin">로그인</button>
            <button class="registMember">회원가입</button>
            <button class=headerLogout> 로그아웃</button>
        </div>
    </header>
   <div id="login_popupContainer"> 
        <div class="modal_signUp"> 
            <div class="close_div"> 
                <button class="close-btn" id="closeLoginPopup"> X</button> 
            </div>  
            <div class="header_logo"> 
                <img src="../images/inflearn_logo.png" alt="My Image" width="200px" height="60px"> 
            </div>  
            <div class="sign_div"> 
            
                <form class="sign_form"  name ="sign_form" method="post"  action="loging.do" > 
                    <div class="form_input_block"> 
                        <input type="email"  name = "email" placeholder="이메일" id="form_email" class="form_email" >  
                        <input type="password"  name ="password" id = "form_password" class="form_password" value="" placeholder="비밀번호">  
                    </div> 
                
                    <div> 
                        <button class="form_login ">로그인</button> 
                    </div> 
                    <button class="form_signup" >회원가입</button> 
                </form>
            </div> 
        </div> 
    </div>
    <Script>
     	let login_button = document.querySelector(".form_login");  
     	let singup_button = document.querySelector(".form_signup");  
     	let logout_button = document.querySelector(".headerLogout");  
     	
     	logout_button.addEventListener("click",function(e){ 
    		location.href="./logout.do";
        });  
     	
     	login_button.addEventListener("click",function(e){ 
              document.sign_form.submit();
          });  
     	
        let login_popupContainer = document.getElementById("login_popupContainer"); 
        let lButton = document.querySelector(".headerLogin");  
        lButton.addEventListener("click",function(e){ 
            login_popupContainer.style.display="block"; 
        });  
        document.getElementById("closeLoginPopup").addEventListener("click",function(e){ 
            login_popupContainer.style.display="none"; 
        });
    </Script>
</body>
</html>