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
        <h2><a href="/user/offers/add" class="btn btn-primary"> + </a>
        </h2>

        <nav class="bd-subnavbar pt-2 pb-3 pb-md-2 bg-light text-uppercase nav-fill">
            <div class="container d-flex align-items-md-center py-2">
                <nav class="nav mx-auto">
                    <a href="/user/offers/all" class="btn btn-link">All</a>
                    <a href="/user/offers/all/${status[0]}" class="btn btn-link">${status[0]}</a>
                    <a href="/user/offers/all/${status[1]}" class="btn btn-link">${status[1]}</a>
                    <a href="/user/offers/all/${status[2]}" class="btn btn-link">${status[2]}</a>
                    <a href="/user/offers/all/${status[3]}" class="btn btn-link">${status[3]}</a>
                    <a href="/user/offers/all/${status[4]}" class="btn btn-link">${status[4]}</a>
                </nav>
            </div>
        </nav>

        <table class="table css-serial">
            <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th scope="col"> Job Title</th>
                <th scope="col"> Description</th>
                <th scope="col"> Link</th>
                <th scope="col"> Job Search Website</th>
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
                    <td></td>
                    <td>${offer.title}</td>
                    <td>${offer.description}</td>
                    <c:choose>
                        <c:when test="${not empty offer.url}">
                            <td><a href="${offer.url}">See Offer</a></td>
                        </c:when>
                        <c:otherwise>
                            <td>n/d</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${offer.jobSearchWebsite}</td>
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
            </c:forEach>
            </tbody>

            <tbody>
            <c:forEach items="${allByStatus}" var="byStatus">
                <tr>
                    <td></td>
                    <td>${byStatus.title}</td>
                    <td>${byStatus.description}</td>
                    <c:choose>
                        <c:when test="${not empty byStatus.url}">
                            <td><a href="${byStatus.url}">See Offer</a></td>
                        </c:when>
                        <c:otherwise>
                            <td>n/d</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${byStatus.jobSearchWebsite}</td>
                    <td>${byStatus.location}</td>
                    <td>${byStatus.company.name}</td>
                    <td>${byStatus.salary}</td>
                    <td>${byStatus.status}</td>
                    <td>${byStatus.howAttractive}</td>
                    <td>${byStatus.appliedOn}</td>
                    <td>${byStatus.notes}</td>
                    <td><a href="/user/offers/update/${byStatus.id}"> Edit </a> |
                        <a href="/user/offers/confirm-delete/${byStatus.id}"> Delete </a>
                    </td>
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

</body>
</html>
