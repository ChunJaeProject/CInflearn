<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="common.CommonUtil"%>
<%@page import="dto.QnADTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.QnADAO"%>
<%@ include file="../common/top.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변(상세)</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/qna/qnaDetail.css">
    <link rel="stylesheet" href="../css/common/frame.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <style>
		#section {
		    width: 900px;
		    height: calc(var(--header-height) + 800px);
		    padding-top: calc(var(--header-height) + 20px) ;
		    margin: 0 auto;
		}
		.commentList{
			height:80px;
			width:500px;
			border :1px solid gray;
			padding :10px;
			border-radius:10px;
			}
			p{
			width: 200px;
			}
			#btn_delete {
				width: 80px;
			    height: 35px;
			    background-color: darkgrey;
			    color: #fff;
			    border: none;
			    border-radius: 8px;
			}
			#btn_update {
				width: 100px;
			    height: 35px;
			    background-color: #1dc078;
			    color: #fff;
			    border: none;
			    border-radius: 8px;
			}
			#btn_write input:active {
				color : #ccc;
			}
    </style>
</head>
<body>
    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <div id="Writer">
	             <h4>${params.nickname }</h4><br>
	            <p style="font-size: small; color:darkgray; font-weight: bold;">작성한 질문수 (개수)</p><br>
                <img src="../assets/image/check.png" style="width: 20px;">&nbsp;<span style="color:dimgrey; font-weight: bold;">해결 여부</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${QnADetail.solution_state }</span><br>
                <input type="button" id="btn_go" name="btn_go" value="목록으로">
         </div>
        <section id="section"> 
            <div id="box">
                <div id="qTitle">
                    <h3>${params.question_title } </h3>
                    <p>${QnADetail.reg_date }</p>
                </div>
                <div id="box1">
                    <div id="qContent">
                        <form id="likeFrm" name="likeFrm"   >
							<input type="hidden" name="no" value="${params.idx}"/>
                            <input type="image" src="../assets/image/like.png" id="btn_like" name="btn_like" alt="좋아요" onclick="count('plus')"><br><br>   
                            <div id="result">0</div><br>   
                            <input type="image" src="../assets/image/hate.png" id="btn_hate" name="btn_hate" alt="싫어요" onclick="count('minus')"><br>    
                        	
                        </form>
                        <p>${params.question_content }</p>             
                    </div>
                    <div id="box2">
                        <input type="image" src="../assets/image/uncheck.png" id="btn_check" name="btn_check" alt="해결" style="margin-right: 20px;">
                        <div class="qTag" style="margin-right: 600px; margin-top: 5px;"><span>${QnADetail.question_hashtag }</span></div><br>
                        <div id ="btn_write" style="margin-top: 5px;">
                        <input type="button" name ="btn_update"  id="btn_update" value="수정하기">&nbsp;|&nbsp;
                        <input type="button" id="btn_delete" name="btn_delete" value="삭제" >
                        </div>
                    </div>
                </div>
            </div>
            <div id="answer">
            	<form name = "commentSubmit"  id="commentSubmit" method="post" action="../qna/comment.do?no=${params.idx }">
        
            	<span style="font-weight: bold;">답변</span><span style="color:#1dc078 ;"> 개수 : ${params.total_count}</span><br><br>
	            <input type="text" id="answerWrite" name="answerWrite" placeholder="답변을 작성해보세요." maxlength="300">
	            <input type="submit" id="btn_answer" name="btn_answer" value="댓글 등록"><br><br>
	            </form>
	            <div class="commentList">
	           <c:forEach var="dto" items="${commList}" varStatus="status">
                <div class="userInfo">
	               <span class="user"> <i class="fa fa-user" aria-hidden="true"></i>   ${dto.email} &nbsp;   </span> <span class="reg" style="margin-right:10px;"> ${dto.reg_date } </span><Br><br>
	      			<span class= "commetValue">    ${dto.content} </span>
      			</div>
    			</c:forEach>
	            </div>  
            </div>
        </section> 
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
<script>
	//댓글 등록
/* 	let commetReg = document.querySelector("#btn_answer");
	commetReg.addEventListenr("click",function(e){
		location.href="../qna/comment.do?no=${params.idx}";

		
	})
 */
	//해결 체크 버튼
    let check = document.querySelector("#btn_check");
    let flag = 1;
    check.addEventListener("click", function(e) {
    	e.preventDefault();
        console.log(this.src);
        if(flag==1){
            check.src = "../assets/image/check.png";
            flag=0;
        }
        else {
            this.src="../assets/image/uncheck.png";
            flag=1;
        }
    }, false);
    document.querySelector("#btn_go").addEventListener("click", function(){
        location.href="Qna.do";
    });
    
    //좋아요 버튼
    function count(type) {
    	const resultElment = document.getElementById('result');
    	let number = resultElment.innerText;
    	
    	if(type === 'plus') {
    		number = parseInt(number) + 1;
    		console.log(number);
    	}
    	if(type === 'minus') {
    		number = parseInt(number) - 1;
    	}
    	
    	resultElment.innerText = number;
    }
    //삭제 기능
    document.querySelector("#btn_delete").addEventListener("click", function(e) {
		alert("글을 삭제하시겠습니까?");
		window.location = "../qna/delete.do?no=${params.idx}"; 
		//location.href = "delete.do?no="+${QnADelete.no};

	/* 	 document.likeFrm.submit();  */
	}, false);
    
    document.querySelector("#btn_update").addEventListener("click",function(e){
		window.location = "../qna/Modify.do?no=${params.idx}"; 

	 },false);
</script>
</html>