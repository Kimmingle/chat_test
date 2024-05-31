<%@ page language="java" contentType="text/html charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>채팅 테스트</title>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">

	 $(function(){
	    var ws = new WebSocket("ws://192.168.20.219:8080/myapp/socket.do");
		
	    ws.onopen = function(e){ // 연결 시 실행
            console.log("info : connection opened.");
        }

        ws.onmessage = function(e){ // 서버로부터 메세지를 받았을 때 실행
            console.log(e.data); // 전달 받은 메세지 = e.data
            $("#msg").append("<p>"+e.data+"</p>");
        }

        ws.onclose = function(e){ // 연결 종료 시 실행
            console.log("info : connection closed");
        };

        ws.onerror = function(e){
            console.log("error");
        };
		
		//여기서 뭔 행위를 해야 위에 함수들이 실행. 지금은 대기
		$("#btn").on("click", function(e){
            e.preventDefault();
            if (ws.readyState === WebSocket.OPEN) {
                ws.send($("#testInput").val());
            } else {
                console.log("WebSocket is not open: readyState=" + ws.readyState);
            }
        });
    });
	</script>
    
<body>
<div class="wrap">
	<h2>Socket Test Page</h2>
	<input type="text" id="testInput">
	<button type="button" id="btn">전송</button>
</div>	
</body>
</html>