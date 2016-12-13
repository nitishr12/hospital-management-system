<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- db -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  db -->

<!-- nitish -->
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="net.roseindia.java.*"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.google.gson.Gson"%>

<!-- nitish -->

<%
if(session.getAttribute( "theName" ) == null) {
	String redirectURL = "loginform.html";
    response.sendRedirect(redirectURL);
}

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
    

     <!-- GOOGLE FONTS-->
    <spring:url value="http://fonts.googleapis.com/css?family=Open+Sans" var="CSS3" />
    <link href="${CSS3}" rel="stylesheet" />  
    
    <!--  images -->
        <spring:url value="/resources/assets/img/asaa.png" var="user_image" />
<!-- calenar -->


<spring:url value="/resources/assets/calendar/fullcalendar.css" var="CSS12" />
    <link href="${CSS12}" rel="stylesheet" />
    
<%
	String values = null;
	Gson gson = new Gson();
	ArrayList<Calendar> list = new ArrayList<Calendar>();
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/springexamples",
				"root", "");
		PreparedStatement pst = conn.prepareStatement(
				"SELECT patient_id,patient_name,doctor_name,start_date,end_date,RoomNo FROM springexamples.room_booking where doctor_name=?");
		pst.setString(1,(String)session.getAttribute( "theName" ) );
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			Roominfo obj = new Roominfo();
			obj.patientID = rs.getInt(1);
			obj.patientName = rs.getString(2);
			obj.doctorName = rs.getString(3);
			obj.startDate = rs.getString(4);
			obj.endDate = rs.getString(5);
			obj.roomNo = rs.getInt(6);
			Calendar info = new Calendar();
			info.title = obj.patientName + " at " + obj.roomNo;
			info.start = obj.startDate;
			info.end = obj.endDate;
			list.add(info);
		}
		PreparedStatement pst1 = conn.prepareStatement(
				"SELECT `desc`,start_date,end_date,url FROM springexamples.appiontments");
		ResultSet rs1 = pst1.executeQuery();
		System.out.println("Completed");
		while (rs1.next()) {
			Calendar info = new Calendar();
			info.title=rs1.getString(1);
			info.start = rs1.getString(2);
			info.end = rs1.getString(3);
			info.url=rs1.getString(4);
			list.add(info);
		}
		System.out.println(gson.toJson(list));
		values = gson.toJson(list);
%>
<input type="hidden" id="var1" value='<%=values%>' />

	<%
		} catch (Exception e) {
		}
	%>

	        <spring:url value="/resources/assets/calendar/fullcalendar.print.css" var="CSS13" />
	    <link href="${CSS13}" rel="stylesheet" media="print"/>
	    
	        <spring:url value="/resources/assets/calendar/moment.min.js" var="CSS14" />
	    <script src="${CSS14}"></script>
	    
	        <spring:url value="/resources/assets/calendar/jquery.min.js" var="CSS15" />
	    <script src="${CSS15}"></script>
	    
	            <spring:url value="/resources/assets/calendar/fullcalendar.min.js" var="CSS16" />
	    <script src="${CSS16}"></script>    
<script>
	$(document).ready(function() {
		var eventArray = JSON.parse($('#var1').val());
		$('#calendar').fullCalendar({
			defaultDate : '2016-12-01',
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : eventArray
		});
	});
</script>
<style>
.fc-scroller {
   overflow-y: hidden !important;
}


#calendar {
	max-width: 1000px;
	margin: 0 auto;
}
</style>	
    
    
   
    
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
                        <a href="home.html"><i class="fa fa-dashboard fa-3x"></i> Home</a>
                    </li>
                   
                   
                   
                   
                    <li>
                        <a  href="room_booking.html"><i class="fa fa-desktop fa-3x"></i> Rooms</a>
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
                                <a class="active-menu" href="appointments.html">Calendar</a>
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
                      

                <hr />                

                 <!-- /. ROW  -->
                <div class="row" >
                    <!--  calendar starts -->
				<div id='calendar'></div>
        <!--  calendar ends -->
                </div>          
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
     
     

     
</body>
</html>