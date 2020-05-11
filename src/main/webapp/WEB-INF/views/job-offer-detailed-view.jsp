<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 11.05.2020
  Time: 15:28
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
    <title>Job Offer Details</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-dark">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav class="navbar bg-dark static-top">
        <div class="navbar-brand main-logo ml-4 text-white">
            <strong> ${jobOffer.title} Details </strong>
        </div>
    </nav>
    <div class="container">
        <div class="card-deck mt-5">
            <div class="card bg-light border-secondary">
                <h3 class="card-header bg-primary text-center text-white text-uppercase">${jobOffer.title}</h3>
                <div class="card-body">
                        <img class="card-img-top img-fluid img-scale"
                             src="/img/undraw_online_information_4ui6%20(1).png"
                             alt="Card image cap">
                    <h5 class="card-text little-space"><strong>Status:</strong> ${jobOffer.status} </h5>
                    <h5 class="card-text little-space"> Job Offer Posting:
                        <c:choose>
                            <c:when test="${not empty jobOffer.url}">
                                <td><a href="${jobOffer.url}"> ${jobOffer.title} Posting</a></td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                    </h5>
                    <div class="card-text little-space"><strong>Posted On:</strong> ${jobOffer.jobSearchWebsite} </div>
                    <div class="card-text little-space"><strong>Company:</strong>
                        <a href="#"> ${jobOffer.company.name} </a></div>
                    <div class="card-text little-space"><strong>Location:</strong> ${jobOffer.location} </div>
                    <div class="card-text little-space"><strong>Description:</strong> ${jobOffer.description} </div>
                    <div class="card-text little-space"><strong>How Attractive:</strong> ${jobOffer.howAttractive}
                    </div>
                    <div class="card-text little-space"><strong>Applied On:</strong> ${jobOffer.appliedOn} </div>
                    <div class="card-text little-space"><strong>Notes:</strong> ${jobOffer.notes} </div>

                    <h5 class="text-center"> Related To-Dos:</h5>
                    <div class="card-text">
                        <table class="table css-serial">
                            <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th scope="col"> Name</th>
                                <th scope="col"> Description</th>
                                <th scope="col"> Deadline</th>
                                <th scope="col"> Go To To-Dos</th>
                            </tr>
                            </thead>
                            <c:forEach items="${jobOffer.todos}" var="todo">
                            <tbody>
                            <tr>
                                <td></td>
                                <td>${todo.name}</td>
                                <td>${todo.description}</td>
                                <td>${todo.deadline}</td>
                                <td><a href="/user/todos/all">My To-Do List</a></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="card-footer">
                    <a href="/user/offers/update/${jobOffer.id}" class="btn btn-primary"> Edit Job Offer Info </a>
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