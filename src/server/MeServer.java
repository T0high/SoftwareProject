// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MeServer.java
/*
 * 实现个人信息功能，修改功能没有实现
 */
package server;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import user.user;

public class MeServer extends HttpServlet
{

    public MeServer()
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
        user user = null;
        String id1 = req.getParameter("id");
        String username1 = req.getParameter("username");
        String password1 = req.getParameter("password");
        System.out.println(id1);
        String sql = "update user set name=? ,password=? where id=?";
        try
        {
            ps = con.prepareStatement(sql);
            ps.setString(1, username1);
            ps.setString(2, password1);
            ps.setString(3, id1);
            int i = ps.executeUpdate();
            HttpSession session = req.getSession();
            if(i == 1)
            {
                System.out.println("\u63D2\u5165\u6210\u529F");
                String sql1 = "select * from user";
                ps = con.prepareStatement(sql1);
                for(rs = ps.executeQuery(); rs.next();)
                    if(rs.getString(1).equals(id1))
                    {
                        String name = rs.getString("name");
                        String password = rs.getString("password");
                        String id = rs.getString("id");
                        user = new user();
                        user.setName(name);
                        user.setId(id);
                        user.setPassword(password);
                    } else
                    {
                        resp.sendRedirect("#");
                    }

                session.setAttribute("user", user);
                System.out.println("\u4FEE\u6539\u6210\u529F");
                resp.sendRedirect("m-e.jsp");
            }
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
