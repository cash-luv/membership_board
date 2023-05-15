<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: PM 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>

<section id="section">
    <h2>회원등록 페이지</h2>
    <br>
    <div class="container">
        <form action="/save" method="post" onsubmit="return ValidationName()" enctype="multipart/form-data">
            <table>
                <tr>
                    <th><label for="memberEmail"><b>이메일</b> </label></th>
                    <th><input type="text" name="memberEmail" id="memberEmail" placeholder="이메일을 입력해주세요"
                               onblur="email_check()">
                        <p id="check-result"></p></th>


                </tr>
                <tr>
                    <th><label for="memberPassword"><b>비밀번호</b> </label></th>
                    <th><input type="text" name="memberPassword" id="memberPassword" placeholder="패스워드를 입력해주세요"></th>
                </tr>
                <tr>
                    <th><label for="memberName"><b>회원이름</b></label></th>
                    <th><input type="text" name="memberName" id="memberName" placeholder="회원이름을 입력해주세요"></th>
                </tr>
                <tr>
                    <th><label for="memberMobile"><b>전화번호</b></label></th>
                    <th><input type="text" name="memberMobile" id="memberMobile" placeholder="전화번호를 입력해주세요"></th>
                </tr>
                <tr>
                    <th><label for="Profile"><b>프로필사진</b></label></th>
                    <th><input type="file" name="Profile" id="Profile" multiple></th>
                </tr>
                <tr>
                    <th><input type="submit" value="등록"></th>
                    <th><input type="reset" value="취소" onclick="back()"></th>
                </tr>
            </table>
        </form>

    </div>
</section>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const ValidationName = () => {
        const Email = document.getElementById("memberEmail");
        const Password = document.getElementById("memberPassword");
        const Name = document.getElementById("memberName");
        const Mobile = document.getElementById("memberMobile");
        const exp1 = /^(?=.*[a-z])(?=.*\d)(?=.*[!#$%])[a-z\d!#$%]{8,16}$/;

        if (Email.value.length == 0) {
            Email.focus();
            alert("이메일이 입력되지 않았습니다")
            return false;
        } else if (Password.value.length == 0) {
            alert("비밀번호를 입력하세요")
            Password.focus();
            return false;
        } else if (!Password.value.match(exp1)) {
            alert("올바른 형식이 아닙니다")
            Password.focus();
            return false;
        } else if (Name.value.length == 0) {
            alert("이름을 제대로 입력해주세요")
            Name.focus();
            return false;
        } else if (Mobile.value.length == 0) {
            alert("전화번호를 입력해주세요")
            Mobile.focus();
            return false;
        } else {
            alert("회원가입완료")
            return true;
        }
    }
    const back = () => {
        location.href = "/";

    }

    const email_check = () => {
        const email = document.getElementById("memberEmail").value;
        const result = document.getElementById("check-result");
        $.ajax({
            url: "/email-check",
            type: "POST",
            data: {
                "memberEmail": email
            },
            success: function () {
                result.innerHTML = "사용가능한 이메일입니다";
                result.style.color = "green";

            },
            error: function (xhr, status, error) {
                result.innerHTML = "이미 사용중인  이메일입니다";
                result.style.color = "red"
            }
        });

    }
</script>
</html>
