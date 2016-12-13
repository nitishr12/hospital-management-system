<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="net.roseindia.java.*"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.google.gson.Gson"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				"SELECT patient_id,patient_name,doctor_name,start_date,end_date,RoomNo FROM springexamples.room_booking");
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
		var event=$('#var1').val();
		alert(event);
		$('#calendar').fullCalendar({
			defaultDate : '2016-12-01',
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : eventArray,
//			eventColor: '#378006'
		});
	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}
.fc-scroller {
   overflow-y: hidden !important;
}

#calendar {
	max-width: 1000px;
	margin: 0 auto;
	overflow: hidden !important;
}
</style>
</head>
<body>

	<div id='calendar'></div>
</body>
</html>