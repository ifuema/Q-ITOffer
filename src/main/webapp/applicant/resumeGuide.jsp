<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/28
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简历填写向导 - 锐聘网</title>
    <link href="../css/base.css" type="text/css" rel="stylesheet">
    <link href="../css/resumeGuide.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>
<div class="success_content" style="height: 300px;">
    <div class="success_left">
        <div class=it-pageimg></div>
        <h3 align="center">操作成功！</h3>
    </div>
    <div class="success_right">
        <p class="green16">需要先填写简历，才能申请职位呦！</p>
        <p>快快选择以下任意一种方式完善简历，去申请心仪职位吧！</p>
        <p>
            <a href="ResumeBasicinfoServlet?type=select"><span class="tn-button">填写简历</span></a>
            <a href="index.jsp"><span class="tn-button">站点首页</span></a>
        </p>
    </div>
    <div class="clear"></div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
