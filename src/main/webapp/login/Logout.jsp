<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link rel="stylesheet" href="../css/login/Logout.css">
</head>

<body>
    <div class="content">
            <button class="login_button"> 회원탈퇴</button>

      <div id="popupContainer">
        <div class="modal_signUp">
             <div class="close_div">
                 <button class="close-btn" id="closePopup"> X</button>
            </div>
     
            <h2>회원탈퇴</h2>
            <h4>정말로 떠나실건가요?</h4>
     
        <div class="sign_div">
            <form class="sign_form">
              
                 <input type="password" id = "form_password" class="form_password" value=""  placeholder="비밀번호">
                 
                 <span style="font-size:11px;"> 탈퇴 시 작성한 게시글을 삭제되지 않습니다.</span><br><br>
                 <button class="form_logout ">정말로 탈퇴하기</button><br>
                 <button class="form_cancel">취소</button>

        </div>
        </form>

        </div>
     </div>

   </div>
   
</body>
<Script>

    let popupContainer = document.getElementById("popupContainer");
    let lButton = document.querySelector(".login_button");
  
    lButton.addEventListener("click",function(e){
                popupContainer.style.display="block";
            });
        
     document.getElementById("closePopup").addEventListener("click",function(e){
            popupContainer.style.display="none";
        });

   </Script>

</html>