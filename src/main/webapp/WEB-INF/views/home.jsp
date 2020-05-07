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
<body class="bg-img">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav class="navbar bg-dark static-top">
        <div class="navbar-brand main-logo ml-4 text-white">
            <strong> User Panel </strong>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-lg-4">
                <div class="card user-card">
                    <img class="card-img-top img-scale" src="/img/undraw_placeholders_rklh.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> New Job Offer </h5>
                        <p class="card-text bg-light"> Add a job posting you liked or already applied for, keep track
                            of it and make sure to prepare for your interview!
                        </p>
                        <a href="/user/offers/add" class="btn btn-primary"> Let's do it ! </a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4">
                <div class="card user-card">
                    <img class="card-img-top img-scale" src="/img/undraw_new_entries_nh3h.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> View Your Postings </h5>
                        <p class="card-text bg-light"> View and Update your postings </p>
                        <a href="/user/offers/all" class="btn btn-primary"> Let's do it! </a>
                    </div>
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
