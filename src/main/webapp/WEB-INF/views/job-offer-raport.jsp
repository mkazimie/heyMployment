<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 20.05.2020
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Job Offer List</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="/user/offers"> Job Offers </a></li>
            <li class="breadcrumb-item active" aria-current="page"> Raport</li>
        </ol>
    </nav>

    <div class="container mt-5 mx-auto ml-4 mr-4">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h1 class="bd-title"> Monthly Raport for ${month} </h1>
            </div>
        </div>
        <h3 class="text-center"> Job Offers </h3>
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr class="text-center">
                <th scope="col"> Status</th>
                <th scope="col"> Number of Offers</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-center">
                <td>Wishlist</td>
                <td>${wishlistByMonth} </td>
            </tr>
            <tr class="text-center">
                <td>Applied</td>
                <td>${appliedByMonth}</td>
            </tr>
            <tr class="text-center">
                <td>Interview</td>
                <td>${interviewByMonth}</td>
            </tr>
            <tr class="text-center">
                <td>Rejected</td>
                <td>${rejectedByMonth}</td>
            </tr>
            <tr class="text-center">
                <td>Accepted</td>
                <td>${acceptedByMonth}</td>
            </tr>
            <tr class="text-center table-info">
                <th scope="col"> All</th>
                <th scope="col">${offersThisMonth} </th>
            </tr>
            </tbody>
        </table>
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
