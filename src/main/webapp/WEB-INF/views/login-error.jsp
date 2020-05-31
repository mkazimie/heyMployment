<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 04.05.2020
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title> Login Error </title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@include file="header-landing.jsp" %>
<div class="container mx-auto">
    <h5 class="card-header bg-danger text-center"> <strong> Login Attempt Failed </strong> </h5>
    <div class="card card-body center-content">
        <h5 class="card-text mt-2 mb-4 text-danger text-center"> Ups! Something went wrong... </h5>
        <p> Try Again!
            <a href="/login" class="btn btn-block btn-link btn-lg" role="button"> Sign In </a>
        </p>
        <p> New User?
            <a href="/register" class="btn btn-block btn-link btn-lg" role="button"> Create an Account </a>
        </p>
    </div>
</div>
</body>
</html>

