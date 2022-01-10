<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/28
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简历基本信息 - 锐聘网</title>
    <link href="../css/base.css" type="text/css" rel="stylesheet">
    <link href="../css/resume.css" type="text/css" rel="stylesheet">

    <!-- 日期控件 js -->
    <script src="../js/Calendar6.js" type="text/javascript" language="JavaScript"></script>
    <script type="text/javascript">
        function validate() {

            //获取表单信息
            var realname = document.getElementById("realname");
            var telephone = document.getElementById("telephone");
            var email = document.getElementById("email");

            //邮箱格式验证正则表达式
            var emailPattern = /^[\w-]+@[\w-]+(\.[\w-])+/;

            //手机号码格式验证正则表达式
            var phonePattern = /^((13\d)|159|153)\d{8}$/;
            if (realname.value == ""){
                alert("姓名不能为空！");
                realname.focus();
                return false;
            }
            if(telephone.value == ""){
                alert("手机不能为空！");
                telephone.focus();
                return false;

            //使用正则表达式验证输入信息
            }else if(!phonePattern.test(telephone.value)){
                alert("手机号格式不正确！");
                telephone.focus();
                return false;
            }
            if(email.value == ""){
                alert("邮箱不能为空！");
                email.focus();
                return false;
            }else if(!emailPattern.test(email.value)){
                alert("邮箱格式不正确！");
                email.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>

<!-- 我的简历页面 开始 -->
<div class="resume_con">

    <!-- tab设置 -->
    <div class="user_operate" style="height: 41px;">
        <ul style="float: left;">
            <li><a href="ResumeBasicinfoServlet?type=select" class="active">我的简历</a></li>
            <li><a href="JobApplyServlet?type=myapply">我的申请</a></li>
        </ul>
    </div>

    <!-- 主体部分 -->
    <div class="resume_main">
        <div class="resume_left">
            <div class="resume_title">
                <div style="float: left;">基本信息</div>
            </div>
            <div class="all_resume" style="text-align: center" align="center">

                <!-- 简历基本信息添加 -->
                <form action="ResumeBasicinfoServlet?type=add" method="post" onsubmit="return validate()">
                    <div class="table_style" style="margin-left: 155px;">
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">姓名：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="text" id="realname" name="realName">
                                    <font style="color: red">*</font>
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">性别：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="radio" name="gender" checked="checked" value="男">男
                                    <input type="radio" name="gender" value="女">女
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">出生日期：</td>
                                <td bgcolor="#F8F8F8" align="left">

                                    <!-- 点击时调用日期选择控件函数 -->
                                    <input type="text" name="birthday" id="birthday" onclick="SelectDate(this)" readonly="readonly">
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">当前所在地：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="text" name="currentLoc">
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">户口所在地：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="text" name="residentLoc">
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">手机：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="text" id="telephone" name="telephone">
                                    <font style="color: red">*</font>
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">邮件：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="text" id="email" name="email">
                                    <font style="color: red">*</font>
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">求职意向：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <input type="text" name="jobIntension">
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
                            <tr>
                                <td width="110" align="right" bgcolor="#F8F8F8">工作经验：</td>
                                <td bgcolor="#F8F8F8" align="left">
                                    <select name="jobExperience" id="">
                                        <option value="">请选择</option>
                                        <option value="刚刚参加工作">刚刚参加工作</option>
                                        <option value="已工作一年">已工作一年</option>
                                        <option value="已工作两年">已工作两年</option>
                                        <option value="已工作三年">已工作三年</option>
                                        <option value="已工作三年以上">已工作三年以上</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div class="he"></div>
                        <div class="he"></div>
                        <div align="center">
                            <input type="submit" class="save1" value="保存">
                            <input type="reset" class="cancel2" value="取消">
                        </div>
                    </div>
                </form>
                <!-- 简历基本信息添加 结束 -->
            </div>
        </div>

        <!-- 右侧公共部分：简历完善度 -->
        <iframe src="applicant/resume_right.jsp" width="297" height="440"
                scrolling="no" frameborder="0"></iframe>
        <div style="clear: both"></div>
    </div>
    <div class="clear"></div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
