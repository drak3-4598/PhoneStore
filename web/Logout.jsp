<%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 11/01/2021
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<html>
<head>
    <%@include file="imports.jsp"%>

<title>Logout</title>
</head>
<body>
<% session.invalidate(); %>
<p>Il logout � andato a buon fine!</p>
</body>
</html>
