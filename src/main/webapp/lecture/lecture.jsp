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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
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
                        	<i class="fa fa-star" aria-hidden="true"></i>
                        </c:forEach>
                        <span>(
							<fmt:formatNumber value="${total/fn:length(lectureReviewList)}" pattern  ="0.0" var="avg"/>
							<c:out value="${avg}"/>) / ${fn:length(lectureReviewList) }개의 수강평
						</span>
                    </div>
                    <div id="professor">
                        <i class="fa fa-user" aria-hidden="true"> ${lectureList[0].professor }</i>
                    </div>
                    <div id="technology_tag">
                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                        <ul id="tag_wrap">
                       		<c:forTokens var="item" items="${lectureList[0].technology_tag}" delims=",">
                       			<li>${item}</li>
                       		</c:forTokens>
                        </ul>
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
                                            	
												<c:out value="${avg}"/>
                                            </p>
                                            <p class="star_avg_icon">
                                            	<c:forEach begin="1" end="${total/fn:length(lectureReviewList)}" step="1">
                                            		<i class="fa fa-star" aria-hidden="true"></i>
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
                                    
                                    <c:forEach var="item" items = "${lectureReviewList}">
                                    	<div class="review_content">
                                        <p class="review_member_name">${item.writer}</p>
                                        <div id="review_grade">
                                        	<c:forEach begin="1" end="${item.star}" step="1">
                                           		<i class="fa fa-star" aria-hidden="true"></i>
                                            </c:forEach>
                                        </div>
                                        <div id="review_detail">
                                            <p>${item.comment}</p>
                                        </div>
                                        <p id="review_reg_date">${item.review_reg_date}</p>
                                    </div>
                                    </c:forEach>
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
</body>
</html>