<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/27
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="../error.jsp" %>
<html>
<head>
    <title>我的申请</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/myapplys.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>
<div id="tn-content" class="tn-content-bg">
    <div class="tn-wrapper">
        <div class="tn-grid">
            <div class="it-content-box it-person">
                <div class="tn-box-content">
                    <div class="tn-tabs">
                        <ul class="tn-tabs-nav tn-widget-content">
                            <li><a href="ResumeBasicinfoServlet?type=select">我的简历</a></li>
                            <li class="tn-tabs-selected"><a href="JobApplyServlet?type=myapply">我的申请</a></li>
                        </ul>
                        <div class="tn-tabs-panel tn-widget-content">
                            <form action="#" method="post" id="Form-Apply">
                                <table class="tn-table-grid">
                                    <tbody>
                                        <tr class="tn-table-grid-header">
                                            <th class="it-text-ctnter" width="30%">企业名称</th>
                                            <th class="it-text-ctnter" width="30%">职位名称</th>
                                            <th class="it-text-ctnter" width="40%">申请状态</th>
                                        </tr>
                                        <c:forEach items="${requestScope.jobList}" var="apply">
                                            <tr class="tn-table-grid-row">
                                                <td class="tn-width-auto">
                                                    <a href="CompanyServlet?type=select&id=${apply.job.jobId}" target="_blank">${apply.job.company.companyName}</a>
                                                </td>
                                                <td class="tn-width-pic-mini">
                                                    <a href="JobServlet?type=select&jobid=${apply.job.jobId}" target="_blank">${apply.job.jobName}</a>
                                                </td>
                                                <td class="tn-width-category">
                                                    <div class="tn-instructions">
                                                        <div class="it-instructions-tit">
                                                            <span style="width: 26px">申请</span>
                                                            <span style="width: 120px">审核</span>
                                                            <span style="width: 120px">通知</span>
                                                        </div>
                                                        <div class=" tn-progress-bar tn-widget-content tn-corner-all">

                                                            <!-- 根据不同进度，展示不同长度进度条 -->
                                                            <c:choose>
                                                                <c:when test="${apply.applyState == 1}">
                                                                    <div style="width: 10%" class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"></div>
                                                                </c:when>
                                                                <c:when test="${apply.applyState == 2}">
                                                                    <div style="width: 50%" class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"></div>
                                                                </c:when>
                                                                <c:when test="${apply.applyState == 3}">
                                                                    <div style="width: 100%" class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"></div>
                                                                </c:when>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
