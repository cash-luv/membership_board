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

</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<section id="section">
    <h2>회원수정 페이지</h2>
    <br>
    <div class="container">
        <form action="/update" method="post" name="updateForm" enctype="multipart/form-data" onsubmit="return ValidationName()">
            <table>
                <tr>
                    <th><label for="memberId"><b>ID</b> </label></th>
                    <th><input type="text" name="id" id="memberId" value="${member.id}" readonly>
                </tr>
                <tr>
                    <th><label for="memberEmail"><b>이메일</b> </label></th>
                    <th><input type="text" name="memberEmail" id="memberEmail" value="${member.memberEmail}" readonly>
                </tr>
                <tr>
                    <th>
                    <div id="member-password">

                    </div>
                    </th>
                </tr>
                <tr>
                    <th><label for="memberPassword"><b>변경할 비밀번호</b> </label></th>
                    <th><input type="text" name="memberPassword" id="memberPassword" placeholder="패스워드를 입력해주세요">
                    </th>
                </tr>

                <tr>
                    <th><label for="memberName"><b>회원이름</b></label></th>
                    <th><input type="text" name="memberName" id="memberName" value="${member.memberName}"></th>
                </tr>
                <tr>
                    <th><label for="memberMobile"><b>전화번호</b></label></th>
                    <th><input type="text" name="memberMobile" id="memberMobile" value="${member.memberMobile}"></th>
                </tr>
            </table>
        </form>
        <button onclick="update_check()">비밀번호</button>
        <button onclick="back()">취소</button>
    </div>
</section>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const update_check = () => {
        const passwordCheck = document.getElementById("member-password");
        passwordCheck.innerHTML = "<th><label for='Password-Check'><b>현재 비밀번호</b> </label></th>"+
            "<th><input type='text' name='Password-Check' id='Password-Check' placeholder='패스워드를 입력해주세요' onblur='Password_Check()'></th>"
        +"<th><input type='submit' id='submit' disabled=disabled value='정보수정'></th>" ;
    }
    const Password_Check = () => {
        const password = document.getElementById("Password-Check");
        const submit = document.getElementById("submit");
        const passwordch = document.getElementById("memberPassword");
        if(password.value=='${member.memberPassword}'){
            submit.disabled=false;
        } else{
                alert("비밀번호 다름");
        }
    }

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

            alert("회원수정완료")
            return true;
        }
    }
    const back = () => {
      location.href = "/board"
    }
</script>
</html>
