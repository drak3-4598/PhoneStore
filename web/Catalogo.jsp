<%--
  Created by IntelliJ IDEA.
  User: vince
  Date: 21/10/2020
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="imports.jsp"%>
    <TITLE>PhoneStore.it - Cerca</TITLE>
</head>
<body>

<%@include file="nav.jsp"%>
<%
    String cat= request.getParameter("cat");
    String srch= request.getParameter("srch");
    String url=null;
    if(cat != null){
        url="?cat="+ cat;

%>
    <p>

    </p>
<div id="main"class="mb-1"></div>
<%@include file = "footer2.jsp" %>
<%
    }else if(srch!= null){
        url="?srch="+srch.replace(' ','+');


        %>
<p>

</p>
<div id="main"class="mb-1"></div>
<%@include file = "footer.jsp" %>

<% }
   request.setAttribute("url",url);
%>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-side modal-top-right" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

                <table>
                    <tr>
                        <td>Seleziona la quantità</td>
                        <td><select id="qt"></select></td>
                    </tr>
                    <tr>
                        <td>Prezzo: </td>
                        <td id="prezzo"></td>
                    </tr>
                </table>

                <input type="hidden" id="codiceTel">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
                <button type="button" class="btn btn-primary" id="add" ><i class="fas fa-shopping-cart"></i> Aggiungi al carrello</button>
            </div>
        </div>
    </div>
</div>




<script src="js/add.js"></script>

<script>$.getJSON("prova${url}", function (json) {

    $.each(json, function() {
        $("#main").append(constractCard(this))

    })
})</script>
</body>
</html>
