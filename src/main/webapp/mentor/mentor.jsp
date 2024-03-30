<%@page import="dto.MentoringDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.MentoringDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        #sumbit1 input[type=submit] {
            width: 150px;
            height: 40px;
            background-color: #1dc078;
            border: none;
            color: #fff;
            border-radius: 8px;
        }
        #sumbit1 input:active {
            color: #ccc;
        }
        #btn input[type=reset], #btn input[type=button] {
            width: 80px;
            height: 35px;
            background-color: darkgrey;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #btn input[type=submit] {
            width: 100px;
            height: 35px;
            background-color: #1dc078;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #btn searchBtn {
            width: 100px;
            height: 35px;
            background-color: #1dc078;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #btn input:active {
            color: #ccc;
        }
        #popup_infor_sign button {
            width: 100px;
            height: 35px;
            background-color: #1dc078;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #popup_infor_sign button:active {
            color: #ccc;
        }
        #sign_frm select {
            width: 150px;
            height: 30px;
        }
        #sign_frm input[type=text],input[type=email],input[type=tel]  {
            width: 300px;
            height: 30px;
            border-radius: 8px;
            border: 1px solid #CCC;
        }
        #sign_frm textarea {
            border-radius: 8px;
            border: 1px solid #CCC;
        }
        #mentoringCreate_Btn {
            background-color: #1dc078;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #mentoringReview_Btn {
            background-color: darkgrey;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #contents_top_Btn_Box button:active {
            color: #ccc;
        }
        #categoryHeader {
            background-color: darkgrey;
            color: #fff;
        }
        #searchForm input[type=text] {
            width: 112px;
            height: 41px;
            border-radius: 8px;
            border: 1px solid #CCC;
        }
        #searchForm input[type=submit] {
            background-color: darkgrey;
            color: #fff;
            border: none;
            border-radius: 8px;
        }
        #searchForm input:active {
            color: #ccc;
        }
        #searchForm input[type=reset] {
            font-weight: bold;
            font-size: medium;
        }
        #contents_top_Btn_Box {
            margin-right : 10px;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>선배와 동료들에게 조언을 구해보세요. - 멘토링 | 인프런</title>
    <link rel="stylesheet" href="../css/common/frame.css">
    <link rel="stylesheet" href="../css/common/base.css">
    <link rel="stylesheet" href="../css/mentor/mentoring.css">
</head>
<body>
<%
String search_value = request.getParameter("search_word");
search_value = search_value != null ? search_value: "";
// 	String[] category_value = null;
// 	category_value = request.getParameterValues("cate");

// 	String[] category_check = new String[10];

// 	for(int i=0;i<category_value.length;i++){
// 		category_check[Integer.parseInt(category_value[i])] = "checked";
// 	}

