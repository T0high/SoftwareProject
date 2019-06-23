// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LeaveMessageServer.java
/*
 * 留言服务
 */
package server;

import MessageBoard.Messages;
import MessageDao.messagedao;
import java.io.*;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import user.user;

public class LeaveMessageServer extends HttpServlet
{

    public LeaveMessageServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        String title = req.getParameter("title");
        String message = req.getParameter("message");
        System.out.println(title);
        System.out.println(message);
        user leaveMessageBoard = (user)req.getSession().getAttribute("user");
        Messages mb = new Messages();
        mb.setId(leaveMessageBoard.getId());
        mb.setName(leaveMessageBoard.getName());
        mb.setTime(new Date(System.currentTimeMillis()));
        mb.setTitle(title);
        mb.setMessage(message);
        if((new messagedao()).addInfo(mb))
            resp.sendRedirect("leavesuccess.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
