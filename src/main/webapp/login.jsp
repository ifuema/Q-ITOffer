<%@ page import="com.qst.itoffer.util.CookieEncryptTool" %><%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/10/31
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>登录 - 锐聘网</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/login.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function validate() {
            var email = document.getElementById("email");
            var password = document.getElementById("password");
            if (email.value == "") {
                alert("邮箱不能为空！");
                email.focus();
                return false;
            }
            if (password.value == "") {
                alert("密码不能为空！");
                password.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<%
    String applicantEmail = "";
    String applicantPwd = "";
    //通过request获取cookie
    Cookie[] cookies = request.getCookies();
    //若cookie不为空则遍历获得加密的邮箱和密码，并调用工具类解密
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("COOKIE_APPLICANTEMAIL".equals(cookie.getName())) {
                applicantEmail = CookieEncryptTool.decodeBase64(cookie.getValue());
            }
            if ("COOKIE_APPLICANTPWD".equals(cookie.getName())){
                applicantPwd = CookieEncryptTool.decodeBase64(cookie.getValue());
            }
        }
    }
%>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="top.jsp"></jsp:include>
</div>

<!-- 登录部分开始 -->
<div class="content">
    <div class="page_name">登录</div>
    <div class="login_content">

        <!-- 登录表单开始 -->
        <form action="ApplicantLoginServlet" method="post" onsubmit="return validate();">
            <div class="login_1">
                <p class="font14" style="color:gray">使用注册邮箱登录</p>
                <div class="span1">
                    <label class="tn-form-label">邮箱：</label>
                    //将解密的邮箱置于输入框
                    <input class="tn-textbox" type="text" name="email" id="email" value="<%=applicantEmail%>"  style="width: 283px;">
                </div>
                <div class="clear"></div>
                <div class="span1">
                    <label class="tn-form-label">密码：</label>
                    //将解密的密码置入输入框
                    <input class="tn-textbox" type="password" name="password" id="password" value="<%=applicantPwd%>"  style="width: 283px;">
                </div>
                <div class="tn-form-row-button">
                    <div class="span1">
                        <input name="submit" type="submit" class="tn-button-text" value="登录">
                        <span class="it-register-text">
                            <input type="checkbox" checked="checked" name="rememberMe" id="rememberMe" class="tn-checkbox" value="true">
                            <label for="rememberMe" style="color: gray">记住密码</label>
                        </span>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </form>

        <!-- 登录表单结束 -->
        <div class="register_r">
            <p align="center">
                <br><br>
                <b>还没有账号？</b>
                <a href="register.jsp">10秒钟快速注册</a>
            </p>
            <div>
                <img alt="" src="images/login_pic.jpg" height="230">
            </div>
        </div>
    </div>
</div>
<!-- 注册部分结束 -->

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
