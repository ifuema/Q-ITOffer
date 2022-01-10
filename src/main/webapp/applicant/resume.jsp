<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/13
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="../error.jsp" %>
<html>
<head>
    <title>我的简历 - 锐聘网</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/resume.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>

<!-- 使用从request中获取的basicinfo JavaBean -->
<jsp:useBean id="basicinfo" class="com.qst.itoffer.bean.ResumeBasicinfo" scope="request"></jsp:useBean>

<!-- 我的简历页面 开始 -->
<div class="resume_con">

    <!-- tab设置 -->
    <div class="user_operate" style="height: 41px;">
        <ul style="float: left;">
            <li><a href="ResumeBasicinfoServlet?type=select" class="active">我的简历</a></li>
            <li><a href="JobApplyServlet?type=myapply">我的申请</a></li>
        </ul>
        <a href="index.jsp" style="float: right; height: 100%; padding-right: 15px; line-height: 40px; text-decoration: underline">去申请职位</a>
    </div>

    <!-- 主体部分 -->
    <div class="resume_main">
        <div class="resume_left">
            <div class="resume_title">
                <div style="float: left;">基本信息</div>
                <div class="btn">
                    <a href="applicant/resumeBasicInfoAdd.jsp">添加</a>
                </div>
                <div class="btn">
                    <a href="ResumeBasicinfoServlet?type=updateSelect">修改</a>
                </div>
            </div>
            <div class="all_resume">
                <div class="table_style">
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">姓名：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="realName"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">性别：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="gender"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">出生日期：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="birthday"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">当前所在地：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="currentLoc"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">户口所在地：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="residentLoc"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">手机：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="telephone"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">邮件：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="email"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">求职意向：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="jobIntension"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                    <table width="300" border="0" cellpadding="3" cellspacing="1">
                        <tr>
                            <td width="110" align="right" bgcolor="#F8F8F8">工作经验：</td>
                            <td bgcolor="#F8F8F8">
                                <jsp:getProperty name="basicinfo" property="jobExperience"/>
                            </td>
                        </tr>
                    </table>
                    <div class="he"></div>
                </div>
                <div style="float: right" class="uploade">
                    <%
                        if ("".equals(basicinfo.getHeadShot()) || basicinfo.getHeadShot() == null) {
                    %>

                    <!-- 若无头像则使用默认头像 -->
                    <img alt="" src="images/anonymous.png">
                    <%
                        } else {
                    %>

                    <!-- 若无已有头像则使用已有头像 -->
                    <img alt="" src="applicant/images/<jsp:getProperty name="basicinfo" property="headShot"/>" style="display: block; margin: auto; max-width: 102px; max-height: 102px;">
                    <%
                        }
                    %>
                    <p>&nbsp;</p>
                    <div align="center">
                        <a href="applicant/resumeBasicInfoPicUpload.jsp" class="uploade_btn">更换照片</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="resume_title">
                <div style="float: left">教育经历</div>
                <div class="btn">添加</div>
            </div>
            <div class="it-table-grid">
                <ul>
                    <li class="tn-border-gray tn-border-bottom it-table-grid-header">
                        <p class="tn-name">毕业院校</p>
                        <p class="tn-date">就读时间</p>
                        <p class="tn-degree">学历</p>
                        <p class="tn-fieldofstudy">专业</p>
                    </li>
                </ul>
            </div>
            <div class="resume_title">
                <div style="float: left">项目经验</div>
                <div class="btn">添加</div>
            </div>
            <div class="it-table-grid">
                <ul>
                    <li class="tn-border-gray tn-border-bottom it-table-grid-header">
                        <p class="tn-name">项目名称</p>
                        <p class="tn-date">参与时间</p>
                        <p class="tn-degree">担任职位</p>
                    </li>
                </ul>
            </div>
            <div class="resume_title">
                <div style="float: left">简历附件</div>
                <div class="btn">添加</div>
            </div>
            <div class="it-table-grid">
                <div class="it-table-grid">暂无附件！</div>
            </div>
        </div>

        <!-- 右侧公共部分：简历完善度 -->
        <iframe src="applicant/resume_right.jsp" width="297" height="440"
                scrolling="no" frameborder="0"></iframe>
        <div style="clear: both"></div>
        </div>
    </div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
