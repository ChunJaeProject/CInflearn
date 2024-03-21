<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            border: 1px solid #000;
            width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div id="container">
        <%@ include file="../common/header.jsp" %>
        <div id="contents_top_area" class="cal_h100">
            <br><span style="font-size: large; font-weight: bold;padding-top: 10px;">멘토링 후기</span><span>(개수)</span>
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
                        <p>수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다!<p/> 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! </p>
                        <p>수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다!<p/> 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! </p><br><br>
                        <p id="bottom">작성자 : 작성자 ID</p>
                    </div>
                </div>
                <div class="review">
                    <div id="box1">
                        <div id="star">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                        </div>
                        <br><br>
                        <p>수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다!<p/> 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! </p>
                        <p>수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다!<p/> 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! 수강평 내용이 표시됩니다! </p><br><br>
                        <p id="bottom">작성자 : 작성자 ID</p>
                    </div>
                </div>
                <div class="paging_area">
                    페이징 영역
                </div>
            </div>
        </section>
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>