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
    <div class="container mt-5 mx-auto ml-4 mr-4">
        <h1 class="bd-title"> My Job Offers</h1>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col"> Job Title</th>
                <th scope="col"> Description</th>
                <th scope="col"> Link</th>
                <th scope="col"> Location</th>
                <th scope="col"> Company</th>
                <th scope="col"> Salary</th>
                <th scope="col"> Status</th>
                <th scope="col"> How Attractive</th>
                <th scope="col"> Date of Applying</th>
                <th scope="col"> Notes</th>
                <th scope="col"> Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${offers}" var="offer">
            <tr>
                <td>${offer.title}</td>
                <td>${offer.description}</td>
                <td>${offer.url}</td>
                <td>${offer.location}</td>
                <td>${offer.company.name}</td>
                <td>${offer.salary}</td>
                <td>${offer.status}</td>
                <td>${offer.howAttractive}</td>
                <td>${offer.appliedOn}</td>
                <td>${offer.notes}</td>
                <td><a href="/user/offers/update/${offer.id}"> Edit </a> |
                    <a href="/user/offers/confirm-delete/${offer.id}"> Delete </a>
                </td>
            </tr>
            </tbody>
            </c:forEach>
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
