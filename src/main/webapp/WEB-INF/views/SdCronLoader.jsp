<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- db -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  db -->

    <!-- Database connectivity-->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/springexamples" user="root" password="" />


<html>
<head>

<style type="text/css">
.ui-widget.success-dialog {
    font-family: Verdana,Arial,sans-serif;
    font-size: .8em;
}

.ui-widget-content.success-dialog {
    background: #F9F9F9 !important;
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
    background: #b0de78;
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
<script type="text/javascript">


function emergency() {
    $(document).ready( function() {
    	ShowCustomDialog();
    });
    }

			function ShowCustomDialog()
			{
			ShowDialogBox('Warning','Emergency message!!!!!.','Go to message page','', 'GoToAssetList',null);
			}

            function ShowDialogBox(title, content, btn1text, btn2text, functionText, parameterList) {
                var btn1css;
                var btn2css;

                if (btn1text == '') {
                    btn1css = "hidecss";
                } else {
                    btn1css = "showcss";
                }

                if (btn2text == '') {
                    btn2css = "hidecss";
                } else {
                    btn2css = "showcss";
                }
                $("#lblMessage").html(content);

                $("#dialog").dialog({
                    resizable: false,
                    title: title,
                    modal: true,
                    width: '400px',
                    height: 'auto',
                    bgiframe: false,
                    hide: { effect: 'scale', duration: 400 },

                    buttons: [
                                    {
                                        text: btn1text,
                                        "class": btn1css,
                                        click: function () {
                                          $(this).dialog("close");
                                          
                                          
                                          window.setTimeout(function(){
                                              window.location.href = 'Ambulance1.html';
                                          }, 250);
                                          
                                        }
                                    }
                                ]
                });
            }

            
</script>
</head>
<body>


 
<c:set var="count" value="no"></c:set>
<c:if test='${role == "sd"}'>

 <!-- retrieve seenstatus -->
                                                    <sql:query dataSource="${snapshot}" var="result">
                                                        SELECT * from messages;
                                                    </sql:query>
                                                    
 <!-- retrieve seenstatus -->
 
 <c:forEach var="row" items="${ result.rows}">
 <c:if test="${row.seenstatus  == 0}">
<c:set var="count" value="yes"></c:set>
 </c:if>
 </c:forEach>
          
          
<c:if test='${count == "yes" }'>
 <script type="text/javascript"> window.onload = emergency(); </script>
 

</c:if>

                                          
</c:if>
</body>
</html>


