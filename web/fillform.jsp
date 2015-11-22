<%-- 
    Document   : fillform.jsp
    Created on : 9 Nov, 2015, 7:23:42 AM
    Author     : abdul
--%>

<%@page import="bean.Form"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@page import="bean.course"%>
<%@page import="bean.FeedbackHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.setAttribute("UID", session.getAttribute("UID"));
session.setAttribute("formid", request.getParameter("formid"));
session.setAttribute("Uname", session.getAttribute("Uname"));
FeedbackHandler feed = new FeedbackHandler();
feed.setForm_id(Integer.parseInt(request.getParameter("formid")));
feed.getFeedData();
course c = new course();
course.getCourseData(feed.getCourse_id(), c);
User u = new User();
u.setU_id(feed.getFaculty_id());
u.getUserData();
int qno;
%>
<!DOCTYPE html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Feedback Form</title>
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
   <link rel="stylesheet" href="./stylesheets/style.css">
   <link rel="stylesheet" href="./stylesheets/global.css">
   
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
       
   
   
</head>
<body class="blue lighten-2">
   <nav class="indigo darken-4">
      <div class="nav-wrapper">
         <a href="adminhome.jsp" class="brand-logo"><%=session.getAttribute("UID")%> , <%=session.getAttribute("Uname")%></a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
         <ul class="right hide-on-med-and-down">
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
         <ul class="side-nav" id="mobile-demo">
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
      </div>
   </nav>
   <div class="container">
      <div class="card-panel">
         <div class="row">
            <div class="col s12 center">
               <div class="center login-form-text">Feedback Form</div>
            </div>
         </div>
         <div class="row">
            <div class="col s12 m6 center">
                <div class="center login-form-text-2">Course: <% out.print(c.getCourse_name()); %></div>
            </div>
            <div class="col s12 m6 center">
                <div class="center login-form-text-2">Faculty: Prof. <% out.print(u.getU_name()); ;%></div>
            </div>
         </div><hr><br>
         <form id="myForm">
<%
             
       ArrayList<Form> ques = new ArrayList<>();
       Form.getAllQues(ques);
       int i;
       
       for(i=0;i<ques.size();i++){
           if(ques.get(i).getQ_type()=='O')
            out.print("<div class=\"row\">" 
               +"<div class=\"col s12 radio\">"
               +"<div class=\"login-form-text-3\">"+ques.get(i).getQ_content() +"</div>"
               +"<p>"
               +"<input name=\"group"+i+"\" type=\"radio\" id=\"t"+i+"1\" value=\"1\" />"
               +"<label for=\"t"+i+"1\">1</label>"
               +" </p>"
               +"<p>"
               +"<input name=\"group"+i+"\" type=\"radio\" id=\"t"+i+"2\" value=\"2\"/>"
               +"<label for=\"t"+i+"2\">2</label>"
               +"</p>"
               +"<p>"
               +"<input name=\"group"+i+"\" type=\"radio\" id=\"t"+i+"3\" value=\"3\"/>"
               +"<label for=\"t"+i+"3\">3</label>"
               +"</p>"
               +"<p>"
               +"<input name=\"group"+i+"\" type=\"radio\" id=\"t"+i+"4\" value=\"4\"/>"
               +"<label for=\"t"+i+"4\">4</label>"
               +"</p>"
               +"<p>"
               +"<input name=\"group"+i+"\" type=\"radio\" id=\"t"+i+"5\" value=\"5\"/>"
               +"<label for=\"t"+i+"5\">5</label>"
               +"</p>"
               +"</div>"
               +"</div>"
               );
       }
       for(i=0;i<ques.size();i++){
           if(ques.get(i).getQ_type()=='S')
              out.print("<div class=\"row\">" 
               +"<div class=\"col s12 radio\">"
               +"<div class=\"login-form-text-3\">"+ques.get(i).getQ_content() +"</div>"
               +"<div class=\"row\">"
               +"<div class=\"input-field col s12\">"
               +"<textarea id=\"t"+i+"\" name=\"group"+i+"\" class=\"materialize-textarea\"></textarea>"
               +"<label for=\"t"+i+"\">Answer</label>"
               +"</div>"
               + "</div>"
               +"</div>"
               +"</div>"
               ); 
       }
       qno = ques.size();
 %>
            
            

            <div class="row">
               <div class="col s6 center">
                   <%
                        out.print("<button class=\"btn waves-effect waves-light col s12 indigo darken-4\" onclick=\"subform('"+qno+"')\">Save</button>");
                   %>
                  <!--<button class="btn waves-effect waves-light col s12 indigo darken-4" onclick="subform()">Save</button>-->
               </div>
<!--               <div class="col s4 center">
                  <button onclick="document.getElementById('myForm').reset();" class="btn waves-effect waves-light col s12 indigo darken-4">Reset</button>
               </div>-->
               <div class="col s6 center">
                  <a href="studenthome.jsp" class="btn waves-effect waves-light col s12 indigo darken-4">Cancel</a>
               </div>
            </div>
         </form>
      </div>
   </div>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
   <script src="./js/scripts.js"></script>
   <script>
       function subform(qno){
        var response = [];
        var s = 'group'.concat(0);
        response.push($("input:radio[name=s]:checked").val());
        var datastring = 'group0=' +response[0]; 
           for(i=1;i<qno;i++){
               var s = 'group'.concat(i);
               console.log(document.getElementsByName(s).valueOf());
//               console.log($("input:radio[name=s]:checked").val());
//               console.log(response[i]);
//               var stri = i.toString();
//               datastring = datastring + '&group'.concat(stri.concat('=')) + response[i];
           }
           alert(datastring);
           $.ajax({
                      
                        type: "POST",
                        url: "getfeeback.jsp",
                        data: datastring,
                        cache: false,
                        success: function (html) {
                            alert(html);
                        }
                    });
                return false;
       }
   </script>
</body>
</html>