String sessionId =((String) session.getAttribute("userId") != null ? (String) session.getAttribute("userId") : "고객");
%>
<div id="container">
    <%@ include file="../common/header.jsp" %>
    <%@ include file="../common/top.jsp" %>
    <!-- jsp에서 include해서 사용 -->
    <main id="contents">
        <section id="contents_top_area">
            <div id="contents_top_area_text">
                <p id="contents_title">멘토링</p>
                <p id="contents_sub_title">업계 선배, 동료들과 만나 서로의 인사이트를 나누어 보아요! 더 빨리, 더 멀리 갈 수 있어요!</p>
                <div id="contents_top_Btn_Box">
                    <button id="mentoringCreate_Btn">멘토링 개설</button>
                    <button id="mentoringReview_Btn">멘토링 후기보기</button>
                </div>
            </div>
        </section>
        <div class="contents_wrap" style="justify-content: flex-start;">
            <section id="sidebar_area">
                <aside id="sidebar">
                    <form action="/ChunjaeProject/mentor/mentor.do" id="searchForm" name="searchForm">
                        <input type="text" name="search_word" id="search_word" value="<%=search_value%>">
                        <input type="submit" id="searchBtn" value="검색">
                        <select id="sortList">
                            <option >최근 등록순</option>
                            <option >인기순</option>
                        </select>
                        <div id="categoryHeader">
                            <span>분야별</span>
                        </div>
                        <div id="categoryBox">
                            <input type="checkbox" name ="cate" value="1" ${checked[1] }> 개발 · 프로그래밍<br>
                            <input type="checkbox" name ="cate" value="2" ${checked[2] }> 게임 개발<br>
                            <input type="checkbox" name ="cate" value="3" ${checked[3] }> 데이터 사이언스<br>
                            <input type="checkbox" name ="cate" value="4" ${checked[4] }> 인공지능<br>
                            <input type="checkbox" name ="cate" value="5" ${checked[5] }> 보안 / 네트워크<br>
                            <input type="checkbox" name ="cate" value="6" ${checked[6] }> 비즈니스 / 마케팅<br>
                            <input type="checkbox" name ="cate" value="7" ${checked[7] }> 하드웨어<br>
                            <input type="checkbox" name ="cate" value="8" ${checked[8] }> 학문 / 외국어<br>
                            <input type="checkbox" name ="cate" value="9" ${checked[9] }> 커리어<br>
                            <input type="checkbox" name ="cate" value="10" ${checked[10] }> 자기계발<br>
                        </div>
                        <img src="../assets/image/reset.png" width="17px">
                        <input id="resetBtn" type="reset" value="필터 초기화">
                    </form>
                </aside>
            </section>
            <section id="contents_area" style="width: 100%">
                <div id="contents_info_wrap">
                    <br>
                    <p style="text-align: left;">&nbsp;&nbsp;총 게시글 ${params.total_count }<p>
                </div>
                    <c:choose>
                        <c:when test= "${not empty mentoringList}">
                        <div id="mentoring_contents_area" class="grid" style="grid-gap: 20px; margin: 30px 0 80px 0; min-width: 1000px;">
                            <c:forEach var="list" items="${mentoringList}" varStatus="loop">
                                <article class="mentoring_content_wrap h250">
                                    <div class="mentoring_content">
                                        <br><br>
                                        <p class="mentoring_title" style="font-weight:bold; font-size:large;">${list.mentoring_name }</p><br><br>
                                        <p class="mentoring_job_title">현직 : ${list.job }</p><br>
                                        <p class="mentoring_career">경력 : ${list.career }</p><br>
                                        <p class="mentoring_now_job">직무 : ${list.job_title }</p><br>
                                        <p>---------------------</p>
                                        <p class="mentoring_member_name">${list.member_name }</p>
                                        <p hidden>${list.mentoring_intro }</p>
                                        <p hidden>${list.member_no}</p>	
                                    </div>
                                </article>
                            </c:forEach>
                 		</div>
                        </c:when>
                        <c:otherwise>
                            <div class="no_result">해당하는 맨토링이 없습니다🥹</div>
                        </c:otherwise>
                    </c:choose>
                <div class="paging_area">
                    ${params.paging}
                </div>
            </section>
        </div>

        <div id="popupContainer">
            <div id="popup">
                <span id="closePopup" class="close_btn">×</span>

                <div id="popup_create" class="popup_contents">
                    <div class="popupTitle"><h2 style="border-bottom : 2px solid #1dc078; font-size:large; padding:5px;">멘토링 개설 신청서</h2></div>
                    <form action="/ChunjaeProject/mentor/mentoringRegist.do" id="mentoring_sign_form" name="metoring_sign_form" method="post">
                        <ul>
                            <p id="member_no" name="member_no" value="${session.member_no }" hidden></p>
                            <li><p>경력(택 1) <span class="star">*</span></p></li><br>
                            <input type="radio" name="career" id="career_0" value="신입(1~3년)"><label for="career_0"> 신입(1~3년)</label>
                            <input type="radio" name="career" id="career_1" value="미들(4~9년)"><label for="career_1"> 미들(4~9년)</label>
                            <input type="radio" name="career" id="career_2" value="시니어(10년 이상)"><label for="career_2"> 시니어(10년 이상)</label>
                            <br><br>
                            <li><p>현직(택 1) <span class="star">*</span></p></li><br>
                            <input type="radio" name="job" id="job_0" value="현직(대기업)"><label for="job_0"> 현직(대기업)</label>
                            <input type="radio" name="job" id="job_1" value="현직(중견)"><label for="job_1"> 현직(중견)</label>
                            <input type="radio" name="job" id="job_2" value="현직(스타트업)"><label for="job_2"> 현직(스타트업)</label>
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
                            <select  name="cate">
                                <option value="0">직무선택</option>
                                <option value="1">${params.checked[1]} 개발 프로그래밍</option>
                                <option value="2"${params.checked[2] }>게임 개발</option>
                                <option value="3"${params.checked[3] }>데이터 사이언스</option>
                                <option value="4"${params.checked[4] }>인공지능</option>
                                <option value="5"${params.checked[5] }>보안 / 네트워크</option>
                                <option value="6"${params.checked[6] }>비즈니스 / 마케팅</option>
                                <option value="7"${params.checked[7] }>하드웨어</option>
                                <option value="8"${params.checked[8] }>학문 / 외국어</option>
                                <option value="9"${params.checked[9] }>커리어</option>
                                <option value="10"${params.checked[10] }>자기계발</option>
                            </select>
                            <br><br>
                            <li><p>멘토링 기간 <span class="star">*</span></p></li><br>
                            <input name = "startDate" id = "startDate" type="date"> ~ <input name="endDate" id= "endDate" type="date">
                            <br><br>
                            <li><p>멘토링 명 <span class="star">*</span></p></li><br>
                            <input class="h30 w400" type="text" name="mentoringName" id="mentoringName" maxlength="100" placeholder="100자 이내로 입력해주세요">
                            <br><br>
                            <li><p>멘토링 소개 <span class="star">*</span></p></li><br>
                            <textarea name="mentoringInfo" id="mentoringInfo" class="w400" cols="30" rows="5" style="resize: none;" placeholder="300자 이내 입력" maxlength="300"></textarea>
                        </ul>
                        <div id="sumbit1"><input type="submit" value="제출하기"></div>
                    </form>
                </div>
                <div id="popup_infor" class="popup_contents">
                    <div class="popupTitle"><h2 style="border-bottom : 2px solid #1dc078; font-size:large; padding : 15px;">멘토링 소개</h2></div>
                    <div id="curr_mentoringInfo">
                        <p id="popupMentorName"></p>
                        <p id="popupMentoringName"></p>
                        <p id="popupMentorJob"></p>
                        <p id="popupMentorcareer"></p>
                        <hr>
                        <p id="popupMentoringInfor"></p>
                    </div>
                    <div id="popup_infor_sign">
                        <button id="popup_infor_sign_Btn">신청하기</button>
                    </div>
                </div>
                <div id="popup_sign" class="popup_contents" style="height: 600px; line-height: 30px;">
                    <div class="popupTitle"><h2 style="display : block; border-bottom : 2px solid #1dc078; font-size:large; padding : 10px;">멘토링 신청(1/2)</h2></div>
                    <form id="sign_frm" name="sign_frm" action="/ChunjaeProject/mentor/mentoringSign.do" method="post">
                        <h3>-날짜 선택 <span style="color:red">*</span></h3>
