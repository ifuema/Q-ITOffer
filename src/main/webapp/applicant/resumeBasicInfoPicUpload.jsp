<%--
  Created by IntelliJ IDEA.
  User: y3bpc
  Date: 2021/11/28
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简历基本信息 - 锐聘网</title>
    <link href="../css/base.css" type="text/css" rel="stylesheet">
    <link href="../css/resume.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        //验证头像不为空
        function validate() {
            var headShot = document.getElementById("headShot");
            if (headShot.value == ""){
                alert("请上传要选择的头像！");
                headShot.focus();
                return false;
            }
        }
    </script>
</head>
<body>

<!-- 使用动态包含头文件 -->
<div width="100%" height="100">
    <jsp:include page="../top.jsp"></jsp:include>
</div>

<!-- 简历照片页面 开始 -->
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
                <div style="float: left;">简历照片</div>
            </div>
            <div class="all_resume">

                <!-- 简历照片修改，设置提交信息类型为文件类型 -->
                <form action="ResumePicUploadServlet" method="post" enctype="multipart/form-data" onsubmit="return validate()">
                    <div class="table_style" style="margin-left: 93.6px;">
                        <div class="uploade" style="width: 252.8px; float: none">
                            <div align="center">
                                <img src="images/anonymous.png" width="150" height="150" alt="">
                                <br><br>
                                <input type="file" name="headShot" id="headShot" value="上传照片" style="width: 167.31px">
                            </div>
                        </div>
                        <br>
                        <div align="center">
                            <input type="submit" class="save1" value="保存">
                            <input type="reset" class="cancel2" value="取消">
                        </div>
                    </div>
                </form>
                <!-- 简历照片修改 结束 -->
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
