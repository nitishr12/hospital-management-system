<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- db -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  db -->

    <!-- Database connectivity-->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/springexamples" user="root" password="" />

    <!-- Database connectivity-->

    
<%
if(session.getAttribute( "theName" ) == null) {
	String redirectURL = "loginform.html";
    response.sendRedirect(redirectURL);
}


%>


    
    
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
     



       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

   
     <spring:url value="/resources/assets/css/jquery-ui.css" var="CSSPOP" />
    <link href="${CSSPOP}" rel="stylesheet" />
   
   
      <spring:url value="/resources/assets/js/jquery-ui.min.js" var="JSPOP" />
    <script src="${JSPOP}"></script>
    
    
    <style>
    .ui-dialog-titlebar-close {
    visibility: hidden;
}
    </style>
<script type="text/javascript">

            var auto_refresh = setInterval(
                    function ()
                     {
                       $("#recentMsg").load("SdCronLoader.html").fadeIn("slow");
                     }, 1000); // refresh every 10000 milliseconds

            </script>




<style type="text/css">
.ui-widget.success-dialog {
    font-family: Verdana,Arial,sans-serif;
    font-size: .8em;
}

.ui-widget-content.success-dialog {
    background: #F9F9F9;
    border: 1px solid #90d93f;
    color: #222222;
}

.ui-dialog.success-dialog {
    left: 0;
    outline: 0 none;
    padding: 0 !important;
    position: absolute;
    top: 0;
}

.ui-dialog.success-dialog .ui-dialog-content {
    background: none repeat scroll 0 0 transparent;
    border: 0 none;
    overflow: auto;
    position: relative;
    padding: 0 !important;
    margin: 0;
}

.ui-dialog.success-dialog .ui-widget-header {
    background: #b0de78 !important;
    border: 0;
    color: #fff;
    font-weight: normal;
}

.ui-dialog.success-dialog .ui-dialog-titlebar {
    padding: 0.1em .5em;
    position: relative;
    font-size: 1em;
}
</style>



</head>
<body>
<div id="recentMsg"> </div>
        <div id="dialog" title="Alert message" style="display: none">
            <div class="ui-dialog-content ui-widget-content">
                <p>
                    <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0"></span>
                    <label id="lblMessage">
                    </label>
                </p>
            </div>
        </div>
        
        
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
                        <a class="active-menu" href="home.html"><i class="fa fa-dashboard fa-3x"></i> Home</a>
                    </li>
                    <li>
                        <a href="room_booking.html"><i class="fa fa-desktop fa-3x"></i> Rooms</a>
                    </li>
                                <c:choose>
                    <c:when test='${role== "sd"}'>
                    
                    <li>
                    </li>
                    </c:when>
                    <c:otherwise>
                  
                  
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
                  

                    </c:otherwise>
                    </c:choose>
                    
                    
                    
                    <c:choose>
                    <c:when test='${role== "sd"}'>
                    <li>
                        <a href="Ambulance1.html"><i class="fa fa-edit fa-3x"></i> Message</a>
                    </li>
                    
                    <li>
                        <a href="DoctorMessages.html"><i class="fa fa-edit fa-3x"></i> Doctor Notifications</a>
                    </li>
                    
                    </c:when>
                    <c:otherwise>
                    	<li>
                        <a href="SdMessages.html"><i class="fa fa-edit fa-3x"></i> Message</a>
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
                     <h2>Home page</h2>   
                         <!--  <h5>Welcome Chaithanya , Love to see you back. </h5> -->
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">   
			<div class="panel panel-back noti-box">
                <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-plus-square"></i>
                </span>
                <div class="text-box" >
                    <p class="main-text">${opbooked}/${op}</p>
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
                    <p class="main-text">${wardbooked}/${ward}</p>
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
                    <p class="main-text">${ embooked}/${em}</p>
                    <p class="text-muted">Emergency</p>
                </div>
             </div>
		     </div>
			</div>
                 <!-- /. ROW  -->
                <hr />                
<c:if test='${role== "doctor"}'>
                 <!-- /. ROW  -->
                <div class="row" >

                    <div class="col-md-9 col-sm-12 col-xs-12">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          FIT
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                Fit percentage table 
                            </div>
                        </div>
                    </div>
                    
                    </div>
                </div>  
                </c:if>        
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
     
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