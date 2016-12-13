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

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
    <!-- BOOTSTRAP STYLES-->
    <spring:url value="/resources/assets/css/bootstrap.css" var="CSS" />
    <link href="${CSS}" rel="stylesheet" />


    <!-- FONTAWESOME STYLES-->
    <spring:url value="/resources/assets/css/font-awesome.css" var="CSS1" />
    <link href="${CSS1}" rel="stylesheet" />

    <!-- CUSTOM STYLES-->
    <spring:url value="/resources/assets/css/custom.css" var="CSS2" />
    <link href="${CSS2}" rel="stylesheet" />


 <!-- CUSTOM STYLES-->
    <spring:url value="/resources/assets/css/bootstrap-datetimepicker.min.css" var="CSSB1" />
    <link href="${CSSB1}" rel="stylesheet" />


    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <!--Header files for rooms -->
    <spring:url value="/resources/assets/css/css_room/normalize.css" var="CSS3" />
    <link href="${CSS3}" rel="stylesheet" />

    <spring:url value="/resources/assets/css/css_room/font-awesome-4.3.0/css/font-awesome.min.css" var="CSS4" />
    <link href="${CSS4}" rel="stylesheet" />

    <spring:url value="/resources/assets/css/css_room/style1.css" var="CSS5" />
    <link href="${CSS5}" rel="stylesheet" />

    <spring:url value="/resources/assets/js/Js_room/modernizr.custom.js" var="js" />
    <script src="${js}"></script>


    <!-- Start Images -->
    <spring:url value="/resources/assets/img/img1/authors/empty.png" var="emptyroom" />
    <spring:url value="/resources/assets/img/img1/authors/reserved.png" var="reserved" />
    <spring:url value="/resources/assets/img/asaa.png" var="user_image" />

    <!-- End Images -->

    <!-- Database connectivity-->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/springexamples" user="root" password="" />

    <!-- Database connectivity-->
    <!-- retrieve room numbers -->
    <sql:query dataSource="${snapshot}" var="result">
        SELECT * from room;
    </sql:query>
    <!-- retrieve room numbers -->

    <!--  floor change -->
    <script>
        function myFunction() {
            $('html,body').animate({
                    scrollTop: $(".floor_2").offset().top
                },
                'slow');
        }

        function myFunction1() {
            $('html,body').animate({
                    scrollTop: $(".floor_1").offset().top
                },
                'slow');
        }
    </script>
    <!--  floor change -->



    <!-- Header files for rooms -->
    
    
    <style type="text/css">
    #val {
padding-left:100px;

    }
    
    table {
    border-collapse: collapse;
}

td {
    padding-top: .5em;
    padding-bottom: .5em;
}
    </style>
    
    
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
                        <a href="#"><i class="fa fa-table fa-3x"></i> Appointments<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="active-menu" href="BookAppointment.html">Appointments</a>
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
                     <h2>Appointents</h2>   
                         <!--  <h5>Welcome Chaithanya , Love to see you back. </h5> -->
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  
                   <div class="col-md-9 col-sm-12 col-xs-12">
               
                    <div class="panel panel-default">
                       
                        <div class="panel-body">
                            <div class="table-responsive">
                              
                              
                              
                              


      <form method="POST" action="BookAppointment.html">
      <input type="hidden" value='<c:out value="${row.RoomNo}"/>' name="roomnumber"/>
  

    <table>
        <tr>
            <td style="width:130px;">Description :</td>
            <td id="val"><input type="text" class="form-control" id="name" name="Pname" placeholder="Enter Patient's name"/></td>
        </tr>
        <tr>
            <td>Doctor name :</td>
            <td id="val">
            
                        <input type="text" value = "${theName }" class="form-control" id="name" name="Dname" readonly/>

            </td>
        </tr>
		<tr>
            <td>start Date/Time:</td>
            <td id="val">
                <div class="input-group date form_datetime col-md-5" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input name="Adate" class="form-control" size="80" type="text" value="" readonly />
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
            
            
         </tr>
         
         <tr>
            <td>End Date/Time:</td>
            <td id="val">
                <div class="input-group date form_datetime col-md-5" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input name="Edate" class="form-control" size="80" type="text" value="" readonly />
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
            
            
         </tr>
         
         <tr>
            <td>Url :</td>
            <td id="val">
            
                        <input type="text" class="form-control" id="name" name="url" />

            </td>
        </tr>
        
        
         

        </table>
        <br>
        <div style="margin-left:300px;"><input type="submit" value="Book an appointment" class="btn btn-primary" >
            </div>
