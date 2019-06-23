// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   deleteServlet.java
/*
 * 删除服务，根据传过来的值辨别是删除哪个，然后对应数据库表删除数据
 */
package managerserver;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class deleteServlet extends HttpServlet
{

    public deleteServlet()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        Connection con = DbConnect.getConnection();
        String type = req.getParameter("table");
        PreparedStatement ps = null;
        ResultSet rs = null;
        if("table_T".equals(type))
        {
            String id = req.getParameter("id");
            String sql_t = "delete from tests5 where id=?";
            try
            {
                ps = con.prepareStatement(sql_t);
                ps.setInt(1, Integer.parseInt(id));
                int i = ps.executeUpdate();
                if(i == 1)
                {
                    String sql1 = "select * from tests5";
                    ps = con.prepareStatement(sql1);
                    rs = ps.executeQuery();
                    HttpSession session = req.getSession();
                    session.setAttribute("rs", rs);
                    System.out.println("\u5220\u9664\u6210\u529F");
                    resp.sendRedirect("managepage.jsp");
                }
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        } else
        if("table_UM".equals(type))
        {
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            String sql_t = "delete from user where id=? and name=? and password=? ";
            try
            {
                ps = con.prepareStatement(sql_t);
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, password);
                int i = ps.executeUpdate();
                if(i == 1)
                {
                    String sql1 = "select * from user";
                    ps = con.prepareStatement(sql1);
                    rs = ps.executeQuery();
                    HttpSession session = req.getSession();
                    session.setAttribute("rs", rs);
                    System.out.println("\u5220\u9664\u6210\u529F");
                    resp.sendRedirect("managepage.jsp");
                }
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        } else
        if("table_M".equals(type))
        {
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String title = req.getParameter("title");
            String message = req.getParameter("message");
            String sql_t = "delete from messages where id=? and name=? and title=? and message=? ";
            try
            {
                ps = con.prepareStatement(sql_t);
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, title);
                ps.setString(4, message);
                int i = ps.executeUpdate();
                if(i == 1)
                {
                    String sql1 = "select * from messages";
                    ps = con.prepareStatement(sql1);
                    rs = ps.executeQuery();
                    HttpSession session = req.getSession();
                    session.setAttribute("rs", rs);
                    System.out.println("\u5220\u9664\u6210\u529F");
                    resp.sendRedirect("managepage.jsp");
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
