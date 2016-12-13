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

         <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 

    
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
                        <a class="active-menu" href="room_booking.html"><i class="fa fa-desktop fa-3x"></i> Rooms</a>
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
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2 style="float:left;">Rooms</h2> 	
                        
                            <form action="graph.html" method="POST">
					<input type="hidden" value="${theName}"name="userName"/>
					<c:if test='${role== "doctor"}'>
                        <button style="margin-left:950px;" class="btn btn-success"> Best Fit</button>
					
					</c:if>
</form>

                    <!--     <h5>Welcome Jhon Deo , Love to see you back. </h5>
					 -->
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row ">
                    <!-- Container for rooms -->
                    <div class="container">
                        <button id="menu-toggle" class="menu-toggle"><span>Menu</span>
                        </button>
                        <div id="theSidebar" class="sidebar" style="width:0px;left:-40px;">
                        </div>
                        
                        <div id="theGrid" class="main table-responsive">
                            <!-- First Floor -->
                            <section class="grid">
                                <c:set var="count" value="0" />
                                <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
                                                <button class="btn  disabled" style="padding:5px; text-align: center;  font-weight: 900px; width: 100%">Floor: 1
                                                     : Operating Rooms

                                                </button>

                                            </div>
                                <c:forEach var="row" items="${result.rows}">
                                    <c:if test='${row.floor == "1"}'>
                                    
                                        <a class="grid__item" href="#">
                                            <h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
                                            <div class="loader"></div>
                                            <span class="category">Operating Room</span>
                                            <div class="meta meta--preview">
                                                <c:choose>
                                                    <c:when test="${row.status == '0' }">
                                                        <img class="meta__avatar" src="${emptyroom}" alt="empty" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="meta__avatar" src="${reserved}" alt="reserved" />
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </a>
                                    </c:if>

                                    <c:if test='${row.floor == "2"}'>

                                        <c:if test="${count ==  0}">
                                            <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
                                                <button class="btn  disabled" style="padding:5px; text-align: center;  font-weight: 900px; width: 100%">Floor:
                                                    <c:out value="${ row.floor}" /> : Operating Rooms

                                                </button>

                                            </div>
                                        </c:if>
                                        <a class="grid__item" href="#">
                                            <h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
                                            <div class="loader"></div>
                                            <span class="category">Operating Room</span>
                                            <div class="meta meta--preview">
                                                <c:choose>
                                                    <c:when test="${row.status == '0' }">
                                                        <img class="meta__avatar" src="${emptyroom}" alt="empty" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="meta__avatar" src="${reserved}" alt="reserved" />
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </a>
                                        <c:set var="count" value="2" />

                                    </c:if>

                                    <c:if test='${row.floor == "3"}'>

                                        <c:if test="${count ==  2}">
                                            <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
                                                <button class="btn  disabled" style="padding:5px; text-align: center;  font-weight: 900px; width: 100%">Floor:
                                                    <c:out value="${ row.floor}" /> : Ward Rooms

                                                </button>

                                            </div>
                                        </c:if>
                                        <a class="grid__item" href="#">
                                            <h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
                                            <div class="loader"></div>
                                            <span class="category">Ward Room</span>
                                            <div class="meta meta--preview">
                                                <c:choose>
                                                    <c:when test="${row.status == '0' }">
                                                        <img class="meta__avatar" src="${emptyroom}" alt="empty" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="meta__avatar" src="${reserved}" alt="reserved" />
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </a>
                                        <c:set var="count" value="3" />

                                    </c:if>



                                    <c:if test='${row.floor == "4"}'>

                                        <c:if test="${count ==  3}">
                                            <div class="hello" style="display:block; width: 100%; padding: 20px; text-align: center;">
                                                <button class="btn  disabled" style="padding:5px; text-align: center;  font-weight: 900px; width: 100%">Floor:
                                                    <c:out value="${ row.floor}" /> : Ward Rooms	

                                                </button>

                                            </div>
                                        </c:if>
                                        <a class="grid__item" href="#">
                                            <h2 class="title title--preview">
								<c:out value="${row.RoomNo}"/>
							</h2>
                                            <div class="loader"></div>
                                            <span class="category">Ward Room</span>
                                            <div class="meta meta--preview">
                                                <c:choose>
                                                    <c:when test="${row.status == '0' }">
                                                        <img class="meta__avatar" src="${emptyroom}" alt="empty" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="meta__avatar" src="${reserved}" alt="reserved" />
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </a>
                                        <c:set var="count" value="4" />

                                    </c:if>


                                </c:forEach>
                            </section>
                            <section class="content">
                                <div class="scroll-wrap">

                                    <c:forEach var="row" items="${result.rows}">
                                        <article class="content__item">
                                            <c:choose>
                                                <c:when test='${row.status == "0" }'>
                                                    <!-- Room Not reserved -->
                                                    
                                                    <c:if test='${row.type  == "operating"}'>
                                                    <span class="category category--full">Operating Room</span>
                                                    </c:if>
                                                    
                                                    <c:if test='${row.type  == "emergency"}'>
                                                    <span class="category category--full">Emergency Room</span>
                                                    </c:if>
                                                    
                                                    <c:if test='${row.type  == "ward"}'>
                                                    <span class="category category--full">Ward Room</span>
                                                    </c:if>
                                                    
                                                   
                                                    
                                                    
                                                    <h2 class="title title--full">
																		<c:out value="${row.RoomNo}"/>
																		
																		</h2>
                                                    <div class="meta meta--full">
                                                        <img class="meta__avatar" src="${emptyroom}" alt="author01" />
                                                    </div>
                                                    
                                                    <!-- retrieve room numbers -->
                                                    <sql:query dataSource="${snapshot}" var="result2">
                                                        SELECT role from users WHERE user_name="<c:out value='${theName }' />"  AND role != "ambulance";
                                                      
                                                    </sql:query>
                                                    <!-- retrieve room numbers -->
                                                    <c:forEach var="row2" items="${result2.rows}">
                                                        <c:choose>
                                                            <c:when test='${row2.role == "doctor" && row.type != "operating" }'>
                                                                <div id="inner_container" class="inner_container">
                                                                    <p> </p>
                                                                    <div class=inner2>
                                                                    <form action="messageForm.html">
                                                                    <input type="hidden" value="<c:out value="${row.RoomNo}"/>" name="roomNo" />
                                                                    <input type="hidden" value="<c:out value="${theName}"/>" name="Dname">
                                                                        <button class="button send_message">Send message to service desk</button>
                                                                     </form>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div id="inner_container" class="inner_container">
                                                                    <p> </p>

