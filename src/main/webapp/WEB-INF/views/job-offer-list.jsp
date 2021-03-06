<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 06.05.2020
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Job Offers </title>
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
            <li class="breadcrumb-item active" aria-current="page"> Job Offers</li>
        </ol>
    </nav>


    <div class="container">

        <div class="row">
            <div class="col-sm-10 col-12">
                <h1 class="bd-title"> My Job Offers <a href="/user/offers/add" class="btn btn-primary"> +
                </a> <a href="/user/offers/reports" class="btn btn-dark align-right text-right"> Reports </a></h1>
            </div>
        </div>

        <div class="btn-wrapper text-center mt-5">
            <button type="button" class="btn btn-dark">${allHowMany} ${specificHowMany}</button>
        </div>


        <ul class="nav nav-pills justify-content-center pt-2 pb-3 pb-md-2 text-uppercase">
            <li class="nav-item">
                <a href="/user/offers/" class="nav-link">All</a>
            </li>
            <li class="nav-item">
                <a href="/user/offers/${status[0]}" class="nav-link">${status[0]}</a>
            </li>
            <li class="nav-item">
                <a href="/user/offers/${status[1]}" class="nav-link">${status[1]}</a>
            </li>
            <li class="nav-item">
                <a href="/user/offers/${status[2]}" class="nav-link">${status[2]}</a>
            </li>
            <li class="nav-item">
                <a href="/user/offers/${status[3]}" class="nav-link">${status[3]}</a>
            </li>
            <li class="nav-item">
                <a href="/user/offers/${status[4]}" class="nav-link">${status[4]}</a>
            </li>
        </ul>

        <table class="table table-striped css-serial">
            <thead class="thead-dark">
            <tr class="text-center">
                <th>#</th>
                <th scope="col"> Job Title</th>
                <th scope="col"> Location </th>
                <th scope="col"> Company</th>
                <th scope="col"> Added  </th>
                <th scope="col"> Updated </th>
                <th scope="col"> + </th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${offers}" var="offer">
                <tr class="text-center">
                    <td class="align-middle"></td>
                    <td class="align-middle"><strong>${offer.title}</strong></td>
                    <td class="align-middle">${offer.location}</td>
                    <td class="align-middle"><a href="/user/companies/${offer.company.id}">${offer.company.name}</a></td>
                    <td>${offer.formatAdded}</td>
                    <td>${offer.formatUpdated}</td>
                    <td class="align-middle"><a href="/user/offers/details/${offer.id}" class="btn btn-primary"> Details</a></td>
                </tr>
            </c:forEach>
            </tbody>


            <tbody>
            <c:forEach items="${allByStatus}" var="byStatus">
                <tr class="text-center">
                    <td class="align-middle"></td>
                    <td class="align-middle"><strong>${byStatus.title}</strong></td>
                    <td class="align-middle">${byStatus.location}</td>
                    <td class="align-middle"><a href="/user/companies/${byStatus.company.id}">${byStatus.company.name}</a></td>
                    <td>${byStatus.formatAdded}</td>
                    <td>${byStatus.formatUpdated}</td>
                    <td class="align-middle"><a href="/user/offers/details/${byStatus.id}" class="btn btn-primary">Details </a></td>
                </tr>
            </c:forEach>
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
<script src="<c:url value='/js/main.js'/>" type="text/javascript"></script>

</body>
</html>
