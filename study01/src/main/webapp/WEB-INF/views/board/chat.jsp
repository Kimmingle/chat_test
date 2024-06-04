<%@ page language="java" contentType="text/html charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 목록</title>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="full-wrap">
    <!-- 헤더 부분 인클루드 -->
    <header id="hd">
    	<div class="container">
    		<jsp:include page="../include/hd.jsp"></jsp:include>
    	</div>
    </header>
    <main id="contents" class="contents">
 	    <section class="page" id="page1">
    		<h2 class="page-title"></h2>
    		<div class="page-wrap">
    		
    		
	<div>탕코딩님의 채팅방</div>
	<input type="hidden" id="id" value="탕코딩">
	<div>
		<div id="chatarea" style="width: 300px; height: 300px; border: 1px solid black;"></div>
		<input type="text" id="message" />
		<input type="button" id="send" value="보내기" />
		<input type="button" id="exit" value="나가기" />
	</div>

<script type="text/javascript">
	// ##### 입장~~~!!
	let websocket;
	connect();
	function connect(){
// 		websocket = new WebSocket("ws://본인 아이 피주소/www/chat-ws");
		websocket = new WebSocket("ws://localhost/www/chat-ws");
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
	}
	
	// ##### 연결 되었습니다!
	function onOpen(){
		id = document.getElementById("id").value;
		websocket.send(id + "님 입장하셨습니다.");
	}
	
	// ##### 메세지 보내기 버튼 클릭!
	document.getElementById("send").addEventListener("click", function() {
		send();
	});
	
	function send(){
		id = document.getElementById("id").value;
		msg = document.getElementById("message").value;
		websocket.send(id + ":"+ msg);
		document.getElementById("message").value = "";
	}
	
	function onMessage(evt){
		data= evt.data;
		chatarea = document.getElementById("chatarea");
		chatarea.innerHTML = chatarea.innerHTML + "<br/>" + data
	}
	
	// ##### 연결을 해제합니다!
	document.getElementById("exit").addEventListener("click", function() {
		disconnect();
	});

	function disconnect(){
		id = document.getElementById("id").value;
		websocket.send(id+"님이 퇴장하셨습니다");
		websocket.close();
	}
	
	</script>
    		
    		</div>
    	</section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	<jsp:include page="../include/ft.jsp"></jsp:include>
    </footer>
</div>    
</body>
</html>