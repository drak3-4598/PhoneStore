<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@include file="imports.jsp"%>
    <title>Phone Store- Login</title>
</head>
<body>
<%@include file="nav.jsp"%>

<!-- Default form login -->
<div class="container" id="verticale">
<form class="text-center border border-dark p-5" action="LoginServlet" method="post">

    <p class="h4 mb-4">Sign in</p>

    <!-- Email -->
    <input type="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail" name="email">

    <!-- Password -->
    <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password" name="password">

    <div class="d-flex justify-content-around">
        <div>
            <!-- Remember me -->
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
            </div>
        </div>
    </div>

    <!-- Sign in button -->
    <button class="btn btn-dark-green btn-block my-4" type="submit">Sign in</button>

    <!-- Register -->
    <p>Not a member?
        <a href="Registrazione.jsp">Register</a>
    </p>
</form>
</div>
</body>
<%@include file="footer.jsp"%>
</html>