<sql:query dataSource="${snapshot}" var="result2">
 SELECT user_name from users WHERE role = "doctor";
</sql:query>



      <form method="POST" action="welcome">
      <input type="hidden" value='<c:out value="${row.RoomNo}"/>' name="roomnumber"/>
  

    <table>
        <tr>
            <td style="width:130px;">Patient Name :</td>
            <td id="val"><input type="text" class="form-control" id="name" name="name" placeholder="Enter Patient's name"/></td>
        </tr>
        <tr>
            <td>Doctor name :</td>
            <td id="val">
            
            <c:choose>
            <c:when test='${role == "doctor" }'>
                        <input type="text" value = "${theName }" class="form-control" id="name" name="password"  readonly/>
            
            </c:when>
            <c:otherwise>
                        <select class="form-control" id="password" name="password" >
                       <option value="" selected>Select the Doctor </option>
            <c:forEach var="row3" items="${result2.rows}" >
  <option value="<c:out value="${ row3.user_name}" />" > <c:out value="${ row3.user_name}" /></option>
  </c:forEach>
</select>      
            </c:otherwise>
            </c:choose>

            
      
            
            </td>
        </tr>
		<tr>
            <td>Start Date:</td>
            <td id="val">
                <div class="input-group date form_datetime col-md-5" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input name="sdate" class="form-control" size="80" type="text" value="" readonly />
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
            
            
         </tr>
        <tr>
            <td>End Date:</td>
            <td id="val">
            <div class="input-group date form_datetime col-md-5" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
            <input type="text" class="form-control" name="edate" value="" readonly />
            					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
            
            
            
