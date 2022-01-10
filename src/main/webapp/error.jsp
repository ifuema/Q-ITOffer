<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/7
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>

<!-- isErrorPage="true" 设置此jsp使用exception对象 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<!-- 请求协议 + :// + 网站域名 + : + 请求端口号 + / + web应用路径 -->
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/" + request.getContextPath() + "/";
%>
<html>
<head>
    <title>锐聘网</title>

    <!-- 设置页面中所有相对链接的基准URL -->
    <base href="<%=basePath%>">
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/error.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="top.jsp"></jsp:include>
</div>
<div class="success_content">
    <div class="success_left">
        <div class="error">
            <img src="images/error.gif" alt="">
        </div>
        <h2 align="center">出错了！</h2>
    </div>
    <div class="success_right">
        <p class="green16">
            <%=exception%>
        </p>
        <p>
            <a href="javascript:window.history.go(-1);">
                <span class="tn-button">返回上一步</span>
            </a>
            <a href="index.jsp">
                <span class="tn-button">返回首页</span>
            </a>
        </p>
    </div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
