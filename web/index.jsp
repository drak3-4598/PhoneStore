<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <!-- meta -->
<%@include file="imports.jsp"%>
  <title> PhoneStore</title>
</head>
<body>

<%@include file="nav.jsp"%>
<div id="main" class="mb-2"></div>

<%@include file = "footer.jsp" %>
<script src="js/add.js"></script>
<script>$.getJSON("prova", function (json) {

  $.each(json, function() {
    $("#main").append(constractCard(this))

  })
})</script>

</body>
</html>