// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   editServlet.java
/*
 * 根据传过来的值，辨别修改那张表，修改表中数据
 */
package managerserver;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class editServlet extends HttpServlet
{

    public editServlet()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        Connection con = DbConnect.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String type = req.getParameter("type");
        System.out.println(type);
        if("table_t".equals(type))
        {
            int id = Integer.parseInt(req.getParameter("id"));
            String username = req.getParameter("username");
            String testname = req.getParameter("testname");
            System.out.println(id);
            String sql = "update tests5 set username=?,testname=? where id=?";
            try
            {
                ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, testname);
                ps.setInt(3, id);
                int i = ps.executeUpdate();
                HttpSession session = req.getSession();
                if(i == 1)
                {
                    String sql1 = "select * from tests5";
                    ps = con.prepareStatement(sql1);
                    rs = ps.executeQuery();
                    session.setAttribute("rs", rs);
                    System.out.println("\u4FEE\u6539\u6210\u529F");
                    resp.sendRedirect("managepage.jsp");
                } else
                {
                    resp.sendRedirect("#");
                }
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        } else
        if("table_um".equals(type))
        {
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            System.out.println(name);
            String sql = "update user set name=?,password=? where id=?";
            try
            {
                ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, password);
                ps.setString(3, id);
                int i = ps.executeUpdate();
                HttpSession session = req.getSession();
                if(i == 1)
                {
                    String sql1 = "select * from user";
                    ps = con.prepareStatement(sql1);
                    rs = ps.executeQuery();
                    session.setAttribute("rs", rs);
                    System.out.println("\u4FEE\u6539\u6210\u529F");
                    resp.sendRedirect("managepage.jsp");
                } else
                {
                    resp.sendRedirect("#");
                }
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
