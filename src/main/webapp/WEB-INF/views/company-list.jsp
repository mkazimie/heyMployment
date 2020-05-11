<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 08.05.2020
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <title>Home Page</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-dark">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav class="navbar bg-dark static-top">
        <div class="navbar-brand main-logo ml-4 text-white">
            <strong> Companies </strong>
        </div>
    </nav>
    <div class="container">
        <div class="card-deck mt-5">
            <c:forEach items="${companies}" var="company" varStatus="theCount">
            <c:if test="${theCount.index % 3 == 0}">
        </div>
        <div class="card-deck mt-5">
            </c:if>
            <div class="card border-secondary">
                <div class="card-body">
                    <img class="card-img-top img-scale img-fluid" src="/img/max-bender-3rNvnnO7avY-unsplash.jpg"
                         alt="Card image cap">
                    <h5 class="card-title"> Company Name: ${company.name} </h5>
                    <h6 class="card-text"> Location: ${company.location} </h6>
                </div>
                <div class="card-footer">
                    <a href="/user/companies/${company.id}" class="btn btn-primary"> Details </a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>


</sec:authorize>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
