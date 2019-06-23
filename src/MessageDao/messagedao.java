// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   messagedao.java
/*
 * 信息处理
 */
package MessageDao;

import MessageBoard.Messages;
import db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import user.user;

public class messagedao
{

    public messagedao()
    {
        con = DbConnect.getConnection();
    }

    public user checkLogin(String id, String password)
    {
        try
        {
            pstmt = con.prepareStatement("select*from user where id=?  and password=?");
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                user login = new user();
                login.setId(rs.getString(1));
                login.setName(rs.getString(2));
                login.setPassword(rs.getString(3));
                return login;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public ArrayList findMbInfo()
    {
        try
        {
            ArrayList al = new ArrayList();
            pstmt = con.prepareStatement("select * from messages");
            Messages mb;
            for(ResultSet rs = pstmt.executeQuery(); rs.next(); al.add(mb))
            {
                mb = new Messages();
                mb.setId(rs.getString(1));
                mb.setName(rs.getString(2));
                mb.setTime(rs.getDate(3));
                mb.setTitle(rs.getString(4));
                mb.setMessage(rs.getString(5));
            }

            return al;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public String getName(String id)
    {
        String name = null;
        try
        {
            pstmt = con.prepareStatement("select name from user where id=?");
            pstmt.setString(1, id);
            for(ResultSet rs = pstmt.executeQuery(); rs.next();)
                name = rs.getString(1);

            return name;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addInfo(Messages mb)
    {
        try
        {
            pstmt = con.prepareStatement("insert into messages values(?,?,?,?,?)");
            pstmt.setString(1, mb.getId());
            pstmt.setString(2, mb.getName());
            pstmt.setDate(3, mb.getTime());
            pstmt.setString(4, mb.getTitle());
            pstmt.setString(5, mb.getMessage());
            pstmt.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean insertUser(String id, String name, String password)
    {
        try
        {
            pstmt = con.prepareStatement("insert into user values(?,?,?,?)");
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, password);
            pstmt.setInt(4, 0);
            pstmt.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    Connection con;
    PreparedStatement pstmt;
}
