<%@ page import="com.qst.itoffer.bean.Applicant" %><%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/7
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <title>锐聘网</title>
    <base href="<%=basePath%>">
    <link href="css/base.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="head">
    <div class="head_area">
        <div class="head_nav">
            <ul>
                <li><img src="images/nav_inc1.png" /><a href="index.jsp">首页</a></li>
                <li><img src="images/nav_inc2.png" /><a href="#">成功案例</a></li>
                <li><img src="images/nav_inc3.png" /><a href="#">关于锐聘</a></li>
            </ul>
        </div>
        <div class="head_logo">
            <img src="images/head_logo.png" />
        </div>
        <div class="head_user">
            <%
                if (session.getAttribute("SESSION_APPLICANT") == null) {
            %>
            <a href="login.jsp" target="_parent"><span class="type1">登录</span></a><a
                href="register.jsp" target="_parent"><span class="type2">注册</span></a>
            <%
                } else {
            %>
            <a href="ResumeBasicinfoServlet?type=select">
                ${sessionScope.SESSION_APPLICANT.applicantEmail}
            </a>
            &nbsp;&nbsp;
            <a href="ApplicantLogoutServlet">退出</a>
            <%
                }
            %>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="top_main">
    <div class="top_logo">
        <img src="images/main_logo.png" />
    </div>
    <div class="top_instr">提供岗前培训的IT职位</div>
    <div class="top_tel">
        <img src="images/it-phone.png" />
    </div>
</div>
<div class="clear"></div>
</body>
</html>
