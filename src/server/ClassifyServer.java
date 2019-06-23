// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ClassifyServer.java
/*
 * 根据分类jsp传过来的值去数据表查找相应数据并返回结果到对应界面
 */
package server;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ClassifyServer extends HttpServlet
{

    public ClassifyServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        int count = 1;
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        Connection con = DbConnect.getConnection();
        PreparedStatement ps = null;
        ResultSet rst = null;
        String value = req.getParameter("value");
        System.out.println(value);
        String sql = (new StringBuilder("select testname,testpath from tests5 where testname like'%")).append(value).append("%'").toString();
        try
        {
            ps = con.prepareStatement(sql);
            rst = ps.executeQuery();
            rst.beforeFirst();
            if(rst.next())
            {
                count++;
                resp.sendRedirect("classify-search.jsp");
                System.out.println(count);
            } else
            {
                resp.sendRedirect("classifyno.jsp");
            }
            HttpSession session = req.getSession();
            session.setAttribute("rst", rst);
        }
        catch(SQLException e)
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