<!--                         <select id ="date"> -->
<!--                             <option value="choice" selected>날짜 선택</option> -->
<!--                             <option value="date_0">3월 5일</option> -->
<!--                         </select><br> -->
							<input name="endDate" id= "endDate" type="date" value = >
<!-- 						<input name="regDate" id= "endDate" type="date"> -->
                        <h3>-실명 <span style="color:red">*</span></h3>
                        <input type="text" id="ap_name" name="ap_name" placeholder="실명을 입력해주세요." maxlength="10"><br>
                        <h3>-연락 가능한 이메일 <span style="color:red">*</span></h3>
                        <input type="email" id="ap_email" name="ap_email" placeholder="자주 사용하는 이메일을 입력해주세요." maxlength="200"><br>
                        <h3>-연락 가능한 연락처 <span style="color:red">*</span></h3>
                        <input type="tel" id="ap_tel" name="ap_tel" placeholder="하이픈 없이 휴대폰 번호 입력" maxlength="11"><br>
                        <h3>-남길 메시지 <span style="color:red">*</span></h3>
                        <textarea id="ap_msg" name="ap_msg" placeholder="300자 이내로 입력해주세요." maxlength="300" cols="40" rows="10"></textarea>
                        <br><br>
                        <div id="btn">
                            <input type="reset" id="btn_reset" name="btn_reset" value="취소">
                            <input type="button" id="btn_next" name="btn_next" value="신청완료">
                        </div>
                    </form>
                    
                </div>
                <div id="popup_sign2" class="popup_contents" style="height: 600px; line-height: 30px;">
                    <div class="popupTitle"><h2 style="display : block; border-bottom : 2px solid #1dc078; font-size:large; padding : 10px;">신청 확인(2/2)</h2></div>
                    <form id="sign_frm2" name="sign_frm2" action="/ChunjaeProject/mentor/mentoringSignUp.do" method="post">
                         <div id="confirm_view">
	                       	<p style="font-weight:bold;">멘토링 명</p>
	                       	<p>멘토링명 표시</p>
	                       	<p style="font-weight:bold;">멘토 명</p>
	                       	<p>멘토 실명 표시</p>
	                       	<p style="font-weight:bold;">날짜 선택</p>
	                       	<p>0000-00-00</p>
	                       	<p style="font-weight:bold;">멘티 명</p>
	                       	<p>멘티 실명 표시</p>
	                       	<p style="font-weight:bold;">연락가능한 메일</p>
	                       	<p>asdf@gmail.com</p>
	                       	<p style="font-weight:bold;">연락 가능한 연락처</p>
	                       	<p>000-1234-5678</p>
	             			<p style="font-weight:bold;">남길메시지</p>
	                       	<p>메시지내용</p>
	                       	<div id="btn">
	                            <input type="button" id="btn_prev" name="btn_prev" value="이전">
	                            <input type="submit" id="btn_submit" name="btn_submit" value="신청하기">
	                        </div>
                       	</div>
                    </form>
                </div>
            </div>


        </div>

    </main>
    <%@ include file="../common/footer.jsp" %>
</div>

