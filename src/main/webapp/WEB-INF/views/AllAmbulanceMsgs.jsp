<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



                
                                              
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









</body>
</html>