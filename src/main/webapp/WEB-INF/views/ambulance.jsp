<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- db -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  db -->


<%
if(session.getAttribute( "theName" ) == null) {
	String redirectURL = "loginform.html";
    response.sendRedirect(redirectURL);
}

String s = (String)session.getAttribute( "theName" );

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
   
       <spring:url value="/resources/assets/css/bootstrap.css" var="CSS" />
    <link href="${CSS}" rel="stylesheet" />


    <!-- FONTAWESOME STYLES-->
    <spring:url value="/resources/assets/css/font-awesome.css" var="CSS1" />
    <link href="${CSS1}" rel="stylesheet" />

    <!-- CUSTOM STYLES-->
    <spring:url value="/resources/assets/css/custom.css" var="CSS2" />
    <link href="${CSS2}" rel="stylesheet" />

     <!-- MORRIS CHART STYLES-->
    <spring:url value="/resources/assets/js/morris/morris-0.4.3.min.css" var="CSS4" />
    <link href="${CSS4}" rel="stylesheet" />
    
    
        <spring:url value="/resources/assets/js/validate.js" var="jslogin" />
    <script src="${jslogin}"></script>

    

     <!-- GOOGLE FONTS-->
    <spring:url value="http://fonts.googleapis.com/css?family=Open+Sans" var="CSS3" />
    <link href="${CSS3}" rel="stylesheet" />  
    
    <!--  images -->
        <spring:url value="/resources/assets/img/asaa.png" var="user_image" />
     
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
     
   
     
         <script type="text/javascript">
    
   	  var sa="<%=s%>"; 
                         var auto_refresh = setInterval(
                         function ()
                          {
                            $("#recentMsg").load("recent_msg.html?AmbulanceUser="+sa).fadeIn("slow");
                          }, 1000); // refresh every 10000 milliseconds

                          
                          
                          
                          
    </script>
    
    <script type="text/javascript">
    

    function validateAmbMsg()
    {
    	var message = document.forms["AmbMsg"]["amb_message"].value;
    	if(message.length == 0) {
    		document.getElementById('error_msg').innerHTML = "Please enter a valid message!";
    		return false;
    	} else {
    		return true;
    	}
    }
    
    </script>
     
      
     
     
</head>
<body>

<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">Welcome <%= session.getAttribute( "theName" ) %> &nbsp; <a href="logout.html" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                 <ul class="nav" id="main-menu">
                    <li class="text-center">
                        <img src="${user_image}" class="user-image img-responsive" />
                    </li>

<!-- 
                    <li>
                        <a href="home.html"><i class="fa fa-dashboard fa-3x"></i> Home</a>
                    </li>
                    <li>
                        <a class="active-menu" href="loginform.html"><i class="fa fa-desktop fa-3x"></i> Rooms</a>
                    </li>
                    <li>
                        <a href="table.html"><i class="fa fa-table fa-3x"></i> Appointments</a>
                    </li>
                    <li>
                        <a href="form.html"><i class="fa fa-edit fa-3x"></i> Message</a>
                    </li>
  -->
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Home page</h2>   
                         <!--  <h5>Welcome Chaithanya , Love to see you back. </h5> -->
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
     <!--           <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">   
			<div class="panel panel-back noti-box">
                <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-plus-square"></i>
                </span>
                <div class="text-box" >
                    <p class="main-text">10/15</p>
                    <p class="text-muted">Operating Rooms</p>
                </div>
             </div>
		     </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
			<div class="panel panel-back noti-box">
                <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-plus-square"></i>
                </span>
                <div class="text-box" >
                    <p class="main-text">10/20</p>
                    <p class="text-muted">Ward Rooms</p>
                </div>
             </div>
		     </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
			<div class="panel panel-back noti-box">
                <span class="icon-box bg-color-blue set-icon">
                    <i class="fa fa-plus-square"></i>
                </span>
                <div class="text-box" >
                    <p class="main-text">10/12</p>
                    <p class="text-muted">Emergency</p>
                </div>
             </div>
		     </div>
			</div>
			
-->
                 <!-- /. ROW  -->
                <hr />                

                 <!-- /. ROW  -->
                <div class="row" >

                    <div class="col-md-9 col-sm-12 col-xs-12">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Type your message below
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
  <form:form modelAttribute="ambulanceForm" action="AmbulanceForm.html" name="AmbMsg" onsubmit="return validateAmbMsg()">
                    
                                 <div class="form-group">
  <label for="comment">Message:</label>
    <form:input type="hidden" value='<%= session.getAttribute( "theName" ) %>' name="userName" id="userName" path="userName" />
  <form:textarea class="form-control" rows="5" id="amb_message" name="amb_message" path="message"/>
</div> 

<button type="submit" style="float:left;" class="btn btn-success">Send</button>
						<br><span id="error_msg" style="color:red;font-size:12px;margin-left:200px;margin-bottom:40px;"></span>

</form:form>



                            </div>
                        </div>
                    </div>
                    
                    </div>
                </div>   
                <!--  for display messages........ -->
                <div class="row" >

                    <div class="col-md-9 col-sm-12 col-xs-12">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Messages sent
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive" id="recentMsg">
<!-- all messages display code starts-->

                
                                              
                 <table class="table"> 
                  <thead class="thead-inverse">
    <tr>
      <th>Messages</th>
      <th>Status</th>
    </tr>
  </thead>

    <c:forEach items="${values}" var="view"> 
    	<c:choose>
    		<c:when test="${view.getstatus() == '1' }">
    			<tr style="color:grey;"> 
            <td>${view.getmsg()}</td>
             <td>${view.getstatus()}</td>

        </tr> 
    		</c:when>
    		<c:otherwise>
    			<tr> 
            <td>${view.getmsg()}</td>
            
             <td>${view.getstatus()}</td>

        </tr> 
    		</c:otherwise>
    	</c:choose>
        
    </c:forEach> 
</table> 



<!-- all messages display code ends -->
                            </div>
                        </div>
                    </div>
                    
                    </div>
                </div>   
                
                
                
                <!--  for display message -->
      
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
     
     
     <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <spring:url value="/resources/assets/js/jquery-1.10.2.js" var="js" />
    <script src="${js }"> </script>
    
      <!-- BOOTSTRAP SCRIPTS -->
    <spring:url value="/resources/assets/js/bootstrap.min.js" var="js1" />
    <script src="${js1 }"> </script>
    
    <!-- METISMENU SCRIPTS -->
    <spring:url value="/resources/assets/js/jquery.metisMenu.js" var="js2" />
    <script src="${js2 }"> </script>
    
     <!-- MORRIS CHART SCRIPTS -->
    <spring:url value="/resources/assets/js/morris/raphael-2.1.0.min.js" var="js3" />
    <script src="${js3 }"> </script>
    
    <spring:url value="/resources/assets/js/morris/morris.js" var="js4" />
    <script src="${js4 }"> </script>

      <!-- CUSTOM SCRIPTS -->
      <spring:url value="/resources/assets/js/custom.js" var="js5" />
    <script src="${js5 }"> </script>
        
        
        		

</body>
</html>