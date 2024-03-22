<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
			<span><%=id %>님 환영합니다</span>
			<button class="login_btn"  value = "<%=id.equals("고객") ? "로그인" : "로그아웃" %>"><%= id.equals("고객") ? "로그인" : "로그아웃" %></button>
			<button class="out_btn"  value = "<%=id.equals("고객") ? "회원가입" : "회원탈퇴" %>"><%= id.equals("고객") ? "회원가입" : "회원탈퇴" %></button>
        </div>
    </header>
<div id="login_popupContainer"> 
        <div class="modal_signUp"> 
            <div class="close_div"> 
                <button class="close-btn" id="closeLoginPopup"> X</button> 
            </div>  
            <div class="header_logo"> 
                <img src="../assets/image/inflearn_logo.png" alt="My Image" width="200px" height="60px"> 
            </div>  
            <div class="sign_div"> 
            
                <form class="sign_form"  name ="sign_form" method="post"  action="../login/loging.do" > 
                    <div class="form_input_block"> 
                        <input type="text"  name = "email" placeholder="이메일" id="form_email" class="form_email" > 
                        <div class="password_div">
                        <input type="password"  name ="password" id = "form_password" class="form_password" value="" placeholder="비밀번호">  <i class="fa fa-eye fa-lg"  id ="mask1"style="cursor:pointer;"></i>
                   </div>
                    </div> 
                
                    <div> 
           
                        <button class="form_login ">로그인</button> 
                    </div> 
                     <% if(request.getAttribute("loginError") != null) { %>
        <p style="color:red;"><%= request.getAttribute("loginError") %></p>
    <% } %>
                    
                </form>
            </div> 
        </div> 
    </div>
    
     <div id="out_popupContainer">
        <div class="modal_signOut">
             <div class="close_div">
                 <button class="close-btn" id="closePopupp"> X</button>
            </div>
			<Div style= "height: 50px;">
			</Div>
            <h2>회원탈퇴</h2>
            <h4>정말로 떠나실건가요?</h4><Br>
     		
        <div class="out_div">
            <form class="out_form"  name="out_form"  action="../login/memberOut.do" method="post">
                 <input type="password" name="password" id = "form_password2" class="form_password2" value=""  placeholder="비밀번호"><i class="fa fa-eye fa-lg"  id ="mask2" style="cursor:pointer; margin-left :5px; margin-right: -30px;	"></i><br><br>
                 <span style="font-size:11px; color:red"> 탈퇴 시 작성한 게시글을 삭제되지 않습니다.</span><br><br>
                 <button class="member_out ">정말로 탈퇴하기</button><br>
                 <button class="form_cancel">취소</button>
     
        </form>
           </div>
        </div>
     </div>
    
        <Script>
        
        //비밀번호 마스킹 
        const mask1 = document.querySelector("#mask1");
        const mask2 = document.querySelector("#mask2");
        const pwd = document.querySelector("#form_password");
        const pwd2 = document.querySelector("#form_password2");
        mask1.addEventListener("click",function(e){
        	if(pwd.type==="password"){
        	pwd.type="text";
        	}
        	else{
        		pwd.type="password";
        	}

        	});
        
        mask2.addEventListener("click",function(e){
        	if(pwd2.type==="password"){
        	pwd2.type="text";
        	}
        	else{
        		pwd2.type="password";
        	}

        	});
      
        const menu_link = ["../mentor/mentor.do", "../qna/Qna.do", "../qna/Review.do","../qna/MentoringReview.do"];
        const menu_li = document.querySelectorAll("#menuUl li");
        menu_li[0].addEventListener("click", function(e){
        	window.location.href = menu_link[0];
        });
        menu_li[1].addEventListener("click", function(e){
        	window.location.href = menu_link[1];
        });
        menu_li[2].addEventListener("click", function(e){
        	window.location.href = menu_link[2];
        });
        menu_li[3].addEventListener("click", function(e){
        	window.location.href = menu_link[3];
        });
        document.getElementById("logo").addEventListener("click",function(e){
        	window.location.href = "../mainPage/Main.do"
        });
        let login_popupContainer = document.getElementById("login_popupContainer"); 
        let out_popupContainer = document.getElementById("out_popupContainer"); 
        let member_out  = document.querySelector(".member_out");
        
        member_out.addEventListener("click",function(e){ 
      		document.out_form.submit();
        });  
        
        let login_btn = document.querySelector(".login_btn");
        let out_btn =document.querySelector(".out_btn");
       
        
        //로그인,로그아웃
        login_btn.addEventListener("click",function(e){ 

			if(login_btn.value ==="로그인"){
    	        login_popupContainer.style.display="block"; 
  				}
			
			else{
				
				location.href="../login/logout.do";
			}
        });  
        
  
       
            out_btn.addEventListener("click",function(e){ 
            	if(out_btn.value==="회원가입"){
            		location.href="../login/regist.do";
            	}
            	else{
            	
            		out_popupContainer.style.display="block"; 
            	}
            	
            });  
        

     
        document.getElementById("closeLoginPopup").addEventListener("click",function(e){ 
            login_popupContainer.style.display="none"; 
        });
        
        document.querySelector("#closePopupp").addEventListener("click",function(e){ 
            out_popupContainer.style.display="none"; 
        });
        
        
        document.querySelector(".form_cancel").addEventListener("click",function(e){ 
        	e.preventDefault();
            out_popupContainer.style.display="none"; 
        });
    </Script>