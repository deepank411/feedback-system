<%-- 
    Document   : activatefeedback
    Created on : 8 Nov, 2015, 5:09:10 PM
    Author     : abdul
--%>

<%@page import="bean.FlagHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
  int fl;
   session.setAttribute("UID", session.getAttribute("UID"));
   session.setAttribute("Uname", session.getAttribute("Uname"));
  fl=Integer.parseInt(request.getParameter("val"));
  if(fl==1){
      FlagHandler.setFeedStart(fl);
  out.print("Feedback process has been inititiated.");
  }
  else{
      FlagHandler.setFeedOver(1);
      out.print("Feedback process has now been stopped");
  }
  
    
    
%>
