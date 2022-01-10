package com.qst.itoffer.servlet;

import com.qst.itoffer.bean.Job;
import com.qst.itoffer.dao.JobDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "JobServlet", value = "/JobServlet")
public class JobServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作类型
        String type = request.getParameter("type");

        if ("select".equals(type)) {
            //获取职位编号
            String jobid = request.getParameter("jobid");
            //根据职位编号查询职位详细信息
            JobDao dao = new JobDao();
            Job job = dao.getJobByID(jobid);
            //将职位信息存入request对象
            request.setAttribute("job", job);
            //将企业信息存入request对象
            request.setAttribute("company", job.getCompany());
            //请求转发到职位详情展示页面
            request.getRequestDispatcher("recruit/job.jsp").forward(request, response);
        }
    }
}
