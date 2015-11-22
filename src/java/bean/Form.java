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
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author abdul
 */
public class Form {
    private int q_id;
    private char q_type;
    private String q_content;

    public int getQ_id() {
        return q_id;
    }

    public char getQ_type() {
        return q_type;
    }

    public String getQ_content() {
        return q_content;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public void setQ_type(char q_type) {
        this.q_type = q_type;
    }

    public void setQ_content(String q_content) {
        this.q_content = q_content;
    }
    
    public static void getQuesData(int id,Form q){
        Connection con;
        con= ConnectionProvider.getCon();
        try{
             PreparedStatement ps = con.prepareStatement("select * from form where q_id=?");
             ps.setInt(1, id);
             ResultSet rs =ps.executeQuery();
             rs.next();
             q.setQ_id(id);
             q.setQ_type(rs.getString("q_type").charAt(0));
             q.setQ_content(rs.getString("q_content"));
             
         }catch(SQLException e){
             e.printStackTrace();
         }
    }
     public static int addQues(Form q){
        Connection con;
        int status;
        status =-1;
        con= ConnectionProvider.getCon();
        try{
             String query ;
            query = "select count(*) as ques_count from form";
            Statement stmt ;
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            if(rs.getInt("ques_count")==0)
                FlagHandler.setFormSubmit(1);
             q.setQ_id(rs.getInt("ques_count")+1);
             PreparedStatement ps = con.prepareStatement("insert into form values (?,?,?)");
             ps.setInt(1, q.getQ_id());
             String s;
             s= ""+q.getQ_type();
             ps.setString(2,s);
             ps.setString(3, q.getQ_content());
             status=ps.executeUpdate();
         }catch(SQLException e){
             e.printStackTrace();
         }
        if(status >0)
            return 1;
        else
            return -1;
    }
     
    public static void getAllQues(ArrayList<Form> ques) throws SQLException{
        Connection con ;
        con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("select * from form ");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Form q = new Form();
            q.setQ_id(rs.getInt("q_id"));
            q.setQ_content(rs.getString("q_content"));
            q.setQ_type(rs.getString("q_type").charAt(0));
            ques.add(q);
        }
        System.out.println(ques.size());
    }

    
}
