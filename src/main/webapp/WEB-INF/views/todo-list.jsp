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
        <h1 class="bd-title"> My TO-DO List</h1>
        <h2><a href="/user/todos/add" class="btn btn-primary"> + </a>
        </h2>

        <table class="table css-serial">
            <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th scope="col"> Name </th>
                <th scope="col"> Description </th>
                <th scope="col"> Related Job Offer </th>
                <th scope="col"> Related Course </th>
                <th scope="col"> Deadline </th>
                <th scope="col"> Done? </th>
                <th scope="col"> Actions </th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${todos}" var="todo">
                <tr>
                    <td></td>
                    <td>${todo.name}</td>
                    <td>${todo.description}</td>
                    <c:choose>
                        <c:when test="${not empty todo.jobOffer}">
                            <td><a href="/user/offers/${todo.jobOffer.id}">${todo.jobOffer.title}</a></td>
                        </c:when>
                        <c:otherwise>
                            <td>n/d</td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty todo.course}">
                            <td><a href="/user/offers/${todo.course.id}">${todo.course.name}</a></td>
                        </c:when>
                        <c:otherwise>
                            <td>n/d</td>
                        </c:otherwise>
                    </c:choose>
                    <td> ${todo.deadline}</td>
                    <td><a href="/user/todos/confirm-delete/${todo.id}"><i class="far fa-check-circle"></i>
                    </a></td>
                    <td><a href="/user/todos/update/${todo.id}"> Edit </a> |
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