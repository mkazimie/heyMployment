<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 08.05.2020
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title> Todos </title>
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
            <li class="breadcrumb-item active" aria-current="page"> To Do List</li>
        </ol>
    </nav>


    <div class="container mt-5 mx-auto ml-4 mr-4">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h1 class="bd-title"> My To Do List <a href="/user/todos/add" class="btn btn-primary"> +
                </a></h1>
            </div>
        </div>

        <table class="table table-striped css-serial">
            <thead class="thead-dark">
            <tr class="text-center">
                <th>#</th>
                <th scope="col"> Name</th>
                <th scope="col"> Description</th>
                <th scope="col"> Related Job Offer</th>
                <th scope="col"> Related Course</th>
                <th scope="col"> Deadline</th>
                <th scope="col"> Done?</th>
                <th scope="col"> Actions</th>
            </tr>
            </thead>


            <tbody>
            <c:forEach items="${todos}" var="todo">
                <tr class="text-center">
                    <td class="align-middle"></td>
                    <td class="align-middle">${todo.name}</td>
                    <td class="align-middle">${todo.description}</td>
                    <c:choose>
                        <c:when test="${not empty todo.jobOffer}">
                            <td class="align-middle"><a
                                    href="/user/offers/details/${todo.jobOffer.id}">${todo.jobOffer.title}</a></td>
                        </c:when>
                        <c:otherwise>
                            <td class="align-middle">n/d</td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty todo.course}">
                            <td
                                    class="align-middle"><a
                                    href="/user/courses/details/${todo.course.id}">${todo.course.name}</a></td>
                        </c:when>
                        <c:otherwise>
                            <td class="align-middle">n/d</td>
                        </c:otherwise>
                    </c:choose>

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
                    <td class="align-middle"><a href="/user/todos/confirm-delete/${todo.id}"><i
                            class="far fa-check-circle"></i>
                    </a></td>
                    <td class="align-middle"><a href="/user/todos/update/${todo.id}"> Edit </a> |
                        <a href="/user/todos/confirm-delete/${todo.id}"> Delete </a>
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