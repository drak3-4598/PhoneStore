<%@ page import="model.Utente" %><%--
  Created by IntelliJ IDEA.
  User: dadea
  Date: 21/01/2021
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PhoneStore.it - Modifica Profilo</title>
    <link rel="stylesheet" href="css/profilo.css">
    <%@include file="imports.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<%Utente u = (Utente) session.getAttribute("utente");%>
<div class="container mt-5 mb-5" >
    <div class="container rounded bg-white mt-5" >
        <form action="ModificaProfiloServlet" method="post">
            <div class="row">
                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="img/user-01.png" width="90"><span class="font-weight-bold"><%=u.getNome()%></span><span class="text-black-50"><%=u.getEmail()%></span></div>
                    </div>
                    <div class="col-md-8">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                                    <a href="index.jsp"><h6>Torna indietro</h6></a>
                                </div>
                                <h6 class="text-right">Modifica Profilo</h6>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><input type="text" class="form-control" name="nome" placeholder="Nome" value="<%=u.getNome()%>"></div>
                                <div class="col-md-6"><input type="text" class="form-control" name="cognome" value="<%=u.getCognome()%>" placeholder="Cognome"></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6"><input type="text" class="form-control" name="email" placeholder="Email" value="<%=u.getEmail()%>"></div>
                                <div class="col-md-6"><input type="text" class="form-control" name="password" placeholder="Password" value="<%=u.getPassword()%>"></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6"><input type="text" class="form-control" name="indirizzo" placeholder="Indirizzo" value="<%=u.getIndirizzo()%>"></div>
                            </div>
                            <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="submit">Salva i dati</button></div>
                        </div>
                    </div>
            </div>
        </form>
    </div>
</div>
</body>
<%@include file="footer.jsp"%>
</html>
