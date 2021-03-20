<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@include file="imports.jsp"%>
    <title>PhoneStore.it - Login</title>
</head>
<body>
<%@include file="nav.jsp"%>

<!-- Default form login -->
<div class="container mt-4 mb-auto d-flex justify-content-center" id="verticale" >
    <form class="text-center border border-dark p-5" action="LoginServlet" method="post">
        <%
            Boolean warning = (Boolean) request.getAttribute("warning");
            if (warning == null ? false : warning) {
        %>
        <div id="alert3" class="alert" style=""><span class="closebtn" onclick="this.parentElement.style.display='none';">×</span> <strong>Errore!</strong> Nome utente o password non corretti</div>
        <%}
        %>

        <p class="h4 mb-4">Entra</p>

        <!-- Email -->
        <input type="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail" name="email">

        <!-- Password -->
        <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password" name="password">

        <div class="d-flex justify-content-around">
            <div>
                <!-- Remember me -->
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                    <label class="custom-control-label" for="defaultLoginFormRemember">Ricordami</label>
                </div>
            </div>
        </div>

        <!-- Sign in button -->
        <button class="btn btn-dark-green btn-block my-4" type="submit">Entra</button>

        <!-- Register -->
        <p>Non hai un account?
            <a href="Registrazione.jsp">Registrati</a>
        </p>
        <br>
        <br>
        <br>
    </form>
</div>


</body>
<script type = "text/javascript" src = "js/validation.js"></script>
<%@include file="footer.jsp"%>
</html>
