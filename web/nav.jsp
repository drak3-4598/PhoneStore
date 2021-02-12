<%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 14/10/2020
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- nav -->
<nav class="navbar navbar-expand-lg navbar-expand-sm navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="index.jsp">
        <img src="img/logo-phonestore-bianco.png" width="250" height="50" class="d-inline-block align-top" alt="">
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active mr-1">
                <a class="nav-link" href="index.jsp">Home </a>
            </li>

            <li class="nav-item  dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Brand</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="Catalogo.jsp?cat=Samsung"><img class = "img-fluid" src="img/1024px-Samsung_Logo.svg.png"></a>
                    <a class="dropdown-item" href="Catalogo.jsp?cat=Apple"><img class="img-fluid" src="img/59-591019_apple-logo-png-photos-apple-logo-and-name.png"></a>
                    <a class="dropdown-item" href="Catalogo.jsp?cat=Huawei"><img class="img-fluid" src="img/Huawei-Logo.png"></a>
                    <a class="dropdown-item" href="Catalogo.jsp?cat=Honor"><img class="img-fluid" src="img/1200px-LOGO_Honor.svg.png"></a>
                    <a class="dropdown-item" href="Catalogo.jsp?cat=Xiaomi"><img class="img-fluid" src="img/Xiaomi-Logo.png"></a>
                </div>
            </li>

            <li class="navListSearch ">
                <div >
                    <form class="form-inline my-2 my-lg-0" role="search" action="Catalogo.jsp" method="get">
                        <div class="form-group">
                            <input type="text" name="srch" class="form-control" placeholder="Cerca un prodotto">
                        </div>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cerca</button>
                    </form>
                </div>
            </li>
        </ul>
        <%
            if(session.getAttribute("utente") != null){
        %>

        <ul class="navbar-nav">
        <li class="nav-item  dropdown mr-1">
            <a class="nav-link dropdown-toggle" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">Il mio Account</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="Profilo.jsp">Profilo</a>
                <a class="dropdown-item" href="Ordine.jsp">I miei ordini</a>
                <a class="dropdown-item" href="LogoutServlet">Logout</a>
            </div>
        </li>
        <a class="navbar-brand" href="Carrello.jsp">
            <img src="img/cart-64.png" width="30" height="30" class="d-inline-block align-top" alt=""> Carrello </a>
        </ul>

        <%
        }else if(session.getAttribute("admin") != null){
        %>
        <ul class="navbar-nav">
            <li class="nav-item  dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">Il mio Account</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="Admin.jsp">Operazioni</a>
                    <a class="dropdown-item" href="LogoutServlet">Logout</a>
                </div>
            </li>
        </ul>
        <%
        }else {
        %>
        <a class="navbar-brand" href="Login.jsp">
            <img src="img/guest-32.png" width="30" height="30" class="d-inline-block align-top" alt=""> Accedi</a>
        <a class="navbar-brand" href="Carrello.jsp">
            <img src="img/cart-64.png" width="30" height="30" class="d-inline-block align-top" alt=""> Carrello </a>
        <%}%>

    </div>
</nav>
<%
%>

