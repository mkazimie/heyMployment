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
    <title> Register Success</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<%@include file="header-landing.jsp" %>
<nav class="bd-subnavbar pt-2 pb-3 pb-md-2 bg-success">
    <div class="container d-flex align-items-md-center py-2">
        <nav class="nav mx-auto">
            <h3 class="lead"> Well done! You signed up successfully!</h3>
        </nav>
    </div>
</nav>
<div class="center-content spacer">
    <h3> Go to Login page </h3>
    <div class="btn-wrapper text-center mt-3">
    <a href="/login" class="btn btn-primary btn-lg" role="button"> Sign In </a>
    </div>
</div>
<div><img src="/img/undraw_check_boxes_m3d0%20(2).png" class="img-fluid img-center" alt="success-registration"/>
</div>


</body>
</html>