<script>
    //멘토링개설 세션처리
    var sessionId = '<%= sessionId %>';

    let popupContainer = document.getElementById("popupContainer");
    let contents = document.getElementsByClassName("mentoring_content");
    let popups = document.getElementsByClassName("popup_contents");
    let resetBtn = document.getElementById("resetBtn");
    resetBtn.addEventListener("click", function(e){
    	window.location.replace("../mentor/mentor.do");
    });
    for(i=0;i<contents.length;i++){
        contents[i].addEventListener("click",function(e){
            popupContainer.style.display="block";
            for(j=0;j<popups.length;j++)
                popups[j].style.display="none";
            popups[1].style.display="block";
            let mentoringContents = this.children;
            let curr_mentoringInfo = document.querySelectorAll('#curr_mentoringInfo p');

            curr_mentoringInfo[0].textContent = mentoringContents[12].textContent;
            curr_mentoringInfo[1].textContent = mentoringContents[2].textContent;
            curr_mentoringInfo[2].textContent = mentoringContents[9].textContent;
            curr_mentoringInfo[3].textContent = mentoringContents[7].textContent;
            curr_mentoringInfo[4].textContent = mentoringContents[13].textContent;
        });
    }
    document.getElementById("closePopup").addEventListener("click",function(e){
        popupContainer.style.display="none";
    });
    document.getElementById("mentoringCreate_Btn").addEventListener("click",function(e){
        //세션처리
        if(sessionId === '고객') {
            // 비로그인시  mentor 페이지로 이동
            alert("로그인이 필요합니다.")
            location.href='../mentor/mentor.do';
        }
        else{
            for(j=0;j<popups.length;j++) {
                popups[j].style.display="none";
                popupContainer.style.display="block";
                popups[0].style.display="block";
            }
        }
    });
    document.getElementById("popup_infor_sign_Btn").addEventListener("click",function(e){
        //세션처리
        if(sessionId === '고객') {

            alert("로그인이 필요합니다.")
            location.href='../mentor/mentor.do';
        }
        else{
            for(j=0;j<popups.length;j++)
                popups[j].style.display="none";
        }
        popups[2].style.display="block";
    });

//     document.getElementById("searchBtn").addEventListener("click",function(e){
//         e.preventDefault();
        
        

//     });

    document.querySelector("#btn_next").addEventListener("click", function(e) {
        e.preventDefault();
        e.stopPropagation();
        // let date = document.querySelector("#date");
        // if(date.value === "choice") {
        //     alrert("날짜를 선택해주세요.");
        //     date.focus();
        //     return false;
        // }
        let id = document.querySelector("#ap_name");
        if(id.value.length < 2) {
            alert("이름은 2자 이상 입력해주세요.");
            id.focus();
            return false;
        }
        let email = document.querySelector("#ap_email");
        if(!(email.value.includes('@')) && !(email.value.includes('.')) && email.value.length =="") {
            alert("올바른 이메일 형식으로 입력해주세요.");
            email.focus();
            return false;
        }
        let tel = document.querySelector("#ap_tel");
        if(tel.value.includes('-') || tel.value.length =="") {
            alert("하이픈 없이 입력해주세요.");
            tel.focus();
            return false;
        }
        let msg = document.querySelector("#ap_msg");
        if(msg.value.length > 300 || msg.value.length =="") {
            alert("300자 이내로 작성해주세요.");
            msg.focus();
            return false;
        }
 /*        for(j=0;j<popups.length;j++)
           	popups[j].style.display="none";
            popups[3].style.display="block"; */
            
            
            
/* 멘토링 신청 내용을 어떻게 가져다가 쓰지?
			for(i=0;i<contents.length;i++){
            contents[i].addEventListener("click",function(e){
                popupContainer.style.display="block";
                for(j=0;j<popups.length;j++)
                    popups[j].style.display="none";
                popups[1].style.display="block";
                let mentoringContents = this.children;
                let curr_mentoringInfo = document.querySelectorAll('#curr_mentoringInfo p');

                curr_mentoringInfo[0].textContent = mentoringContents[12].textContent;
                curr_mentoringInfo[1].textContent = mentoringContents[2].textContent;
                curr_mentoringInfo[2].textContent = mentoringContents[9].textContent;
                curr_mentoringInfo[3].textContent = mentoringContents[7].textContent;
                curr_mentoringInfo[4].textContent = mentoringContents[13].textContent;
            });
        } */
            
        /* frm.submit(); */
        alert("신청완료");
      document.sign_frm.submit();
    }, false);
    
    document.querySelector("#btn_prev").addEventListener("click", function(e) {
    	for(j=0;j<popups.length;j++)
           	popups[j].style.display="none";
            popups[2].style.display="block";
    });
    
    document.querySelector("#mentoringReview_Btn").addEventListener("click", function(e) {
        location.href="../qna/MentoringReview.do";
    });
    
</script>
</body>
</html>