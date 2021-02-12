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
<div class="container mt-4" id="verticale" >
<!-- Default form register -->
    <%if(request.getAttribute("Error")!=null){ %>
    <div class="alert alert-success" role="alert">
        This is a success alert—check it out!
    </div>
    <% }%>
<form class="text-center border border-dark p-5" action="RegistrazioneServlet" name="form" method="post">

    <p class="h4 mb-4">Sign up</p>

    <div class="form-row mb-4">
        <div class="col">
            <!-- First name -->
            <input type="text"   id="defaultRegisterFormFirstName" class="form-control" placeholder="Nome"  name="nome" onfocus = "focuser(this.form.name)" onblur = "blurer(this.form.name)" required>
        </div>
        <div class="col">
            <!-- Last name -->
            <input type="text"  id="defaultRegisterFormLastName"  class="form-control" placeholder="Cognome"  name="cognome" onfocus = "focuser(this.form.surname)" onblur = "blurer(this.form.surname)" required>
        </div>
    </div>

    <!-- E-mail -->
    <input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" onfocus = "focuser(this.form.email)" onblur = "blurer(this.form.email)" required>

    <!-- Password -->
    <input type="password" id="defaultRegisterFormPassword" class="form-control" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock" pattern=".{8,}" required name="password" onfocus = "focuser(this.form.password)" onblur = "blurer(this.form.password)">
    <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
        Almeno 8 caratteri alfanumerici
    </small>

    <!-- Indirizzo -->
    <input type="text" id="address" class="form-control" placeholder="Indirizzo" pattern="[a-z][A-Z]" name="indirizzo"  required>
    <small class="form-text text-muted mb-4">
    </small>

    <!-- Sign in button -->
    <button class="btn btn-dark-green btn-block my-4" type="submit">Registrati</button>


</form>


</div>
</body>
<%@include file="footer.jsp"%>
</html>
