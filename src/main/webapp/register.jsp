<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/28
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册 - 锐聘网</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/register.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function validate() {
            var email = document.getElementById("email");
            var password = document.getElementById("password");
            var agree = document.getElementById("agree");

            //用于验证邮箱格式的正则表达式
            var pattern = /^[\w-]+@[\w-]+(\.[\w-])+/;
            if(email.value == ""){

                //弹框提示
                alert("邮箱不能为空！");

                //将输入框设置焦点
                email.focus();
                return false;

                //验证是否符合正则表达式规则
            }else if(!pattern.test(email.value)){
                alert("请输入正确的邮箱格式！");
                email.focus();
                return false;
            }
            if(password.value == ""){
                alert("密码不能为空！");
                password.focus();
                return false;
            }else if(password.length < 6 || password.length > 12){
                alert("密码长度不符合要求，请输入6~12位密码！");
                password.focus();
                return false;
            }
            if(!agree.checked){
                alert("请先同意本站服务条款！");
                return false;
            }
            return true;
        }

        //验证码的更换
        function changeValidateCode() {
            document.getElementById("validateCode").src = "ValidateCodeServlet?rand="
                + Math.random();
        }
    </script>
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="top.jsp"></jsp:include>
</div>

<!-- 注册部分开始 -->
<div class="content">
    <div class="page_name">注册</div>
    <div class="login_content">

        <!-- 提交表单时执行函数，若return false则阻止表单提交 -->
        <form action="ApplicantRegisterServlet" method="post" onsubmit="return validate();">
            <div class="login_1">
                <div class="span1">
                    <label class="tn-form-label">邮箱：</label>
                    <input class="tn-textbox" type="text" name="email" id="email" style="width: 283px;">
                </div>
                <div class="clear"></div>
                <div class="span1">
                    <label class="tn-form-label">密码：</label>
                    <input class="tn-textbox" type="password" name="password" id="password" style="width: 283px;">
                </div>
                <div class="clear"></div>
                <div class="span1">
                    <label class="tn-form-label">验证码：</label> <input
                        class="tn-textbox-long" type="text" name="verifyCode">&nbsp;<span>
							<img src="ValidateCodeServlet"
                                 id="validateCode" title="点击换一换" onclick="changeValidateCode()">
							<a href="javascript:changeValidateCode();">看不清？</a>
						</span>
                </div>
                <div class="tn-form-row-button">
                    <div class="span1">
                        <input name="submit" type="submit" class="tn-button-text" value="立即注册">
                        <p class="it-register-text">
                            <input name="agree" id="agree" class="tn-checkbox" checked="checked" type="checkbox">
                            <label>同意本站服务条款</label>
                            <a href="javascript:void(0);">查看</a>
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </form>
        <div class="register_r">
            <p align="center">
                <br><br>
                <b>已有账号？</b>
                <a href="login.jsp">登录</a>
            </p>
            <div>
                <img alt="" src="images/reg_pic.jpg" height="230">
            </div>
        </div>
    </div>
</div>
<!-- 注册部分结束 -->

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
