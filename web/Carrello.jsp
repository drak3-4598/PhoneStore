<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Carrello" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 14/10/2020
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.HashMap, model.Prodotto"%>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title> Phone Store.it - Carrello</title>
    <%@include file="imports.jsp"%>
    
</head>
<body>
<%@include file="nav.jsp"%>


<div class="container">
    <form action="AcquistaServlet" method="post">
        <div class="row">
            <div class="col-sm-12 col-md-10 col-md-offset-1">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Prodotto</th>
                        <th>Quantità</th>
                        <th class="text-center">Prezzo</th>
                        <th class="text-center">Totale</th>
                        <th> </th>
                    </tr>
                    </thead>

                    <%Carrello c = (Carrello) session.getAttribute("carrello");%>
                    <tbody>
                    <%if(c != null ? c.count()>0 : false) {

                        double totale = 0f;

                        for(Map.Entry<Prodotto, Integer> entry : c.getOrdine().entrySet()){
                            Prodotto p = entry.getKey();
                            Integer i = entry.getValue(); //Quantità

                            double parziale = i * p.getPrezzo();
                            totale += parziale;


                    %>
                    <tr id="<%=p.getCodiceTel()%>">
                        <td class="col-sm-8 col-md-6" >
                            <div class="media" >
                                <a class="thumbnail pull-left" href = "#" > <img class="media-object" src = "<%=entry.getKey().getFoto()%>" style = "width: 50px; height: 100px;" > </a >
                                <div class="media-body" >
                                    <h4 class="media-heading" ><a href = "#" > <%=entry.getKey().getNome()%></a ></h4 >
                                    <h5 class="media-heading" > by <a href = "#" > <%=entry.getKey().getMarca()%></a ></h5 >
                                    <span > Status: </span ><span class="text-success" ><strong > In Stock</strong ></span >
                                </div >
                            </div >
                        </td >
                        <td class="col-sm-1 col-md-1" style = "text-align: center" >
                            <input type = "number" class="form-control quantity " value = "<%=i%>" min="1" max="<%=p.getQuantita()%>"> <!--Quantità-->
                        </td >
                        <td class="col-sm-1 col-md-1 text-center" ><strong > &euro;<%=entry.getKey().getPrezzo()%> </strong ></td >
                        <td class="col-sm-1 col-md-1 text-center" ><strong id="parziale">&euro;<%=parziale%></strong ></td >
                        <td class="col-sm-1 col-md-1" >
                            <button type = "button" class="btn btn-danger remove" > <span class="glyphicon glyphicon-remove" ></span > Remove</button >
                        </td >
                    </tr >

                    <%} %>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Totale</h3></td>
                        <td  class="text-right"><h3><strong id="totale">&euro;<%=totale%></strong></h3></td>
                    </tr>

                   <% } else { %>

                    <tr>
                        <td id="msg"><h4><strong>Il carrello è vuoto! Aggiungi un prodotto...</strong></h4></td>
                    </tr>

                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Totale</h3></td>
                        <td  class="text-right"><h3><strong>&euro; 0.00</strong></h3></td>
                    </tr>



                   <% }  %>

                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                            <button type="button" class="btn btn-default "  onclick="location.href='index.jsp'">
                                <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                            </button></td>
                        <td>

                            <button type="submit" class="btn btn-success checkout">
                                Checkout <span class="glyphicon glyphicon-play"></span>
                            </button>

                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</div>

<%@include file="footer.jsp"%>
<script src="js/Carrello.js"></script>

</body>

</html>
