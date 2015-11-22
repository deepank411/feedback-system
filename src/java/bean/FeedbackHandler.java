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
import java.util.ArrayList;

/**
 *
 * @author abdul
 */
public class FeedbackHandler {
    
    
    private String student_id;
    private String faculty_id;
    private int course_id;
    private int check_submit;
    private int form_id;

    public int getForm_id() {
        return form_id;
    }

    public void setForm_id(int form_id) {
        this.form_id = form_id;
    }
    public String getStudent_id() {
        return student_id;
    }

    public String getFaculty_id() {
        return faculty_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public int getCheck_submit() {
        return check_submit;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public void setFaculty_id(String faculty_id) {
        this.faculty_id = faculty_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public void setCheck_submit(int check_submit) {
        this.check_submit = check_submit;
    }
    
    public static int initFeedback() throws SQLException{
        Connection con;
        con=ConnectionProvider.getCon();
        int i,f;
        f=-1;
        ArrayList<Form> ques= new ArrayList();
        Form.getAllQues(ques);
        PreparedStatement ps;
        for(i=0;i < ques.size();i++){
            if(ques.get(i).getQ_type()=='O'){
             ps = con.prepareStatement("alter table feedbackdata add column q"+Integer.toString(ques.get(i).getQ_id())+" int");
            }
            else
                ps = con.prepareStatement("alter table feedbackdata add column q"+Integer.toString(ques.get(i).getQ_id())+" varchar(50)");

            //System.out.println(ps.toString());
           f=  ps.executeUpdate();
           if(f>0)
               continue;
           else
               return -1;
        }
        return 1;
    }
    
    
    public  void getFeedData() throws SQLException{
        Connection con;
        con = ConnectionProvider.getCon();
        
        PreparedStatement ps = con.prepareStatement("select * from feedbackdata where form_id=?");
        ps.setInt(1,this.getForm_id());
        ResultSet rs = ps.executeQuery();
        rs.next();
        this.setFaculty_id(rs.getString("faculty_id"));
        this.setCourse_id(rs.getInt("course_id"));
        this.setStudent_id(rs.getString("student_id"));
    }
    
    
    
    
    public static void getAllFeedbackToBeSubmitedByStud(String stud_id,ArrayList<FeedbackHandler> feeds) throws SQLException{
        Connection con;
        con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("select * from feedbackdata where student_id=?");
        ps.setString(1, stud_id);
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            FeedbackHandler f=new FeedbackHandler();
            f.setForm_id(rs.getInt("form_id"));
            f.setStudent_id(stud_id);
            f.setCourse_id(rs.getInt("course_id"));
            f.setCheck_submit(rs.getInt("check_submit"));
            f.setFaculty_id(rs.getString("faculty_id"));
            feeds.add(f);
        }
    }
    public static int recFeedback(int form_id,int q_no,String resp) throws SQLException{
        Connection con;
        con=ConnectionProvider.getCon();
        Form q = new Form();
        Form.getQuesData(q_no, q);
        int f;
        f=-1;
        PreparedStatement ps =con.prepareStatement("update feedbackdata set ?=? where form_id=?");
        ps.setString(1,"q"+Integer.toString(q_no));
        if(q.getQ_type()=='O')
            ps.setInt(2,Integer.parseInt(resp));
        else
            ps.setString(2, resp);
        ps.setInt(3,form_id);
        f=ps.executeUpdate();
        if(f>0)
            return 1;
        else
            return -1;
    }
}
