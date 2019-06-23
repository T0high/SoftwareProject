// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManagerLoginServer.java
/*
 * 管理员登录服务
 */
package server;

import db.DbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ManagerLoginServer extends HttpServlet
{

    public ManagerLoginServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        String managername = req.getParameter("managername");
        String password = req.getParameter("password");
        Connection con = DbConnect.getConnection();
        String sql = (new StringBuilder("select * from manager where managername='")).append(managername).append("'").toString();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            HttpSession session = req.getSession();
            session.setAttribute("rs", rs);
            if(rs.next())
                if(rs.getString("managername").equals(managername) & rs.getString("password").equals(password))
                    resp.sendRedirect("managepage.jsp");
                else
                    resp.sendRedirect("managerloginerror.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
