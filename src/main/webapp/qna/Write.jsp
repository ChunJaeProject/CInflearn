<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>글쓰기</title>
 <link rel="stylesheet" href="../css/common/base.css">
 <link rel="stylesheet" href="../css/common/frame.css">
 <link rel="stylesheet" href="../css/qna/write.css">
 <style>
	 #container {
	 	height: 900px;
	 }
      #section {
          width: 100%;
          height:700px;
          padding-top: calc(var(--header-height) + 50px) ;
          margin: 0 auto;
          display : flex;
          justify-content: center;
      }
      #content {
	    border: 1px solid #ccc;
	    border-radius: 7px;
	  }
	  #btnDiv{
		  width:500px;
		  margin : 0px auto;
		  display : flex;
	      justify-content: center;
	      margin-bottom: 50px;
	  }
 </style>
</head>
<body>
    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <%@ include file="../common/top.jsp" %>
        <section id="section">
            <form id="frm" name="frm" action="../qna/Write.do" method="post">
                <span style="color: red;">*</span> <input type="text" id="title" name="title" placeholder="제목에 핵심 내용을 요약해보세요."><br><br>
                &nbsp;&nbsp;<input type="text" id="tag" name="tag" placeholder="태그를 설정하세요.(최대 10개)"><br><br>
                <span style="vertical-align: top; color: red; float: left;">* </span> 
                <textarea id="content" name="content" maxlength="3000" style="width:700px; height:400px " placeholder="-학습 관련 질문을 남겨주세요. 상세히 작성하면 더 좋아요!&#13;&#10-먼저 유사한 질문이 있었는지 검색해보세요.&#13;&#10-서로 예의를 지키며 존중하는 문화를 만들어가요."
                ></textarea><br><br>
                  </section>
                <div id ="btnDiv">
                    <input type="reset" id="btn_reset" name="btn_reset" value="취소">&nbsp;
                    <input type="submit" id="btn_submit" name="btn_submit" value="등록">
                </div>
            </form>
      
    </div>
    <%@ include file="../common/footer.jsp" %>
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

        let tag = document.querySelector("#tag");
        if(tag.value.length > 21) {
            alert("태그는 최대 20자까지 가능합니다.");
            tag.focus();
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
</script>
</body>
</html>