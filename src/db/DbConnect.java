// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DbConnect.java
/*
 * 连接数据库，并返回Connection 对象
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect
{

    public DbConnect()
    {
    }

    public static Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/onlytest?characterEncoding=UTF-8";
            con = DriverManager.getConnection(url, "root", "7837800hongkun");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }

    public static Connection con;
}
