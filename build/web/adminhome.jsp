<%--
    Document   : adminhome
    Created on : 7 Nov, 2015, 8:58:10 PM
    Author     : abdul
--%>
<%@page import="bean.FlagHandler" %>

<!DOCTYPE html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Admin | Home</title>
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
   <link rel="stylesheet" href="materialize/css/materialize.min.css">
   <link rel="stylesheet" href="./stylesheets/style.css">
   <link rel="stylesheet" href="./stylesheets/global.css">

   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript" >

            function actFun() {
                 var val=1;
                var dataString = 'val=' + val;


        // AJAX code to submit form.
                    $.ajax({

                        type: "POST",
                        url: "activatefeedback.jsp",
                        data: dataString,
                        cache: false,
                        success: function (html) {
                            //alert(html);
                        }
                    });
                return false;
            }

            function deactFun() {
                 var val=0;
                var dataString = 'val=' + val;


        // AJAX code to submit form.
                    $.ajax({

                        type: "POST",
                        url: "activatefeedback.jsp",
                        data: dataString,
                        cache: false,
                        success: function (html) {
                            //alert(html);
                        }
                    });
                return false;
            }
        </script>
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
            <li><a href="logout.jsp">logout</a></li>
         </ul>
      </div>
   </nav><br>
   <div class="container ">
		<div class="card-panel form-container">
      <div class="row heading">
         <div class="col s12 center">
            <p>ADMIN PANEL</p>
         <div>
      </div>
    <div class="row"  style="font-size: 0.8em;">

<%

        int flag,flag1,flag2;
        flag=FlagHandler.getFeedStart();
        flag2=FlagHandler.getFeedOver();
        session.setAttribute("UID", session.getAttribute("UID"));
        session.setAttribute("Uname", session.getAttribute("Uname"));
        //System.out.println("TESTS    "+ flag  +" sasda" +flag2);
        if(flag==0){
            flag1=FlagHandler.getFormSubmit();
            if(flag1==0){
                out.print("<div class=\"col s4\">");
                out.print("<a href=\"createform.jsp\" class=\"btn waves-effect waves-light indigo darken-4\">Create Form</a>");
                out.print("</div>");
            }
            else{
                out.print("<div class=\"col s4\">");
                out.print("<a href=\"createform.jsp\" class=\"btn waves-effect waves-light indigo darken-4\">Edit Form</a>");
                out.print("</div>");
                out.print("<div class=\"col s4\">");
                out.print("<button  class=\"btn waves-effect waves-light indigo darken-4\"  onclick=\"actFun();Materialize.toast('Feedback process active.', 4000)\"   >Activate Feedback</button>");
                out.print("</div>");
            }
        }
        else if( flag==1){
            if(flag2==1){
                out.print("<div class=\"col s4\">");
                out.print("<a href=\"faculty-home.html\" class=\"btn waves-effect waves-light indigo darken-4\">Generate Report</a>");
                out.print("</div>");
            }
            else{
                out.print("<div class=\"col s12\">");
                out.print("<p>Feed back process is not over yet </p>");
                out.print("<button  class=\"btn waves-effect waves-light indigo darken-4\"  onclick=\"deactFun();Materialize.toast('Feedback process deactivated.', 4000)\"   >Deactiviate Feedback</button>");
                out.print("</div>");

            }
        }
   %>

   </div>
</div>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
   <script src="materialize/js/materialize.min.js"></script>
   <script src="./js/scripts.js"></script>
</body>
</html>
