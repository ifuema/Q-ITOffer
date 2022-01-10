package com.qst.itoffer.servlet;

import com.qst.itoffer.bean.Applicant;
import com.qst.itoffer.bean.JobApply;
import com.qst.itoffer.dao.JobApplyDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "JobApplyServlet", value = "/JobApplyServlet")
public class JobApplyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作类型
        String type = request.getParameter("type");

        HttpSession session = request.getSession();
        if ("apply".equals(type)) {
            //获取职位编号
            String jobid = request.getParameter("jobid");
            //获取登录用户
            Applicant applicant = (Applicant) session.getAttribute("SESSION_APPLICANT");
            //添加对此用户对此职位的申请
            JobApplyDao dao = new JobApplyDao();
            try {
                dao.save(jobid, applicant.getApplicantId());
                response.sendRedirect("JobApplyServlet?type=myapply");
            } catch (NullPointerException e) {
                //若未登录则跳转到登陆页面
                response.sendRedirect("login.jsp");
            }
        }
        if ("myapply".equals(type)) {
            //获取登录用户
            Applicant applicant = (Applicant) session.getAttribute("SESSION_APPLICANT");
            //根据用户标识查询此用户申请的所有职位
            JobApplyDao dao = new JobApplyDao();
            List<JobApply> jobList = dao.getJobApplyList(applicant.getApplicantId());
            //将查询到的职位存入request对象
            request.setAttribute("jobList", jobList);
            //请求转发到职位展示页面
            request.getRequestDispatcher("applicant/jobApply.jsp").forward(request, response);
        }
    }
}
