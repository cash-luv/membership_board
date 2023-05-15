<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-04-28
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>

<div id="section">
    <table>
        <tr>
            <td width="15%">[${board.id}]</td>
            <td class="title" colspan="3">${board.boardTitle}</td>
        </tr>
        <tr>
            <td width="15%">작성자</td>
            <td class="writer" width="35%">${board.boardWriter}</td>
            <td width="15%">작성일자</td>
            <td class="date" width="35%">
                <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <td width="15%">조회수</td>
            <td class="hits">${board.boardHits}</td>
            <td width="15%"></td>
            <td width="35%"></td>
        </tr>
        <tr>
            <td colspan="4" id="board-contents">${board.boardContents}</td>
        </tr>
        <c:if test="${board.fileAttached == 1}">
            <tr>
                <td colspan="4">
                    <c:forEach items="${boardFileList}" var="boardFile">
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}">
                    </c:forEach>
                </td>
            </tr>
        </c:if>
    </table>
    <button onclick="board_list()">목록</button>
    <c:if test="${editable}">
        <button onclick="board_update()">수정</button>
        <button onclick="board_delete()">삭제</button>
    </c:if>


    <div id="comment-write-area">
        <input type="text" id="comment-writer" value="${sessionScope.loginEmail}"readonly>
        <input type="text" id="comment-contents" placeholder="댓글 내용">
        <button onclick="comment_write()">댓글작성</button>
    </div>
    <div id="comment-list">
        <c:choose>
            <c:when test="${commentList == null}">
                <h2>작성된 댓글이 없습니다.</h2>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>id</th>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.id}</td>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td>
                                <fmt:formatDate value="${comment.commentCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const comment_write = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.getElementById("comment-contents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list");
        $.ajax({
           type: "post",
           url: "/comment/save",
           data: {
               "commentWriter": commentWriter,
               "commentContents": commentContents,
               "boardId": boardId
           },
            success: function (res) {
                console.log(res);
                let output = "<table>";
                output += "<tr>";
                output += "<th>id</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "</tr>";
                for(let i in res) {
                    output += "<tr>";
                    output += "<td>" + res[i].id + "</td>";
                    output += "<td>" + res[i].commentWriter + "</td>";
                    output += "<td>" + res[i].commentContents + "</td>";
                    output += "<td>" + moment(res[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("실패");
            }
        });
    }
    const board_list = () => {
        const type = '${type}';
        const q = '${q}';
        const page = '${page}'
        location.href = "/board/paging?page="+page+"&type"+type+"&q="+q;
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }
</script>
</html>
