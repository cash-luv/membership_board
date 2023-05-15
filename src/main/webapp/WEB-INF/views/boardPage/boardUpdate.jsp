<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-04-28
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id="section">
    <form action="/board/update" method="post" name="updateForm">
        <input type="text" name="id" value="${board.id}" readonly> <br>
        <input type="text" name="boardTitle" value="${board.boardTitle}"> <br>
        <input type="text" name="boardWriter" value="${board.boardWriter}" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
        <input type="button" value="수정" onclick="update_req()">
    </form>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const update_req = () => {
        const password = document.getElementById("memberPassword").value;
        // password 값이 비어있는 경우 alert 메시지 출력
        if (!password) {
            alert("비밀번호를 입력하세요.");
            return;
        }else{
            document.updateForm.submit();
        }
    }



</script>
</html>
