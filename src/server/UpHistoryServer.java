// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UpHistoryServer.java
/*
 * 上传历史服务
 */
package server;

import db.DbConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import user.user;

public class UpHistoryServer extends HttpServlet
{

    public UpHistoryServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        Connection con = DbConnect.getConnection();
        user u1 = (user)req.getSession().getAttribute("user");
        String username1 = u1.getName();
        PreparedStatement ps = null;
        ResultSet rs1 = null;
        String sql = (new StringBuilder("select id,testname from uphistory where username='")).append(username1).append("'").toString();
        try
        {
            ps = con.prepareStatement(sql);
            rs1 = ps.executeQuery();
            HttpSession session = req.getSession();
            session.setAttribute("rs1", rs1);
            resp.sendRedirect("uphistory.jsp");
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
