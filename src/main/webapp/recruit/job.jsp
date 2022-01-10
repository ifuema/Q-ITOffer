<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/16
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="../error.jsp" %>
<html>
<head>
    <title>职位详情展示</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/job.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>
<div class="it-grid"align="center">
    <div class="bottomban">
        <div class="bottombanbox">
            <a href="CompanyServlet?type=select&id=${requestScope.company.companyId}">
                <img src="recruit/images/${requestScope.company.companyPic}" alt="" style="display: block; margin: auto; max-height: 272.21px; max-width: 980px; width: auto">
            </a>
        </div>
    </div>
</div>
<div class="tn-grid">
    <div class="tn-box-content">
        <div class="it-main">
            <div class="it-ctn-heading">
                <div class="it-title-line">
                    <h3>${requestScope.job.jobName}</h3>
                </div>
            </div>
            <div class="job">
                <table class="it-table" style="width: 700px">
                    <tbody>
                        <tr>
                            <td class="it-table-title">招聘人数：</td>
                            <td class="tn-border-rb">${requestScope.job.jobHiringnum}人</td>
                            <td class="it-table-title">薪资：</td>
                            <td class="tn-border-rb">${requestScope.job.jobSalary}</td>
                        </tr>
                        <tr>
                            <td class="it-table-title">工作地区：</td>
                            <td class="tn-border-rb">${requestScope.job.jobArea}</td>
                            <td class="it-table-title">结束日期：</td>
                            <td class="tn-border-rb">${requestScope.job.jobEnddate}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="it-post-count">
                    <div class="it-com-apply">
                        <a href="JobApplyServlet?type=apply&jobid=${requestScope.job.jobId}" title="申请职位" class="tn-button2 it-smallbutton-apply-hover"></a>
                    </div>
                    <ul class="tn-text-note it-text-part">
                        <li class="jobli">
                            <span class="tn-explain-icon">
                                <span class="tn-icon-text">
                                    招聘人数
                                    <span class="it-font-cor">
                                        ${requestScope.job.jobHiringnum}
                                    </span>
                                    人
                                </span>
                            </span>
                        </li>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="it-post-text">
                    <p>
                        ${requestScope.job.jobDesc}
                    </p>
                </div>
                <div class="btn_bot">
                    <a href="CompanyServlet?type=select&id=${requestScope.company.companyId}" class="tn-button-secondary">
                        <span class="tn-button-text" style="color: #1faebc">查看公司信息</span>
                    </a>
                    <a href="JobApplyServlet?type=apply&jobid=${requestScope.job.jobId}" class="tn-button-secondary">
                        <span class="tn-button-text" style="color: #1faebc">申请职位</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
