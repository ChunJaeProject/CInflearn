<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>선배와 동료들에게 조언을 구해보세요. - 멘토링 | 인프런</title>
    <link rel="stylesheet" href="../css/common/common.css">
    <link rel="stylesheet" href="../css/mentor/mentoring.css">
</head>
<body>
<div id="container">
    <%@ include file="../common/header.jsp" %>
    <!-- jsp에서 include해서 사용 -->
    <main id="contents">
        <section id="contents_top_area" class="cal_h100">
            <div  id="contents_top_area_text">
            멘토링
            </div>
            <div id="contents_top_Btn_Box">
                <button id="mentoringCreate_Btn">멘토링 개설</button>
                <button id="mentoringReview_Btn">멘토링 후기보기</button>
            </div>
        </section>
        <div class="contents_wrap">
            <section id="sidebar_area">
                <aside id="sidebar">
                    <form action="" id="searchForm" name="searchForm">
                        <input type="text" id="searchBar" name="searchBar"><button id="searchBtn">검색</button>
                        <select id="sortList">
                            <option >최근 등록순</option>
                            <option >인기순</option>
                        </select>
                        <div id="categoryHeader">
                            <span>분야별</span>
                        </div>
                        <div id="categoryBox">
                            <input type="checkbox"> 개발 · 프로그래밍<br>
                            <input type="checkbox"> 게임 개발<br>
                            <input type="checkbox"> 데이터 사이언스<br>
                            <input type="checkbox"> 인공지능<br>
                            <input type="checkbox"> 보안 / 네트워크<br>
                            <input type="checkbox"> 비즈니스 / 마케팅<br>
                            <input type="checkbox"> 하드웨어<br>
                            <input type="checkbox"> 학문 / 외국어<br>
                            <input type="checkbox"> 커리어<br>
                            <input type="checkbox"> 자기계발<br>
                        </div>
                        <input id="resetBtn" type="reset" value="필터 초기화">
                    </form>


                </aside>
            </section>
            <section id="contents_area" class="wd1000">
                <div id="contents_info_wrap">
                    게시글 수, 검색 필터 영역
                </div>
                <div id="mentoring_contents_area" class="grid">
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                    <article class="mentoring_content_wrap h250">   
                        <div class="mentoring_content">
                            <p class="mentoring_title">멘토링명</p>
                            <p class="mentoring_job_title">직무</p>
                            <p class="mentoring_career">겅력</p>
                            <p class="mentoring_now_job">현직</p>
                            <p class="mentoring_member_name">멘토실명</p>
                            <p hidden>멘토링 소개</p>
                        </div>
                    </article>
                </div>
                <div class="paging_area">
                    페이징 영역
                </div>
            </section>
        </div>
        <div id="popupContainer">
            <div id="popup">
                <span id="closePopup" class="close-btn">×</span>

                <div id="popup_create" class="popup_contents">
                    <div class="popupTitle">멘토링 개설 신청서</div>
                    <form action="" id="mentoring_sign_form" name="metoring_sign_form">
                        <ul>
                            <li><p>경력(택 1) <span class="star">*</span></p></li><br>
                                <input type="radio" name="carear" id="carear_0" value="carear_0"><label for="carear_0"> 신입(1~3년)</label>
                                <input type="radio" name="carear" id="carear_1" value="carear_1"><label for="carear_1"> 미들(4~9년)</label>
                                <input type="radio" name="carear" id="carear_2" value="carear_2"><label for="carear_2"> 시니어(10년 이상)</label>
                            <br><br>
                            <li><p>현직(택 1) <span class="star">*</span></p></li><br>
                                <input type="radio" name="job" id="job_0" value="job_0"><label for="job_0"> 현직(대기업)</label>
                                <input type="radio" name="job" id="job_1" value="job_1"><label for="job_1"> 현직(중견)</label>
                                <input type="radio" name="job" id="job_2" value="job_2"><label for="job_2"> 현직(스타트업)</label>
                            <br><br>    
                            <li><p>연락 받을 이메일 <span class="star">*</span></p></li><br>
                                <input class="h30 w400" type="email" name="email" id="email" placeholder="자주 사용하는 이메일을 입력하세요">
                            <br><br>
                            <li><p>멘토 실명 <span class="star">*</span></p></li><br>
                                <input class="h30 w400" type="text" name="name" id="name" placeholder="실명을 입력해주세요">
                            <br><br>
                            <li><p>연락처 <span class="star">*</span></p></li><br>
                                <input class="h30 w400" type="text" name="phone" id="phone"  placeholder=" - 없이 입력해주세요">
                            <br><br>
                            <li><p>직무 <span class="star">*</span></p></li><br>
                                <select>
                                    <option value="">직무선택</option>
                                    <option value="">개발 프로그래밍</option>
                                    <option value="">게임 개발</option>
                                    <option value="">데이터 사이언스</option>
                                    <option value="">인공지능</option>
                                    <option value="">보안 / 네트워크</option>
                                    <option value="">비즈니스 / 마케팅</option>
                                    <option value="">하드웨어</option>
                                    <option value="">학문 / 외국어</option>
                                    <option value="">커리어</option>
                                    <option value="">자기계발</option>
                                </select>
                            <br><br>
                            <li><p>멘토링 기간 <span class="star">*</span></p></li><br>
                                <input type="date"> ~ <input type="date">
                            <br><br>
                            <li><p>멘토링 명 <span class="star">*</span></p></li><br>
                                <input class="h30 w400" type="text" name="mentoringName" id="mentoringName" maxlength="100" placeholder="100자 이내로 입력해주세요">
                            <br><br>
                            <li><p>멘토링 소개 <span class="star">*</span></p></li><br>
                                <textarea name="mentoringInfo" id="mentoringInfo" class="w400" cols="30" rows="5" style="resize: none;" placeholder="300자 이내 입력" maxlength="300"></textarea>
                        </ul>
                        <input type="submit" value="제출하기">
                    </form>
                </div>
                <div id="popup_infor" class="popup_contents">
                    <div class="popupTitle">멘토링 소개</div>
                    <div id="curr_mentoringInfo">
                        <p id="popupMentorName"></p>
                        <p id="popupMentoringName"></p>
                        <p id="popupMentorJob"></p>
                        <p id="popupMentorCarear"></p>
                        <p id="popupMentoringInfor"></p>
                    </div>
                    <div id="popup_infor_sign">
                        <button id="popup_infor_sign_Btn">신청하기</button>
                    </div>
                </div>
                <div id="popup_sign" class="popup_contents">
                    <div class="popupTitle">멘토링 신청</div>
                </div>
            </div>
            

        </div>
        
    </main>
    <%@ include file="../common/footer.jsp" %>
