<%@ page import="com.qst.itoffer.bean.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qst.itoffer.bean.Job" %><%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/7
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="../error.jsp" %>
<html>
<head>
    <title>企业信息展示</title>
    <link href="css/base.css" type="text/css" rel="stylesheet">
    <link href="css/company.css" type="text/css" rel="stylesheet">
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>

<!-- 从request域中获得公司和职位信息 -->
<%
    Company company = (Company) request.getAttribute("company");
    List<Job> joblist = (List<Job>) request.getAttribute("joblist");
%>
<div class="it-grid">
    <div class="bottomban">
        <div class="bottombanbox">
            <img src="recruit/images/<%=company.getCompanyPic()%>" alt="" style="display: block; margin: auto; max-height: 272.21px; max-width: 980px; width: auto">
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="tn-grid">
    <div class="tn-widget-content">
        <div class="tn-box-content">
            <div class="tn-helper-clearfix">
                <div class="it-main2">
                    <div class="it-ctn-heading">
                        <div class="it-title-line">
                            <span>
                                <em>
                                    <%=company.getCompanyViewnum()%>
                                </em>
                                浏览
                            </span>
                            <h3>企业简介</h3>
                        </div>
                    </div>
                    <div class="it-com-textnote">
                        <span class="kuai">所在地：<%=company.getCompanyArea()%></span>
                        <span class="kuai">规模：<%=company.getCompanySize()%></span>
                        <span class="kuai">性质：<%=company.getCompanyType()%></span>
                    </div>
                    <div class="it-company-text">
                        <p class="p1" style="padding-left: 30px">
                            <span style="line-height: 1.5; font-size: 14px">
                                <%=company.getCompanyBrief()%>
                            </span>
                        </p>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="it-content-seqbox">
        <div id="morejob">
            <div class="it-ctn-heading">
                <div class="it-title-line">
                    <h3>职位</h3>
                </div>
            </div>

            <!-- 职位列表 -->
            <%
                if (joblist != null) {
                    for (Job job : joblist) {
            %>
            <div class="it-post-box tn-border-dashed">
                <div class="it-post-name">
                    <div class="tn-helper-right it-post-btn">
                        <a href="JobServlet?type=select&jobid=<%=job.getJobId()%>" class="it-font-underline">
                            <span class="tn-action-text">查看详细</span>
                        </a>
                        <a href="JobApplyServlet?type=apply&jobid=<%=job.getJobId()%>" class="tn-button-small">
                            <span class="tn-button-text">申请</span>
                        </a>
                    </div>
                    <h3>
                        <a href="JobServlet?type=select&jobid=<%=job.getJobId()%>">
                            <%=job.getJobName()%>
                        </a>
                    </h3>
                </div>
                <ul class="it-post">
                    <li style="width: 300px">
                        薪资：
                        <span class="it-font-size">
                        <%=job.getJobSalary()%>
                    </span>
                    </li>
                    <li style="width: 250px">
                        <span class="tn-text-note">工作地区：</span>
                        <label>
                            <%=job.getJobArea()%>
                        </label>
                    </li>
                    <li>
                        <span class="tn-text-note">招聘人数：</span>
                        <%=job.getJobHiringnum()%>
                    </li>
                    <li>
                        <span class="tn-text-note">结束日期：</span>
                        <%=job.getJobEnddate()%>
                    </li>
                </ul>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"></iframe>
</body>
</html>
