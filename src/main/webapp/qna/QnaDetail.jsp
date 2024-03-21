<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변(상세)</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/qna/qnaDetail.css">
    <link rel="stylesheet" href="../css/common/frame.css">
    <style>
		#section {
		    width: 900px;
		    height: calc(var(--header-height) + 800px);
		    padding-top: calc(var(--header-height) + 20px) ;
		    margin: 0 auto;
		}
    </style>
</head>
<body>
    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <div id="Writer">
                <h4>작성자 닉네임</h4><br>
                <p style="font-size: small; color:darkgray; font-weight: bold;">작성한 질문수 (개수)</p><br>
                <img src="../assets/image/check.png" style="width: 20px;">&nbsp;<span style="color:dimgrey; font-weight: bold;">해결 여부</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>해결됨</span><br>
                <input type="button" id="btn_go" name="btn_go" value="목록으로">
         </div>
        <section id="section"> 
            <div id="box">
                <div id="qTitle">
                    <h3>제목</h3>
                    <p>작성시간</p>
                </div>
                <div id="box1">
                    <div id="qContent">
                        <form id="likeFrm" name="likeFrm">
                            <input type="image" src="../assets/image/like.png" id="btn_like" name="btn_like" alt="좋아요" onclick="count('plus')"><br><br>   
                            <div id="result">0</div><br>   
                            <input type="image" src="../assets/image/hate.png" id="btn_hate" name="btn_hate" alt="싫어요" onclick="count('minus')"><br>    
                        </form>
                        <p>글내용</p>             
                    </div>
                    <div id="box2">
                        <input type="image" src="../assets/image/uncheck.png" id="btn_check" name="btn_check" alt="해결" style="margin-right: 20px;">
                        <div class="qTag" style="margin-right: 600px; margin-top: 5px;"><span>태그1</span><span>태그2</span></div><br>
                        <div style="margin-top: 5px;"><a href="Modify.jsp">수정</a>&nbsp;|&nbsp;<a href="delete.jsp">삭제</a></div>
                    </div>
                </div>
            </div>
            <div id="answer">
                <form>
                    <span style="font-weight: bold;">답변</span><span style="color:#1dc078 ;">(개수)</span><br><br>
                    <input type="text" id="answerWrite" name="answerWrite" placeholder="답변을 작성해보세요." maxlength="300">
                    <input type="submit" id="btn_answer" name="btn_answer" value="댓글 등록"><br><br>
                    <div class="aContent">
                        <p><b>답변자 닉네임</b>&nbsp;&nbsp;<span id="time">작성시간</span></p><br>
                        <p>댓글내용</p>
                    </div>
                    <div class="aContent">
                        <p><b>질문자 닉네임</b>&nbsp;&nbsp;<span id="person">질문자</span>&nbsp;<span id="time">작성시간</span></p><br>
                        <p>댓글내용</p>
                    </div>
                    <div class="aContent" style="text-align: center; padding: 40px;">
                        <p>답변을 기다리고 있는 질문이에요.</p>
                        <p>첫번째 답변을 남겨보세요!</p>
                    </div>
                </form>
            </div>
        </section> 
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
<script>
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
        location.href="QnA.jsp";
    });
    
    //좋아요 버튼
    /* let like = document.querySelector("#btn_like");
    let hate = document.querySelector("#btn_hate");
    let num = 0;
    like.addEventListener("click", function(e) {
    	e.preventDefault();
    	num++;
    	console.log(num);
    }, false);
    
    hate.addEventListener("click", function(e) {
    	e.preventDefault();
    	num--;
    }, false); */
    
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
</script>
</html>