<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 11.05.2020
  Time: 14:14
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
            <strong> ${company.name} Details </strong>
        </div>
    </nav>
    <div class="container">
        <div class="card-deck mt-5">
            <div class="card bg-light border-secondary">
                <h3 class="card-header bg-primary text-center text-white text-uppercase">${company.name}</h3>
                <div class="card-body">
                    <img class="card-img-top img-scale img-fluid" src="/img/floriane-vita-FyD3OWBuXnY-unsplash.jpg"
                         alt="Card image cap">
                    <h5 class="card-title little-space"> Visit Website:
                        <c:choose>
                            <c:when test="${not empty company.website}">
                                <td><a href="${company.website}"> ${company.name} Website</a></td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                    </h5>
                    <h6 class="card-text little-space"><strong>Location:</strong> ${company.location} </h6>
                    <div class="card-text little-space"><strong>Description:</strong> ${company.description} </div>
                    <h5 class="text-center"> Job Offers:</h5>
                    <div class="card-text">
                        <table class="table css-serial">
                            <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th scope="col"> Job Title</th>
                                <th scope="col"> Link</th>
                                <th scope="col"> Posted on</th>
                                <th scope="col"> Status</th>
                                <th scope="col"> How Attractive</th>
                                <th scope="col"> Applied On</th>
                                <th scope="col"> Actions</th>
                            </tr>
                            </thead>
                            <c:forEach items="${company.jobOffers}" var="offer">
                            <tbody>
                            <tr>
                                <td></td>
                                <td>${offer.title}</td>
                                <c:choose>
                                    <c:when test="${not empty offer.url}">
                                        <td><a href="${offer.url}">See Offer</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>n/d</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${offer.jobSearchWebsite}</td>
                                <td>${offer.status}</td>
                                <td>${offer.howAttractive}</td>
                                <td>${offer.appliedOn}</td>
                                <td><a href="/user/offers/${offer.id}">See Details</a></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="card-footer">
                    <a href="/user/companies/update/${company.id}" class="btn btn-primary"> Edit Company Info </a>
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