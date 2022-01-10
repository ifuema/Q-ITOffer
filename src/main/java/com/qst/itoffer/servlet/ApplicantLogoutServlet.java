package com.qst.itoffer.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ApplicantLogoutServlet", value = "/ApplicantLogoutServlet")
public class ApplicantLogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //清除session
        request.getSession().invalidate();
        //重定向到网页首页
        response.sendRedirect("index.jsp");
    }
}