</td>
        </tr>
        </table>
        <br>
        <div style="margin-left:300px;"><input type="submit" value="Book the room" class="btn btn-primary" >
            </div>
</form>

                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    <!--  Room not reserved ends -->
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Room Booked -->
                                                    <!---  -->
                                                    <sql:query dataSource="${snapshot}" var="result1">
                                                        SELECT * from room_booking WHERE RoomNo =
                                                        <c:out value="${row.RoomNo}" />;
                                                    </sql:query>
                                                    <!---- ---->
                                                    <c:forEach var="row1" items="${result1.rows }">

       
                                                    <c:if test='${row.type  == "operating"}'>
                                                    <span class="category category--full">Operating Room</span>
                                                    </c:if>
                                                    
                                                    <c:if test='${row.type  == "emergency"}'>
                                                    <span class="category category--full">Emergency Room</span>
                                                    </c:if>
                                                    
                                                    <c:if test='${row.type  == "ward"}'>
                                                    <span class="category category--full">Ward Room</span>
                                                    </c:if>
                                                    
                                                   
                                                    
                                                    

                                                        <h2 class="title title--full">
																		<c:out value="${row.RoomNo}"/>
																		
																		</h2>
                                                        <div class="meta meta--full">
                                                            <c:choose>
                                                    <c:when test="${row.status == '0' }">
                                                        <img class="meta__avatar" src="${emptyroom}" alt="empty" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="meta__avatar" src="${reserved}" alt="reserved" />
                                                    </c:otherwise>
                                                </c:choose>
                                                        </div>
                                                        <div id="inner_container" class="inner_container">
      <form method="POST" action="freeRoom.html">
<input value='<c:out value="${row.RoomNo}"/>' name="roomFree" type="hidden"/>
                                                            <div class=inner2>
                                                                <div class="inner2-left">
                                                                    <p></p>
                                                                    <p>Patient Name:</p>
                                                                    <p>Doctor Name:</p>
                                                                    <p>Start Date:</p>
                                                                    <p>End Date:</p>
                                                                </div>
                                                                <div class="inner2-right">
                                                                    <p></p>
                                                                    <p>
                                                                        <c:out value="${row1.patient_name}" />
                                                                    </p>
                                                                    <p>
                                                                        <c:out value="${row1.doctor_name}" />
                                                                    </p>
                                                                    <p>
                                                                        <c:out value="${row1.start_date}" />
                                                                    </p>
                                                                    <p>
                                                                        <c:out value="${row1.end_date}" />
                                                                    </p>

                                                                </div>
                                                            </div>
                                                            <br>
<c:if test='${theName == row1.doctor_name}'>
        <div style="margin-left:300px;"><input type="submit" value="Free this room" class="btn btn-primary" >
</c:if>
<c:if test='${role== "sd"}'>
        <div style="margin-left:300px;"><input type="submit" value="Free this room" class="btn btn-primary" >
</c:if>





</form>
                                                        </div>
                                                    </c:forEach>
                                                    <!-- Room Booked -->
                                                </c:otherwise>
                                            </c:choose>
                                        </article>

                                    </c:forEach>
                                </div>
                                <button class="close-button"><i class="fa fa-close"></i><span>Close</span>
                                </button>
                            </section>
                        </div>
                    </div>
                    <!-- /container -->
                    <!-- Container for rooms -->

                    <spring:url value="/resources/assets/js/Js_room/main.js" var="JS1" />
                    <spring:url value="/resources/assets/js/Js_room/classie.js" var="JS2" />

                    <script src="${JS1}"></script>
                    <script src="${JS2}"></script>



                </div>
                <!-- /. ROW  -->
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