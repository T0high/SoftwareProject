// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DownHistoryServer.java
/*
 * 从下载历史数据表中提取数据，并返回结果
 */
package server;

import db.DbConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import user.user;

public class DownHistoryServer extends HttpServlet
{

    public DownHistoryServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        Connection con = DbConnect.getConnection();
        user u1 = (user)req.getSession().getAttribute("user");
        String username1 = u1.getName();
        PreparedStatement ps = null;
        ResultSet rs2 = null;
        String sql = (new StringBuilder("select id,testname from downhistory where username='")).append(username1).append("'").toString();
        try
        {
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            HttpSession session1 = req.getSession();
            session1.setAttribute("rs2", rs2);
            resp.sendRedirect("downhistory.jsp");
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
