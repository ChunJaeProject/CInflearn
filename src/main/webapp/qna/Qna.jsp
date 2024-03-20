<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
        #sidebar_ul li a:hover, a:focus {
            color:#1dc078;
            font-weight: bold;
        }
        #sidebar_ul li a:active, a:target {
            color:#1dc078;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <div id="contents_top_area" class="cal_h100">
            <p style="font-size: large; font-weight: bold;">묻고 답해요</p>
            <p>126만명의 커뮤니티 !! 함께 토론해봐요.</p>
        </div>
        <section id="section">
            <div id="sidebar_left">
                <ul id="sidebar_ul">
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="QnA.jsp">질문과 답변</a></li>
                    <li style="border-bottom: 1px solid #ccc; width:100px; padding: 10px; font-size: small;"><a href="Review.jsp">수강평</a></li>
                    <li style="padding: 10px; font-size: small;"><a href="MentoringReview.jsp">멘토링 후기</a></li>
                </ul>
            </div>
            <div id="content">
                <ul id="content_ul" >
                    <li><a href="#">전체(개수)</a></li>
                    <li><a href="#">미해결(개수)</a></li>
                    <li><a href="#">해결됨(개수)</a></li>
                </ul>
                <hr>
                <div id ="search">
                    <form>
                    <input type="text" id="search_title" name="search_title" value="" maxlength="100" placeholder=" 궁금한 질문을 검색해보세요 !">
                    <input type="submit" id="btn_search" name="btn_search" value="검색"><br>
                    <input type="text" id="search_hash" name="search_hash" value="" maxlength="100" placeholder=" # 태그로 검색해보세요 !">
                    <input type="reset" id="btn_reset" name="btn_reset" value="초기화"><br>
                    </form>
                </div>
                <ul id="order_ul">
                    <li><a href="#">최신순</a></li>
                    <li><a href="#" style="margin-right: 415px;">좋아요순</a></li>
                    <input type="button" id="btn_write" name="btn_write" value="글쓰기"><br> 
                </ul>
                <hr>
                <div class="question">          
                    <div class="qTitle">
                        <span id="solve">해결됨</span>
                        <a href ="QnADetail.jsp">&nbsp;<span style="font-weight: bold;">제목</span></a>
                    </div><br>
                    <p class="qContent">질문내용</p><br>
                    <div class="qTag"><span>태그1</span><span>태그2</span></div><br>
                    <div id="bottom">
                        <p class="qName">닉네임 | 작성 시간</p><br>
                        <div class="qBtn">
                            <img src="../assets/image/like.png" width="20px">&nbsp;0&nbsp;&nbsp;
                            <img src="../assets/image/comment.png" width="20px">&nbsp;0&nbsp;&nbsp;
                        </div>
                    </div>                  
                </div>
                <div class="question">          
                    <div class="qTitle">
                        <span id="unsolve">미해결</span>
                        <a href ="#">&nbsp;<span style="font-weight: bold;">제목</span></a>
                    </div><br>
                    <p class="qContent">질문내용</p><br>
                    <div class="qTag"><span>태그1</span><span>태그2</span></div><br>
                    <div id="bottom">
                        <p class="qName">닉네임 | 작성 시간</p><br>
                        <div class="qBtn">
                            <img src="../assets/image/like.png" width="20px">&nbsp;0&nbsp;&nbsp;
                            <img src="../assets/image/comment.png" width="20px">&nbsp;0&nbsp;&nbsp;
                        </div>
                    </div>                  
                </div>
                <div class="question" style="text-align: center; padding: 40px; border-bottom: 1px solid #ccc;">
                    <p>아직 관련 글이 없습니다. 첫 글을 남겨주세요!</p>
                </div>
                <div class="paging_area">
                    페이징 영역
                </div>
            </div>
            <div id="sidebar_right">
                <p>인기태그</p><br>
                <span>태그1</span><span>태그2</span><br><br><span>태그3</span><span>태그4</span><br><br><span>태그5</span>
            </div>
            
        </section>
        <%@ include file="../common/footer.jsp" %>
    </div>
<script>
    document.querySelector("#btn_write").addEventListener("click", function(){
        alert("로그인 후 이용하세요.");
        location.href="Write.jsp";
    });
</script>
</body>
</html>