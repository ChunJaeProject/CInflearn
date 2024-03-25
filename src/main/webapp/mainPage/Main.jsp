<%@page import="dto.LectureDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인프런 | 라이프타임 커리어 플랫폼</title>
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/common/frame.css">
    <link rel="stylesheet" href="../css/mainPage/main.css">
    <style>
    
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/top.jsp" %>
<div id="container">	
    <main id="contents">
        <section id="img_slide">
    		<div class="slide_wrapper">
	            <ul class="slides">
	                <li style="display:block;"><img src="../assets/image/main_banner01.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner02.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner03.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner04.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner05.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner06.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner07.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner08.png" alt=""></li>
	                <li style="display:none;"><img src="../assets/image/main_banner09.png" alt=""></li>
	            </ul>
		        <div class="controls">
	                <a href="#" id="prev_slide_btn">◀</a>
	                <a><span id="cur_num">1</span> / 9</a>
	                <a href="#" id="next_slide_btn">▶</a>
	            </div>
        	</div>
        </section>
        <div class="contents_wrap">
            <section id="sidebar_area">
                <aside id="sidebar">
                    <ul id="category_depth1">
                        <li id="total_lecture"><i class="fa fa-bars" aria-hidden="true"></i> 전체 강의</li>
                        <li>
                            <i class="fa fa-code" aria-hidden="true"></i>
                            개발 · 프로그래밍
                            <ul class="category_depth2" >
                                <li>웹 개발</li>
                                <li>프론트엔드</li>
                                <li>백엔드</li>
                                <li>풀스택</li>
                                <li>모바일 앱 개발</li>
                                <li>프로그래밍 언어</li>
                                <li>알고리즘 · 자료구조</li>
                                <li>데이터베이스</li>
                                <li>데브옵스 · 인프라</li>
                                <li>소프트웨어 테스트</li>
                                <li>개발 도구</li>
                                <li>웹 퍼블리싱</li>
                                <li>VR/AR</li>
                                <li>자격증 (개발 · 프로그래밍)</li>
                                <li>기타 (개발 · 프로그래밍)</li>
                                <li>게임 프로그래밍</li>
                                <li>게임 기획</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-gamepad" aria-hidden="true"></i>
                            게임 개발
                            <ul class="category_depth2">
                                <li>게임 아트 · 그래픽</li>
                                <li>게임 기획</li>
                                <li>기타 (게임 개발)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-database" aria-hidden="true"></i>
                            데이터 사이언스
                            <ul class="category_depth2">
                                <li>데이터 분석</li>
                                <li>데이터 엔지니어링</li>
                                <li>자격증 (데이터 사이언스)</li>
                                <li>기타 (데이터 사이언스)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-assistive-listening-systems" aria-hidden="true"></i>
                            인공지능
                            <ul class="category_depth2">
                                <li>딥러닝 · 머신러닝</li>
                                <li>컴퓨터 비전</li>
                                <li>자연어 처리</li>
                                <li>AI · ChatGPT 활용</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fas fa-shield-alt" aria-hidden="true"></i>
                            보안 · 네트워크
                            <ul class="category_depth2">
                                <li>보안</li>
                                <li>네트워크</li>
                                <li>시스템</li>
                                <li>클라우드</li>
                                <li>블록체인</li>
                                <li>자격증 (보안 · 네트워크)</li>
                                <li>기타 (보안 · 네트워크)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-bullseye" aria-hidden="true"></i>
                            비즈니스 · 마케팅
                            <ul class="category_depth2">
                                <li>오피스</li>
                                <li>마케팅</li>
                                <li>기획 · 전략 · PM</li>
                                <li>업무 자동화</li>
                                <li>경영</li>
                                <li>자격증 (비즈니스 · 마케팅)</li>
                                <li>기타 (비즈니스 · 마케팅)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-desktop" aria-hidden="true"></i>
                            하드웨어
                            <ul class="category_depth2">
                                <li>컴퓨터 구조</li>
                                <li>임베디드 · IoT</li>
                                <li>반도체</li>
                                <li>로봇공학</li>
                                <li>모빌리티</li>
                                <li>자격증 (하드웨어)</li>
                                <li>기타 (하드웨어)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-paint-brush" aria-hidden="true"></i>
                            디자인
                            <ul class="category_depth2">
                                <li>CAD · 3D 모델링</li>
                                <li>UX/UI</li>
                                <li>그래픽 디자인</li>
                                <li>사진 · 영상</li>
                                <li>자격증 (디자인)</li>
                                <li>사운드</li>
                                <li>기타 (디자인)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-globe" aria-hidden="true"></i>
                            학문 · 외국어
                            <ul class="category_depth2">
                                <li>수학</li>
                                <li>외국어</li>
                                <li>기타 (학문 · 외국어)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-compass" aria-hidden="true"></i>
                            커리어
                            <ul class="category_depth2">
                                <li>취업 · 이직</li>
                                <li>개인 브랜딩</li>
                                <li>창업</li>
                                <li>기타 (커리어)</li>
                            </ul>
                        </li>
                        <li>
                            <i class="fa fa-book" aria-hidden="true"></i>
                            자기계발
                            <ul class="category_depth2">
                                <li>금융 · 재테크</li>
                                <li>교양</li>
                            </ul>
                        </li>
                    </ul>

                </aside>
            </section>
            <section id="contents_area">
                <div id="contents_info_wrap">
                    <p>총 게시글 ${ params.total_count }</p>
                    <form action="" id="lecture_frm" name="lecture_frm" method="get">
                        <div id="technology_search_wrap">
                            <input id="technology_search_word" name="technology_search_word" type="text" placeholder="기술검색" value="<%=request.getParameter("technology_search_word") ==null? "":request.getParameter("technology_search_word")%>">
                            <input id="technology_search_btn" name="technology_search_btn" type="submit" value="검색">
                        </div>
                        <div id="lecture_search_wrap">
                            <input id="lecture_search_word" name="lecture_search_word" type="text" placeholder="강의명/강사명검색" value="<%=request.getParameter("lecture_search_word") ==null? "":request.getParameter("lecture_search_word")%>">
                            <input id="lecture_btn" name="lecture_btn" type="submit" value="검색">
                        </div>
                    </form>             
                </div>
                <c:choose>
					<c:when test="${not empty lectureList}">
					    <div id="lecture_contents_area" class="grid">
							<c:forEach var="lectureList" items="${ lectureList }" varStatus="loop">
			                    <article class="lecture_content_wrap">
			                        <a href="/ChunjaeProject/lecture/lecture.do?no=${lectureList.lecture_no }" class="lecture_content_hover">
			                        	<p class="lecture_title">${ lectureList.lecture_title }</p>
			                            <p class="category">${ lectureList.category2 }</p>
			                            <p class="difficulty_grade">${ lectureList.difficulty_grade }</p>
			                            <p class="technology_tag">${ lectureList.technology_tag }</p>
			                        </a>
			                        <a href="#" class="lecture_img"><img src="${ lectureList.image }" alt=""></a>
			                        <div class="lecture_content">
			                            <p class="lecture_title">${ lectureList.lecture_title }</p>
			                            <p class="lecture_professor">${ lectureList.professor }</p>
			                            <p class="lecture_grade">
			                            	<c:forEach begin="1" end = "${lectureList.star}" step="1" >
				                       			<i class="fas fa-star"></i>
				                       		</c:forEach>
				                       		<c:forEach begin="${lectureList.star}" end ="4" step="1" >
				                       			<i class="far fa-star"></i>
				                       		</c:forEach>

			                            </p>
			                        </div>
			                        
			                    </article>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="no_result">해당하는 강좌가 없습니다🥹</div>
					</c:otherwise>
				</c:choose>				
                    
                <div class="paging_area">
                    ${params.paging}
                </div>
            </section>
        </div>
    </main>
    <%@ include file="../common/footer.jsp" %>
