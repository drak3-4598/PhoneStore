<%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 15/10/2020
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- meta -->
    <%@include file="imports.jsp"%>

    <title>PhoneStore.it - Registrazione</title>

</head>
<body>
<%@include file="nav.jsp"%>
<div class="container mt-4 d-flex justify-content-center" id="verticale" >
    <!-- Default form register -->
    <form class="text-center border border-dark p-5" action="RegistrazioneServlet" name="form" method="post">
        <%
            Boolean error = (Boolean) request.getAttribute("Error");
            if(error == null ? false : error.booleanValue()) {
        %>
        <div class="error">
            <p>Warning<br>
                username già esistenti
            </p>
        </div>
        <%}%>

        <p class="h4 mb-4">Sign up</p>

        <div class="form-row mb-4">
            <div class="col">
                <!-- First name -->
                <input type="text"  id="defaultRegisterFormFirstName" class="form-control" placeholder="Nome"  name="nome" onfocus = "focuser(this.form.name)" onblur = "blurer(this.form.name)" required>
                <div id= "nameWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il nome deve essere una singola stringa di caratteri</div>
            </div>
            <div class="col">
                <!-- Last name -->
                <input type="text"  id="defaultRegisterFormLastName"  class="form-control" placeholder="Cognome"  name="cognome" onfocus = "focuser(this.form.surname)" onblur = "blurer(this.form.surname)" required>
                <div id= "surnameWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il cognome deve essere una singola stringa di caratteri</div>
            </div>
        </div>

        <!-- E-mail -->
        <input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" onfocus = "focuser(this.form.email)" onblur = "blurer(this.form.email)" required>
        <div id= "emailWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> email non valida</div>

        <!-- Password -->
        <input type="password" id="defaultRegisterFormPassword" class="form-control" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock" pattern=".{8,}" required name="password" onfocus = "focuser(this.form.password)" onblur = "blurer(this.form.password)">
        <div id= "passwordWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong>la password non è valida, deve essere tra 8 e 25 caratteri</div>

        <!-- Indirizzo -->
        <input type="text" id="address" class="form-control" placeholder="Indirizzo"  name="indirizzo"  required>


        <!-- Sign in button -->
        <button class="btn btn-dark-green btn-block my-4" type="submit">Registrati</button>


    </form>


</div>
</body>
<%@include file="footer.jsp"%>
<script src = "js/validation.js"></script>
</html>

