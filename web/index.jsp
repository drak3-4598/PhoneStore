<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <!-- meta -->
<%@include file="imports.jsp"%>
  <title> PhoneStore.it </title>
</head>
<body>

<%@include file="nav.jsp"%>
<div id="main" class="mb-2"></div>

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
            <td id="prezzo">&euro;</td>
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




<%@include file = "footer.jsp" %>
<script src="js/add.js"></script>
<script>$.getJSON("prova", function (json) {

  $.each(json, function() {
    $("#main").append(constractCard(this))

  })
})</script>

</body>
</html>