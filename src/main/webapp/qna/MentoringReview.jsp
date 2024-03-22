<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="dto.MentoringReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.MentoringReviewDAO"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멘토링 후기</title>
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
<%@ include file="../common/top.jsp" %>
<%@ include file="../common/header.jsp" %>
    <div id="container">
        <main id="contents">
	        <div id="contents_top_area" class="cal_h100">
	            <br><span style="font-size: large; font-weight: bold;padding-top: 10px;">멘토링 후기</span><span>(${maps.total_count})</span>
	        </div>
        	<section id="section">
            	<div id="sidebar_left">
	                <ul id="sidebar_ul">
	                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Qna.do">질문과 답변</a></li>
	                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Review.do">수강평</a></li>
	                    <li style="padding: 10px; font-size: small;"><a href="MentoringReview.do">멘토링 후기</a></li>
	                </ul>
	            </div>
	            <div id="content">
	                <c:choose>
						<c:when test="${not empty MentoringReviewList }">
							<c:forEach var="list" items="${MentoringReviewList }" varStatus="loop">
								<div class="review">
				                   <div id="box1">
				                       <div id="star">
				                           <c:forEach begin="1" end = "${list.grade}" step="1" >
		                       					<i class="fa fa-star" aria-hidden="true"></i>
		                       				</c:forEach>
		                       				<c:forEach begin="${list.grade}" end ="4" step="1" >
	                       						<i class="fa fa-star-o" aria-hidden="true"></i>
		                       				</c:forEach>
				                       </div>
				                       <br><br>
				                       <p>${list.content}</p><br><br>
				                       <p id="bottom">작성자 : ${list.writer }</p>
				                   </div>	                   
					              </div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="question" style="text-align: center; padding: 40px; ">
			                 	<p style="border-bottom: 1px solid #ccc;">아직 관련 글이 없습니다. 첫 글을 남겨주세요!</p>
				            </div>
						</c:otherwise>
					</c:choose>
		            <div class="paging_area">
		                ${maps.paging }
		            </div>
            	</div>
        	</section>
        </main>
        <%@ include file="../common/footer.jsp" %>
    </div>
    
</body>
</html>