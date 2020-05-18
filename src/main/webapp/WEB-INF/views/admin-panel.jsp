<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 03.05.2020
  Time: 11:44
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
<sec:authorize access="hasRole('ADMIN')">
    <nav class="navbar bg-dark static-top">
        <div class="navbar-brand main-logo ml-4 text-white">
            <strong> Admin Panel </strong>
        </div>
    </nav>
    <div class="container">
        <div class="card-deck mt-5">
            <div class="card border-secondary">
                                    <img class="card-img-top img-scale img-fluid" src="/img/reinhart-julian-WCWgY3L_xVw-unsplash.jpg"
                                         alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>Add New User</strong> </h5>
                    <p class="card-text bg-light text-center"> Create a new simple user or admin </p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/admin/users/add" class="btn btn-primary"> Go </a>
                    </div>
                </div>
            </div>
            <div class="card border-secondary">
                                <img class="card-img-top img-scale img-fluid" src="/img/siyan-ren-jN_VbffJHlI-unsplash.jpg"
                                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>View All Users</strong> </h5>
                    <p class="card-text bg-light text-center"> View and manage your users</p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/admin/users/all" class="btn btn-primary"> Go </a>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%--        </div>--%>
    <%--    </div>--%>


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
