<%-- 
    Document   : addquestion
    Created on : 8 Nov, 2015, 12:47:42 PM
    Author     : abdul
--%>
<%@page import="bean.Form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   

    Form q = new Form();
    q.setQ_content(request.getParameter("question"));
    q.setQ_type(request.getParameter("qtype").charAt(0));
    int flag;
    flag=Form.addQues(q);
    if(flag!=-1){
        out.print("Question added successfully!");
    }
    else
        out.print("Error in adding question.");





%>