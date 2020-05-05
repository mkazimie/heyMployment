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
<%@include file="main-header.jsp" %>
<body class="bg-img-2">
<sec:authorize access="hasRole('ADMIN')">
    <h1 class="bd-title ml-5"> Admin Panel</h1>
    <div class="row">
        <div class="col-xl-3 col-md-4">
            <div class="card ml-5 admin-card">
                <img class="card-img-top img-scale" src="/img/undraw_personal_info_0okl.png" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"> Add New User</h5>
                    <p class="card-text bg-light"> Create a new simple user or admin </p>
                    <a href="/admin/users/add" class="btn btn-primary"> Let's do it ! </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-4">
            <div class="card ml-5 admin-card">
                <img class="card-img-top img-scale" src="/img/undraw_meet_the_team_e5b7.png" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"> View All Users </h5>
                    <p class="card-text bg-light"> View and manage your users</p>
                    <a href="/admin/users/all" class="btn btn-primary"> Let's do it ! </a>
                </div>
            </div>
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
