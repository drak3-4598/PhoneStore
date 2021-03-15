<%@ page import="model.Fattura" %><%--
  Created by IntelliJ IDEA.
  User: dadea
  Date: 09/02/2021
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="imports.jsp"%>
    <title>PhoneStore.it - I miei Ordini</title>
</head>
<body>
<%@include file="nav.jsp"%>
<!--Table-->
<%Fattura fattura = (Fattura) session.getAttribute("fattura");%>
<div class="container-fluid mt-4 mb mb-auto">
    <table id="tablePreview" class="table table-sm table-bordered">
        <!--Table head-->
        <thead class="thead-dark">
        <tr>
            <th>#Codice Fattura</th>
            <th>Codice Telefono</th>
            <th>Nome Telefono</th>
            <th>Quantità</th>
        </tr>
        </thead>
        <!--Table head-->
        <!--Table body-->
        <tbody id="main">
        <tr>
            <th></th>
            <th></th>
            <th>></th>
            <th>Age</th>
        </tr>
        </tbody>
        <!--Table body-->
    </table>
    <!--Table-->
</div>


</body>
<%@include file="footer.jsp"%>
</html>
