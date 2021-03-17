<%--
  Created by IntelliJ IDEA.
  User: dadea
  Date: 16/03/2021
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PhoneStore.it - Checkout</title>
    <%@include file="imports.jsp"%>
    <link rel="stylesheet" href="css/check.css">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro" rel="stylesheet">

</head>
<body>
<%@include file="nav.jsp"%>

<div class=content>
    <div class="wrapper-1">
        <div class="wrapper-2">
            <h1>Grazie !</h1>
            <p>Thanks a bunch for filling that out. It means a lot to us, just like you do! We really appreciate you giving us a moment of your time today.</p>
            <p>Thanks for being you.. </p>
            <button class="go-home" onclick="window.location.href ='index.jsp' ">
                Torna all' Homepage
            </button>
        </div>
        <div class="footer-like">
            <p>Hai dei problemi?
                <a href="#">Contattaci</a>
            </p>
        </div>
    </div>
</div>






<%@include file="footer.jsp"%>
</body>
</html>
