package com.qst.itoffer.servlet;

import com.qst.itoffer.bean.Company;
import com.qst.itoffer.bean.Job;
import com.qst.itoffer.dao.CompanyDao;
import com.qst.itoffer.dao.JobDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CompanyServlet", value = "/CompanyServlet")
public class CompanyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取对企业信息处理的请求类型
        String type = request.getParameter("type");

        if ("select".equals(type)) {
            //获取请求查询的企业编号
            String companyID = request.getParameter("id");
            //根据编号查询企业详细信息
            CompanyDao dao = new CompanyDao();
            Company company = dao.getCompanyByID(companyID);
            //将请求到的企业信息存入request请求域
            request.setAttribute("company", company);
            //根据企业编号查询企业的所有招聘职位
            JobDao jobdao = new JobDao();
            List<Job> jobList = jobdao.getJobListByCompanyID(companyID);
            //将查询到的职位列表存入request请求域
            request.setAttribute("joblist", jobList);
            //请求转发到企业详情页面
            request.getRequestDispatcher("recruit/company.jsp").forward(request, response);
        }
    }
}