</form>

                            </div>              
                        </div>
                    </div>
                    
                    </div>
                    
           <!--  second div -->         
<!--                
                                    <div class="col-md-9 col-sm-12 col-xs-12" style="position:absolute;">
               
                    <div class="panel panel-default">
                        <div class="panel-heading">
								Appointments : 	
	                     </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                              
                              
                              
                              
                              
                                              
                 <table class="table"> 
                  <thead class="thead-inverse">
    <tr>
      <th>Patient Name</th>
      <th>Appointment date</th>
      <th>Edit </th>
      <th>Delete </th>
    
    </tr>
  </thead>

    <c:forEach items="${ss}" var="view"> 
    	
    			<tr style="color:grey;"> 
            <td>${view.getmsg()}</td>
            <td>${view.getid()}</td>
						<td>
<form:form modelAttribute="ambulanceForm" action="Ambulance1.html" method="POST">
						<button class="btn btn-primary"> Send </button>
						<form:input type="hidden" value='${view.getuname()}' name="username" class="input-txt" id="username" path="userName" />
						<form:input type="hidden" value='${view.getmsg()}' name="username" class="input-txt" id="username" path="message" />
						<form:input type="hidden" value='${view.getid()}' name="username" class="input-txt" id="username" path="id" />
						<form:input type="hidden" value='${view.getstatus()}' name="username" class="input-txt" id="username" path="status" />
	</form:form>
						  </td>
						  
						  <td>
<form:form modelAttribute="ambulanceForm" action="Ambulance1.html" method="POST">
						<button class="btn btn-primary"> Send </button>
						<form:input type="hidden" value='${view.getuname()}' name="username" class="input-txt" id="username" path="userName" />
						<form:input type="hidden" value='${view.getmsg()}' name="username" class="input-txt" id="username" path="message" />
						<form:input type="hidden" value='${view.getid()}' name="username" class="input-txt" id="username" path="id" />
						<form:input type="hidden" value='${view.getstatus()}' name="username" class="input-txt" id="username" path="status" />
	</form:form>
						  </td>
						  
						  
 
						  
						  
        </tr> 
    		
    </c:forEach> 
</table> 


                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                            </div>
                        </div>
                    </div>
                    
                    </div>

                    
                 -->   


             
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>

    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
   
    <!-- METISMENU SCRIPTS -->
    <spring:url value="/resources/assets/js/jquery.metisMenu.js" var="JS5" />
    <script src="${JS5}"></script>

    <!-- CUSTOM SCRIPTS -->
    <spring:url value="/resources/assets/js/custom.js" var="JS6" />
    <script src="${JS6}"></script>
    
    
        <!-- CUSTOM SCRIPTS -->
    <spring:url value="/resources/assets/js/bootstrap-datetimepicker.js" var="JSB" />
    <script src="${JSB}"></script>
    
            <!-- CUSTOM SCRIPTS -->
    <spring:url value="/resources/assets/js/bootstrap-datetimepicker.fr.js" var="JSB1" />
    <script src="${JSB1}"></script>
    
    
    
    <script>
    	$(".book_room").click(function() {
    		var PN = document.getElementById("patient_name_booking").value;
    		var DN = document.getElementById("doctor_name_booking").value;
    		var SD = document.getElementById("start_date").value;
    		var ED = document.getElementById("end_date").value;
    		
<!--    		$.ajax({
                type: "GET",
                url: '@Url.Action("BookRoomController", "book_room")',
                contentType: "application/json; charset=utf-8",
                data: { id: appId , status: selectedItem },
                dataType: "json",
                success: function() { alert('Success'); }

                });
    -->		

    		$.ajax({
    			type : "POST",
    			contentType : "application/json",
    			url : "${home} messageForm.html",
    			data : { id: PN , status: DN },//JSON.stringify(search),
    			dataType : 'json',
    			success : function(data) {
    				alert('Success');
    			}
    		});
    		
    		
    	});
    </script>
    
    
    
    <script type="text/javascript">
    $('.form_datetime').datetimepicker({
                    format: "yyyy-mm-ddThh:ii"

    });

</script>



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