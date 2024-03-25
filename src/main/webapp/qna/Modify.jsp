<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/common/frame.css">
    <link rel="stylesheet" href="../css/qna/modify.css">
    <style>
		#section {
		    width: 800px;
		    height: calc(var(--header-height) + 700px);
		    padding-top: calc(var(--header-height) + 50px) ;
		    margin: 0 auto;
		    display: flex;
    		justify-content: center;
		}    
		textarea {
			margin-bottom:20px;
	
    height: 30.25em;
    border: none;
    resize: none;
    margin: auto 0px;'
		}
		#btn_reset, #btn_submit{
		cursor: pointer;
		}
    </style>
</head>
<body>


    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <section id="section">
         <form id="frm" name="frm" action="../qna/Modify.do" method="post">
<!--             <form id="frm" name="frm" action="../qna/Modify.do?no=1" method="post"> -->
            <input type="hidden" name="idx" id="idx" value="${params.no }"/>
   			
                    <span style="color: red;">*</span> 
                    <input type="text" id="title" name="title" value=" ${params.title } " ><br><br>
                  
                    <span style="vertical-align: top; color: red; float:left;">*</span> 
                    <textarea style="margin-bottom:20px;" id="content" name="content" cols="96" rows="25" maxlength="3000" placeholder="-학습 관련 질문을 남겨주세요. 상세히 작성하면 더 좋아요!&#13;&#10-먼저 유사한 질문이 있었는지 검색해보세요.&#13;&#10-서로 예의를 지키며 존중하는 문화를 만들어가요."
                    ;> ${params.content } </textarea><br><br>
                    <div id ="btn">
                        <input type="reset" id="btn_reset" name="btn_reset" value="취소">&nbsp;
                        <input type="button" id="btn_submit" name="btn_submit" value="등록">
                    </div>
            </form>
        </section>
        <%@ include file="../common/footer.jsp" %>
    </div>
<script>
    document.querySelector("#btn_submit").addEventListener("click", function(e) {
        e.preventDefault();
	    e.stopPropagation();

        let title = document.querySelector("#title");
        if(title.value.length == "") {
            alert("제목을 입력하세요.");
            title.focus();
            return false;
        }
        let content = document.querySelector("#content");
        if(content.value.length == "") {
            alert("내용을 입력하세요.");
            content.focus();
            return false;
        }
        
        document.frm.submit();
    }, false);
    document.querySelector("#btn_reset").addEventListener("click", function(e) { 
    	window.history.back();
    });
</script>
</body>
</html>