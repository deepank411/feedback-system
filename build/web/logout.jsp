<%-- 
    Document   : logout
    Created on : 14 Apr, 2015, 5:12:47 PM
    Author     : dksh
--%>

<%
session.setAttribute("isUserLoggedIn",false);
session.setAttribute("UID",null);
session.invalidate();
response.sendRedirect("index.html");
%>