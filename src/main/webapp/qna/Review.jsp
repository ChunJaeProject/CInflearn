<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="dto.LectureReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.ReviewDAO"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강평</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/common/frame.css">
    <link rel="stylesheet" href="../css/qna/qna.css">
    <link rel="stylesheet" href="../css/qna/review.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/top.jsp" %>
        <section id="contents_top_area">
            <div id="contents_top_area_text">
                <p id="contents_title">수강평</span><span>(${maps.total_count})</span></p>
                <p id="contents_sub_title">수강생분들이 직접 작성하신 수강평입니다.</p>
            </div>
        </section>
        <section id="section">
            <div id="sidebar_left" style="height: 1390px;">
                <ul id="sidebar_ul">
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Qna.do">질문과 답변</a></li>
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Review.do">수강평</a></li>
                    <li style="padding: 10px; font-size: small;"><a href="MentoringReview.do">멘토링 후기</a></li>
                </ul>
            </div>
            <div id="content" style="width:1049px;">
             <c:choose>
				<c:when test="${not empty LectureReviewList }">
					<c:forEach var="list" items="${LectureReviewList }" varStatus="loop">
						<div class="review">
		                   <div id="box1">
		                       <div id="star">
		                       		<c:forEach begin="1" end = "${list.star}" step="1" >
		                       			<i class="fa fa-star" aria-hidden="true"></i>
		                       		</c:forEach>
		                       		<c:forEach begin="${list.star}" end ="4" step="1" >
		                       			<i class="fa fa-star-o" aria-hidden="true"></i>
		                       		</c:forEach>
		                       </div>
		                       <br><br>
		                       <p>${list.content}</p><br><br>
		                       <p id="bottom" style="border-bottom: none;">작성자 : ${list.writer } <p>  
		                       <p> 강의명 : ${list.lecture_title } </p>
		                   </div>
		                   		
			                <div id="box2"><input type="image" id="btn_go" name="btn_go" src="${list.image }" width="300px" height="200px"></div>
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
                    ${maps.paging }
                </div>
            </div>
        </section>
        <%@ include file="../common/footer.jsp" %>
    </div>
<script>
    document.querySelector("#btn_go").addEventListener("click", function(){
        location.href="#";
    });
</script>
</body>
</html>