</div>

<script>
    let popupContainer = document.getElementById("popupContainer");
    let contents = document.getElementsByClassName("mentoring_content");
    let popups = document.getElementsByClassName("popup_contents");
    for(i=0;i<contents.length;i++){
        contents[i].addEventListener("click",function(e){
            popupContainer.style.display="block";
            for(j=0;j<popups.length;j++)
                popups[j].style.display="none";
            popups[1].style.display="block";
            let mentoringContents = this.children;
            let curr_mentoringInfo = document.querySelectorAll('#curr_mentoringInfo p');
            curr_mentoringInfo[0].textContent = mentoringContents[4].textContent;
            curr_mentoringInfo[1].textContent = mentoringContents[0].textContent;
            curr_mentoringInfo[2].textContent = mentoringContents[1].textContent;
            curr_mentoringInfo[3].textContent = mentoringContents[2].textContent;
            curr_mentoringInfo[4].textContent = mentoringContents[5].textContent;
        });
    }
    document.getElementById("closePopup").addEventListener("click",function(e){
        popupContainer.style.display="none";
    });
    document.getElementById("mentoringCreate_Btn").addEventListener("click",function(e){
        for(j=0;j<popups.length;j++)
                popups[j].style.display="none";
        popupContainer.style.display="block";
        popups[0].style.display="block";
    });
    document.getElementById("popup_infor_sign_Btn").addEventListener("click",function(e){
        for(j=0;j<popups.length;j++)
                popups[j].style.display="none";
        popups[2].style.display="block";
    });
</script>
</body>
</html>