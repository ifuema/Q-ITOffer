package com.qst.itoffer.servlet;

import com.qst.itoffer.dao.ApplicantDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ApplicantRegisterServlet", value = "/ApplicantRegisterServlet")
public class ApplicantRegisterServlet extends HttpServlet {
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
        String verifyCode = request.getParameter("verifyCode");
        //判断验证码是否正确
        String sessionValidateCode = (String)request.getSession().getAttribute("SESSION_VALIDATECODE");
        if(!sessionValidateCode.equals(verifyCode)){
            out.print("<script type='text/javascript'>");
            out.print("alert('请正确输入验证码！');");
            out.print("window.location='register.jsp';");
            out.print("</script>");
        }else {
            //判断邮箱是否被注册
            ApplicantDao dao = new ApplicantDao();
            boolean flag = dao.isExistEmail(email);
            if (flag) {
                out.print("<script type = 'text/javascript'>");
                out.print("alert('邮箱已被注册，请重新输入！');");
                out.print("window.location = 'register.jsp';");
                out.print("</script>");
            } else {
                //邮箱未被注册，保存注册用户信息
                dao.save(email, password);
                //注册成功重定向到登陆页面
                response.sendRedirect("login.jsp");
            }
        }
    }
}
