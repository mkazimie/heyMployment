<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 03.05.2020
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Logout</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body class="bg-light">
<%@include file="main-header.jsp"%>
<sec:authorize access="isAuthenticated()">
    <div class="container">
        <div class="card mx-auto mt-5">
            <form action="<c:url value="/logout"/>" method="post">
                <div class="card-header bg-dark form-header text-white text-center">
                    Sign Out
                </div>
                <div class="card-body">
                    <p class="card-text text-center"> Are you sure you want to sign out? </p>
                    <div class="col text-center">
                        <input type="submit" class="btn btn-primary" value="Sign Out">
                    </div>
                    <div class="text-center mt-3">
                        <a href="/user/home" class="btn btn-block btn-link" role="button"> Discard </a>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
            </form>
        </div>
    </div>
</sec:authorize>
</body>
</html>


