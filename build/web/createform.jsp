<%-- 
    Document   : createform
    Created on : 8 Nov, 2015, 10:23:36 AM
    Author     : abdul
--%>

<%@page import="bean.Form"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Question List | Feedback System</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
   <link rel="stylesheet" href="./stylesheets/style.css">
   <link rel="stylesheet" href="./stylesheets/global.css">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
   <!-- for modal     -->
        <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
        <link rel="icon" href="http://designshack.net/favicon.ico">
        <!--<link rel="stylesheet" type="text/css" media="all" href="./style.css">-->
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
   <%
            session.setAttribute("UID", session.getAttribute("UID"));
        session.setAttribute("Uname", session.getAttribute("Uname"));
          if(session.getAttribute("UID").toString().isEmpty()){
              String site = new String("index.html");

              response.setStatus(response.SC_MOVED_TEMPORARILY);

              response.setHeader("Refresh", "1;" + site);
          }
              
          session.setAttribute("UID", session.getAttribute("UID"));    
   %>
   
   
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript" >
            
            function myf() {
                var question = document.getElementById("qu").value ;
                if(document.getElementById("test1").checked){
                    var qtype = 'O';
                }
                else
                    var qtype = 'S';
        // Returns successful data submission message when the entered information is stored in database.
                var dataString = 'question=' + question + '&qtype='+qtype;
                if (question === '') {
                    alert("Please Fill All Fields hiiiii");
                } else {
        // AJAX code to submit form.
                    $.ajax({
                      
                        type: "POST",
                        url: "addquestion.jsp",
                        data: dataString,
                        cache: false,
                        success: function (html) {
                            alert(html);
                        }
                    });
                }
                return false;
            }
        </script>

   
   
   
   
</head>
<body class="blue lighten-2">
   <nav class="indigo darken-4">
      <div class="nav-wrapper">
         <a href="adminhome.jsp" class="brand-logo"> <%=session.getAttribute("UID")%> , <%=session.getAttribute("Uname")%></a>
         <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
         <ul class="right hide-on-med-and-down">
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
         <ul class="side-nav" id="mobile-demo">
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
      </div>
   </nav>
    <%
          
      ArrayList<Form> ques = new ArrayList();
      Form.getAllQues(ques);
      int i;
      for(i=0;i<ques.size();i++){
          out.print("<div class=\"container\">");
          out.print("<ul class=\"collection\">");
          out.print("<li class=\"collection-item avatar\">");
          out.print("<div class=\"row\">");
          out.print("<div class=\"col s1\">");
          out.print("<i class=\"material-icons circle green\">insert_chart</i>");
          out.print("</div>");
          out.print("<div class=\"col s9\">");
          out.print("<span class=\"login-form-text-4\">"+ques.get(i).getQ_content()+"</span>");
          if(ques.get(i).getQ_type()=='O')
          out.print("<p class=\"login-form-text-5\">Objective</p>");
          else
          out.print("<p class=\"login-form-text-5\">Subjective</p>");
          out.print("</div>");
//          out.print("<div class=\"col s2 right hide-on-med-and-down\">");
//          out.print("<a href=\"#\"><div class=\"chip delete right\">Delete</div></a>");
//          out.print("<a href=\"#\"><div class=\"chip edit right\">Edit</div></a>");
//          out.print("</div>");
          out.print("</div>");
          out.print("</li>");
          out.print("</ul>");
          out.print("</div>");
      }
%>
   <div class="row">
       <div class="col s12 center">
       <a href="#addquestion" id="modaltrigger"><input  type="button" name="addquestion" class="btn-floating btn-large indigo darken-4" value="+"></a><br><br><br>
       </div>
   </div>
            <!--<div id="addquestion" style="display:none; margin-left:20%; width:60%; z-index:1000">-->
            <div class="modal" id="addquestion" style="margin-left:20%; width:60%;">
                <div class="modal-content">
                <div class="row">
                    <div class="s12">
                        <h4 style="text-align:center">Add New Question</h4>
                    </div>
                </div>
                <form id="quesform" name="quesform" class="login-form">
                    <div class="row">
                        <div class="col s12 center">
                            <div class="login-form-text-3">New Question</div>
                            <textarea type="text" name="qu" id= "qu" class="txtfield" style="height:100px" tabindex="2"> </textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <div class="login-form-text-3">Type of Question?</div>
                        </div>
                        <div class="col s12 m6">
                            <input name="group1" type="radio" id="test1" />
                            <label for="test1">Objective</label>
                        </div>
                        <div>
                            <input name="group1" type="radio" id="test2" />
                            <label for="test2">Subjective</label>
                        </div>
                  </div>
                  <div class="row">
                            <div class="col s6">
                               <div class="center"><input type="button" name="addq" id="addq" class="modal-action modal-close btn indigo darken-4 hidemodal"  tabindex="3" value="add"  onclick="myf()"></div><br>
                            </div>
                            <div class="col s6">
                               <div class="center"><input type="button" name="cancel" id="cancel" class="modal-action modal-close btn indigo darken-4 hidemodal" value="cancel" tabindex="4"></div>
                            </div>
                        </div>
                </form>
                </div>
            </div>



            <script type="text/javascript">
                $(function () {
                    $('#quesform').submit(function (e) {
                        return false;
                    });

                    $('#modaltrigger').leanModal({top: 50, overlay: 0.45, closeButton: ".hidemodal"});
                });
            </script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
   <script src="./js/scripts.js"></script>
</body>
</html>