// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UpServer.java
/*
 * 上传服务。上传到服务器文件。
 */
package server;

import db.DbConnect;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import user.user;

public class UpServer extends HttpServlet
{

    public UpServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        String savePath;
        File tmpFile;
        String message;
        savePath = getServletContext().getRealPath("/WEB-INF/upload");
        String tempPath = getServletContext().getRealPath("/WEB-INF/temp");
        tmpFile = new File(tempPath);
        if(!tmpFile.exists())
            tmpFile.mkdir();
        message = "";
        ServletFileUpload upload;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024*1024*100);
        factory.setRepository(tmpFile);
        upload = new ServletFileUpload(factory);
        upload.setProgressListener(new ProgressListener() {

            public void update(long pBytesRead, long pContentLength, int arg2)
            {
                System.out.println((new StringBuilder("文件大小为:")).append(pContentLength).append(",当前已处理:").append(pBytesRead).toString());
            
            }
        }
);
        upload.setHeaderEncoding("UTF-8");
        if(!ServletFileUpload.isMultipartContent(req))
            return;
        try
        {
        	//设置上传单个文件的大小的最大值，目前是设置为1024*1024*1024字节，也就是1GB
        	upload.setFileSizeMax(1024*1024*1024);
        	//设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为1GB
            upload.setSizeMax(1024*1024*1024);
            List list = upload.parseRequest(req);
            for(Iterator iterator = list.iterator(); iterator.hasNext();)
            {
                FileItem item = (FileItem)iterator.next();
                if(item.isFormField())
                {
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    System.out.println((new StringBuilder(String.valueOf(name))).append("=").append(value).toString());
                } else
                {
                    String filename = item.getName();
                    System.out.println(filename);
                    if(filename != null && !filename.trim().equals(""))
                    {
                        filename = filename.substring(filename.lastIndexOf("\\") + 1);
                        System.out.println(filename);
                        String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
                        System.out.println((new StringBuilder("上传文件的扩展名是:")).append(fileExtName).toString());
                        InputStream in = item.getInputStream();
                        String saveFilename = makeFileName(filename);
                        String realSavePath = makePath(saveFilename, savePath);
                        user u = (user)req.getSession().getAttribute("user");
                        String username = u.getName();
                        System.out.println((new StringBuilder(String.valueOf(filename))).append(saveFilename).append(realSavePath).append("U+").toString());
                        String absolutefilepath = (new StringBuilder(String.valueOf(realSavePath))).append("\\").append(saveFilename).toString();
                        Connection con = DbConnect.getConnection();
                        PreparedStatement pst = null;
                        String sql = "insert into tests5(username,testname,testpath) values(?,?,?)";
                        try
                        {
                            pst = con.prepareStatement(sql);
                            pst.setString(1, username);
                            pst.setString(2, filename);
                            pst.setString(3, absolutefilepath);
                            int i = pst.executeUpdate();
                            if(i == 1)
                                System.out.println("上传成功!");
                            else
                                System.out.println("上传失败!");
                        }
                        catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
                        String sql1 = "insert into uphistory(username,testname) values(?,?)";
                        PreparedStatement ps1 = null;
                        ps1 = con.prepareStatement(sql1);
                        ps1.setString(1, username);
                        ps1.setString(2, filename);
                        int j = ps1.executeUpdate();
                        if(j == 1)
                            System.out.println("插入成功!");
                        else
                            System.out.println("插入失败!");
                        FileOutputStream out = new FileOutputStream((new StringBuilder(String.valueOf(realSavePath))).append("\\").append(saveFilename).toString());
                        byte buffer[] = new byte[1024];
                        for(int len = 0; (len = in.read(buffer)) > 0;)
                            out.write(buffer, 0, len);

                        in.close();
                        out.close();
                        message = "文件上传成功！";
                    }
                }
            }

        }
        catch(org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException e)
        {
            e.printStackTrace();
            req.setAttribute("message", "单个文件超出最大值！！！");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }
        catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e)
        {
            e.printStackTrace();
            req.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }
        catch(Exception e)
        {
            message = "文件上传失败！";
            e.printStackTrace();
        }
        req.setAttribute("message", message);
        req.getRequestDispatcher("/message.jsp").forward(req, resp);
        return;
    }

    private String makeFileName(String filename)
    {
        return (new StringBuilder(String.valueOf(UUID.randomUUID().toString()))).append("_").append(filename).toString();
    }

    private String makePath(String filename, String savePath)
    {
        int hashcode = filename.hashCode();
        int dir1 = hashcode & 0xf;
        int dir2 = (hashcode & 0xf0) >> 4;
        String dir = (new StringBuilder(String.valueOf(savePath))).append("\\").append(dir1).append("\\").append(dir2).toString();
        File file = new File(dir);
        if(!file.exists())
            file.mkdirs();
        return dir;
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

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
