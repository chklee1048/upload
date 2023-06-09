<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>맛집은! 머그멍</title>


<c:url value="/static/css/map.css" var="map" />
<link rel="stylesheet" href="${ map }">
</head>
<body>
<%@ include file="../../views/common/header.jsp"%>
	<main>
		<div class="container-fluid">
			<div class="btn-group" role="group">
				
				<div style="height: 10px;"></div>
				<div style="text-align: center; position: relative;">
					<c:url value="/static/img/jejumap.jpeg" var="titleMap" />
					<img src="${titleMap}" class="jeju" alt="제주도 맛집! 머그멍" width="90%">
				</div>
				<div id="buttonContainer">
				
					<button class="btn1 cityBtn" id="한경면" name="hangyeong" type="button"></button>
					<button class="btn2 cityBtn" id="한림읍" name="hanlim" type="button"></button>
					<button class="btn3 cityBtn" id="애월읍" name="aewol" type="button"></button>	
					<button class="btn4 cityBtn" id="길" name="jeju" type="button"></button>
					<button class="btn5 cityBtn" id="조천읍" name="jochun" type="button"></button>
					<button class="btn6 cityBtn" id="구좌읍" name="gujwa" type="button"></button>
					<button class="btn7 cityBtn" id="대정읍" name="daejeong" type="button"></button>
					<button class="btn8 cityBtn" id="안덕면" name="anduck" type="button"></button>			
					<button class="btn9 cityBtn" id="서귀포시" name="seogwipo" type="button"></button>
					<button class="btn10 cityBtn" id="남원읍" name="namwon" type="button"></button>
					<button class="btn11 cityBtn" id="표선면" name="sungsan" type="button"></button>
					<button class="btn12 cityBtn" id="성산읍" name="sungsan" type="button"></button>		
				</div>
			</div>
		</div>
		
	</main>
	
	<c:url value="/static/js/mugmap.js" var="mugmap"></c:url>	
	<script src="${ mugmap }"></script>
	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>