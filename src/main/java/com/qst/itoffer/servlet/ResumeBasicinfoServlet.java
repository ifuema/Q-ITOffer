package com.qst.itoffer.servlet;

import com.qst.itoffer.bean.Applicant;
import com.qst.itoffer.bean.ResumeBasicinfo;
import com.qst.itoffer.dao.ResumeDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ResumeBasicinfoServlet", value = "/ResumeBasicinfoServlet")
public class ResumeBasicinfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求和相应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取请求操作类型
        String type = request.getParameter("type");

        HttpSession session = request.getSession();
        if ("select".equals(type)) {
            //从session获取当前登录用户
            Applicant applicant = (Applicant) session.getAttribute("SESSION_APPLICANT");
            //调用dao层，根据用户id查询简历信息
            ResumeDao dao = new ResumeDao();
            ResumeBasicinfo basicinfo = dao.selectBasicinfoByID(applicant.getApplicantId());
            //将查询到的简历信息存入request，请求转发到我的简历页面
            request.setAttribute("basicinfo", basicinfo);
            request.getRequestDispatcher("applicant/resume.jsp").forward(request, response);
        }
        if ("updateSelect".equals(type)) {
            //从会话对象中获取当前登录用户标识
            Applicant applicant = (Applicant) session.getAttribute("SESSION_APPLICANT");
            //根据用户标识查询简历基本信息
            ResumeDao dao = new ResumeDao();
            ResumeBasicinfo basicinfo = dao.selectBasicinfoByID(applicant.getApplicantId());
            //将简历基本信息存入request对象进行请求转发
            request.setAttribute("basicinfo", basicinfo);
            request.getRequestDispatcher("applicant/resumeBasicinfoUpdate.jsp").forward(request, response);
        }
        if ("add".equals(type)) {
            //封装请求数据
            ResumeBasicinfo basicinfo = this.requestDateObj(request);
            //从session获取当前登录用户
            Applicant applicant = (Applicant) session.getAttribute("SESSION_APPLICANT");
            //将信息添加到数据库，并返回简历编号
            ResumeDao dao = new ResumeDao();
            int basicinfoID = dao.add(basicinfo, applicant.getApplicantId());
            //将简历编号存入session
            session.setAttribute("SESSION_RESUMEID", basicinfoID);
            //操作成功跳回我的简历页面
            response.sendRedirect("ResumeBasicinfoServlet?type=select");
        }
        if ("update".equals(type)) {
            request.getRequestDispatcher("applicant/resumeBasicinfoUpdate.jsp").forward(request, response);
        }
    }

    /**
     *将请求的简历数据封装成一个对象
     * @param request
     * @return
     */
    private ResumeBasicinfo requestDateObj(HttpServletRequest request) {
        ResumeBasicinfo basicinfo = null;
        //获取请求信息
        String realName = request.getParameter("realName");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String currentLoc = request.getParameter("currentLoc");
        String residentLoc = request.getParameter("residentLoc");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String jobExperience = request.getParameter("jobExperience");
        String jobIntension = request.getParameter("jobIntension");
        //将birthday转换成Date类型
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdayDate = null;
        try {
            birthdayDate = sdf.parse(birthday);
        } catch (ParseException e) {
        }
        //将将请求的简历数据封装成一个对象
        basicinfo = new ResumeBasicinfo(realName, gender, birthdayDate, currentLoc, residentLoc, telephone, email, jobIntension, jobExperience);

        return basicinfo;
    }
}
