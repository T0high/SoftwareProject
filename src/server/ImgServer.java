// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ImgServer.java
/*
 *没 有实现，不管
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

public class ImgServer extends HttpServlet
{

    public ImgServer()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        String savePath;
        File tmpFile;
        String message;
        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        savePath = getServletContext().getRealPath("/images/userimg");
        String tempPath = getServletContext().getRealPath("/images/temp1");
        tmpFile = new File(tempPath);
        if(!tmpFile.exists())
            tmpFile.mkdir();
        message = "";
        ServletFileUpload upload;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(0x40000000);
        factory.setRepository(tmpFile);
        upload = new ServletFileUpload(factory);
        upload.setProgressListener(new ProgressListener() {

            public void update(long pBytesRead, long pContentLength, int arg2)
            {
                System.out.println((new StringBuilder("\u6587\u4EF6\u5927\u5C0F\u4E3A\uFF1A")).append(pContentLength).append(",\u5F53\u524D\u5DF2\u5904\u7406\uFF1A").append(pBytesRead).toString());
            }

            final ImgServer this$0;

            
            {
                this$0 = ImgServer.this;
             //   super();
            }
        }
);
        upload.setHeaderEncoding("UTF-8");
        if(!ServletFileUpload.isMultipartContent(req))
            return;
        try
        {
            upload.setFileSizeMax(0x40000000L);
            upload.setSizeMax(0x40000000L);
            List list = upload.parseRequest(req);
            for(Iterator iterator = list.iterator(); iterator.hasNext();)
            {
                FileItem item = (FileItem)iterator.next();
                if(item.isFormField())
                {
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    System.out.println((new StringBuilder(String.valueOf(name))).append("=").append(value).append("_").append(1).toString());
                } else
                {
                    String filename1 = item.getName();
                    System.out.println(filename1);
                    if(filename1 != null && !filename1.trim().equals(""))
                    {
                        String filename = filename1.substring(filename1.lastIndexOf("\\") + 1);
                        System.out.println(filename);
                        String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
                        System.out.println((new StringBuilder("\u4E0A\u4F20\u7684\u6587\u4EF6\u7684\u6269\u5C55\u540D\u662F\uFF1A")).append(fileExtName).toString());
                        InputStream in = item.getInputStream();
                        String saveFilename = makeFileName(filename);
                        String realSavePath = makePath(saveFilename, savePath);
                        user u = (user)req.getSession().getAttribute("user");
                        String id = u.getId();
                        String username = u.getName();
                        String password = u.getPassword();
                        System.out.println((new StringBuilder(String.valueOf(id))).append(username).append(password).toString());
                        System.out.println((new StringBuilder(String.valueOf(filename))).append(saveFilename).append(realSavePath).append("U+").toString());
                        String absolutefilepath = (new StringBuilder(String.valueOf(realSavePath))).append("\\").append(saveFilename).toString();
                        Connection con = DbConnect.getConnection();
                        PreparedStatement pst = null;
                        ResultSet rs = null;
                        List list1 = new ArrayList();
                        String sql = "insert into userimg(id,name,password,imgpath) values(?,?,?,?)";
                        try
                        {
                            pst = con.prepareStatement(sql);
                            pst.setString(1, id);
                            pst.setString(2, username);
                            pst.setString(3, password);
                            pst.setString(4, absolutefilepath);
                            int i = pst.executeUpdate();
                            HttpSession session = req.getSession();
                            if(i == 1)
                            {
                                System.out.println("\u63D2\u5165\u6210\u529F");
                                String sqll = "select * from userimg where name=?";
                                pst = con.prepareStatement(sqll);
                                pst.setString(1, username);
                                for(rs = pst.executeQuery(); rs.next();)
                                {
                                    String imgpethfrommysql = rs.getString("imgpath");
                                    String frommysqlfilenam = rs.getString("imgpath").substring(rs.getString("imgpath").lastIndexOf("_") + 1);
                                    if(filename.equals(frommysqlfilenam))
                                    {
                                        String searchpath = imgpethfrommysql.substring(imgpethfrommysql.indexOf("OnlyTest4") + 10);
                                        System.out.println(searchpath);
                                        searchpath = searchpath.replaceAll("\\\\", "/");
                                        searchpath = (new StringBuilder("./")).append(searchpath).toString();
                                        System.out.println(searchpath);
                                        list1.add(searchpath);
                                        System.out.println(searchpath);
                                    }
                                }

                                session.setAttribute("list1", list1);
                                for(int jj = 0; jj < list1.size(); jj++)
                                    System.out.println((new StringBuilder("Index: ")).append(jj).append(" - Item: ").append((String)list1.get(jj)).toString());

                                resp.sendRedirect("imgshow2.jsp");
                            } else
                            {
                                System.out.println("\u63D2\u5165\u5931\u8D25");
                            }
                        }
                        catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
                        FileOutputStream out = new FileOutputStream((new StringBuilder(String.valueOf(realSavePath))).append("\\").append(saveFilename).toString());
                        byte buffer[] = new byte[1024];
                        for(int len = 0; (len = in.read(buffer)) > 0;)
                            out.write(buffer, 0, len);

                        in.close();
                        out.close();
                        System.out.println("\u6587\u4EF6\u4E0A\u4F20\u6210\u529F\uFF01");
                    }
                }
            }

        }
        catch(org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException e)
        {
            e.printStackTrace();
            req.setAttribute("message", "\u5355\u4E2A\u6587\u4EF6\u8D85\u51FA\u6700\u5927\u503C\uFF01\uFF01\uFF01");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }
        catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e)
        {
            e.printStackTrace();
            req.setAttribute("message", "\u4E0A\u4F20\u6587\u4EF6\u7684\u603B\u7684\u5927\u5C0F\u8D85\u51FA\u9650\u5236\u7684\u6700\u5927\u503C\uFF01\uFF01\uFF01");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }
        catch(Exception e)
        {
            message = "\u6587\u4EF6\u4E0A\u4F20\u5931\u8D25\uFF01";
            e.printStackTrace();
        }
        req.setAttribute("message", message);
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
