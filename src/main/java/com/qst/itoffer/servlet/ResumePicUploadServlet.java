package com.qst.itoffer.servlet;

import com.qst.itoffer.dao.ResumeDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "ResumePicUploadServlet", value = "/ResumePicUploadServlet")
//该注解提供了对于方便解析包含文件的servlet请求的支持
@MultipartConfig

public class ResumePicUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求和相应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用selvlet提供的Part对象对上传的文件进行操作
        Part part = request.getPart("headShot");
        //获取上传的文件名
        String fileName = part.getSubmittedFileName();
        //获取系统时间的毫秒
        //将文件名从最后一次出现.的索引处开始构建一个子字符串
        //将毫秒与构建的文件后缀拼接成新的文件名
        String newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
        //用给定路径构建一个当前应用部署在文件系统中的真实绝对路径下的虚拟路径
        String filepath = getServletContext().getRealPath("/applicant/images");

        System.out.println("头像保存路径为：" + filepath);
        //使用构造的虚拟路径构建一个File类型
        File f = new File(filepath);
        //若目录不存在则创建目录
        if (!f.exists()) {
            f.mkdirs();
        }

        try {
            //从session获取简历id
            int resumeID = (Integer) request.getSession().getAttribute("SESSION_RESUMEID");
            //将上传文件重命名并写入到给定路径
            part.write(filepath + "/" + newFileName);
            //更新简历照片
            ResumeDao dao = new ResumeDao();
            dao.updateHeadShot(resumeID, newFileName);
            //照片更新成功，回到我的简历界面
            response.sendRedirect("ResumeBasicinfoServlet?type=select");
        } catch (NullPointerException e) {
            //若暂无简历则跳转到简历添加界面
            response.sendRedirect("applicant/resumeBasicInfoAdd.jsp");
        }
    }
}
