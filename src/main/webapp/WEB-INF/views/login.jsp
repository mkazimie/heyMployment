<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 22.04.2020
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login Form</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-header bg-dark display-5 text-white text-center"> Sign Up Form</div>
        <div class="card-body">
            <form method="post">
            <div class="form-group row">
                <label class="col-md-4 col-form-label text-md-right"> Username: </label>
                <div class="col-md-6">
                    <input type="text" name="username" class="form-control" placeholder="Username"/></div>
            </div>
            <div class="form-group row">
                <label class="col-md-4 col-form-label text-md-right"> Password: </label>
                <div class="col-md-6">
                    <input type="password" name="password" class="form-control" placeholder="Password"/></div>
            </div>
            <div class="col-md-6 offset-md-4">
                <input type="submit" class="btn btn-block btn-primary" value="Sign In">
            </div>
            <div class="col-md-6 offset-md-4">
                <div class="text-center spacer"> New User?</div>
                <a href="/register" class="btn btn-block btn-link" role="button">Create an
                    account </a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                    crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
                    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                    crossorigin="anonymous"></script>
</body>
</html>
