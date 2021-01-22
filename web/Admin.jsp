<%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 23/10/2020
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PhoneStore - Admin</title>
    <%@include file="imports.jsp"%>
</head>
<body>

<%@include file="nav.jsp"%>
<div class="card" style="width: 18rem; margin: auto; float: none; margin-bottom: 20px;margin-top: 20px;">

        <fieldset>
            <img class="card-img-top" src="https://www.curryflow.com/wp-content/uploads/2020/05/admin-icon-png-14.png-2.jpeg" alt="Card image cap">
            <div class="card-body">

                <h5 class="card-title" style="text-align: center">Benvenuto Admin</h5>
                <p class="card-text" style="text-align: center">Cosa desideri fare?</p>
                <a href="AggiungiProdotto.jsp" class="btn btn-primary">Aggiungere prodotto</a><br>
                <a href="GestioneProdotto.jsp" class="btn btn-primary">Gestire Prodotti</a><br>
                <a href="EliminaUtente.jsp" class="btn btn-primary">Elimina utente</a><br>
            </div>
        </fieldset>

</div>
<%@include file="footer.jsp"%>
</body>
</html>