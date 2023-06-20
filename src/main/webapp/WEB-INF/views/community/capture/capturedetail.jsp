<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../common/header.jsp" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>맛집은! 머그멍</title>
      <link  
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3-alpha3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
        crossorigin="anonymous">
      
   </head>
   <body>
      <div class="container-fluid">
        <header class="my-3 p-3 text-center">
            <h1>상세보기</h1>
        </header>
         
         <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/main" />
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="captureListPage" value="/community/capture/capturelist" />
                    <a class="nav-link" href="${ captureListPage }">글 목록</a>
                </li>
            </ul>
        </nav>
        
        <main class="my-2">
            <section class="card">
                <form class="card-body">
                    <div class="my-2">
                        <input type="hidden" id="id" value="${capture.id }" readonly/>
                    </div>
                     <div class="my-2">
                        <label class="form-label" for="content">내용</label>
                        <input class="form-control" id="content" 
                            value="${capture.content }" readonly/>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="capture_image_id">사진</label>
                        <input class="form-control" id="capture_image_id" 
                            value="${capture.capture_image_id }" readonly/>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="viewsCount">조회수</label>
                        <input class="form-control" id="viewsCount" 
                            value="12" readonly/>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="createdTime">작성 시간</label>
                        <fmt:formatDate value="${ capture.createdTime }"
                            pattern="yyyy-MM-dd HH:mm:ss"  var="created" />
                        <input class="form-control" id="createdTime" value="${ created }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="modifiedTime">수정 시간</label>
                        <fmt:formatDate value="${ capture.modifiedTime }"
                            pattern="yyyy-MM-dd HH:mm:ss"  var="modified" />
                        <input class="form-control" id="modifiedTime" value="${ modified }" readonly />
                    </div>
                </form>
                <div class="card-footer">
                    <c:url var="captureModifyPage" value="/community/capture/capturemodify">
                        <c:param name="id" value="${capture.id }"></c:param>
                    </c:url>
                    <div class="d-flex justify-content-end">
                    <a class="btn btn-outline-primary form-control" style="width:200px; "
                        href="${ captureModifyPage }">수정하기</a>
                    </div>
                </div>
            </section>
            <!-- 포스트 상세 보기 카드 -->
            <section class="my-2 card">
                <div class="card-header fw-bold">
                    <span>댓글</span>
                    <%-- <span id="replyCount">${ capture.replyCount }</span>개 --%>
                    <button class="btn" id="btnToggleReply">
                        <img id="toggleBtnIcon" 
                            src="./static/assets/icons/toggle-off.svg" 
                            alt="toggle-off" width="32"/>
                    </button>
                </div>
                <div class="card-body collapse" id="replyToggleDiv">
            
            <!-- 내 댓글 등록 -->
                    <div class="my-2 row">
                        <label class="form-label" for="replyText">나의 댓글</label>
                        <div class="col-10">
                            <textarea class="form-control" id="replyText"></textarea>
                            <input class="d-none" id="writer" value="admin" /> TODO: 로그인 사용자 아이디
                        </div>
                        <div class="col-2">
                            <button class="form-control btn btn-outline-success" id="btnAddReply">
                                등록
                            </button>
                        </div>
                    </div>
             <!-- 댓글 목록 보여줄 영역 -->
                    <div class="my-2 row" id="replies"></div>
                </div>
            </section> <!-- 댓글 등록, 댓글 리스트 카드 -->
            <!-- 댓글 수정 모달 -->
            <div id="replyUpdateModal" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">댓글 수정</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- 수정할 댓글 아이디 - 화면에 보이지 않도록 -->
                            <input id="modalReplyId" class="d-none" />
                            <!-- 수정할 댓글 내용 -->
                            <textarea id="modalReplyText" class="form-control"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal">취소</button>
                            <button type="button" id="modalBtnUpdate"
                                class="btn btn-primary">변경 내용 저장</button>
                        </div>
                    </div>
                </div>
            </div> <!-- end modal -->
        </main>
        
        
        
         <%@ include file="../../common/footer.jsp" %>
         <script 
           src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3-alpha3/dist/js/bootstrap.bundle.min.js" 
           integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
           crossorigin="anonymous">
           </script>
           <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
           <%-- <c:url value="/static/js/capture-reply.js" var="capture-reply" />
           <script type="text/javascript" src="${capture-reply }"></script> --%>
      </div>
   </body>
</html>