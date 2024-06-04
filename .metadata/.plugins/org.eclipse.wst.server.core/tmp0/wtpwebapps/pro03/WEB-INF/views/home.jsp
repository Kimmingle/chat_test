<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <jsp:include page="./include/head.jsp"></jsp:include>
<title>메인 페이지</title>
</head>
<body>
	
	<div class="full-wrap">
	<header id="hd" class="header">
    	<div class="container">
			<jsp:include page="./include/hd.jsp"></jsp:include>
		</div>
	</header>
	<main class="contents" id="contents">
		<section class="page clr-fix" id="page1">
			<div class="page-wrap">
			<!--  
			<h2>${serverTime }</h2>
	<h2>${author }</h2>
	<h2>${company }</h2>
	<p>${msg }</p>	-->
	<hr>
	<ul>
		<li><a href="${path2 }/fileupload/main">파일 업로드 실습</a></li>
		<li><a href="${path2 }/email/main">이메일 보내기 실습</a></li>
		<li><a href="${path2 }/socket.do">채팅 실습</a></li>
		<li><a href="${path2 }/socket.do">채팅 실습2</a></li>
		<li><a href="${path2 }/socket3.do">채팅 실습3</a></li>

		<li><a href="${path2 }/socket/adminTest">관리자</a></li>
		<li><a href="${path2 }/socket/userTest">유저</a></li>
	</ul>
				
			</div>
		</section>	
	</main>
	<footer id="ft">
		<jsp:include page="./include/ft.jsp"></jsp:include>
	</footer>
</div>
</body>
</html>