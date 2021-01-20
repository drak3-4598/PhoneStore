
<%@ page import="java.util.List" %>
<%@ page import="model.Utente" %><%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 11/01/2021
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <TITLE>PhoneStore</TITLE>
        <%@include file="imports.jsp"%>
    </head>
    <body>
    <%@include file="nav.jsp"%>
    <!--Table-->
    <div class="container-fluid mt-4 mb mb-auto">
        <table id="tablePreview" class="table table-sm table-bordered">
            <!--Table head-->
            <thead class="thead-dark">
                <tr>
                    <th>Email</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th></th>
                </tr>
            </thead>
            <!--Table head-->
            <!--Table body-->
            <tbody id="main">

            </tbody>
            <!--Table body-->
        </table>
        <!--Table-->
    </div>

    <%@include file="footer.jsp"%>
    <script src="js/EliminaUt.js"></script>
    <script>$.getJSON("AsyncServletUtente", function (json) {
        $.each(json, function() {
            $("#main").append(constractCard(this))

        })
    })</script>
    </body>
</html>