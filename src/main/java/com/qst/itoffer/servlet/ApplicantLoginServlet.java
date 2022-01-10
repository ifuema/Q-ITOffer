package com.qst.itoffer.servlet;

import com.qst.itoffer.bean.Applicant;
import com.qst.itoffer.dao.ApplicantDao;
import com.qst.itoffer.util.CookieEncryptTool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ApplicantLoginServlet", value = "/ApplicantLoginServlet")
public class ApplicantLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求和相应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        //获取请求参数
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        //登录验证
        ApplicantDao dao = new ApplicantDao();
        int applicantID = dao.login(email, password);
        if (applicantID != 0) {
            //用户登录成功，将求职者信息封装存入session
            Applicant applicant = new Applicant(applicantID, email, password);
            HttpSession session = request.getSession();
            session.setAttribute("SESSION_APPLICANT", applicant);
            //进行记住登录信息操作
            rememberMe(rememberMe, email, password, request, response);
            //判断是否已有简历
            int resumeID = dao.isExistResume(applicantID);
            if (resumeID != 0) {
                //若简历已存在则将用户id保存到session并跳转到首页
                session.setAttribute("SESSION_RESUMEID", resumeID);
                response.sendRedirect("index.jsp");
            } else {
                //若无简历则跳转到向导页面
                response.sendRedirect("applicant/resumeGuide.jsp");
            }
        } else {
            //若用户登录信息错误则给出提示
            out.print("<script type = 'text/javascript'>");
            out.print("alert('用户名或密码错误，请重新输入！');");
            out.print("window.location = 'login.jsp';");
            out.print("</script>");
        }
    }

    private void rememberMe(String rememberMe, String email, String password, HttpServletRequest request, HttpServletResponse response) {
        //判断是否需要记住邮箱和密码
        if ("true".equals(rememberMe)) {
            //用加密的邮箱创建一个cookie
            Cookie cookie = new Cookie("COOKIE_APPLICANTEMAIL", CookieEncryptTool.encodeBase64(email));
            //设置cookie存活时间
            cookie.setMaxAge(365 * 24 * 3600);
            //向客户端响应cookie
            response.addCookie(cookie);
            //用加密的密码创建一个cookie
            cookie = new Cookie("COOKIE_APPLICANTPWD", CookieEncryptTool.encodeBase64(password));

            cookie.setMaxAge(365 * 24 * 3600);
            response.addCookie(cookie);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("COOKIE_APPLICANTEMAIL".equals(cookie.getName()) || "COOKIE_APPLICANTPWD".equals(cookie.getName())) {
                        //将存有邮箱和密码的cookie删除
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
        }
    }
}
