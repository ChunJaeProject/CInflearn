<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link rel="stylesheet" href="../css/login/Logout.css">
</head>

<body>
    <div class="content">
            <button class="login_button"> 회원탈퇴</button>

     

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

