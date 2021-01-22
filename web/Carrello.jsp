<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Carrello" %><%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 14/10/2020
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Phone Store.it - Carrello</title>
    <%@include file="imports.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>

<section>
    <!--Grid row-->
    <div class="row">
        <!--Grid column-->
        <div class="col-lg-7">
    <%
        Object obj = request.getAttribute("carrello");
        Carrello c = new Carrello();
        List<Ordine> lst = c.getOrdine();
        if (obj instanceof List)
            lst = (List<Ordine>) obj;

        if(lst != null && !lst.isEmpty()){
            for (Ordine o : lst) { %>

            <!-- Card -->
            <div class="mb-3">
                <div class="pt-4 wish-list">
                    <div class="row mb-4">
                        <div class="col-md-5 col-lg-3 col-xl-3">
                            <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                    <div class="mask">
                                        <img class="img-fluid w-100" src="<%o.getP().getFoto();%>"> <!--FOTO-->
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-9 col-xl-9">
                            <div>
                                <div class="d-flex justify-content-between">
                                    <div id="nomecontainer">
                                        <h5><%o.getP().getNome();%></h5><!--NOME-->
                                        <p class="mb-3 text-muted text-uppercase small"><%o.getP().getDescrizione();%></p><!--DESCRIZIONE-->
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div id="btn">
                                        <a href="#" type="button" class="card-link-secondary small text-uppercase mr-3"><i
                                                class="fas fa-trash-alt mr-1"></i> Rimuovi </a>
                                    </div>
                                    <p class="mb-0"><span><strong id="summary"><%o.getP().getPrezzo();%></strong></span></p><!--PREZZO-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">

                    <p class="text-primary mb-0"><i class="fas fa-info-circle mr-1"></i> Non ritardare l'acquisto, aggiungendo
                        articoli al carrello non significa prenotarli</p>

                </div>
            </div>
            <!-- Card -->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-4">

            <!-- Card -->
            <div class="mb-3">
                <div class="pt-4">

                    <h5 class="mb-3">Riepilogo </h5>

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                            Totale parziale
                            <span><%o.prezzoTotale();%></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                            Spedizione
                            <span>Gratis</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                            <div>
                                <strong>Totale </strong>
                            </div>
                            <span><strong><%o.prezzoTotale();%></strong></span>
                        </li>
                    </ul>

                    <button type="button" class="btn btn-primary btn-block">Acquista</button>

                </div>
            </div>
            <!-- Card -->

        </div>
        <!--Grid column-->

    </div>
    <!-- Grid row -->

    <%}
    } %>
</section>
<!--Section: Block Content-->


<%@include file="footer.jsp"%>
<script src="js/Carrello.js"></script>
<script>$.getJSON("AsyncCartServlet", function (json) {
    $.each(json, function() {
        $("#main").append(constractCard(this))

    })
})</script>


</body>

</html>
