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

    <script src="js/validation.js"></script>
    <title>Phone Store.it - Registrazione</title>

</head>
<body>
<%@include file="nav.jsp"%>
<div class="container" id="verticale">
<!-- Default form register -->
    <%if(request.getAttribute("Error")!=null){ %>
    <div class="alert alert-success" role="alert">
        This is a success alert—check it out!
    </div>
    <% }%>
<form class="text-center border border-dark p-5" action="RegistrazioneServlet" method="post">

    <p class="h4 mb-4">Sign up</p>

    <div class="form-row mb-4">
        <div class="col">
            <!-- First name -->
            <input type="text"   id="defaultRegisterFormFirstName" class="form-control" placeholder="Nome" name="nome" onfocus = "focuser(this.form.name)" onblur = "blurer(this.form.name)" >
        </div>
        <div class="col">
            <!-- Last name -->
            <input type="text"  id="defaultRegisterFormLastName"  class="form-control" placeholder="Cognome" name="cognome" onfocus = "focuser(this.form.surname)" onblur = "blurer(this.form.surname)" >
        </div>
    </div>

    <!-- E-mail -->
    <input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail" name="email" onfocus = "focuser(this.form.email)" onblur = "blurer(this.form.email)" >

    <!-- Password -->
    <input type="password" id="defaultRegisterFormPassword" class="form-control" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock" name="password" onfocus = "focuser(this.form.password)" onblur = "blurer(this.form.password)">
    <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
        Almeno 8 caratteri alfanumerici
    </small>

    <!-- Indirizzo -->
    <input type="text" class="form-control" placeholder="Indirizzo" name="indirizzo" >
    <small class="form-text text-muted mb-4">
    </small>

    <!-- Sign in button -->
    <button class="btn btn-dark-green btn-block my-4" type="submit">Registrati</button>


</form>



    <script>
        $(document).ready(function() {
            $.getScript("js/validation.js");

            function validation () {
                var list = new Array (5);
                var flag = true;

                list[0] = new Validator ($("name"), /^[A-Z][a-zA-Z][^#&<>"~;$^%{}?]{1,20}$/,
                    $("nameWarning"), "there shouldn't be any numbers or special characters");
                list[1] = new Validator ($("surname"), /^[A-Z][a-zA-Z][^#&<>"~;$^%{}?]{1,20}$/,
                    $("surnameWarning"), "there shouldn't be any numbers or special characters");
                list[2] = new Validator ($("email"), /^[a-zA-Z0-9.!#$%&’+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)$/,
                    $("emailWarning"), "the inserted value is not an email");
                list[3] = new Validator ($("password"), /^(?=.[0-9])(?=.[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/,
                    $("passwordWarning"), "the password is too short or weak");


                for (var i = 0; i < 5 ; i++)
                {
                    if (!list[i]["verifier"]())
                        flag = false;
                }

                return flag;
            }
        });
    </script>
</div>
</body>
<%@include file="footer.jsp"%>
</html>
