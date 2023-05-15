<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
<div id="nav">
    <ul>
        <li>
            <a href="/">
                <i class="bi bi-house"></i>
            </a>
        </li>
        <c:choose>
            <c:when test="${not empty sessionScope.loginEmail}">
                <!-- 로그인한 경우 -->
                <c:if test="${sessionScope.loginEmail == 'admin'}">
                    <ul>
                        <li>
                            <a href="/board/save">글작성</a>
                        </li>
                        <li>
                            <a href="/board/paging">글목록</a>
                        </li>
                        <li>
                            <a href="/members">회원목록(관리자전용)</a>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.loginEmail != 'admin'}">
                    <ul>
                        <li>
                            <a href="/board/save">글작성</a>
                        </li>
                        <li>
                            <a href="/board/paging">글목록</a>
                        </li>
                        <li>
                            <a href="/mypage">마이페이지</a>
                        </li>
                    </ul>
                </c:if>
            </c:when>
            <c:otherwise>
                <!-- 로그인하지 않은 경우 -->
                <ul>
                    <li>
                        <a href="/save">회원가입</a>
                    </li>
                    <li>
                        <a href="/login">로그인</a>
                    </li>
                    <li>
                        <a href="/board/paging">글목록</a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
        <li class="login-name" id="login-area">

        </li>
    </ul>
</div>
</nav>
<script>
    const loginArea = document.getElementById("login-area");
    const loginEmail = '${sessionScope.loginEmail}';
    console.log(loginEmail.length);

    if (loginEmail.length != 0) {
        loginArea.innerHTML = "<a href='/mypage' style='color: black;'>"+loginEmail +"님 환영해요!</a>"+
                                "<a href='/logout'>logout</a>";
    } else {
        loginArea.innerHTML = "<a href='/login'>login</a>";
    }
</script>