
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
    <%@include file="imports.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<!--Table-->
<form action="EliminaUtenteServlet" method="post">
    <table id="tablePreview" class="table table-sm">
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
            <%
                Object obj = request.getAttribute("utente");
                List<Utente> lst = null;
                if (obj instanceof List)
                    lst = (List<Utente>) obj;

                if(lst != null ? !lst.isEmpty() : false){
                    for (Utente u : lst) { %>
            <tr>
                <td id="email"><%u.getEmail();%></td>
                <td id="nome"><%u.getNome();%></td>
                <td id="cognome"><%u.getCognome();%></td>
                <td><button type="submit">Elimina</button></td>
            </tr>
        </tbody>
        <!--Table body-->
    </table>
    <!--Table-->
    <%}
    } %>

</form>
<%@include file="footer.jsp"%>
</body>
<script src="js/EliminaUt.js"></script>
<script>$.getJSON("AsyncServletUtente", function (json) {

    $.each(json, function() {
        $("#main").append(constractCard(this))

    })
})</script>

</html>