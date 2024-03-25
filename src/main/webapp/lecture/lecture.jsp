
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 강의 | 인프런</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/common/frame.css">
    <link rel="stylesheet" href="../css/lecture/lecture.css">
</head>
<body>
<%
String sessionId =((String) session.getAttribute("userId") != null ? (String) session.getAttribute("userId") : "고객");
%>

<div id="container">
    <%@ include file="../common/header.jsp" %>
    <main id="contents">
        <section id="contents_top_area2" class="cal_h320">
            <div id="lecture_info">
                <div class="content_left_area" style="width: 400px">
                    <img class="lecture_thumbnail" src="${lectureList[0].image }" style="width: 100%" alt="">
                </div>
                <div class="content_right_area">
                    <p id="category">${lectureList[0].category1 } > ${lectureList[0].category2}</p>
                    <p id="lecture_title">${lectureList[0].lecture_title }</p>
                    <div id="lecture_review_info">
                    	<c:set var = "total" value = "0" />
							<c:forEach var="item" items="${lectureReviewList}" varStatus="status">
								<fmt:parseNumber value="${item.star}" var="star"/>
								<c:set var= "total" value="${total + star}"/>
							</c:forEach>
                    	<c:forEach begin="1" end="${total/fn:length(lectureReviewList)}" step="1">
                        	<i class="fas fa-star"></i>
                        </c:forEach>
                        <span>(
							<fmt:formatNumber value="${empty lectureReviewList?0: total/fn:length(lectureReviewList)}" pattern  ="0.0" var="avg"/>
							<c:out value="${avg eq '0.0'?0:avg }"/>) / ${fn:length(lectureReviewList) }개의 수강평
						</span>
                    </div>
                    <div id="professor">
                        <i class="fas fa-user"></i> ${lectureList[0].professor }</i>
                    </div>
                    <div id="technology_tag">
                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                        <ul id="tag_wrap">
                       		<c:forTokens var="item" items="${lectureList[0].technology_tag}" delims=",">
                       			<li>${item}</li>
                       		</c:forTokens>
                        </ul>
                    </div>
                   	<div id="play_btn_wrap">
                
                   		<button type="button" id="play_btn">수강하러가기</button>
         
                   	
                   	</div>
                </div>
            </div>
        </section>
        <div class="contents_wrap">
            <section id="contents_area" class="wd100p">
                <div id="contents_info_wrap">
                    <div id="fixed_side_bar">
                        <ul>
                            <li><span>지식공유자 : </span>${lectureList[0].professor }</li>
                            <li>총 <span> ${fn:length(lectureList)}개</span></li>
                            <li><span>수강기한 : </span>${lectureList[0].lecture_period }</li>
                            <li><span>수료증 : </span>${lectureList[0].certificate_yn}</li>
                            <li><span>난이도 : </span>${lectureList[0].difficulty_grade}</li>
                        </ul>
                    </div>
                    <a href="#lecture_detail" class="selected_info">강의소개</a> |
                    <a href="#lecture_curriculum">커리큘럼</a> |
                    <a href="#lecture_review">수강평</a>
                </div>
                <div id="lecture_contents_area">
                    <article class="lecture_content">
                        <div class="lecture_info">
                            <div id="lecture_detail">
                                <p>${lectureList[0].lecture_detail}</p>
                            </div>
                            <div id="lecture_curriculum">
                                <p class="curriculum_info">커리큘럼 <span>총 ${fn:length(lectureList) }개</span></p>
                                <ul class="curriculum_section_wrap">
                                	<li id="section_title">
<!--                                 		<i class="fa fa-caret-down" aria-hidden="true"></i> -->
                                		 섹션<span id="section_code">${section_code}</span>. ${section_title}<span id="section_time">${section_time}</span></li>
                                	<c:forEach var="item" items="${lectureList }" varStatus="loop" >
                                		<li id="section_title">
