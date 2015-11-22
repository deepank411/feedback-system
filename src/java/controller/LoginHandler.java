/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dksh
 */
@WebServlet(name = "LoginHandler", urlPatterns = {"/LoginHandler"})
public class LoginHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
   Connection conn = bean.ConnectionProvider.getCon();
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String username    = request.getParameter("username");
            String password = request.getParameter("password");
            String check;
            
            
            HashMap users = new HashMap();
            bean.GetUserData.getDataForLoginValidation(users,conn);
            
            
            if(password.equals(users.get(username))){
                bean.User u = new bean.User();

                u.setU_id(username);
                try {
                    u.getUserData();
                 // System.out.println("\ncccc  cccc cc"+u.getU_type()+"\n");

                } catch (SQLException ex) {
                    ex.printStackTrace();
            }

                HttpSession session = request.getSession(true);
                session.setAttribute("isUserLoggedIn",true);

                 String name = u.getU_name();
                 session.setAttribute("Uname", name);
                 session.setAttribute("UID", u.getU_id());

                 if (u.getU_type()=='A' ) {
                        session.setAttribute("Catagory", "Student");
                        request.getRequestDispatcher("studenthome.jsp").forward(request, response);
                                            
                 }
                 else if( u.getU_type()=='B'){
                     session.setAttribute("Catagory", "Faculty");
                     request.getRequestDispatcher("facultyhome.jsp").forward(request, response);

                 }
                 else {
                        session.setAttribute("Catagory", "ADMIN");
                        request.getRequestDispatcher("adminhome.jsp").forward(request, response);

                  }
                    check ="you are succssefully logged in";
                    

            }
            else{
                check ="Sorry there was a problem";
                request.getRequestDispatcher("index.html").forward(request, response);

            }
            

            
            
    }

}
