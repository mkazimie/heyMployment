<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 23.04.2020
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Successful Registration</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="col-md-6 offset-md-4 alert alert-success mt-5" role="alert">
        <strong>Well done!</strong> You signed up successfully!
    </div>
    <div>
        <img src="images/undraw_confirmation_2uy0.png"/>
    </div>
    <div class="col-md-6 offset-md-4">
        <div class="text-center spacer"> Go to Login page</div>
        <a href="/login" class="btn btn-block btn-link" role="button"> Sign In </a>
    </div>
</div>
</body>
</html>
