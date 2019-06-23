// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SearchServer.java
/*
 * 实现收搜索功能
 */
package server;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SearchServer extends HttpServlet
{

    public SearchServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        String searchmessage = req.getParameter("searchmessage");
        System.out.println(searchmessage);
        Connection con = DbConnect.getConnection();
        String sql = (new StringBuilder("select testname,testpath from tests5 where testname like'%")).append(searchmessage).append("%'").toString();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            HttpSession session = req.getSession();
            session.setAttribute("rs", rs);
            resp.sendRedirect("searchgathering.jsp");
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
