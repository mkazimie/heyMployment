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
<body class="bg-light">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="/user/offers/"> Job Offers </a></li>
            <li class="breadcrumb-item active" aria-current="page"> ${jobOffer.title} Details</li>
        </ol>
    </nav>

    <div class="container">
        <div class="card-deck mr-30 ml-30 mt-5 mb-5">
            <div class="card border-secondary">
                <h3 class="card-header bg-info text-center text-white text-uppercase">${jobOffer.title}</h3>
                <div class="card-body">


                    <div class="ml-5 mr-5">
                        <div class="row justify-content-center">
                            <div class="row-auto">

                                <table class="table table-responsive table-borderless">
                                    <tbody class="table-content text-justify">
                                    <tr>
                                        <th scope="row"> Status</th>
                                        <td>${jobOffer.status}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Posting URL</th>
                                        <c:choose>
                                            <c:when test="${not empty jobOffer.url}">
                                                <td><a href="${jobOffer.url}"> ${jobOffer.title}
                                                    Posting </a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><a href="/user/offers/update/${jobOffer.id}"> Add </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Posted On</th>
                                        <c:choose>
                                            <c:when test="${not empty jobOffer.jobSearchWebsite}">
                                                <td>${jobOffer.jobSearchWebsite}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><a href="/user/offers/update/${jobOffer.id}"> Add </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Company</th>
                                        <td><a href="/user/companies/${jobOffer.company.id}">
                                                ${jobOffer.company.name}</a></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Location</th>
                                        <td class="text-justify">${jobOffer.location}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Description</th>
                                        <c:choose>
                                            <c:when test="${not empty jobOffer.description}">
                                                <td class="textarea-style">${jobOffer.description}></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><a href="/user/offers/update/${jobOffer.id}"> Add </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Attractive?</th>
                                        <td>${jobOffer.howAttractive}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Applied On</th>
                                        <c:choose>
                                            <c:when test="${not empty jobOffer.appliedOn}">
                                                <td>${jobOffer.formatAppliedOn}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><a href="/user/offers/update/${jobOffer.id}"> Add </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Notes</th>
                                        <c:choose>
                                            <c:when test="${not empty jobOffer.notes}">
                                                <td class="textarea-style">${jobOffer.notes}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><a href="/user/offers/update/${jobOffer.id}"> Add </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Added</th>
                                        <td>${jobOffer.formatAdded}</td>
                                    </tr>
                                    <c:if test="${not empty jobOffer.updated}">
                                        <tr>
                                            <th scope="row"> Updated</th>
                                            <td>${jobOffer.formatUpdated}</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="card-text mr-5 ml-5">
                        <div class="row justify-content-center">
                            <h5><a href="/user/todos/"> <strong> To-Do List </strong> </a> &nbsp;
                                <a href="/user/todos/add/job/${jobOffer.id}"
                                   class="btn btn-primary btn-sm align-middle"> +
                                </a></h5>
                        </div>


                        <table class="table table-striped css-serial mb-5">
                            <thead class="table-active">
                            <tr class="text-center">
                                <th>#</th>
                                <th scope="col"> Name</th>
                                <th scope="col"> Description</th>
                                <th scope="col"> Deadline</th>
                                <th scope="col"> Done?</th>
                                <th scope="col"> Actions</th>
                            </tr>
                            </thead>
                            <c:forEach items="${jobOffer.todos}" var="todo">
                            <tbody>
                            <tr class="text-center">
                                <td></td>
                                <td>${todo.name}</td>
                                <td>${todo.description}</td>
                                <c:choose>
                                    <c:when test="${todo.deadline lt now}">
                                        <td class="align-middle"><i
                                                class="fas fa-hourglass-end text-danger"></i> &nbsp;
                                                ${todo.formattedDeadline}
                                        </td>
                                    </c:when>
                                    <c:when test="${todo.hoursLeft ge -3 and todo.hoursLeft le 0}">
                                        <td class="align-middle"><i class="fas fa-hourglass-half
                        text-warning"></i> &nbsp; ${todo.formattedDeadline}

                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="align-middle"><i class="fas fa-hourglass-start
                        text-success"></i> &nbsp; ${todo.formattedDeadline}</td>
                                    </c:otherwise>
                                </c:choose>
                                <td><a href="/user/todos/confirm-delete/${todo.id}"><i
                                        class="far fa-check-circle"></i>
                                </a></td>
                                <td><a href="/user/todos/update/${todo.id}"> Edit </a> |
                                    <a href="/user/todos/confirm-delete/${todo.id}"> Delete </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/offers/update/${jobOffer.id}" class="btn btn-primary"> Edit </a>
                        <a href="/user/offers/confirm-delete/${jobOffer.id}" class="btn btn-dark"> Delete </a>
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