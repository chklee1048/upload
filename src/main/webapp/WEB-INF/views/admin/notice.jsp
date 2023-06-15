<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../views/common/header.jsp" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>맛집은! 머그멍</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
      <c:url value="/static/css/carousel.css" var="carousel" />
      <link rel="stylesheet" href="carousel">
      <c:url value="/static/css/carouselrtl.css" var="carouselrtl" />
      <link rel="stylesheet" href="carouselrtl">
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   </head>
   <body>
   <main>
    <hr>
    <br>
    <h1 align="center">공지사항</h1>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-2" style="padding-left: 0; width: 150px;">
                <div class="sidebar">
                    <ul class="nav flex-column">
                        <c:url var="adminNoticePage" value="/admin/main/notice" />
                        <li class="nav-item"><a href="${adminNoticePage}" class="nav-link">공지사항</a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="/mugmung/admin/main">매장 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">새 매장 등록</a>
                        </li>
                        <c:url var="adminReviewPage" value="/admin/main/review" />
                        <li class="nav-item"><a href="${adminReviewPage}" class="nav-link">리뷰 관리</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-10">
                <table class="card-body table table-hover text-center">
                    <thead>
                        <tr class="table-warning">
                          
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성시간</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>                            
                                <td>서비스 이용약관 개정 안내 (6월 20일 시행)</td>
                                <td>관리자</td>
                                <td>2023.06.14</td>
                            </tr>
                            <tr>                            
                                <td>긴급점검 안내</td>
                                <td>관리자</td>
                                <td>2023.06.09</td>
                            </tr>
                            <tr>                            
                                <td>고객센터 전화상담 일시 중단 안내 (6월6일 시행)</td>
                                <td>관리자</td>
                                <td>2023.06.02</td>
                            </tr>
                            <tr>                            
                                <td>(필독) 새 매장 등록 시 주의사항</td>
                                <td>관리자</td>
                                <td>2023.05.09</td>
                            </tr>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@ include file="../../views/common/footer.jsp" %>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>