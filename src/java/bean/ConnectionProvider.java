package bean;
import java.sql.*;
public class ConnectionProvider {
	static Connection con=null;
	

   public  static Connection getCon() {
        
         
         try {
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                }
                con=DriverManager.getConnection("jdbc:mysql://localhost/feedback","root","deepank411");
            } catch (SQLException ex) {
                                    ex.printStackTrace();
            }
        
        
        
        
          
        		return con;
        }

        
    }