<!--                                 		<i class="fa fa-caret-down" aria-hidden="true"></i> -->
                                		 섹션<span id="section_code">${loop.count }</span>. ${item.curriculum_name }<span id="section_time"> ${item.curriculum_time }</span></li>
                                	</c:forEach>
                                    
                                </ul>
                            </div>
                            <div id="lecture_review">
                                <div class="review_info_wrap">
                                    <p class="review_info">수강평 <span>총 ${fn:length(lectureReviewList) }개</span></p>
                                    <div class="star_avg_wrap">
                                        <div class="left_area">
                                            <p class="star_avg">
                                            	
												<c:out value="${avg eq '0.0'?0:avg }"/>
                                            </p>
                                            <p class="star_avg_icon">
                                            	<c:forEach begin="1" end="${total/fn:length(lectureReviewList)}" step="1">
                                            		<i class="fas fa-star"></i>
                                            	</c:forEach>
                                            </p>
                                        </div>
                                        <div class="right_area">
                                            <div class="progress_bar_wrap">
                                            	
                                            	<c:set var="starcount" value="${fn:split(lectureReviewList[0].starCount,', ')}" />
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">5점</span>
                                                    <progress class="best_progress" max="${fn:length(lectureReviewList)}" value="${starcount[4] }"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">4점</span>
                                                    <progress max="${fn:length(lectureReviewList)}" value="${starcount[3] }"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">3점</span>
                                                    <progress max="${fn:length(lectureReviewList)}" value="${starcount[2] }"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">2점</span>
                                                    <progress max="${fn:length(lectureReviewList)}" value="${starcount[1] }"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">1점</span>
                                                    <progress max="${fn:length(lectureReviewList)}" value="${starcount[0] }"></progress>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="review_content_wrap">
                                    
<%-- 					                                    <c:choose> --%>
<%-- 					                   	<c:when test= "${not empty mentoringList}"> --%>
<!-- 						                   	<div id="mentoring_contents_area" class="grid"> -->
<%-- 						                   		<c:forEach var="list" items="${mentoringList}" varStatus="loop"> --%>
<!-- 						                    		<article class="mentoring_content_wrap h250">	 -->
<!-- 						                    			<div class="mentoring_content"> -->
<!-- 						                    				<br><br> -->
<%-- 								                            <p class="mentoring_title" style="font-weight:bold; font-size:large;">${list.mentoring_name }</p><br><br> --%>
<%-- 								                            <p class="mentoring_job_title">현직 : ${list.job}</p><br> --%>
<%-- 								                            <p class="mentoring_career">경력 : ${list.career}</p><br> --%>
<%-- 								                            <p class="mentoring_now_job">직무 : ${list.job_title}</p><br> --%>
<!-- 								                            <p>---------------------</p> -->
<%-- 								                            <p class="mentoring_member_name">${list.member_name}</p> --%>
<%-- 								                            <p hidden>${list.mentoring_intro }</p> --%>
<%-- 								                            <p hidden>${list.member_no}</p> --%>
<!-- 						                        		</div> -->
<!-- 						                        	</article> -->
<%-- 						                   		</c:forEach> --%>
<!-- 						                   	</div> -->
<%-- 					                   	</c:when> --%>
<%-- 					                   	<c:otherwise> --%>
<!-- 					               			<div class="no_result">해당하는 멘토링이 없습니다🥹</div> -->
<%-- 					                   	</c:otherwise> --%>
<%-- 					                   </c:choose> --%>
                                    <c:choose>
	                                    <c:when test= "${not empty lectureReviewList}">
		                                    <c:forEach var="item" items = "${lectureReviewList}">
		                                    	<div class="review_content">
		                                        <p class="review_member_name">${item.writer}</p>
		                                        <div id="review_grade">
		                                        	<c:forEach begin="1" end="${item.star}" step="1">
		                                           		<i class="fas fa-star"></i>
		                                            </c:forEach>
		                                        </div>
		                                        <div id="review_detail">
		                                            <p>${item.comment}</p>
		                                        </div>
		                                        <p id="review_reg_date">${item.review_reg_date}</p>
		                                    </div>
		                                    </c:forEach>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<div class="review_content">
	                                    		<p>등록된 수강평이 없습니다.</p>
	                                    	</div>
	                                    </c:otherwise>
                                    </c:choose>
<%-- 									<c:set var="item1" value="${lectureReviewList}"/> --%>
<!--                                     <div class="more_review_btn_wrap"> -->
<%--                                         <button id="more_review_btn">${item1[0].star }</button> --%>
<!--                                     </div> -->
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
        </div>
    </main>
    <%@ include file="../common/footer.jsp" %>
</div>
<script>
document.querySelector("#play_btn").addEventListener('click',()=>{
	  var sessionUserId = '<%=(session.getAttribute("userId") !=null ? session.getAttribute("userId") : "고객" )%>';
 		console.log(sessionUserId);
 	
	  if(sessionUserId==="고객") {
	     
	      alert("로그인이 필요합니다.");
	      return false;
	  }
	  else{
 	window.open("./videoPlayer.jsp", "PopupWin", "width=560,height=400");
	  }
 });
 


  



</script>
</body>
</html>