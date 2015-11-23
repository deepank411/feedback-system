<%-- 
    Document   : studenthome
    Created on : 5 Nov, 2015, 8:34:52 AM
    Author     : abdul
--%>
<%@page import="bean.User"%>
<%@page import="bean.GetUserData"%>
<%@page import="bean.course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.FeedbackHandler"%>
<%@page import="bean.FlagHandler"%>
<% 
    if(  session.getAttribute("isUserLoggedIn").equals("false") ||session.getAttribute("UID").toString().isEmpty() ){
        response.sendRedirect("index.html");
    }
    
       session.setAttribute("UID", session.getAttribute("UID"));
        session.setAttribute("Uname", session.getAttribute("Uname")); 

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Courses | Feedback</title>
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
   <link rel="stylesheet" href="materialize/css/materialize.min.css">
   <link rel="stylesheet" href="./stylesheets/style.css">
   <link rel="stylesheet" href="./stylesheets/global.css">
</head>
<body class="blue lighten-2">
   <nav class="indigo darken-4">
      <div class="nav-wrapper">
         <a href="#" class="brand-logo"><%=session.getAttribute("UID")%> , <%=session.getAttribute("Uname")%></a>
         <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
         <ul class="right hide-on-med-and-down">
            <li><a href="logout.jsp">logout</a></li>
         </ul>
         <ul class="side-nav" id="mobile-demo">
            <li><a href="logout.jsp">logout</a></li>
         </ul>
      </div>
   </nav><br>
   <% 
   
        int flag1,flag2;
        flag1=FlagHandler.getFeedStart();
        flag2=FlagHandler.getFeedOver();
        if(flag1==0){
            out.print("<br><p style=\"text-align: center; color: #fff; font-size:25px;\">Feedback process has not yet started.<br>Please check back later.</p>");
        }
        else if(flag1==1 && flag2==1){
            out.print("<br><p style=\"text-align: center; color: #fff; font-size:25px;\">Feedback process has been completed.</p>");
        }
        else{
            ArrayList<FeedbackHandler> feeds = new ArrayList();
            FeedbackHandler.getAllFeedbackToBeSubmitedByStud(session.getAttribute("UID").toString(), feeds);
            course c[] = new course[feeds.size()+3];
            User u[]=new User[feeds.size()+3];
            //System.out.println("hiii test feed" + " " + feeds.size());
            int i;
            for(i=0;i<feeds.size();i++){
                c[i] =new course();
                u[i]=new User();
                course.getCourseData(feeds.get(i).getCourse_id(), c[i]);
                u[i].setU_id(feeds.get(i).getFaculty_id());
                u[i].getUserData();
            }
            
            
            out.print("<div class=\"container \"> "
                    + "<div class=\"card-panel form-container\">"
                    +"<div class=\"row heading\">"
                    + "<div class=\"col s4 m3 center\">"
                    + "<p>COURSE</p>"
                    + "</div>"
                    + "<div class=\"col s4 m3 center\">"
                    +"<p>FACULTY</p>"
                    +"</div>"
                    +"<div class=\"col s4 m3 center\">"
                    +"<p>STATUS</p>"
                    +"</div>"
                    +"<div class=\"col s12 m3 center hide-on-small-only\">"
                    +"<div class=\"row\">"
                    +"</div> </div></div>"
            );
            
            for(i=0;i<feeds.size();i++){
                out.print("<div class=\"row text\">"
                        + "<div class=\"col s4 m3 center\">"
                        + "<p> "+c[i].getCourse_name()+" </p>"
                        + "</div>"
                        + "<div class=\"col s4 m3 center\">"
                        + "<p> "+u[i].getU_name() +" </p>"
                        + "</div>"
                        + "<div class=\"col s4 m3 center\">"
                        + "<p>"+(feeds.get(i).getCheck_submit()== 0 ? "incomplete":"completed" )+"</p>"
                        + "</div>"
                        + "<div class=\"col s12 m3 center fill-button\">"
                        + "<form action=\"fillform.jsp\" method=\"post\"><button name=\"formid\" class=\"btn waves-effect waves-light col s12 indigo darken-4\" type=\"submit\" value=\""+feeds.get(i).getForm_id()+"\" >Fill</button></form>"
                        + " </div>"
                        + "</div>"
                );
                
            }
            out.print("</div> </div>");
        }
       
   %>
 
  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
   <script src="materialize/js/materialize.min.js"></script>
   <script src="./js/scripts.js"></script>
</body>
</html>
