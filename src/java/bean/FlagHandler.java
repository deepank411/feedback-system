/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author abdul
 */
public class FlagHandler {
    public static int getFeedStart(){
        int flag;
        flag=0;
        Connection con;
        con =ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("select val from flags where name=?");
             ps.setString(1, "feed_start");
             ResultSet rs =ps.executeQuery();
             rs.next();
             flag=rs.getInt("val");
         }catch(SQLException e){
        
        }
        return flag;
    }
    
    public static int getFormSubmit(){
        int flag;
        flag=0;
        Connection con;
        con =ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("select val from flags where name=?");
             ps.setString(1, "form_submit");
             ResultSet rs =ps.executeQuery();
             rs.next();
             flag=rs.getInt("val");
         }catch(SQLException e){
        
        }
        return flag;
    }
    
    
    
    
    
    public static int getFeedOver(){
        int flag;
        flag=0;
        Connection con;
        con =ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("select val from flags where name=?");
             ps.setString(1, "feed_over");
             ResultSet rs =ps.executeQuery();
             rs.next();
             flag=rs.getInt("val");
         }catch(SQLException e){
        
        }
        return flag;
    }
    
    
    
    
    
    public static int setFeedStart(int value) throws SQLException{
        int flag,flag1;
        flag=flag1=-1;
        Connection con;
        con =ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("update flags set val=? where name=?");
             ps.setInt(1, value);
             ps.setString(2, "feed_start");
             flag=ps.executeUpdate();
         }catch(SQLException e){
        
        }
        flag1=FeedbackHandler.initFeedback();
        if(flag>0 && flag1>0)
            return 1;
        else
            return 0;
    }
    
     public static int setFormSubmit(int value){
        int flag;
        flag=0;
        Connection con;
        con =ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("update flags set val=? where name=?");
             ps.setInt(1, value);
             ps.setString(2, "form_submit");
             flag=ps.executeUpdate();
         }catch(SQLException e){
        
        }
        if(flag>0)
            return 1;
        else
            return 0;
    
     }
     
     
     
     
     
     
      public static int setFeedOver(int value){
        int flag;
        flag=0;
        Connection con;
        con =ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("update flags set val=? where name=?");
             ps.setInt(1, value);
             ps.setString(2, "feed_over");
             flag=ps.executeUpdate();
         }catch(SQLException e){
        
        }
        if(flag>0)
        return 1;
        else 
            return 0; 
      }
}