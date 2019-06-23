// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UphistoryDeleteServer.java
/*
 * 上传历史删除服务
 */
package server;

import db.DbConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UphistoryDeleteServer extends HttpServlet
{

    public UphistoryDeleteServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String sql = "delete from uphistory where id=?";
        Connection con = DbConnect.getConnection();
        PreparedStatement ps = null;
        ResultSet rs1 = null;
        HttpSession session = req.getSession();
        try
        {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if(i == 1)
            {
                String sql1 = "Select id,testname from uphistory";
                ps = con.prepareStatement(sql1);
                rs1 = ps.executeQuery();
                session.setAttribute("rs1", rs1);
                resp.sendRedirect("uphistory.jsp");
            } else
            {
                resp.sendRedirect("error.jsp");
            }
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
