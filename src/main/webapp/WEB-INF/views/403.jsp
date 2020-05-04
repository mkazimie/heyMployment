<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 03.05.2020
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Access Denied</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

</head>
<%@include file="header-landing.jsp" %>
<body>
<div class="col-md-6 offset-md-4 alert alert-danger mt-5" role="alert">
    <strong>Ups!</strong> Access to this content has been denied.
</div>
<div>
    <img src="img/undraw_cancel_u1it%20(3).png"/>
</div>
</body>
</html>
