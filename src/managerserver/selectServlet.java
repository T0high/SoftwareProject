// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   selectServlet.java
/*
 * 根据传过来的值查找对应的的数据表并显示
 */

package managerserver;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class selectServlet extends HttpServlet
{

    public selectServlet()
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
        String type = req.getParameter("table");
        PreparedStatement ps = null;
        ResultSet rs = null;
        if("table_T".equals(type))
            try
            {
                String id = req.getParameter("id");
                String sql_t = "select id,username,testname from tests5 where id=?";
                System.out.println(id);
                ps = con.prepareStatement(sql_t);
                ps.setInt(1, Integer.parseInt(id));
                rs = ps.executeQuery();
                HttpSession session = req.getSession();
                session.setAttribute("rs", rs);
                for(; rs.next(); resp.sendRedirect("testsEdit.jsp"))
                {
                    String username = rs.getString("username");
                    System.out.println((new StringBuilder(String.valueOf(username))).append(id).toString());
                    String testname = rs.getString("testname");
                }

            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        else
        if("table_UM".equals(type))
            try
            {
                String id = req.getParameter("id");
                String name = req.getParameter("name");
                String password = req.getParameter("password");
                String sql_um = "select * from user where id=?";
                ps = con.prepareStatement(sql_um);
                ps.setString(1, id);
                rs = ps.executeQuery();
                HttpSession session = req.getSession();
                session.setAttribute("rs", rs);
                resp.sendRedirect("usersEdit.jsp");
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
