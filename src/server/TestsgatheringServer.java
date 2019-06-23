// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TestsgatheringServer.java
/*
 * 上传文件列表服务
 */
package server;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;

public class TestsgatheringServer extends HttpServlet
{

    public TestsgatheringServer()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String uploadFilePath = getServletContext().getRealPath("/WEB-INF/upload");
        System.out.println((new StringBuilder(String.valueOf(uploadFilePath))).append("T").toString());
        Map fileNameMap = new HashMap();
        listfile(new File(uploadFilePath), fileNameMap);
        request.setAttribute("fileNameMap", fileNameMap);
        request.getRequestDispatcher("/testsgathering.jsp").forward(request, response);
    }

    public void listfile(File file, Map map)
    {
        if(!file.isFile())
        {
            File files[] = file.listFiles();
            File afile[];
            int j = (afile = files).length;
            for(int i = 0; i < j; i++)
            {
                File f = afile[i];
                listfile(f, map);
            }

        } else
        {
            String realName = file.getName().substring(file.getName().indexOf("_") + 1);
            map.put(file.getName(), realName);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doGet(request, response);
    }
}
