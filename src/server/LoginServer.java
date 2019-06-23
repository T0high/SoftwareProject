// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LoginServer.java
/*
 * 用户登录服务
 */
package server;

import MessageDao.messagedao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import user.user;

public class LoginServer extends HttpServlet
{

    public LoginServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        messagedao loginDao = new messagedao();
        HttpSession session = req.getSession();
        user l = (user)session.getAttribute("user");
        if(l == null)
            l = loginDao.checkLogin(req.getParameter("id"), req.getParameter("password"));
        if(l != null)
        {
            session.setAttribute("user", l);
            java.util.ArrayList al = loginDao.findMbInfo();
            session.setAttribute("al", al);
            resp.sendRedirect("loginsuccess.jsp");
        } else
        {
            resp.sendRedirect("loginerror.jsp");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
