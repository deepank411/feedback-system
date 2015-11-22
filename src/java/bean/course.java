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
public class course {
    private int course_id;
    private String course_name;
    private String course_dept;

    public int getCourse_id() {
        return course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public String getCourse_dept() {
        return course_dept;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public void setCourse_dept(String course_dept) {
        this.course_dept = course_dept;
    }
    
    public static void getCourseData(int c_id,course c ) throws SQLException{
        Connection con;
        con=ConnectionProvider.getCon();
        PreparedStatement ps =con.prepareStatement("select * from course where course_id=?");
        ps.setInt(1, c_id);
        ResultSet rs = ps.executeQuery();
        rs.next();
        c.setCourse_dept(rs.getString("dept"));
        c.setCourse_id(rs.getInt("course_id"));
        c.setCourse_name(rs.getString("course_name"));
        
    }
    
}