</div>
<!-- <script src="../js/main.js"></script> -->
<script>
const categoryDepth1DOM = document.querySelector("#category_depth1");
const totalLectureDOM = document.querySelector("#total_lecture");
const technology_search_word= document.getElementById("technology_search_word");
const lecture_search_word = document.getElementById("lecture_search_word");
categoryDepth1DOM.addEventListener("click", function(e) {
	if (totalLectureDOM == e.target) {
		location.href = "/ChunjaeProject/mainPage/Main.do";
	} else if (e.target.tagName == "LI") {
        if (e.target.children[0].tagName == "I") {
              if (!e.target.children[1].style.display || e.target.children[1].style.display == "none" ) {
                e.target.children[1].style.display = "block";
             } else e.target.children[1].style.display = "none";
          }
      }
}, false)
    
const category_list = document.querySelectorAll(".category_depth2 li");
for(i=0;i<category_list.length;i++){
	category_list[i].addEventListener("click",function(e){
		
		const category2 = this.textContent;
		location.href = "/ChunjaeProject/mainPage/Main.do?category2=" + category2 + "&"
	}, false);
// 	category_list[i].addEventListener("mouseover",function(e){
// 		this.color = "#1DC078";
// 	});
}
const lecture_list = document.querySelectorAll(".lecture_content_wrap");
const lecture_idx = document.querySelectorAll(".lecture_idx");


const slidesDOM = document.querySelector(".slides");
const nextSlideBtn = document.querySelector("#next_slide_btn");
const prevSlideBtn = document.querySelector("#prev_slide_btn");
nextSlideBtn.addEventListener("click", function(e) {
	let count = 0;
 	for (let i = 0; i < slidesDOM.children.length; i++) {
 		if (slidesDOM.children[i].style.display == "block") {
 			count = i;
			if (i == slidesDOM.children.length -1) {
				slidesDOM.children[i].style.display = "none";
				slidesDOM.children[0].style.display = "block";
				document.querySelector("#cur_num").textContent = 1;
				break;
			} else {
	 			slidesDOM.children[i].style.display = "none";
 				slidesDOM.children[i + 1].style.display = "block";
 				document.querySelector("#cur_num").textContent = parseInt(document.querySelector("#cur_num").textContent)+ 1;
 				break;
			}
 		}
 	}
}, false)


prevSlideBtn.addEventListener("click", function(e) {
	let count = 0;
 	for (let i = 0; i < slidesDOM.children.length; i++) {
 		if (slidesDOM.children[i].style.display == "block") {
 			count = i;
			if (i == 0) {
				slidesDOM.children[0].style.display = "none";
				slidesDOM.children[slidesDOM.children.length -1].style.display = "block";
				document.querySelector("#cur_num").textContent = 9;
				break;
			} else {
	 			slidesDOM.children[i].style.display = "none";
 				slidesDOM.children[i - 1].style.display = "block";
				document.querySelector("#cur_num").textContent -= 1;
 				break;
			}
 		}
 	}
}, false)
</script>
</body>
</html>