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
import java.util.HashMap;

/**
 *
 * @author abdul
 */
public class GetUserData {
    
    public static void getDataForLoginValidation(HashMap users,Connection conn){
         try{
             PreparedStatement ps = conn.prepareStatement("select * from userdata");
             ResultSet rs =ps.executeQuery();
             while(rs.next()){
                 users.put(rs.getString("u_id"), rs.getString("password"));
             }
         }catch(SQLException e){
             e.printStackTrace();
         }
     }
    
    
    
}
