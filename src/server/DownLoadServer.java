// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DownLoadServer.java
/*
 * 下载服务。从上传的存储文件里提取数据，开始下载。并存储数据给下载历史记录
 */
package server;

import db.DbConnect;
import java.io.*;
import java.net.URLEncoder;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import user.user;

public class DownLoadServer extends HttpServlet
{

    public DownLoadServer()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String fileName = request.getParameter("filename");
        String realfilename = fileName.substring(fileName.lastIndexOf("_") + 1);
        String fileSaveRootPath = getServletContext().getRealPath("/WEB-INF/upload");
        String path = findFileSavePathByFileName(fileName, fileSaveRootPath);
        File file = new File((new StringBuilder(String.valueOf(path))).append("\\").append(fileName).toString());
        user u = (user)request.getSession().getAttribute("user");
        String username = u.getName();
        Connection con = DbConnect.getConnection();
        PreparedStatement pst = null;
        String sql = "insert into downhistory(username,testname) values(?,?)";
        try
        {
            pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, realfilename);
            int i = pst.executeUpdate();
            if(i == 1)
                System.out.println("插入成功！");
            else
                System.out.println("插入失败！");
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        if(!file.exists())
        {
            request.setAttribute("message", "您要下载的资源已被删除！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        String realname = fileName.substring(fileName.indexOf("_") + 1);
        response.setHeader("content-disposition", (new StringBuilder("attachment;filename=")).append(URLEncoder.encode(realname, "UTF-8")).toString());
        FileInputStream in = new FileInputStream((new StringBuilder(String.valueOf(path))).append("\\").append(fileName).toString());
        OutputStream out = response.getOutputStream();
        byte buffer[] = new byte[1024];
        for(int len = 0; (len = in.read(buffer)) > 0;)
            out.write(buffer, 0, len);

        in.close();
        out.close();
    }

    public String findFileSavePathByFileName(String filename, String saveRootPath)
    {
        int hashcode = filename.hashCode();
        int dir1 = hashcode & 0xf;
        int dir2 = (hashcode & 0xf0) >> 4;
        String dir = (new StringBuilder(String.valueOf(saveRootPath))).append("\\").append(dir1).append("\\").append(dir2).toString();
        File file = new File(dir);
        if(!file.exists())
            file.mkdirs();
        return dir;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doGet(request, response);
    }
}
