<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.qst.itoffer.bean.Company" %>
<%@ page import="com.qst.itoffer.dao.CompanyDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.qst.itoffer.bean.Job" %>
<%@ page import="com.qst.itoffer.bean.Applicant" %><%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/2
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>服务_锐聘官网-大学生求职，IT行业招聘，IT企业快速入职 - 锐聘网</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/index.css" type="text/css" rel="stylesheet">
</head>
<body class="tn-page-bg">

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="top.jsp"></jsp:include>
</div>

<!-- 实例化一个用于实现分页功能的JavaBean对象 -->
<jsp:useBean id="pageination" class="com.qst.itoffer.bean.ComanyPageBean" scope="request"></jsp:useBean>

<!-- 为JavaBean对象属性指定每页显示的数量信息 -->
<jsp:setProperty name="pageination" property="pageSize" value="2"></jsp:setProperty>

<!-- 从pageNo请求参数中获取当前页码，JavaBean中该属性值默认为1 -->
<jsp:setProperty name="pageination" property="pageNo"></jsp:setProperty>
<div class="tn-content">

    <!-- 迭代展示招聘企业 -->
    <c:forEach items="${pageination.pageData}" var="company">
        <div class="tn-grid">
            <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-box">
                <div class="tn-box-content tn-widget-content tn-corner-all">

                    <!-- 企业图片展示 -->
                    <div class="it-company-keyimg tn-border-bottom tn-border-gray">
                        <a href="CompanyServlet?type=select&id=${company.companyId}">
                            <img src="recruit/images/${company.companyPic}" alt="" style="margin: auto; max-height: 275px; max-width: 990px">
                        </a>
                    </div>

                    <!-- 招聘职位展示 -->
                    <c:forEach items="${company.jobs}" var="job">
                        <div class="it-home-present">
                            <div class="it-present-btn">
                                <a href="JobServlet?type=select&jobid=${job.jobId}" class="tn-button tn-button-home-apply">
                                    <span class="tn-button-text">我要申请</span>
                                </a>
                            </div>
                            <div class="it-present-text" style="padding-left: 185px">
                                <div class="it-line01 it-text-bom">
                                    <p class="it-text-tit">职位</p>
                                    <p class="it-line01 it-text-explain">
                                        <span class="tn-icon it-home-arrow"></span>
                                        <span class="tn-helper-right tn-action">
                                            <a href="CompanyServlet?type=select&id=${company.companyId}" class="tn-button tn-corner-all tn-button-text-only tn-button-semidlong">
                                                <span class="tn-button-text">更多职位</span>
                                            </a>
                                        </span>
                                        <b>${job.jobName}</b>
                                    </p>
                                </div>
                                <div class="it-line01 it-text-top">
                                    <p class="it-text-tit">薪资</p>
                                    <p class="it-line01 it-text-explain">
                                        <span class="tn-icon it-home-arrow"></span>
                                        <b>${job.jobSalary}</b>
                                    </p>
                                </div>
                            </div>
                            <div class="it-present-text">
                                <div class="it-line01 it-text-bom">
                                    <p class="it-text-tit">职位到期时间</p>
                                    <p class="it-line01 it-text-explain">
                                        <span class="tn-icon it-home-arrow"></span>
                                        <b>${job.jobEnddate}</b>
                                    </p>
                                </div>
                                <div class="it-line01 it-text-top">
                                    <p class="it-text-tit">工作地区</p>
                                    <p class="it-line01 it-text-explain">
                                        <span class="tn-icon it-home-arrow"></span>
                                        <b>${job.jobArea}</b>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- 分页底边栏 -->
<div class="page01">
    <div class="page02">
        <div class="page03">
            <a href="index.jsp?pageNo=1">首页</a>
        </div>
        <c:if test="${pageination.hasPreviousPage}">
            <div class="page03">
                <a href="index.jsp?pageNo=${pageination.pageNo - 1}">上一页</a>
            </div>
        </c:if>
        <c:if test="${pageination.hasNextPage}">
            <div class="page03">
                <a href="index.jsp?pageNo=${pageination.pageNo + 1}">下一页</a>
            </div>
        </c:if>
        <div class="page03">
            <a href="index.jsp?pageNo=${pageination.totalPages}">尾页</a>
        </div>
        <div class="page03">当前是第${pageination.pageNo}页，共${pageination.totalPages}页</div>
    </div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
