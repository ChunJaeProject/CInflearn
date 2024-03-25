<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="dto.QnADTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.QnADAO"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/qna/qna.css">
    <link rel="stylesheet" href="../css/common/frame.css">
    <style>
        #contents_top_area {
            background-color: rgb(201, 194, 194);
            border: 1px solid #ccc;
            width: 1200px;
            margin: 0 auto;
        }
        .qBtn {
		    margin-left: 470px;
		}
    </style>
</head>
<body>

<%
String sessionId =((String) session.getAttribute("userId") != null ? (String) session.getAttribute("userId") : "고객");
%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/top.jsp" %>
<div id="container">
   	<main id="contents"> 
        <section id="contents_top_area">
            <div id="contents_top_area_text">
                <p id="contents_title">묻고 답해요</p>
                <p id="contents_sub_title">126만명의 커뮤니티 !! 함께 토론해봐요.</p>
            </div>
        </section>
        <section id="section">
            <div id="sidebar_left">
                <ul id="sidebar_ul">
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Qna.do">질문과 답변</a></li>
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Review.do">수강평</a></li>
                    <li style="padding: 10px; font-size: small;"><a href="MentoringReview.do">멘토링 후기</a></li>
                </ul>
            </div>
            <div id="content">
                <ul id="content_ul" >
                    <li><a href="Qna.do?search_title=${maps.search_word}">전체(${maps.real_total_count })</a></li>
                    <li><a href='Qna.do?solve=N&search_title=${maps.search_word}'>미해결(${maps.unsolve_count })</a></li>
                    <li><a href="Qna.do?solve=Y?solve=N&search_title=${maps.search_word}">해결됨(${maps.solve_count })</a></li>
                </ul>
                <hr>
            <div id ="search">
                <form action =>
	                <input type="text" id="search_title" name="search_title" value="" maxlength="100" placeholder=" 궁금한 질문을 검색해보세요 !">
	                <input type="submit" id="btn_search" name="btn_search" value="검색"><br>
	                <input type="text" id="search_hash" name="search_hash" value="" maxlength="100" placeholder=" # 태그로 검색해보세요 !">
	                <input type="reset" id="btn_reset" name="btn_reset" value="초기화"><br>
                </form>
            </div>
            <ul id="order_ul">
                <li><a href="Qna.do">최신순</a></li>
                <li><a href="Qna.do?like=1" style="margin-right: 415px;">좋아요순</a></li>
            <%if (!sessionId.equals("고객")) { %>
                <input type="button" id="btn_write" name="btn_write" value="글쓰기" onclick="location.href='../qna/Write.do';"><br> 
            <%}  else {%>  
              <input type="button" id="btn_write" name="btn_write" value="글쓰기" onclick="alert('로그인 후 이용해주세요.'); location.href='../qna/Qna.do';"><br> 
               <%} %>
            </ul>
            <hr>

           	<c:choose>
				<c:when test="${not empty QnAList }">
					<c:forEach var="list" items="${QnAList }" varStatus="loop">
					<div class="question">          
	                    <div class="qTitle">
	                        <span id="solve">해결 : ${list.solution_state}</span>
	                        <a href ="QnaDetail.do?no=${list.no }">&nbsp;<span style="font-weight: bold;">${list.question_title }</span></a>
	                    </div><br>
	                    <p class="qContent">${list.question_content }</p><br>
	                    <div class="qTag"><span>${list.question_hashtag }</span></div><br>
	                    <div id="bottom">
	                        <p class="qName">닉네임 : ${list.nickname} | 작성 시간 : ${list.reg_date }</p><br>
	                        <div class="qBtn">
	                            <img src="../assets/image/like.png" width="20px">&nbsp;${list.like }&nbsp;&nbsp;
	                            <img src="../assets/image/comment.png" width="20px">&nbsp;1&nbsp;&nbsp;
	                        </div>
	                    </div>                  
                	</div>
					</c:forEach>
				</c:when>
			<c:otherwise>
				<div class="question" style="text-align: center; padding: 40px; border-bottom: 1px solid #ccc;">
                 	<p>아직 관련 글이 없습니다. 첫 글을 남겨주세요!</p>
	             </div>
			</c:otherwise>
			</c:choose>	
                
            <div class="paging_area">
                ${maps.paging}
            </div>
            </div>
            <div id="sidebar_right">
            	<p>인기태그</p><br>
	            <c:choose>
					<c:when test="${not empty QnAList }">
						<c:forEach var="list" items="${QnAList }" varStatus="loop">
				            <span>${list.question_hashtag }</span><br><br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<span>태그2</span><br><br><span>태그3</span><span>태그4</span><br><br><span>태그5</span>
					</c:otherwise>
				</c:choose>
			</div>  
        </section>
	</main>
    <%@ include file="../common/footer.jsp" %>
</div>
<script>
	document.getElementById("btn_reset").addEventListener("click",function(e){
		location.replace('./Qna.do'); 
	});
   /*  document.querySelector("#btn_write").addEventListener("click", function(){
      
        location.href="Write.do";
    });
   s
    
    document.querySelector("#btn_nowrite").addEventListener("click", function(){
        alert('로그인 후 이용해주세요.');
        location.href='../mainPage/Main.do';
    }); */
</script>
</body>
</html>