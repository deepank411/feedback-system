package bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class User {
	private String u_id;
	private String u_name;
        private String password;
        private String department;
	private char u_type;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String dep) {
        if(dep.charAt(1)=='0' || dep.equals("cse"))
        this.department = "cse";
        else if(dep.charAt(1)=='1' || dep.equals("ece"))
            this.department = "ece";
        else if(dep.charAt(1)=='2' ||dep.equals("cce"))
            this.department = "cce";
        else if(dep.charAt(1)=='3' || dep.equals("mme"))
            this.department = "mme";

    }
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id.toLowerCase();
	}
	public String getU_name(){
		return u_name;
	}
	public void setU_name(String uname) {
		this.u_name = uname.toLowerCase();
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
        public char getU_type() {
		return u_type;
	}
	public void setU_type(char type) {
		this.u_type = type;
	}
        
        public  void getUserData() throws SQLException{
             Connection con = ConnectionProvider.getCon();
             PreparedStatement ps = con.prepareStatement("select * from userdata where u_id= ?");
             ps.setString(1,this.getU_id());
             ResultSet rs = ps.executeQuery();
             rs.next(); 
             this.setU_name(rs.getString("u_name"));
             this.setPassword(rs.getString("password"));
             this.setU_type(rs.getString("u_type").charAt(0));
             this.setDepartment(rs.getString("dept")); 
        }    
        
       
        
}