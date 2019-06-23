// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   RegistServer.java
/*
 * 注册服务
 */
package server;

import db.DbConnect;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import user.user;

public class RegistServer extends HttpServlet
{

    public RegistServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        String id;
        String username;
        String password;
        Connection con;
        String sql;
        id = req.getParameter("id");
        username = req.getParameter("name");
        password = req.getParameter("password");
        user u = new user();
        u.setId(id);
        u.setName(username);
        u.setPassword(password);
        con = DbConnect.getConnection();
        sql = "insert into user(id,name,password) values(?,?,?)";
        PreparedStatement ps = null;
        try
        {
        	// PreparedStatement
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.execute();
           //break MISSING_BLOCK_LABEL_168;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        resp.sendRedirect("registsuccess.jsp");
        System.out.println("注册成功!");
        //break MISSING_BLOCK_LABEL_184;
        Exception exception;
        //exception;
        //resp.sendRedirect("registsuccess.jsp");
        //System.out.println("\u6CE8\u518C\u6210\u529F!");
        //throw exception;
        //resp.sendRedirect("registsuccess.jsp");
        //System.out.println("\u6CE8\u518C\u6210\u529F!");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        super.doPost(req, resp);
    }
}
