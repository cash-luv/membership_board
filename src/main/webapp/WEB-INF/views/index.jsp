<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: AM 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/skills.css">
</head>
<body>
<%@include file="./component/header.jsp"%>
<%@include file="./component/LoginNav.jsp"%>

<section class="skills" id="skills">
    <div class="max-width">
        <h2 class="title">My Skills</h2>
        <div class="skills-content">
            <div class="left column">
                <div class="skills-text">
                    <div class="sub-title">My Skills & Experiences</div>
                    <p>
                        Since I'm learning at the academy, I'll try harder and work
                        harder until this number reaches 100% Please look forward to me
                        growing up
                    </p>
                </div>
            </div>
            <div class="right column">
                <div class="bars">
                    <div class="bars-content">
                        <span>HTML</span>
                        <span>30%</span>
                    </div>
                    <div class="line html"></div>
                </div>
                <div class="bars">
                    <div class="bars-content">
                        <span>CSS</span>
                        <span>20%</span>
                    </div>
                    <div class="line css"></div>
                </div>
                <div class="bars">
                    <div class="bars-content">
                        <span>JavaScript</span>
                        <span>20%</span>
                    </div>
                    <div class="line js"></div>
                </div>
                <div class="bars">
                    <div class="bars-content">
                        <span>JAVA</span>
                        <span>35%</span>
                    </div>
                    <div class="line java"></div>
                </div>
                <div class="bars">
                    <div class="bars-content">
                        <span>MySql</span>
                        <span>10%</span>
                    </div>
                    <div class="line oracle"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="./component/footer.jsp"%>
</body>
</html>
