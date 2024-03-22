<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
                    <p id="category">개발 · 프로그래밍 > 웹 개발</p>
                    <p id="lecture_title">${lectureList[0].lecture_title }</p>
                    <div id="lecture_review_info">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star-o" aria-hidden="true"></i>
                        <span>(4.2) / 00개의 수강평</span>
                    </div>
                    <div id="professor">
                        <i class="fa fa-user" aria-hidden="true"> ${lectureList[0].professor }</i>
                    </div>
                    <div id="technology_tag">
                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                        <ul id="tag_wrap">
                            <li>HTML/CSS</li>
                            <li>태그2</li>
                            <li>태그3</li>
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
                            <li><span>지식공유자 : </span>지식공유자1</li>
                            <li>총 <span>000개</span>의 수업 (000시간)</li>
                            <li><span>수강기한 : </span>무제한</li>
                            <li><span>수료증 : </span>발급</li>
                            <li><span>난이도 : </span>입문</li>
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
                                <p>강의 소개 내용</p>
                            </div>
                            <div id="lecture_curriculum">
                                <p class="curriculum_info">커리큘럼 <span>총 000개 00시간 00분의 수업</span></p>
                                <ul class="curriculum_section_wrap">
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">${section_code}</span>. ${section_title}<span id="section_time">${section_time}</span></li>
                                    
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">1</span>. &lt;갖다 놓는&gt; HTML<span id="section_time">00:00</span></li>
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">2</span>. &lt;꾸미는&gt; CSS<span id="section_time">00:00</span></li>
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">3</span>. HTML 더 깊이 알아보기<span id="section_time">00:00</span></li>
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">4</span>. CSS 더 깊이 알아보기<span id="section_time">00:00</span></li>
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">5</span>. 파이널 프로젝트<span id="section_time">00:00</span></li>
                                    <li id="section_title"><i class="fa fa-caret-down" aria-hidden="true"></i> 섹션<span id="section_code">6</span>. 강의를 마무리하며<span id="section_time">00:00</span></li>
                                </ul>
                            </div>
                            <div id="lecture_review">
                                <div class="review_info_wrap">
                                    <p class="review_info">수강평 <span>총 000개</span></p>
                                    <div class="star_avg_wrap">
                                        <div class="left_area">
                                            <p class="star_avg">4.5</p>
                                            <p class="star_avg_icon">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                            </p>
                                        </div>
                                        <div class="right_area">
                                            <div class="progress_bar_wrap">
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">5점</span>
                                                    <progress class="best_progress" max="53" value="36"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">4점</span>
                                                    <progress max="53" value="11"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">3점</span>
                                                    <progress max="53" value="2"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">2점</span>
                                                    <progress max="53" value="2"></progress>
                                                </div>
                                                <div class="progress_bar">
                                                    <span class="progress_bar_name">1점</span>
                                                    <progress max="53" value="2"></progress>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="review_content_wrap">
                                    <div class="review_content">
                                        <p class="review_member_name">작성자명</p>
                                        <div id="review_grade">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </div>
                                        <div id="review_detail">
                                            <p>수강평 내용</p>
                                        </div>
                                        <p id="review_reg_date">작성일</p>
                                    </div>
                                    <div class="review_content">
                                        <p class="review_member_name">작성자명</p>
                                        <div id="review_grade">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </div>
                                        <div id="review_detail">
                                            <p>수강평 내용</p>
                                        </div>
                                        <p id="review_reg_date">작성일</p>
                                    </div>
                                    <div class="review_content">
                                        <p class="review_member_name">작성자명</p>
                                        <div id="review_grade">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </div>
                                        <div id="review_detail">
                                            <p>수강평 내용</p>
                                        </div>
                                        <p id="review_reg_date">작성일</p>
                                    </div>
                                    <div class="more_review_btn_wrap">
                                        <button id="more_review_btn">수강평 더보기</button>
                                    </div>
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