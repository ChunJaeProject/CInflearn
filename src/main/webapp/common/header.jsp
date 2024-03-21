<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
            z-index: 10000;
        }  
          #out_popupContainer{
            position: fixed; 
            display: none; 
            top: 0; 
            left: 0; 
            width: 100%;
            height: 100%; 
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 10000;
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
          .modal_signOut{  
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
        
        .close_div { width: 100% }
        .close_button{  
            margin: 0 auto; 
            height: 30px; 
            width: 500px;
        } 
        .close_button svg{ 
            float: right;
        } 
/*         .header_logo{ 
            margin-top:55px; 
            margin-left: 150px; 
            height: 40px; 
            width: 500px;
        } */
        .header_logo img {
        	display: block;
        	margin: 0 auto;
        }
        .sign_div { 
            margin-top: 30px; 
            width: 100%; 
            height: 100px; 
            float: left;
        }
        .sign_form {
        	text-align: center;
        }
        .form_btn {
        	margin-top: 48px;
        }
        .form_login{
            width:300px; 
            height: 40px;
            margin: 0 auto 5px;
        } 
        .form_signup{ 
            margin: 0 auto;
            width: 300px; 
            height: 40px;  
        } 
        .modal_signUp{ 
            border: 1px solid black; 
        } 
 
        .sign_form{
            width: 100%;
        }   
        #form_email{ 
            height: 30px; 
            width:400px; 
        } 
        #form_password{ 
            margin-top:10px; 
            height: 30px; 
            width:400px;
        } 
        .close-btn { 
            position: absolute; 
            top: 10px; 
            right: 10px; 
            font-size: 20px; 
            cursor: pointer;
        }
     
        .out_div{
        text-align: center
        }
</style>
</head>
<body>
<%

String id =((String) session.getAttribute("userId") != null ? (String) session.getAttribute("userId") : "고객");


%>
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

			<button class="login_btn"  value = "<%=id.equals("고객") ? "로그인" : "로그아웃" %>"><%= id.equals("고객") ? "로그인" : "로그아웃" %></button>
			

            <button>회원가입</button>
      <% if (!id.equals("고객")){
      
      %>
            <button class ="out_btn">회원탈퇴</button>
  <% }%>
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
            
                <form class="sign_form"  name ="sign_form" method="post"  action="../login/loging.do" > 
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
    
     <div id="out_popupContainer">
        <div class="modal_signOut">
             <div class="close_div">
                 <button class="close-btn" id="closePopupp"> X</button>
            </div>
     
            <h2>회원탈퇴</h2>
            <h4>정말로 떠나실건가요?</h4>
     
        <div class="out_div">
            <form class="out_form"  name="out_form"  action="../login/memberOut.do" method="post">
                 <input type="password" name="password" id = "form_password2" class="form_password" value=""  placeholder="비밀번호">
                 <span style="font-size:11px;"> 탈퇴 시 작성한 게시글을 삭제되지 않습니다.</span><br><br>
                 <button class="member_out ">정말로 탈퇴하기</button><br>
                 <button class="form_cancel">취소</button>
     
        </form>
           </div>
        </div>
     </div>
    
    <Script>
        let login_popupContainer = document.getElementById("login_popupContainer"); 
        let out_popupContainer = document.getElementById("out_popupContainer"); 
        let member_out  = document.querySelector(".member_out");
        
        member_out.addEventListener("click",function(e){ 
      		document.out_form.submit();
        });  
        
        let login_btn = document.querySelector(".login_btn");
        let out_btn =document.querySelector(".out_btn");
        
       if(out_btn){
        out_btn.addEventListener("click",function(e){ 
        	out_popupContainer.style.display="block"; 
        });  
       }
       
        login_btn.addEventListener("click",function(e){ 

			if(login_btn.value ==="로그인"){
    	        login_popupContainer.style.display="block"; 
  				}
			else{
				console.log("로그인완료");
				location.href="/login/logout.do";
			}
        });  
      
     
        document.getElementById("closeLoginPopup").addEventListener("click",function(e){ 
            login_popupContainer.style.display="none"; 
        });
        
        document.querySelector("#closePopupp").addEventListener("click",function(e){ 
            out_popupContainer.style.display="none"; 
        });
    </Script>
</body>
</html>