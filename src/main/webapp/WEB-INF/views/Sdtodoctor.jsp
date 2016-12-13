<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="net.roseindia.form.AllAmbulanceMsgs"
         import="net.roseindia.dao.UserDAOImpl"

   %>
   
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
String a = (String)session.getAttribute( "theName" );

if(session.getAttribute( "theName" ) == null) {
	String redirectURL = "loginform.html";
    response.sendRedirect(redirectURL);
}

%>
    
    
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
    

     <!-- GOOGLE FONTS-->
    <spring:url value="http://fonts.googleapis.com/css?family=Open+Sans" var="CSS3" />
    <link href="${CSS3}" rel="stylesheet" />  
    
    <!--  images -->
        <spring:url value="/resources/assets/img/asaa.png" var="user_image" />
     
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


                    <li>
                        <a  href="home.html"><i class="fa fa-dashboard fa-3x"></i> Home</a>
                    </li>
                    <li>
                        <a href="room_booking.html"><i class="fa fa-desktop fa-3x"></i> Rooms</a>
                    </li>
                     
                  <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Appointments<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="BookAppointment.html">Appointment</a>
                            </li>
                            <li>
                                <a href="appointments.html">Calendar</a>
                            </li>
                                                  </ul>
                      </li>  
                  
                           <c:choose>
                    <c:when test='${role== "sd"}'>
                    <li>
                        <a class="active-menu" href="Ambulance1.html"><i class="fa fa-edit fa-3x"></i> Message</a>
                    </li>
                    </c:when>
                    <c:otherwise>
                    	<li>
                        <a class="active-menu" href="SdMessages.html"><i class="fa fa-edit fa-3x"></i> Message</a>
                    </li>
                                        
                    <li>
                        <a href="messageForm.html"><i class="fa fa-edit fa-3x"></i> ServiceDesk</a>
                    </li>
                    
                    </c:otherwise>
                    </c:choose>  
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Messages</h2>   
                         <!--  <h5>Welcome Chaithanya , Love to see you back. </h5> -->
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  
                   <div class="col-md-9 col-sm-12 col-xs-12">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
								Messages From Servie Desk	
	                     </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                              
                              
                              
                              
                              
                                              
                
			                 <table class="table" > 
     <thead class="thead-default">
   
<thead class="thead-inverse">
    <tr>
      <th>Messages</th>
      <th>Status</th>
    </tr>
  </thead>
<tbody>
    <c:forEach items="${ss}" var="view"> 
    	<c:choose>
    		<c:when test="${view.getstatus() == '1' }">
    		<i>	<tr style="color:grey;"> 
            <td>${view.getmsg()}</td>
						<td>
						 Undertaken By Dr. ${view.getuname()}
						  </td>
        </tr> </i>
    		</c:when>
    		<c:otherwise>
    			<tr> 
            <td>${view.getmsg()}</td>
            

						<td>
    <form:form modelAttribute="ambulanceForm" action="SdMessages.html" method="POST">
						<button class="btn btn-primary" >Consider </button>
						<form:input type="hidden" value='<%=a %>' name="username" class="input-txt" id="username" path="userName" />
						<form:input type="hidden" value='${view.getmsg()}' name="username" class="input-txt" id="username" path="message" />
						<form:input type="hidden" value='${view.getid()}' name="username" class="input-txt" id="username" path="id" />
	</form:form>
	</td>
        </tr> 
    		</c:otherwise>
    	</c:choose>
        
    </c:forEach>
    </tbody>  
</table> 


                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                            </div>
                        </div>
                    </div>
                    
                    </div>


             
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