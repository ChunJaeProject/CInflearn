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
    <link rel="stylesheet" href="../css/qna/review.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #contents_top_area {
            background-color: rgb(201, 194, 194);
            border: 1px solid #ccc;
            width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <div id="contents_top_area" class="cal_h100">
            <br><span style="font-size: large; font-weight: bold;">수강평</span><span>(${maps.total_count})</span>
        </div>
        <section id="section">
            <div id="sidebar_left">
                <ul id="sidebar_ul">
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Qna.do">질문과 답변</a></li>
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Review.do">수강평</a></li>
                    <li style="padding: 10px; font-size: small;"><a href="MentoringReview.do">멘토링 후기</a></li>
                </ul>
            </div>
             <c:choose>
				<c:when test="${not empty LectureReviewList }">
					<c:forEach var="list" items="${LectureReviewList }" varStatus="loop">
						<div class="review">
		                   <div id="box1">
		                       <div id="star">
		                           <i class="fa fa-star" aria-hidden="true"></i>
		                           <i class="fa fa-star" aria-hidden="true"></i>
		                           <i class="fa fa-star" aria-hidden="true"></i>
		                           <i class="fa fa-star" aria-hidden="true"></i>
		                           <i class="fa fa-star-o" aria-hidden="true"></i>
		                       </div>
		                       <br><br>
		                       <p>${list.content}</p><br><br>
		                       <p id="bottom">작성자 : ${list.writer } |  강의명 : </p>
		                   </div>
			                   <div id="box2"><input type="image" id="btn_go" name="btn_go" src="../assets/image/java.png" width="300px" height="200px"></div>
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
                    페이징 영역
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