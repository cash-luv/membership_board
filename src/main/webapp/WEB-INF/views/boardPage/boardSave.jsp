<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: PM 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id="section">
  <form action="/board/save" method="post" enctype="multipart/form-data">
   제목: <input type="text" name="boardTitle" placeholder="제목을 입력하세요"> <br>
   작성자: <input type="text" name="boardWriter" value="${sessionScope.loginEmail}"> <br>
<%--    <input type="text" name="boardPass" placeholder="비밀번호를 입력하세요"> <br>--%>
   내용: <textarea name="boardContents" cols="30" rows="10"></textarea> <br>
   파일: <input type="file" name="boardFile" multiple> <br>
    <input type="submit" value="작성">
  </form>
</div>
</body>
</html>
