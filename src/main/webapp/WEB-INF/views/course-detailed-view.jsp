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
    <title>Course Details</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav class="navbar bg-dark static-top">
        <div class="navbar-brand main-logo ml-4 text-white">
            <strong> ${course.name} Details </strong>
        </div>
    </nav>

    <div class="container ">
        <div class="card-deck mt-5">
            <div class="card border-secondary">
                <h3 class="card-header bg-primary text-center text-white text-uppercase">${course.name}</h3>
                <div class="card-body">

                    <div class=" card-text ml-5 mr-5 mt-5">
                        <div class="row justify-content-center">
                            <div class="row-auto">

                                <table class="table table-responsive">
                                    <tbody class="table-content text-justify">
                                    <tr>
                                        <th scope="row"> Status</th>
                                        <td>${course.status}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Description</th>
                                        <td>${course.description}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Course Website</th>
                                        <c:choose>
                                            <c:when test="${not empty course.url}">
                                                <td><a href="${course.url}"> ${course.name} Website </a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Organized By</th>
                                        <td>${course.organizedBy}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Ending Date</th>
                                        <td>${course.finishDate}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" rowspan="4"> Topics</th>
                                    </tr>
                                    <c:forEach items="${course.topics}" var="topic">
                                        <tr>
                                            <td class="not-first-cell"> ${topic.name}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <div class="card-text mr-5 ml-5">
                        <h5 class="text-center mt-5"><strong> To-Do List</strong></h5>
                        <div class="btn-wrapper text-center mb-3">
                            <a href="/user/todos/add/course/${course.id}" class="btn btn-primary"> + </a>
                        </div>
                        <table class="table css-serial">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th>#</th>
                                <th scope="col"> Name</th>
                                <th scope="col"> Description</th>
                                <th scope="col"> Deadline</th>
                                <th scope="col"> Done?</th>
                                <th scope="col"> Actions</th>
                            </tr>
                            </thead>
                            <c:forEach items="${course.todos}" var="todo">
                            <tbody>
                            <tr class="text-center">
                                <td></td>
                                <td>${todo.name}</td>
                                <td>${todo.description}</td>
                                <td>${todo.deadline}</td>
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
                </div>
                <div class="card-footer text-center">
                    <a href="/user/courses/update/${course.id}" class="btn btn-primary"> Edit Course </a>
                    <a href="/user/courses/confirm-delete/${course.id}" class="btn btn-dark"> Delete
                        Course </a>
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