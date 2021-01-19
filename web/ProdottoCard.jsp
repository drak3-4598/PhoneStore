<%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 14/10/2020
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.List, model.Prodotto"%>
<link rel="stylesheet" href="css/index.css">
<%@include file="imports.jsp"%>


<%
    Object obj = request.getAttribute("prodotto");
    List<Prodotto> lst = null;
    if (obj instanceof List)
        lst = (List<Prodotto>) obj;

    if(lst != null ? !lst.isEmpty() : false){
        for (Prodotto c : lst) { %>

<!-- Page Content -->
<div class="container">
    <!-- Project One -->
    <div class="row">
        <div class="col-md-5">
            <a href="#">
                <img class="img-fluid rounded mb-3 mb-md-0" src=<%c.getFoto();%> alt="">
            </a>
        </div>
        <div class="col-md-5">
            <h2><%c.getNome();%></h2>
            <p><%c.getDescrizione();%></p>
            <p><%c.getQuantita();%></p>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Visualizza
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"><%c.getNome();%></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
                            <button type="button" class="btn btn-primary">Aggiungi al carrello</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%}
} %>